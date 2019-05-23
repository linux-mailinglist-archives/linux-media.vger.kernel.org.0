Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA6A27DD2
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 15:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbfEWNPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 09:15:20 -0400
Received: from gofer.mess.org ([88.97.38.141]:35191 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfEWNPU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 09:15:20 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A142460032; Thu, 23 May 2019 14:15:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: em28xx: use common code for decoding nec scancodes
Date:   Thu, 23 May 2019 14:15:17 +0100
Message-Id: <20190523131518.4079-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190523131518.4079-1-sean@mess.org>
References: <20190523131518.4079-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested on WinTV-HVR-930C.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/em28xx/em28xx-input.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index e757a71d247f..6e43da5f6c5a 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -276,21 +276,8 @@ static int em2874_polling_getkey(struct em28xx_IR *ir,
 		break;
 
 	case RC_PROTO_BIT_NEC:
-		poll_result->scancode = msg[1] << 8 | msg[2];
-		if ((msg[3] ^ msg[4]) != 0xff) {	/* 32 bits NEC */
-			poll_result->protocol = RC_PROTO_NEC32;
-			poll_result->scancode = RC_SCANCODE_NEC32((msg[1] << 24) |
-								  (msg[2] << 16) |
-								  (msg[3] << 8)  |
-								  (msg[4]));
-		} else if ((msg[1] ^ msg[2]) != 0xff) {	/* 24 bits NEC */
-			poll_result->protocol = RC_PROTO_NECX;
-			poll_result->scancode = RC_SCANCODE_NECX(msg[1] << 8 |
-								 msg[2], msg[3]);
-		} else {				/* Normal NEC */
-			poll_result->protocol = RC_PROTO_NEC;
-			poll_result->scancode = RC_SCANCODE_NEC(msg[1], msg[3]);
-		}
+		poll_result->scancode = ir_nec_bytes_to_scancode(msg[1], msg[2], msg[3], msg[4],
+								 &poll_result->protocol);
 		break;
 
 	case RC_PROTO_BIT_RC6_0:
-- 
2.20.1

