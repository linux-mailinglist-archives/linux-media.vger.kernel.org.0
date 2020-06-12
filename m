Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DEC1F78FE
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 15:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFLNyq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 09:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgFLNym (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 09:54:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB4DC08C5C1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y11so11178035ljm.9
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VUUHzTYdCTkEy8qJLKBgOAUld/T0D8KqCFLo4EbK13A=;
        b=FWhMXcsOEds3+BBPQIYyMZMkkDNYqr8Hvf0Pzpg8tbt+5q0Pae7x3KYplDTTYLnDZf
         QvTkqvmHw6i/6iRnZ6dnkfHHxnwYw+FzQ1XgGJorSL9W5s03JdN63NTaH2Xu715b8AAO
         GBaDMKfA/GrwV0MpFVy36NKbRAccos6wcPg+0znIPFcVs2fOJgfF9X97Uc4UsVMbZAPC
         C0l70vTdL9ANIP0BUF6i6V8lgp4kdQEaigslsXFA2rOwOugGsuVgK8qUVKFO8hawrUWA
         Hk3RGdrY3ILJaiZ8KSi3IYeU7Zz86SNOZcT+Bb0Cx4hswB9ri17H147UnULxxgNo2oPU
         W9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VUUHzTYdCTkEy8qJLKBgOAUld/T0D8KqCFLo4EbK13A=;
        b=BbklwHpFk9LJ7l+CIUVgnp6nLotG4teAZx5SBz/HoAe07fyjpUoFUmBSxJv6tog2Sy
         PS/XBmZ/sDpOr/KDaQxkU5oubgtyvAJHY0aLi3GkPc2Q9ZupKVzsaUAYamDd1KdDxntc
         3O/IsAjplKvHn27mxkA2KOWTj/sIi4RC1RsW9Bgqp1EX0F3pZ/3Nul+p8LOoQSFQgC+0
         INTXhlspkjXVkgkhAze7TTm4MRQz/CvO2PuYyWlIREqbnPFEyBhH+SUsUtuEotPyEbTl
         GR7I3gyvo5PnlpcM9IDSB8T1h9iSdjRam2OaUYI3m1z2Os0AKUBBQv1JPmEqKL3ilA8u
         zOaw==
X-Gm-Message-State: AOAM530ibj1gmkRzOYc1zFxQXws7oJ/HQN5jryZcyU8kEdKIFbCA6HYf
        k1ajGDkfXk1IrfvjEYmKi/TrZg==
X-Google-Smtp-Source: ABdhPJxk6HkegMMq+UhE9X/AYUPY8zX34/yL/MBNoC6KMOLW3w9i0pDCF9KBxHYexkhZH/3Tt6kGjw==
X-Received: by 2002:a2e:9ac6:: with SMTP id p6mr7249076ljj.417.1591970080042;
        Fri, 12 Jun 2020 06:54:40 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:39 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 07/10] media: i2c: imx290: Add RAW12 mode support
Date:   Fri, 12 Jun 2020 16:53:52 +0300
Message-Id: <20200612135355.30286-8-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
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
index 67725a5aabd3..c654a9a8fb08 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -67,6 +67,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
+	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -86,10 +87,12 @@ struct imx290 {
 
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
@@ -257,6 +260,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
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
 #define FREQ_INDEX_1080P	0
 #define FREQ_INDEX_720P		1
@@ -478,7 +493,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -550,7 +570,7 @@ static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
 	pixel_rate = link_freq * 2 * nlanes;
-	do_div(pixel_rate, 10);
+	do_div(pixel_rate, imx290->bpp);
 	return pixel_rate;
 }
 
@@ -587,6 +607,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	} else {
 		format = &imx290->current_format;
 		imx290->current_mode = mode;
+		imx290->bpp = imx290_formats[i].bpp;
 
 		if (imx290->link_freq)
 			__v4l2_ctrl_s_ctrl(imx290->link_freq,
@@ -631,6 +652,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
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

