Return-Path: <linux-media+bounces-201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0A7E9A22
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9357280CD8
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761EF1C6AB;
	Mon, 13 Nov 2023 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36341C6A2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B92C433C9;
	Mon, 13 Nov 2023 10:22:08 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/8] sync with audio repo
Date: Mon, 13 Nov 2023 11:18:42 +0100
Message-ID: <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113102202.258725-1-hverkuil-cisco@xs4all.nl>
References: <20231113102202.258725-1-hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 contrib/freebsd/include/linux/v4l2-controls.h |  9 ++++
 contrib/freebsd/include/linux/videodev2.h     | 42 +++++++++++++++++++
 include/linux/media.h                         |  2 +
 include/linux/v4l2-controls.h                 |  9 ++++
 include/linux/videodev2.h                     | 42 +++++++++++++++++++
 utils/common/v4l2-pix-formats.h               | 13 ++++++
 6 files changed, 117 insertions(+)

diff --git a/contrib/freebsd/include/linux/v4l2-controls.h b/contrib/freebsd/include/linux/v4l2-controls.h
index cbf252bd..3934bb26 100644
--- a/contrib/freebsd/include/linux/v4l2-controls.h
+++ b/contrib/freebsd/include/linux/v4l2-controls.h
@@ -34,6 +34,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_M2M_AUDIO	0x00a60000	/* Audio M2M controls */
 
 /* User-class control IDs */
 
@@ -3485,6 +3486,14 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
+#define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
+
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 0)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 1)
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 2)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 3)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
 #define V4L2_CID_MPEG_CLASS             V4L2_CID_CODEC_CLASS
diff --git a/contrib/freebsd/include/linux/videodev2.h b/contrib/freebsd/include/linux/videodev2.h
index 3bf0441e..8743381b 100644
--- a/contrib/freebsd/include/linux/videodev2.h
+++ b/contrib/freebsd/include/linux/videodev2.h
@@ -185,6 +185,8 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
+	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
@@ -201,6 +203,7 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
+	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
 #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
@@ -480,6 +483,7 @@ struct v4l2_capability {
 #define V4L2_CAP_VIDEO_CAPTURE		0x00000001  /* Is a video capture device */
 #define V4L2_CAP_VIDEO_OUTPUT		0x00000002  /* Is a video output device */
 #define V4L2_CAP_VIDEO_OVERLAY		0x00000004  /* Can do video overlay */
+#define V4L2_CAP_AUDIO_M2M		0x00000008  /* audio memory to memory */
 #define V4L2_CAP_VBI_CAPTURE		0x00000010  /* Is a raw VBI capture device */
 #define V4L2_CAP_VBI_OUTPUT		0x00000020  /* Is a raw VBI output device */
 #define V4L2_CAP_SLICED_VBI_CAPTURE	0x00000040  /* Is a sliced VBI capture device */
@@ -846,6 +850,29 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Audio-data formats
+ * All these audio formats use a fourcc starting with 'AU'
+ * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
+ */
+#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
+#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
+#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
+#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
+#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
+#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
+#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
+#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8')
+#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
+#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
+#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
+#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
+
+#define v4l2_fourcc_to_audfmt(fourcc)	\
+	(snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10  \
+				   + ((((fourcc) >> 24) & 0xff) - '0'))
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -1854,6 +1881,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_STRING        = 7,
 	V4L2_CTRL_TYPE_BITMASK       = 8,
 	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
+	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
 
 	/* Compound types are >= 0x0100 */
 	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,
@@ -2396,6 +2424,18 @@ struct v4l2_meta_format {
 	uint32_t				buffersize;
 } __attribute__ ((packed));
 
+/**
+ * struct v4l2_audio_format - audio data format definition
+ * @audioformat:	little endian four character code (fourcc)
+ * @channels:		channel numbers
+ * @buffersize:		maximum size in bytes required for data
+ */
+struct v4l2_audio_format {
+	uint32_t				audioformat;
+	uint32_t				channels;
+	uint32_t				buffersize;
+} __attribute__ ((packed));
+
 /**
  * struct v4l2_format - stream data format
  * @type:	enum v4l2_buf_type; type of the data stream
@@ -2404,6 +2444,7 @@ struct v4l2_meta_format {
  * @win:	definition of an overlaid image
  * @vbi:	raw VBI capture or output parameters
  * @sliced:	sliced VBI capture or output parameters
+ * @audio:	definition of an audio format
  * @raw_data:	placeholder for future extensions and custom formats
  * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
  *		and @raw_data
@@ -2418,6 +2459,7 @@ struct v4l2_format {
 		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
 		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
 		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
+		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
 		uint8_t	raw_data[200];                   /* user-defined */
 	} fmt;
 };
