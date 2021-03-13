Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D37F339E99
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhCMOnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:50 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58225 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234021AbhCMOn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UGlV5dC; Sat, 13 Mar 2021 15:43:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646608; bh=mGDuzy6EETkTdKza2QhToB2GrKbr+7uk79zzaiX3Jl8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hi3dwubSb71+YC9ZGj/ZR0VRkEnkr/QLB0nZKDN2WcJ9fOdJvQlW5Ha+Um1r7KpKg
         nXwE7A1oIbPeELuH8B5IYdy8vgguRKvcipVXW3FFVsHCu7mAvz+FBo3B4lh2+txGua
         i5C9gtyEhi1VF5oZqxNJe3TZoLIekg7nw4L6PG8ecJJS1xwlG5WqGL/qNLAH63uK4M
         SoiMiLhZadLgU54nFoj8RNVexA57FJASaPTtBPQjA+mZQnL4WlO4NslJSN/DUBhBjb
         Jsl5PVqxUVguH6mMVaKAmqvhUS7gzAIByj1cZvhxENVgR9P4jpVVSlTJOJmnr+0tTC
         E/1+L5OHAHAfA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/15] media/common: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:12 +0100
Message-Id: <20210313144323.143600-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLSx1V09vdOsiIy3BaNZdQmR/AETmlTZLgNQ9scdnGUt0EyBA5i0DQ6Ct0+d9egLK+97qvH87Wx78NNmwDGQSId51MO4xwmSM4nX0MFUXNzHT4mEtDo5
 FedObq0D2z1LmGMi8iAH3j1/wChCPGUS+GNnSpfyMSicQMH4O6MZhu6GlpsUE6rY+K+RhwCmBIXUpWwW3CBWhGxjIlqHy1QnLG5cg1al5i+JvOMijy214ozU
 moQjxHrL4nUZhoDqmrKNTv/6lBm39Dvwv/3dqOs4j4iFKXyW9BmCRzEo05tIjgAoix2BCxj68IvhCYVAKve93f2bxsyXAPFPRDAcCsvJSYLNR4LRq68oCZk1
 VwLXYKFU31VmWtxk87Ldo6kNGQwopg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/cx2341x.c | 836 ++++++++++++++++-----------------
 1 file changed, 418 insertions(+), 418 deletions(-)

diff --git a/drivers/media/common/cx2341x.c b/drivers/media/common/cx2341x.c
index 1392bd6b0026..1f172bc41cc6 100644
--- a/drivers/media/common/cx2341x.c
+++ b/drivers/media/common/cx2341x.c
@@ -35,29 +35,29 @@ MODULE_PARM_DESC(debug, "Debug level (0-1)");
 static const char *cx2341x_get_name(u32 id)
 {
 	switch (id) {
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
 		return "Spatial Filter Mode";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
 		return "Spatial Filter";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		return "Spatial Luma Filter Type";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
 		return "Spatial Chroma Filter Type";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
 		return "Temporal Filter Mode";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
 		return "Temporal Filter";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		return "Median Filter Type";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
 		return "Median Luma Filter Maximum";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
 		return "Median Luma Filter Minimum";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
 		return "Median Chroma Filter Maximum";
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
 		return "Median Chroma Filter Minimum";
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		return "Insert Navigation Packets";
 	}
 	return NULL;
@@ -102,15 +102,15 @@ static const char **cx2341x_get_menu(u32 id)
 	};
 
 	switch (id) {
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
 		return cx2341x_video_spatial_filter_mode_menu;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		return cx2341x_video_luma_spatial_filter_type_menu;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
 		return cx2341x_video_chroma_spatial_filter_type_menu;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
 		return cx2341x_video_temporal_filter_mode_menu;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		return cx2341x_video_median_filter_type_menu;
 	}
 	return NULL;
@@ -123,16 +123,16 @@ static void cx2341x_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *ty
 	*flags = 0;
 
 	switch (id) {
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		*min = 0;
 		*step = 0;
 		break;
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		*type = V4L2_CTRL_TYPE_BOOLEAN;
 		*min = 0;
 		*max = *step = 1;
@@ -142,20 +142,20 @@ static void cx2341x_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *ty
 		break;
 	}
 	switch (id) {
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		*flags |= V4L2_CTRL_FLAG_UPDATE;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
 		*flags |= V4L2_CTRL_FLAG_SLIDER;
 		break;
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
 	}
@@ -167,40 +167,40 @@ static void cx2341x_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *ty
 /* Must be sorted from low to high control ID! */
 const u32 cx2341x_mpeg_ctrls[] = {
 	V4L2_CID_CODEC_CLASS,
-	V4L2_CID_MPEG_STREAM_TYPE,
-	V4L2_CID_MPEG_STREAM_VBI_FMT,
-	V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ,
-	V4L2_CID_MPEG_AUDIO_ENCODING,
-	V4L2_CID_MPEG_AUDIO_L2_BITRATE,
-	V4L2_CID_MPEG_AUDIO_MODE,
-	V4L2_CID_MPEG_AUDIO_MODE_EXTENSION,
-	V4L2_CID_MPEG_AUDIO_EMPHASIS,
-	V4L2_CID_MPEG_AUDIO_CRC,
-	V4L2_CID_MPEG_AUDIO_MUTE,
-	V4L2_CID_MPEG_AUDIO_AC3_BITRATE,
-	V4L2_CID_MPEG_VIDEO_ENCODING,
-	V4L2_CID_MPEG_VIDEO_ASPECT,
-	V4L2_CID_MPEG_VIDEO_B_FRAMES,
-	V4L2_CID_MPEG_VIDEO_GOP_SIZE,
-	V4L2_CID_MPEG_VIDEO_GOP_CLOSURE,
-	V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-	V4L2_CID_MPEG_VIDEO_BITRATE,
-	V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
-	V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION,
-	V4L2_CID_MPEG_VIDEO_MUTE,
-	V4L2_CID_MPEG_VIDEO_MUTE_YUV,
-	V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
-	V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER,
-	V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
-	V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
-	V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
-	V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER,
-	V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
-	V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
-	V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
-	V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
-	V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
-	V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS,
+	V4L2_CID_CODEC_STREAM_TYPE,
+	V4L2_CID_CODEC_STREAM_VBI_FMT,
+	V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ,
+	V4L2_CID_CODEC_AUDIO_ENCODING,
+	V4L2_CID_CODEC_AUDIO_L2_BITRATE,
+	V4L2_CID_CODEC_AUDIO_MODE,
+	V4L2_CID_CODEC_AUDIO_MODE_EXTENSION,
+	V4L2_CID_CODEC_AUDIO_EMPHASIS,
+	V4L2_CID_CODEC_AUDIO_CRC,
+	V4L2_CID_CODEC_AUDIO_MUTE,
+	V4L2_CID_CODEC_AUDIO_AC3_BITRATE,
+	V4L2_CID_CODEC_VIDEO_ENCODING,
+	V4L2_CID_CODEC_VIDEO_ASPECT,
+	V4L2_CID_CODEC_VIDEO_B_FRAMES,
+	V4L2_CID_CODEC_VIDEO_GOP_SIZE,
+	V4L2_CID_CODEC_VIDEO_GOP_CLOSURE,
+	V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+	V4L2_CID_CODEC_VIDEO_BITRATE,
+	V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
+	V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION,
+	V4L2_CID_CODEC_VIDEO_MUTE,
+	V4L2_CID_CODEC_VIDEO_MUTE_YUV,
+	V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
+	V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER,
+	V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
+	V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
+	V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
+	V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER,
+	V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
+	V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
+	V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
+	V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
+	V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
+	V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS,
 	0
 };
 EXPORT_SYMBOL(cx2341x_mpeg_ctrls);
