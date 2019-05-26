Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401102AC32
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 22:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfEZUsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 16:48:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45381 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfEZUsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 16:48:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id r76so2120651lja.12;
        Sun, 26 May 2019 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yx1xMRaM6E8Nc7cDm7I5aJSojnIVrzlfHniVdC7mgZM=;
        b=NaSCG09kgCfM525wIDxNzdNP3ZIh9qVU2HoElxhryrOQR7JhlzBSF3mhGMRinPGEYo
         pUk/bGXnkU0R66MZx9ygsUje+oeCntM78jvBDHsz0C0ylujt8utOk0aDFetJDZHmTIqs
         fvaQQRIEZfixaH34rsX24HXFxHzG8q8Nv7MOrszyN7DNgoMDNNmq+LxgO9xhmOes82Yh
         13lEZjE/hEq87YWyyWR/W+Nb4fNWbTMWMnvJu9N0PwDZyMKbNa0NgZYkIAsWETA+cWEu
         /9KdITGQ0DJJ+6cheBvuaT/YOxdA9BpD+FdzhFrVf2Ul4NF8qoytNKRcpaS9U9K5WBiQ
         9Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yx1xMRaM6E8Nc7cDm7I5aJSojnIVrzlfHniVdC7mgZM=;
        b=pC6BABpnrpQCcaVNpDESY3CEnqI5JgQ5WNcW5GI5KJcSe2oGVXWDqFJLdRUU0jN8Zu
         yymKOFWXkBzR0NRDhMLrCFPQDwX1NGDGDqwYukAkXlEsPsEN9HMB/12aVJa8KF6oDgZ7
         x+7kPYYQJoYoizEoZjXasHCgOQm1uZl2jx5lohuPTivVDORyB0L0uCFDkFWCqbWRpYQc
         z8QH4F9ZqpGvwYTX/DBLzITzIVw7kBQRkfkAsf6JqTxuBRTKMeZQqwUwlJmuxhSA2dbg
         fcpnXgMBO+O/oCs8G71j/z7bPTJTiFCH6owyMnK8AHhZd/lUCKfOKtkB6U9WFEMXo5fg
         k6Ug==
X-Gm-Message-State: APjAAAWmXFUQpt/8ag2jwlfiL44gHWseNJI6NwvTl24Jx+WC9e+h/EiL
        M57UyIMLmHd3I8YLJ3MP6Ac=
X-Google-Smtp-Source: APXvYqy4K3OXlf0fm1AbMZwyV7Raqtcu50PZoucXv9BRVqbBfKcd7S1k1c+cjzyNhauyNYUmrHOzTQ==
X-Received: by 2002:a2e:960e:: with SMTP id v14mr7851486ljh.31.1558903693154;
        Sun, 26 May 2019 13:48:13 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id i187sm1859475lfe.64.2019.05.26.13.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 May 2019 13:48:12 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH 2/5] media: ov6650: Refactor ov6650_s_fmt() helper
Date:   Sun, 26 May 2019 22:47:55 +0200
Message-Id: <20190526204758.1904-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190526204758.1904-1-jmkrzyszt@gmail.com>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver suffers from a few compliance and implementation issues:
- crop rectangle is affected by .set_fmt() pad operation callback,
- frame scaling is not reset on modification of crop rectangle,
- V4L2_SUBDEV_FORMAT_TRY support in .set_fmt() uses active crop
  rectangle, not the one from a pad config, as a reference.

For easy resolution of those issues, ov6650_s_fmt() will first be
refactored.

The ov6650_s_fmt() helper function, mostly called form .set_fmt() pad
operation callback, now takes a decision if half scaling is applicable
for current crop rectangle and requested frame size, then possibly
adjusts hardware crop settings, frame scaling and media bus frame
format.  It accepts a struct v4l2_mbus_framefmt argument passed by a
user to .set_fmt().

Move the decision on applicability of half scaling up to .set_fmt(),
then modify the ov6650_s_fmt() API so it accepts a half scaling flag.
In order to avoid passing full struct v4l2_mbus_framefmt argument to it
when called from functions other than .set_fmt(), also accept a target
pixel code as an argument and make the struct v4l2_mbus_framefmt used
for crop rectangle modification optional.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 1b02479b616f..8cb30f3e4851 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -570,25 +570,18 @@ static u8 to_clkrc(struct v4l2_fract *timeperframe,
 }
 
 /* set the format we will capture in */
-static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
+static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf,
+			u32 code, bool half_scale)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	bool half_scale = !is_unscaled_ok(mf->width, mf->height, &priv->rect);
 	struct v4l2_subdev_selection sel = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.target = V4L2_SEL_TGT_CROP,
-		.r.left = priv->rect.left + (priv->rect.width >> 1) -
-			(mf->width >> (1 - half_scale)),
-		.r.top = priv->rect.top + (priv->rect.height >> 1) -
-			(mf->height >> (1 - half_scale)),
-		.r.width = mf->width << half_scale,
-		.r.height = mf->height << half_scale,
 	};
-	u32 code = mf->code;
 	unsigned long mclk, pclk;
 	u8 coma_set = 0, coma_mask = 0, coml_set, coml_mask, clkrc;
-	int ret;
+	int ret = 0;
 
 	/* select color matrix configuration for given color encoding */
 	switch (code) {
@@ -668,7 +661,16 @@ static int ov6650_s_fmt(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *mf)
 	dev_dbg(&client->dev, "pixel clock divider: %ld.%ld\n",
 			mclk / pclk, 10 * mclk % pclk / pclk);
 
-	ret = ov6650_set_selection(sd, NULL, &sel);
+	if (mf) {
+		sel.r.left = priv->rect.left + (priv->rect.width >> 1) -
+			(mf->width >> (1 - half_scale)),
+		sel.r.top = priv->rect.top + (priv->rect.height >> 1) -
+			(mf->height >> (1 - half_scale)),
+		sel.r.width = mf->width << half_scale,
+		sel.r.height = mf->height << half_scale,
+
+		ret = ov6650_set_selection(sd, NULL, &sel);
+	}
 	if (!ret)
 		ret = ov6650_reg_rmw(client, REG_COMA, coma_set, coma_mask);
 	if (!ret)
@@ -691,11 +693,14 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf = &format->format;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
+	bool half_scale;
 
 	if (format->pad)
 		return -EINVAL;
 
-	if (is_unscaled_ok(mf->width, mf->height, &priv->rect))
+	half_scale = !is_unscaled_ok(mf->width, mf->height, &priv->rect);
+
+	if (!half_scale)
 		v4l_bound_align_image(&mf->width, 2, W_CIF, 1,
 				&mf->height, 2, H_CIF, 1, 0);
 
@@ -730,7 +735,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 
 	} else {
 		/* apply new media bus format code and frame size */
-		int ret = ov6650_s_fmt(sd, mf);
+		int ret = ov6650_s_fmt(sd, mf, mf->code, half_scale);
 
 		if (ret)
 			return ret;
@@ -885,11 +890,8 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	ret = ov6650_reset(client);
 	if (!ret)
 		ret = ov6650_prog_dflt(client);
-	if (!ret) {
-		struct v4l2_mbus_framefmt mf = ov6650_def_fmt;
-
-		ret = ov6650_s_fmt(sd, &mf);
-	}
+	if (!ret)
+		ret = ov6650_s_fmt(sd, NULL, ov6650_def_fmt.code, false);
 	if (!ret)
 		ret = v4l2_ctrl_handler_setup(&priv->hdl);
 
-- 
2.21.0

