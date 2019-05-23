Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9809E27DD3
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 15:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbfEWNPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 09:15:20 -0400
Received: from gofer.mess.org ([88.97.38.141]:45491 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729698AbfEWNPU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 09:15:20 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D021561105; Thu, 23 May 2019 14:15:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: em28xx: use usb_to_input_id() rather than handrolling it
Date:   Thu, 23 May 2019 14:15:18 +0100
Message-Id: <20190523131518.4079-3-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190523131518.4079-1-sean@mess.org>
References: <20190523131518.4079-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This also populates the version member correctly.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/em28xx/em28xx-input.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 6e43da5f6c5a..5aa15a7a49de 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/usb.h>
+#include <linux/usb/input.h>
 #include <linux/slab.h>
 #include <linux/bitrev.h>
 
@@ -603,10 +604,7 @@ static int em28xx_register_snapshot_button(struct em28xx *dev)
 	set_bit(EM28XX_SNAPSHOT_KEY, input_dev->keybit);
 	input_dev->keycodesize = 0;
 	input_dev->keycodemax = 0;
-	input_dev->id.bustype = BUS_USB;
-	input_dev->id.vendor = le16_to_cpu(udev->descriptor.idVendor);
-	input_dev->id.product = le16_to_cpu(udev->descriptor.idProduct);
-	input_dev->id.version = 1;
+	usb_to_input_id(udev, &input_dev->id);
 	input_dev->dev.parent = &dev->intf->dev;
 
 	err = input_register_device(input_dev);
@@ -823,10 +821,7 @@ static int em28xx_ir_init(struct em28xx *dev)
 
 	rc->device_name = em28xx_boards[dev->model].name;
 	rc->input_phys = ir->phys;
-	rc->input_id.bustype = BUS_USB;
-	rc->input_id.version = 1;
-	rc->input_id.vendor = le16_to_cpu(udev->descriptor.idVendor);
-	rc->input_id.product = le16_to_cpu(udev->descriptor.idProduct);
+	usb_to_input_id(udev, &rc->input_id);
 	rc->dev.parent = &dev->intf->dev;
 	rc->driver_name = MODULE_NAME;
 
-- 
2.20.1