@@ -214,28 +214,28 @@ static const struct cx2341x_mpeg_params default_params = {
 	.is_50hz = 0,
 
 	/* stream */
-	.stream_type = V4L2_MPEG_STREAM_TYPE_MPEG2_PS,
-	.stream_vbi_fmt = V4L2_MPEG_STREAM_VBI_FMT_NONE,
+	.stream_type = V4L2_CODEC_STREAM_TYPE_MPEG2_PS,
+	.stream_vbi_fmt = V4L2_CODEC_STREAM_VBI_FMT_NONE,
 	.stream_insert_nav_packets = 0,
 
 	/* audio */
-	.audio_sampling_freq = V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000,
-	.audio_encoding = V4L2_MPEG_AUDIO_ENCODING_LAYER_2,
-	.audio_l2_bitrate = V4L2_MPEG_AUDIO_L2_BITRATE_224K,
-	.audio_ac3_bitrate = V4L2_MPEG_AUDIO_AC3_BITRATE_224K,
-	.audio_mode = V4L2_MPEG_AUDIO_MODE_STEREO,
-	.audio_mode_extension = V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4,
-	.audio_emphasis = V4L2_MPEG_AUDIO_EMPHASIS_NONE,
-	.audio_crc = V4L2_MPEG_AUDIO_CRC_NONE,
+	.audio_sampling_freq = V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000,
+	.audio_encoding = V4L2_CODEC_AUDIO_ENCODING_LAYER_2,
+	.audio_l2_bitrate = V4L2_CODEC_AUDIO_L2_BITRATE_224K,
+	.audio_ac3_bitrate = V4L2_CODEC_AUDIO_AC3_BITRATE_224K,
+	.audio_mode = V4L2_CODEC_AUDIO_MODE_STEREO,
+	.audio_mode_extension = V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_4,
+	.audio_emphasis = V4L2_CODEC_AUDIO_EMPHASIS_NONE,
+	.audio_crc = V4L2_CODEC_AUDIO_CRC_NONE,
 	.audio_mute = 0,
 
 	/* video */
-	.video_encoding = V4L2_MPEG_VIDEO_ENCODING_MPEG_2,
-	.video_aspect = V4L2_MPEG_VIDEO_ASPECT_4x3,
+	.video_encoding = V4L2_CODEC_VIDEO_ENCODING_MPEG_2,
+	.video_aspect = V4L2_CODEC_VIDEO_ASPECT_4x3,
 	.video_b_frames = 2,
 	.video_gop_size = 12,
 	.video_gop_closure = 1,
-	.video_bitrate_mode = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+	.video_bitrate_mode = V4L2_CODEC_VIDEO_BITRATE_MODE_VBR,
 	.video_bitrate = 6000000,
 	.video_bitrate_peak = 8000000,
 	.video_temporal_decimation = 0,
@@ -244,17 +244,17 @@ static const struct cx2341x_mpeg_params default_params = {
 
 	/* encoding filters */
 	.video_spatial_filter_mode =
-		V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
+		V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
 	.video_spatial_filter = 0,
 	.video_luma_spatial_filter_type =
-		V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR,
+		V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR,
 	.video_chroma_spatial_filter_type =
-		V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
+		V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
 	.video_temporal_filter_mode =
-		V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
+		V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
 	.video_temporal_filter = 8,
 	.video_median_filter_type =
-		V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
+		V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
 	.video_luma_median_filter_top = 255,
 	.video_luma_median_filter_bottom = 0,
 	.video_chroma_median_filter_top = 255,
@@ -266,106 +266,106 @@ static int cx2341x_get_ctrl(const struct cx2341x_mpeg_params *params,
 		struct v4l2_ext_control *ctrl)
 {
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		ctrl->value = params->audio_sampling_freq;
 		break;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		ctrl->value = params->audio_encoding;
 		break;
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
 		ctrl->value = params->audio_l2_bitrate;
 		break;
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
 		ctrl->value = params->audio_ac3_bitrate;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MODE:
+	case V4L2_CID_CODEC_AUDIO_MODE:
 		ctrl->value = params->audio_mode;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION:
 		ctrl->value = params->audio_mode_extension;
 		break;
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:
 		ctrl->value = params->audio_emphasis;
 		break;
-	case V4L2_CID_MPEG_AUDIO_CRC:
+	case V4L2_CID_CODEC_AUDIO_CRC:
 		ctrl->value = params->audio_crc;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MUTE:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
 		ctrl->value = params->audio_mute;
 		break;
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		ctrl->value = params->video_encoding;
 		break;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		ctrl->value = params->video_aspect;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		ctrl->value = params->video_b_frames;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		ctrl->value = params->video_gop_size;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
 		ctrl->value = params->video_gop_closure;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		ctrl->value = params->video_bitrate_mode;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		ctrl->value = params->video_bitrate;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:
 		ctrl->value = params->video_bitrate_peak;
 		break;
-	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION:
+	case V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION:
 		ctrl->value = params->video_temporal_decimation;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_MUTE:
 		ctrl->value = params->video_mute;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:
+	case V4L2_CID_CODEC_VIDEO_MUTE_YUV:
 		ctrl->value = params->video_mute_yuv;
 		break;
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		ctrl->value = params->stream_type;
 		break;
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 		ctrl->value = params->stream_vbi_fmt;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
 		ctrl->value = params->video_spatial_filter_mode;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
 		ctrl->value = params->video_spatial_filter;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		ctrl->value = params->video_luma_spatial_filter_type;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
 		ctrl->value = params->video_chroma_spatial_filter_type;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
 		ctrl->value = params->video_temporal_filter_mode;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
 		ctrl->value = params->video_temporal_filter;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		ctrl->value = params->video_median_filter_type;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
 		ctrl->value = params->video_luma_median_filter_top;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
 		ctrl->value = params->video_luma_median_filter_bottom;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
 		ctrl->value = params->video_chroma_median_filter_top;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
 		ctrl->value = params->video_chroma_median_filter_bottom;
 		break;
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		ctrl->value = params->stream_insert_nav_packets;
 		break;
 	default:
@@ -380,51 +380,51 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
 		struct v4l2_ext_control *ctrl)
 {
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		if (busy)
 			return -EBUSY;
 		params->audio_sampling_freq = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		if (busy)
 			return -EBUSY;
 		if (params->capabilities & CX2341X_CAP_HAS_AC3)
-			if (ctrl->value != V4L2_MPEG_AUDIO_ENCODING_LAYER_2 &&
-			    ctrl->value != V4L2_MPEG_AUDIO_ENCODING_AC3)
+			if (ctrl->value != V4L2_CODEC_AUDIO_ENCODING_LAYER_2 &&
+			    ctrl->value != V4L2_CODEC_AUDIO_ENCODING_AC3)
 				return -ERANGE;
 		params->audio_encoding = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
 		if (busy)
 			return -EBUSY;
 		params->audio_l2_bitrate = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
 		if (busy)
 			return -EBUSY;
 		if (!(params->capabilities & CX2341X_CAP_HAS_AC3))
 			return -EINVAL;
 		params->audio_ac3_bitrate = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MODE:
+	case V4L2_CID_CODEC_AUDIO_MODE:
 		params->audio_mode = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION:
 		params->audio_mode_extension = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:
 		params->audio_emphasis = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_CRC:
+	case V4L2_CID_CODEC_AUDIO_CRC:
 		params->audio_crc = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MUTE:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
 		params->audio_mute = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		params->video_aspect = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES: {
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES: {
 		int b = ctrl->value + 1;
 		int gop = params->video_gop_size;
 		params->video_b_frames = ctrl->value;
@@ -434,7 +434,7 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
 			params->video_gop_size -= b;
 		break;
 	}
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE: {
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE: {
 		int b = params->video_b_frames + 1;
 		int gop = ctrl->value;
 		params->video_gop_size = b * ((gop + b - 1) / b);
@@ -444,88 +444,88 @@ static int cx2341x_set_ctrl(struct cx2341x_mpeg_params *params, int busy,
 		ctrl->value = params->video_gop_size;
 		break;
 	}
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
 		params->video_gop_closure = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		if (busy)
 			return -EBUSY;
 		/* MPEG-1 only allows CBR */
-		if (params->video_encoding == V4L2_MPEG_VIDEO_ENCODING_MPEG_1 &&
-		    ctrl->value != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		if (params->video_encoding == V4L2_CODEC_VIDEO_ENCODING_MPEG_1 &&
+		    ctrl->value != V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 			return -EINVAL;
 		params->video_bitrate_mode = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		if (busy)
 			return -EBUSY;
 		params->video_bitrate = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:
 		if (busy)
 			return -EBUSY;
 		params->video_bitrate_peak = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION:
+	case V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION:
 		params->video_temporal_decimation = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_MUTE:
 		params->video_mute = (ctrl->value != 0);
 		break;
-	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:
+	case V4L2_CID_CODEC_VIDEO_MUTE_YUV:
 		params->video_mute_yuv = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		if (busy)
 			return -EBUSY;
 		params->stream_type = ctrl->value;
 		params->video_encoding =
-		    (params->stream_type == V4L2_MPEG_STREAM_TYPE_MPEG1_SS ||
-		     params->stream_type == V4L2_MPEG_STREAM_TYPE_MPEG1_VCD) ?
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_1 :
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_2;
-		if (params->video_encoding == V4L2_MPEG_VIDEO_ENCODING_MPEG_1)
+		    (params->stream_type == V4L2_CODEC_STREAM_TYPE_MPEG1_SS ||
+		     params->stream_type == V4L2_CODEC_STREAM_TYPE_MPEG1_VCD) ?
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_1 :
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_2;
+		if (params->video_encoding == V4L2_CODEC_VIDEO_ENCODING_MPEG_1)
 			/* MPEG-1 implies CBR */
 			params->video_bitrate_mode =
-				V4L2_MPEG_VIDEO_BITRATE_MODE_CBR;
+				V4L2_CODEC_VIDEO_BITRATE_MODE_CBR;
 		break;
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 		params->stream_vbi_fmt = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
 		params->video_spatial_filter_mode = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
 		params->video_spatial_filter = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		params->video_luma_spatial_filter_type = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
 		params->video_chroma_spatial_filter_type = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
 		params->video_temporal_filter_mode = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
 		params->video_temporal_filter = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		params->video_median_filter_type = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
 		params->video_luma_median_filter_top = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
 		params->video_luma_median_filter_bottom = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
 		params->video_chroma_median_filter_top = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
 		params->video_chroma_median_filter_bottom = ctrl->value;
 		break;
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		params->stream_insert_nav_packets = ctrl->value;
 		break;
 	default:
@@ -541,18 +541,18 @@ static int cx2341x_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
 
 	switch (qctrl->id) {
 	/* MPEG controls */
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		cx2341x_ctrl_fill(qctrl->id, &name, &qctrl->type,
 				&min, &max, &step, &def, &qctrl->flags);
 		qctrl->minimum = min;
@@ -576,260 +576,260 @@ int cx2341x_ctrl_query(const struct cx2341x_mpeg_params *params,
 	switch (qctrl->id) {
 	case V4L2_CID_CODEC_CLASS:
 		return v4l2_ctrl_query_fill(qctrl, 0, 0, 0, 0);
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_STREAM_TYPE_MPEG2_PS,
-				V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD, 1,
-				V4L2_MPEG_STREAM_TYPE_MPEG2_PS);
+				V4L2_CODEC_STREAM_TYPE_MPEG2_PS,
+				V4L2_CODEC_STREAM_TYPE_MPEG2_SVCD, 1,
+				V4L2_CODEC_STREAM_TYPE_MPEG2_PS);
 
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 		if (params->capabilities & CX2341X_CAP_HAS_SLICED_VBI)
 			return v4l2_ctrl_query_fill(qctrl,
-					V4L2_MPEG_STREAM_VBI_FMT_NONE,
-					V4L2_MPEG_STREAM_VBI_FMT_IVTV, 1,
-					V4L2_MPEG_STREAM_VBI_FMT_NONE);
+					V4L2_CODEC_STREAM_VBI_FMT_NONE,
+					V4L2_CODEC_STREAM_VBI_FMT_IVTV, 1,
+					V4L2_CODEC_STREAM_VBI_FMT_NONE);
 		return cx2341x_ctrl_query_fill(qctrl,
-				V4L2_MPEG_STREAM_VBI_FMT_NONE,
-				V4L2_MPEG_STREAM_VBI_FMT_NONE, 1,
+				V4L2_CODEC_STREAM_VBI_FMT_NONE,
+				V4L2_CODEC_STREAM_VBI_FMT_NONE, 1,
 				default_params.stream_vbi_fmt);
 
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100,
-				V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000, 1,
-				V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000);
+				V4L2_CODEC_AUDIO_SAMPLING_FREQ_44100,
+				V4L2_CODEC_AUDIO_SAMPLING_FREQ_32000, 1,
+				V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000);
 
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		if (params->capabilities & CX2341X_CAP_HAS_AC3) {
 			/*
 			 * The state of L2 & AC3 bitrate controls can change
 			 * when this control changes, but v4l2_ctrl_query_fill()
 			 * already sets V4L2_CTRL_FLAG_UPDATE for
-			 * V4L2_CID_MPEG_AUDIO_ENCODING, so we don't here.
+			 * V4L2_CID_CODEC_AUDIO_ENCODING, so we don't here.
 			 */
 			return v4l2_ctrl_query_fill(qctrl,
-					V4L2_MPEG_AUDIO_ENCODING_LAYER_2,
-					V4L2_MPEG_AUDIO_ENCODING_AC3, 1,
+					V4L2_CODEC_AUDIO_ENCODING_LAYER_2,
+					V4L2_CODEC_AUDIO_ENCODING_AC3, 1,
 					default_params.audio_encoding);
 		}
 
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_ENCODING_LAYER_2,
-				V4L2_MPEG_AUDIO_ENCODING_LAYER_2, 1,
+				V4L2_CODEC_AUDIO_ENCODING_LAYER_2,
+				V4L2_CODEC_AUDIO_ENCODING_LAYER_2, 1,
 				default_params.audio_encoding);
 
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
 		err = v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_L2_BITRATE_192K,
-				V4L2_MPEG_AUDIO_L2_BITRATE_384K, 1,
+				V4L2_CODEC_AUDIO_L2_BITRATE_192K,
+				V4L2_CODEC_AUDIO_L2_BITRATE_384K, 1,
 				default_params.audio_l2_bitrate);
 		if (err)
 			return err;
 		if (params->capabilities & CX2341X_CAP_HAS_AC3 &&
-		    params->audio_encoding != V4L2_MPEG_AUDIO_ENCODING_LAYER_2)
+		    params->audio_encoding != V4L2_CODEC_AUDIO_ENCODING_LAYER_2)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_AUDIO_MODE:
+	case V4L2_CID_CODEC_AUDIO_MODE:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_MODE_STEREO,
-				V4L2_MPEG_AUDIO_MODE_MONO, 1,
-				V4L2_MPEG_AUDIO_MODE_STEREO);
+				V4L2_CODEC_AUDIO_MODE_STEREO,
+				V4L2_CODEC_AUDIO_MODE_MONO, 1,
+				V4L2_CODEC_AUDIO_MODE_STEREO);
 
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION:
 		err = v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4,
-				V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16, 1,
-				V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4);
+				V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_4,
+				V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_16, 1,
+				V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_4);
 		if (err == 0 &&
-		    params->audio_mode != V4L2_MPEG_AUDIO_MODE_JOINT_STEREO)
+		    params->audio_mode != V4L2_CODEC_AUDIO_MODE_JOINT_STEREO)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return err;
 
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_EMPHASIS_NONE,
-				V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17, 1,
-				V4L2_MPEG_AUDIO_EMPHASIS_NONE);
+				V4L2_CODEC_AUDIO_EMPHASIS_NONE,
+				V4L2_CODEC_AUDIO_EMPHASIS_CCITT_J17, 1,
+				V4L2_CODEC_AUDIO_EMPHASIS_NONE);
 
