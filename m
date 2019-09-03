Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CB0A745B
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfICUNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42600 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfICUNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:08 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so6251691lje.9;
        Tue, 03 Sep 2019 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4M8z8ECmeACr3s3aRSkLkxoiDnREOEztNYDP4Gz67c=;
        b=CZ2Zhacqw3CZt3hXWkGJcsV8T8g+BAhVmBziXWiiZC+uqv7ivOAAgtFrj7ucQhGriI
         xWaHCCCMtnasetRuOTVziokBNwYPI1YFQ8F/SkLvIIp/eqobGDAZPxjyPZkQm6RkflaU
         o1GAyHl/RyzfHNk5qgn4aHngpmE35xr1HcTa1GQ2Uy1/3wrmuI3gWiFPLBzMwNagKBH/
         Km+bEq7kwj0FndOui3fArnVKoBTC/X53ZrvyyE66qotA94IYxBSdF6TqHuaeYSiLjB0W
         GVO8T2YOrwLRGlVT668EDlYgtlikeQNQ77f07PoCGIScFijekYYjoEzawqo5IoOtFx47
         8AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4M8z8ECmeACr3s3aRSkLkxoiDnREOEztNYDP4Gz67c=;
        b=ijV4OchcmaaRFs0D5sbkpJYSE4RSeLx3lVUfR/ZWdAa5PZQ7mV+79Str1trJPM5uCz
         RnWHu0F4SyLy4KjZM4B9JOTQWVT9hIIWuCOw7vO7xH9dGtpl9ogesN9f6LdVG6g2nqmJ
         z/62k8UhLK/fyBkMKi7ACi/vjrgEbx6vlqOkv0nbBIvwA4w7RnE5CTln6M8jb39E4Jv+
         KKXsQKeVxra3BtXzeMP5ci7caw2+rbtoFMi5DaSZZYjRo7hUzKKhBvvFu2iSnNADwiOl
         a5NQVTEG2beiFUIgJdpeXi0Cqnew9mXdds4DqkU4apgUD7IJeCmOvRHn03BeKK/jntVv
         olHQ==
X-Gm-Message-State: APjAAAUHLmSV0qJjxeehrCB5mW2hI9E7UMvYjMiQiAiwcdxrJ6Es75Se
        8eYx1xwWzrOjXkrszwXjABs=
X-Google-Smtp-Source: APXvYqw9u9fUh6uzUxZac95gSEdPzY+hGA9grGMvnv+Zsb0Byitn7GBWoVq8/jbrh0M2NuQfrj6ACg==
X-Received: by 2002:a2e:80c2:: with SMTP id r2mr21121267ljg.44.1567541585007;
        Tue, 03 Sep 2019 13:13:05 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:04 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 5/9] media: ov6650: Fix some format attributes not under control
Date:   Tue,  3 Sep 2019 22:11:40 +0200
Message-Id: <20190903201144.13219-6-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

User arguments passed to .get/set_fmt() pad operation callbacks may
contain unsupported values.  The driver takes control over frame size
and pixel code as well as colorspace and field attributes but has never
cared for remainig format attributes, i.e., ycbcr_enc, quantization
and xfer_func, introduced by commit 11ff030c7365 ("[media]
v4l2-mediabus: improve colorspace support").  Fix it.

Set up a static v4l2_mbus_framefmt structure with attributes
initialized to reasonable defaults and use it for updating content of
user provided arguments.  In case of V4L2_SUBDEV_FORMAT_ACTIVE,
postpone frame size update, now performed from inside ov6650_s_fmt()
helper, util the user argument is first updated in ov6650_set_fmt() with
default frame format content.  For V4L2_SUBDEV_FORMAT_TRY, don't copy
all attributes to pad config, only those handled by the driver, then
fill the response with the default frame format updated with resulting
pad config format code and frame size.

Fixes: 11ff030c7365 ("[media] v4l2-mediabus: improve colorspace support")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 51 +++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index a7930ace3744..fd608aebb68d 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -212,6 +212,17 @@ static u32 ov6650_codes[] = {
 	MEDIA_BUS_FMT_Y8_1X8,
 };
 
+static const struct v4l2_mbus_framefmt ov6650_def_fmt = {
+	.width		= W_CIF,
+	.height		= H_CIF,
+	.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
+	.field		= V4L2_FIELD_NONE,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
 /* read a register */
 static int ov6650_reg_read(struct i2c_client *client, u8 reg, u8 *val)
 {
@@ -510,11 +521,13 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 	if (format->pad)
 		return -EINVAL;
 
+	/* initialize response with default media bus frame format */
+	*mf = ov6650_def_fmt;
+
+	/* update media bus format code and frame size */
 	mf->width	= priv->rect.width >> priv->half_scale;
 	mf->height	= priv->rect.height >> priv->half_scale;
 	mf->code	= priv->code;
-	mf->colorspace	= V4L2_COLORSPACE_SRGB;
-	mf->field	= V4L2_FIELD_NONE;
 
 	return 0;
 }
@@ -650,10 +663,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 	if (!ret)
 		ret = ov6650_reg_rmw(client, REG_COML, coml_set, coml_mask);
 
-	if (!ret) {
-		mf->width = priv->rect.width >> half_scale;
-		mf->height = priv->rect.height >> half_scale;
-	}
 	return ret;
 }
 
@@ -672,9 +681,6 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		v4l_bound_align_image(&mf->width, 2, W_CIF, 1,
 				&mf->height, 2, H_CIF, 1, 0);
 
-	mf->field = V4L2_FIELD_NONE;
-	mf->colorspace = V4L2_COLORSPACE_SRGB;
-
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		mf->code = MEDIA_BUS_FMT_Y8_1X8;
@@ -692,10 +698,31 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return ov6650_s_fmt(sd, mf);
-	cfg->try_fmt = *mf;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		/* store media bus format code and frame size in pad config */
+		cfg->try_fmt.width = mf->width;
+		cfg->try_fmt.height = mf->height;
+		cfg->try_fmt.code = mf->code;
 
+		/* return default mbus frame format updated with pad config */
+		*mf = ov6650_def_fmt;
+		mf->width = cfg->try_fmt.width;
+		mf->height = cfg->try_fmt.height;
+		mf->code = cfg->try_fmt.code;
+
+	} else {
+		/* apply new media bus format code and frame size */
+		int ret = ov6650_s_fmt(sd, mf);
+
+		if (ret)
+			return ret;
+
+		/* return default format updated with active size and code */
+		*mf = ov6650_def_fmt;
+		mf->width = priv->rect.width >> priv->half_scale;
+		mf->height = priv->rect.height >> priv->half_scale;
+		mf->code = priv->code;
+	}
 	return 0;
 }
 
-- 
2.21.0