diff --git a/include/linux/media.h b/include/linux/media.h
index b5a77bbf..9c91341e 100644
--- a/include/linux/media.h
+++ b/include/linux/media.h
@@ -125,6 +125,7 @@ struct media_device_info {
 #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
 #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
 #define MEDIA_ENT_F_PROC_VIDEO_ISP		(MEDIA_ENT_F_BASE + 0x4009)
+#define MEDIA_ENT_F_PROC_AUDIO_RESAMPLER	(MEDIA_ENT_F_BASE + 0x400a)
 
 /*
  * Switch and bridge entity functions
@@ -258,6 +259,7 @@ struct media_links_enum {
 #define MEDIA_INTF_T_V4L_SUBDEV			(MEDIA_INTF_T_V4L_BASE + 3)
 #define MEDIA_INTF_T_V4L_SWRADIO		(MEDIA_INTF_T_V4L_BASE + 4)
 #define MEDIA_INTF_T_V4L_TOUCH			(MEDIA_INTF_T_V4L_BASE + 5)
+#define MEDIA_INTF_T_V4L_AUDIO			(MEDIA_INTF_T_V4L_BASE + 6)
 
 #define MEDIA_INTF_T_ALSA_BASE			0x00000300
 #define MEDIA_INTF_T_ALSA_PCM_CAPTURE		(MEDIA_INTF_T_ALSA_BASE)
diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
index cbf252bd..3934bb26 100644
--- a/include/linux/v4l2-controls.h
+++ b/include/linux/v4l2-controls.h
@@ -34,6 +34,7 @@
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
 #define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
+#define V4L2_CTRL_CLASS_M2M_AUDIO	0x00a60000	/* Audio M2M controls */
 
 /* User-class control IDs */
 
@@ -3485,6 +3486,14 @@ struct v4l2_ctrl_av1_film_grain {
 	__u8 reserved[4];
 };
 
+#define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x900)
+#define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
+
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 0)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 1)
+#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 2)
+#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET	(V4L2_CID_M2M_AUDIO_CLASS_BASE + 3)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
 #define V4L2_CID_MPEG_CLASS             V4L2_CID_CODEC_CLASS
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 27680a39..6be8591e 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -151,6 +151,8 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
+	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
@@ -167,6 +169,7 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
+	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
 #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
