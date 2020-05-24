Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053981DFED7
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 14:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgEXMIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 08:08:02 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:47595 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727916AbgEXMIC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 08:08:02 -0400
Received: from lassmichmalbittekurznachdenken.molgen.mpg.de (lassmichmalbittekurznachdenken.molgen.mpg.de [141.14.17.241])
        by mx.molgen.mpg.de (Postfix) with ESMTP id 2C3B42002EE16;
        Sun, 24 May 2020 14:07:59 +0200 (CEST)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Mauro Carvalho Chehab <mchehab@redhat.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2] media: em28xx: Support TerraTec G3
Date:   Sun, 24 May 2020 14:07:46 +0200
Message-Id: <20200524120745.5867-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the USB vendor and product ID of the TerraTec G3 [1], so Linux
detects the device.

    [   38.093023] usb 1-3: new high-speed USB device number 4 using xhci_hcd
    [   38.240404] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x82 has invalid wMaxPacketSize 0
    [   38.240408] usb 1-3: config 1 interface 0 altsetting 1 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240411] usb 1-3: config 1 interface 0 altsetting 2 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240413] usb 1-3: config 1 interface 0 altsetting 3 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240416] usb 1-3: config 1 interface 0 altsetting 4 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240418] usb 1-3: config 1 interface 0 altsetting 5 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240420] usb 1-3: config 1 interface 0 altsetting 6 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.240423] usb 1-3: config 1 interface 0 altsetting 7 endpoint 0x84 has invalid wMaxPacketSize 0
    [   38.255077] usb 1-3: New USB device found, idVendor=0ccd, idProduct=10a7, bcdDevice= 1.00
    [   38.255080] usb 1-3: New USB device strings: Mfr=2, Product=1, SerialNumber=0
    [   38.255082] usb 1-3: Product: TerraTec G3
    [   38.255085] usb 1-3: Manufacturer: TerraTec Electronic GmbH
    [   38.286444] videodev: Linux video capture interface: v2.00
    [   38.290861] em28xx 1-3:1.0: New device TerraTec Electronic GmbH TerraTec G3 @ 480 Mbps (0ccd:10a7, interface 0, class 0)
    [   38.290863] em28xx 1-3:1.0: Video interface 0 found: isoc
    [   38.349064] em28xx 1-3:1.0: chip ID is em2860
    [   38.515453] em28xx 1-3:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash = 0xd7a2f285
    [   38.515456] em28xx 1-3:1.0: EEPROM info:
    [   38.515458] em28xx 1-3:1.0: 	AC97 audio (5 sample rates)
    [   38.515460] em28xx 1-3:1.0: 	500mA max power
    [   38.515462] em28xx 1-3:1.0: 	Table at offset 0x06, strings=0x1a9e, 0x346a, 0x0000
    [   38.586387] em28xx 1-3:1.0: Identified as Terratec Grabby (card=67)
    [   38.586392] em28xx 1-3:1.0: analog set to isoc mode.
    [   38.586503] em28xx 1-3:1.1: audio device (0ccd:10a7): interface 1, class 1
    [   38.586516] em28xx 1-3:1.2: audio device (0ccd:10a7): interface 2, class 1
    [   38.586543] usbcore: registered new interface driver em28xx
    [   38.599733] em28xx 1-3:1.0: Registering V4L2 extension
    [   38.629311] em28xx 1-3:1.0: Config register raw data: 0x50
    [   38.659140] em28xx 1-3:1.0: AC97 vendor ID = 0x83847650
    [   38.674111] em28xx 1-3:1.0: AC97 features = 0x6a90
    [   38.674114] em28xx 1-3:1.0: Empia 202 AC97 audio processor detected
    [   40.699171] em28xx 1-3:1.0: V4L2 video device registered as video0
    [   40.699174] em28xx 1-3:1.0: V4L2 VBI device registered as vbi0
    [   40.699176] em28xx 1-3:1.0: V4L2 extension successfully initialized
    [   40.699178] em28xx: Registered (Em28xx v4l2 Extension) extension

[1]: https://www.terratec.de/details.php?artnr=TERRATEC+G3

Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
[rebase https://patchwork.kernel.org/patch/902312/ on master]
Cc: linux-media@vger.kernel.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index a8c321d118279..ba6e65d0c2229 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2618,6 +2618,8 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM2860_BOARD_TERRATEC_GRABBY },
 	{ USB_DEVICE(0x0ccd, 0x10AF),
 			.driver_info = EM2860_BOARD_TERRATEC_GRABBY },
+	{ USB_DEVICE(0x0ccd, 0x10a7),
+			.driver_info = EM2860_BOARD_TERRATEC_GRABBY },
 	{ USB_DEVICE(0x0ccd, 0x00b2),
 			.driver_info = EM2884_BOARD_CINERGY_HTC_STICK },
 	{ USB_DEVICE(0x0fd9, 0x0018),
-- 
2.26.2

