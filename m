Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF15339E9D
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbhCMOnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39887 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234020AbhCMOn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UGlV5dP; Sat, 13 Mar 2021 15:43:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646608; bh=a748ORnM9/QTfJ2i54TMjx61l3IV0+MMa/JWC43JzhY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=m/4p7hFcKa9XkVRKm6R2uHcg/Zfq0qaEbqM4GVvPTZfVFIMp1rlArUX7DTc9P4+JV
         6vwvI1nCLxv1Z7sSvzLVpdVLy+sL5Pg1kc3S/IMjGjH+qdjNBQ1hFxbJKabbpQ6mfK
         j0PelE7IUnXq8Em3zAnTACKX7VcI6wY5z0wp1V6dfC86iPp8Ob44laN4mstYGYLeu7
         oB1sNZdvzm9o15n+gIzWO6Q4DOT7fmaN3oLIiCaoa/yubtCu+BiYUuNHLHSWnNq2QH
         LVWPOOpqM3Qy0P5zW3TP8jOHfH5x48a6aLh3v4DL/wdv32HJJQtExKXNLCjqC4tcpH
         90XI1xd9GG+mg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/15] media/i2c: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:13 +0100
Message-Id: <20210313144323.143600-6-hverkuil-cisco@xs4all.nl>
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
 drivers/media/i2c/saa6752hs.c | 144 +++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index 6171ced809bb..8c4731495739 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -53,13 +53,13 @@ struct saa6752hs_mpeg_params {
 	__u16				ts_pid_pcr;
 
 	/* audio */
-	enum v4l2_mpeg_audio_encoding    au_encoding;
-	enum v4l2_mpeg_audio_l2_bitrate  au_l2_bitrate;
-	enum v4l2_mpeg_audio_ac3_bitrate au_ac3_bitrate;
+	enum v4l2_codec_audio_encoding    au_encoding;
+	enum v4l2_codec_audio_l2_bitrate  au_l2_bitrate;
+	enum v4l2_codec_audio_ac3_bitrate au_ac3_bitrate;
 
 	/* video */
-	enum v4l2_mpeg_video_aspect	vi_aspect;
-	enum v4l2_mpeg_video_bitrate_mode vi_bitrate_mode;
+	enum v4l2_codec_video_aspect	vi_aspect;
+	enum v4l2_codec_video_bitrate_mode vi_bitrate_mode;
 	__u32				vi_bitrate;
 	__u32				vi_bitrate_peak;
 };
@@ -207,14 +207,14 @@ static const struct saa6752hs_mpeg_params param_defaults =
 	.ts_pid_audio    = 256,
 	.ts_pid_pcr      = 259,
 
-	.vi_aspect       = V4L2_MPEG_VIDEO_ASPECT_4x3,
+	.vi_aspect       = V4L2_CODEC_VIDEO_ASPECT_4x3,
 	.vi_bitrate      = 4000,
 	.vi_bitrate_peak = 6000,
-	.vi_bitrate_mode = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+	.vi_bitrate_mode = V4L2_CODEC_VIDEO_BITRATE_MODE_VBR,
 
