Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025583A2923
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 12:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFJKS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 06:18:29 -0400
Received: from gofer.mess.org ([88.97.38.141]:51461 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230154AbhFJKSZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 06:18:25 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 05805C64DA; Thu, 10 Jun 2021 11:16:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1623320186; bh=z88cyJ/6ZTdtJYa3/06hDs2DGIOLoJGSCQAvrSG9Fiw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EXiRLDGko3jrCOywmZjUQ7lM0i1ZkH+twseyG+THO+oJbAuGw+KJqYAFgfSmvp/nM
         bjRj1D5SOiDFa8es+UgLv26e2j8DimqpOE9h6URHDwUmqZbeDgPiOc5xaIPNHIGQnG
         kFSTWLi1bWrcxlR+/uDqyiXlVXtBvsUoFmVcqyBRKv9eei1eNU1zYbPN4Ztnu7b7pX
         +svbVwP6PRnZ7gPGKScy7Q7XdodINa8OUQfJh0YFjfZIM4PcwzrSCN2JeUmDJlCAtc
         SXkUh8rUnnYmWEOtahp8aslh3xOAmYSpcKjp5ggYTQGwLIXovtk8u7KpRtkCcEr4C+
         nQe+OgJGUcsig==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v4 2/2] USB: serial: blacklist USB-UIRT when driver is selected
Date:   Thu, 10 Jun 2021 11:16:25 +0100
Message-Id: <900ce7cbcae2597767e59a335848e089ac82c73a.1623318855.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623318855.git.sean@mess.org>
References: <cover.1623318855.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The USB-UIRT device has its own driver, so blacklist the fdti driver
from using it if the driver has been enabled.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/usb/serial/ftdi_sio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 369ef140df78..2e9a9076a38d 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -106,7 +106,7 @@ static const struct ftdi_sio_quirk ftdi_NDI_device_quirk = {
 	.probe	= ftdi_NDI_device_setup,
 };
 
-static const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
+static __maybe_unused const struct ftdi_sio_quirk ftdi_USB_UIRT_quirk = {
 	.port_probe = ftdi_USB_UIRT_setup,
 };
 
@@ -568,8 +568,10 @@ static const struct usb_device_id id_table_combined[] = {
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
@@ -2281,7 +2283,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 /* Setup for the USB-UIRT device, which requires hardwired
  * baudrate (38400 gets mapped to 312500) */
 /* Called from usbserial:serial_probe */
-static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
+static __maybe_unused void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
 {
 	priv->flags |= ASYNC_SPD_CUST;
 	priv->custom_divisor = 77;
-- 
2.31.1

