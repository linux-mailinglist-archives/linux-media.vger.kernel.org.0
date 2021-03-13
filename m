Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9FA339EA7
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhCMOnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:52 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38955 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234028AbhCMOna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UGlV5de; Sat, 13 Mar 2021 15:43:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646609; bh=X67Pp9EBvQGjLRQjuUmeI/5BUyi0LEGUEfAn5dV5FaU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=eoQKxbnN6BBYjNLU7aYqtGHKNccZt4xigDf05tY/UgaH6FYcsqiNTZXRZDfZwiDVi
         uIEn1/VvdlqtBskJpF9AqDubU9d7S+bOqG+BEmhnIIVJkL/irKIYuuYvTrDfrJnePR
         k8kx6yZjtfPgn3zcSci0dnHIDrBt/AmbXP0rVW7URbtVyvXbx7DmgAl87OnKo/OsP+
         6/vSYGuvXpmZp32lQNX53jPJ0L7dZqSbjDwmOuJByI8IuOjmVRR7/v/VRrDBY6gEYq
         jx2+gbebx9rymCmv11MGwr9RWAly8HfGIQqQBGpY3Acn8yYSAN/INzWfn2UALA3Wxj
         0VvtVDvDEioWg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/15] media/v4l2-core: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:14 +0100
Message-Id: <20210313144323.143600-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHB20MmtF5ZcYetgXeMEMm916KOLGm4CPZp4loUBMb4p735IcJ67kybPCw6oLhk36CkLiIbYkSy/XTsGdBZMReFwjEZwC922p9K7bU4wslAFdYlR5M7M
 dSkvAl5oCD5Eps37hYkSc/INvgFdyL4ayp75pW0RWxRN/Z/GeWD0y44I5Z6D3gjTM1DNgK8JVcV1YCXHdjsBOf8B04vYoJ0zC1OJxDZyC37ES+VumK3BGuT/
 ltuj5UhuoVVT+uDCgWcfNEMHd0uyQkpT4M6455DHwYFyIuqnsgELwMnEsa2IXyDbrGlTq7uUo+FzIbApU+9/N4hUTW8pPXf5/TpnS5hxCbmTwr1qpBizIMEK
 jFUhB5vxbxvJ6+r+NOgJr8jCvLWy1g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 640 +++++++++++++--------------
 1 file changed, 320 insertions(+), 320 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 016cf6204cbb..0ec174a74346 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -616,38 +616,38 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 	};
 
 	switch (id) {
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
 		return mpeg_audio_sampling_freq;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		return mpeg_audio_encoding;
-	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L1_BITRATE:
 		return mpeg_audio_l1_bitrate;
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
 		return mpeg_audio_l2_bitrate;
-	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L3_BITRATE:
 		return mpeg_audio_l3_bitrate;
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
 		return mpeg_audio_ac3_bitrate;
-	case V4L2_CID_MPEG_AUDIO_MODE:
+	case V4L2_CID_CODEC_AUDIO_MODE:
 		return mpeg_audio_mode;
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION:
 		return mpeg_audio_mode_extension;
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:
 		return mpeg_audio_emphasis;
-	case V4L2_CID_MPEG_AUDIO_CRC:
+	case V4L2_CID_CODEC_AUDIO_CRC:
 		return mpeg_audio_crc;
-	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:
-	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
+	case V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK:
+	case V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
 		return mpeg_audio_dec_playback;
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		return mpeg_video_encoding;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		return mpeg_video_aspect;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		return mpeg_video_bitrate_mode;
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		return mpeg_stream_type;
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 		return mpeg_stream_vbi_fmt;
 	case V4L2_CID_POWER_LINE_FREQUENCY:
 		return camera_power_line_frequency;
@@ -673,45 +673,45 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return flash_led_mode;
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		return flash_strobe_source;
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
 		return header_mode;
-	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE:
 		return mpeg_video_frame_skip;
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:
 		return multi_slice;
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
 		return entropy_mode;
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
 		return mpeg_h264_level;
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
 		return h264_loop_filter;
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
 		return h264_profile;
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC:
 		return vui_sar_idc;
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 		return h264_fp_arrangement_type;
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_MAP_TYPE:
 		return h264_fmo_map_type;
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 		return h264_decode_mode;
 	case V4L2_CID_STATELESS_H264_START_CODE:
 		return h264_start_code;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL:
 		return mpeg_mpeg2_level;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE:
 		return mpeg2_profile;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
 		return mpeg_mpeg4_level;
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
 		return mpeg4_profile;
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL:
 		return vpx_golden_frame_sel;
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
 		return vp8_profile;
-	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP9_PROFILE:
 		return vp9_profile;
-	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_VP9_LEVEL:
 		return vp9_level;
 	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
 		return jpeg_chroma_subsampling;
@@ -725,23 +725,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return dv_it_content_type;
 	case V4L2_CID_DETECT_MD_MODE:
 		return detect_md_mode;
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_PROFILE:
 		return hevc_profile;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LEVEL:
 		return hevc_level;
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE:
 		return hevc_hierarchial_coding_type;
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE:
 		return hevc_refresh_type;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
+	case V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
 		return hevc_size_of_length_field;
-	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
+	case V4L2_CID_CODEC_VIDEO_HEVC_TIER:
 		return hevc_tier;
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE:
 		return hevc_loop_filter_mode;
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE:
 		return hevc_decode_mode;
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_START_CODE:
 		return hevc_start_code;
 	case V4L2_CID_CAMERA_ORIENTATION:
 		return camera_orientation;
@@ -767,9 +767,9 @@ const s64 *v4l2_ctrl_get_int_menu(u32 id, u32 *len)
 	};
 
 	switch (id) {
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS:
 		return __v4l2_qmenu_int_len(qmenu_int_vpx_num_partitions, len);
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES:
 		return __v4l2_qmenu_int_len(qmenu_int_vpx_num_ref_frames, len);
 	default:
 		*len = 0;
@@ -831,205 +831,205 @@ const char *v4l2_ctrl_get_name(u32 id)
 	 * and the 'MPEG' part of the define is historical */
 	/* Keep the order of the 'case's the same as in videodev2.h! */
 	case V4L2_CID_CODEC_CLASS:		return "Codec Controls";
-	case V4L2_CID_MPEG_STREAM_TYPE:		return "Stream Type";
-	case V4L2_CID_MPEG_STREAM_PID_PMT:	return "Stream PMT Program ID";
-	case V4L2_CID_MPEG_STREAM_PID_AUDIO:	return "Stream Audio Program ID";
-	case V4L2_CID_MPEG_STREAM_PID_VIDEO:	return "Stream Video Program ID";
-	case V4L2_CID_MPEG_STREAM_PID_PCR:	return "Stream PCR Program ID";
-	case V4L2_CID_MPEG_STREAM_PES_ID_AUDIO: return "Stream PES Audio ID";
-	case V4L2_CID_MPEG_STREAM_PES_ID_VIDEO: return "Stream PES Video ID";
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:	return "Stream VBI Format";
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ: return "Audio Sampling Frequency";
-	case V4L2_CID_MPEG_AUDIO_ENCODING:	return "Audio Encoding";
-	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:	return "Audio Layer I Bitrate";
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:	return "Audio Layer II Bitrate";
-	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:	return "Audio Layer III Bitrate";
-	case V4L2_CID_MPEG_AUDIO_MODE:		return "Audio Stereo Mode";
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION: return "Audio Stereo Mode Extension";
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:	return "Audio Emphasis";
-	case V4L2_CID_MPEG_AUDIO_CRC:		return "Audio CRC";
-	case V4L2_CID_MPEG_AUDIO_MUTE:		return "Audio Mute";
-	case V4L2_CID_MPEG_AUDIO_AAC_BITRATE:	return "Audio AAC Bitrate";
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:	return "Audio AC-3 Bitrate";
-	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:	return "Audio Playback";
-	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK: return "Audio Multilingual Playback";
-	case V4L2_CID_MPEG_VIDEO_ENCODING:	return "Video Encoding";
-	case V4L2_CID_MPEG_VIDEO_ASPECT:	return "Video Aspect";
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:	return "Video B Frames";
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:	return "Video GOP Size";
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
-	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
-	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
-	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
-	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
-	case V4L2_CID_MPEG_VIDEO_MUTE:		return "Video Mute";
-	case V4L2_CID_MPEG_VIDEO_MUTE_YUV:	return "Video Mute YUV";
-	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
-	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
-	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
-	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
-	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:			return "H263 Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:			return "H263 Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:		return "H264 I-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:		return "H264 P-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:		return "H264 B-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:			return "H264 Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:			return "H264 Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:		return "H264 8x8 Transform Enable";
-	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:			return "H264 CPB Buffer Size";
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:		return "H264 Entropy Mode";
-	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:			return "H264 I-Frame Period";
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:			return "H264 Level";
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:	return "H264 Loop Filter Alpha Offset";
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:		return "H264 Loop Filter Beta Offset";
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:		return "H264 Loop Filter Mode";
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:			return "H264 Profile";
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:	return "Vertical Size of SAR";
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:	return "Horizontal Size of SAR";
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:		return "Aspect Ratio VUI Enable";
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:		return "VUI Aspect Ratio IDC";
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:	return "H264 Enable Frame Packing SEI";
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:	return "H264 Set Curr. Frame as Frame0";
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:	return "H264 FP Arrangement Type";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO:			return "H264 Flexible MB Ordering";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:		return "H264 Map Type for FMO";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP:		return "H264 FMO Number of Slice Groups";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION:	return "H264 FMO Direction of Change";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE:		return "H264 FMO Size of 1st Slice Grp";
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH:		return "H264 FMO No. of Consecutive MBs";
-	case V4L2_CID_MPEG_VIDEO_H264_ASO:			return "H264 Arbitrary Slice Ordering";
-	case V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER:		return "H264 ASO Slice Order";
-	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:	return "Enable H264 Hierarchical Coding";
-	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:	return "H264 Hierarchical Coding Type";
-	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:return "H264 Number of HC Layers";
-	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
+	case V4L2_CID_CODEC_STREAM_TYPE:	return "Stream Type";
+	case V4L2_CID_CODEC_STREAM_PID_PMT:	return "Stream PMT Program ID";
+	case V4L2_CID_CODEC_STREAM_PID_AUDIO:	return "Stream Audio Program ID";
+	case V4L2_CID_CODEC_STREAM_PID_VIDEO:	return "Stream Video Program ID";
+	case V4L2_CID_CODEC_STREAM_PID_PCR:	return "Stream PCR Program ID";
+	case V4L2_CID_CODEC_STREAM_PES_ID_AUDIO: return "Stream PES Audio ID";
+	case V4L2_CID_CODEC_STREAM_PES_ID_VIDEO: return "Stream PES Video ID";
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:	return "Stream VBI Format";
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ: return "Audio Sampling Frequency";
+	case V4L2_CID_CODEC_AUDIO_ENCODING:	return "Audio Encoding";
+	case V4L2_CID_CODEC_AUDIO_L1_BITRATE:	return "Audio Layer I Bitrate";
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:	return "Audio Layer II Bitrate";
+	case V4L2_CID_CODEC_AUDIO_L3_BITRATE:	return "Audio Layer III Bitrate";
+	case V4L2_CID_CODEC_AUDIO_MODE:		return "Audio Stereo Mode";
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION: return "Audio Stereo Mode Extension";
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:	return "Audio Emphasis";
+	case V4L2_CID_CODEC_AUDIO_CRC:		return "Audio CRC";
+	case V4L2_CID_CODEC_AUDIO_MUTE:		return "Audio Mute";
+	case V4L2_CID_CODEC_AUDIO_AAC_BITRATE:	return "Audio AAC Bitrate";
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:	return "Audio AC-3 Bitrate";
+	case V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK:	return "Audio Playback";
+	case V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK: return "Audio Multilingual Playback";
+	case V4L2_CID_CODEC_VIDEO_ENCODING:	return "Video Encoding";
+	case V4L2_CID_CODEC_VIDEO_ASPECT:	return "Video Aspect";
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:	return "Video B Frames";
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:	return "Video GOP Size";
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
+	case V4L2_CID_CODEC_VIDEO_PULLDOWN:	return "Video Pulldown";
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
+	case V4L2_CID_CODEC_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
+	case V4L2_CID_CODEC_VIDEO_BITRATE:	return "Video Bitrate";
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
+	case V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
+	case V4L2_CID_CODEC_VIDEO_MUTE:		return "Video Mute";
+	case V4L2_CID_CODEC_VIDEO_MUTE_YUV:	return "Video Mute YUV";
+	case V4L2_CID_CODEC_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
+	case V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
+	case V4L2_CID_CODEC_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
+	case V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
+	case V4L2_CID_CODEC_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
+	case V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
+	case V4L2_CID_CODEC_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H263_MIN_QP:			return "H263 Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H263_MAX_QP:			return "H263 Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_QP:		return "H264 I-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_QP:		return "H264 P-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_QP:		return "H264 B-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_MAX_QP:			return "H264 Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:			return "H264 Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM:		return "H264 8x8 Transform Enable";
+	case V4L2_CID_CODEC_VIDEO_H264_CPB_SIZE:		return "H264 CPB Buffer Size";
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:		return "H264 Entropy Mode";
+	case V4L2_CID_CODEC_VIDEO_H264_I_PERIOD:		return "H264 I-Frame Period";
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:			return "H264 Level";
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_ALPHA:	return "H264 Loop Filter Alpha Offset";
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_BETA:	return "H264 Loop Filter Beta Offset";
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:	return "H264 Loop Filter Mode";
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:			return "H264 Profile";
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_HEIGHT:	return "Vertical Size of SAR";
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_EXT_SAR_WIDTH:	return "Horizontal Size of SAR";
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE:		return "Aspect Ratio VUI Enable";
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC:		return "VUI Aspect Ratio IDC";
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FRAME_PACKING:	return "H264 Enable Frame Packing SEI";
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:	return "H264 Set Curr. Frame as Frame0";
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:	return "H264 FP Arrangement Type";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO:			return "H264 Flexible MB Ordering";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_MAP_TYPE:		return "H264 Map Type for FMO";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_SLICE_GROUP:		return "H264 FMO Number of Slice Groups";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_CHANGE_DIRECTION:	return "H264 FMO Direction of Change";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_CHANGE_RATE:		return "H264 FMO Size of 1st Slice Grp";
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_RUN_LENGTH:		return "H264 FMO No. of Consecutive MBs";
+	case V4L2_CID_CODEC_VIDEO_H264_ASO:			return "H264 Arbitrary Slice Ordering";
+	case V4L2_CID_CODEC_VIDEO_H264_ASO_SLICE_ORDER:		return "H264 ASO Slice Order";
+	case V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING:	return "Enable H264 Hierarchical Coding";
+	case V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_TYPE:return "H264 Hierarchical Coding Type";
+	case V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_LAYER:return "H264 Number of HC Layers";
+	case V4L2_CID_CODEC_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
 								return "H264 Set QP Value for HC Layers";
-	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
+	case V4L2_CID_CODEC_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
 								return "H264 Constrained Intra Pred";
-	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:	return "H264 Chroma QP Index Offset";
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:		return "H264 I-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:		return "MPEG4 P-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:		return "MPEG4 B-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:			return "MPEG4 Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:			return "MPEG4 Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:			return "MPEG4 Level";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:			return "MPEG4 Profile";
-	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:			return "Quarter Pixel Search Enable";
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:		return "Maximum Bytes in a Slice";
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:		return "Number of MBs in a Slice";
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:		return "Slice Partitioning Method";
-	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
-	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
-	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
-	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
-	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
-	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
-	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
-	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
+	case V4L2_CID_CODEC_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:	return "H264 Chroma QP Index Offset";
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MIN_QP:		return "H264 I-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
+	case V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
+	case V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE:		return "MPEG2 Profile";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_P_FRAME_QP:		return "MPEG4 P-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_B_FRAME_QP:		return "MPEG4 B-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_MIN_QP:			return "MPEG4 Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_MAX_QP:			return "MPEG4 Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:			return "MPEG4 Level";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:		return "MPEG4 Profile";
+	case V4L2_CID_CODEC_VIDEO_MPEG4_QPEL:			return "Quarter Pixel Search Enable";
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_BYTES:	return "Maximum Bytes in a Slice";
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MAX_MB:		return "Number of MBs in a Slice";
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:		return "Slice Partitioning Method";
+	case V4L2_CID_CODEC_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
+	case V4L2_CID_CODEC_VIDEO_DEC_PTS:			return "Video Decoder PTS";
+	case V4L2_CID_CODEC_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
+	case V4L2_CID_CODEC_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
+	case V4L2_CID_CODEC_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
+	case V4L2_CID_CODEC_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
+	case V4L2_CID_CODEC_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
+	case V4L2_CID_CODEC_VIDEO_BASELAYER_PRIORITY_ID:	return "Base Layer Priority ID";
+	case V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
+	case V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
 	/* VPX controls */
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
-	case V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4:		return "VPX Intra Mode Decision Disable";
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:		return "VPX No. of Refs for P Frame";
-	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL:		return "VPX Loop Filter Level Range";
-	case V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS:		return "VPX Deblocking Effect Control";
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:	return "VPX Golden Frame Refresh Period";
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:		return "VPX Golden Frame Indicator";
-	case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:			return "VPX Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:			return "VPX Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP:		return "VPX I-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
-	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
-	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
-	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
+	case V4L2_CID_CODEC_VIDEO_VPX_IMD_DISABLE_4X4:		return "VPX Intra Mode Decision Disable";
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES:		return "VPX No. of Refs for P Frame";
+	case V4L2_CID_CODEC_VIDEO_VPX_FILTER_LEVEL:		return "VPX Loop Filter Level Range";
+	case V4L2_CID_CODEC_VIDEO_VPX_FILTER_SHARPNESS:		return "VPX Deblocking Effect Control";
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:	return "VPX Golden Frame Refresh Period";
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL:		return "VPX Golden Frame Indicator";
+	case V4L2_CID_CODEC_VIDEO_VPX_MIN_QP:			return "VPX Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_VPX_MAX_QP:			return "VPX Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_VPX_I_FRAME_QP:		return "VPX I-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:			return "VP8 Profile";
+	case V4L2_CID_CODEC_VIDEO_VP9_PROFILE:			return "VP9 Profile";
+	case V4L2_CID_CODEC_VIDEO_VP9_LEVEL:			return "VP9 Level";
+	case V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
 
 	/* HEVC controls */
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:		return "HEVC P-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
-	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
-	case V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION:	return "HEVC Frame Rate Resolution";
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH:	return "HEVC Maximum Coding Unit Depth";
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:		return "HEVC Refresh Type";
-	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:		return "HEVC Constant Intra Prediction";
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU:		return "HEVC Lossless Encoding";
-	case V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT:		return "HEVC Wavefront";
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:		return "HEVC Loop Filter";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP:			return "HEVC QP Values";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:		return "HEVC Hierarchical Coding Type";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:	return "HEVC Hierarchical Coding Layer";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP:	return "HEVC Hierarchical Layer 0 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP:	return "HEVC Hierarchical Layer 1 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP:	return "HEVC Hierarchical Layer 2 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP:	return "HEVC Hierarchical Layer 3 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP:	return "HEVC Hierarchical Layer 4 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP:	return "HEVC Hierarchical Layer 5 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP:	return "HEVC Hierarchical Layer 6 QP";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:	return "HEVC Hierarchical Lay 0 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:	return "HEVC Hierarchical Lay 1 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:	return "HEVC Hierarchical Lay 2 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:	return "HEVC Hierarchical Lay 3 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:	return "HEVC Hierarchical Lay 4 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:	return "HEVC Hierarchical Lay 5 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR:	return "HEVC Hierarchical Lay 6 BitRate";
-	case V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB:		return "HEVC General PB";
-	case V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID:		return "HEVC Temporal ID";
-	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:		return "HEVC Strong Intra Smoothing";
-	case V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT:		return "HEVC Intra PU Split";
-	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:		return "HEVC TMV Prediction";
-	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:	return "HEVC Max Num of Candidate MVs";
-	case V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE:	return "HEVC ENC Without Startcode";
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:		return "HEVC Num of I-Frame b/w 2 IDR";
-	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:	return "HEVC Loop Filter Beta Offset";
-	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:	return "HEVC Loop Filter TC Offset";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
-	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
-	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_QP:		return "HEVC P-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
+	case V4L2_CID_CODEC_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
+	case V4L2_CID_CODEC_VIDEO_HEVC_LEVEL:			return "HEVC Level";
+	case V4L2_CID_CODEC_VIDEO_HEVC_TIER:			return "HEVC Tier";
+	case V4L2_CID_CODEC_VIDEO_HEVC_FRAME_RATE_RESOLUTION:	return "HEVC Frame Rate Resolution";
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_PARTITION_DEPTH:	return "HEVC Maximum Coding Unit Depth";
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE:		return "HEVC Refresh Type";
+	case V4L2_CID_CODEC_VIDEO_HEVC_CONST_INTRA_PRED:	return "HEVC Constant Intra Prediction";
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOSSLESS_CU:		return "HEVC Lossless Encoding";
+	case V4L2_CID_CODEC_VIDEO_HEVC_WAVEFRONT:		return "HEVC Wavefront";
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE:	return "HEVC Loop Filter";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_QP:			return "HEVC QP Values";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE:	return "HEVC Hierarchical Coding Type";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_LAYER:	return "HEVC Hierarchical Coding Layer";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_QP:	return "HEVC Hierarchical Layer 0 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_QP:	return "HEVC Hierarchical Layer 1 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_QP:	return "HEVC Hierarchical Layer 2 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_QP:	return "HEVC Hierarchical Layer 3 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_QP:	return "HEVC Hierarchical Layer 4 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_QP:	return "HEVC Hierarchical Layer 5 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_QP:	return "HEVC Hierarchical Layer 6 QP";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L0_BR:	return "HEVC Hierarchical Lay 0 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L1_BR:	return "HEVC Hierarchical Lay 1 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L2_BR:	return "HEVC Hierarchical Lay 2 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L3_BR:	return "HEVC Hierarchical Lay 3 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L4_BR:	return "HEVC Hierarchical Lay 4 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L5_BR:	return "HEVC Hierarchical Lay 5 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_L6_BR:	return "HEVC Hierarchical Lay 6 BitRate";
+	case V4L2_CID_CODEC_VIDEO_HEVC_GENERAL_PB:		return "HEVC General PB";
+	case V4L2_CID_CODEC_VIDEO_HEVC_TEMPORAL_ID:		return "HEVC Temporal ID";
+	case V4L2_CID_CODEC_VIDEO_HEVC_STRONG_SMOOTHING:	return "HEVC Strong Intra Smoothing";
+	case V4L2_CID_CODEC_VIDEO_HEVC_INTRA_PU_SPLIT:		return "HEVC Intra PU Split";
+	case V4L2_CID_CODEC_VIDEO_HEVC_TMV_PREDICTION:		return "HEVC TMV Prediction";
+	case V4L2_CID_CODEC_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:	return "HEVC Max Num of Candidate MVs";
+	case V4L2_CID_CODEC_VIDEO_HEVC_WITHOUT_STARTCODE:	return "HEVC ENC Without Startcode";
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_PERIOD:		return "HEVC Num of I-Frame b/w 2 IDR";
+	case V4L2_CID_CODEC_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:	return "HEVC Loop Filter Beta Offset";
+	case V4L2_CID_CODEC_VIDEO_HEVC_LF_TC_OFFSET_DIV2:	return "HEVC Loop Filter TC Offset";
+	case V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
+	case V4L2_CID_CODEC_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
+	case V4L2_CID_CODEC_VIDEO_PREPEND_SPSPPS_TO_IDR:	return "Prepend SPS and PPS to IDR";
+	case V4L2_CID_CODEC_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
+	case V4L2_CID_CODEC_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
+	case V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
+	case V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
+	case V4L2_CID_CODEC_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1192,15 +1192,15 @@ const char *v4l2_ctrl_get_name(u32 id)
 	/* Stateless Codec controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
-	case V4L2_CID_STATELESS_H264_DECODE_MODE:		return "H264 Decode Mode";
-	case V4L2_CID_STATELESS_H264_START_CODE:		return "H264 Start Code";
-	case V4L2_CID_STATELESS_H264_SPS:			return "H264 Sequence Parameter Set";
-	case V4L2_CID_STATELESS_H264_PPS:			return "H264 Picture Parameter Set";
-	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
-	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
-	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
-	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
-	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:	return "H264 Decode Mode";
+	case V4L2_CID_STATELESS_H264_START_CODE:	return "H264 Start Code";
+	case V4L2_CID_STATELESS_H264_SPS:		return "H264 Sequence Parameter Set";
+	case V4L2_CID_STATELESS_H264_PPS:		return "H264 Picture Parameter Set";
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:	return "H264 Scaling Matrix";
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:	return "H264 Prediction Weight Table";
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:	return "H264 Slice Parameters";
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:	return "H264 Decode Parameters";
+	case V4L2_CID_STATELESS_FWHT_PARAMS:		return "FWHT Stateless Parameters";
 	default:
 		return NULL;
 	}
@@ -1224,10 +1224,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_CHROMA_AGC:
 	case V4L2_CID_COLOR_KILLER:
 	case V4L2_CID_AUTOBRIGHTNESS:
-	case V4L2_CID_MPEG_AUDIO_MUTE:
-	case V4L2_CID_MPEG_VIDEO_MUTE:
-	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
-	case V4L2_CID_MPEG_VIDEO_PULLDOWN:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_MUTE:
+	case V4L2_CID_CODEC_VIDEO_GOP_CLOSURE:
+	case V4L2_CID_CODEC_VIDEO_PULLDOWN:
 	case V4L2_CID_EXPOSURE_AUTO_PRIORITY:
 	case V4L2_CID_FOCUS_AUTO:
 	case V4L2_CID_PRIVACY:
@@ -1239,14 +1239,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_STROBE_STATUS:
 	case V4L2_CID_FLASH_CHARGE:
 	case V4L2_CID_FLASH_READY:
-	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
-	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
-	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
-	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
-	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
-	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
+	case V4L2_CID_CODEC_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
+	case V4L2_CID_CODEC_VIDEO_DECODER_SLICE_INTERFACE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_MB_RC_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_H264_8X8_TRANSFORM:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_ENABLE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_QPEL:
+	case V4L2_CID_CODEC_VIDEO_REPEAT_SEQ_HEADER:
 	case V4L2_CID_WIDE_DYNAMIC_RANGE:
 	case V4L2_CID_IMAGE_STABILIZATION:
 	case V4L2_CID_RDS_RECEPTION:
@@ -1274,11 +1274,11 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
-	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_CODEC_VIDEO_MV_H_SEARCH_RANGE:
+	case V4L2_CID_CODEC_VIDEO_MV_V_SEARCH_RANGE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+	case V4L2_CID_CODEC_VIDEO_FORCE_KEY_FRAME:
 	case V4L2_CID_PAN_RESET:
 	case V4L2_CID_TILT_RESET:
 	case V4L2_CID_FLASH_STROBE:
@@ -1292,23 +1292,23 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_POWER_LINE_FREQUENCY:
-	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
-	case V4L2_CID_MPEG_AUDIO_L1_BITRATE:
-	case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
-	case V4L2_CID_MPEG_AUDIO_L3_BITRATE:
-	case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
-	case V4L2_CID_MPEG_AUDIO_MODE:
-	case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
-	case V4L2_CID_MPEG_AUDIO_EMPHASIS:
-	case V4L2_CID_MPEG_AUDIO_CRC:
-	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:
-	case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
-	case V4L2_CID_MPEG_STREAM_TYPE:
-	case V4L2_CID_MPEG_STREAM_VBI_FMT:
+	case V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_L1_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L2_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_L3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_AC3_BITRATE:
+	case V4L2_CID_CODEC_AUDIO_MODE:
+	case V4L2_CID_CODEC_AUDIO_MODE_EXTENSION:
+	case V4L2_CID_CODEC_AUDIO_EMPHASIS:
+	case V4L2_CID_CODEC_AUDIO_CRC:
+	case V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK:
+	case V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_VBI_FMT:
 	case V4L2_CID_EXPOSURE_AUTO:
 	case V4L2_CID_AUTO_FOCUS_RANGE:
 	case V4L2_CID_COLORFX:
@@ -1316,20 +1316,20 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_TUNE_PREEMPHASIS:
 	case V4L2_CID_FLASH_LED_MODE:
 	case V4L2_CID_FLASH_STROBE_SOURCE:
-	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
-	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
-	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
-	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
-	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
-	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
-	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_HEADER_MODE:
+	case V4L2_CID_CODEC_VIDEO_FRAME_SKIP_MODE:
+	case V4L2_CID_CODEC_VIDEO_MULTI_SLICE_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_ENTROPY_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_H264_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_H264_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_H264_VUI_SAR_IDC:
+	case V4L2_CID_CODEC_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
+	case V4L2_CID_CODEC_VIDEO_H264_FMO_MAP_TYPE:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_MPEG4_PROFILE:
 	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
 	case V4L2_CID_ISO_SENSITIVITY_AUTO:
 	case V4L2_CID_EXPOSURE_METERING:
@@ -1342,20 +1342,20 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_TEST_PATTERN:
 	case V4L2_CID_DEINTERLACING_MODE:
 	case V4L2_CID_TUNE_DEEMPHASIS:
-	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_VPX_GOLDEN_FRAME_SEL:
+	case V4L2_CID_CODEC_VIDEO_VP8_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP9_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_VP9_LEVEL:
 	case V4L2_CID_DETECT_MD_MODE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
-	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
-	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
-	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LEVEL:
+	case V4L2_CID_CODEC_VIDEO_HEVC_HIER_CODING_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_REFRESH_TYPE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
+	case V4L2_CID_CODEC_VIDEO_HEVC_TIER:
+	case V4L2_CID_CODEC_VIDEO_HEVC_LOOP_FILTER_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_DECODE_MODE:
+	case V4L2_CID_CODEC_VIDEO_HEVC_START_CODE:
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
@@ -1372,8 +1372,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_ISO_SENSITIVITY:
 	case V4L2_CID_AUTO_EXPOSURE_BIAS:
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:
-	case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_PARTITIONS:
+	case V4L2_CID_CODEC_VIDEO_VPX_NUM_REF_FRAMES:
 		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
 		break;
 	case V4L2_CID_USER_CLASS:
@@ -1416,14 +1416,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
-	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
+	case V4L2_CID_CODEC_VIDEO_DEC_PTS:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
 		*min = *def = 0;
 		*max = 0x1ffffffffLL;
 		*step = 1;
 		break;
-	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
+	case V4L2_CID_CODEC_VIDEO_DEC_FRAME:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
 		*min = *def = 0;
@@ -1443,10 +1443,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RDS_TX_ALT_FREQS:
 		*type = V4L2_CTRL_TYPE_U32;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:
+	case V4L2_CID_CODEC_VIDEO_MPEG2_QUANTIZATION:
 		*type = V4L2_CTRL_TYPE_MPEG2_QUANTIZATION;
 		break;
 	case V4L2_CID_STATELESS_FWHT_PARAMS:
@@ -1470,16 +1470,16 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
 		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
+	case V4L2_CID_CODEC_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
+	case V4L2_CID_CODEC_VIDEO_HEVC_SPS:
 		*type = V4L2_CTRL_TYPE_HEVC_SPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:
+	case V4L2_CID_CODEC_VIDEO_HEVC_PPS:
 		*type = V4L2_CTRL_TYPE_HEVC_PPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
+	case V4L2_CID_CODEC_VIDEO_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
@@ -1491,11 +1491,11 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	}
 	switch (id) {
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
-	case V4L2_CID_MPEG_AUDIO_MODE:
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		*flags |= V4L2_CTRL_FLAG_UPDATE;
 		break;
 	case V4L2_CID_AUDIO_VOLUME:
-- 
2.30.1

