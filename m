Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33EE1E3DBB
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 11:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgE0JlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 05:41:10 -0400
Received: from gofer.mess.org ([88.97.38.141]:39633 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727909AbgE0JlK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 05:41:10 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BEF29C63EB; Wed, 27 May 2020 10:41:07 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 2/3] USB: cdc-acm: blacklist IR Droid / IR Toy device
Date:   Wed, 27 May 2020 10:41:06 +0100
Message-Id: <20200527094107.11936-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527094107.11936-1-sean@mess.org>
References: <20200527094107.11936-1-sean@mess.org>
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