-	case V4L2_CID_MPEG_AUDIO_CRC:
+	case V4L2_CID_CODEC_AUDIO_CRC:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_CRC_NONE,
-				V4L2_MPEG_AUDIO_CRC_CRC16, 1,
-				V4L2_MPEG_AUDIO_CRC_NONE);
+				V4L2_CODEC_AUDIO_CRC_NONE,
+				V4L2_CODEC_AUDIO_CRC_CRC16, 1,
+				V4L2_CODEC_AUDIO_CRC_NONE);
 
-	case V4L2_CID_MPEG_AUDIO_MUTE:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
 		return v4l2_ctrl_query_fill(qctrl, 0, 1, 1, 0);
 
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
 		err = v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_AUDIO_AC3_BITRATE_48K,
-				V4L2_MPEG_AUDIO_AC3_BITRATE_448K, 1,
+				V4L2_CODEC_AUDIO_AC3_BITRATE_48K,
+				V4L2_CODEC_AUDIO_AC3_BITRATE_448K, 1,
 				default_params.audio_ac3_bitrate);
 		if (err)
 			return err;
 		if (params->capabilities & CX2341X_CAP_HAS_AC3) {
 			if (params->audio_encoding !=
-						   V4L2_MPEG_AUDIO_ENCODING_AC3)
+						   V4L2_CODEC_AUDIO_ENCODING_AC3)
 				qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		} else
 			qctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
 		return 0;
 
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		/* this setting is read-only for the cx2341x since the
-		   V4L2_CID_MPEG_STREAM_TYPE really determines the
+		   V4L2_CID_CODEC_STREAM_TYPE really determines the
 		   MPEG-1/2 setting */
 		err = v4l2_ctrl_query_fill(qctrl,
-					   V4L2_MPEG_VIDEO_ENCODING_MPEG_1,
-					   V4L2_MPEG_VIDEO_ENCODING_MPEG_2, 1,
-					   V4L2_MPEG_VIDEO_ENCODING_MPEG_2);
+					   V4L2_CODEC_VIDEO_ENCODING_MPEG_1,
+					   V4L2_CODEC_VIDEO_ENCODING_MPEG_2, 1,
+					   V4L2_CODEC_VIDEO_ENCODING_MPEG_2);
 		if (err == 0)
 			qctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		return err;
 
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		return v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_VIDEO_ASPECT_1x1,
-				V4L2_MPEG_VIDEO_ASPECT_221x100, 1,
-				V4L2_MPEG_VIDEO_ASPECT_4x3);
+				V4L2_CODEC_VIDEO_ASPECT_1x1,
+				V4L2_CODEC_VIDEO_ASPECT_221x100, 1,
+				V4L2_CODEC_VIDEO_ASPECT_4x3);
 
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		return v4l2_ctrl_query_fill(qctrl, 0, 33, 1, 2);
 
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		return v4l2_ctrl_query_fill(qctrl, 1, 34, 1,
 				params->is_50hz ? 12 : 15);
 
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
 		return v4l2_ctrl_query_fill(qctrl, 0, 1, 1, 1);
 
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		err = v4l2_ctrl_query_fill(qctrl,
-				V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-				V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 1,
-				V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+				V4L2_CODEC_VIDEO_BITRATE_MODE_VBR,
+				V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 1,
+				V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 		if (err == 0 &&
-		    params->video_encoding == V4L2_MPEG_VIDEO_ENCODING_MPEG_1)
+		    params->video_encoding == V4L2_CODEC_VIDEO_ENCODING_MPEG_1)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return err;
 
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		return v4l2_ctrl_query_fill(qctrl, 0, 27000000, 1, 6000000);
 
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:
 		err = v4l2_ctrl_query_fill(qctrl, 0, 27000000, 1, 8000000);
 		if (err == 0 &&
 		    params->video_bitrate_mode ==
-				V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+				V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return err;
 
-	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION:
+	case V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION:
 		return v4l2_ctrl_query_fill(qctrl, 0, 255, 1, 0);
 
-	case V4L2_CID_MPEG_VIDEO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_MUTE:
 		return v4l2_ctrl_query_fill(qctrl, 0, 1, 1, 0);
 
-	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:  /* Init YUV (really YCbCr) to black */
+	case V4L2_CID_CODEC_VIDEO_MUTE_YUV:  /* Init YUV (really YCbCr) to black */
 		return v4l2_ctrl_query_fill(qctrl, 0, 0xffffff, 1, 0x008080);
 
 	/* CX23415/6 specific */
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
 		return cx2341x_ctrl_query_fill(qctrl,
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO, 1,
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO, 1,
 			default_params.video_spatial_filter_mode);
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
 		cx2341x_ctrl_query_fill(qctrl, 0, 15, 1,
 				default_params.video_spatial_filter);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_spatial_filter_mode ==
-			    V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
+			    V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		cx2341x_ctrl_query_fill(qctrl,
-			V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF,
-			V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE,
+			V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF,
+			V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE,
 			1,
 			default_params.video_luma_spatial_filter_type);
 		if (params->video_spatial_filter_mode ==
-			    V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
+			    V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
 		cx2341x_ctrl_query_fill(qctrl,
-		    V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF,
-		    V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
+		    V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF,
+		    V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
 		    1,
 		    default_params.video_chroma_spatial_filter_type);
 		if (params->video_spatial_filter_mode ==
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
 		return cx2341x_ctrl_query_fill(qctrl,
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO, 1,
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO, 1,
 			default_params.video_temporal_filter_mode);
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER:
 		cx2341x_ctrl_query_fill(qctrl, 0, 31, 1,
 				default_params.video_temporal_filter);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_temporal_filter_mode ==
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO)
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		return cx2341x_ctrl_query_fill(qctrl,
-			V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
-			V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG, 1,
+			V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
+			V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG, 1,
 			default_params.video_median_filter_type);
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
 		cx2341x_ctrl_query_fill(qctrl, 0, 255, 1,
 				default_params.video_luma_median_filter_top);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_median_filter_type ==
-				V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
+				V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM:
 		cx2341x_ctrl_query_fill(qctrl, 0, 255, 1,
 				default_params.video_luma_median_filter_bottom);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_median_filter_type ==
-				V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
+				V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP:
 		cx2341x_ctrl_query_fill(qctrl, 0, 255, 1,
 				default_params.video_chroma_median_filter_top);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_median_filter_type ==
-				V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
+				V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM:
 		cx2341x_ctrl_query_fill(qctrl, 0, 255, 1,
 			default_params.video_chroma_median_filter_bottom);
 		qctrl->flags |= V4L2_CTRL_FLAG_SLIDER;
 		if (params->video_median_filter_type ==
-				V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
+				V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF)
 			qctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
 		return 0;
 
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		return cx2341x_ctrl_query_fill(qctrl, 0, 1, 1,
 				default_params.stream_insert_nav_packets);
 
@@ -872,20 +872,20 @@ const char * const *cx2341x_ctrl_get_menu(const struct cx2341x_mpeg_params *p, u
 	};
 
 	switch (id) {
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		return (p->capabilities & CX2341X_CAP_HAS_TS) ?
 			mpeg_stream_type_with_ts : mpeg_stream_type_without_ts;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		return (p->capabilities & CX2341X_CAP_HAS_AC3) ?
 			mpeg_audio_encoding_l2_ac3 : v4l2_ctrl_get_menu(id);
-	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:
-	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L1_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L3_BITRATE:
 		return NULL;
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
-	case V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE:
 		return cx2341x_get_menu(id);
 	default:
 		return v4l2_ctrl_get_menu(id);
@@ -899,15 +899,15 @@ static void cx2341x_calc_audio_properties(struct cx2341x_mpeg_params *params)
 		(params->audio_sampling_freq << 0) |
 		(params->audio_mode << 8) |
 		(params->audio_mode_extension << 10) |
-		(((params->audio_emphasis == V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17)
+		(((params->audio_emphasis == V4L2_CODEC_AUDIO_EMPHASIS_CCITT_J17)
 		  ? 3 : params->audio_emphasis) << 12) |
 		(params->audio_crc << 14);
 
 	if ((params->capabilities & CX2341X_CAP_HAS_AC3) &&
-	    params->audio_encoding == V4L2_MPEG_AUDIO_ENCODING_AC3) {
+	    params->audio_encoding == V4L2_CODEC_AUDIO_ENCODING_AC3) {
 		params->audio_properties |=
 			/* Not sure if this MPEG Layer II setting is required */
-			((3 - V4L2_MPEG_AUDIO_ENCODING_LAYER_2) << 2) |
+			((3 - V4L2_CODEC_AUDIO_ENCODING_LAYER_2) << 2) |
 			(params->audio_ac3_bitrate << 4) |
 			(CX2341X_AUDIO_ENCODING_METHOD_AC3 << 28);
 	} else {
@@ -984,7 +984,7 @@ int cx2341x_ext_ctrls(struct cx2341x_mpeg_params *params, int busy,
 			break;
 	}
 	if (err == 0 &&
-	    params->video_bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+	    params->video_bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR &&
 	    params->video_bitrate_peak < params->video_bitrate) {
 		err = -ERANGE;
 		ctrls->error_idx = ctrls->count;
@@ -1052,7 +1052,7 @@ int cx2341x_update(void *priv, cx2341x_mbox_func func,
 		u16 w = new->width;
 		u16 h = new->height;
 
-		if (new->video_encoding == V4L2_MPEG_VIDEO_ENCODING_MPEG_1) {
+		if (new->video_encoding == V4L2_CODEC_VIDEO_ENCODING_MPEG_1) {
 			w /= 2;
 			h /= 2;
 		}
@@ -1205,18 +1205,18 @@ static const char *cx2341x_menu_item(const struct cx2341x_mpeg_params *p, u32 id
 
 void cx2341x_log_status(const struct cx2341x_mpeg_params *p, const char *prefix)
 {
-	int is_mpeg1 = p->video_encoding == V4L2_MPEG_VIDEO_ENCODING_MPEG_1;
+	int is_mpeg1 = p->video_encoding == V4L2_CODEC_VIDEO_ENCODING_MPEG_1;
 
 	/* Stream */
 	printk(KERN_INFO "%s: Stream: %s",
 		prefix,
-		cx2341x_menu_item(p, V4L2_CID_MPEG_STREAM_TYPE));
+		cx2341x_menu_item(p, V4L2_CID_CODEC_STREAM_TYPE));
 	if (p->stream_insert_nav_packets)
 		printk(KERN_CONT " (with navigation packets)");
 	printk(KERN_CONT "\n");
 	printk(KERN_INFO "%s: VBI Format: %s\n",
 		prefix,
-		cx2341x_menu_item(p, V4L2_CID_MPEG_STREAM_VBI_FMT));
+		cx2341x_menu_item(p, V4L2_CID_CODEC_STREAM_VBI_FMT));
 
 	/* Video */
 	printk(KERN_INFO "%s: Video:  %dx%d, %d fps%s\n",
@@ -1226,11 +1226,11 @@ void cx2341x_log_status(const struct cx2341x_mpeg_params *p, const char *prefix)
 		(p->video_mute) ? " (muted)" : "");
 	printk(KERN_INFO "%s: Video:  %s, %s, %s, %d",
 		prefix,
-		cx2341x_menu_item(p, V4L2_CID_MPEG_VIDEO_ENCODING),
-		cx2341x_menu_item(p, V4L2_CID_MPEG_VIDEO_ASPECT),
-		cx2341x_menu_item(p, V4L2_CID_MPEG_VIDEO_BITRATE_MODE),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_VIDEO_ENCODING),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_VIDEO_ASPECT),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_VIDEO_BITRATE_MODE),
 		p->video_bitrate);
-	if (p->video_bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
+	if (p->video_bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR)
 		printk(KERN_CONT ", Peak %d", p->video_bitrate_peak);
 	printk(KERN_CONT "\n");
 	printk(KERN_INFO
@@ -1245,42 +1245,42 @@ void cx2341x_log_status(const struct cx2341x_mpeg_params *p, const char *prefix)
 	/* Audio */
 	printk(KERN_INFO "%s: Audio:  %s, %s, %s, %s%s",
 		prefix,
-		cx2341x_menu_item(p, V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ),
-		cx2341x_menu_item(p, V4L2_CID_MPEG_AUDIO_ENCODING),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_AUDIO_ENCODING),
 		cx2341x_menu_item(p,
-			   p->audio_encoding == V4L2_MPEG_AUDIO_ENCODING_AC3
-					      ? V4L2_CID_MPEG_AUDIO_AC3_BITRATE
-					      : V4L2_CID_MPEG_AUDIO_L2_BITRATE),
-		cx2341x_menu_item(p, V4L2_CID_MPEG_AUDIO_MODE),
+			   p->audio_encoding == V4L2_CODEC_AUDIO_ENCODING_AC3
+					      ? V4L2_CID_CODEC_AUDIO_AC3_BITRATE
+					      : V4L2_CID_CODEC_AUDIO_L2_BITRATE),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_AUDIO_MODE),
 		p->audio_mute ? " (muted)" : "");
-	if (p->audio_mode == V4L2_MPEG_AUDIO_MODE_JOINT_STEREO)
+	if (p->audio_mode == V4L2_CODEC_AUDIO_MODE_JOINT_STEREO)
 		printk(KERN_CONT ", %s", cx2341x_menu_item(p,
-				V4L2_CID_MPEG_AUDIO_MODE_EXTENSION));
+				V4L2_CID_CODEC_AUDIO_MODE_EXTENSION));
 	printk(KERN_CONT ", %s, %s\n",
-		cx2341x_menu_item(p, V4L2_CID_MPEG_AUDIO_EMPHASIS),
-		cx2341x_menu_item(p, V4L2_CID_MPEG_AUDIO_CRC));
+		cx2341x_menu_item(p, V4L2_CID_CODEC_AUDIO_EMPHASIS),
+		cx2341x_menu_item(p, V4L2_CID_CODEC_AUDIO_CRC));
 
 	/* Encoding filters */
 	printk(KERN_INFO "%s: Spatial Filter:  %s, Luma %s, Chroma %s, %d\n",
 		prefix,
 		cx2341x_menu_item(p,
-		    V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE),
+		    V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE),
 		cx2341x_menu_item(p,
-		    V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE),
+		    V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE),
 		cx2341x_menu_item(p,
-		    V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE),
+		    V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE),
 		p->video_spatial_filter);
 
 	printk(KERN_INFO "%s: Temporal Filter: %s, %d\n",
 		prefix,
 		cx2341x_menu_item(p,
-			V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE),
+			V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE),
 		p->video_temporal_filter);
 	printk(KERN_INFO
 		"%s: Median Filter:   %s, Luma [%d, %d], Chroma [%d, %d]\n",
 		prefix,
 		cx2341x_menu_item(p,
-			V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE),
+			V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE),
 		p->video_luma_median_filter_bottom,
 		p->video_luma_median_filter_top,
 		p->video_chroma_median_filter_bottom,
