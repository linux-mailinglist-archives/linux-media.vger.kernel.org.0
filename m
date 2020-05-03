Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECEA1C2FDF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgECWG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729114AbgECWG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:06:29 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9569C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:06:28 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u15so7843926ljd.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RD2lmTz2BQWeLN0p8b/I76lKaQDT+HW+7lWuS6rBiEU=;
        b=hAttu7RyLafBOkTOxGCYom7MSalCYbMzkTwignNKkmMt2MOfMItLyK3k5zQLeivlNz
         BCTSCiN/SK/HArhzKMXI3V7hoBPOxU177BpPtQ+CqBMXj+Tg0iEojkaQm20KmHj9ktaY
         RgDDv8E7bXK4o4BT4OXj5K32sEViuuvIJl3keZWh7k3HGjDOXaNA9ccNJP4J9O/YgroU
         dp6LTNLs8K2eaF5e6C9HmfYIGsb4FY3deOebOsL+QhE3keOg2TsEExg139bUj4jRDgB8
         o9mUqA2wWbwiYRcS4+fyDcygRQjpHsVBPH4fVUcA/0q0Rt94uZgE56TZetI6Ys0uALRH
         ToTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RD2lmTz2BQWeLN0p8b/I76lKaQDT+HW+7lWuS6rBiEU=;
        b=kFmYnhc9NewjHo6Vn+O5QCceKY65/3zqn3bnqE4LDn/ydjYsLDwxCDD8zUUxH39wtl
         I4ZWaPTAbqsbX8nUhnuRWFz18ZStoj+rjU1+0wLNyffzgg7t7DuEQvSFT3jtX/aSDyIe
         VxrrZwoxLKISMvguKHOcaEM4+CCU116RX11Yaa8+e3R5QgH9C8O9OQ7c+/m3zFXZyxgX
         RAoLZeIBLvVaDVvSoB3vbPK9QRuXhUFNNwCSO0sEK7WGmIdMwHKArhAxy2JquL8dp/dV
         EPigg/JnUrBGmG8p90venlKH8yuM/H0DlwJkbaZj7C5OtZO62DXzNgkGpMJfYe3BiXXf
         fQGA==
X-Gm-Message-State: AGi0PuYQA7AOAGMy+ryWCzHMWK+sTRGmZPqfHcqUBmYTmgxLCCF+WFTA
        CQTiux3YNk7u8bBbB4VyZFw=
X-Google-Smtp-Source: APiQypIZ5bczAs5b3BcM33Bu0Vpgv9DZNtpC/AQksyT6FaiXp/A23KnVRftfTg7NFtDDLmzDC9g4fg==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr9069888ljm.58.1588543587180;
        Sun, 03 May 2020 15:06:27 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id 16sm6637433ljr.55.2020.05.03.15.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:06:26 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 1/3] media: ov6650: Fix set format try processing path
Date:   Mon,  4 May 2020 00:06:16 +0200
Message-Id: <20200503220618.27743-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200503220618.27743-1-jmkrzyszt@gmail.com>
References: <20200503220618.27743-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to subdevice interface specification found in V4L2 API
documentation, set format pad operations should not affect image
geometry set in preceding image processing steps. Unfortunately, that
requirement is not respected by the driver implementation of set format
as it was not the case when that code was still implementing a pair of
now obsolete .s_mbus_fmt() / .try_mbus_fmt() video operations before
they have been merged and reused as an implementation of .set_fmt() pad
operation by commit 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt
by set_fmt").

In case of set format active processing path the issue can be fixed
easily by excluding a call to set active selection from that path. That
will effectively limit frame size processing to optimal frame scaling
against active crop rectangle without touching it.  Users can just call
set active selection themselves to obtain desired frame size.  However,
set format try processing path needs more work.

First of all, the driver should be extended with set try selection
support.  Lack of it constraints video device drivers to not use
subdevice cropping at all while processing user requested active frame
size, otherwise their set try format results might differ from active.

Next, set format try processing path should use pad config crop
rectangle as a reference, not the active one as it does now.  That
issue can be resolved easily as soon as set try selection support is
added to the driver so pad config crop rectangle can be maintained by
users via selection API.

Last, set format try processing path should give the same results as
active in respect to active vs. pad config crop rectangle geometry.
Both rectangles should be either not touched by set format (that's what
we are going to achieve) or modified the same way, otherwise users
won't be able to obtain equal results from both paths while iterating
through set format and set selection operations in order to obtain
desired frame size.

We can't begin with modifying set format pad operation as not to touch
crop rectangle since that depends on availability of set try selection
for symmetry.  Neither can we begin with adding set try selection since
that in turn depends on equal handling of active and pad config crop
rectangles by set format.  We can either implement all required
modifications in a single patch, or begin with fixing current set
format try processing path to appropriately handle pad config crop
rectangle.  This patch implements the latter approach as believed to
be more readable.

Move crop rectangle adjustments code from a helper (the former
implementation of .s_fmt(), now called from set format active
processing path) to the body of set format pad operation function
where it can be also used for processing try requests for symmetry with
active ones.  As the helper no longer processes frame geometry, only
frame format and half scaling, simplify its API accordingly and update
its users.

Moreover, extract code that applies crop rectangle hardware limits
(now a part of .set_selection() operation which is called from set
format active processing path) to a new helper and call that helper
from set format try processing path as well for symmetry with active.