@@ -446,6 +449,7 @@ struct v4l2_capability {
 #define V4L2_CAP_VIDEO_CAPTURE		0x00000001  /* Is a video capture device */
 #define V4L2_CAP_VIDEO_OUTPUT		0x00000002  /* Is a video output device */
 #define V4L2_CAP_VIDEO_OVERLAY		0x00000004  /* Can do video overlay */
+#define V4L2_CAP_AUDIO_M2M		0x00000008  /* audio memory to memory */
 #define V4L2_CAP_VBI_CAPTURE		0x00000010  /* Is a raw VBI capture device */
 #define V4L2_CAP_VBI_OUTPUT		0x00000020  /* Is a raw VBI output device */
 #define V4L2_CAP_SLICED_VBI_CAPTURE	0x00000040  /* Is a sliced VBI capture device */
@@ -812,6 +816,29 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Audio-data formats
+ * All these audio formats use a fourcc starting with 'AU'
+ * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
+ */
+#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
+#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
+#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
+#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
+#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
+#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
+#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
+#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8')
+#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
+#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
+#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
+#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
+
+#define v4l2_fourcc_to_audfmt(fourcc)	\
+	(snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10  \
+				   + ((((fourcc) >> 24) & 0xff) - '0'))
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -1820,6 +1847,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_STRING        = 7,
 	V4L2_CTRL_TYPE_BITMASK       = 8,
 	V4L2_CTRL_TYPE_INTEGER_MENU  = 9,
+	V4L2_CTRL_TYPE_FIXED_POINT   = 10,
 
 	/* Compound types are >= 0x0100 */
 	V4L2_CTRL_COMPOUND_TYPES     = 0x0100,
@@ -2362,6 +2390,18 @@ struct v4l2_meta_format {
 	__u32				buffersize;
 } __attribute__ ((packed));
 
+/**
+ * struct v4l2_audio_format - audio data format definition
+ * @audioformat:	little endian four character code (fourcc)
+ * @channels:		channel numbers
+ * @buffersize:		maximum size in bytes required for data
+ */
+struct v4l2_audio_format {
+	__u32				audioformat;
+	__u32				channels;
+	__u32				buffersize;
+} __attribute__ ((packed));
+
 /**
  * struct v4l2_format - stream data format
  * @type:	enum v4l2_buf_type; type of the data stream
@@ -2370,6 +2410,7 @@ struct v4l2_meta_format {
  * @win:	definition of an overlaid image
  * @vbi:	raw VBI capture or output parameters
  * @sliced:	sliced VBI capture or output parameters
+ * @audio:	definition of an audio format
  * @raw_data:	placeholder for future extensions and custom formats
  * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
  *		and @raw_data
@@ -2384,6 +2425,7 @@ struct v4l2_format {
 		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
 		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
 		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
+		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
 		__u8	raw_data[200];                   /* user-defined */
 	} fmt;
 };
diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
index e8d2e441..db00cf65 100644
--- a/utils/common/v4l2-pix-formats.h
+++ b/utils/common/v4l2-pix-formats.h
@@ -192,6 +192,19 @@
 	case V4L2_PIX_FMT_Y210: return "10-bit YUYV Packed";
 	case V4L2_PIX_FMT_Y212: return "12-bit YUYV Packed";
 	case V4L2_PIX_FMT_Y216: return "16-bit YUYV Packed";
+	case V4L2_AUDIO_FMT_S8: return "8-bit Signed";
+	case V4L2_AUDIO_FMT_S16_LE: return "16-bit Signed LE";
+	case V4L2_AUDIO_FMT_U16_LE: return "16-bit Unsigned LE";
+	case V4L2_AUDIO_FMT_S24_LE: return "24(32)-bit Signed LE";
+	case V4L2_AUDIO_FMT_U24_LE: return "24(32)-bit Unsigned LE";
+	case V4L2_AUDIO_FMT_S32_LE: return "32-bit Signed LE";
+	case V4L2_AUDIO_FMT_U32_LE: return "32-bit Unsigned LE";
+	case V4L2_AUDIO_FMT_FLOAT_LE: return "32-bit Float LE";
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: return "32-bit IEC958 LE";
+	case V4L2_AUDIO_FMT_S24_3LE: return "24(24)-bit Signed LE";
+	case V4L2_AUDIO_FMT_U24_3LE: return "24(24)-bit Unsigned LE";
+	case V4L2_AUDIO_FMT_S20_3LE: return "20(24)-bit Signed LE";
+	case V4L2_AUDIO_FMT_U20_3LE: return "20(24)-bit Unsigned LE";
 	case V4L2_PIX_FMT_MJPEG: return "Motion-JPEG";
 	case V4L2_PIX_FMT_JPEG: return "JFIF JPEG";
 	case V4L2_PIX_FMT_DV: return "1394";
-- 
2.42.0