@@ -1324,7 +1324,7 @@ static int cx2341x_try_ctrl(struct v4l2_ctrl *ctrl)
 	s32 val = ctrl->val;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES: {
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES: {
 		/* video gop cluster */
 		int b = val + 1;
 		int gop = hdl->video_gop_size->val;
@@ -1338,19 +1338,19 @@ static int cx2341x_try_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		/* stream type cluster */
 		hdl->video_encoding->val =
-		    (hdl->stream_type->val == V4L2_MPEG_STREAM_TYPE_MPEG1_SS ||
-		     hdl->stream_type->val == V4L2_MPEG_STREAM_TYPE_MPEG1_VCD) ?
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_1 :
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_2;
-		if (hdl->video_encoding->val == V4L2_MPEG_VIDEO_ENCODING_MPEG_1)
+		    (hdl->stream_type->val == V4L2_CODEC_STREAM_TYPE_MPEG1_SS ||
+		     hdl->stream_type->val == V4L2_CODEC_STREAM_TYPE_MPEG1_VCD) ?
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_1 :
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_2;
+		if (hdl->video_encoding->val == V4L2_CODEC_VIDEO_ENCODING_MPEG_1)
 			/* MPEG-1 implies CBR */
 			hdl->video_bitrate_mode->val =
-				V4L2_MPEG_VIDEO_BITRATE_MODE_CBR;
+				V4L2_CODEC_VIDEO_BITRATE_MODE_CBR;
 		/* peak bitrate shall be >= normal bitrate */
-		if (hdl->video_bitrate_mode->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+		if (hdl->video_bitrate_mode->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR &&
 		    hdl->video_bitrate_peak->val < hdl->video_bitrate->val)
 			hdl->video_bitrate_peak->val = hdl->video_bitrate->val;
 		break;
@@ -1374,44 +1374,44 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 	int err;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 		if (hdl->ops && hdl->ops->s_stream_vbi_fmt)
 			return hdl->ops->s_stream_vbi_fmt(hdl, val);
 		return 0;
 
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		return cx2341x_hdl_api(hdl,
 			CX2341X_ENC_SET_ASPECT_RATIO, 1, val + 1);
 
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_SET_GOP_CLOSURE, 1, val);
 
-	case V4L2_CID_MPEG_AUDIO_MUTE:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_MUTE_AUDIO, 1, val);
 
-	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION:
+	case V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION:
 		return cx2341x_hdl_api(hdl,
 			CX2341X_ENC_SET_FRAME_DROP_RATE, 1, val);
 
-	case V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS:
+	case V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS:
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_MISC, 2, 7, val);
 
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		/* audio properties cluster */
 		props = (hdl->audio_sampling_freq->val << 0) |
 			(hdl->audio_mode->val << 8) |
 			(hdl->audio_mode_extension->val << 10) |
 			(hdl->audio_crc->val << 14);
