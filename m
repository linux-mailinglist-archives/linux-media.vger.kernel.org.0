Return-Path: <linux-media+bounces-650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC157F2726
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 09:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 367E1282A17
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 08:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056C93A26F;
	Tue, 21 Nov 2023 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3C418C;
	Tue, 21 Nov 2023 00:17:43 -0800 (PST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 89EB61A044B;
	Tue, 21 Nov 2023 09:17:42 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 272691A036B;
	Tue, 21 Nov 2023 09:17:42 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8943D183ACAD;
	Tue, 21 Nov 2023 16:17:40 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 08/14] media: uapi: Define audio sample format fourcc type
Date: Tue, 21 Nov 2023 15:37:29 +0800
Message-Id: <1700552255-5364-9-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The audio sample format definition is from alsa,
the header file is include/uapi/sound/asound.h, but
don't include this header file directly, because in
user space, there is another copy in alsa-lib.
There will be conflict in userspace for include
videodev2.h & asound.h and asoundlib.h

Here still use the fourcc format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
 include/uapi/linux/videodev2.h                | 23 +++++
 4 files changed, 124 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
new file mode 100644
index 000000000000..04b4a7fbd8f4
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
@@ -0,0 +1,87 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _pixfmt-audio:
+
+*************
+Audio Formats
+*************
+
+These formats are used for :ref:`audiomem2mem` interface only.
+
+.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: Audio Format
+    :header-rows:  1
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - Identifier
+      - Code
+      - Details
+    * .. _V4L2-AUDIO-FMT-S8:
+
+      - ``V4L2_AUDIO_FMT_S8``
+      - 'S8'
+      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
+    * .. _V4L2-AUDIO-FMT-S16-LE:
+
+      - ``V4L2_AUDIO_FMT_S16_LE``
+      - 'S16_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U16-LE:
+
+      - ``V4L2_AUDIO_FMT_U16_LE``
+      - 'U16_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-LE:
+
+      - ``V4L2_AUDIO_FMT_S24_LE``
+      - 'S24_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-LE:
+
+      - ``V4L2_AUDIO_FMT_U24_LE``
+      - 'U24_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S32-LE:
+
+      - ``V4L2_AUDIO_FMT_S32_LE``
+      - 'S32_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U32-LE:
+
+      - ``V4L2_AUDIO_FMT_U32_LE``
+      - 'U32_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT_LE``
+      - 'FLOAT_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
+
+      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
+      - 'IEC958_SUBFRAME_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-3LE:
+
+      - ``V4L2_AUDIO_FMT_S24_3LE``
+      - 'S24_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-3LE:
+
+      - ``V4L2_AUDIO_FMT_U24_3LE``
+      - 'U24_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-3LE:
+
+      - ``V4L2_AUDIO_FMT_S20_3LE``
+      - 'S20_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-3LE:
+
+      - ``V4L2_AUDIO_FMT_U20_3LE``
+      - 'U20_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..2eb6fdd3b43d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     colorspaces
     colorspaces-defs
     colorspaces-details
+    pixfmt-audio
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 1bb03794922a..c86633b82038 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_AUDIO_FMT_S8:		descr = "8-bit Signed"; break;
+	case V4L2_AUDIO_FMT_S16_LE:	descr = "16-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_U16_LE:		descr = "16-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_S24_LE:		descr = "24(32)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_U24_LE:		descr = "24(32)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_S32_LE:		descr = "32-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_U32_LE:		descr = "32-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_FLOAT_LE:		descr = "32-bit Float LE"; break;
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE:	descr = "32-bit IEC958 LE"; break;
+	case V4L2_AUDIO_FMT_S24_3LE:		descr = "24(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_U24_3LE:		descr = "24(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_S20_3LE:		descr = "20(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_U20_3LE:		descr = "20(24)-bit Unsigned LE"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e9958b9c9b06..86761910bda9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -843,6 +843,29 @@ struct v4l2_pix_format {
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
+	(__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10  \
+				   + ((((fourcc) >> 24) & 0xff) - '0'))
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.34.1


