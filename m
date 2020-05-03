Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C541C2FE0
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgECWGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729114AbgECWGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:06:30 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C87C061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:06:30 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id l11so8084190lfc.5
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zoml5Tpw0YFJPt4sw6pGgXfydvrJQLxIDNIKcMtfsDE=;
        b=FbO0G90K7lbHuqOTHgSd5KSBhbeuQphdMHFC01oMKIAQnmSQAnGvai8kLTwmZgZm8L
         hex56op1X73HpI3BqEMjOaFNeDdP4tZOhKMeTSqxlYtytlTtli1ygO3mWsKZ7D/jFRBw
         zc4mA8guHSjOmdsypAe2YgeHeOWVVYnhHgafm2GGNJxI6C32n+n13VGBuOS+yy8xc77j
         vj1TwOFv4MafFrhUzC1mELA+61kL9BpSQ94pihXPAPAYO6wRdYAPCBNMRmt+31nQThxk
         uoeDB2LLcmlXOpUMsYIJnBhxihdAHPNgy1LC7YD4r7WtkAeIxP9cFYQvLc4p6FvXwfsd
         TEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zoml5Tpw0YFJPt4sw6pGgXfydvrJQLxIDNIKcMtfsDE=;
        b=hSOAOcedCcMWZ6O9rXfIiy1D6IHS6onrGcJnpEXAzM49cEtb4A5DFfvn94JRuolezY
         eB+hDDK39j5ADVQZKuQF98gr8o/t0j2QzLWhZXGZ1u6Uc7zc3FvvIktbUgmmaf3kGKt/
         g5lB9SNkMefY2oUguyPYybEo233wZtdYJ+i79xayBdaiCzzqsIA50PPtiMyA6aTEKhQn
         ju7F4CX1TMjSvszsg6O5eDEB9FxAwzFKpQn0shjUq32ZXHMSuvPjxH+VN+jCdeHo6Vmd
         4+04pkWoq1MatLov6yf/Hoz6IkPrtuCu4g4G50xYn/Fo5wZX13T3fltHzhrkbe0Y0prf
         7zWw==
X-Gm-Message-State: AGi0PubyHE3Xm5SRvKEPN15cD52e82uQ8VgnQl/J053Kbkg5Zovzi2P1
        9OTNO+MrSilLuvBijxbJwTHy4cMucwRkPg==
X-Google-Smtp-Source: APiQypL5/0PBL788xGmMYVnZFul9tAg4JWHY2FXBZLggPFgqwL10hZnb1q9zpDnnvUKZUqfPmXcdqQ==
X-Received: by 2002:a19:2389:: with SMTP id j131mr9887872lfj.116.1588543588605;
        Sun, 03 May 2020 15:06:28 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id 16sm6637433ljr.55.2020.05.03.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:06:27 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 2/3] media: ov6650: Add try support to selection API operations
Date:   Mon,  4 May 2020 00:06:17 +0200
Message-Id: <20200503220618.27743-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200503220618.27743-1-jmkrzyszt@gmail.com>
References: <20200503220618.27743-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Try requests are now only supported by format processing pad operations
implemented by the driver.  The driver selection API operations
currently respond to them with -EINVAL.  While that is correct, it
constraints video device drivers to not use subdevice cropping at all
while processing user requested active frame size, otherwise their set
try format results might differ from active.  As a consequence, we
can't fix set format pad operation as not to touch crop rectangle since
that would affect users not being able to set arbitrary frame sizes.
Moreover, without a working set try selection support we are not able
to use pad config crop rectangle as a reference while processing set
try format requests.

Implement missing try selection support.  Moreover, as it will be now
possible to maintain the pad config crop rectangle via selection API,
start using it instead of the active one as a reference while
processing set try format requests.

is_unscaled_ok() helper, now also called from set selection operation,
has been just moved up in the source file to avoid a prototype, with no
functional changes.

Fixes: 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt by set_fmt")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 54 ++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index c0ac3d0ae167..65701f2c7c7c 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -472,9 +472,16 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
+	struct v4l2_rect *rect;
 
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+		/* pre-select try crop rectangle */
+		rect = &cfg->try_crop;
+
+	} else {
+		/* pre-select active crop rectangle */
+		rect = &priv->rect;
+	}
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
@@ -483,14 +490,22 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 		sel->r.width = W_CIF;
 		sel->r.height = H_CIF;
 		return 0;
+
 	case V4L2_SEL_TGT_CROP:
-		sel->r = priv->rect;
+		/* use selected crop rectangle */
+		sel->r = *rect;
 		return 0;
+
 	default:
 		return -EINVAL;
 	}
 }
 
+static bool is_unscaled_ok(int width, int height, struct v4l2_rect *rect)
+{
+	return width > rect->width >> 1 || height > rect->height >> 1;
+}
+
 static void ov6650_bind_align_crop_rectangle(struct v4l2_rect *rect)
 {
 	v4l_bound_align_image(&rect->width, 2, W_CIF, 1,
@@ -510,12 +525,30 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 	struct ov6650 *priv = to_ov6650(client);
 	int ret;
 
-	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
-	    sel->target != V4L2_SEL_TGT_CROP)
+	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	ov6650_bind_align_crop_rectangle(&sel->r);
 
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_rect *crop = &cfg->try_crop;
+		struct v4l2_mbus_framefmt *mf = &cfg->try_fmt;
+		/* detect current pad config scaling factor */
+		bool half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
+
+		/* store new crop rectangle */
+		*crop = sel->r;
+
+		/* adjust frame size */
+		mf->width = crop->width >> half_scale;
+		mf->height = crop->height >> half_scale;
+
+		return 0;
+	}
+
+	/* V4L2_SUBDEV_FORMAT_ACTIVE */
+
+	/* apply new crop rectangle */
 	ret = ov6650_reg_write(client, REG_HSTRT, sel->r.left >> 1);
 	if (!ret) {
 		priv->rect.width += priv->rect.left - sel->r.left;
@@ -567,11 +600,6 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static bool is_unscaled_ok(int width, int height, struct v4l2_rect *rect)
-{
-	return width > rect->width >> 1 || height > rect->height >> 1;
-}
-
 #define to_clkrc(div)	((div) - 1)
 
 /* set the format we will capture in */
@@ -692,7 +720,11 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		break;
 	}
 
-	*crop = priv->rect;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		*crop = cfg->try_crop;
+	else
+		*crop = priv->rect;
+
 	half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
 
 	/* adjust new crop rectangle position against its current center */
-- 
2.24.1

