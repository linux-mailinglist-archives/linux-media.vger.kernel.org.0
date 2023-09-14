Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B0979FC2B
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 08:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbjINGkD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 02:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234896AbjINGkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 02:40:00 -0400
X-Greylist: delayed 554 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Sep 2023 23:39:55 PDT
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED9ACF3
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 23:39:55 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D87851A063E;
        Thu, 14 Sep 2023 08:30:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 74C451A0636;
        Thu, 14 Sep 2023 08:30:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E086E183486B;
        Thu, 14 Sep 2023 14:30:45 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output support
Date:   Thu, 14 Sep 2023 13:54:02 +0800
Message-Id: <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Audio signal processing has the requirement for memory to
memory similar as Video.

This patch is to add this support in v4l2 framework, defined
new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
for audio case usage.

Defined V4L2_AUDIO_FMT_LPCM format type for audio.

Defined V4L2_CAP_AUDIO_M2M capability type for audio memory
to memory case.

The created audio device is named "/dev/v4l-audioX".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../userspace-api/media/v4l/audio-formats.rst | 15 +++++
 .../userspace-api/media/v4l/buffer.rst        |  6 ++
 .../userspace-api/media/v4l/dev-audio.rst     | 63 +++++++++++++++++++
 .../userspace-api/media/v4l/devices.rst       |  1 +
 .../media/v4l/pixfmt-aud-lpcm.rst             | 31 +++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 .../media/v4l/vidioc-enum-fmt.rst             |  2 +
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
 .../media/v4l/vidioc-querycap.rst             |  3 +
 .../media/videodev2.h.rst.exceptions          |  2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
 drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
 drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++++
 include/media/v4l2-dev.h                      |  2 +
 include/media/v4l2-ioctl.h                    | 34 ++++++++++
 include/uapi/linux/videodev2.h                | 25 ++++++++
 16 files changed, 263 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/audio-formats.rst
 create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst

diff --git a/Documentation/userspace-api/media/v4l/audio-formats.rst b/Documentation/userspace-api/media/v4l/audio-formats.rst
new file mode 100644
index 000000000000..bc52712d20d3
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/audio-formats.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _audio-formats:
+
+*************
+Audio Formats
+*************
+
+These formats are used for :ref:`audio` interface only.
+
+
+.. toctree::
+    :maxdepth: 1
+
+    pixfmt-aud-lpcm
diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
index 04dec3e570ed..80cf2cb20dfe 100644
--- a/Documentation/userspace-api/media/v4l/buffer.rst
+++ b/Documentation/userspace-api/media/v4l/buffer.rst
@@ -438,6 +438,12 @@ enum v4l2_buf_type
     * - ``V4L2_BUF_TYPE_META_OUTPUT``
       - 14
       - Buffer for metadata output, see :ref:`metadata`.
+    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
+      - 15
+      - Buffer for audio capture, see :ref:`audio`.
+    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
+      - 16
+      - Buffer for audio output, see :ref:`audio`.
 
 
 .. _buffer-flags:
