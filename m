Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB45E2AC2D
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 22:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfEZUsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 16:48:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42922 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfEZUsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 16:48:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so10562112lfh.9;
        Sun, 26 May 2019 13:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U0IfYdmtpVovrAyM/FdLov7do6Ak4PuwSIViICDb5F4=;
        b=p22jOLCuVZ+qXsuY7U1ysdkCSJg+JRnmU5odVwYC1M1ce7Xx8fCa3VXBzJX2MqFQdR
         699Y3L8F1feuK1SNnCzSLqCH/sovq4a2OmwRM5CCp/JTn6DxlNQEhJXYRVq22r8Dvmxl
         rSQDCeIbyTUniqerCO1Zd4XiDWWPPQ1YCld9TgpyTdflQHwW1nYL1N5fQu3kKqH18P9y
         IUfLIkSZkPZ0Cc23NqfAtWxuXL0w4z/KPU4/RWLqA+WLKKUL9OIgdgmEjOYq9OaL6O3c
         DSU3tzI4HRuCSwoKgAMnBqztZFGPNMmRWVxrPqK2RTUrFtUedW/WtH8HSSe883dRGiDe
         TLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U0IfYdmtpVovrAyM/FdLov7do6Ak4PuwSIViICDb5F4=;
        b=qLB5Jqx7FxkVnjnWo4kXl7k8tfL7ex8lnpSgCBBQ9uBLIofFEZULCQX/PD7ru3FX0G
         q9HqQ+5IPUSXPitNjpUwq3sLg3nclyLgGr6dzZEj8OW8TwlxurT7YJrmW9vElly+RhEp
         5mceQ/fWwRFzhhm8evaICXCgWaCzXTEpZ8k+NPuihHxehQszJPnxy65FA6vo/ds5AEPj
         9nq5bR4ZKwjahtqS2jt6kTPHimP15QwMA1myLC0KRZas2K/FcVwkF0GLgcZtJP78HwGt
         5iFQ3yEBLnZHCS7SadbQ2VvGNN/HuJz7uSgVbxnUEnsKyGsArECqcIhW4MaYLNqZPPmO
         nGKg==
X-Gm-Message-State: APjAAAXpQRZf/cG07dwzZmWPEKMZWhbafjfA/YgtyPcI6hDgNvdRJ128
        9j/lWttgqWfmRfJH1fExiw8=
X-Google-Smtp-Source: APXvYqz/yzgw1Vxskxu3LN3jWegAz0RuH7Ph8emqaSgldOaz7ANsn5hKN9GEIs5hbERzBQ9Z2YPcvA==
X-Received: by 2002:a05:6512:6c:: with SMTP id i12mr39405009lfo.130.1558903694657;
        Sun, 26 May 2019 13:48:14 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id i187sm1859475lfe.64.2019.05.26.13.48.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 13:48:14 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 3/5] media: ov6650: Fix active crop rectangle affected by .set_fmt()
Date:   Sun, 26 May 2019 22:47:56 +0200
Message-Id: <20190526204758.1904-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526204758.1904-1-jmkrzyszt@gmail.com>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to subdevice interface specification found in V4L2 API
documentation, .set_fmt() pad operation callback should not affect
image geometry set in preceding image processing steps. Unfortunately,
ov6650_s_fmt() helper, when called from .set_fmt() with new user
requested frame size passed to it, does not respect that requirement
as that was not the case before, when the helper was still called from
.mbus_set_fmt() video operation callback.

Remmove a call to .set_selection() from ov6650_s_fmt() helper so it no
longer modifies the active crop rectangle and simplify its API by
removing no longer needed struct v4l2_mbus_framefmt argument.  For
consistency of its results with active format processing, also update
try format path inside .set_fmt() (still using active crop rectangle as
a reference instead of the try one from pad config which is not yet
maintained by the driver).

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 8cb30f3e4851..47590cd51190 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -570,15 +570,10 @@ static u8 to_clkrc(struct v4l2_fract *timeperframe,
 }
 
 /* set the format we will capture in */
-static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf,
-			u32 code, bool half_scale)
+static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool half_scale)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	struct v4l2_subdev_selection sel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP,
-	};
 	unsigned long mclk, pclk;
 	u8 coma_set = 0, coma_mask = 0, coml_set, coml_mask, clkrc;
 	int ret = 0;
@@ -661,18 +656,7 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf,
 	dev_dbg(&client->dev, "pixel clock divider: %ld.%ld\n",
 			mclk / pclk, 10 * mclk % pclk / pclk);
 
-	if (mf) {
-		sel.r.left = priv->rect.left + (priv->rect.width >> 1) -
-			(mf->width >> (1 - half_scale)),
-		sel.r.top = priv->rect.top + (priv->rect.height >> 1) -
-			(mf->height >> (1 - half_scale)),
-		sel.r.width = mf->width << half_scale,
-		sel.r.height = mf->height << half_scale,
-
-		ret = ov6650_set_selection(sd, NULL, &sel);
-	}
-	if (!ret)
-		ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
+	ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
 	if (!ret)
 		ret = ov6650_reg_write(client, REG_CLKRC, clkrc);
 	if (!ret) {
@@ -700,10 +684,6 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 
 	half_scale = !is_unscaled_ok(mf->width, mf->height, &priv->rect);
 
-	if (!half_scale)
-		v4l_bound_align_image(&mf->width, 2, W_CIF, 1,
-				&mf->height, 2, H_CIF, 1, 0);
-
 	switch (mf->code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		mf->code = MEDIA_BUS_FMT_Y8_1X8;
@@ -723,8 +703,8 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		/* store media bus format code and frame size in pad config */
-		cfg->try_fmt.width = mf->width;
-		cfg->try_fmt.height = mf->height;
+		cfg->try_fmt.width = priv->rect.width >> half_scale;
+		cfg->try_fmt.height = priv->rect.height >> half_scale;
 		cfg->try_fmt.code = mf->code;
 
 		/* return default mbus frame format updated with pad config */
@@ -735,7 +715,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 
 	} else {
 		/* apply new media bus format code and frame size */
-		int ret = ov6650_s_fmt(sd, mf, mf->code, half_scale);
+		int ret = ov6650_s_fmt(sd, mf->code, half_scale);
 
 		if (ret)
 			return ret;
@@ -891,7 +871,7 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	if (!ret)
 		ret = ov6650_prog_dflt(client);
 	if (!ret)
-		ret = ov6650_s_fmt(sd, NULL, ov6650_def_fmt.code, false);
+		ret = ov6650_s_fmt(sd, ov6650_def_fmt.code, false);
 	if (!ret)
 		ret = v4l2_ctrl_handler_setup(&priv->hdl);
 
-- 
2.21.0

