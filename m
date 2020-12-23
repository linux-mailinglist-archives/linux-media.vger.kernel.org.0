Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DBC2E1B71
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 12:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgLWLHz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 06:07:55 -0500
Received: from mailoutvs40.siol.net ([185.57.226.231]:43227 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728348AbgLWLHy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 06:07:54 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id EB1D352245D;
        Wed, 23 Dec 2020 12:07:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 1B9QXqDKl0Mr; Wed, 23 Dec 2020 12:07:11 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 79E1352248C;
        Wed, 23 Dec 2020 12:07:11 +0100 (CET)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 6A348521E46;
        Wed, 23 Dec 2020 12:07:08 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, wens@csie.org, jernej.skrabec@siol.net,
        hans.verkuil@cisco.com, nicolas.dufresne@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-sunxi@googlegroups.com
Subject: [PATCH 1/2] media: cedrus: Remove checking for required controls
Date:   Wed, 23 Dec 2020 12:06:58 +0100
Message-Id: <20201223110659.2631255-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223110659.2631255-1-jernej.skrabec@siol.net>
References: <20201223110659.2631255-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to v4l2 request api specifications, it's allowed to skip
control if its content isn't changed for performance reasons. Cedrus
driver predates that, so it has implemented mechanism to check if all
required controls are included in one request.

Conform to specifications with removing that mechanism.

Note that this mechanism with static required flag isn't very good
anyway because need for control is usually signaled in other controls.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 49 ---------------------
 drivers/staging/media/sunxi/cedrus/cedrus.h |  1 -
 2 files changed, 50 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
index ddad5d274ee8..7bd9291c8d5f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -34,56 +34,48 @@ static const struct cedrus_control cedrus_controls[] =
=3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
 		},
 		.codec		=3D CEDRUS_CODEC_MPEG2,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
 		},
 		.codec		=3D CEDRUS_CODEC_MPEG2,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_SLICE_PARAMS,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_SPS,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_PPS,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_SCALING_MATRIX,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_STATELESS_H264_PRED_WEIGHTS,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
@@ -92,7 +84,6 @@ static const struct cedrus_control cedrus_controls[] =3D=
 {
 			.def	=3D V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
@@ -101,7 +92,6 @@ static const struct cedrus_control cedrus_controls[] =3D=
 {
 			.def	=3D V4L2_STATELESS_H264_START_CODE_NONE,
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D false,
 	},
 	/*
 	 * We only expose supported profiles information,
@@ -120,28 +110,24 @@ static const struct cedrus_control cedrus_controls[=
] =3D {
 				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
 		},
 		.codec		=3D CEDRUS_CODEC_H264,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_HEVC_SPS,
 		},
 		.codec		=3D CEDRUS_CODEC_H265,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_HEVC_PPS,
 		},
 		.codec		=3D CEDRUS_CODEC_H265,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS,
 		},
 		.codec		=3D CEDRUS_CODEC_H265,
-		.required	=3D true,
 	},
 	{
 		.cfg =3D {
@@ -150,7 +136,6 @@ static const struct cedrus_control cedrus_controls[] =
=3D {
 			.def	=3D V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		=3D CEDRUS_CODEC_H265,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
@@ -159,14 +144,12 @@ static const struct cedrus_control cedrus_controls[=
] =3D {
 			.def	=3D V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
 		},
 		.codec		=3D CEDRUS_CODEC_H265,
-		.required	=3D false,
 	},
 	{
 		.cfg =3D {
 			.id		=3D V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
 		},
 		.codec		=3D CEDRUS_CODEC_VP8,
-		.required	=3D true,
 	},
 };
=20
@@ -227,12 +210,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev,=
 struct cedrus_ctx *ctx)
 static int cedrus_request_validate(struct media_request *req)
 {
 	struct media_request_object *obj;
-	struct v4l2_ctrl_handler *parent_hdl, *hdl;
 	struct cedrus_ctx *ctx =3D NULL;
-	struct v4l2_ctrl *ctrl_test;
 	unsigned int count;
-	unsigned int i;
-	int ret =3D 0;
=20
 	list_for_each_entry(obj, &req->objects, list) {
 		struct vb2_buffer *vb;
@@ -259,34 +238,6 @@ static int cedrus_request_validate(struct media_requ=
est *req)
 		return -EINVAL;
 	}
=20
-	parent_hdl =3D &ctx->hdl;
-
-	hdl =3D v4l2_ctrl_request_hdl_find(req, parent_hdl);
-	if (!hdl) {
-		v4l2_info(&ctx->dev->v4l2_dev, "Missing codec control(s)\n");
-		return -ENOENT;
-	}
-
-	for (i =3D 0; i < CEDRUS_CONTROLS_COUNT; i++) {
-		if (cedrus_controls[i].codec !=3D ctx->current_codec ||
-		    !cedrus_controls[i].required)
-			continue;
-
-		ctrl_test =3D v4l2_ctrl_request_hdl_ctrl_find(hdl,
-							    cedrus_controls[i].cfg.id);
-		if (!ctrl_test) {
-			v4l2_info(&ctx->dev->v4l2_dev,
-				  "Missing required codec control\n");
-			ret =3D -ENOENT;
-			break;
-		}
-	}
-
-	v4l2_ctrl_request_hdl_put(hdl);
-
-	if (ret)
-		return ret;
-
 	return vb2_request_validate(req);
 }
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index c96077aaef49..251a6a660351 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -56,7 +56,6 @@ enum cedrus_h264_pic_type {
 struct cedrus_control {
 	struct v4l2_ctrl_config cfg;
 	enum cedrus_codec	codec;
-	unsigned char		required:1;
 };
=20
 struct cedrus_h264_run {
--=20
2.29.2

