Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E8A339EA6
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbhCMOnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:53 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58243 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234046AbhCMOnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UJlV5fx; Sat, 13 Mar 2021 15:43:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646612; bh=KW/25ZoMVGqPWkM326YBsSXGAuR0NnKDUfdFjrmqckM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=BW24+GEgdi45UtvPAYRbjr+vChlNuM8XAf2X/Fec2AygC+TF+OdNEGZ6Z284W3QZy
         oIrly3XMtj0CMyZ/M3QqO2vyW0FMjumjl6qgaYiMmLtwsBZ95L58ooBh9ZNe3IYq+e
         mBvxCk+Z5tTG70o3/+EyZ2EGe3+cfh5EmvU0Q86ZVTUhLJSveTmTm4IcqfaKnlIM0H
         RFuZychpAr321FhYljJnbxqwjFCUCbPMwXkWEaAg2tdr98shN1/Ej3qUHv6uqN+xPP
         pJ7jFkUQOdBTNrR6AUEE8EeO4+AbPjXu35bNKunJ9hNPegVWwn9IdgjJWWszMuy+UU
         gOHk2p05Pzp2Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 14/15] staging/vc04_services: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:22 +0100
Message-Id: <20210313144323.143600-15-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMsn8vxVIxOwfk1HBWm1Tn7DGMcFBFbrL2w9e7B7pn4zh+SRP2Jqi17Q8et5l39XyCF1q6dYvMVynpi6jD8GJZbtOnePYAy+v8vxRtTsu+FlLMzjey/I
 6Yf2reWeEQBe+OBiEXPcSX3xOiLByNfrsU33zfghVRd3mwxeQLH9Gq4GWugIjL4dJLGCBXrWgwo58BS8Sxu/56+i36P9vJr0RkaTCnESq9F/NQlsCuDMX4h3
 10pkzvNLw0uYhvnm1xXbFfx1pKTTozHVj9bmvjRoFUvRhpkEKQbLP/gkdVKcDKlCZifRrbV1VJpdbsMQnKHRrjJDCr7QxehVtEcM0E51Kv/9SHktNQQ5z8K1
 67fFE2fVamSR0HzbTdI6X+c/qRm4Xw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../bcm2835-camera/bcm2835-camera.c           |   4 +-
 .../bcm2835-camera/bcm2835-camera.h           |   4 +-
 .../vc04_services/bcm2835-camera/controls.c   | 126 +++++++++---------
 3 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index df90c1f9d148..528c57811e96 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1668,8 +1668,8 @@ static int mmal_init(struct bm2835_mmal_dev *dev)
 	dev->capture.fmt = &formats[0];
 	dev->capture.encode_component = NULL;
 	dev->capture.timeperframe = tpf_default;
