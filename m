Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9FA5F8D39
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 20:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiJIShK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 14:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiJIShI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 14:37:08 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41198255BC
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 11:37:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id u21so13239178edi.9
        for <linux-media@vger.kernel.org>; Sun, 09 Oct 2022 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=650CKL7jG68nxDoInuvIIiaPVyoJzCbMNz5mJ0ac+VE=;
        b=NojZ7W8zUYaAv7hhoE0pihblpBiNN3GinDMXILUq+l5vUtfh3HRLyxT5zgRFUb4bx3
         iMqy4sb5UNOYch8UGSjgcDse7Eg68hV6K271G8xx/HpudIhrYfvXEXIW99SsWYTlTFmH
         Yk/SR8QL0aoH7tgdsMMjcvQgLtisAPvcAx74Jiovdnuwj+lzh6XDodk4ChlQ/bMN+t0W
         0HB8NQfsh2G8QfglaHx4auJb7dZfDGy6pDilcqra9oo7QW2F+suyvelBl+OloZAYgkTR
         +0q6Z10fc0zfRyhY8dHvO94O63qkI/pCXhodVcIoaO5zhjDrXIBA6EL8lUwU9n0/zwTQ
         pbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=650CKL7jG68nxDoInuvIIiaPVyoJzCbMNz5mJ0ac+VE=;
        b=BPAHoFImFrBjdcYq8TXT7VmHEHRgIeqGtofml0e/FSMc5ZVt5w03PJTGRXVThX+MhH
         JbKu5iLKH7bjjTjuJM2bHpvjVOxQSt+iqBQv32m7EE/qJUreFMyQSbNzKciOEFmsujlh
         bDqdIhEp59K1rESAd5gRnfb2LAK0SHZuNMcJzlHgCcns2HGQrUzq6+JflLXAnN3fv+hF
         vm8eMZvewT1gIRQnRO3X+aAhdxGNEVG2KZIZloEknpuA7zDMcfnZaLXIavExt17+USw6
         TzOMPFAFcD+gdA52RgF0s7hg8pn3rfY9/31HoB2YwqClpt1NZM9tuTWY12XA4GjwDO4j
         EbPQ==
X-Gm-Message-State: ACrzQf0KitQdj7as3Fs0E4tqeMepOy/DU1ami2/QAAkSRdDylFDjQdHV
        SCy1bnpKAY/3CKeDmzOftuokFweZRwO3M27m
X-Google-Smtp-Source: AMsMyM576NSLFz+53iRFUAcyFz0UAUhSIJniyx06ji7mx1LhHVM+xQehjTRfKJG9HKM6B15Jvxo1eA==
X-Received: by 2002:a05:6402:298d:b0:451:5fc5:d423 with SMTP id eq13-20020a056402298d00b004515fc5d423mr14260051edb.102.1665340624800;
        Sun, 09 Oct 2022 11:37:04 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id o14-20020a50fd8e000000b00459148fbb3csm5610050edt.86.2022.10.09.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:37:04 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: rcar-vin: Do not cache remote rectangle
Date:   Sun,  9 Oct 2022 20:35:49 +0200
Message-Id: <20221009183551.1664631-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
References: <20221009183551.1664631-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Prepare for scaling support in the media controller part of the driver
by not caching the remote rectangle. Mimic the omap3isp and look it up
each time it's needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 84 ++++++++++++++-----
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 -
 2 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 576059f9bbe3..a0b398aa2596 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -226,10 +226,10 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 	v4l2_fill_pix_format(&vin->format, &fmt.format);
 
-	vin->src_rect.top = 0;
-	vin->src_rect.left = 0;
-	vin->src_rect.width = vin->format.width;
-	vin->src_rect.height = vin->format.height;
+	vin->crop.top = 0;
+	vin->crop.left = 0;
+	vin->crop.width = vin->format.width;
+	vin->crop.height = vin->format.height;
 
 	/*  Make use of the hardware interlacer by default. */
 	if (vin->format.field == V4L2_FIELD_ALTERNATE) {
@@ -239,8 +239,6 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 	rvin_format_align(vin, &vin->format);
 
-	vin->crop = vin->src_rect;
-
 	vin->compose.top = 0;
 	vin->compose.left = 0;
 	vin->compose.width = vin->format.width;
@@ -349,7 +347,6 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 
 	v4l2_rect_map_inside(&vin->crop, &src_rect);
 	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
-	vin->src_rect = src_rect;
 
 	return 0;
 }