-	.au_encoding     = V4L2_MPEG_AUDIO_ENCODING_LAYER_2,
-	.au_l2_bitrate   = V4L2_MPEG_AUDIO_L2_BITRATE_256K,
-	.au_ac3_bitrate  = V4L2_MPEG_AUDIO_AC3_BITRATE_256K,
+	.au_encoding     = V4L2_CODEC_AUDIO_ENCODING_LAYER_2,
+	.au_l2_bitrate   = V4L2_CODEC_AUDIO_L2_BITRATE_256K,
+	.au_ac3_bitrate  = V4L2_CODEC_AUDIO_AC3_BITRATE_256K,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -314,10 +314,10 @@ static int saa6752hs_set_bitrate(struct i2c_client *client,
 
 	/* set the bitrate mode */
 	set_reg8(client, 0x71,
-		params->vi_bitrate_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+		params->vi_bitrate_mode != V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 
 	/* set the video bitrate */
-	if (params->vi_bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) {
+	if (params->vi_bitrate_mode == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR) {
 		/* set the target bitrate */
 		set_reg16(client, 0x80, params->vi_bitrate);
 
@@ -332,13 +332,13 @@ static int saa6752hs_set_bitrate(struct i2c_client *client,
 
 	/* set the audio encoding */
 	set_reg8(client, 0x93,
-			params->au_encoding == V4L2_MPEG_AUDIO_ENCODING_AC3);
+			params->au_encoding == V4L2_CODEC_AUDIO_ENCODING_AC3);
 
 	/* set the audio bitrate */
-	if (params->au_encoding == V4L2_MPEG_AUDIO_ENCODING_AC3)
-		is_384k = V4L2_MPEG_AUDIO_AC3_BITRATE_384K == params->au_ac3_bitrate;
+	if (params->au_encoding == V4L2_CODEC_AUDIO_ENCODING_AC3)
+		is_384k = V4L2_CODEC_AUDIO_AC3_BITRATE_384K == params->au_ac3_bitrate;
 	else
-		is_384k = V4L2_MPEG_AUDIO_L2_BITRATE_384K == params->au_l2_bitrate;
+		is_384k = V4L2_CODEC_AUDIO_L2_BITRATE_384K == params->au_l2_bitrate;
 	set_reg8(client, 0x94, is_384k);
 	tot_bitrate += is_384k ? 384 : 256;
 
@@ -361,9 +361,9 @@ static int saa6752hs_try_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct saa6752hs_state, hdl);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		/* peak bitrate shall be >= normal bitrate */
-		if (ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+		if (ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR &&
 		    h->video_bitrate_peak->val < h->video_bitrate->val)
 			h->video_bitrate_peak->val = h->video_bitrate->val;
 		break;
@@ -378,42 +378,42 @@ static int saa6752hs_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct saa6752hs_mpeg_params *params = &h->params;
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		break;
-	case V4L2_CID_MPEG_STREAM_PID_PMT:
+	case V4L2_CID_CODEC_STREAM_PID_PMT:
 		params->ts_pid_pmt = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_STREAM_PID_AUDIO:
+	case V4L2_CID_CODEC_STREAM_PID_AUDIO:
 		params->ts_pid_audio = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_STREAM_PID_VIDEO:
+	case V4L2_CID_CODEC_STREAM_PID_VIDEO:
 		params->ts_pid_video = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_STREAM_PID_PCR:
+	case V4L2_CID_CODEC_STREAM_PID_PCR:
 		params->ts_pid_pcr = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		params->au_encoding = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
 		params->au_l2_bitrate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
 		params->au_ac3_bitrate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		break;
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		break;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		params->vi_aspect = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		params->vi_bitrate_mode = ctrl->val;
 		params->vi_bitrate = h->video_bitrate->val / 1000;
 		params->vi_bitrate_peak = h->video_bitrate_peak->val / 1000;
 		v4l2_ctrl_activate(h->video_bitrate_peak,
-				ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+				ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 		break;
 	default:
 		return -EINVAL;
@@ -469,7 +469,7 @@ static int saa6752hs_init(struct v4l2_subdev *sd, u32 leading_null_bytes)
 	localPAT[sizeof(PAT) - 1] = crc & 0xFF;
 
 	/* compute PMT */
-	if (h->params.au_encoding == V4L2_MPEG_AUDIO_ENCODING_AC3) {
+	if (h->params.au_encoding == V4L2_CODEC_AUDIO_ENCODING_AC3) {
 		size = sizeof(PMT_AC3);
 		memcpy(localPMT, PMT_AC3, size);
 	} else {
@@ -527,10 +527,10 @@ static int saa6752hs_init(struct v4l2_subdev *sd, u32 leading_null_bytes)
 	buf[4] = 0xB0;
 	buf[5] = buf2[0];
 	switch (h->params.vi_aspect) {
-	case V4L2_MPEG_VIDEO_ASPECT_16x9:
+	case V4L2_CODEC_VIDEO_ASPECT_16x9:
 		buf[6] = buf2[1] | 0x40;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_4x3:
+	case V4L2_CODEC_VIDEO_ASPECT_4x3:
 	default:
 		buf[6] = buf2[1] & 0xBF;
 		break;
@@ -690,67 +690,67 @@ static int saa6752hs_probe(struct i2c_client *client,
 	hdl = &h->hdl;
 	v4l2_ctrl_handler_init(hdl, 14);
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_AUDIO_ENCODING,
-		h->has_ac3 ? V4L2_MPEG_AUDIO_ENCODING_AC3 :
-			V4L2_MPEG_AUDIO_ENCODING_LAYER_2,
-		0x0d, V4L2_MPEG_AUDIO_ENCODING_LAYER_2);
+		V4L2_CID_CODEC_AUDIO_ENCODING,
+		h->has_ac3 ? V4L2_CODEC_AUDIO_ENCODING_AC3 :
+			V4L2_CODEC_AUDIO_ENCODING_LAYER_2,
+		0x0d, V4L2_CODEC_AUDIO_ENCODING_LAYER_2);
 
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_AUDIO_L2_BITRATE,
-		V4L2_MPEG_AUDIO_L2_BITRATE_384K,
-		~((1 << V4L2_MPEG_AUDIO_L2_BITRATE_256K) |
-		  (1 << V4L2_MPEG_AUDIO_L2_BITRATE_384K)),
-		V4L2_MPEG_AUDIO_L2_BITRATE_256K);
+		V4L2_CID_CODEC_AUDIO_L2_BITRATE,
+		V4L2_CODEC_AUDIO_L2_BITRATE_384K,
+		~((1 << V4L2_CODEC_AUDIO_L2_BITRATE_256K) |
+		  (1 << V4L2_CODEC_AUDIO_L2_BITRATE_384K)),
+		V4L2_CODEC_AUDIO_L2_BITRATE_256K);
 
 	if (h->has_ac3)
 		v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-			V4L2_CID_MPEG_AUDIO_AC3_BITRATE,
-			V4L2_MPEG_AUDIO_AC3_BITRATE_384K,
-			~((1 << V4L2_MPEG_AUDIO_AC3_BITRATE_256K) |
-			  (1 << V4L2_MPEG_AUDIO_AC3_BITRATE_384K)),
-			V4L2_MPEG_AUDIO_AC3_BITRATE_256K);
+			V4L2_CID_CODEC_AUDIO_AC3_BITRATE,
+			V4L2_CODEC_AUDIO_AC3_BITRATE_384K,
+			~((1 << V4L2_CODEC_AUDIO_AC3_BITRATE_256K) |
+			  (1 << V4L2_CODEC_AUDIO_AC3_BITRATE_384K)),
+			V4L2_CODEC_AUDIO_AC3_BITRATE_256K);
 
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ,
-		V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000,
-		~(1 << V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000),
-		V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000);
+		V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ,
+		V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000,
+		~(1 << V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000),
+		V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000);
 
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_ENCODING,
-		V4L2_MPEG_VIDEO_ENCODING_MPEG_2,
-		~(1 << V4L2_MPEG_VIDEO_ENCODING_MPEG_2),
-		V4L2_MPEG_VIDEO_ENCODING_MPEG_2);
+		V4L2_CID_CODEC_VIDEO_ENCODING,
+		V4L2_CODEC_VIDEO_ENCODING_MPEG_2,
+		~(1 << V4L2_CODEC_VIDEO_ENCODING_MPEG_2),
+		V4L2_CODEC_VIDEO_ENCODING_MPEG_2);
 
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_ASPECT,
-		V4L2_MPEG_VIDEO_ASPECT_16x9, 0x01,
-		V4L2_MPEG_VIDEO_ASPECT_4x3);
+		V4L2_CID_CODEC_VIDEO_ASPECT,
+		V4L2_CODEC_VIDEO_ASPECT_16x9, 0x01,
+		V4L2_CODEC_VIDEO_ASPECT_4x3);
 
 	h->video_bitrate_peak = v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+		V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 		1000000, 27000000, 1000, 8000000);
 
 	v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_TYPE,
