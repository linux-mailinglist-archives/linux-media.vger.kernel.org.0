Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A297D0CBE
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 12:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376939AbjJTKJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 06:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376894AbjJTKJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 06:09:05 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C63BB6;
        Fri, 20 Oct 2023 03:09:02 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C58011A1E1C;
        Fri, 20 Oct 2023 12:09:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 68B4A1A1E28;
        Fri, 20 Oct 2023 12:09:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 77A34181D0E5;
        Fri, 20 Oct 2023 18:08:58 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v7 08/13] media: uapi: define audio sample format fourcc type
Date:   Fri, 20 Oct 2023 17:30:27 +0800
Message-Id: <1697794232-2607-9-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index cf86a06bac25..4ef08b3a9e39 100644
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

