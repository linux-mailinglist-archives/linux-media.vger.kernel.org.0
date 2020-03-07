Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C889117C9F4
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 01:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgCGA4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 19:56:48 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42305 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgCGA4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 19:56:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id v11so4354498wrm.9;
        Fri, 06 Mar 2020 16:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LvzGVeGDL3nWdTvoUmzJOHNq/+4xHvbxI3bbjSqn7nQ=;
        b=BuBDqTGZto62O3/KffRntYvE35kId6YnVgl6bQf15CCXsjyhjsfoHBnX2+uvf4OTvA
         oLI9X7O/ehs3CcbdNDgZSLvkWd1xvMXaFCBe5u/MC7y6A89XyH+TfMzXkCNz+GbGoovc
         lI8TCYcQRQdx3DDcW61Ss3IvaGaWpyLB5hCy3piH3qOuuU5g10Tn4t4WKPnxlwGDzsKo
         boLl8VCGu/iUMSAWAwAGuwBv3Jql34uEu7WJDPKnT7MFR/frz1hSG5k6mK140FRWIEzC
         7yIxOLksLyrC0Uviea9jdyZPOySXEhlvzSYpKv93JT+OuApOCPHApouwzdw6ptnGXy97
         Sbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LvzGVeGDL3nWdTvoUmzJOHNq/+4xHvbxI3bbjSqn7nQ=;
        b=WHuMLxn3cFp3AEQAcle0A4yHOrHX5WIb9z8/MrJnlXeIV8xk+A1TaXelHT2cwcj4lY
         2GH5wVr6aOhF+Ip8xVwb5pfd6z+p2LhyNm97iKdVb0sGGI7WjEDv+zJxDqyyzD190KEW
         hqciSlohbeyes/HGrgVI9yXZpkK+K2vgt8rxcIUfCRhZEN5Py68gAznqdYb6iqjNKg9I
         +nWGTUyMV894mOIQzl8xYxNo/tMyerlpP3on4JxlCcFzrhIsocCzbF8hE/H98nE2MvOg
         f8ETAlSJzfbZ4kwL9Q0lYFMj/TQTsmrJVOOFPOfjpAhvHTs7ETHCFJKw1qi13HcZ0yt1
         KTUw==
X-Gm-Message-State: ANhLgQ0Pwkfd7ryd/J6iWrlI0EJBKPo8vRCQPca3LfqiZMx2ACuvT1/F
        usel/8cgNfKbn48rr7bW424AIwoIgGE=
X-Google-Smtp-Source: ADFU+vubZ1ivO1k0akW/hg9J4XmvrXNrPIqHavBMIiiqbszli7HdVwhWE/nmbjeFIZZ3NEsmIik+xg==
X-Received: by 2002:adf:f7c1:: with SMTP id a1mr6498082wrq.299.1583542604839;
        Fri, 06 Mar 2020 16:56:44 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:d1f0:b457:730d:804e])
        by smtp.gmail.com with ESMTPSA id k16sm51472986wrd.17.2020.03.06.16.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 16:56:44 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] media: i2c: imx219: Add support for cropped 640x480 resolution
Date:   Sat,  7 Mar 2020 00:56:36 +0000
Message-Id: <20200307005636.8118-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds mode table entry for capturing cropped 640x480 resolution

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,

This patch is part of series [1] ("[PATCH v2 0/3] media: i2c: imx219:
Feature enhancements), rest of patches have been acked by Dave except
this one. I have fixed Daves's comments in this version of the patch.

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=432780&
    submitter=&state=*&q=&archive=&delegate=

v2->3
 * Corrected the mode value in comment

v1->v2:
 * Fixed fps setting for 640x480 and switched to auto mode.

 drivers/media/i2c/imx219.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f96f3ce9fd85..0e3567af5300 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -54,6 +54,7 @@
 #define IMX219_VTS_15FPS		0x0dc6
 #define IMX219_VTS_30FPS_1080P		0x06e3
 #define IMX219_VTS_30FPS_BINNED		0x06e3
+#define IMX219_VTS_30FPS_640x480	0x06e3
 #define IMX219_VTS_MAX			0xffff
 
 #define IMX219_VBLANK_MIN		4
@@ -143,7 +144,7 @@ struct imx219_mode {
 /*
  * Register sets lifted off the i2C interface from the Raspberry Pi firmware
  * driver.
- * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
+ * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
  */
 static const struct imx219_reg mode_3280x2464_regs[] = {
 	{0x0100, 0x00},
@@ -318,6 +319,63 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
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
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bars",
@@ -424,6 +482,16 @@ static const struct imx219_mode supported_modes[] = {
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
2.20.1

