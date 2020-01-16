Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E5E13E093
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 17:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgAPQoQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 11:44:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:52254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbgAPQoP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 11:44:15 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48DD52073A;
        Thu, 16 Jan 2020 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193055;
        bh=J2vAD+nHgsTkgObu4a9RlXmdxbul9bnycmMCKD50Dm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XlegCqtzyj/uUpA5sly4g6ZUiE1yt4Zi21VUUPS1BpVpq/r8RWoLQJis0Oc43pEvZ
         N+qqFJajcV4QN9/IozRkvS4cckYbZVTcuDw/T+QPaTwlozq1SP4EBRB4o+po8Uitp2
         i5KC20HEVXz6ux5aE/vcwPGnox/vX2ud8X2EBuZ4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 015/205] media: ov6650: Fix some format attributes not under control
Date:   Thu, 16 Jan 2020 11:39:50 -0500
Message-Id: <20200116164300.6705-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

[ Upstream commit 1c6a2b63095154bbf9e8f38d79487a728331bf65 ]

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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ov6650.c | 51 +++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index a654b402ef07..5fa3b2088b52 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -213,6 +213,17 @@ static u32 ov6650_codes[] = {
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
@@ -513,11 +524,13 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
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
@@ -656,10 +669,6 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 	if (!ret)
 		priv->code = code;
 
-	if (!ret) {
-		mf->width = priv->rect.width >> half_scale;
-		mf->height = priv->rect.height >> half_scale;
-	}
 	return ret;
 }
 
@@ -678,9 +687,6 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		v4l_bound_align_image(&mf->width, 2, W_CIF, 1,
 				&mf->height, 2, H_CIF, 1, 0);
 
-	mf->field = V4L2_FIELD_NONE;
-	mf->colorspace = V4L2_COLORSPACE_SRGB;
-
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		mf->code = MEDIA_BUS_FMT_Y8_1X8;
@@ -698,10 +704,31 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
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
2.20.1

