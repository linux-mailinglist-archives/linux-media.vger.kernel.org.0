Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF80258D74
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 13:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgIALbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 07:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgIAL1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 07:27:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D932C061251
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 04:16:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 31A58299038
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v4 04/10] media: staging: rkisp1: don't support bayer format on selfpath resizer
Date:   Tue,  1 Sep 2020 13:16:06 +0200
Message-Id: <20200901111612.10552-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The selfpath capture does not support bayer formats.
Therefore there is no reason to support bayer formats
on the selfpath resizer. The selfpath resizer should
support only MEDIA_BUS_FMT_YUYV8_2X8.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c |  7 -------
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 022b8eeed426..22da94a9baf1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1186,13 +1186,6 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 	struct v4l2_subdev_format sd_fmt;
 	int ret;
 
-	if (cap->id == RKISP1_SELFPATH &&
-	    isp->src_fmt->mbus_code != MEDIA_BUS_FMT_YUYV8_2X8) {
-		dev_err(cap->rkisp1->dev,
-			"selfpath only supports MEDIA_BUS_FMT_YUYV8_2X8\n");
-		return -EPIPE;
-	}
-
 	if (cap_pix_enc != isp_pix_enc &&
 	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
 	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index c66d2a52fd71..066d22096a7d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -437,6 +437,13 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
 	u32 pad = code->pad;
 	int ret;
 
+	if (rsz->id == RKISP1_SELFPATH) {
+		if (code->index > 0)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_YUYV8_2X8;
+		return 0;
+	}
+
 	/* supported mbus codes are the same in isp video src pad */
 	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
 	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
@@ -540,7 +547,11 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
 	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
 					    which);
-	sink_fmt->code = format->code;
+	if (rsz->id == RKISP1_SELFPATH)
+		sink_fmt->code = MEDIA_BUS_FMT_YUYV8_2X8;
+	else
+		sink_fmt->code = format->code;
+
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
 		sink_fmt->code = RKISP1_DEF_FMT;
-- 
2.17.1

