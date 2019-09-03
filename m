Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D24FA745A
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfICUNG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44695 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfICUNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:05 -0400
Received: by mail-lj1-f194.google.com with SMTP id u14so10780239ljj.11;
        Tue, 03 Sep 2019 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5/bkw5TmSKSwUpx+OzbBVv/K0PHXiHAe7Oql4bTfH0=;
        b=umuOCnMl3ytygV0zn0WRsCvCPVb8lrFutX6lXn7PqyvPQxPq0tXw4qhZ2h+HvjqRPT
         eYYBESH8Yj/tu7YM8Uoc0ab+Ef+t9X5aFoPAas0gZia4tR2gJ+9ERPeN9FLSN6aCvxTM
         Rfh35B5tfC6K4KIb+McxeqPirMny6wUJYiFhYOv7l4eoTc1NmvxLZPpcCgnzjQ/4cN3I
         ftWtYpeiFJGtj6mPdx+hfMyZ8PhriHf8iPQQ3cnmYcRHdT8m2kd22OcMrC7kKerPDXX5
         XoWl6FTPy3BKTL6KjPFdkouNlc3nhhFMQGdj4WC2CC2m/6ZwS759RsMJKBlCiZtkPghZ
         0SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5/bkw5TmSKSwUpx+OzbBVv/K0PHXiHAe7Oql4bTfH0=;
        b=RFSpoDKBW80h8y55x2l/GbAXOo4wv/Eeprb2hiM/WXuL4qUTZUWZ6XGbnxQYMR7Hv6
         ab3ssOPhqgHP1o+J3AKOK3VU0B/sZOAOlsxxoJCyDUFA/BuKtdltwG2fm9kWlBPhqV5d
         a6cO/J2GN5ItbIxKT1Ogl3t/AoDWS6S203z9cM5baJXkr3BxbYNIyD7naFdP5lyFMz8a
         4gcILkdy7ApJKu5KynZ1goHMsfbtPp6StZjngCqNERRwuaRvGjK0fM3LuxfaRhTtqTAx
         +xgChbJ+8tnQWynGxUkkuRaBaoflc8mQsYCCo49ijD3nUF2NCTfEakDpaDYhy3IR3r8j
         oBnA==
X-Gm-Message-State: APjAAAWM1FtD6/CUyMrLWyv701vp2c4KwsWoZoNTO3xt8NLEDnc/bLAb
        XeXunIoyUyD/Hc+Oza4STb8=
X-Google-Smtp-Source: APXvYqzazWgg+TgBeqCSgVkhqVt98Qmfe0gLc3unFkvgTfQr5xW/2KkBLQLzNWL+FyLqiJWZX+/5KA==
X-Received: by 2002:a2e:412:: with SMTP id 18mr11478720lje.96.1567541583411;
        Tue, 03 Sep 2019 13:13:03 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:02 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 4/9] media: ov6650: Fix incorrect use of JPEG colorspace
Date:   Tue,  3 Sep 2019 22:11:39 +0200
Message-Id: <20190903201144.13219-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since its initial submission, the driver selects V4L2_COLORSPACE_JPEG
for supported formats other than V4L2_MBUS_FMT_SBGGR8_1X8.  According
to v4l2-compliance test program, V4L2_COLORSPACE_JPEG applies
exclusively to V4L2_PIX_FMT_JPEG.  Since the sensor does not support
JPEG format, fix it to always select V4L2_COLORSPACE_SRGB.

Fixes: 2f6e2404799a ("[media] SoC Camera: add driver for OV6650 sensor")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 983b72f33930..a7930ace3744 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -200,7 +200,6 @@ struct ov6650 {
 	unsigned long		pclk_max;	/* from resolution and format */
 	struct v4l2_fract	tpf;		/* as requested with s_frame_interval */
 	u32 code;
-	enum v4l2_colorspace	colorspace;
 };
 
 
@@ -514,7 +513,7 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 	mf->width	= priv->rect.width >> priv->half_scale;
 	mf->height	= priv->rect.height >> priv->half_scale;
 	mf->code	= priv->code;
-	mf->colorspace	= priv->colorspace;
+	mf->colorspace	= V4L2_COLORSPACE_SRGB;
 	mf->field	= V4L2_FIELD_NONE;
 
 	return 0;
@@ -622,11 +621,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		priv->pclk_max = 8000000;
 	}
 
-	if (code == MEDIA_BUS_FMT_SBGGR8_1X8)
-		priv->colorspace = V4L2_COLORSPACE_SRGB;
-	else if (code != 0)
-		priv->colorspace = V4L2_COLORSPACE_JPEG;
-
 	if (half_scale) {
 		dev_dbg(&client->dev, "max resolution: QCIF\n");
 		coma_set |= COMA_QCIF;
@@ -657,7 +651,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		ret = ov6650_reg_rmw(client, REG_COML, coml_set, coml_mask);
 
 	if (!ret) {
-		mf->colorspace	= priv->colorspace;
 		mf->width = priv->rect.width >> half_scale;
 		mf->height = priv->rect.height >> half_scale;
 	}
@@ -680,6 +673,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 				&mf->height, 2, H_CIF, 1, 0);
 
 	mf->field = V4L2_FIELD_NONE;
+	mf->colorspace = V4L2_COLORSPACE_SRGB;
 
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
@@ -690,13 +684,11 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 	case MEDIA_BUS_FMT_VYUY8_2X8:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
-		mf->colorspace = V4L2_COLORSPACE_JPEG;
 		break;
 	default:
 		mf->code = MEDIA_BUS_FMT_SBGGR8_1X8;
 		/* fall through */
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		mf->colorspace = V4L2_COLORSPACE_SRGB;
 		break;
 	}
 
@@ -1004,7 +996,6 @@ static int ov6650_probe(struct i2c_client *client,
 	priv->rect.height = H_CIF;
 	priv->half_scale  = false;
 	priv->code	  = MEDIA_BUS_FMT_YUYV8_2X8;
-	priv->colorspace  = V4L2_COLORSPACE_JPEG;
 
 	priv->subdev.internal_ops = &ov6650_internal_ops;
 
-- 
2.21.0

