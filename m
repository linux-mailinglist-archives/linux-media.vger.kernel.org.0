Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68DCBC3B9C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 18:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390412AbfJAQpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 12:45:49 -0400
Received: from er-systems.de ([148.251.68.21]:34683 "EHLO er-systems.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388218AbfJAQpt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 12:45:49 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Oct 2019 12:45:48 EDT
Received: by er-systems.de (Postfix, from userid 1006)
        id 42593D6006D; Tue,  1 Oct 2019 18:38:29 +0200 (CEST)
From:   Thomas Voegtle <tv@lio96.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Subject: [PATCH] media: dvbsky: add support for eyeTV Geniatech T2 lite
Date:   Tue,  1 Oct 2019 18:38:29 +0200
Message-Id: <20191001163829.15701-1-tv@lio96.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds USB ID for the eyeTV Geniatech T2 lite to the dvbsky driver.
This is a Geniatech T230C based stick without IR and a different USB ID.

Signed-off-by: Thomas Voegtle <tv@lio96.de>
---
 drivers/media/usb/dvb-usb-v2/dvbsky.c | 3 +++
 include/media/dvb-usb-ids.h           | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 617a306f6815..578b1d0aae70 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -792,6 +792,9 @@ static const struct usb_device_id dvbsky_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C_LITE,
+		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230 Lite",
+		NULL) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 7ce4e8332421..61af054a34a1 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -388,6 +388,7 @@
 #define USB_PID_MYGICA_D689				0xd811
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
+#define USB_PID_MYGICA_T230C_LITE			0xc699
 #define USB_PID_MYGICA_T230C2				0xc68a
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
-- 
2.16.4