diff --git a/Documentation/userspace-api/media/v4l/dev-audio.rst b/Documentation/userspace-api/media/v4l/dev-audio.rst
new file mode 100644
index 000000000000..f9bcf0c7b056
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/dev-audio.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _audiodev:
+
+******************
+audio Interface
+******************
+
+The audio interface is implemented on audio device nodes. The audio device
+which uses application software for modulation or demodulation. This
+interface is intended for controlling and data streaming of such devices
+
+Audio devices are accessed through character device special files named
+``/dev/v4l-audio``
+
+Querying Capabilities
+=====================
+
+Device nodes supporting the audio capture and output interface set the
+``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
+:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QUERYCAP`
+ioctl.
+
+At least one of the read/write or streaming I/O methods must be supported.
+
+
+Data Format Negotiation
+=======================
+
+The audio device uses the :ref:`format` ioctls to select the capture format.
+The audio buffer content format is bound to that selected format. In addition
+to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl must be
+supported as well.
+
+To use the :ref:`format` ioctls applications set the ``type`` field of the
+:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or to
+``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set the
+remainder of the :c:type:`v4l2_format` structure to 0.
+
+.. c:type:: v4l2_audio_format
+
+.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
+
+.. flat-table:: struct v4l2_audio_format
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``rate``
+      - The sample rate, set by the application. The range is [5512, 768000].
+    * - __u32
+      - ``format``
+      - The sample format, set by the application. format is defined as
+        SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...,
+    * - __u32
+      - ``channels``
+      - The channel number, set by the application. channel number range is
+        [1, 32].
+    * - __u32
+      - ``buffersize``
+      - Maximum buffer size in bytes required for data. The value is set by the
+        driver.
diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
index 8bfbad65a9d4..8261f3468489 100644
--- a/Documentation/userspace-api/media/v4l/devices.rst
+++ b/Documentation/userspace-api/media/v4l/devices.rst
@@ -24,3 +24,4 @@ Interfaces
     dev-event
     dev-subdev
     dev-meta
+    dev-audio
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
new file mode 100644
index 000000000000..f9ebe2a05f69
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _v4l2-aud-fmt-lpcm:
+
+*************************
+V4L2_AUDIO_FMT_LPCM ('LPCM')
+*************************
+
+Linear Pulse-Code Modulation (LPCM)
+
+
+Description
+===========
+
+This describes audio format used by the audio memory to memory driver.
+
+It contains the following fields:
+
+.. flat-table::
+    :widths: 1 4
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - Field
+      - Description
+    * - u32 samplerate;
+      - which is the number of times per second that samples are taken.
+    * - u32 sampleformat;
+      - which determines the number of possible digital values that can be used to represent each sample
+    * - u32 channels;
+      - channel number for each sample.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
index 11dab4a90630..e205db5fa8af 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
@@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
     colorspaces
     colorspaces-defs
     colorspaces-details
+    audio-formats
diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
index 000c154b0f98..42deb07f4ff4 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
@@ -96,6 +96,8 @@ the ``mbus_code`` field is handled differently:
 	``V4L2_BUF_TYPE_VIDEO_OVERLAY``,
 	``V4L2_BUF_TYPE_SDR_CAPTURE``,
 	``V4L2_BUF_TYPE_SDR_OUTPUT``,
+	``V4L2_BUF_TYPE_AUDIO_CAPTURE``,
+	``V4L2_BUF_TYPE_AUDIO_OUTPUT``,
 	``V4L2_BUF_TYPE_META_CAPTURE`` and
 	``V4L2_BUF_TYPE_META_OUTPUT``.
 	See :c:type:`v4l2_buf_type`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
index 675c385e5aca..1ecb7d640057 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
@@ -130,6 +130,10 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical
       - ``meta``
       - Definition of a metadata format, see :ref:`meta-formats`, used by
 	metadata capture devices.
+    * - struct :c:type:`v4l2_audio_format`
+      - ``audio``
+      - Definition of a audio data format, see :ref:`dev-audio`, used by
+        audio capture and output devices
     * - __u8
       - ``raw_data``\ [200]
       - Place holder for future extensions.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..0b3cefefc86b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -259,6 +259,9 @@ specification the ioctl returns an ``EINVAL`` error code.
         video topology configuration, including which I/O entity is routed to
         the input/output, is configured by userspace via the Media Controller.
         See :ref:`media_controller`.
+    * - ``V4L2_CAP_AUDIO_M2M``
+      - 0x40000000
+      - The device supports the audio Memory-To-Memory interface.
     * - ``V4L2_CAP_DEVICE_CAPS``
       - 0x80000000
       - The driver fills the ``device_caps`` field. This capability can
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..48ef3bce3d20 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -29,6 +29,8 @@ replace symbol V4L2_FIELD_SEQ_TB :c:type:`v4l2_field`
 replace symbol V4L2_FIELD_TOP :c:type:`v4l2_field`
 
 # Documented enum v4l2_buf_type
+replace symbol V4L2_BUF_TYPE_AUDIO_CAPTURE :c:type:`v4l2_buf_type`
+replace symbol V4L2_BUF_TYPE_AUDIO_OUTPUT :c:type:`v4l2_buf_type`
 replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`v4l2_buf_type`
 replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`v4l2_buf_type`
 replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`v4l2_buf_type`
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index c7a54d82a55e..12f2be2773a2 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		requested_sizes[0] = f->fmt.meta.buffersize;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		requested_sizes[0] = f->fmt.audio.buffersize;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index f81279492682..b92c760b611a 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
 	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
 		       (vdev->device_caps & meta_caps);
+	bool is_audio = vdev->vfl_type == VFL_TYPE_AUDIO;
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
 	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
@@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
 		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
 	}
+	if (is_audio && is_rx) {
+		/* audio capture specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_cap);
+	} else if (is_audio && is_tx) {
+		/* audio output specific ioctls */
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_out);
+	}
 	if (is_vbi) {
 		/* vbi specific ioctls */
 		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
@@ -927,6 +941,9 @@ int __video_register_device(struct video_device *vdev,
 	case VFL_TYPE_TOUCH:
 		name_base = "v4l-touch";
 		break;
+	case VFL_TYPE_AUDIO:
+		name_base = "v4l-audio";
+		break;
 	default:
 		pr_err("%s called with unknown type: %d\n",
 		       __func__, type);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index f4d9d6279094..767588d5822a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -188,6 +188,8 @@ const char *v4l2_type_names[] = {
 	[V4L2_BUF_TYPE_SDR_OUTPUT]         = "sdr-out",
 	[V4L2_BUF_TYPE_META_CAPTURE]       = "meta-cap",
 	[V4L2_BUF_TYPE_META_OUTPUT]	   = "meta-out",
+	[V4L2_BUF_TYPE_AUDIO_CAPTURE]      = "audio-cap",
+	[V4L2_BUF_TYPE_AUDIO_OUTPUT]	   = "audio-out",
 };
 EXPORT_SYMBOL(v4l2_type_names);
 
@@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool write_only)
 	const struct v4l2_sliced_vbi_format *sliced;
 	const struct v4l2_window *win;
 	const struct v4l2_meta_format *meta;
+	const struct v4l2_audio_format *audio;
 	u32 pixelformat;
 	u32 planes;
 	unsigned i;
@@ -346,6 +349,12 @@ static void v4l_print_format(const void *arg, bool write_only)
 		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
 			&pixelformat, meta->buffersize);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		audio = &p->fmt.audio;
+		pr_cont(", rate=%u, format=%u, channels=%u, buffersize=%u\n",
+			audio->rate, audio->format, audio->channels, audio->buffersize);
+		break;
 	}
 }
 
@@ -927,6 +936,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
 	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
 		       (vfd->device_caps & meta_caps);
+	bool is_audio = vfd->vfl_type == VFL_TYPE_AUDIO;
 	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
 
@@ -992,6 +1002,14 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
 			return 0;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
+			return 0;
+		break;
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
+			return 0;
+		break;
 	default:
 		break;
 	}
@@ -1452,6 +1470,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y210:		descr = "10-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y212:		descr = "12-bit YUYV Packed"; break;
 	case V4L2_PIX_FMT_Y216:		descr = "16-bit YUYV Packed"; break;
+	case V4L2_AUDIO_FMT_LPCM:	descr = "Audio LPCM"; break;
 
 	default:
 		/* Compressed formats */
@@ -1596,6 +1615,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
+			break;
+		ret = ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
+		break;
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_enum_fmt_audio_out))
+			break;
+		ret = ops->vidioc_enum_fmt_audio_out(file, fh, arg);
+		break;
 	}
 	if (ret == 0)
 		v4l_fill_fmtdesc(p);
@@ -1672,6 +1701,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
 		return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return ops->vidioc_g_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return ops->vidioc_g_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
@@ -1783,6 +1816,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		memset_after(p, 0, fmt.meta);
 		return ops->vidioc_s_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_s_fmt_audio_cap))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_s_fmt_audio_out))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_s_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
@@ -1891,6 +1934,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
 			break;
 		memset_after(p, 0, fmt.meta);
 		return ops->vidioc_try_fmt_meta_out(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		if (unlikely(!ops->vidioc_try_fmt_audio_cap))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (unlikely(!ops->vidioc_try_fmt_audio_out))
+			break;
+		memset_after(p, 0, fmt.audio);
+		return ops->vidioc_try_fmt_audio_out(file, fh, arg);
 	}
 	return -EINVAL;
 }
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index e0a13505f88d..0924e6d1dab1 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -30,6 +30,7 @@
  * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
  * @VFL_TYPE_SDR:	for Software Defined Radio tuners
  * @VFL_TYPE_TOUCH:	for touch sensors
+ * @VFL_TYPE_AUDIO:	for audio input/output devices
  * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
  */
 enum vfl_devnode_type {
@@ -39,6 +40,7 @@ enum vfl_devnode_type {
 	VFL_TYPE_SUBDEV,
 	VFL_TYPE_SDR,
 	VFL_TYPE_TOUCH,
+	VFL_TYPE_AUDIO,
 	VFL_TYPE_MAX /* Shall be the last one */
 };
 
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index edb733f21604..f840cf740ce1 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -45,6 +45,12 @@ struct v4l2_fh;
  * @vidioc_enum_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
  *	for metadata output
+ * @vidioc_enum_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
+ *	for audio capture
+ * @vidioc_enum_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
+ *	for audio output
  * @vidioc_g_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -79,6 +85,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_g_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_g_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_g_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_s_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -113,6 +123,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_s_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_s_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_s_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_try_fmt_vid_cap: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
  *	in single plane mode
@@ -149,6 +163,10 @@ struct v4l2_fh;
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
  * @vidioc_try_fmt_meta_out: pointer to the function that implements
  *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
+ * @vidioc_try_fmt_audio_cap: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capture
+ * @vidioc_try_fmt_audio_out: pointer to the function that implements
+ *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio output
  * @vidioc_reqbufs: pointer to the function that implements
  *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
  * @vidioc_querybuf: pointer to the function that implements
@@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
 					struct v4l2_fmtdesc *f);
 	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
 					struct v4l2_fmtdesc *f);
+	int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f);
+	int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
+					 struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
 	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
@@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
 				     struct v4l2_format *f);
 	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
 				     struct v4l2_format *f);
+	int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
+				      struct v4l2_format *f);
+	int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
+				      struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
 	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
@@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
 				     struct v4l2_format *f);
 	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
 				     struct v4l2_format *f);
+	int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
+				      struct v4l2_format *f);
+	int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
+				      struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
 	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
@@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
 				       struct v4l2_format *f);
 	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
 				       struct v4l2_format *f);
+	int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
+					struct v4l2_format *f);
+	int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
+					struct v4l2_format *f);
 
 	/* Buffer handlers */
 	int (*vidioc_reqbufs)(struct file *file, void *fh,
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985..8dc615f2b60c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -153,6 +153,8 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
+	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
@@ -169,6 +171,7 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
+	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
 #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
@@ -508,6 +511,7 @@ struct v4l2_capability {
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
 #define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+#define V4L2_CAP_AUDIO_M2M              0x40000000
 
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
@@ -838,6 +842,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+/* Audio-data formats */
+#define V4L2_AUDIO_FMT_LPCM	  v4l2_fourcc('L', 'P', 'C', 'M') /* audio lpcm */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -2417,6 +2424,22 @@ struct v4l2_meta_format {
 	__u32				buffersize;
 } __attribute__ ((packed));
 
+/**
+ * struct v4l2_audio_format - audio data format definition
+ * @pixelformat:	little endian four character code (fourcc)
+ * @rate:		sample rate
+ * @format:		sample format
+ * @channels:		channel numbers
+ * @buffersize:		maximum size in bytes required for data
+ */
+struct v4l2_audio_format {
+	__u32				pixelformat;
+	__u32				rate;
+	__u32				format;
+	__u32				channels;
+	__u32				buffersize;
+} __attribute__ ((packed));
+
 /**
  * struct v4l2_format - stream data format
  * @type:	enum v4l2_buf_type; type of the data stream
@@ -2425,6 +2448,7 @@ struct v4l2_meta_format {
  * @win:	definition of an overlaid image
  * @vbi:	raw VBI capture or output parameters
  * @sliced:	sliced VBI capture or output parameters
+ * @audio:	definition of an audio format
  * @raw_data:	placeholder for future extensions and custom formats
  * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
  *		and @raw_data
@@ -2439,6 +2463,7 @@ struct v4l2_format {
 		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
 		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
 		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
+		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
 		__u8	raw_data[200];                   /* user-defined */
 	} fmt;
 };
-- 
2.34.1