Fixes: 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt by set_fmt")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 83 ++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 91906b94f978..c0ac3d0ae167 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -491,6 +491,17 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
+static void ov6650_bind_align_crop_rectangle(struct v4l2_rect *rect)
+{
+	v4l_bound_align_image(&rect->width, 2, W_CIF, 1,
+			      &rect->height, 2, H_CIF, 1, 0);
+	v4l_bound_align_image(&rect->left, DEF_HSTRT << 1,
+			      (DEF_HSTRT << 1) + W_CIF - (__s32)rect->width, 1,
+			      &rect->top, DEF_VSTRT << 1,
+			      (DEF_VSTRT << 1) + H_CIF - (__s32)rect->height,
+			      1, 0);
+}
+
 static int ov6650_set_selection(struct v4l2_subdev *sd,
 		struct v4l2_subdev_pad_config *cfg,
 		struct v4l2_subdev_selection *sel)
@@ -503,13 +514,7 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 	    sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	v4l_bound_align_image(&sel->r.width, 2, W_CIF, 1,
-			      &sel->r.height, 2, H_CIF, 1, 0);
-	v4l_bound_align_image(&sel->r.left, DEF_HSTRT << 1,
-			      (DEF_HSTRT << 1) + W_CIF - (__s32)sel->r.width, 1,
-			      &sel->r.top, DEF_VSTRT << 1,
-			      (DEF_VSTRT << 1) + H_CIF - (__s32)sel->r.height,
-			      1, 0);
+	ov6650_bind_align_crop_rectangle(&sel->r);
 
 	ret = ov6650_reg_write(client, REG_HSTRT, sel->r.left >> 1);
 	if (!ret) {
@@ -570,22 +575,10 @@ static bool is_unscaled_ok(int width, int height, struct v4l2_rect *rect)
 #define to_clkrc(div)	((div) - 1)
 
 /* set the format we will capture in */
-static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
+static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool half_scale)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	bool half_scale = !is_unscaled_ok(mf->width, mf->height, &priv->rect);
-	struct v4l2_subdev_selection sel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP,
-		.r.left = priv->rect.left + (priv->rect.width >> 1) -
-			(mf->width >> (1 - half_scale)),
-		.r.top = priv->rect.top + (priv->rect.height >> 1) -
-			(mf->height >> (1 - half_scale)),
-		.r.width = mf->width << half_scale,
-		.r.height = mf->height << half_scale,
-	};
-	u32 code = mf->code;
 	u8 coma_set = 0, coma_mask = 0, coml_set, coml_mask;
 	int ret;
 
@@ -653,9 +646,7 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 		coma_mask |= COMA_QCIF;
 	}
 
-	ret = ov6650_set_selection(sd, NULL, &sel);
-	if (!ret)
-		ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
+	ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
 	if (!ret) {
 		priv->half_scale = half_scale;
 
@@ -674,14 +665,16 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf = &format->format;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
+	struct v4l2_subdev_selection sel = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.target = V4L2_SEL_TGT_CROP,
+	};
+	struct v4l2_rect *crop = &sel.r;
+	bool half_scale;
 
 	if (format->pad)
 		return -EINVAL;
 
-	if (is_unscaled_ok(mf->width, mf->height, &priv->rect))
-		v4l_bound_align_image(&mf->width, 2, W_CIF, 1,
-				&mf->height, 2, H_CIF, 1, 0);
-
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		mf->code = MEDIA_BUS_FMT_Y8_1X8;
@@ -699,10 +692,24 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
+	*crop = priv->rect;
+	half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
+
+	/* adjust new crop rectangle position against its current center */
+	crop->left += (crop->width - (mf->width << half_scale)) / 2;
+	crop->top += (crop->height - (mf->height << half_scale)) / 2;
+	/* adjust new crop rectangle size */
+	crop->width = mf->width << half_scale;
+	crop->height = mf->height << half_scale;
+
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		/* store media bus format code and frame size in pad config */
-		cfg->try_fmt.width = mf->width;
-		cfg->try_fmt.height = mf->height;
+		/* store new crop rectangle, hadware bound, in pad config */
+		ov6650_bind_align_crop_rectangle(crop);
+		cfg->try_crop = *crop;
+
+		/* store new mbus frame format code and size in pad config */
+		cfg->try_fmt.width = crop->width >> half_scale;
+		cfg->try_fmt.height = crop->height >> half_scale;
 		cfg->try_fmt.code = mf->code;
 
 		/* return default mbus frame format updated with pad config */
@@ -712,9 +719,16 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		mf->code = cfg->try_fmt.code;
 
 	} else {
-		/* apply new media bus format code and frame size */
-		int ret = ov6650_s_fmt(sd, mf);
+		int ret;
 
+		/* apply new crop rectangle */
+		ret = ov6650_set_selection(sd, NULL, &sel);
+		if (ret)
+			return ret;
+
+		/* apply new media bus frame format and scaling if changed */
+		if (mf->code != priv->code || half_scale != priv->half_scale)
+			ret = ov6650_s_fmt(sd, mf->code, half_scale);
 		if (ret)
 			return ret;
 
@@ -890,9 +904,8 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	if (!ret)
 		ret = ov6650_prog_dflt(client, xclk->clkrc);
 	if (!ret) {
-		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
-
-		ret = ov6650_s_fmt(sd, &mf);
+		/* driver default frame format, no scaling */
+		ret = ov6650_s_fmt(sd, ov6650_def_fmt.code, false);
 	}
 	if (!ret)
 		ret = v4l2_ctrl_handler_setup(&priv->hdl);
-- 
2.24.1

