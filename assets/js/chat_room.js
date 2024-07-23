import socket from "./socket";

let chatRoomTitle = document.getElementById("chat-room-title");

if (chatRoomTitle) {
  let chatRoomName = chatRoomTitle.dataset.chatRoomName;
  let channel = socket.channel(`chat_room:${chatRoomName}`, {});

  let messageForm = document.getElementById("new-message-form");
  let messageInput = document.getElementById("message");
  let messagesContainer = document.querySelector("[data-role='messages']");

  const addMessage = (author, body) => {
    let messageItem = document.createElement("li");
    messageItem.dataset.role = "message";
    messageItem.innerText = `${author}: ${body}`;
    messagesContainer.appendChild(messageItem);
  };

  messageForm.addEventListener("submit", (event) => {
    event.preventDefault();
    channel.push("new_message", { body: messageInput.value });
    event.target.reset();
  });

  channel.on("new_message", (payload) => {
    addMessage(payload.author, payload.body);
  });

  channel.join().receive("ok", (resp) => {
    let messages = resp.messages;
    messages.map(({ author, body }) => {
      addMessage(author, body);
    });
  });
}
