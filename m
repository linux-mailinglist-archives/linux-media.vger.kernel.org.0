Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1786F27DD4
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 15:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730081AbfEWNPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 09:15:20 -0400
Received: from gofer.mess.org ([88.97.38.141]:54523 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbfEWNPU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 09:15:20 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8571960DD0; Thu, 23 May 2019 14:15:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: em28xx: give RC device proper name
Date:   Thu, 23 May 2019 14:15:16 +0100
Message-Id: <20190523131518.4079-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Give the RC device the name of the board rather than "1-2:1.0 IR".

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/em28xx/em28xx-input.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index d85ea1af6aa1..e757a71d247f 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -58,7 +58,6 @@ struct em28xx_ir_poll_result {
 struct em28xx_IR {
 	struct em28xx *dev;
 	struct rc_dev *rc;
-	char name[32];
 	char phys[32];
 
 	/* poll decoder */
@@ -832,14 +831,10 @@ static int em28xx_ir_init(struct em28xx *dev)
 	/* This is how often we ask the chip for IR information */
 	ir->polling = 100; /* ms */
 
-	/* init input device */
-	snprintf(ir->name, sizeof(ir->name), "%s IR",
-		 dev_name(&dev->intf->dev));
-
 	usb_make_path(udev, ir->phys, sizeof(ir->phys));
 	strlcat(ir->phys, "/input0", sizeof(ir->phys));
 
-	rc->device_name = ir->name;
+	rc->device_name = em28xx_boards[dev->model].name;
 	rc->input_phys = ir->phys;
 	rc->input_id.bustype = BUS_USB;
 	rc->input_id.version = 1;
-- 
2.20.1