-		if (hdl->audio_emphasis->val == V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17)
+		if (hdl->audio_emphasis->val == V4L2_CODEC_AUDIO_EMPHASIS_CCITT_J17)
 			props |= 3 << 12;
 		else
 			props |= hdl->audio_emphasis->val << 12;
 
-		if (hdl->audio_encoding->val == V4L2_MPEG_AUDIO_ENCODING_AC3) {
+		if (hdl->audio_encoding->val == V4L2_CODEC_AUDIO_ENCODING_AC3) {
 			props |=
 #if 1
 				/* Not sure if this MPEG Layer II setting is required */
-				((3 - V4L2_MPEG_AUDIO_ENCODING_LAYER_2) << 2) |
+				((3 - V4L2_CODEC_AUDIO_ENCODING_LAYER_2) << 2) |
 #endif
 				(hdl->audio_ac3_bitrate->val << 4) |
 				(CX2341X_AUDIO_ENCODING_METHOD_AC3 << 28);
@@ -1429,13 +1429,13 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 		hdl->audio_properties = props;
 		if (hdl->audio_ac3_bitrate) {
 			int is_ac3 = hdl->audio_encoding->val ==
-						V4L2_MPEG_AUDIO_ENCODING_AC3;
+						V4L2_CODEC_AUDIO_ENCODING_AC3;
 
 			v4l2_ctrl_activate(hdl->audio_ac3_bitrate, is_ac3);
 			v4l2_ctrl_activate(hdl->audio_l2_bitrate, !is_ac3);
 		}
 		v4l2_ctrl_activate(hdl->audio_mode_extension,
-			hdl->audio_mode->val == V4L2_MPEG_AUDIO_MODE_JOINT_STEREO);
+			hdl->audio_mode->val == V4L2_CODEC_AUDIO_MODE_JOINT_STEREO);
 		if (cx2341x_neq(hdl->audio_sampling_freq) &&
 		    hdl->ops && hdl->ops->s_audio_sampling_freq)
 			return hdl->ops->s_audio_sampling_freq(hdl, hdl->audio_sampling_freq->val);
@@ -1444,13 +1444,13 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 			return hdl->ops->s_audio_mode(hdl, hdl->audio_mode->val);
 		return 0;
 
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		/* video gop cluster */
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_SET_GOP_PROPERTIES, 2,
 				hdl->video_gop_size->val,
 				hdl->video_b_frames->val + 1);
 
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		/* stream type cluster */
 		err = cx2341x_hdl_api(hdl,
 			CX2341X_ENC_SET_STREAM_TYPE, 1, mpeg_stream_type[val]);
