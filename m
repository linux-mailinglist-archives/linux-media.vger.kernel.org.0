Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1E97C8171
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 11:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjJMJJ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 05:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjJMJJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 05:09:16 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA14AE7;
        Fri, 13 Oct 2023 02:09:12 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3080D1A1565;
        Fri, 13 Oct 2023 11:09:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF7001A19E5;
        Fri, 13 Oct 2023 11:09:10 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C9F991802200;
        Fri, 13 Oct 2023 17:09:08 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v6 08/11] media: uapi: define audio sample format fourcc type
Date:   Fri, 13 Oct 2023 16:31:02 +0800
Message-Id: <1697185865-27528-9-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
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
 .../userspace-api/media/v4l/pixfmt-audio.rst  | 202 ++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |   1 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  36 ++++
 include/uapi/linux/videodev2.h                |  48 +++++
 4 files changed, 287 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
new file mode 100644
index 000000000000..ac89b2c4b594
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
@@ -0,0 +1,202 @@
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
+    * .. _V4L2-AUDIO-FMT-U8:
+
+      - ``V4L2_AUDIO_FMT_U8``
+      - 'U8'
+      - Corresponds to SNDRV_PCM_FORMAT_U8 in ALSA
+    * .. _V4L2-AUDIO-FMT-S16-LE:
+
+      - ``V4L2_AUDIO_FMT_S16_LE``
+      - 'S16_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S16-BE:
+
+      - ``V4L2_AUDIO_FMT_S16_BE``
+      - 'S16_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S16_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U16-LE:
+
+      - ``V4L2_AUDIO_FMT_U16_LE``
+      - 'U16_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U16-BE:
+
+      - ``V4L2_AUDIO_FMT_U16_BE``
+      - 'U16_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U16_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-LE:
+
+      - ``V4L2_AUDIO_FMT_S24_LE``
+      - 'S24_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-BE:
+
+      - ``V4L2_AUDIO_FMT_S24_BE``
+      - 'S24_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-LE:
+
+      - ``V4L2_AUDIO_FMT_U24_LE``
+      - 'U24_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-BE:
+
+      - ``V4L2_AUDIO_FMT_U24_BE``
+      - 'U24_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S32-LE:
+
+      - ``V4L2_AUDIO_FMT_S32_LE``
+      - 'S32_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S32-BE:
+
+      - ``V4L2_AUDIO_FMT_S32_BE``
+      - 'S32_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S32_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U32-LE:
+
+      - ``V4L2_AUDIO_FMT_U32_LE``
+      - 'U32_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U32-BE:
+
+      - ``V4L2_AUDIO_FMT_U32_BE``
+      - 'U32_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U32_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT_LE``
+      - 'FLOAT_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT-BE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT_BE``
+      - 'FLOAT_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT64-LE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT64_LE``
+      - 'FLOAT64_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_FLOAT64_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-FLOAT64-BE:
+
+      - ``V4L2_AUDIO_FMT_FLOAT64_BE``
+      - 'FLOAT64_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_FLOAT64_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
+
+      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
+      - 'IEC958_SUBFRAME_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-BE:
+
+      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE``
+      - 'IEC958_SUBFRAME_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-LE:
+
+      - ``V4L2_AUDIO_FMT_S20_LE``
+      - 'S20_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S20_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-BE:
+
+      - ``V4L2_AUDIO_FMT_S20_BE``
+      - 'S20_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S20_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-LE:
+
+      - ``V4L2_AUDIO_FMT_U20_LE``
+      - 'U20_LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U20_LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-BE:
+
+      - ``V4L2_AUDIO_FMT_U20_BE``
+      - 'U20_BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U20_BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-3LE:
+
+      - ``V4L2_AUDIO_FMT_S24_3LE``
+      - 'S24_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S24-3BE:
+
+      - ``V4L2_AUDIO_FMT_S24_3BE``
+      - 'S24_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-3LE:
+
+      - ``V4L2_AUDIO_FMT_U24_3LE``
+      - 'U24_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U24-3BE:
+
+      - ``V4L2_AUDIO_FMT_U24_3BE``
+      - 'U24_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U24_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-3LE:
+
+      - ``V4L2_AUDIO_FMT_S20_3LE``
+      - 'S20_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S20-3BE:
+
+      - ``V4L2_AUDIO_FMT_S20_3BE``
+      - 'S20_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S20_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-3LE:
+
+      - ``V4L2_AUDIO_FMT_U20_3LE``
+      - 'U20_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U20-3BE:
+
+      - ``V4L2_AUDIO_FMT_U20_3BE``
+      - 'U20_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U20_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-S18-3LE:
+
+      - ``V4L2_AUDIO_FMT_S18_3LE``
+      - 'S18_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_S18_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-S18-3BE:
+
+      - ``V4L2_AUDIO_FMT_S18_3BE``
+      - 'S18_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_S18_3BE in ALSA
+    * .. _V4L2-AUDIO-FMT-U18-3LE:
+
+      - ``V4L2_AUDIO_FMT_U18_3LE``
+      - 'U18_3LE'
+      - Corresponds to SNDRV_PCM_FORMAT_U18_3LE in ALSA
+    * .. _V4L2-AUDIO-FMT-U18-3BE:
+
+      - ``V4L2_AUDIO_FMT_U18_3BE``
+      - 'U18_3BE'
+      - Corresponds to SNDRV_PCM_FORMAT_U18_3BE in ALSA
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
index 5d088e6c43e4..31e443c644db 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,42 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_AUDIO_FMT_S8:		descr = "8-bit Signed"; break;
+	case V4L2_AUDIO_FMT_U8:		descr = "8-bit Unsigned"; break;
+	case V4L2_AUDIO_FMT_S16_LE:	descr = "16-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S16_BE:		descr = "16-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U16_LE:		descr = "16-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U16_BE:		descr = "16-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S24_LE:		descr = "24(32)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S24_BE:		descr = "24(32)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U24_LE:		descr = "24(32)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U24_BE:		descr = "24(32)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S32_LE:		descr = "32-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S32_BE:		descr = "32-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U32_LE:		descr = "32-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U32_BE:		descr = "32-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_FLOAT_LE:		descr = "32-bit Float LE"; break;
+	case V4L2_AUDIO_FMT_FLOAT_BE:		descr = "32-bit Float BE"; break;
+	case V4L2_AUDIO_FMT_FLOAT64_LE:		descr = "64-bit Float LE"; break;
+	case V4L2_AUDIO_FMT_FLOAT64_BE:		descr = "64-bit Float BE"; break;
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE:	descr = "32-bit IEC958 LE"; break;
+	case V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE:	descr = "32-bit IEC958 BE"; break;
+	case V4L2_AUDIO_FMT_S20_LE:		descr = "20-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S20_BE:		descr = "20-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U20_LE:		descr = "20-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U20_BE:		descr = "20-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S24_3LE:		descr = "24(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S24_3BE:		descr = "24(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U24_3LE:		descr = "24(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U24_3BE:		descr = "24(24)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S20_3LE:		descr = "20(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S20_3BE:		descr = "20(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U20_3LE:		descr = "20(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U20_3BE:		descr = "20(24)-bit Unsigned BE"; break;
+	case V4L2_AUDIO_FMT_S18_3LE:		descr = "18(24)-bit Signed LE"; break;
+	case V4L2_AUDIO_FMT_S18_3BE:		descr = "18(24)-bit Signed BE"; break;
+	case V4L2_AUDIO_FMT_U18_3LE:		descr = "18(24)-bit Unsigned LE"; break;
+	case V4L2_AUDIO_FMT_U18_3BE:		descr = "18(24)-bit Unsigned BE"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b0ddb7319d36..2ac7b989394c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -842,6 +842,54 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/*
+ * Audio-data formats
+ * All these audio formats use a fourcc starting with 'AU'
+ * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
+ */
+#define V4L2_AUDIO_FMT_S8			v4l2_fourcc('A', 'U', '0', '0')
+#define V4L2_AUDIO_FMT_U8			v4l2_fourcc('A', 'U', '0', '1')
+#define V4L2_AUDIO_FMT_S16_LE			v4l2_fourcc('A', 'U', '0', '2')
+#define V4L2_AUDIO_FMT_S16_BE			v4l2_fourcc('A', 'U', '0', '3')
+#define V4L2_AUDIO_FMT_U16_LE			v4l2_fourcc('A', 'U', '0', '4')
+#define V4L2_AUDIO_FMT_U16_BE			v4l2_fourcc('A', 'U', '0', '5')
+#define V4L2_AUDIO_FMT_S24_LE			v4l2_fourcc('A', 'U', '0', '6')
+#define V4L2_AUDIO_FMT_S24_BE			v4l2_fourcc('A', 'U', '0', '7')
+#define V4L2_AUDIO_FMT_U24_LE			v4l2_fourcc('A', 'U', '0', '8')
+#define V4L2_AUDIO_FMT_U24_BE			v4l2_fourcc('A', 'U', '0', '9')
+
+#define V4L2_AUDIO_FMT_S32_LE			v4l2_fourcc('A', 'U', '1', '0')
+#define V4L2_AUDIO_FMT_S32_BE			v4l2_fourcc('A', 'U', '1', '1')
+#define V4L2_AUDIO_FMT_U32_LE			v4l2_fourcc('A', 'U', '1', '2')
+#define V4L2_AUDIO_FMT_U32_BE			v4l2_fourcc('A', 'U', '1', '3')
+#define V4L2_AUDIO_FMT_FLOAT_LE			v4l2_fourcc('A', 'U', '1', '4')
+#define V4L2_AUDIO_FMT_FLOAT_BE			v4l2_fourcc('A', 'U', '1', '5')
+#define V4L2_AUDIO_FMT_FLOAT64_LE		v4l2_fourcc('A', 'U', '1', '6')
+#define V4L2_AUDIO_FMT_FLOAT64_BE		v4l2_fourcc('A', 'U', '1', '7')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE	v4l2_fourcc('A', 'U', '1', '8')
+#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_BE	v4l2_fourcc('A', 'U', '1', '9')
+
+#define V4L2_AUDIO_FMT_S20_LE			v4l2_fourcc('A', 'U', '2', '5')
+#define V4L2_AUDIO_FMT_S20_BE			v4l2_fourcc('A', 'U', '2', '6')
+#define V4L2_AUDIO_FMT_U20_LE			v4l2_fourcc('A', 'U', '2', '7')
+#define V4L2_AUDIO_FMT_U20_BE			v4l2_fourcc('A', 'U', '2', '8')
+
+#define V4L2_AUDIO_FMT_S24_3LE			v4l2_fourcc('A', 'U', '3', '2')
+#define V4L2_AUDIO_FMT_S24_3BE			v4l2_fourcc('A', 'U', '3', '3')
+#define V4L2_AUDIO_FMT_U24_3LE			v4l2_fourcc('A', 'U', '3', '4')
+#define V4L2_AUDIO_FMT_U24_3BE			v4l2_fourcc('A', 'U', '3', '5')
+#define V4L2_AUDIO_FMT_S20_3LE			v4l2_fourcc('A', 'U', '3', '6')
+#define V4L2_AUDIO_FMT_S20_3BE			v4l2_fourcc('A', 'U', '3', '7')
+#define V4L2_AUDIO_FMT_U20_3LE			v4l2_fourcc('A', 'U', '3', '8')
+#define V4L2_AUDIO_FMT_U20_3BE			v4l2_fourcc('A', 'U', '3', '9')
+#define V4L2_AUDIO_FMT_S18_3LE			v4l2_fourcc('A', 'U', '4', '0')
+#define V4L2_AUDIO_FMT_S18_3BE			v4l2_fourcc('A', 'U', '4', '1')
+#define V4L2_AUDIO_FMT_U18_3LE			v4l2_fourcc('A', 'U', '4', '2')
+#define V4L2_AUDIO_FMT_U18_3BE			v4l2_fourcc('A', 'U', '4', '3')
+
+#define v4l2_fourcc_to_audfmt(X)	\
+	(((((X) >> 16) & 0xFF) - '0') * 10 + ((((X) >> 24) & 0xFF) - '0'))
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
-- 
2.34.1

