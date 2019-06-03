Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD34032E42
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfFCLJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:09:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60894 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbfFCLJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 07:09:54 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 506DF285165;
        Mon,  3 Jun 2019 12:09:52 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH RFC 4/6] media: cedrus: Prepare things to support !compound controls
Date:   Mon,  3 Jun 2019 13:09:44 +0200
Message-Id: <20190603110946.4952-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603110946.4952-1-boris.brezillon@collabora.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We are about to add a menu control, so let's make the code more generic
to support other control types.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 47 ++++++++++++---------
 drivers/staging/media/sunxi/cedrus/cedrus.h |  3 +-
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 370937edfc14..378032fe71f9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -29,44 +29,44 @@
 
 static const struct cedrus_control cedrus_controls[] = {
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_slice_params),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_slice_params),
 		.codec		= CEDRUS_CODEC_MPEG2,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
-		.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_quantization),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_mpeg2_quantization),
 		.codec		= CEDRUS_CODEC_MPEG2,
 		.required	= false,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_decode_params),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_decode_params),
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_slice_params),
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SPS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_sps),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SPS,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_sps),
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_PPS,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_pps),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_PPS,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_pps),
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
-		.id		= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
-		.elem_size	= sizeof(struct v4l2_ctrl_h264_scaling_matrix),
+		.cfg.id		= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+		.cfg.elem_size	= sizeof(struct v4l2_ctrl_h264_scaling_matrix),
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
@@ -106,12 +106,21 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
 		return -ENOMEM;
 
 	for (i = 0; i < CEDRUS_CONTROLS_COUNT; i++) {
-		struct v4l2_ctrl_config cfg = {};
+		const struct v4l2_ctrl_config *cfg = &cedrus_controls[i].cfg;
 
-		cfg.elem_size = cedrus_controls[i].elem_size;
-		cfg.id = cedrus_controls[i].id;
+		if (cfg->elem_size)
+			ctrl = v4l2_ctrl_new_custom(hdl, cfg, NULL);
+		else if (cfg->type == V4L2_CTRL_TYPE_MENU ||
+			   cfg->type == V4L2_CTRL_TYPE_INTEGER_MENU)
+			ctrl = v4l2_ctrl_new_std_menu(hdl, NULL,
+						      cfg->id, cfg->max,
+						      cfg->menu_skip_mask,
+						      cfg->def);
+		else
+			ctrl = v4l2_ctrl_new_std(hdl, NULL, cfg->id, cfg->min,
+						 cfg->max, cfg->step,
+						 cfg->def);
 
-		ctrl = v4l2_ctrl_new_custom(hdl, &cfg, NULL);
 		if (hdl->error) {
 			v4l2_err(&dev->v4l2_dev,
 				 "Failed to create new custom control\n");
@@ -178,7 +187,7 @@ static int cedrus_request_validate(struct media_request *req)
 			continue;
 
 		ctrl_test = v4l2_ctrl_request_hdl_ctrl_find(hdl,
-							    cedrus_controls[i].id);
+							    cedrus_controls[i].cfg.id);
 		if (!ctrl_test) {
 			v4l2_info(&ctx->dev->v4l2_dev,
 				  "Missing required codec control\n");
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 3f476d0fd981..69c037724d93 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -49,8 +49,7 @@ enum cedrus_h264_pic_type {
 };
 
 struct cedrus_control {
-	u32			id;
-	u32			elem_size;
+	struct v4l2_ctrl_config	cfg;
 	enum cedrus_codec	codec;
 	unsigned char		required:1;
 };
-- 
2.20.1