@@ -1465,21 +1465,21 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 			return err;
 
 		v4l2_ctrl_activate(hdl->video_bitrate_mode,
-			hdl->video_encoding->val != V4L2_MPEG_VIDEO_ENCODING_MPEG_1);
+			hdl->video_encoding->val != V4L2_CODEC_VIDEO_ENCODING_MPEG_1);
 		v4l2_ctrl_activate(hdl->video_bitrate_peak,
-			hdl->video_bitrate_mode->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+			hdl->video_bitrate_mode->val != V4L2_CODEC_VIDEO_BITRATE_MODE_CBR);
 		if (cx2341x_neq(hdl->video_encoding) &&
 		    hdl->ops && hdl->ops->s_video_encoding)
 			return hdl->ops->s_video_encoding(hdl, hdl->video_encoding->val);
 		return 0;
 
-	case V4L2_CID_MPEG_VIDEO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_MUTE:
 		/* video mute cluster */
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_MUTE_VIDEO, 1,
 				hdl->video_mute->val |
 					(hdl->video_mute_yuv->val << 8));
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE: {
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE: {
 		int active_filter;
 
 		/* video filter mode */
@@ -1491,15 +1491,15 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 			return err;
 
 		active_filter = hdl->video_spatial_filter_mode->val !=
-				V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO;
+				V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO;
 		v4l2_ctrl_activate(hdl->video_spatial_filter, active_filter);
 		v4l2_ctrl_activate(hdl->video_luma_spatial_filter_type, active_filter);
 		v4l2_ctrl_activate(hdl->video_chroma_spatial_filter_type, active_filter);
 		active_filter = hdl->video_temporal_filter_mode->val !=
-				V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO;
+				V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO;
 		v4l2_ctrl_activate(hdl->video_temporal_filter, active_filter);
 		active_filter = hdl->video_median_filter_type->val !=
-				V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF;
+				V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF;
 		v4l2_ctrl_activate(hdl->video_luma_median_filter_bottom, active_filter);
 		v4l2_ctrl_activate(hdl->video_luma_median_filter_top, active_filter);
 		v4l2_ctrl_activate(hdl->video_chroma_median_filter_bottom, active_filter);
@@ -1507,20 +1507,20 @@ static int cx2341x_s_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 	}
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE:
 		/* video filter type cluster */
 		return cx2341x_hdl_api(hdl,
 				CX2341X_ENC_SET_SPATIAL_FILTER_TYPE, 2,
 				hdl->video_luma_spatial_filter_type->val,
 				hdl->video_chroma_spatial_filter_type->val);
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER:
 		/* video filter cluster */
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_SET_DNR_FILTER_PROPS, 2,
 				hdl->video_spatial_filter->val,
 				hdl->video_temporal_filter->val);
 
