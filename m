Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03287339EA9
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234075AbhCMOnx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:53 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43711 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234043AbhCMOnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UJlV5fM; Sat, 13 Mar 2021 15:43:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646611; bh=3d7D++bS5q9Gy64oww8ABQ29Cez/HNEYkabgbmhdByQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=qEpekST1L1dC/vmU+kPIqc3GmOmgBB2K2jVQ0YhTetD5RnOIIuTEJMdsHrGoxwXKJ
         SctLCUd/ic8cbrE5dzU6NYzWk4j+bkoT01SuOv3K5H2TuKpPrRko4wQ9yAdl8WxLQR
         QbpQ4jkZbQabIieHSPJu5TkKD4aFH5Nrr3V7+oxb5z4fxbSYxw0oe4j/vTn6vRujdR
         acfvC9ACUWj1Nc+WI8+eoRIs/kpI1rG+IdJNA9JeBj9tHAFLXcS9BD7gtpVzZUnp0t
         h0DHCvGgt+c0aSSZkkp3dOwTaVe2r2d/y3PmFRafDTX6GNgcsD0QgD2LRjZ420juea
         GdbXud0f6rPLQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 12/15] include/media: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:20 +0100
Message-Id: <20210313144323.143600-13-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGjXQlB6dPm00Q5+tRzwB3aFZ8OPWH98sQ8KnCSmkllNXyOGRQ451yEBhBRoSYMx/70Ei/1lTHb4u1Yw6H0ALeY4fngk6nnf7VxwMjVJZ/QCpkLpMsRG
 0cbnbgZrMioPgn2hCI1grQsUPJS4MPV7NF0UM8f3Qt46iZkw1yyvlU5ZteXZXVD7CVPHuWYjWWnA7sAzN4+F8MCOgsnyOHL8eOqVNGSWDDRgqL0ulujm5oSG
 weKk9dhW0UbALkS0GbKq4Ua7DNlgTvhiDCO8eUKkv+J+RlHCMgI1ZUYQVYYllrLhoOtQ7bGTxoQ5ns0gcRVG3SUfLe21/fiJSZ6KWQ+tbog6fM3CObuQ2YzZ
 CclsM0VNtE3ny/g1X0fBANEUoLwNfQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 include/media/drv-intf/cx2341x.h | 36 ++++++++++++++++----------------
 include/media/hevc-ctrls.h       | 22 +++++++++----------
 include/media/mpeg2-ctrls.h      |  4 ++--
 include/media/vp8-ctrls.h        |  2 +-
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/media/drv-intf/cx2341x.h b/include/media/drv-intf/cx2341x.h
index 722f5905fc30..9312409fa8f9 100644
--- a/include/media/drv-intf/cx2341x.h
+++ b/include/media/drv-intf/cx2341x.h
@@ -30,29 +30,29 @@ struct cx2341x_mpeg_params {
 	u16 is_50hz;
 
 	/* stream */
-	enum v4l2_mpeg_stream_type stream_type;
-	enum v4l2_mpeg_stream_vbi_fmt stream_vbi_fmt;
+	enum v4l2_codec_stream_type stream_type;
+	enum v4l2_codec_stream_vbi_fmt stream_vbi_fmt;
 	u16 stream_insert_nav_packets;
 
 	/* audio */
-	enum v4l2_mpeg_audio_sampling_freq audio_sampling_freq;
-	enum v4l2_mpeg_audio_encoding audio_encoding;
-	enum v4l2_mpeg_audio_l2_bitrate audio_l2_bitrate;
-	enum v4l2_mpeg_audio_ac3_bitrate audio_ac3_bitrate;
-	enum v4l2_mpeg_audio_mode audio_mode;
-	enum v4l2_mpeg_audio_mode_extension audio_mode_extension;
-	enum v4l2_mpeg_audio_emphasis audio_emphasis;
-	enum v4l2_mpeg_audio_crc audio_crc;
+	enum v4l2_codec_audio_sampling_freq audio_sampling_freq;
+	enum v4l2_codec_audio_encoding audio_encoding;
+	enum v4l2_codec_audio_l2_bitrate audio_l2_bitrate;
+	enum v4l2_codec_audio_ac3_bitrate audio_ac3_bitrate;
+	enum v4l2_codec_audio_mode audio_mode;
+	enum v4l2_codec_audio_mode_extension audio_mode_extension;
+	enum v4l2_codec_audio_emphasis audio_emphasis;
+	enum v4l2_codec_audio_crc audio_crc;
 	u32 audio_properties;
 	u16 audio_mute;
 
 	/* video */
-	enum v4l2_mpeg_video_encoding video_encoding;
-	enum v4l2_mpeg_video_aspect video_aspect;
+	enum v4l2_codec_video_encoding video_encoding;
+	enum v4l2_codec_video_aspect video_aspect;
 	u16 video_b_frames;
 	u16 video_gop_size;
 	u16 video_gop_closure;
-	enum v4l2_mpeg_video_bitrate_mode video_bitrate_mode;
+	enum v4l2_codec_video_bitrate_mode video_bitrate_mode;
 	u32 video_bitrate;
 	u32 video_bitrate_peak;
 	u16 video_temporal_decimation;
@@ -60,13 +60,13 @@ struct cx2341x_mpeg_params {
 	u32 video_mute_yuv;
 
 	/* encoding filters */
-	enum v4l2_mpeg_cx2341x_video_spatial_filter_mode video_spatial_filter_mode;
+	enum v4l2_codec_cx2341x_video_spatial_filter_mode video_spatial_filter_mode;
 	u16 video_spatial_filter;
-	enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type video_luma_spatial_filter_type;
-	enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type video_chroma_spatial_filter_type;
-	enum v4l2_mpeg_cx2341x_video_temporal_filter_mode video_temporal_filter_mode;
+	enum v4l2_codec_cx2341x_video_luma_spatial_filter_type video_luma_spatial_filter_type;
+	enum v4l2_codec_cx2341x_video_chroma_spatial_filter_type video_chroma_spatial_filter_type;
+	enum v4l2_codec_cx2341x_video_temporal_filter_mode video_temporal_filter_mode;
 	u16 video_temporal_filter;
-	enum v4l2_mpeg_cx2341x_video_median_filter_type video_median_filter_type;
+	enum v4l2_codec_cx2341x_video_median_filter_type video_median_filter_type;
 	u16 video_luma_median_filter_top;
 	u16 video_luma_median_filter_bottom;
 	u16 video_chroma_median_filter_top;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index b4cb2ef02f17..ff2a89f38948 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -16,25 +16,25 @@
 /* The pixel format isn't stable at the moment and will likely be renamed. */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 
-#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
-#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
-#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
-#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
-#define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
+#define V4L2_CID_CODEC_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
+#define V4L2_CID_CODEC_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
+#define V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
+#define V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
+#define V4L2_CID_CODEC_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
 #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
 #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
 
-enum v4l2_mpeg_video_hevc_decode_mode {
-	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
-	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+enum v4l2_codec_video_hevc_decode_mode {
+	V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
+	V4L2_CODEC_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
 };
 
-enum v4l2_mpeg_video_hevc_start_code {
-	V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
-	V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+enum v4l2_codec_video_hevc_start_code {
+	V4L2_CODEC_VIDEO_HEVC_START_CODE_NONE,
+	V4L2_CODEC_VIDEO_HEVC_START_CODE_ANNEX_B,
 };
 
 #define V4L2_HEVC_SLICE_TYPE_B	0
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 2a4ae6701166..bb38e42eaf19 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -11,8 +11,8 @@
 #ifndef _MPEG2_CTRLS_H_
 #define _MPEG2_CTRLS_H_
 
-#define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_CODEC_BASE+251)
+#define V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
+#define V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_CODEC_BASE+251)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 3969550df148..81b97ed0b03b 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -15,7 +15,7 @@
 
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F')
 
-#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (V4L2_CID_CODEC_BASE + 2000)
+#define V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER (V4L2_CID_CODEC_BASE + 2000)
 #define V4L2_CTRL_TYPE_VP8_FRAME_HEADER 0x301
 
 #define V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED              0x01
-- 
2.30.1

