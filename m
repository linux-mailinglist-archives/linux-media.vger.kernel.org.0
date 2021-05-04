Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EF5372F41
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhEDRxp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 13:53:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:46979 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232126AbhEDRxn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 13:53:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 86E86C6505; Tue,  4 May 2021 18:52:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620150765; bh=+aEvwnnamLpbPMC0Zf6oc8EHS1sTKnBdL/3mFyrQNpU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T7yxJeF4ju/Gr1UU2h7GHA8/0tm4nETXth6itkGRuRPhwnesFEJFaQABCxuukALwa
         PS+Jb5J3RQ5HKAZ86JL0SeujgqukmOrbfg2vTJStVe9Nn9Xwvd2Uri5TusIRWA2ZsQ
         3k4F2petv9Q+Ckpp9re6uYhiQAGxsGiHY/J0qHQ9AVu5gpPniOJhufmSH+HCrhh9CW
         KqM6DdtHI9MC62UjQsdWaNZ0HIOHXLhleiEqQvUK7n/2QFK1m6I87iyasF9+D+IbtK
         E5nnIFN3sul7FiUEL9RHFM98wJj9L8jCFFU1QI8ywvAmcDDAuy1LKClq+dML65hRI2
         hNDpcCeVU22Tg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: [PATCH 3/3] USB: serial: blacklist USB-UIRT when driver is selected
Date:   Tue,  4 May 2021 18:52:45 +0100
Message-Id: <6df6e3c02c7f736e99799fca757056608ccaf6c0.1620149665.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620149665.git.sean@mess.org>
References: <cover.1620149665.git.sean@mess.org>
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