-	case V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
+	case V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP:
 		/* video median cluster */
 		return cx2341x_hdl_api(hdl, CX2341X_ENC_SET_CORING_LEVELS, 4,
 				hdl->video_luma_median_filter_bottom->val,
@@ -1588,128 +1588,128 @@ int cx2341x_handler_init(struct cx2341x_handler *cxhdl,
 	/* Add controls in ascending control ID order for fastest
 	   insertion time. */
 	cxhdl->stream_type = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_STREAM_TYPE,
-			V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD, has_ts ? 0 : 2,
-			V4L2_MPEG_STREAM_TYPE_MPEG2_PS);
+			V4L2_CID_CODEC_STREAM_TYPE,
+			V4L2_CODEC_STREAM_TYPE_MPEG2_SVCD, has_ts ? 0 : 2,
+			V4L2_CODEC_STREAM_TYPE_MPEG2_PS);
 	cxhdl->stream_vbi_fmt = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_STREAM_VBI_FMT,
-			V4L2_MPEG_STREAM_VBI_FMT_IVTV, has_sliced_vbi ? 0 : 2,
-			V4L2_MPEG_STREAM_VBI_FMT_NONE);
+			V4L2_CID_CODEC_STREAM_VBI_FMT,
+			V4L2_CODEC_STREAM_VBI_FMT_IVTV, has_sliced_vbi ? 0 : 2,
+			V4L2_CODEC_STREAM_VBI_FMT_NONE);
 	cxhdl->audio_sampling_freq = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ,
-			V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000, 0,
-			V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000);
+			V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ,
+			V4L2_CODEC_AUDIO_SAMPLING_FREQ_32000, 0,
+			V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000);
 	cxhdl->audio_encoding = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_ENCODING,
-			V4L2_MPEG_AUDIO_ENCODING_AC3, has_ac3 ? ~0x12 : ~0x2,
-			V4L2_MPEG_AUDIO_ENCODING_LAYER_2);
+			V4L2_CID_CODEC_AUDIO_ENCODING,
+			V4L2_CODEC_AUDIO_ENCODING_AC3, has_ac3 ? ~0x12 : ~0x2,
+			V4L2_CODEC_AUDIO_ENCODING_LAYER_2);
 	cxhdl->audio_l2_bitrate = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_L2_BITRATE,
-			V4L2_MPEG_AUDIO_L2_BITRATE_384K, 0x1ff,
-			V4L2_MPEG_AUDIO_L2_BITRATE_224K);
+			V4L2_CID_CODEC_AUDIO_L2_BITRATE,
+			V4L2_CODEC_AUDIO_L2_BITRATE_384K, 0x1ff,
+			V4L2_CODEC_AUDIO_L2_BITRATE_224K);
 	cxhdl->audio_mode = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_MODE,
