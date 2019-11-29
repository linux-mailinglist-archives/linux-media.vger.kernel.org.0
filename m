Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB16F10D9EF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 20:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfK2TGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 14:06:11 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44393 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfK2TGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 14:06:11 -0500
Received: by mail-pf1-f193.google.com with SMTP id d199so10352223pfd.11
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2019 11:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DmYsGklBxODi9ZXzG+eZphEo00SJ3Wr36G+fPUJuOQI=;
        b=zT92KeHeKw8smYn0Wg/ZkYYS3HUIgVo/BEAonyLQotvdGPO9EoJrWytsnE7ricRaJE
         4dmmdhb4xHRJX+WKgQfGSe87j8EJk7d7XspMM+7qbebFTHlJavhgkTy6RXPJIaYDb3yq
         tVRGekzSoLjKN/4vMCyMr7qynj7lOQCKfGYNmezHByEt4fVM9QbjTQBUo7G0A08urYjl
         XoQ071BJ4RlUh7bgcrpKik6D9P4l8BWS+I0XZ394b7OO5cadlj2iKTCWi/c1DMJkZIcX
         JpxqJ/nOA8jViQj6VyS4RXGUJUOm+kheO8cyp1mOWT4beaJ0EXk16are4Eoazv7Vf1SR
         Ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DmYsGklBxODi9ZXzG+eZphEo00SJ3Wr36G+fPUJuOQI=;
        b=m8tOQiqj2AdAVR4xM6nI9PCV5S3DBj61Zg5Fd/EVzqssV87nQDiFAaAHFGaMhk5sM9
         CmFqnskZjEtLonbzLwdtcuY64DB/UQ514mUAva+DRuwNGvy93vBmQkJSLgRHmYRhHz+b
         itvyioj+5d/Wkt0eaGZpPPBwybq82Qg473Jm3SuSlue9x+T7GK0/NdgraJSHFFLRlNuW
         PdCbUVZsPvdU7pkdvNG4+9CdfLpqXxfy/9WCS08Wm/X8q1t+ki9fgu3GyRI1rm7+78Q3
         kTdze5FbhYZWb6MjAvMbMv8Qd54PFMWVRTECDLA2ReWgcNRd5jtmiQ8IWylfh/cVxatF
         /t+Q==
X-Gm-Message-State: APjAAAV4DII4DXJa/0QgnTUM2ateBA9ODnkz5LOVFxpEjsxkvVeHqyHu
        zV1wBPflQMO3/iS5Ky3IukuN
X-Google-Smtp-Source: APXvYqzgig8XcKY6Z1Z5e1HRzFl4a4lC8ZhYAuK/3i+SnVPkIq/8PDUl4lpssyMcnNT2yb5tWXM7Mg==
X-Received: by 2002:a65:5307:: with SMTP id m7mr18546705pgq.113.1575054370197;
        Fri, 29 Nov 2019 11:06:10 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:638d:cc55:d006:f721:cde2:1059])
        by smtp.gmail.com with ESMTPSA id h9sm25159974pgk.84.2019.11.29.11.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:06:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
Date:   Sat, 30 Nov 2019 00:35:39 +0530
Message-Id: <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX290 is capable of outputting frames in both Raw Bayer (packed) 10 and
12 bit formats. Since the driver already supports RAW10 mode, let's add
the missing RAW12 mode as well.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index e218c959a729..d5bb3a59ac46 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -75,6 +75,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	int nlanes;
+	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -98,6 +99,7 @@ struct imx290_pixfmt {
 
 static const struct imx290_pixfmt imx290_formats[] = {
 	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12 },
 };
 
 static const struct regmap_config imx290_regmap_config = {
@@ -265,6 +267,18 @@ static const struct imx290_regval imx290_10bit_settings[] = {
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
 static const s64 imx290_link_freq[] = {
 	IMX290_DEFAULT_LINK_FREQ,
@@ -550,6 +564,21 @@ static int imx290_write_current_format(struct imx290 *imx290,
 			dev_err(imx290->dev, "Could not set format registers\n");
 			return ret;
 		}
+
+		imx290->bpp = 10;
+
+		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
+						ARRAY_SIZE(
+							imx290_12bit_settings));
+		if (ret < 0) {
+			dev_err(imx290->dev, "Could not set format registers\n");
+			return ret;
+		}
+
+		imx290->bpp = 12;
+
 		break;
 	default:
 		dev_err(imx290->dev, "Unknown pixel format\n");
@@ -910,6 +939,9 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
+	/* Default bits per pixel value */
+	imx290->bpp = 10;
+
 	mutex_init(&imx290->lock);
 
 	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
-- 
2.17.1

