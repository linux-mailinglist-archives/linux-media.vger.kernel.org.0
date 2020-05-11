Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E411D1CD40D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 10:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgEKIfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 04:35:11 -0400
Received: from mail-out.marcant.net ([217.14.160.135]:49921 "EHLO
        mail-out.marcant.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728613AbgEKIfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 04:35:11 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 May 2020 04:35:09 EDT
Received: from antec.home.local (p57ABD3EC.dip0.t-ipconnect.de [87.171.211.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp-auth.marcant.net (Postfix) with ESMTPSA id 27E45542115;
        Mon, 11 May 2020 10:30:07 +0200 (CEST)
Received: by antec.home.local (Postfix, from userid 0)
        id CB75654157C; Mon, 11 May 2020 10:30:06 +0200 (CEST)
From:   Dirk Nehring <dnehring@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dirk Nehring <dnehring@gmx.net>
Subject: [PATCH] media: dvb-usb: Add Cinergy S2 PCIe Dual Port support
Date:   Mon, 11 May 2020 10:29:53 +0200
Message-Id: <20200511082953.1824517-1-dnehring@gmx.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Terratec Cinergy S2 PCIe Dual is a PCIe device with two tuners that
actually contains two USB devices. The devices are visible in the
lsusb printout.

Bus 004 Device 002: ID 153b:1182 TerraTec Electronic GmbH Cinergy S2 PCIe Dual Port 2
Bus 003 Device 002: ID 153b:1181 TerraTec Electronic GmbH Cinergy S2 PCIe Dual Port 1

The devices use the Montage M88DS3000/M88TS2022 demod/tuner.

Signed-off-by: Dirk Nehring <dnehring@gmx.net>
---
 drivers/media/usb/dvb-usb/dw2102.c | 14 +++++++++++++-
 include/media/dvb-usb-ids.h        |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dw2102.c b/drivers/media/usb/dvb-usb/dw2102.c
index f6d2d2398db6..9736fa253540 100644
--- a/drivers/media/usb/dvb-usb/dw2102.c
+++ b/drivers/media/usb/dvb-usb/dw2102.c
@@ -1779,6 +1779,8 @@ enum dw2102_table_entry {
 	TERRATEC_CINERGY_S2_R2,
 	TERRATEC_CINERGY_S2_R3,
 	TERRATEC_CINERGY_S2_R4,
+	TERRATEC_CINERGY_S2_1,
+	TERRATEC_CINERGY_S2_2,
 	GOTVIEW_SAT_HD,
 	GENIATECH_T220,
 	TECHNOTREND_S2_4600,
@@ -1809,6 +1811,8 @@ static struct usb_device_id dw2102_table[] = {
 	[TERRATEC_CINERGY_S2_R2] = {USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R2)},
 	[TERRATEC_CINERGY_S2_R3] = {USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R3)},
 	[TERRATEC_CINERGY_S2_R4] = {USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4)},
+	[TERRATEC_CINERGY_S2_1] = {USB_DEVICE(USB_VID_TERRATEC_2, USB_PID_TERRATEC_CINERGY_S2_1)},
+	[TERRATEC_CINERGY_S2_2] = {USB_DEVICE(USB_VID_TERRATEC_2, USB_PID_TERRATEC_CINERGY_S2_2)},
 	[GOTVIEW_SAT_HD] = {USB_DEVICE(0x1FE1, USB_PID_GOTVIEW_SAT_HD)},
 	[GENIATECH_T220] = {USB_DEVICE(0x1f4d, 0xD220)},
 	[TECHNOTREND_S2_4600] = {USB_DEVICE(USB_VID_TECHNOTREND,
@@ -2221,7 +2225,7 @@ static struct dvb_usb_device_properties su3000_properties = {
 		}},
 		}
 	},
-	.num_device_descs = 6,
+	.num_device_descs = 8,
 	.devices = {
 		{ "SU3000HD DVB-S USB2.0",
 			{ &dw2102_table[GENIATECH_SU3000], NULL },
@@ -2243,6 +2247,14 @@ static struct dvb_usb_device_properties su3000_properties = {
 			{ &dw2102_table[TERRATEC_CINERGY_S2_R3], NULL },
 			{ NULL },
 		},
+		{ "Terratec Cinergy S2 PCIe Dual Port 1",
+			{ &dw2102_table[TERRATEC_CINERGY_S2_1], NULL },
+			{ NULL },
+		},
+		{ "Terratec Cinergy S2 PCIe Dual Port 2",
+			{ &dw2102_table[TERRATEC_CINERGY_S2_2], NULL },
+			{ NULL },
+		},
 		{ "GOTVIEW Satellite HD",
 			{ &dw2102_table[GOTVIEW_SAT_HD], NULL },
 			{ NULL },
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 41f0bf122f53..d37cb74b769c 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -56,6 +56,7 @@
 #define USB_VID_REALTEK				0x0bda
 #define USB_VID_TECHNOTREND			0x0b48
 #define USB_VID_TERRATEC			0x0ccd
+#define USB_VID_TERRATEC_2			0x153b
 #define USB_VID_TELESTAR			0x10b9
 #define USB_VID_VISIONPLUS			0x13d3
 #define USB_VID_SONY				0x1415
@@ -280,6 +281,8 @@
 #define USB_PID_TERRATEC_CINERGY_S2_R2			0x00b0
 #define USB_PID_TERRATEC_CINERGY_S2_R3			0x0102
 #define USB_PID_TERRATEC_CINERGY_S2_R4			0x0105
+#define USB_PID_TERRATEC_CINERGY_S2_1			0x1181
+#define USB_PID_TERRATEC_CINERGY_S2_2			0x1182
 #define USB_PID_TERRATEC_H7				0x10b4
 #define USB_PID_TERRATEC_H7_2				0x10a3
 #define USB_PID_TERRATEC_H7_3				0x10a5
-- 
2.26.2