-			V4L2_MPEG_AUDIO_MODE_MONO, 0,
-			V4L2_MPEG_AUDIO_MODE_STEREO);
+			V4L2_CID_CODEC_AUDIO_MODE,
+			V4L2_CODEC_AUDIO_MODE_MONO, 0,
+			V4L2_CODEC_AUDIO_MODE_STEREO);
 	cxhdl->audio_mode_extension = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_MODE_EXTENSION,
-			V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16, 0,
-			V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4);
+			V4L2_CID_CODEC_AUDIO_MODE_EXTENSION,
+			V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_16, 0,
+			V4L2_CODEC_AUDIO_MODE_EXTENSION_BOUND_4);
 	cxhdl->audio_emphasis = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_EMPHASIS,
-			V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17, 0,
-			V4L2_MPEG_AUDIO_EMPHASIS_NONE);
+			V4L2_CID_CODEC_AUDIO_EMPHASIS,
+			V4L2_CODEC_AUDIO_EMPHASIS_CCITT_J17, 0,
+			V4L2_CODEC_AUDIO_EMPHASIS_NONE);
 	cxhdl->audio_crc = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_AUDIO_CRC,
-			V4L2_MPEG_AUDIO_CRC_CRC16, 0,
-			V4L2_MPEG_AUDIO_CRC_NONE);
+			V4L2_CID_CODEC_AUDIO_CRC,
+			V4L2_CODEC_AUDIO_CRC_CRC16, 0,
+			V4L2_CODEC_AUDIO_CRC_NONE);
 
-	cx2341x_ctrl_new_std(hdl, V4L2_CID_MPEG_AUDIO_MUTE, 0, 1, 1, 0);
+	cx2341x_ctrl_new_std(hdl, V4L2_CID_CODEC_AUDIO_MUTE, 0, 1, 1, 0);
 	if (has_ac3)
 		cxhdl->audio_ac3_bitrate = cx2341x_ctrl_new_menu(hdl,
-				V4L2_CID_MPEG_AUDIO_AC3_BITRATE,
-				V4L2_MPEG_AUDIO_AC3_BITRATE_448K, 0x03,
-				V4L2_MPEG_AUDIO_AC3_BITRATE_224K);
+				V4L2_CID_CODEC_AUDIO_AC3_BITRATE,
+				V4L2_CODEC_AUDIO_AC3_BITRATE_448K, 0x03,
+				V4L2_CODEC_AUDIO_AC3_BITRATE_224K);
 	cxhdl->video_encoding = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_VIDEO_ENCODING,
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_2, 0,
-			V4L2_MPEG_VIDEO_ENCODING_MPEG_2);
+			V4L2_CID_CODEC_VIDEO_ENCODING,
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_2, 0,
+			V4L2_CODEC_VIDEO_ENCODING_MPEG_2);
 	cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_VIDEO_ASPECT,
-			V4L2_MPEG_VIDEO_ASPECT_221x100, 0,
-			V4L2_MPEG_VIDEO_ASPECT_4x3);
+			V4L2_CID_CODEC_VIDEO_ASPECT,
+			V4L2_CODEC_VIDEO_ASPECT_221x100, 0,
+			V4L2_CODEC_VIDEO_ASPECT_4x3);
 	cxhdl->video_b_frames = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_B_FRAMES, 0, 33, 1, 2);
+			V4L2_CID_CODEC_VIDEO_B_FRAMES, 0, 33, 1, 2);
 	cxhdl->video_gop_size = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			1, 34, 1, cxhdl->is_50hz ? 12 : 15);
-	cx2341x_ctrl_new_std(hdl, V4L2_CID_MPEG_VIDEO_GOP_CLOSURE, 0, 1, 1, 1);
+	cx2341x_ctrl_new_std(hdl, V4L2_CID_CODEC_VIDEO_GOP_CLOSURE, 0, 1, 1, 1);
 	cxhdl->video_bitrate_mode = cx2341x_ctrl_new_menu(hdl,
-			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-			V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+			V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+			V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 0,
+			V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 	cxhdl->video_bitrate = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_BITRATE,
+			V4L2_CID_CODEC_VIDEO_BITRATE,
 			0, 27000000, 1, 6000000);
 	cxhdl->video_bitrate_peak = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+			V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 			0, 27000000, 1, 8000000);
 	cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION, 0, 255, 1, 0);
+			V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION, 0, 255, 1, 0);
 	cxhdl->video_mute = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_MUTE, 0, 1, 1, 0);
+			V4L2_CID_CODEC_VIDEO_MUTE, 0, 1, 1, 0);
 	cxhdl->video_mute_yuv = cx2341x_ctrl_new_std(hdl,
-			V4L2_CID_MPEG_VIDEO_MUTE_YUV, 0, 0xffffff, 1, 0x008080);
+			V4L2_CID_CODEC_VIDEO_MUTE_YUV, 0, 0xffffff, 1, 0x008080);
 
 	/* CX23415/6 specific */
 	cxhdl->video_spatial_filter_mode = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO, 0,
-			V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL);
+			V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL,
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO, 0,
+			V4L2_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL);
 	cxhdl->video_spatial_filter = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER,
+			V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER,
 			0, 15, 1, 0);
 	cxhdl->video_luma_spatial_filter_type = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
-			V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF,
-			V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE,
+			V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
+			V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF,
+			V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE,
 			0,
-			V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR);
+			V4L2_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR);
 	cxhdl->video_chroma_spatial_filter_type = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
-			V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF,
-			V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
+			V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
+			V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF,
+			V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR,
 			0,
-			V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR);
+			V4L2_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR);
 	cxhdl->video_temporal_filter_mode = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO,
+			V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL,
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO,
 			0,
-			V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL);
+			V4L2_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL);
 	cxhdl->video_temporal_filter = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER,
+			V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER,
 			0, 31, 1, 8);
 	cxhdl->video_median_filter_type = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
-			V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
-			V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG,
+			V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
+			V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF,
+			V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG,
 			0,
-			V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF);
+			V4L2_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF);
 	cxhdl->video_luma_median_filter_bottom = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
+			V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
 			0, 255, 1, 0);
 	cxhdl->video_luma_median_filter_top = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
+			V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
 			0, 255, 1, 255);
 	cxhdl->video_chroma_median_filter_bottom = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
+			V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
 			0, 255, 1, 0);
 	cxhdl->video_chroma_median_filter_top = cx2341x_ctrl_new_custom(hdl,
-			V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
+			V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
 			0, 255, 1, 255);
-	cx2341x_ctrl_new_custom(hdl, V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS,
+	cx2341x_ctrl_new_custom(hdl, V4L2_CID_CODEC_CX2341X_STREAM_INSERT_NAV_PACKETS,
 			0, 1, 1, 0);
 
 	if (hdl->error) {
@@ -1752,7 +1752,7 @@ int cx2341x_handler_setup(struct cx2341x_handler *cxhdl)
 	if (err)
 		return err;
 
-	if (v4l2_ctrl_g_ctrl(cxhdl->video_encoding) == V4L2_MPEG_VIDEO_ENCODING_MPEG_1) {
+	if (v4l2_ctrl_g_ctrl(cxhdl->video_encoding) == V4L2_CODEC_VIDEO_ENCODING_MPEG_1) {
 		w /= 2;
 		h /= 2;
 	}
-- 
2.30.1