-		V4L2_MPEG_STREAM_TYPE_MPEG2_TS,
-		~(1 << V4L2_MPEG_STREAM_TYPE_MPEG2_TS),
-		V4L2_MPEG_STREAM_TYPE_MPEG2_TS);
+		V4L2_CID_CODEC_STREAM_TYPE,
+		V4L2_CODEC_STREAM_TYPE_MPEG2_TS,
+		~(1 << V4L2_CODEC_STREAM_TYPE_MPEG2_TS),
+		V4L2_CODEC_STREAM_TYPE_MPEG2_TS);
 
 	h->video_bitrate_mode = v4l2_ctrl_new_std_menu(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+		V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+		V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 0,
+		V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 	h->video_bitrate = v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE, 1000000, 27000000, 1000, 6000000);
+		V4L2_CID_CODEC_VIDEO_BITRATE, 1000000, 27000000, 1000, 6000000);
 	v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_PID_PMT, 0, (1 << 14) - 1, 1, 16);
+		V4L2_CID_CODEC_STREAM_PID_PMT, 0, (1 << 14) - 1, 1, 16);
 	v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_PID_AUDIO, 0, (1 << 14) - 1, 1, 260);
+		V4L2_CID_CODEC_STREAM_PID_AUDIO, 0, (1 << 14) - 1, 1, 260);
 	v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_PID_VIDEO, 0, (1 << 14) - 1, 1, 256);
+		V4L2_CID_CODEC_STREAM_PID_VIDEO, 0, (1 << 14) - 1, 1, 256);
 	v4l2_ctrl_new_std(hdl, &saa6752hs_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_PID_PCR, 0, (1 << 14) - 1, 1, 259);
+		V4L2_CID_CODEC_STREAM_PID_PCR, 0, (1 << 14) - 1, 1, 259);
 	sd->ctrl_handler = hdl;
 	if (hdl->error) {
 		int err = hdl->error;
-- 
2.30.1

