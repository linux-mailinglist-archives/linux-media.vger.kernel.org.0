Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C59658D2D
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 14:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbiL2Nct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Dec 2022 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbiL2NcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Dec 2022 08:32:24 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF7410B7C;
        Thu, 29 Dec 2022 05:32:22 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id A3C99FF80C;
        Thu, 29 Dec 2022 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1672320740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uMOVBX3i9Yuq+qWsthZ7lJRlX6Tmhuu9D40yhVIKTe8=;
        b=gpOKnj0cbMg9uHqbVR2BZj5Zebutn9YUgn6njDrRiHuDZ8tTb4iqgGdI/+85Mjt3w1Ko5/
        BjP8ed0YIBmvzyRCfCyONj8SzY87aigc6gE3AMBKN1kSAjKnNIOkRGwKXk6WjwCOvv0oBz
        EqQTp1ZI3YVyjJewmBXZQDCCQCwc0KP9lfIPf30hLgVq34EtinaORc2Q8P6yfkqY3yh/0Y
        TYHSb4A9YXv4FMgVdOMNkKJnf5iamWgcY78/jq6AsNTqS0mclqkCaGJYiU9OaznQXhXcAQ
        zJPixISHFXSYahpKqS3WYIfcfFiw6essspVcQjgpcI+uoSwDdS4RgOY/oIQkxA==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v3 03/21] staging: media: tegra-video: fix .vidioc_enum_fmt_vid_cap to return all formats
Date:   Thu, 29 Dec 2022 14:31:47 +0100
Message-Id: <20221229133205.981397-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .vidioc_enum_fmt_vid_cap (called tegra_channel_enum_format() here)
should return all the supported formats. Instead the current implementation
computes the intersection between the formats it supports and those
supported by the first subdev in the stream (typically the image sensor).

Remove all the unnecessary logic that supports such algorithm. In order to
do this, also change the Tegra210 CSI TPG formats from the current
open-coded implementation in vi_tpg_fmts_bitmap_init() to a const array in
tegra210.c, just like the one that describes the regular formats.

Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/tegra210.c |   7 +-
 drivers/staging/media/tegra-video/vi.c       | 103 +------------------
 drivers/staging/media/tegra-video/vi.h       |   4 -
 3 files changed, 9 insertions(+), 105 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index d58370a84737..eb19dd5107ce 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -683,8 +683,12 @@ enum tegra210_image_format {
 	V4L2_PIX_FMT_##FOURCC,						\
 }
 
-/* Tegra210 supported video formats */
 static const struct tegra_video_format tegra210_video_formats[] = {
+#if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
+	/* VI only support 2 formats in TPG mode */
+	TEGRA210_VIDEO_FMT(RAW10,  10, SRGGB10_1X10,      2, T_R16_I,    SRGGB10),
+	TEGRA210_VIDEO_FMT(RGB888, 24, RGB888_1X32_PADHI, 4, T_A8B8G8R8, RGBX32),
+#else
 	/* RAW 8 */
 	TEGRA210_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
 	TEGRA210_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
@@ -714,6 +718,7 @@ static const struct tegra_video_format tegra210_video_formats[] = {
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, T_V8_Y8__U8_Y8, YUYV),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, T_Y8_U8__Y8_V8, VYUY),
 	TEGRA210_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, T_Y8_V8__Y8_U8, UYVY),
+#endif
 };
 
 /* Tegra210 VI operations */
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 11dd142c98c5..9dba6e97ebdd 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
  */
 
-#include <linux/bitmap.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/host1x.h>
@@ -73,15 +72,6 @@ static int tegra_get_format_idx_by_code(struct tegra_vi *vi,
 	return -1;
 }
 
