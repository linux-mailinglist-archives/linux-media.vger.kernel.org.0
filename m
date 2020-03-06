Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F4D17BA4F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 11:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCFKdE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 05:33:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36395 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 05:33:03 -0500
Received: by mail-wr1-f67.google.com with SMTP id s17so814565wrs.3;
        Fri, 06 Mar 2020 02:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IdLE2j64bFa4rh3+Jd1RdnEDeNlfCI8zWa3p+SeV29c=;
        b=ujLkorQcBX8hcrG98taZedJFwKvskdRzpsQ1RV+PJzTmPN5+fSaWz6lmQmRfRnfrHj
         4Nf3fxcAHvuyvOIrLKPnabmT9RavWcclt5jSxQA5Chllnfc6poIq87YG5Dy8zwueyogB
         y5szaR0sehXRTcQsZ5wax8sSLjKYcu/2ddtxWMKku8XUsPBg7Uhq+QM5Zr+Jb6zzgrAc
         rK44nQv+tT/bK4gsb/QAORfZI+pYFen0U8BOA47fyWpcgYROUBAWpgGa/hPgUvcpx0sn
         1mZt7FrUO4ES1KwFJVMrwJhSQa9VhQRVstUdAoArWydDjrlwMRebItfudS8CXBdb+7bp
         Vy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IdLE2j64bFa4rh3+Jd1RdnEDeNlfCI8zWa3p+SeV29c=;
        b=szStdn+zslE5ZaY1PgoV1OrYn6z2GlRWH9AU+ie/UkwnD13NuaNG/ourtH/zhw5Heo
         YAuycuzgkV8NowT0MSCi3q10gXjVuyAjC6ZTrN3uG4m01zZfJf3KWUyN0Y1DwIN5iCJF
         hpgtlsJW0tB5hqJmdytfq0vXmHnQElVoyzc6EpQCCEIb8eEfNv9LFfqPdQt0Z7t1uARZ
         aKcae0WtNkNnvtI9ZkkeltDBTuHlvprEeeEh3D4y4VEd++5q9n5mMfMsOeR8hsRSJXpx
         44cxr77tX//oet1caB/DQGent+KPWV3AiETOdN7mRJUBuUgZpFzo7FKPHYi9Fw7C21Dj
         izXw==
X-Gm-Message-State: ANhLgQ3sjttJI3Wf8+ZKJV017ikJnzdRKzrl3XTc+cX5m7lPwWXQFCam
        qKQ0WB2qn9LjTI736Anp8rU=
X-Google-Smtp-Source: ADFU+vuXq8Ij6x/72q7Xw0DmoVNy8vOnfQg8Q9o/HXVPBscO1O7mCKJ0qHN5UStB1ASG9+EN0Oormg==
X-Received: by 2002:adf:fa07:: with SMTP id m7mr3360708wrr.384.1583490782202;
        Fri, 06 Mar 2020 02:33:02 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:7009:9d38:36e8:7030])
        by smtp.gmail.com with ESMTPSA id t1sm1251111wrq.36.2020.03.06.02.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 02:33:01 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] media: i2c: imx219: Add support for cropped 640x480 resolution
Date:   Fri,  6 Mar 2020 10:32:46 +0000
Message-Id: <20200306103246.22213-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200306103246.22213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds mode table entry for capturing cropped 640x480 resolution

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 72 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f96f3ce9fd85..6a86f500ec48 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -54,6 +54,7 @@
 #define IMX219_VTS_15FPS		0x0dc6
 #define IMX219_VTS_30FPS_1080P		0x06e3
 #define IMX219_VTS_30FPS_BINNED		0x06e3
+#define IMX219_VTS_30FPS_640x480	0x06e3
 #define IMX219_VTS_MAX			0xffff
 
 #define IMX219_VBLANK_MIN		4
@@ -142,8 +143,8 @@ struct imx219_mode {
 
 /*
  * Register sets lifted off the i2C interface from the Raspberry Pi firmware
- * driver.
- * 3280x2464 = mode 2, 1920x1080 = mode 1, and 1640x1232 = mode 4.
+ * driver for resolutions 3280x2464, 1920x1080 and 1640x1232.
+ * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 1.
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

