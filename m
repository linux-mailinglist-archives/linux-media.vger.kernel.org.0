Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FFC3AC8A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 12:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhFRKVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 06:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhFRKVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 06:21:00 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27690C061760;
        Fri, 18 Jun 2021 03:18:50 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0B7DAC645F; Fri, 18 Jun 2021 11:18:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1624011528; bh=z88cyJ/6ZTdtJYa3/06hDs2DGIOLoJGSCQAvrSG9Fiw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ePlydqj+K69SBO1uZAVOItNCRHHNTsA0x0Ag2+a7NnKJ7qyq639fN5UrIrZHN786Y
         qhf3psZe4ecXwn8RNHC0sj8m6b9igpdvxb6QcMKfHo+HBaAKXAagL7+83vC8mhVVJ0
         easYDjhNPDvUYsfVo4mXNzBNH3pEyHFLTzLZNJHDyloxsGEZRMBlcaqKkxHUIFOSWX
         LgFhm5JdSnm+MqQNIzWm/DGAfomU0uo5iC1iLyE/VPWxtKYnf/tF09sZ719xTPBXhF
         tXsmTsS7cN7NnHqI5+/k1n5ME9d7zfNXbS6Zrqw0hlyYzQE2QWnchcN8GDW10SRVZl
         WRx7pFh65z81g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v5 2/2] USB: serial: blacklist USB-UIRT when driver is selected
Date:   Fri, 18 Jun 2021 11:18:47 +0100
Message-Id: <3b51bfaa1889d38e5259affd826db7d9ff9ba4ca.1624006513.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624006513.git.sean@mess.org>
References: <cover.1624006513.git.sean@mess.org>
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