-static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
-					  unsigned int index)
-{
-	if (index >= vi->soc->nformats)
-		return -EINVAL;
-
-	return vi->soc->video_formats[index].fourcc;
-}
-
 static const struct tegra_video_format *
 tegra_get_format_by_fourcc(struct tegra_vi *vi, u32 fourcc)
 {
@@ -430,19 +420,12 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
-	unsigned int index = 0, i;
-	unsigned long *fmts_bitmap = chan->tpg_fmts_bitmap;
-
-	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
-		fmts_bitmap = chan->fmts_bitmap;
+	const struct tegra_vi_soc *soc = chan->vi->soc;
 
-	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
+	if (f->index >= soc->nformats)
 		return -EINVAL;
 
-	for (i = 0; i < f->index + 1; i++, index++)
-		index = find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index);
-
-	f->pixelformat = tegra_get_format_fourcc_by_idx(chan->vi, index - 1);
+	f->pixelformat = soc->video_formats[f->index].fourcc;
 
 	return 0;
 }
@@ -1059,78 +1042,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	return 0;
 }
 
-/* VI only support 2 formats in TPG mode */
-static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index;
-
-	bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-
-	index = tegra_get_format_idx_by_code(chan->vi,
-					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
-					     0);
-	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
-}
-
-static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
-{
-	int index, ret, match_code = 0;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-
-	bitmap_zero(chan->fmts_bitmap, MAX_FORMAT_NUM);
-
-	/*
-	 * Set the bitmap bits based on all the matched formats between the
-	 * available media bus formats of sub-device and the pre-defined Tegra
-	 * supported video formats.
-	 */
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	while (1) {
-		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-				       NULL, &code);
-		if (ret < 0)
-			break;
-
-		index = tegra_get_format_idx_by_code(chan->vi, code.code, 0);
-		while (index >= 0) {
-			bitmap_set(chan->fmts_bitmap, index, 1);
-			if (!match_code)
-				match_code = code.code;
-			/* look for other formats with same mbus code */
-			index = tegra_get_format_idx_by_code(chan->vi,
-							     code.code,
-							     index + 1);
-		}
-
-		code.index++;
-	}
-
-	/*
-	 * Set the bitmap bit corresponding to default tegra video format if
-	 * there are no matched formats.
-	 */
-	if (!match_code) {
-		match_code = tegra_default_format.code;
-		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
-		if (WARN_ON(index < 0))
-			return -EINVAL;
-
-		bitmap_set(chan->fmts_bitmap, index, 1);
-	}
-
-	/* initialize channel format to the sub-device active format */
-	tegra_channel_set_subdev_active_fmt(chan);
-
-	return 0;
-}
-
 static void tegra_channel_host1x_syncpts_free(struct tegra_vi_channel *chan)
 {
 	int i;
@@ -1501,7 +1412,6 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid)
 			goto cleanup;
 
 		v4l2_set_subdev_hostdata(&csi_chan->subdev, vi_chan);
-		vi_tpg_fmts_bitmap_init(vi_chan);
 		csi_chan = list_next_entry(csi_chan, list);
 	}
 
@@ -1721,13 +1631,6 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 		goto unregister_video;
 	}
 
-	ret = vi_fmts_bitmap_init(chan);
-	if (ret < 0) {
-		dev_err(vi->dev,
-			"failed to initialize formats bitmap: %d\n", ret);
-		goto unregister_video;
-	}
-
 	subdev = tegra_channel_get_remote_csi_subdev(chan);
 	if (!subdev) {
 		ret = -ENODEV;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index a68e2c02c7b0..183796c8a46a 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -163,8 +163,6 @@ struct tegra_vi_graph_entity {
  *
  * @ctrl_handler: V4L2 control handler of this video channel
  * @syncpt_timeout_retry: syncpt timeout retry count for the capture
- * @fmts_bitmap: a bitmap for supported formats matching v4l2 subdev formats
- * @tpg_fmts_bitmap: a bitmap for supported TPG formats
  * @pg_mode: test pattern generator mode (disabled/direct/patch)
  * @notifier: V4L2 asynchronous subdevs notifier
  */
@@ -205,8 +203,6 @@ struct tegra_vi_channel {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	unsigned int syncpt_timeout_retry;
-	DECLARE_BITMAP(fmts_bitmap, MAX_FORMAT_NUM);
-	DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
 	enum tegra_vi_pg_mode pg_mode;
 
 	struct v4l2_async_notifier notifier;
-- 
2.34.1

