Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6305C375407
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhEFMp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:45:58 -0400
Received: from gofer.mess.org ([88.97.38.141]:53251 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhEFMp4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:45:56 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 31259C652A; Thu,  6 May 2021 13:44:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620305096; bh=+aEvwnnamLpbPMC0Zf6oc8EHS1sTKnBdL/3mFyrQNpU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gviTsOYKYII2NrAkrXhIdfVorcYxRDQB+med3wGe0gLTgAcQgCjwHoMOLPUhJGrcj
         jaa81bW6ocml+3xlsutUG8kc5LnSvh+/PWSLASF73dm5+qq7Gbxc9ATNMkKW+Ppjqp
         ks2bROTSZ15PvGaCkEarOgN9YSoYi1f7WKPTMuZkH4KlrsClO3kzaHisqffyBJBdkJ
         UquKuHaIAf+bMkKUhAQegWkXyAm99BHuvTwkZzFrE4LJIjYbW3k5cOj5hyf4H0So67
         y7J1uUPRYaFmpZ/sdMlb/D9WjFPCCEjWPH25DIqUB9XSXsnkDaQ4YVXvnUHUAus0/i
         4Br9tL5hM+3DQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v3 3/3] USB: serial: blacklist USB-UIRT when driver is selected
Date:   Thu,  6 May 2021 13:44:55 +0100
Message-Id: <37339f4102666345168a738d0ffd80d8133a6a03.1620304986.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620304986.git.sean@mess.org>
References: <cover.1620304986.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The USB-UIRT device has its own driver, so blacklist the fdti driver
from using it if the driver has been enabled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/usb/serial/ftdi_sio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 542073d2f0dd..2320bda57796 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -95,7 +95,9 @@ static int   ftdi_jtag_probe(struct usb_serial *serial);
 static int   ftdi_NDI_device_setup(struct usb_serial *serial);
 static int   ftdi_stmclite_probe(struct usb_serial *serial);
 static int   ftdi_8u2232c_probe(struct usb_serial *serial);
+#if !IS_ENABLED(CONFIG_IR_UIRT)
 static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
+#endif
 static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
@@ -106,9 +108,11 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
 	.probe	= ftdi_NDI_device_setup,
 };
 
+#if !IS_ENABLED(CONFIG_IR_UIRT)
 static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
 	.port_probe = ftdi_USB_UIRT_setup,
 };
+#endif
 
 static const struct ftdi_sio_quirk ftdi_HE_TIRA1_quirk = {
 	.port_probe = ftdi_HE_TIRA1_setup,
@@ -568,8 +572,10 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_HE_TIRA1_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_HE_TIRA1_quirk },
+#if !IS_ENABLED(CONFIG_IR_UIRT)
 	{ USB_DEVICE(FTDI_VID, FTDI_USB_UIRT_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_USB_UIRT_quirk },
+#endif
 	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_1) },
 	{ USB_DEVICE(FTDI_VID, PROTEGO_R2X0) },
 	{ USB_DEVICE(FTDI_VID, PROTEGO_SPECIAL_3) },
@@ -2292,6 +2298,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 	return 0;
 }
 
+#if !IS_ENABLED(CONFIG_IR_UIRT)
 /* Setup for the USB-UIRT device, which requires hardwired
  * baudrate (38400 gets mapped to 312500) */
 /* Called from usbserial:serial_probe */
@@ -2301,6 +2308,7 @@ static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
 	priv->custom_divisor = 77;
 	priv->force_baud = 38400;
 }
+#endif
 
 /* Setup for the HE-TIRA1 device, which requires hardwired
  * baudrate (38400 gets mapped to 100000) and RTS-CTS enabled.  */
-- 
2.31.1

