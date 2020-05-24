Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41E51E026F
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388133AbgEXT0W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388342AbgEXTZx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53498C05BD43
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:52 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id l15so18195179lje.9
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+PYK4q1Rnglh0VTibBDaR9VW5U2u0EzShHpfqOKsSuw=;
        b=lduPfREGdMEwQ29J2fNMxgsfPt8OwDvhs4Tmm4ET0BBw9U07IQXKhmxTFHKAtygKPZ
         4hD80UC22bLsHy4UeDeZBbHXmm2lApmU5Q55Hmc3b8rsnQJ8Wl97DtGYoc8x70gCPkM4
         ODm5hdYBdSuFTl556EIaq0tqj+fEMr7y1RZFr5khhq/LgKjeKEmawZLLawLu2Nv3H3EC
         vGdv9QVUKu2QYm87r1ESn7YaLxcFhSvCjKLoo9/j/n0WJ9rgmZb0xxkHmGLjEiiYvQeU
         /0BVSG+7MHB9sFyWbmaHz8Jh42w8hbQ8NPK5E9mV23rEMS9M4u8nrTsst4nZsgIuuuEh
         voYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+PYK4q1Rnglh0VTibBDaR9VW5U2u0EzShHpfqOKsSuw=;
        b=X5AwjlX9esuv9SswSkY8DMMR1t3K8r/v0DLGeekD0KXONuL02cObyKFQVKSFTxY9Wj
         nrPglVbtFIrCvCv91OYGenXbK5gnCc6ujniaQyoHgQyFrjYbX4ZTdP1juBmPevfI4Rnh
         //wSc6W9YHHoWJ08y71a99O2GoKwY8wUC4zBdtHf0lT5UM/ZaD925DMT3miEFGSS2nes
         MZwuOAMs3v8eOEt9LRsy8GYyB6Mdg83kQVX//0jkMcq+kx48xNSyxdpkfuAb3w267Tbc
         cwWZfJEtacHdxkY2ku3bi0NesaSUHI9ljCm8rKlYepk2SX29Mki4yebTWgmSS/qLnXum
         Tjhg==
X-Gm-Message-State: AOAM533j56hUu7WuPZiwv10g/GK/+dU8JP1mTIxr4zUqN+5orUKbGTUv
        MXSMaUbtK1hX/WSw7yQkPmmbDA==
X-Google-Smtp-Source: ABdhPJyeSms0uRBcipVV8IG65uMlNn+w956HACq5xunnK6XSANeWUO1bKfvjSum1rehpqN2Y9+CcZg==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr11144617ljh.406.1590348350804;
        Sun, 24 May 2020 12:25:50 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:50 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 07/10] media: i2c: imx290: Add RAW12 mode support
Date:   Sun, 24 May 2020 22:25:02 +0300
Message-Id: <20200524192505.20682-8-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
12 bit formats. Since the driver already supports RAW10 mode, let's add
the missing RAW12 mode as well.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 162c345fffac..6e70ff22bc5f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -71,6 +71,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
+	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -90,10 +91,12 @@ struct imx290 {
 
 struct imx290_pixfmt {
 	u32 code;
+	u8 bpp;
 };
 
 static const struct imx290_pixfmt imx290_formats[] = {
-	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
 };
 
 static const struct regmap_config imx290_regmap_config = {
@@ -261,6 +264,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
 	{ 0x300b, 0x00},
 };
 
+static const struct imx290_regval imx290_12bit_settings[] = {
+	{ 0x3005, 0x01 },
+	{ 0x3046, 0x01 },
+	{ 0x3129, 0x00 },
+	{ 0x317c, 0x00 },
+	{ 0x31ec, 0x0e },
+	{ 0x3441, 0x0c },
+	{ 0x3442, 0x0c },
+	{ 0x300a, 0xf0 },
+	{ 0x300b, 0x00 },
+};
+
 /* supported link frequencies */
 static const s64 imx290_link_freq_2lanes[] = {
 	891000000, /* 1920x1080 -  2 lane */
@@ -421,7 +436,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		} else {
 			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
 			msleep(10);
-			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
+			if (imx290->bpp == 10)
+				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+						 0x3c);
+			else /* 12 bits per pixel */
+				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+						 0xf0);
 			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
 		}
 		break;
@@ -496,7 +516,7 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
 	u8 nlanes = imx290->nlanes;
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	return (link_freq * 2 * nlanes / 10);
+	return (link_freq * 2 * nlanes / imx290->bpp);
 }
 
 static int imx290_set_fmt(struct v4l2_subdev *sd,
@@ -533,6 +553,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	} else {
 		format = &imx290->current_format;
 		imx290->current_mode = mode;
+		imx290->bpp = imx290_formats[i].bpp;
 
 		if (imx290->link_freq)
 			__v4l2_ctrl_s_ctrl(imx290->link_freq,
@@ -577,6 +598,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
 			return ret;
 		}
 		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
+						ARRAY_SIZE(
+							imx290_12bit_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev, "Could not set format registers\n");
+			return ret;
+		}
+		break;
 	default:
 		dev_err(imx290->dev, "Unknown pixel format\n");
 		return -EINVAL;
-- 
2.17.1

