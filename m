Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8487717FBFB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731562AbgCJNRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:17:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:31755 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731543AbgCJNRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:17:43 -0400
X-IronPort-AV: E=Sophos;i="5.70,537,1574089200"; 
   d="scan'208";a="41499820"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2020 22:17:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B97574290415;
        Tue, 10 Mar 2020 22:17:40 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/3] media: i2c: imx219: Add support for cropped 640x480 resolution
Date:   Tue, 10 Mar 2020 13:17:09 +0000
Message-Id: <1583846229-6799-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds mode table entry for capturing cropped 640x480 resolution

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 70 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3207487..cb03bde 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -54,6 +54,7 @@
 #define IMX219_VTS_15FPS		0x0dc6
 #define IMX219_VTS_30FPS_1080P		0x06e3
 #define IMX219_VTS_30FPS_BINNED		0x06e3
+#define IMX219_VTS_30FPS_640x480	0x06e3
 #define IMX219_VTS_MAX			0xffff
 
 #define IMX219_VBLANK_MIN		4
@@ -138,7 +139,7 @@ struct imx219_mode {
 /*
  * Register sets lifted off the i2C interface from the Raspberry Pi firmware
  * driver.
- * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
+ * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
  */
 static const struct imx219_reg mode_3280x2464_regs[] = {
 	{0x0100, 0x00},
@@ -313,6 +314,63 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
 	{0x0163, 0x78},
 };
 
+static const struct imx219_reg mode_640_480_regs[] = {
+	{0x0100, 0x00},
+	{0x30eb, 0x05},
+	{0x30eb, 0x0c},
+	{0x300a, 0xff},
+	{0x300b, 0xff},
+	{0x30eb, 0x05},
+	{0x30eb, 0x09},
+	{0x0114, 0x01},
+	{0x0128, 0x00},
+	{0x012a, 0x18},
+	{0x012b, 0x00},
+	{0x0162, 0x0d},
+	{0x0163, 0x78},
+	{0x0164, 0x03},
+	{0x0165, 0xe8},
+	{0x0166, 0x08},
+	{0x0167, 0xe7},
+	{0x0168, 0x02},
+	{0x0169, 0xf0},
+	{0x016a, 0x06},
+	{0x016b, 0xaf},
+	{0x016c, 0x02},
+	{0x016d, 0x80},
+	{0x016e, 0x01},
+	{0x016f, 0xe0},
+	{0x0170, 0x01},
+	{0x0171, 0x01},
+	{0x0174, 0x03},
+	{0x0175, 0x03},
+	{0x0301, 0x05},
+	{0x0303, 0x01},
+	{0x0304, 0x03},
+	{0x0305, 0x03},
+	{0x0306, 0x00},
+	{0x0307, 0x39},
+	{0x030b, 0x01},
+	{0x030c, 0x00},
+	{0x030d, 0x72},
+	{0x0624, 0x06},
+	{0x0625, 0x68},
+	{0x0626, 0x04},
+	{0x0627, 0xd0},
+	{0x455e, 0x00},
+	{0x471e, 0x4b},
+	{0x4767, 0x0f},
+	{0x4750, 0x14},
+	{0x4540, 0x00},
+	{0x47b4, 0x14},
+	{0x4713, 0x30},
+	{0x478b, 0x10},
+	{0x478f, 0x10},
+	{0x4793, 0x10},
+	{0x4797, 0x0e},
+	{0x479b, 0x0e},
+};
+
 static const struct imx219_reg raw8_framefmt_regs[] = {
 	{0x018c, 0x08},
 	{0x018d, 0x08},
@@ -431,6 +489,16 @@ static const struct imx219_mode supported_modes[] = {
 			.regs = mode_1640_1232_regs,
 		},
 	},
+	{
+		/* 640x480 30fps mode */
+		.width = 640,
+		.height = 480,
+		.vts_def = IMX219_VTS_30FPS_640x480,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_640_480_regs),
+			.regs = mode_640_480_regs,
+		},
+	},
 };
 
 struct imx219 {
-- 
2.7.4