-	dev->capture.enc_profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-	dev->capture.enc_level = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
+	dev->capture.enc_profile = V4L2_CODEC_VIDEO_H264_PROFILE_HIGH;
+	dev->capture.enc_level = V4L2_CODEC_VIDEO_H264_LEVEL_4_0;
 
 	/* get the preview component ready */
 	ret = vchiq_mmal_component_init(dev->instance, "ril.video_render",
diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index 75524adff0f5..c7538daa6ebc 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -77,9 +77,9 @@ struct bm2835_mmal_dev {
 		/* H264 bitrate mode. CBR/VBR */
 		int encode_bitrate_mode;
 		/* H264 profile */
-		enum v4l2_mpeg_video_h264_profile enc_profile;
+		enum v4l2_codec_video_h264_profile enc_profile;
 		/* H264 level */
-		enum v4l2_mpeg_video_h264_level enc_level;
+		enum v4l2_codec_video_h264_level enc_level;
 		/* JPEG Q-factor */
 		int q_factor;
 
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index b096a12387f7..1ac825653c54 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -625,10 +625,10 @@ static int ctrl_set_bitrate_mode(struct bm2835_mmal_dev *dev,
 	dev->capture.encode_bitrate_mode = ctrl->val;
 	switch (ctrl->val) {
 	default:
-	case V4L2_MPEG_VIDEO_BITRATE_MODE_VBR:
+	case V4L2_CODEC_VIDEO_BITRATE_MODE_VBR:
 		bitrate_mode = MMAL_VIDEO_RATECONTROL_VARIABLE;
 		break;
-	case V4L2_MPEG_VIDEO_BITRATE_MODE_CBR:
+	case V4L2_CODEC_VIDEO_BITRATE_MODE_CBR:
 		bitrate_mode = MMAL_VIDEO_RATECONTROL_CONSTANT;
 		break;
 	}
@@ -679,32 +679,32 @@ static int ctrl_set_video_encode_profile_level(struct bm2835_mmal_dev *dev,
 	struct mmal_parameter_video_profile param;
 	int ret = 0;
 
-	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_PROFILE) {
+	if (ctrl->id == V4L2_CID_CODEC_VIDEO_H264_PROFILE) {
 		switch (ctrl->val) {
-		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
-		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
-		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
-		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_MAIN:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_HIGH:
 			dev->capture.enc_profile = ctrl->val;
 			break;
 		default:
 			ret = -EINVAL;
 			break;
 		}
-	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_LEVEL) {
+	} else if (ctrl->id == V4L2_CID_CODEC_VIDEO_H264_LEVEL) {
 		switch (ctrl->val) {
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
-		case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 			dev->capture.enc_level = ctrl->val;
 			break;
 		default:
@@ -715,17 +715,17 @@ static int ctrl_set_video_encode_profile_level(struct bm2835_mmal_dev *dev,
 
 	if (!ret) {
 		switch (dev->capture.enc_profile) {
-		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE:
 			param.profile = MMAL_VIDEO_PROFILE_H264_BASELINE;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
 			param.profile =
 				MMAL_VIDEO_PROFILE_H264_CONSTRAINED_BASELINE;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_MAIN:
 			param.profile = MMAL_VIDEO_PROFILE_H264_MAIN;
 			break;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		case V4L2_CODEC_VIDEO_H264_PROFILE_HIGH:
 			param.profile = MMAL_VIDEO_PROFILE_H264_HIGH;
 			break;
 		default:
@@ -734,40 +734,40 @@ static int ctrl_set_video_encode_profile_level(struct bm2835_mmal_dev *dev,
 		}
 
 		switch (dev->capture.enc_level) {
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_0:
 			param.level = MMAL_VIDEO_LEVEL_H264_1;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1B:
 			param.level = MMAL_VIDEO_LEVEL_H264_1b;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_1:
 			param.level = MMAL_VIDEO_LEVEL_H264_11;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_2:
 			param.level = MMAL_VIDEO_LEVEL_H264_12;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_1_3:
 			param.level = MMAL_VIDEO_LEVEL_H264_13;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_0:
 			param.level = MMAL_VIDEO_LEVEL_H264_2;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_1:
 			param.level = MMAL_VIDEO_LEVEL_H264_21;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_2_2:
 			param.level = MMAL_VIDEO_LEVEL_H264_22;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_0:
 			param.level = MMAL_VIDEO_LEVEL_H264_3;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_1:
 			param.level = MMAL_VIDEO_LEVEL_H264_31;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_3_2:
 			param.level = MMAL_VIDEO_LEVEL_H264_32;
 			break;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		case V4L2_CODEC_VIDEO_H264_LEVEL_4_0:
 			param.level = MMAL_VIDEO_LEVEL_H264_4;
 			break;
 		default:
@@ -1138,10 +1138,10 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 		.setter = ctrl_set_flip,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
 		.type = MMAL_CONTROL_TYPE_STD_MENU,
 		.min = 0,
-		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+		.max = V4L2_CODEC_VIDEO_BITRATE_MODE_CBR,
 		.def = 0,
 		.step = 0,
 		.imenu = NULL,
@@ -1149,7 +1149,7 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 		.setter = ctrl_set_bitrate_mode,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE,
 		.type = MMAL_CONTROL_TYPE_STD,
 		.min = 25 * 1000,
 		.max = 25 * 1000 * 1000,
@@ -1182,7 +1182,7 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 		.setter = ctrl_set_flicker_avoidance,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER,
+		.id = V4L2_CID_CODEC_VIDEO_REPEAT_SEQ_HEADER,
 		.type = MMAL_CONTROL_TYPE_STD,
 		.min = 0,
 		.max = 1,
@@ -1193,36 +1193,36 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 		.setter = ctrl_set_video_encode_param_output,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+		.id = V4L2_CID_CODEC_VIDEO_H264_PROFILE,
 		.type = MMAL_CONTROL_TYPE_STD_MENU,
-		.min = ~(BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-			 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-			 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-			 BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.def = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.min = ~(BIT(V4L2_CODEC_VIDEO_H264_PROFILE_BASELINE) |
+			 BIT(V4L2_CODEC_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+			 BIT(V4L2_CODEC_VIDEO_H264_PROFILE_MAIN) |
+			 BIT(V4L2_CODEC_VIDEO_H264_PROFILE_HIGH)),
+		.max = V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
+		.def = V4L2_CODEC_VIDEO_H264_PROFILE_HIGH,
 		.step = 1,
 		.imenu = NULL,
 		.mmal_id = MMAL_PARAMETER_PROFILE,
 		.setter = ctrl_set_video_encode_profile_level,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+		.id = V4L2_CID_CODEC_VIDEO_H264_LEVEL,
 		.type = MMAL_CONTROL_TYPE_STD_MENU,
-		.min = ~(BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-			 BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0)),
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_0,
-		.def = V4L2_MPEG_VIDEO_H264_LEVEL_4_0,
+		.min = ~(BIT(V4L2_CODEC_VIDEO_H264_LEVEL_1_0) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_1B) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_1_1) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_1_2) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_1_3) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_2_0) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_2_1) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_2_2) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_3_0) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_3_1) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_3_2) |
+			 BIT(V4L2_CODEC_VIDEO_H264_LEVEL_4_0)),
+		.max = V4L2_CODEC_VIDEO_H264_LEVEL_4_0,
+		.def = V4L2_CODEC_VIDEO_H264_LEVEL_4_0,
 		.step = 1,
 		.imenu = NULL,
 		.mmal_id = MMAL_PARAMETER_PROFILE,
@@ -1241,7 +1241,7 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[V4L2_CTRL_COUNT] = {
 		.setter = ctrl_set_scene_mode,
 	},
 	{
-		.id = V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+		.id = V4L2_CID_CODEC_VIDEO_H264_I_PERIOD,
 		.type = MMAL_CONTROL_TYPE_STD,
 		.min = 0,
 		.max = 0x7FFFFFFF,
-- 
2.30.1

