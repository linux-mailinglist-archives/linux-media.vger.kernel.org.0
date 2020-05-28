Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5BD1E5D7A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 12:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388015AbgE1KzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 06:55:11 -0400
Received: from gofer.mess.org ([88.97.38.141]:35469 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387992AbgE1KzL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 06:55:11 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B8B65C638E; Thu, 28 May 2020 11:55:08 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v4 2/3] USB: cdc-acm: blacklist IR Droid / IR Toy device
Date:   Thu, 28 May 2020 11:55:07 +0100
Message-Id: <20200528105508.5183-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528105508.5183-1-sean@mess.org>
References: <20200528105508.5183-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IR Droid / IR Toy device used custom protocol over serial
line, so it is presenting itself as CDC ACM device.

Now that we have proper in-kernel driver for it we need to black-list the
device in cdc-acm driver.

http://dangerousprototypes.com/docs/USB_Infrared_Toy
https://www.irdroid.com/irdroid-usb-ir-transceiver/

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/usb/class/cdc-acm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 84d6f7df09a4..1369e3be5019 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1864,6 +1864,12 @@ static const struct usb_device_id acm_ids[] = {
 	},
 #endif
 
+#if IS_ENABLED(CONFIG_IR_TOY)
+	{ USB_DEVICE(0x04d8, 0xfd08),
+	.driver_info = IGNORE_DEVICE,
+	},
+#endif
+
 	/*Samsung phone in firmware update mode */
 	{ USB_DEVICE(0x04e8, 0x685d),
 	.driver_info = IGNORE_DEVICE,
-- 
2.26.2