@@ -428,10 +425,57 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 	return -EINVAL;
 }
 
+static int rvin_remote_rectangle(struct rvin_dev *vin, struct v4l2_rect *rect)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *sd;
+	unsigned int index;
+	int ret;
+
+	if (vin->info->use_mc) {
+		struct media_pad *pad = media_pad_remote_pad_first(&vin->pad);
+
+		if (!pad)
+			return -EINVAL;
+
+		sd = media_entity_to_v4l2_subdev(pad->entity);
+		index = pad->index;
+	} else {
+		sd = vin_to_source(vin);
+		index = vin->parallel.source_pad;
+	}
+
+	fmt.pad = index;
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	rect->left = rect->top = 0;
+	rect->width = fmt.format.width;
+	rect->height = fmt.format.height;
+
+	if (fmt.format.field == V4L2_FIELD_ALTERNATE) {
+		switch (vin->format.field) {
+		case V4L2_FIELD_INTERLACED_TB:
+		case V4L2_FIELD_INTERLACED_BT:
+		case V4L2_FIELD_INTERLACED:
+		case V4L2_FIELD_SEQ_TB:
+		case V4L2_FIELD_SEQ_BT:
+			rect->height *= 2;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int rvin_g_selection(struct file *file, void *fh,
 			    struct v4l2_selection *s)
 {
 	struct rvin_dev *vin = video_drvdata(file);
+	int ret;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -439,9 +483,10 @@ static int rvin_g_selection(struct file *file, void *fh,
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		s->r.left = s->r.top = 0;
-		s->r.width = vin->src_rect.width;
-		s->r.height = vin->src_rect.height;
+		ret = rvin_remote_rectangle(vin, &s->r);
+		if (ret)
+			return ret;
+
 		break;
 	case V4L2_SEL_TGT_CROP:
 		s->r = vin->crop;
@@ -473,6 +518,7 @@ static int rvin_s_selection(struct file *file, void *fh,
 		.width = 6,
 		.height = 2,
 	};
+	int ret;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -482,23 +528,23 @@ static int rvin_s_selection(struct file *file, void *fh,
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP:
 		/* Can't crop outside of source input */
-		max_rect.top = max_rect.left = 0;
-		max_rect.width = vin->src_rect.width;
-		max_rect.height = vin->src_rect.height;
+		ret = rvin_remote_rectangle(vin, &max_rect);
+		if (ret)
+			return ret;
+
 		v4l2_rect_map_inside(&r, &max_rect);
 
-		v4l_bound_align_image(&r.width, 6, vin->src_rect.width, 0,
-				      &r.height, 2, vin->src_rect.height, 0, 0);
+		v4l_bound_align_image(&r.width, 6, max_rect.width, 0,
+				      &r.height, 2, max_rect.height, 0, 0);
 
-		r.top  = clamp_t(s32, r.top, 0,
-				 vin->src_rect.height - r.height);
-		r.left = clamp_t(s32, r.left, 0, vin->src_rect.width - r.width);
+		r.top  = clamp_t(s32, r.top, 0, max_rect.height - r.height);
+		r.left = clamp_t(s32, r.left, 0, max_rect.width - r.width);
 
 		vin->crop = s->r = r;
 
 		vin_dbg(vin, "Cropped %dx%d@%d:%d of %dx%d\n",
 			r.width, r.height, r.left, r.top,
-			vin->src_rect.width, vin->src_rect.height);
+			max_rect.width, max_rect.height);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		/* Make sure compose rect fits inside output format */
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 1f94589d9ef1..469c4aaf90e2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -203,7 +203,6 @@ struct rvin_info {
  *
  * @crop:		active cropping
  * @compose:		active composing
- * @src_rect:		active size of the video source
  * @std:		active video standard of the video source
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
@@ -247,7 +246,6 @@ struct rvin_dev {
 
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
-	struct v4l2_rect src_rect;
 	v4l2_std_id std;
 
 	unsigned int alpha;
-- 
2.37.3

