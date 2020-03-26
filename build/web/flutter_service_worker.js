"use strict";
const CACHE_NAME = "flutter-app-cache";
const RESOURCES = {
  "/manifest.json": "f715baba44456a6aa04d804cdc1591fe",
  "/cover.png": "0e43bbfa80dec344fdd51482e151c7ff",
  "/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
  "/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
  "/main.dart.js": "6a633e27f8db580f6da6ddb707af3e9b",
  "/assets/AssetManifest.json": "2ea28769ebcb9e0add4a3c5f090dd8fe",
  "/assets/fonts/Poppins-Light.ttf": "3352653dedd571bbc490c8be132b38cd",
  "/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
  "/assets/fonts/Poppins-Black.ttf": "8971d1710cbf4c91bca1b460aec154d7",
  "/assets/fonts/Poppins-Bold.ttf": "7940efc40d8e3b477e16cc41b0287139",
  "/assets/fonts/Poppins-Regular.ttf": "731a28a413d642522667a2de8681ff35",
  "/assets/fonts/Poppins-Medium.ttf": "a4e11dda40531debd374e4c8b1dcc7f4",
  "/assets/FontManifest.json": "84d50c108b9a593e40f3ed2c7320da09",
  "/assets/LICENSE": "c00b64d797b465c51cb1542f91a870d9",
  "/assets/assets/recovered_cases.png": "cb13a4011f21d38818aafe7d5e0e2fc2",
  "/assets/assets/confirmed_cases.png": "0c59da3ca56365598edc23d15b24f433",
  "/assets/assets/deceased_cases.png": "7d3fde9df38b7072ce23891834ffc791",
  "/assets/assets/serious_cases.png": "029130882208bd18dce941fb545a019c",
  "/index.html": "ab22271148805dbf6c9df570cff28f2d"
};

self.addEventListener("activate", function(event) {
  event.waitUntil(
    caches
      .keys()
      .then(function(cacheName) {
        return caches.delete(cacheName);
      })
      .then(function(_) {
        return caches.open(CACHE_NAME);
      })
      .then(function(cache) {
        return cache.addAll(Object.keys(RESOURCES));
      })
  );
});

self.addEventListener("fetch", function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      if (response) {
        return response;
      }
      return fetch(event.request);
    })
  );
});
