Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1252C8FDB
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 19:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbfJBR0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 13:26:04 -0400
Received: from er-systems.de ([148.251.68.21]:60631 "EHLO er-systems.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726697AbfJBR0E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 13:26:04 -0400
Received: by er-systems.de (Postfix, from userid 1006)
        id 28DC2D6006C; Wed,  2 Oct 2019 19:26:03 +0200 (CEST)
From:   Thomas Voegtle <tv@lio96.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Jan Pieter van Woerkom <jp@jpvw.nl>
Subject: [PATCH v2] media: dvbsky: add support for eyeTV Geniatech T2 lite
Date:   Wed,  2 Oct 2019 19:26:03 +0200
Message-Id: <20191002172603.3497-1-tv@lio96.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds USB ID for the eyeTV Geniatech T2 lite to the dvbsky driver.
This is a Geniatech T230C based stick without IR and a different USB ID.

Signed-off-by: Thomas Voegtle <tv@lio96.de>
Tested-by: Jan Pieter van Woerkom <jp@jpvw.nl>
---

Changes in v2:
 - fixed a typo, missed a "C"
 - fixed sort order of IDs in dvb-usb-ids.h (jp)

 drivers/media/usb/dvb-usb-v2/dvbsky.c | 3 +++
 include/media/dvb-usb-ids.h           | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 617a306f6815..dc380c0c9536 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -792,6 +792,9 @@ static const struct usb_device_id dvbsky_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
+	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C_LITE,
+		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C Lite",
+		NULL) },
 	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
 		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C v2",
 		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 7ce4e8332421..1409230ad3a4 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -389,6 +389,7 @@
 #define USB_PID_MYGICA_T230				0xc688
 #define USB_PID_MYGICA_T230C				0xc689
 #define USB_PID_MYGICA_T230C2				0xc68a
+#define USB_PID_MYGICA_T230C_LITE			0xc699
 #define USB_PID_ELGATO_EYETV_DIVERSITY			0x0011
 #define USB_PID_ELGATO_EYETV_DTT			0x0021
 #define USB_PID_ELGATO_EYETV_DTT_2			0x003f
-- 
2.16.4

