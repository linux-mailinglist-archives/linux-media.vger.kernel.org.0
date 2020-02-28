Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFE4173DB6
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgB1QzP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:55:15 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38425 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727011AbgB1QzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:55:14 -0500
Received: by mail-wm1-f66.google.com with SMTP id n64so2635039wme.3;
        Fri, 28 Feb 2020 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=casrlj1Hqx5LF5+z91d1KG1nSFyqQK6E1q8wczBteSc=;
        b=T/MYdSTF77UGkyKWECcieIpTI1iM2awpa/dkwRRpuEuANpfwC9Phjc7/EY2h6Fbxkg
         sWl3xD+WbCVOU6l+xYB469AM9XaziUWaQ72SzVMmqkaVg+A9dTy7DKe+9mCiujjK2kPI
         Ira+3tHjBYTnJKXybKy+lq5W6t1mxcykeCivGWwdHLAoRpwwspapXRwyXyi4YT4XrMd2
         80eikQsion726w0tCiDLmPaSYD4ZIcZ/JNmM66FjUU9UjwFlYUxwuElLA6WtLhunhs4U
         gEGCcI/C5nRFolLtFwIPz5EA56tmNJH2lQyRTL38xXHVvJwaJ/D+UrJQNHG0Sp0d6nG6
         TIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=casrlj1Hqx5LF5+z91d1KG1nSFyqQK6E1q8wczBteSc=;
        b=PKdEHda4OozeRq3P1A6+n5plCryPB6wOyMTpGwJmbzC8aUfZDILxOHZG8nPSV9DE/J
         cWYwZFHWBdvGJ2d7Zx2Wzs14JzdN38FVYGR8mi9heQtBfC3n89C9z/pB9w3dzbFjDM/P
         KFG5KyKefexSegD62VqmFYgMIQaZZQQaUoNmlYftlo4S8WdOO3mB9CfEiqdjTpA1dC76
         OrbsAyLJXLZAr076aVOKLVkuBaVdTit+YK9NQoip5UoDJQ4/nYOZ9WLTWybtIs8kdEce
         G4Vs9nQImCS1W7rJq8gO4arEivT6lfZYDTCZl/ft6Yl162idxS9g5IKXKtM1OeAjai9k
         zrzA==
X-Gm-Message-State: APjAAAUZbz0jBXKbG3qlDQ46F3LJZ50X9huqMdz8Hz4eGG9T7rGT5WxJ
        GtdVueBSPquF7zNQ6ll4o3A=
X-Google-Smtp-Source: APXvYqzQCjwWAxyxs7x4WoHMBibiEKhdb4HfRyEGj4RtvGJupfpjHBlowkQQfcuwMFFc2v/f7rcnQg==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr5449538wme.125.1582908912646;
        Fri, 28 Feb 2020 08:55:12 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id s1sm13300071wro.66.2020.02.28.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:55:12 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] media: i2c: imx219: Add support 640x480
Date:   Fri, 28 Feb 2020 16:55:03 +0000
Message-Id: <20200228165503.18054-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200228165503.18054-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support to 640x480 cropped resolution for the sensor

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/imx219.c | 70 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1388c9bc00bb..232ebf41063a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -54,6 +54,7 @@
 #define IMX219_VTS_15FPS		0x0dc6
 #define IMX219_VTS_30FPS_1080P		0x06e3
 #define IMX219_VTS_30FPS_BINNED		0x06e3
+#define IMX219_VTS_30FPS_640x480	0x0239
 #define IMX219_VTS_MAX			0xffff
 
 #define IMX219_VBLANK_MIN		4
@@ -329,6 +330,65 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
 	{0x0163, 0x78},
 };
 
+static const struct imx219_reg mode_640_480_regs[] = {
+	{0x0100, 0x00},
+	{0x30eb, 0x0c},
+	{0x30eb, 0x05},
+	{0x300a, 0xff},
+	{0x300b, 0xff},
+	{0x30eb, 0x05},
+	{0x30eb, 0x09},
+	{0x0114, 0x01},
+	{0x0128, 0x01},
+	{0x012a, 0x18},
+	{0x012b, 0x00},
+	{0x0162, 0x0d},
+	{0x0163, 0xe7},
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
+	{0x0172, 0x00},
+	{0x0174, 0x03},
+	{0x0175, 0x03},
+	{0x0301, 0x05},
+	{0x0303, 0x01},
+	{0x0304, 0x03},
+	{0x0305, 0x03},
+	{0x0306, 0x00},
+	{0x0307, 0x39},
+	{0x0309, 0x08},
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
@@ -414,6 +474,16 @@ static const struct imx219_mode supported_modes[] = {
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

