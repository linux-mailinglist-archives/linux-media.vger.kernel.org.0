Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09EE6FBF23
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKNFOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:14:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44030 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfKNFOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:14:14 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 998F928ED79;
        Thu, 14 Nov 2019 05:13:58 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com, Jacob Chen <jacob2.chen@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v11 07/11] media: staging: rkisp1: add capture device driver
Date:   Thu, 14 Nov 2019 02:12:38 -0300
Message-Id: <20191114051242.14651-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191114051242.14651-1-helen.koike@collabora.com>
References: <20191114051242.14651-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

This is the capture device interface driver that provides the v4l2
user interface. Frames can be received from ISP1.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[refactored for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v11:
capture
- fix checkpatch errors

Changes in v10:
- unsquash

Changes in v9:
- fix typos
- fix queue_setup: different behaviour when num_plane is 0 or not
- replace v4l2_{dgb,info,warn,err} by dev_*
- squash
- move to staging

Changes in v8: None
Changes in v7:
- s/strlcpy/strscpy
- Fix v4l2-compliance issues:
        * remove input ioctls
media api can be used to define the topology, this input api is not
required. Besides it, if an input is enumerated, v4l2-compliance is not
happy with G_FMT returning the default colorspace instead of something
more specific.
        * return the pixelformat to the userspace
G_/S_/TRY_ FORMAT should return a valid pixelformat to the user, even if
the user gave an invalid one
        * add missing default colorspace and ycbcr
        * fix wrong pixformat in mp_fmts[] table
        * add buf type check in s_/g_selection
        * queue_setup - check sizes
        * normalize bus_info name
        * fix field any v4l2-compliance -s complain - set field none
        when streaming
- Fix compiling error: s/vidioc_enum_fmt_vid_cap_mplane/vidioc_enum_fmt_vid_cap
- Replace stream state with a boolean
The rkisp1_state enum consists only of 3 entries, where 1 is completely
unused and the other two respectively mean not streaming or streaming.
Replace it with a boolean called "streaming".
- Simplify MI interrupt handling
Rather than adding unnecessary indirection, just use stream index to
handle MI interrupt enable/disable/clear, since the stream index matches
the order of bits now, thanks to previous patch. While at it, remove
some dead code.
- code styling and checkpatch fixes
- add link_validate: don't allow a link with bayer/non-bayer mismatch

 drivers/staging/media/rkisp1/capture.c | 1871 ++++++++++++++++++++++++
 drivers/staging/media/rkisp1/capture.h |  164 +++
 drivers/staging/media/rkisp1/regs.c    |  224 +++
 drivers/staging/media/rkisp1/regs.h    | 1525 +++++++++++++++++++
 4 files changed, 3784 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/capture.c
 create mode 100644 drivers/staging/media/rkisp1/capture.h
 create mode 100644 drivers/staging/media/rkisp1/regs.c
 create mode 100644 drivers/staging/media/rkisp1/regs.h

diff --git a/drivers/staging/media/rkisp1/capture.c b/drivers/staging/media/rkisp1/capture.c
new file mode 100644
index 000000000000..1977581df670
--- /dev/null
+++ b/drivers/staging/media/rkisp1/capture.c
@@ -0,0 +1,1871 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - V4l capture device
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "dev.h"
+#include "regs.h"
+
+/*
+ * NOTE:
+ * 1. There are two capture video devices in rkisp1, selfpath and mainpath
+ * 2. Two capture device have separated memory-interface/crop/scale units.
+ * 3. Besides describing stream hardware, this file also contain entries
+ *    for pipeline operations.
+ * 4. The register read/write operations in this file are put into regs.c.
+ */
+
+/*
+ * differences between selfpatch and mainpath
+ * available mp sink input: isp
+ * available sp sink input : isp, dma(TODO)
+ * available mp sink pad fmts: yuv422, raw
+ * available sp sink pad fmts: yuv422, yuv420......
+ * available mp source fmts: yuv, raw, jpeg(TODO)
+ * available sp source fmts: yuv, rgb
+ */
+
+#define CIF_ISP_REQ_BUFS_MIN 1
+#define CIF_ISP_REQ_BUFS_MAX 8
+
+#define STREAM_PAD_SINK				0
+#define STREAM_PAD_SOURCE			1
+
+#define STREAM_MAX_MP_RSZ_OUTPUT_WIDTH		4416
+#define STREAM_MAX_MP_RSZ_OUTPUT_HEIGHT		3312
+#define STREAM_MAX_SP_RSZ_OUTPUT_WIDTH		1920
+#define STREAM_MAX_SP_RSZ_OUTPUT_HEIGHT		1920
+#define STREAM_MIN_RSZ_OUTPUT_WIDTH		32
+#define STREAM_MIN_RSZ_OUTPUT_HEIGHT		16
+
+#define STREAM_MAX_MP_SP_INPUT_WIDTH STREAM_MAX_MP_RSZ_OUTPUT_WIDTH
+#define STREAM_MAX_MP_SP_INPUT_HEIGHT STREAM_MAX_MP_RSZ_OUTPUT_HEIGHT
+#define STREAM_MIN_MP_SP_INPUT_WIDTH		32
+#define STREAM_MIN_MP_SP_INPUT_HEIGHT		32
+
+/* Get xsubs and ysubs for fourcc formats
+ *
+ * @xsubs: horizontal color samples in a 4*4 matrix, for yuv
+ * @ysubs: vertical color samples in a 4*4 matrix, for yuv
+ */
+static int fcc_xysubs(u32 fcc, u32 *xsubs, u32 *ysubs)
+{
+	switch (fcc) {
+	case V4L2_PIX_FMT_GREY:
+	case V4L2_PIX_FMT_YUV444M:
+		*xsubs = 1;
+		*ysubs = 1;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_YUV422P:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_YVU422M:
+		*xsubs = 2;
+		*ysubs = 1;
+		break;
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+		*xsubs = 2;
+		*ysubs = 2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mbus_code_xysubs(u32 code, u32 *xsubs, u32 *ysubs)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+		*xsubs = 2;
+		*ysubs = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mbus_code_sp_in_fmt(u32 code, u32 *format)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		*format = MI_CTRL_SP_INPUT_YUV422;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct capture_fmt mp_fmts[] = {
+	/* yuv422 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 3,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv420 */
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 2,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 2,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv444 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUV444M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 3,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_MP_WRITE_YUVINT,
+	},
+	/* raw */
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 8 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 8 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 8 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 8 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 10 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 10 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 10 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 10 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 12 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 12 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 12 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.fmt_type = FMT_BAYER,
+		.bpp = { 12 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_MP_WRITE_RAW12,
+	},
+};
+
+static const struct capture_fmt sp_fmts[] = {
+	/* yuv422 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_INT,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_INT,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.fmt_type = FMT_YUV,
+		.bpp = { 16 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_INT,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 3,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV422,
+	},
+	/* yuv420 */
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 2,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 16 },
+		.cplanes = 2,
+		.mplanes = 2,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_SPLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 1,
+		.uv_swap = 1,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV420,
+	},
+	/* yuv444 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUV444M,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8, 8, 8 },
+		.cplanes = 3,
+		.mplanes = 3,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV444,
+	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.fmt_type = FMT_YUV,
+		.bpp = { 8 },
+		.cplanes = 1,
+		.mplanes = 1,
+		.uv_swap = 0,
+		.write_format = MI_CTRL_SP_WRITE_INT,
+		.output_format = MI_CTRL_SP_OUTPUT_YUV400,
+	},
+	/* rgb */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.fmt_type = FMT_RGB,
+		.bpp = { 24 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_RGB888,
+	}, {
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.fmt_type = FMT_RGB,
+		.bpp = { 16 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_RGB565,
+	}, {
+		.fourcc = V4L2_PIX_FMT_BGR666,
+		.fmt_type = FMT_RGB,
+		.bpp = { 18 },
+		.mplanes = 1,
+		.write_format = MI_CTRL_SP_WRITE_PLA,
+		.output_format = MI_CTRL_SP_OUTPUT_RGB666,
+	},
+};
+
+static struct stream_config rkisp1_mp_stream_config = {
+	.fmts = mp_fmts,
+	.fmt_size = ARRAY_SIZE(mp_fmts),
+	/* constraints */
+	.max_rsz_width = STREAM_MAX_MP_RSZ_OUTPUT_WIDTH,
+	.max_rsz_height = STREAM_MAX_MP_RSZ_OUTPUT_HEIGHT,
+	.min_rsz_width = STREAM_MIN_RSZ_OUTPUT_WIDTH,
+	.min_rsz_height = STREAM_MIN_RSZ_OUTPUT_HEIGHT,
+	/* registers */
+	.rsz = {
+		.ctrl = CIF_MRSZ_CTRL,
+		.scale_hy = CIF_MRSZ_SCALE_HY,
+		.scale_hcr = CIF_MRSZ_SCALE_HCR,
+		.scale_hcb = CIF_MRSZ_SCALE_HCB,
+		.scale_vy = CIF_MRSZ_SCALE_VY,
+		.scale_vc = CIF_MRSZ_SCALE_VC,
+		.scale_lut = CIF_MRSZ_SCALE_LUT,
+		.scale_lut_addr = CIF_MRSZ_SCALE_LUT_ADDR,
+		.scale_hy_shd = CIF_MRSZ_SCALE_HY_SHD,
+		.scale_hcr_shd = CIF_MRSZ_SCALE_HCR_SHD,
+		.scale_hcb_shd = CIF_MRSZ_SCALE_HCB_SHD,
+		.scale_vy_shd = CIF_MRSZ_SCALE_VY_SHD,
+		.scale_vc_shd = CIF_MRSZ_SCALE_VC_SHD,
+		.phase_hy = CIF_MRSZ_PHASE_HY,
+		.phase_hc = CIF_MRSZ_PHASE_HC,
+		.phase_vy = CIF_MRSZ_PHASE_VY,
+		.phase_vc = CIF_MRSZ_PHASE_VC,
+		.ctrl_shd = CIF_MRSZ_CTRL_SHD,
+		.phase_hy_shd = CIF_MRSZ_PHASE_HY_SHD,
+		.phase_hc_shd = CIF_MRSZ_PHASE_HC_SHD,
+		.phase_vy_shd = CIF_MRSZ_PHASE_VY_SHD,
+		.phase_vc_shd = CIF_MRSZ_PHASE_VC_SHD,
+	},
+	.dual_crop = {
+		.ctrl = CIF_DUAL_CROP_CTRL,
+		.yuvmode_mask = CIF_DUAL_CROP_MP_MODE_YUV,
+		.rawmode_mask = CIF_DUAL_CROP_MP_MODE_RAW,
+		.h_offset = CIF_DUAL_CROP_M_H_OFFS,
+		.v_offset = CIF_DUAL_CROP_M_V_OFFS,
+		.h_size = CIF_DUAL_CROP_M_H_SIZE,
+		.v_size = CIF_DUAL_CROP_M_V_SIZE,
+	},
+	.mi = {
+		.y_size_init = CIF_MI_MP_Y_SIZE_INIT,
+		.cb_size_init = CIF_MI_MP_CB_SIZE_INIT,
+		.cr_size_init = CIF_MI_MP_CR_SIZE_INIT,
+		.y_base_ad_init = CIF_MI_MP_Y_BASE_AD_INIT,
+		.cb_base_ad_init = CIF_MI_MP_CB_BASE_AD_INIT,
+		.cr_base_ad_init = CIF_MI_MP_CR_BASE_AD_INIT,
+		.y_offs_cnt_init = CIF_MI_MP_Y_OFFS_CNT_INIT,
+		.cb_offs_cnt_init = CIF_MI_MP_CB_OFFS_CNT_INIT,
+		.cr_offs_cnt_init = CIF_MI_MP_CR_OFFS_CNT_INIT,
+	},
+};
+
+static struct stream_config rkisp1_sp_stream_config = {
+	.fmts = sp_fmts,
+	.fmt_size = ARRAY_SIZE(sp_fmts),
+	/* constraints */
+	.max_rsz_width = STREAM_MAX_SP_RSZ_OUTPUT_WIDTH,
+	.max_rsz_height = STREAM_MAX_SP_RSZ_OUTPUT_HEIGHT,
+	.min_rsz_width = STREAM_MIN_RSZ_OUTPUT_WIDTH,
+	.min_rsz_height = STREAM_MIN_RSZ_OUTPUT_HEIGHT,
+	/* registers */
+	.rsz = {
+		.ctrl = CIF_SRSZ_CTRL,
+		.scale_hy = CIF_SRSZ_SCALE_HY,
+		.scale_hcr = CIF_SRSZ_SCALE_HCR,
+		.scale_hcb = CIF_SRSZ_SCALE_HCB,
+		.scale_vy = CIF_SRSZ_SCALE_VY,
+		.scale_vc = CIF_SRSZ_SCALE_VC,
+		.scale_lut = CIF_SRSZ_SCALE_LUT,
+		.scale_lut_addr = CIF_SRSZ_SCALE_LUT_ADDR,
+		.scale_hy_shd = CIF_SRSZ_SCALE_HY_SHD,
+		.scale_hcr_shd = CIF_SRSZ_SCALE_HCR_SHD,
+		.scale_hcb_shd = CIF_SRSZ_SCALE_HCB_SHD,
+		.scale_vy_shd = CIF_SRSZ_SCALE_VY_SHD,
+		.scale_vc_shd = CIF_SRSZ_SCALE_VC_SHD,
+		.phase_hy = CIF_SRSZ_PHASE_HY,
+		.phase_hc = CIF_SRSZ_PHASE_HC,
+		.phase_vy = CIF_SRSZ_PHASE_VY,
+		.phase_vc = CIF_SRSZ_PHASE_VC,
+		.ctrl_shd = CIF_SRSZ_CTRL_SHD,
+		.phase_hy_shd = CIF_SRSZ_PHASE_HY_SHD,
+		.phase_hc_shd = CIF_SRSZ_PHASE_HC_SHD,
+		.phase_vy_shd = CIF_SRSZ_PHASE_VY_SHD,
+		.phase_vc_shd = CIF_SRSZ_PHASE_VC_SHD,
+	},
+	.dual_crop = {
+		.ctrl = CIF_DUAL_CROP_CTRL,
+		.yuvmode_mask = CIF_DUAL_CROP_SP_MODE_YUV,
+		.rawmode_mask = CIF_DUAL_CROP_SP_MODE_RAW,
+		.h_offset = CIF_DUAL_CROP_S_H_OFFS,
+		.v_offset = CIF_DUAL_CROP_S_V_OFFS,
+		.h_size = CIF_DUAL_CROP_S_H_SIZE,
+		.v_size = CIF_DUAL_CROP_S_V_SIZE,
+	},
+	.mi = {
+		.y_size_init = CIF_MI_SP_Y_SIZE_INIT,
+		.cb_size_init = CIF_MI_SP_CB_SIZE_INIT,
+		.cr_size_init = CIF_MI_SP_CR_SIZE_INIT,
+		.y_base_ad_init = CIF_MI_SP_Y_BASE_AD_INIT,
+		.cb_base_ad_init = CIF_MI_SP_CB_BASE_AD_INIT,
+		.cr_base_ad_init = CIF_MI_SP_CR_BASE_AD_INIT,
+		.y_offs_cnt_init = CIF_MI_SP_Y_OFFS_CNT_INIT,
+		.cb_offs_cnt_init = CIF_MI_SP_CB_OFFS_CNT_INIT,
+		.cr_offs_cnt_init = CIF_MI_SP_CR_OFFS_CNT_INIT,
+	},
+};
+
+static const
+struct capture_fmt *find_fmt(struct rkisp1_stream *stream, const u32 pixelfmt)
+{
+	const struct capture_fmt *fmt;
+	unsigned int i;
+
+	for (i = 0; i < stream->config->fmt_size; i++) {
+		fmt = &stream->config->fmts[i];
+		if (fmt->fourcc == pixelfmt)
+			return fmt;
+	}
+	return NULL;
+}
+
+/* configure dual-crop unit */
+static int rkisp1_config_dcrop(struct rkisp1_stream *stream, bool async)
+{
+	struct rkisp1_device *dev = stream->ispdev;
+	struct v4l2_rect *dcrop = &stream->dcrop;
+	const struct v4l2_rect *input_win;
+
+	/* dual-crop unit get data from ISP */
+	input_win = rkisp1_isp_sd_get_pad_crop(&dev->isp_sdev, NULL,
+					       RKISP1_ISP_PAD_SINK_VIDEO,
+					       V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (dcrop->width == input_win->width &&
+	    dcrop->height == input_win->height &&
+	    dcrop->left == 0 && dcrop->top == 0) {
+		disable_dcrop(stream, async);
+		dev_dbg(dev->dev, "stream %d crop disabled\n", stream->id);
+		return 0;
+	}
+
+	config_dcrop(stream, dcrop, async);
+
+	dev_dbg(dev->dev, "stream %d crop: %dx%d -> %dx%d\n", stream->id,
+		input_win->width, input_win->height,
+		dcrop->width, dcrop->height);
+
+	return 0;
+}
+
+/* configure scale unit */
+static int rkisp1_config_rsz(struct rkisp1_stream *stream, bool async)
+{
+	struct rkisp1_device *dev = stream->ispdev;
+	struct v4l2_pix_format_mplane output_fmt = stream->out_fmt;
+	struct capture_fmt *output_isp_fmt = &stream->out_isp_fmt;
+	const struct rkisp1_fmt *input_isp_fmt = dev->isp_sdev.out_fmt;
+	struct v4l2_rect in_y, in_c, out_y, out_c;
+	u32 xsubs_in, ysubs_in, xsubs_out, ysubs_out;
+
+	if (input_isp_fmt->fmt_type == FMT_BAYER)
+		goto disable;
+
+	/* set input and output sizes for scale calculation */
+	in_y.width = stream->dcrop.width;
+	in_y.height = stream->dcrop.height;
+	out_y.width = output_fmt.width;
+	out_y.height = output_fmt.height;
+
+	/* The size of Cb,Cr are related to the format */
+	if (mbus_code_xysubs(input_isp_fmt->mbus_code, &xsubs_in, &ysubs_in)) {
+		dev_err(dev->dev, "Not xsubs/ysubs found\n");
+		return -EINVAL;
+	}
+	in_c.width = in_y.width / xsubs_in;
+	in_c.height = in_y.height / ysubs_in;
+
+	if (output_isp_fmt->fmt_type == FMT_YUV) {
+		fcc_xysubs(output_isp_fmt->fourcc, &xsubs_out, &ysubs_out);
+		out_c.width = out_y.width / xsubs_out;
+		out_c.height = out_y.height / ysubs_out;
+	} else {
+		out_c.width = out_y.width / xsubs_in;
+		out_c.height = out_y.height / ysubs_in;
+	}
+
+	if (in_c.width == out_c.width && in_c.height == out_c.height)
+		goto disable;
+
+	/* set RSZ input and output */
+	dev_dbg(dev->dev, "stream %d rsz/scale: %dx%d -> %dx%d\n",
+		stream->id, stream->dcrop.width, stream->dcrop.height,
+		output_fmt.width, output_fmt.height);
+	dev_dbg(dev->dev, "chroma scaling %dx%d -> %dx%d\n",
+		in_c.width, in_c.height, out_c.width, out_c.height);
+
+	/* calculate and set scale */
+	config_rsz(stream, &in_y, &in_c, &out_y, &out_c, async);
+
+	dump_rsz_regs(dev->dev, stream);
+
+	return 0;
+
+disable:
+	disable_rsz(stream, async);
+
+	return 0;
+}
+
+/***************************** stream operations*******************************/
+
+/*
+ * configure memory interface for mainpath
+ * This should only be called when stream-on
+ */
+static int mp_config_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+       /*
+	* NOTE: plane_fmt[0].sizeimage is total size of all planes for single
+	* memory plane formats, so calculate the size explicitly.
+	*/
+	mi_set_y_size(stream, stream->out_fmt.plane_fmt[0].bytesperline *
+			 stream->out_fmt.height);
+	mi_set_cb_size(stream, stream->out_fmt.plane_fmt[1].sizeimage);
+	mi_set_cr_size(stream, stream->out_fmt.plane_fmt[2].sizeimage);
+
+	mi_frame_end_int_enable(stream);
+	if (stream->out_isp_fmt.uv_swap)
+		mp_set_uv_swap(base);
+
+	config_mi_ctrl(stream);
+	mp_mi_ctrl_set_format(base, stream->out_isp_fmt.write_format);
+	mp_mi_ctrl_autoupdate_en(base);
+
+	return 0;
+}
+
+/*
+ * configure memory interface for selfpath
+ * This should only be called when stream-on
+ */
+static int sp_config_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	struct rkisp1_device *dev = stream->ispdev;
+	struct capture_fmt *output_isp_fmt = &stream->out_isp_fmt;
+	const struct rkisp1_fmt *input_isp_fmt = dev->isp_sdev.out_fmt;
+	u32 sp_in_fmt;
+
+	if (mbus_code_sp_in_fmt(input_isp_fmt->mbus_code, &sp_in_fmt)) {
+		dev_err(dev->dev, "Can't find the input format\n");
+		return -EINVAL;
+	}
+       /*
+	* NOTE: plane_fmt[0].sizeimage is total size of all planes for single
+	* memory plane formats, so calculate the size explicitly.
+	*/
+	mi_set_y_size(stream, stream->out_fmt.plane_fmt[0].bytesperline *
+		      stream->out_fmt.height);
+	mi_set_cb_size(stream, stream->out_fmt.plane_fmt[1].sizeimage);
+	mi_set_cr_size(stream, stream->out_fmt.plane_fmt[2].sizeimage);
+
+	sp_set_y_width(base, stream->out_fmt.width);
+	sp_set_y_height(base, stream->out_fmt.height);
+	sp_set_y_line_length(base, stream->u.sp.y_stride);
+
+	mi_frame_end_int_enable(stream);
+	if (output_isp_fmt->uv_swap)
+		sp_set_uv_swap(base);
+
+	config_mi_ctrl(stream);
+	sp_mi_ctrl_set_format(base, stream->out_isp_fmt.write_format |
+			      sp_in_fmt | output_isp_fmt->output_format);
+
+	sp_mi_ctrl_autoupdate_en(base);
+
+	return 0;
+}
+
+static void mp_enable_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	struct capture_fmt *isp_fmt = &stream->out_isp_fmt;
+
+	mi_ctrl_mp_disable(base);
+	if (isp_fmt->fmt_type == FMT_BAYER)
+		mi_ctrl_mpraw_enable(base);
+	else if (isp_fmt->fmt_type == FMT_YUV)
+		mi_ctrl_mpyuv_enable(base);
+}
+
+static void sp_enable_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	mi_ctrl_spyuv_enable(base);
+}
+
+static void mp_disable_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	mi_ctrl_mp_disable(base);
+}
+
+static void sp_disable_mi(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	mi_ctrl_spyuv_disable(base);
+}
+
+/* Update buffer info to memory interface, it's called in interrupt */
+static void update_mi(struct rkisp1_stream *stream)
+{
+	struct rkisp1_dummy_buffer *dummy_buf = &stream->dummy_buf;
+
+	/* The dummy space allocated by dma_alloc_coherent is used, we can
+	 * throw data to it if there is no available buffer.
+	 */
+	if (stream->next_buf) {
+		mi_set_y_addr(stream,
+			      stream->next_buf->buff_addr[RKISP1_PLANE_Y]);
+		mi_set_cb_addr(stream,
+			       stream->next_buf->buff_addr[RKISP1_PLANE_CB]);
+		mi_set_cr_addr(stream,
+			       stream->next_buf->buff_addr[RKISP1_PLANE_CR]);
+	} else {
+		dev_dbg(stream->ispdev->dev,
+			"stream %d: to dummy buf\n", stream->id);
+		mi_set_y_addr(stream, dummy_buf->dma_addr);
+		mi_set_cb_addr(stream, dummy_buf->dma_addr);
+		mi_set_cr_addr(stream, dummy_buf->dma_addr);
+	}
+
+	mi_set_y_offset(stream, 0);
+	mi_set_cb_offset(stream, 0);
+	mi_set_cr_offset(stream, 0);
+}
+
+static void mp_stop_mi(struct rkisp1_stream *stream)
+{
+	if (!stream->streaming)
+		return;
+	mi_frame_end_int_clear(stream);
+	stream->ops->disable_mi(stream);
+}
+
+static void sp_stop_mi(struct rkisp1_stream *stream)
+{
+	if (!stream->streaming)
+		return;
+	mi_frame_end_int_clear(stream);
+	stream->ops->disable_mi(stream);
+}
+
+static struct streams_ops rkisp1_mp_streams_ops = {
+	.config_mi = mp_config_mi,
+	.enable_mi = mp_enable_mi,
+	.disable_mi = mp_disable_mi,
+	.stop_mi = mp_stop_mi,
+	.set_data_path = mp_set_data_path,
+	.is_stream_stopped = mp_is_stream_stopped,
+};
+
+static struct streams_ops rkisp1_sp_streams_ops = {
+	.config_mi = sp_config_mi,
+	.enable_mi = sp_enable_mi,
+	.disable_mi = sp_disable_mi,
+	.stop_mi = sp_stop_mi,
+	.set_data_path = sp_set_data_path,
+	.is_stream_stopped = sp_is_stream_stopped,
+};
+
+/*
+ * This function is called when a frame end comes. The next frame
+ * is processing and we should set up buffer for next-next frame,
+ * otherwise it will overflow.
+ */
+static int mi_frame_end(struct rkisp1_stream *stream)
+{
+	struct rkisp1_device *isp_dev = stream->ispdev;
+	struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
+	struct capture_fmt *isp_fmt = &stream->out_isp_fmt;
+	unsigned long lock_flags = 0;
+	int i = 0;
+
+	if (stream->curr_buf) {
+		/* Dequeue a filled buffer */
+		for (i = 0; i < isp_fmt->mplanes; i++) {
+			u32 payload_size =
+				stream->out_fmt.plane_fmt[i].sizeimage;
+			vb2_set_plane_payload(&stream->curr_buf->vb.vb2_buf, i,
+					      payload_size);
+		}
+		stream->curr_buf->vb.sequence =
+				atomic_read(&isp_sd->frm_sync_seq) - 1;
+		stream->curr_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+		stream->curr_buf->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&stream->curr_buf->vb.vb2_buf,
+				VB2_BUF_STATE_DONE);
+	}
+
+	/* Next frame is writing to it */
+	stream->curr_buf = stream->next_buf;
+	stream->next_buf = NULL;
+
+	/* Setup an empty buffer for the next-next frame */
+	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
+	if (!list_empty(&stream->buf_queue)) {
+		stream->next_buf = list_first_entry(&stream->buf_queue,
+						    struct rkisp1_buffer,
+						    queue);
+		list_del(&stream->next_buf->queue);
+	}
+
+	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
+
+	update_mi(stream);
+
+	return 0;
+}
+
+/***************************** vb2 operations*******************************/
+
+/*
+ * Set flags and wait, it should stop in interrupt.
+ * If it didn't, stop it by force.
+ */
+static void rkisp1_stream_stop(struct rkisp1_stream *stream)
+{
+	struct rkisp1_device *dev = stream->ispdev;
+	int ret;
+
+	stream->stopping = true;
+	ret = wait_event_timeout(stream->done,
+				 !stream->streaming,
+				 msecs_to_jiffies(1000));
+	if (!ret) {
+		dev_warn(dev->dev, "waiting on event return error %d\n", ret);
+		stream->ops->stop_mi(stream);
+		stream->stopping = false;
+		stream->streaming = false;
+	}
+	disable_dcrop(stream, true);
+	disable_rsz(stream, true);
+}
+
+/*
+ * Most of registers inside rockchip ISP1 have shadow register since
+ * they must be not changed during processing a frame.
+ * Usually, each sub-module updates its shadow register after
+ * processing the last pixel of a frame.
+ */
+static int rkisp1_start(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	struct rkisp1_device *dev = stream->ispdev;
+	struct rkisp1_stream *other = &dev->stream[stream->id ^ 1];
+	int ret;
+
+	stream->ops->set_data_path(base);
+	ret = stream->ops->config_mi(stream);
+	if (ret)
+		return ret;
+
+	/* Setup a buffer for the next frame */
+	mi_frame_end(stream);
+	stream->ops->enable_mi(stream);
+	/* It's safe to config ACTIVE and SHADOW regs for the
+	 * first stream. While when the second is starting, do NOT
+	 * force_cfg_update() because it also update the first one.
+	 *
+	 * The latter case would drop one more buf(that is 2) since
+	 * there's not buf in shadow when the second FE received. This's
+	 * also required because the second FE maybe corrupt especially
+	 * when run at 120fps.
+	 */
+	if (!other->streaming) {
+		force_cfg_update(base);
+		mi_frame_end(stream);
+	}
+	stream->streaming = true;
+
+	return 0;
+}
+
+static int rkisp1_queue_setup(struct vb2_queue *queue,
+			      unsigned int *num_buffers,
+			      unsigned int *num_planes,
+			      unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct rkisp1_stream *stream = queue->drv_priv;
+	struct rkisp1_device *dev = stream->ispdev;
+	const struct v4l2_pix_format_mplane *pixm = &stream->out_fmt;
+	const struct capture_fmt *isp_fmt = &stream->out_isp_fmt;
+	unsigned int i;
+
+	if (*num_planes) {
+		if (*num_planes != isp_fmt->mplanes)
+			return -EINVAL;
+
+		for (i = 0; i < isp_fmt->mplanes; i++)
+			if (sizes[i] < pixm->plane_fmt[i].sizeimage)
+				return -EINVAL;
+	} else {
+		*num_planes = isp_fmt->mplanes;
+		for (i = 0; i < isp_fmt->mplanes; i++)
+			sizes[i] = pixm->plane_fmt[i].sizeimage;
+	}
+
+	dev_dbg(dev->dev, "%s count %d, size %d\n",
+		v4l2_type_names[queue->type], *num_buffers, sizes[0]);
+
+	return 0;
+}
+
+/*
+ * The vb2_buffer are stored in rkisp1_buffer, in order to unify
+ * mplane buffer and none-mplane buffer.
+ */
+static void rkisp1_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_buffer *ispbuf = to_rkisp1_buffer(vbuf);
+	struct vb2_queue *queue = vb->vb2_queue;
+	struct rkisp1_stream *stream = queue->drv_priv;
+	struct capture_fmt *isp_fmt = &stream->out_isp_fmt;
+	unsigned long lock_flags = 0;
+	unsigned int i;
+
+	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
+	for (i = 0; i < isp_fmt->mplanes; i++)
+		ispbuf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	/* Convert to non-MPLANE */
+	if (isp_fmt->mplanes == 1) {
+		ispbuf->buff_addr[RKISP1_PLANE_CB] =
+			ispbuf->buff_addr[RKISP1_PLANE_Y] +
+			stream->out_fmt.plane_fmt[RKISP1_PLANE_Y].bytesperline *
+			stream->out_fmt.height;
+		ispbuf->buff_addr[RKISP1_PLANE_CR] =
+			ispbuf->buff_addr[RKISP1_PLANE_CB] +
+			stream->out_fmt.plane_fmt[RKISP1_PLANE_CB].sizeimage;
+	}
+	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
+
+	/* XXX: replace dummy to speed up  */
+	if (stream->streaming && !stream->next_buf &&
+	    atomic_read(&stream->ispdev->isp_sdev.frm_sync_seq) == 0) {
+		stream->next_buf = ispbuf;
+		update_mi(stream);
+	} else {
+		list_add_tail(&ispbuf->queue, &stream->buf_queue);
+	}
+	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
+}
+
+static int rkisp1_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_queue *queue = vb->vb2_queue;
+	struct rkisp1_stream *stream = queue->drv_priv;
+	struct rkisp1_device *dev = stream->ispdev;
+	struct capture_fmt *isp_fmt = &stream->out_isp_fmt;
+	unsigned int i;
+
+	for (i = 0; i < isp_fmt->mplanes; i++) {
+		unsigned long size = stream->out_fmt.plane_fmt[i].sizeimage;
+
+		if (isp_fmt->mplanes > 1 && i == 0) {
+			const struct v4l2_plane_pix_format *fmt =
+				&stream->out_fmt.plane_fmt[RKISP1_PLANE_Y];
+
+			size = fmt->bytesperline * stream->out_fmt.height;
+		}
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(dev->dev,
+				"User buffer too small (%ld < %ld)\n",
+				vb2_plane_size(vb, i), size);
+			return -EINVAL;
+		}
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	return 0;
+}
+
+static int rkisp1_create_dummy_buf(struct rkisp1_stream *stream)
+{
+	struct rkisp1_dummy_buffer *dummy_buf = &stream->dummy_buf;
+	struct rkisp1_device *dev = stream->ispdev;
+
+	/* get a maximum size */
+	dummy_buf->size = max3(stream->out_fmt.plane_fmt[0].bytesperline *
+		stream->out_fmt.height,
+		stream->out_fmt.plane_fmt[1].sizeimage,
+		stream->out_fmt.plane_fmt[2].sizeimage);
+
+	dummy_buf->vaddr = dma_alloc_coherent(dev->dev, dummy_buf->size,
+					      &dummy_buf->dma_addr,
+					      GFP_KERNEL);
+	if (!dummy_buf->vaddr) {
+		dev_err(dev->dev,
+			"Failed to allocate the memory for dummy buffer\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void rkisp1_destroy_dummy_buf(struct rkisp1_stream *stream)
+{
+	struct rkisp1_dummy_buffer *dummy_buf = &stream->dummy_buf;
+	struct rkisp1_device *dev = stream->ispdev;
+
+	dma_free_coherent(dev->dev, dummy_buf->size,
+			  dummy_buf->vaddr, dummy_buf->dma_addr);
+}
+
+static void rkisp1_return_all_buffers(struct rkisp1_stream *stream,
+				      enum vb2_buffer_state state)
+{
+	unsigned long lock_flags = 0;
+	struct rkisp1_buffer *buf;
+
+	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
+	if (stream->curr_buf) {
+		list_add_tail(&stream->curr_buf->queue, &stream->buf_queue);
+		stream->curr_buf = NULL;
+	}
+	if (stream->next_buf) {
+		list_add_tail(&stream->next_buf->queue, &stream->buf_queue);
+		stream->next_buf = NULL;
+	}
+	while (!list_empty(&stream->buf_queue)) {
+		buf = list_first_entry(&stream->buf_queue,
+				       struct rkisp1_buffer, queue);
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
+}
+
+/*
+ * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
+ * @from: entity at which to start pipeline walk
+ * @until: entity at which to stop pipeline walk
+ *
+ * Walk the entities chain starting at the pipeline video node and stop
+ * all subdevices in the chain.
+ *
+ * If the until argument isn't NULL, stop the pipeline walk when reaching the
+ * until entity. This is used to disable a partially started pipeline due to a
+ * subdev start error.
+ */
+static int rkisp1_pipeline_sink_walk(struct media_entity *from,
+				     struct media_entity *until,
+				     int (*cb)(struct media_entity *from,
+					       struct media_entity *curr))
+{
+	struct media_entity *entity = from;
+	struct media_pad *pad;
+	unsigned int i;
+	int ret;
+
+	while (1) {
+		pad = NULL;
+		/* Find remote source pad */
+		for (i = 0; i < entity->num_pads; i++) {
+			struct media_pad *spad = &entity->pads[i];
+
+			if (!(spad->flags & MEDIA_PAD_FL_SINK))
+				continue;
+			pad = media_entity_remote_pad(spad);
+			if (pad && is_media_entity_v4l2_subdev(pad->entity))
+				break;
+		}
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		if (entity == until)
+			break;
+
+		ret = cb(from, entity);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rkisp1_pipeline_disable_cb(struct media_entity *from,
+				      struct media_entity *curr)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
+	int ret;
+
+	ret = v4l2_subdev_call(sd, video, s_stream, false);
+	if (ret < 0) {
+		dev_err(sd->dev, "%s: could not disable stream.\n", sd->name);
+		return ret;
+	}
+	return 0;
+}
+
+static int rkisp1_pipeline_enable_cb(struct media_entity *from,
+				     struct media_entity *curr)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
+	int ret;
+
+	ret = v4l2_subdev_call(sd, video, s_stream, true);
+	if (ret < 0) {
+		dev_err(sd->dev, "%s: could not enable stream.\n", sd->name);
+		rkisp1_pipeline_sink_walk(from, curr,
+					  rkisp1_pipeline_disable_cb);
+		return ret;
+	}
+	return 0;
+}
+
+static void rkisp1_stop_streaming(struct vb2_queue *queue)
+{
+	struct rkisp1_stream *stream = queue->drv_priv;
+	struct rkisp1_vdev_node *node = &stream->vnode;
+	struct rkisp1_device *dev = stream->ispdev;
+	int ret;
+
+	rkisp1_stream_stop(stream);
+	/* call to the other devices */
+	media_pipeline_stop(&node->vdev.entity);
+	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
+					rkisp1_pipeline_disable_cb);
+	if (ret < 0)
+		dev_err(dev->dev, "pipeline stream-off failed error:%d\n", ret);
+
+	/* release buffers */
+	rkisp1_return_all_buffers(stream, VB2_BUF_STATE_ERROR);
+
+	ret = pm_runtime_put(dev->dev);
+	if (ret < 0)
+		dev_err(dev->dev, "power down failed error:%d\n", ret);
+
+	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 0);
+	if (ret < 0)
+		dev_err(dev->dev, "pipeline close failed error:%d\n", ret);
+
+	rkisp1_destroy_dummy_buf(stream);
+}
+
+static int rkisp1_stream_start(struct rkisp1_stream *stream)
+{
+	struct rkisp1_device *dev = stream->ispdev;
+	struct rkisp1_stream *other = &dev->stream[stream->id ^ 1];
+	bool async = false;
+	int ret;
+
+	if (other->streaming)
+		async = true;
+
+	ret = rkisp1_config_rsz(stream, async);
+	if (ret < 0) {
+		dev_err(dev->dev, "config rsz failed with error %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * can't be async now, otherwise the latter started stream fails to
+	 * produce mi interrupt.
+	 */
+	ret = rkisp1_config_dcrop(stream, false);
+	if (ret < 0) {
+		dev_err(dev->dev, "config dcrop failed with error %d\n", ret);
+		return ret;
+	}
+
+	return rkisp1_start(stream);
+}
+
+static int
+rkisp1_start_streaming(struct vb2_queue *queue, unsigned int count)
+{
+	struct rkisp1_stream *stream = queue->drv_priv;
+	struct rkisp1_device *dev = stream->ispdev;
+	struct media_entity *entity = &stream->vnode.vdev.entity;
+	int ret = -EINVAL;
+
+	if (WARN_ON(stream->streaming))
+		goto return_queued_buf;
+
+	ret = rkisp1_create_dummy_buf(stream);
+	if (ret < 0)
+		goto return_queued_buf;
+
+	/* power up */
+	ret = pm_runtime_get_sync(dev->dev);
+	if (ret < 0) {
+		dev_err(dev->dev, "power up failed %d\n", ret);
+		goto destroy_dummy_buf;
+	}
+	ret = v4l2_pipeline_pm_use(entity, 1);
+	if (ret < 0) {
+		dev_err(dev->dev, "open cif pipeline failed %d\n", ret);
+		goto close_pipe;
+	}
+
+	/* configure stream hardware to start */
+	ret = rkisp1_stream_start(stream);
+	if (ret < 0) {
+		dev_err(dev->dev, "start streaming failed\n");
+		goto power_down;
+	}
+
+	/* start sub-devices */
+	ret = rkisp1_pipeline_sink_walk(entity, NULL,
+					rkisp1_pipeline_enable_cb);
+	if (ret < 0)
+		goto stop_stream;
+
+	ret = media_pipeline_start(entity, &dev->pipe);
+	if (ret < 0) {
+		dev_err(dev->dev, "start pipeline failed %d\n", ret);
+		goto pipe_stream_off;
+	}
+
+	return 0;
+
+pipe_stream_off:
+	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
+stop_stream:
+	rkisp1_stream_stop(stream);
+power_down:
+	pm_runtime_put(dev->dev);
+close_pipe:
+	v4l2_pipeline_pm_use(entity, 0);
+destroy_dummy_buf:
+	rkisp1_destroy_dummy_buf(stream);
+return_queued_buf:
+	rkisp1_return_all_buffers(stream, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static struct vb2_ops rkisp1_vb2_ops = {
+	.queue_setup = rkisp1_queue_setup,
+	.buf_queue = rkisp1_buf_queue,
+	.buf_prepare = rkisp1_buf_prepare,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = rkisp1_stop_streaming,
+	.start_streaming = rkisp1_start_streaming,
+};
+
+static int rkisp_init_vb2_queue(struct vb2_queue *q,
+				struct rkisp1_stream *stream,
+				enum v4l2_buf_type buf_type)
+{
+	struct rkisp1_vdev_node *node;
+
+	node = queue_to_node(q);
+
+	q->type = buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = stream;
+	q->ops = &rkisp1_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct rkisp1_buffer);
+	q->min_buffers_needed = CIF_ISP_REQ_BUFS_MIN;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &node->vlock;
+	q->dev = stream->ispdev->dev;
+
+	return vb2_queue_init(q);
+}
+
+static void rkisp1_set_fmt(struct rkisp1_stream *stream,
+			   struct v4l2_pix_format_mplane *pixm,
+			   bool try)
+{
+	const struct capture_fmt *fmt;
+	const struct stream_config *config = stream->config;
+	struct rkisp1_stream *other_stream =
+			&stream->ispdev->stream[!stream->id];
+	unsigned int i, planes, imagsize = 0;
+	u32 xsubs = 1, ysubs = 1;
+
+	fmt = find_fmt(stream, pixm->pixelformat);
+	if (!fmt) {
+		fmt = config->fmts;
+		pixm->pixelformat = fmt->fourcc;
+	}
+
+	/* do checks on resolution */
+	pixm->width = clamp_t(u32, pixm->width, config->min_rsz_width,
+			      config->max_rsz_width);
+	pixm->height = clamp_t(u32, pixm->height, config->min_rsz_height,
+			       config->max_rsz_height);
+	pixm->num_planes = fmt->mplanes;
+	pixm->field = V4L2_FIELD_NONE;
+	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+
+	/* can not change quantization when stream-on */
+	if (other_stream->streaming)
+		pixm->quantization = other_stream->out_fmt.quantization;
+	/* output full range by default, take effect in isp_params */
+	else if (!pixm->quantization ||
+		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
+		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	/* calculate size */
+	fcc_xysubs(fmt->fourcc, &xsubs, &ysubs);
+	planes = fmt->cplanes ? fmt->cplanes : fmt->mplanes;
+	for (i = 0; i < planes; i++) {
+		struct v4l2_plane_pix_format *plane_fmt;
+		int width, height, bytesperline;
+
+		plane_fmt = pixm->plane_fmt + i;
+		width = pixm->width / (i ? xsubs : 1);
+		height = pixm->height / (i ? ysubs : 1);
+
+		bytesperline = width * DIV_ROUND_UP(fmt->bpp[i], 8);
+		/* stride is only available for sp stream and y plane */
+		if (stream->id != RKISP1_STREAM_SP || i != 0 ||
+		    plane_fmt->bytesperline < bytesperline)
+			plane_fmt->bytesperline = bytesperline;
+
+		plane_fmt->sizeimage = plane_fmt->bytesperline * height;
+
+		imagsize += plane_fmt->sizeimage;
+	}
+
+	/* convert to non-MPLANE format.
+	 * it's important since we want to unify none-MPLANE
+	 * and MPLANE.
+	 */
+	if (fmt->mplanes == 1)
+		pixm->plane_fmt[0].sizeimage = imagsize;
+
+	if (!try) {
+		stream->out_isp_fmt = *fmt;
+		stream->out_fmt = *pixm;
+
+		if (stream->id == RKISP1_STREAM_SP) {
+			stream->u.sp.y_stride =
+				pixm->plane_fmt[0].bytesperline /
+				DIV_ROUND_UP(fmt->bpp[0], 8);
+		} else {
+			stream->u.mp.raw_enable = (fmt->fmt_type == FMT_BAYER);
+		}
+		dev_dbg(stream->ispdev->dev,
+			"%s: stream: %d req(%d, %d) out(%d, %d)\n", __func__,
+			stream->id, pixm->width, pixm->height,
+			stream->out_fmt.width, stream->out_fmt.height);
+	}
+}
+
+/************************* v4l2_file_operations***************************/
+void rkisp1_stream_init(struct rkisp1_device *dev, u32 id)
+{
+	struct rkisp1_stream *stream = &dev->stream[id];
+	struct v4l2_pix_format_mplane pixm;
+
+	memset(stream, 0, sizeof(*stream));
+	stream->id = id;
+	stream->ispdev = dev;
+
+	INIT_LIST_HEAD(&stream->buf_queue);
+	init_waitqueue_head(&stream->done);
+	spin_lock_init(&stream->vbq_lock);
+	if (stream->id == RKISP1_STREAM_SP) {
+		stream->ops = &rkisp1_sp_streams_ops;
+		stream->config = &rkisp1_sp_stream_config;
+	} else {
+		stream->ops = &rkisp1_mp_streams_ops;
+		stream->config = &rkisp1_mp_stream_config;
+	}
+
+	stream->streaming = false;
+
+	memset(&pixm, 0, sizeof(pixm));
+	pixm.pixelformat = V4L2_PIX_FMT_YUYV;
+	pixm.width = RKISP1_DEFAULT_WIDTH;
+	pixm.height = RKISP1_DEFAULT_HEIGHT;
+	rkisp1_set_fmt(stream, &pixm, false);
+
+	stream->dcrop.left = 0;
+	stream->dcrop.top = 0;
+	stream->dcrop.width = RKISP1_DEFAULT_WIDTH;
+	stream->dcrop.height = RKISP1_DEFAULT_HEIGHT;
+}
+
+static const struct v4l2_file_operations rkisp1_fops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+/*
+ * mp and sp v4l2_ioctl_ops
+ */
+
+static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+
+	rkisp1_set_fmt(stream, &f->fmt.pix_mp, true);
+
+	return 0;
+}
+
+static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+					  struct v4l2_fmtdesc *f)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+	const struct capture_fmt *fmt = NULL;
+
+	if (f->index >= stream->config->fmt_size)
+		return -EINVAL;
+
+	fmt = &stream->config->fmts[f->index];
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
+				       void *priv, struct v4l2_format *f)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+	struct video_device *vdev = &stream->vnode.vdev;
+	struct rkisp1_vdev_node *node = vdev_to_node(vdev);
+	struct rkisp1_device *dev = stream->ispdev;
+
+	if (vb2_is_busy(&node->buf_queue)) {
+		dev_err(dev->dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	rkisp1_set_fmt(stream, &f->fmt.pix_mp, false);
+
+	return 0;
+}
+
+static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+				       struct v4l2_format *f)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+
+	f->fmt.pix_mp = stream->out_fmt;
+
+	return 0;
+}
+
+static int rkisp1_g_selection(struct file *file, void *prv,
+			      struct v4l2_selection *sel)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+	struct rkisp1_device *dev = stream->ispdev;
+	struct v4l2_rect *dcrop = &stream->dcrop;
+	const struct v4l2_rect *input_win;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	input_win = rkisp1_isp_sd_get_pad_crop(&dev->isp_sdev, NULL,
+					       RKISP1_ISP_PAD_SINK_VIDEO,
+					       V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.width = input_win->width;
+		sel->r.height = input_win->height;
+		sel->r.left = 0;
+		sel->r.top = 0;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *dcrop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct v4l2_rect *rkisp1_update_crop(struct rkisp1_stream *stream,
+					    struct v4l2_rect *sel,
+					    const struct v4l2_rect *in)
+{
+	/* Not crop for MP bayer raw data */
+	if (stream->id == RKISP1_STREAM_MP &&
+	    stream->out_isp_fmt.fmt_type == FMT_BAYER) {
+		sel->left = 0;
+		sel->top = 0;
+		sel->width = in->width;
+		sel->height = in->height;
+		return sel;
+	}
+
+	sel->left = ALIGN(sel->left, 2);
+	sel->width = ALIGN(sel->width, 2);
+	sel->left = clamp_t(u32, sel->left, 0,
+			    in->width - STREAM_MIN_MP_SP_INPUT_WIDTH);
+	sel->top = clamp_t(u32, sel->top, 0,
+			   in->height - STREAM_MIN_MP_SP_INPUT_HEIGHT);
+	sel->width = clamp_t(u32, sel->width, STREAM_MIN_MP_SP_INPUT_WIDTH,
+			     in->width - sel->left);
+	sel->height = clamp_t(u32, sel->height, STREAM_MIN_MP_SP_INPUT_HEIGHT,
+			      in->height - sel->top);
+	return sel;
+}
+
+static int rkisp1_s_selection(struct file *file, void *prv,
+			      struct v4l2_selection *sel)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+	struct video_device *vdev = &stream->vnode.vdev;
+	struct rkisp1_vdev_node *node = vdev_to_node(vdev);
+	struct rkisp1_device *dev = stream->ispdev;
+	struct v4l2_rect *dcrop = &stream->dcrop;
+	const struct v4l2_rect *input_win;
+
+	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	if (vb2_is_busy(&node->buf_queue)) {
+		dev_err(dev->dev, "%s queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (sel->flags != 0)
+		return -EINVAL;
+
+	input_win = rkisp1_isp_sd_get_pad_crop(&dev->isp_sdev, NULL,
+					       RKISP1_ISP_PAD_SINK_VIDEO,
+					       V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (sel->target == V4L2_SEL_TGT_CROP) {
+		*dcrop = *rkisp1_update_crop(stream, &sel->r, input_win);
+		dev_dbg(dev->dev,
+			"stream %d crop(%d,%d)/%dx%d\n", stream->id,
+			dcrop->left, dcrop->top, dcrop->width, dcrop->height);
+	}
+
+	return 0;
+}
+
+static int rkisp1_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	struct rkisp1_stream *stream = video_drvdata(file);
+	struct device *dev = stream->ispdev->dev;
+
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
+	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform: " DRIVER_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int rkisp1_vdev_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct rkisp1_stream *stream = video_get_drvdata(vdev);
+	struct rkisp1_isp_subdev *isp_sd = &stream->ispdev->isp_sdev;
+	const struct v4l2_mbus_framefmt *ispsd_frm;
+	u16 isp_quant, cap_quant;
+
+	if (stream->out_isp_fmt.fmt_type != isp_sd->out_fmt->fmt_type) {
+		dev_err(isp_sd->sd.dev,
+			"format type mismatch in link '%s:%d->%s:%d'\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index);
+		return -EPIPE;
+	}
+
+	ispsd_frm = rkisp1_isp_sd_get_pad_fmt(isp_sd, NULL,
+					      RKISP1_ISP_PAD_SINK_VIDEO,
+					      V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	/*
+	 * TODO: we are considering default quantization as full range. Check if
+	 * we can do this or not.
+	 */
+	cap_quant = stream->out_fmt.quantization;
+	isp_quant = ispsd_frm->quantization;
+
+	if (cap_quant == V4L2_QUANTIZATION_DEFAULT)
+		cap_quant = V4L2_QUANTIZATION_FULL_RANGE;
+	if (isp_quant == V4L2_QUANTIZATION_DEFAULT)
+		isp_quant = V4L2_QUANTIZATION_FULL_RANGE;
+	if (cap_quant != isp_quant) {
+		dev_err(isp_sd->sd.dev,
+			"quantization mismatch in link '%s:%d->%s:%d'\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations rkisp1_isp_vdev_media_ops = {
+	.link_validate = rkisp1_vdev_link_validate,
+};
+
+static const struct v4l2_ioctl_ops rkisp1_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_try_fmt_vid_cap_mplane = rkisp1_try_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane = rkisp1_s_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_cap_mplane = rkisp1_g_fmt_vid_cap_mplane,
+	.vidioc_enum_fmt_vid_cap = rkisp1_enum_fmt_vid_cap_mplane,
+	.vidioc_s_selection = rkisp1_s_selection,
+	.vidioc_g_selection = rkisp1_g_selection,
+	.vidioc_querycap = rkisp1_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static void rkisp1_unregister_stream_vdev(struct rkisp1_stream *stream)
+{
+	media_entity_cleanup(&stream->vnode.vdev.entity);
+	video_unregister_device(&stream->vnode.vdev);
+}
+
+void rkisp1_unregister_stream_vdevs(struct rkisp1_device *dev)
+{
+	struct rkisp1_stream *mp_stream = &dev->stream[RKISP1_STREAM_MP];
+	struct rkisp1_stream *sp_stream = &dev->stream[RKISP1_STREAM_SP];
+
+	rkisp1_unregister_stream_vdev(mp_stream);
+	rkisp1_unregister_stream_vdev(sp_stream);
+}
+
+static int rkisp1_register_stream_vdev(struct rkisp1_stream *stream)
+{
+	struct rkisp1_device *dev = stream->ispdev;
+	struct v4l2_device *v4l2_dev = &dev->v4l2_dev;
+	struct video_device *vdev = &stream->vnode.vdev;
+	struct rkisp1_vdev_node *node;
+	int ret;
+
+	strscpy(vdev->name,
+		stream->id == RKISP1_STREAM_SP ? SP_VDEV_NAME : MP_VDEV_NAME,
+		sizeof(vdev->name));
+	node = vdev_to_node(vdev);
+	mutex_init(&node->vlock);
+
+	vdev->ioctl_ops = &rkisp1_v4l2_ioctl_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &rkisp1_fops;
+	vdev->minor = -1;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->lock = &node->vlock;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+				V4L2_CAP_STREAMING;
+	vdev->entity.ops = &rkisp1_isp_vdev_media_ops;
+	video_set_drvdata(vdev, stream);
+	vdev->vfl_dir = VFL_DIR_RX;
+	node->pad.flags = MEDIA_PAD_FL_SINK;
+
+	rkisp_init_vb2_queue(&node->buf_queue, stream,
+			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	vdev->queue = &node->buf_queue;
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret < 0) {
+		dev_err(dev->dev,
+			"video_register_device failed with error %d\n", ret);
+		return ret;
+	}
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret < 0)
+		goto unreg;
+
+	return 0;
+unreg:
+	video_unregister_device(vdev);
+	return ret;
+}
+
+int rkisp1_register_stream_vdevs(struct rkisp1_device *dev)
+{
+	struct rkisp1_stream *stream;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < RKISP1_MAX_STREAM; i++) {
+		stream = &dev->stream[i];
+		stream->ispdev = dev;
+		ret = rkisp1_register_stream_vdev(stream);
+		if (ret < 0)
+			goto err;
+	}
+
+	return 0;
+err:
+	for (j = 0; j < i; j++) {
+		stream = &dev->stream[j];
+		rkisp1_unregister_stream_vdev(stream);
+	}
+
+	return ret;
+}
+
+/****************  Interrupter Handler ****************/
+
+void rkisp1_mi_isr(struct rkisp1_device *dev)
+{
+	unsigned int i;
+	u32 status;
+
+	status = readl(dev->base_addr + CIF_MI_MIS);
+	if (!status)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(dev->stream); ++i) {
+		struct rkisp1_stream *stream = &dev->stream[i];
+
+		if (!(status & CIF_MI_FRAME(stream)))
+			continue;
+
+		mi_frame_end_int_clear(stream);
+
+		if (stream->stopping) {
+			/*
+			 * Make sure stream is actually stopped, whose state
+			 * can be read from the shadow register, before
+			 * wake_up() thread which would immediately free all
+			 * frame buffers. stop_mi() takes effect at the next
+			 * frame end that sync the configurations to shadow
+			 * regs.
+			 */
+			if (stream->ops->is_stream_stopped(dev->base_addr)) {
+				stream->stopping = false;
+				stream->streaming = false;
+				wake_up(&stream->done);
+			} else {
+				stream->ops->stop_mi(stream);
+			}
+		} else {
+			mi_frame_end(stream);
+		}
+	}
+}
diff --git a/drivers/staging/media/rkisp1/capture.h b/drivers/staging/media/rkisp1/capture.h
new file mode 100644
index 000000000000..099b709e60d7
--- /dev/null
+++ b/drivers/staging/media/rkisp1/capture.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - V4l capture device header
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_PATH_VIDEO_H
+#define _RKISP1_PATH_VIDEO_H
+
+#include "common.h"
+
+struct rkisp1_stream;
+
+/*
+ * @fourcc: pixel format
+ * @mbus_code: pixel format over bus
+ * @fmt_type: helper filed for pixel format
+ * @bpp: bits per pixel
+ * @bayer_pat: bayer patten type
+ * @cplanes: number of colour planes
+ * @mplanes: number of stored memory planes
+ * @uv_swap: if cb cr swaped, for yuv
+ * @write_format: defines how YCbCr self picture data is written to memory
+ * @input_format: defines sp input format
+ * @output_format: defines sp output format
+ */
+struct capture_fmt {
+	u32 fourcc;
+	u32 mbus_code;
+	u8 fmt_type;
+	u8 cplanes;
+	u8 mplanes;
+	u8 uv_swap;
+	u32 write_format;
+	u32 output_format;
+	u8 bpp[VIDEO_MAX_PLANES];
+};
+
+enum rkisp1_sp_inp {
+	RKISP1_SP_INP_ISP,
+	RKISP1_SP_INP_DMA_SP,
+	RKISP1_SP_INP_MAX
+};
+
+struct rkisp1_stream_sp {
+	int y_stride;
+	enum rkisp1_sp_inp input_sel;
+};
+
+struct rkisp1_stream_mp {
+	bool raw_enable;
+};
+
+/* Different config between selfpath and mainpath */
+struct stream_config {
+	const struct capture_fmt *fmts;
+	int fmt_size;
+	/* constrains */
+	const int max_rsz_width;
+	const int max_rsz_height;
+	const int min_rsz_width;
+	const int min_rsz_height;
+	/* registers */
+	struct {
+		u32 ctrl;
+		u32 ctrl_shd;
+		u32 scale_hy;
+		u32 scale_hcr;
+		u32 scale_hcb;
+		u32 scale_vy;
+		u32 scale_vc;
+		u32 scale_lut;
+		u32 scale_lut_addr;
+		u32 scale_hy_shd;
+		u32 scale_hcr_shd;
+		u32 scale_hcb_shd;
+		u32 scale_vy_shd;
+		u32 scale_vc_shd;
+		u32 phase_hy;
+		u32 phase_hc;
+		u32 phase_vy;
+		u32 phase_vc;
+		u32 phase_hy_shd;
+		u32 phase_hc_shd;
+		u32 phase_vy_shd;
+		u32 phase_vc_shd;
+	} rsz;
+	struct {
+		u32 ctrl;
+		u32 yuvmode_mask;
+		u32 rawmode_mask;
+		u32 h_offset;
+		u32 v_offset;
+		u32 h_size;
+		u32 v_size;
+	} dual_crop;
+	struct {
+		u32 y_size_init;
+		u32 cb_size_init;
+		u32 cr_size_init;
+		u32 y_base_ad_init;
+		u32 cb_base_ad_init;
+		u32 cr_base_ad_init;
+		u32 y_offs_cnt_init;
+		u32 cb_offs_cnt_init;
+		u32 cr_offs_cnt_init;
+	} mi;
+};
+
+/* Different reg ops between selfpath and mainpath */
+struct streams_ops {
+	int (*config_mi)(struct rkisp1_stream *stream);
+	void (*stop_mi)(struct rkisp1_stream *stream);
+	void (*enable_mi)(struct rkisp1_stream *stream);
+	void (*disable_mi)(struct rkisp1_stream *stream);
+	void (*set_data_path)(void __iomem *base);
+	bool (*is_stream_stopped)(void __iomem *base);
+};
+
+/*
+ * struct rkisp1_stream - ISP capture video device
+ *
+ * @out_isp_fmt: output ISP format
+ * @out_fmt: output buffer size
+ * @dcrop: coordinates of dual-crop
+ *
+ * @vbq_lock: lock to protect buf_queue
+ * @buf_queue: queued buffer list
+ * @dummy_buf: dummy space to store dropped data
+ *
+ * rkisp1 use shadowsock registers, so it need two buffer at a time
+ * @curr_buf: the buffer used for current frame
+ * @next_buf: the buffer used for next frame
+ */
+struct rkisp1_stream {
+	unsigned id:1;
+	struct rkisp1_device *ispdev;
+	struct rkisp1_vdev_node vnode;
+	struct capture_fmt out_isp_fmt;
+	struct v4l2_pix_format_mplane out_fmt;
+	struct v4l2_rect dcrop;
+	struct streams_ops *ops;
+	struct stream_config *config;
+	spinlock_t vbq_lock;
+	struct list_head buf_queue;
+	struct rkisp1_dummy_buffer dummy_buf;
+	struct rkisp1_buffer *curr_buf;
+	struct rkisp1_buffer *next_buf;
+	bool streaming;
+	bool stopping;
+	wait_queue_head_t done;
+	union {
+		struct rkisp1_stream_sp sp;
+		struct rkisp1_stream_mp mp;
+	} u;
+};
+
+void rkisp1_unregister_stream_vdevs(struct rkisp1_device *dev);
+int rkisp1_register_stream_vdevs(struct rkisp1_device *dev);
+void rkisp1_mi_isr(struct rkisp1_device *dev);
+void rkisp1_stream_init(struct rkisp1_device *dev, u32 id);
+
+#endif /* _RKISP1_PATH_VIDEO_H */
diff --git a/drivers/staging/media/rkisp1/regs.c b/drivers/staging/media/rkisp1/regs.c
new file mode 100644
index 000000000000..8017e826bb3d
--- /dev/null
+++ b/drivers/staging/media/rkisp1/regs.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Registers
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <media/v4l2-common.h>
+
+#include "regs.h"
+
+void disable_dcrop(struct rkisp1_stream *stream, bool async)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *dc_ctrl_addr = base + stream->config->dual_crop.ctrl;
+	u32 dc_ctrl = readl(dc_ctrl_addr);
+	u32 mask = ~(stream->config->dual_crop.yuvmode_mask |
+			stream->config->dual_crop.rawmode_mask);
+	u32 val = dc_ctrl & mask;
+
+	if (async)
+		val |= CIF_DUAL_CROP_GEN_CFG_UPD;
+	else
+		val |= CIF_DUAL_CROP_CFG_UPD;
+	writel(val, dc_ctrl_addr);
+}
+
+void
+config_dcrop(struct rkisp1_stream *stream, struct v4l2_rect *rect, bool async)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *dc_ctrl_addr = base + stream->config->dual_crop.ctrl;
+	u32 dc_ctrl = readl(dc_ctrl_addr);
+
+	writel(rect->left, base + stream->config->dual_crop.h_offset);
+	writel(rect->top, base + stream->config->dual_crop.v_offset);
+	writel(rect->width, base + stream->config->dual_crop.h_size);
+	writel(rect->height, base + stream->config->dual_crop.v_size);
+	dc_ctrl |= stream->config->dual_crop.yuvmode_mask;
+	if (async)
+		dc_ctrl |= CIF_DUAL_CROP_GEN_CFG_UPD;
+	else
+		dc_ctrl |= CIF_DUAL_CROP_CFG_UPD;
+	writel(dc_ctrl, dc_ctrl_addr);
+}
+
+void dump_rsz_regs(struct device *dev, struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	dev_dbg(dev,
+		"RSZ_CTRL 0x%08x/0x%08x\n"
+		"RSZ_SCALE_HY %d/%d\n"
+		"RSZ_SCALE_HCB %d/%d\n"
+		"RSZ_SCALE_HCR %d/%d\n"
+		"RSZ_SCALE_VY %d/%d\n"
+		"RSZ_SCALE_VC %d/%d\n"
+		"RSZ_PHASE_HY %d/%d\n"
+		"RSZ_PHASE_HC %d/%d\n"
+		"RSZ_PHASE_VY %d/%d\n"
+		"RSZ_PHASE_VC %d/%d\n",
+		readl(base + stream->config->rsz.ctrl),
+		readl(base + stream->config->rsz.ctrl_shd),
+		readl(base + stream->config->rsz.scale_hy),
+		readl(base + stream->config->rsz.scale_hy_shd),
+		readl(base + stream->config->rsz.scale_hcb),
+		readl(base + stream->config->rsz.scale_hcb_shd),
+		readl(base + stream->config->rsz.scale_hcr),
+		readl(base + stream->config->rsz.scale_hcr_shd),
+		readl(base + stream->config->rsz.scale_vy),
+		readl(base + stream->config->rsz.scale_vy_shd),
+		readl(base + stream->config->rsz.scale_vc),
+		readl(base + stream->config->rsz.scale_vc_shd),
+		readl(base + stream->config->rsz.phase_hy),
+		readl(base + stream->config->rsz.phase_hy_shd),
+		readl(base + stream->config->rsz.phase_hc),
+		readl(base + stream->config->rsz.phase_hc_shd),
+		readl(base + stream->config->rsz.phase_vy),
+		readl(base + stream->config->rsz.phase_vy_shd),
+		readl(base + stream->config->rsz.phase_vc),
+		readl(base + stream->config->rsz.phase_vc_shd));
+}
+
+static void update_rsz_shadow(struct rkisp1_stream *stream, bool async)
+{
+	void __iomem *addr =
+		stream->ispdev->base_addr + stream->config->rsz.ctrl;
+	u32 ctrl_cfg = readl(addr);
+
+	if (async)
+		writel(CIF_RSZ_CTRL_CFG_UPD_AUTO | ctrl_cfg, addr);
+	else
+		writel(CIF_RSZ_CTRL_CFG_UPD | ctrl_cfg, addr);
+}
+
+static void set_scale(struct rkisp1_stream *stream, struct v4l2_rect *in_y,
+		      struct v4l2_rect *in_c, struct v4l2_rect *out_y,
+		      struct v4l2_rect *out_c)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *scale_hy_addr = base + stream->config->rsz.scale_hy;
+	void __iomem *scale_hcr_addr = base + stream->config->rsz.scale_hcr;
+	void __iomem *scale_hcb_addr = base + stream->config->rsz.scale_hcb;
+	void __iomem *scale_vy_addr = base + stream->config->rsz.scale_vy;
+	void __iomem *scale_vc_addr = base + stream->config->rsz.scale_vc;
+	void __iomem *rsz_ctrl_addr = base + stream->config->rsz.ctrl;
+	u32 scale_hy, scale_hc, scale_vy, scale_vc, rsz_ctrl = 0;
+
+	if (in_y->width < out_y->width) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_HY_ENABLE |
+				CIF_RSZ_CTRL_SCALE_HY_UP;
+		scale_hy = ((in_y->width - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(out_y->width - 1);
+		writel(scale_hy, scale_hy_addr);
+	} else if (in_y->width > out_y->width) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_HY_ENABLE;
+		scale_hy = ((out_y->width - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(in_y->width - 1) + 1;
+		writel(scale_hy, scale_hy_addr);
+	}
+	if (in_c->width < out_c->width) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_HC_ENABLE |
+				CIF_RSZ_CTRL_SCALE_HC_UP;
+		scale_hc = ((in_c->width - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(out_c->width - 1);
+		writel(scale_hc, scale_hcb_addr);
+		writel(scale_hc, scale_hcr_addr);
+	} else if (in_c->width > out_c->width) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_HC_ENABLE;
+		scale_hc = ((out_c->width - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(in_c->width - 1) + 1;
+		writel(scale_hc, scale_hcb_addr);
+		writel(scale_hc, scale_hcr_addr);
+	}
+
+	if (in_y->height < out_y->height) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_VY_ENABLE |
+				CIF_RSZ_CTRL_SCALE_VY_UP;
+		scale_vy = ((in_y->height - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(out_y->height - 1);
+		writel(scale_vy, scale_vy_addr);
+	} else if (in_y->height > out_y->height) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_VY_ENABLE;
+		scale_vy = ((out_y->height - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(in_y->height - 1) + 1;
+		writel(scale_vy, scale_vy_addr);
+	}
+
+	if (in_c->height < out_c->height) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_VC_ENABLE |
+				CIF_RSZ_CTRL_SCALE_VC_UP;
+		scale_vc = ((in_c->height - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(out_c->height - 1);
+		writel(scale_vc, scale_vc_addr);
+	} else if (in_c->height > out_c->height) {
+		rsz_ctrl |= CIF_RSZ_CTRL_SCALE_VC_ENABLE;
+		scale_vc = ((out_c->height - 1) * CIF_RSZ_SCALER_FACTOR) /
+				(in_c->height - 1) + 1;
+		writel(scale_vc, scale_vc_addr);
+	}
+
+	writel(rsz_ctrl, rsz_ctrl_addr);
+}
+
+void config_rsz(struct rkisp1_stream *stream, struct v4l2_rect *in_y,
+		struct v4l2_rect *in_c, struct v4l2_rect *out_y,
+		struct v4l2_rect *out_c, bool async)
+{
+	void __iomem *base_addr = stream->ispdev->base_addr;
+	unsigned int i;
+
+	/* No phase offset */
+	writel(0, base_addr + stream->config->rsz.phase_hy);
+	writel(0, base_addr + stream->config->rsz.phase_hc);
+	writel(0, base_addr + stream->config->rsz.phase_vy);
+	writel(0, base_addr + stream->config->rsz.phase_vc);
+
+	/* Linear interpolation */
+	for (i = 0; i < 64; i++) {
+		writel(i, base_addr + stream->config->rsz.scale_lut_addr);
+		writel(i, base_addr + stream->config->rsz.scale_lut);
+	}
+
+	set_scale(stream, in_y, in_c, out_y, out_c);
+
+	update_rsz_shadow(stream, async);
+}
+
+void disable_rsz(struct rkisp1_stream *stream, bool async)
+{
+	writel(0, stream->ispdev->base_addr + stream->config->rsz.ctrl);
+
+	if (!async)
+		update_rsz_shadow(stream, async);
+}
+
+void config_mi_ctrl(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *addr = base + CIF_MI_CTRL;
+	u32 reg;
+
+	reg = readl(addr) & ~GENMASK(17, 16);
+	writel(reg | CIF_MI_CTRL_BURST_LEN_LUM_64, addr);
+	reg = readl(addr) & ~GENMASK(19, 18);
+	writel(reg | CIF_MI_CTRL_BURST_LEN_CHROM_64, addr);
+	reg = readl(addr);
+	writel(reg | CIF_MI_CTRL_INIT_BASE_EN, addr);
+	reg = readl(addr);
+	writel(reg | CIF_MI_CTRL_INIT_OFFSET_EN, addr);
+}
+
+bool mp_is_stream_stopped(void __iomem *base)
+{
+	int en;
+
+	en = CIF_MI_CTRL_SHD_MP_IN_ENABLED | CIF_MI_CTRL_SHD_RAW_OUT_ENABLED;
+	return !(readl(base + CIF_MI_CTRL_SHD) & en);
+}
+
+bool sp_is_stream_stopped(void __iomem *base)
+{
+	return !(readl(base + CIF_MI_CTRL_SHD) & CIF_MI_CTRL_SHD_SP_IN_ENABLED);
+}
diff --git a/drivers/staging/media/rkisp1/regs.h b/drivers/staging/media/rkisp1/regs.h
new file mode 100644
index 000000000000..86dd038160e1
--- /dev/null
+++ b/drivers/staging/media/rkisp1/regs.h
@@ -0,0 +1,1525 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Registers header
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_REGS_H
+#define _RKISP1_REGS_H
+#include "dev.h"
+
+/* ISP_CTRL */
+#define CIF_ISP_CTRL_ISP_ENABLE			BIT(0)
+#define CIF_ISP_CTRL_ISP_MODE_RAW_PICT		(0 << 1)
+#define CIF_ISP_CTRL_ISP_MODE_ITU656		BIT(1)
+#define CIF_ISP_CTRL_ISP_MODE_ITU601		(2 << 1)
+#define CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601	(3 << 1)
+#define CIF_ISP_CTRL_ISP_MODE_DATA_MODE		(4 << 1)
+#define CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656	(5 << 1)
+#define CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656	(6 << 1)
+#define CIF_ISP_CTRL_ISP_INFORM_ENABLE		BIT(4)
+#define CIF_ISP_CTRL_ISP_GAMMA_IN_ENA		BIT(6)
+#define CIF_ISP_CTRL_ISP_AWB_ENA		BIT(7)
+#define CIF_ISP_CTRL_ISP_CFG_UPD_PERMANENT	BIT(8)
+#define CIF_ISP_CTRL_ISP_CFG_UPD		BIT(9)
+#define CIF_ISP_CTRL_ISP_GEN_CFG_UPD		BIT(10)
+#define CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA		BIT(11)
+#define CIF_ISP_CTRL_ISP_FLASH_MODE_ENA		BIT(12)
+#define CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA		BIT(13)
+#define CIF_ISP_CTRL_ISP_CSM_C_FULL_ENA		BIT(14)
+
+/* ISP_ACQ_PROP */
+#define CIF_ISP_ACQ_PROP_POS_EDGE		BIT(0)
+#define CIF_ISP_ACQ_PROP_HSYNC_LOW		BIT(1)
+#define CIF_ISP_ACQ_PROP_VSYNC_LOW		BIT(2)
+#define CIF_ISP_ACQ_PROP_BAYER_PAT_RGGB		(0 << 3)
+#define CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		BIT(3)
+#define CIF_ISP_ACQ_PROP_BAYER_PAT_GBRG		(2 << 3)
+#define CIF_ISP_ACQ_PROP_BAYER_PAT_BGGR		(3 << 3)
+#define CIF_ISP_ACQ_PROP_BAYER_PAT(pat)		((pat) << 3)
+#define CIF_ISP_ACQ_PROP_YCBYCR			(0 << 7)
+#define CIF_ISP_ACQ_PROP_YCRYCB			BIT(7)
+#define CIF_ISP_ACQ_PROP_CBYCRY			(2 << 7)
+#define CIF_ISP_ACQ_PROP_CRYCBY			(3 << 7)
+#define CIF_ISP_ACQ_PROP_FIELD_SEL_ALL		(0 << 9)
+#define CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		BIT(9)
+#define CIF_ISP_ACQ_PROP_FIELD_SEL_ODD		(2 << 9)
+#define CIF_ISP_ACQ_PROP_IN_SEL_12B		(0 << 12)
+#define CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO	BIT(12)
+#define CIF_ISP_ACQ_PROP_IN_SEL_10B_MSB		(2 << 12)
+#define CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO		(3 << 12)
+#define CIF_ISP_ACQ_PROP_IN_SEL_8B_MSB		(4 << 12)
+
+/* VI_DPCL */
+#define CIF_VI_DPCL_DMA_JPEG			(0 << 0)
+#define CIF_VI_DPCL_MP_MUX_MRSZ_MI		BIT(0)
+#define CIF_VI_DPCL_MP_MUX_MRSZ_JPEG		(2 << 0)
+#define CIF_VI_DPCL_CHAN_MODE_MP		BIT(2)
+#define CIF_VI_DPCL_CHAN_MODE_SP		(2 << 2)
+#define CIF_VI_DPCL_CHAN_MODE_MPSP		(3 << 2)
+#define CIF_VI_DPCL_DMA_SW_SPMUX		(0 << 4)
+#define CIF_VI_DPCL_DMA_SW_SI			BIT(4)
+#define CIF_VI_DPCL_DMA_SW_IE			(2 << 4)
+#define CIF_VI_DPCL_DMA_SW_JPEG			(3 << 4)
+#define CIF_VI_DPCL_DMA_SW_ISP			(4 << 4)
+#define CIF_VI_DPCL_IF_SEL_PARALLEL		(0 << 8)
+#define CIF_VI_DPCL_IF_SEL_SMIA			BIT(8)
+#define CIF_VI_DPCL_IF_SEL_MIPI			(2 << 8)
+#define CIF_VI_DPCL_DMA_IE_MUX_DMA		BIT(10)
+#define CIF_VI_DPCL_DMA_SP_MUX_DMA		BIT(11)
+
+/* ISP_IMSC - ISP_MIS - ISP_RIS - ISP_ICR - ISP_ISR */
+#define CIF_ISP_OFF				BIT(0)
+#define CIF_ISP_FRAME				BIT(1)
+#define CIF_ISP_DATA_LOSS			BIT(2)
+#define CIF_ISP_PIC_SIZE_ERROR			BIT(3)
+#define CIF_ISP_AWB_DONE			BIT(4)
+#define CIF_ISP_FRAME_IN			BIT(5)
+#define CIF_ISP_V_START				BIT(6)
+#define CIF_ISP_H_START				BIT(7)
+#define CIF_ISP_FLASH_ON			BIT(8)
+#define CIF_ISP_FLASH_OFF			BIT(9)
+#define CIF_ISP_SHUTTER_ON			BIT(10)
+#define CIF_ISP_SHUTTER_OFF			BIT(11)
+#define CIF_ISP_AFM_SUM_OF			BIT(12)
+#define CIF_ISP_AFM_LUM_OF			BIT(13)
+#define CIF_ISP_AFM_FIN				BIT(14)
+#define CIF_ISP_HIST_MEASURE_RDY		BIT(15)
+#define CIF_ISP_FLASH_CAP			BIT(17)
+#define CIF_ISP_EXP_END				BIT(18)
+#define CIF_ISP_VSM_END				BIT(19)
+
+/* ISP_ERR */
+#define CIF_ISP_ERR_INFORM_SIZE			BIT(0)
+#define CIF_ISP_ERR_IS_SIZE			BIT(1)
+#define CIF_ISP_ERR_OUTFORM_SIZE		BIT(2)
+
+/* MI_CTRL */
+#define CIF_MI_CTRL_MP_ENABLE			BIT(0)
+#define CIF_MI_CTRL_SP_ENABLE			(2 << 0)
+#define CIF_MI_CTRL_JPEG_ENABLE			(4 << 0)
+#define CIF_MI_CTRL_RAW_ENABLE			(8 << 0)
+#define CIF_MI_CTRL_HFLIP			BIT(4)
+#define CIF_MI_CTRL_VFLIP			BIT(5)
+#define CIF_MI_CTRL_ROT				BIT(6)
+#define CIF_MI_BYTE_SWAP			BIT(7)
+#define CIF_MI_SP_Y_FULL_YUV2RGB		BIT(8)
+#define CIF_MI_SP_CBCR_FULL_YUV2RGB		BIT(9)
+#define CIF_MI_SP_422NONCOSITEED		BIT(10)
+#define CIF_MI_MP_PINGPONG_ENABEL		BIT(11)
+#define CIF_MI_SP_PINGPONG_ENABEL		BIT(12)
+#define CIF_MI_MP_AUTOUPDATE_ENABLE		BIT(13)
+#define CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
+#define CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
+#define CIF_MI_CTRL_BURST_LEN_LUM_16		(0 << 16)
+#define CIF_MI_CTRL_BURST_LEN_LUM_32		BIT(16)
+#define CIF_MI_CTRL_BURST_LEN_LUM_64		(2 << 16)
+#define CIF_MI_CTRL_BURST_LEN_CHROM_16		(0 << 18)
+#define CIF_MI_CTRL_BURST_LEN_CHROM_32		BIT(18)
+#define CIF_MI_CTRL_BURST_LEN_CHROM_64		(2 << 18)
+#define CIF_MI_CTRL_INIT_BASE_EN		BIT(20)
+#define CIF_MI_CTRL_INIT_OFFSET_EN		BIT(21)
+#define MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8	(0 << 22)
+#define MI_CTRL_MP_WRITE_YUV_SPLA		BIT(22)
+#define MI_CTRL_MP_WRITE_YUVINT			(2 << 22)
+#define MI_CTRL_MP_WRITE_RAW12			(2 << 22)
+#define MI_CTRL_SP_WRITE_PLA			(0 << 24)
+#define MI_CTRL_SP_WRITE_SPLA			BIT(24)
+#define MI_CTRL_SP_WRITE_INT			(2 << 24)
+#define MI_CTRL_SP_INPUT_YUV400			(0 << 26)
+#define MI_CTRL_SP_INPUT_YUV420			BIT(26)
+#define MI_CTRL_SP_INPUT_YUV422			(2 << 26)
+#define MI_CTRL_SP_INPUT_YUV444			(3 << 26)
+#define MI_CTRL_SP_OUTPUT_YUV400		(0 << 28)
+#define MI_CTRL_SP_OUTPUT_YUV420		BIT(28)
+#define MI_CTRL_SP_OUTPUT_YUV422		(2 << 28)
+#define MI_CTRL_SP_OUTPUT_YUV444		(3 << 28)
+#define MI_CTRL_SP_OUTPUT_RGB565		(4 << 28)
+#define MI_CTRL_SP_OUTPUT_RGB666		(5 << 28)
+#define MI_CTRL_SP_OUTPUT_RGB888		(6 << 28)
+
+#define MI_CTRL_MP_FMT_MASK			GENMASK(23, 22)
+#define MI_CTRL_SP_FMT_MASK			GENMASK(30, 24)
+
+/* MI_INIT */
+#define CIF_MI_INIT_SKIP			BIT(2)
+#define CIF_MI_INIT_SOFT_UPD			BIT(4)
+
+/* MI_CTRL_SHD */
+#define CIF_MI_CTRL_SHD_MP_IN_ENABLED		BIT(0)
+#define CIF_MI_CTRL_SHD_SP_IN_ENABLED		BIT(1)
+#define CIF_MI_CTRL_SHD_JPEG_IN_ENABLED		BIT(2)
+#define CIF_MI_CTRL_SHD_RAW_IN_ENABLED		BIT(3)
+#define CIF_MI_CTRL_SHD_MP_OUT_ENABLED		BIT(16)
+#define CIF_MI_CTRL_SHD_SP_OUT_ENABLED		BIT(17)
+#define CIF_MI_CTRL_SHD_JPEG_OUT_ENABLED	BIT(18)
+#define CIF_MI_CTRL_SHD_RAW_OUT_ENABLED		BIT(19)
+
+/* RSZ_CTRL */
+#define CIF_RSZ_CTRL_SCALE_HY_ENABLE		BIT(0)
+#define CIF_RSZ_CTRL_SCALE_HC_ENABLE		BIT(1)
+#define CIF_RSZ_CTRL_SCALE_VY_ENABLE		BIT(2)
+#define CIF_RSZ_CTRL_SCALE_VC_ENABLE		BIT(3)
+#define CIF_RSZ_CTRL_SCALE_HY_UP		BIT(4)
+#define CIF_RSZ_CTRL_SCALE_HC_UP		BIT(5)
+#define CIF_RSZ_CTRL_SCALE_VY_UP		BIT(6)
+#define CIF_RSZ_CTRL_SCALE_VC_UP		BIT(7)
+#define CIF_RSZ_CTRL_CFG_UPD			BIT(8)
+#define CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
+#define CIF_RSZ_SCALER_FACTOR			BIT(16)
+
+/* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
+#define CIF_MI_FRAME(stream)			BIT((stream)->id)
+#define CIF_MI_MBLK_LINE			BIT(2)
+#define CIF_MI_FILL_MP_Y			BIT(3)
+#define CIF_MI_WRAP_MP_Y			BIT(4)
+#define CIF_MI_WRAP_MP_CB			BIT(5)
+#define CIF_MI_WRAP_MP_CR			BIT(6)
+#define CIF_MI_WRAP_SP_Y			BIT(7)
+#define CIF_MI_WRAP_SP_CB			BIT(8)
+#define CIF_MI_WRAP_SP_CR			BIT(9)
+#define CIF_MI_DMA_READY			BIT(11)
+
+/* MI_STATUS */
+#define CIF_MI_STATUS_MP_Y_FIFO_FULL		BIT(0)
+#define CIF_MI_STATUS_SP_Y_FIFO_FULL		BIT(4)
+
+/* MI_DMA_CTRL */
+#define CIF_MI_DMA_CTRL_BURST_LEN_LUM_16	(0 << 0)
+#define CIF_MI_DMA_CTRL_BURST_LEN_LUM_32	BIT(0)
+#define CIF_MI_DMA_CTRL_BURST_LEN_LUM_64	(2 << 0)
+#define CIF_MI_DMA_CTRL_BURST_LEN_CHROM_16	(0 << 2)
+#define CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	BIT(2)
+#define CIF_MI_DMA_CTRL_BURST_LEN_CHROM_64	(2 << 2)
+#define CIF_MI_DMA_CTRL_READ_FMT_PLANAR		(0 << 4)
+#define CIF_MI_DMA_CTRL_READ_FMT_SPLANAR	BIT(4)
+#define CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
+#define CIF_MI_DMA_CTRL_FMT_YUV420		BIT(6)
+#define CIF_MI_DMA_CTRL_READ_FMT_PACKED		(2 << 4)
+#define CIF_MI_DMA_CTRL_FMT_YUV422		(2 << 6)
+#define CIF_MI_DMA_CTRL_FMT_YUV444		(3 << 6)
+#define CIF_MI_DMA_CTRL_BYTE_SWAP		BIT(8)
+#define CIF_MI_DMA_CTRL_CONTINUOUS_ENA		BIT(9)
+#define CIF_MI_DMA_CTRL_RGB_BAYER_NO		(0 << 12)
+#define CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		BIT(12)
+#define CIF_MI_DMA_CTRL_RGB_BAYER_16BIT		(2 << 12)
+/* MI_DMA_START */
+#define CIF_MI_DMA_START_ENABLE			BIT(0)
+/* MI_XTD_FORMAT_CTRL  */
+#define CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP	BIT(0)
+#define CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP	BIT(1)
+#define CIF_MI_XTD_FMT_CTRL_DMA_CB_CR_SWAP	BIT(2)
+
+/* CCL */
+#define CIF_CCL_CIF_CLK_DIS			BIT(2)
+/* ICCL */
+#define CIF_ICCL_ISP_CLK			BIT(0)
+#define CIF_ICCL_CP_CLK				BIT(1)
+#define CIF_ICCL_RES_2				BIT(2)
+#define CIF_ICCL_MRSZ_CLK			BIT(3)
+#define CIF_ICCL_SRSZ_CLK			BIT(4)
+#define CIF_ICCL_JPEG_CLK			BIT(5)
+#define CIF_ICCL_MI_CLK				BIT(6)
+#define CIF_ICCL_RES_7				BIT(7)
+#define CIF_ICCL_IE_CLK				BIT(8)
+#define CIF_ICCL_SIMP_CLK			BIT(9)
+#define CIF_ICCL_SMIA_CLK			BIT(10)
+#define CIF_ICCL_MIPI_CLK			BIT(11)
+#define CIF_ICCL_DCROP_CLK			BIT(12)
+/* IRCL */
+#define CIF_IRCL_ISP_SW_RST			BIT(0)
+#define CIF_IRCL_CP_SW_RST			BIT(1)
+#define CIF_IRCL_YCS_SW_RST			BIT(2)
+#define CIF_IRCL_MRSZ_SW_RST			BIT(3)
+#define CIF_IRCL_SRSZ_SW_RST			BIT(4)
+#define CIF_IRCL_JPEG_SW_RST			BIT(5)
+#define CIF_IRCL_MI_SW_RST			BIT(6)
+#define CIF_IRCL_CIF_SW_RST			BIT(7)
+#define CIF_IRCL_IE_SW_RST			BIT(8)
+#define CIF_IRCL_SI_SW_RST			BIT(9)
+#define CIF_IRCL_MIPI_SW_RST			BIT(11)
+
+/* C_PROC_CTR */
+#define CIF_C_PROC_CTR_ENABLE			BIT(0)
+#define CIF_C_PROC_YOUT_FULL			BIT(1)
+#define CIF_C_PROC_YIN_FULL			BIT(2)
+#define CIF_C_PROC_COUT_FULL			BIT(3)
+#define CIF_C_PROC_CTRL_RESERVED		0xFFFFFFFE
+#define CIF_C_PROC_CONTRAST_RESERVED		0xFFFFFF00
+#define CIF_C_PROC_BRIGHTNESS_RESERVED		0xFFFFFF00
+#define CIF_C_PROC_HUE_RESERVED			0xFFFFFF00
+#define CIF_C_PROC_SATURATION_RESERVED		0xFFFFFF00
+#define CIF_C_PROC_MACC_RESERVED		0xE000E000
+#define CIF_C_PROC_TONE_RESERVED		0xF000
+/* DUAL_CROP_CTRL */
+#define CIF_DUAL_CROP_MP_MODE_BYPASS		(0 << 0)
+#define CIF_DUAL_CROP_MP_MODE_YUV		BIT(0)
+#define CIF_DUAL_CROP_MP_MODE_RAW		(2 << 0)
+#define CIF_DUAL_CROP_SP_MODE_BYPASS		(0 << 2)
+#define CIF_DUAL_CROP_SP_MODE_YUV		BIT(2)
+#define CIF_DUAL_CROP_SP_MODE_RAW		(2 << 2)
+#define CIF_DUAL_CROP_CFG_UPD_PERMANENT		BIT(4)
+#define CIF_DUAL_CROP_CFG_UPD			BIT(5)
+#define CIF_DUAL_CROP_GEN_CFG_UPD		BIT(6)
+
+/* IMG_EFF_CTRL */
+#define CIF_IMG_EFF_CTRL_ENABLE			BIT(0)
+#define CIF_IMG_EFF_CTRL_MODE_BLACKWHITE	(0 << 1)
+#define CIF_IMG_EFF_CTRL_MODE_NEGATIVE		BIT(1)
+#define CIF_IMG_EFF_CTRL_MODE_SEPIA		(2 << 1)
+#define CIF_IMG_EFF_CTRL_MODE_COLOR_SEL		(3 << 1)
+#define CIF_IMG_EFF_CTRL_MODE_EMBOSS		(4 << 1)
+#define CIF_IMG_EFF_CTRL_MODE_SKETCH		(5 << 1)
+#define CIF_IMG_EFF_CTRL_MODE_SHARPEN		(6 << 1)
+#define CIF_IMG_EFF_CTRL_CFG_UPD		BIT(4)
+#define CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
+
+#define CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
+#define CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
+#define CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
+#define CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
+#define CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
+#define CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
+#define CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
+#define CIF_IMG_EFF_CTRL_MODE_MASK		0xE
+
+/* IMG_EFF_COLOR_SEL */
+#define CIF_IMG_EFF_COLOR_RGB			0
+#define CIF_IMG_EFF_COLOR_B			BIT(0)
+#define CIF_IMG_EFF_COLOR_G			(2 << 0)
+#define CIF_IMG_EFF_COLOR_GB			(3 << 0)
+#define CIF_IMG_EFF_COLOR_R			(4 << 0)
+#define CIF_IMG_EFF_COLOR_RB			(5 << 0)
+#define CIF_IMG_EFF_COLOR_RG			(6 << 0)
+#define CIF_IMG_EFF_COLOR_RGB2			(7 << 0)
+
+/* MIPI_CTRL */
+#define CIF_MIPI_CTRL_OUTPUT_ENA		BIT(0)
+#define CIF_MIPI_CTRL_SHUTDOWNLANES(a)		(((a) & 0xF) << 8)
+#define CIF_MIPI_CTRL_NUM_LANES(a)		(((a) & 0x3) << 12)
+#define CIF_MIPI_CTRL_ERR_SOT_HS_SKIP		BIT(16)
+#define CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP	BIT(17)
+#define CIF_MIPI_CTRL_CLOCKLANE_ENA		BIT(18)
+
+/* MIPI_DATA_SEL */
+#define CIF_MIPI_DATA_SEL_VC(a)			(((a) & 0x3) << 6)
+#define CIF_MIPI_DATA_SEL_DT(a)			(((a) & 0x3F) << 0)
+/* MIPI DATA_TYPE */
+#define CIF_CSI2_DT_YUV420_8b			0x18
+#define CIF_CSI2_DT_YUV420_10b			0x19
+#define CIF_CSI2_DT_YUV422_8b			0x1E
+#define CIF_CSI2_DT_YUV422_10b			0x1F
+#define CIF_CSI2_DT_RGB565			0x22
+#define CIF_CSI2_DT_RGB666			0x23
+#define CIF_CSI2_DT_RGB888			0x24
+#define CIF_CSI2_DT_RAW8			0x2A
+#define CIF_CSI2_DT_RAW10			0x2B
+#define CIF_CSI2_DT_RAW12			0x2C
+
+/* MIPI_IMSC, MIPI_RIS, MIPI_MIS, MIPI_ICR, MIPI_ISR */
+#define CIF_MIPI_SYNC_FIFO_OVFLW(a)		(((a) & 0xF) << 0)
+#define CIF_MIPI_ERR_SOT(a)			(((a) & 0xF) << 4)
+#define CIF_MIPI_ERR_SOT_SYNC(a)		(((a) & 0xF) << 8)
+#define CIF_MIPI_ERR_EOT_SYNC(a)		(((a) & 0xF) << 12)
+#define CIF_MIPI_ERR_CTRL(a)			(((a) & 0xF) << 16)
+#define CIF_MIPI_ERR_PROTOCOL			BIT(20)
+#define CIF_MIPI_ERR_ECC1			BIT(21)
+#define CIF_MIPI_ERR_ECC2			BIT(22)
+#define CIF_MIPI_ERR_CS				BIT(23)
+#define CIF_MIPI_FRAME_END			BIT(24)
+#define CIF_MIPI_ADD_DATA_OVFLW			BIT(25)
+#define CIF_MIPI_ADD_DATA_WATER_MARK		BIT(26)
+
+#define CIF_MIPI_ERR_CSI  (CIF_MIPI_ERR_PROTOCOL | \
+	CIF_MIPI_ERR_ECC1 | \
+	CIF_MIPI_ERR_ECC2 | \
+	CIF_MIPI_ERR_CS)
+
+#define CIF_MIPI_ERR_DPHY  (CIF_MIPI_ERR_SOT(3) | \
+	CIF_MIPI_ERR_SOT_SYNC(3) | \
+	CIF_MIPI_ERR_EOT_SYNC(3) | \
+	CIF_MIPI_ERR_CTRL(3))
+
+/* SUPER_IMPOSE */
+#define CIF_SUPER_IMP_CTRL_NORMAL_MODE		BIT(0)
+#define CIF_SUPER_IMP_CTRL_REF_IMG_MEM		BIT(1)
+#define CIF_SUPER_IMP_CTRL_TRANSP_DIS		BIT(2)
+
+/* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
+#define CIF_ISP_HIST_PROP_MODE_DIS		(0 << 0)
+#define CIF_ISP_HIST_PROP_MODE_RGB		BIT(0)
+#define CIF_ISP_HIST_PROP_MODE_RED		(2 << 0)
+#define CIF_ISP_HIST_PROP_MODE_GREEN		(3 << 0)
+#define CIF_ISP_HIST_PROP_MODE_BLUE		(4 << 0)
+#define CIF_ISP_HIST_PROP_MODE_LUM		(5 << 0)
+#define CIF_ISP_HIST_PROP_MODE_MASK		0x7
+#define CIF_ISP_HIST_PREDIV_SET(x)		(((x) & 0x7F) << 3)
+#define CIF_ISP_HIST_WEIGHT_SET(v0, v1, v2, v3)	\
+				     (((v0) & 0x1F) | (((v1) & 0x1F) << 8)  |\
+				     (((v2) & 0x1F) << 16) | \
+				     (((v3) & 0x1F) << 24))
+
+#define CIF_ISP_HIST_WINDOW_OFFSET_RESERVED	0xFFFFF000
+#define CIF_ISP_HIST_WINDOW_SIZE_RESERVED	0xFFFFF800
+#define CIF_ISP_HIST_WEIGHT_RESERVED		0xE0E0E0E0
+#define CIF_ISP_MAX_HIST_PREDIVIDER		0x0000007F
+#define CIF_ISP_HIST_ROW_NUM			5
+#define CIF_ISP_HIST_COLUMN_NUM			5
+
+/* AUTO FOCUS MEASUREMENT:  ISP_AFM_CTRL */
+#define ISP_AFM_CTRL_ENABLE			BIT(0)
+
+/* SHUTTER CONTROL */
+#define CIF_ISP_SH_CTRL_SH_ENA			BIT(0)
+#define CIF_ISP_SH_CTRL_REP_EN			BIT(1)
+#define CIF_ISP_SH_CTRL_SRC_SH_TRIG		BIT(2)
+#define CIF_ISP_SH_CTRL_EDGE_POS		BIT(3)
+#define CIF_ISP_SH_CTRL_POL_LOW			BIT(4)
+
+/* FLASH MODULE */
+/* ISP_FLASH_CMD */
+#define CIF_FLASH_CMD_PRELIGHT_ON		BIT(0)
+#define CIF_FLASH_CMD_FLASH_ON			BIT(1)
+#define CIF_FLASH_CMD_PRE_FLASH_ON		BIT(2)
+/* ISP_FLASH_CONFIG */
+#define CIF_FLASH_CONFIG_PRELIGHT_END		BIT(0)
+#define CIF_FLASH_CONFIG_VSYNC_POS		BIT(1)
+#define CIF_FLASH_CONFIG_PRELIGHT_LOW		BIT(2)
+#define CIF_FLASH_CONFIG_SRC_FL_TRIG		BIT(3)
+#define CIF_FLASH_CONFIG_DELAY(a)		(((a) & 0xF) << 4)
+
+/* Demosaic:  ISP_DEMOSAIC */
+#define CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
+#define CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
+
+/* AWB */
+/* ISP_AWB_PROP */
+#define CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
+#define CIFISP_AWB_YMAX_READ(x)			(((x) >> 2) & 1)
+#define CIF_ISP_AWB_MODE_RGB_EN			((1 << 31) | (0x2 << 0))
+#define CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
+#define CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
+#define CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
+#define CIF_ISP_AWB_MODE_READ(x)		((x) & 3)
+/* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
+#define CIF_ISP_AWB_GAIN_R_SET(x)		(((x) & 0x3FF) << 16)
+#define CIF_ISP_AWB_GAIN_R_READ(x)		(((x) >> 16) & 0x3FF)
+#define CIF_ISP_AWB_GAIN_B_SET(x)		((x) & 0x3FFF)
+#define CIF_ISP_AWB_GAIN_B_READ(x)		((x) & 0x3FFF)
+/* ISP_AWB_REF */
+#define CIF_ISP_AWB_REF_CR_SET(x)		(((x) & 0xFF) << 8)
+#define CIF_ISP_AWB_REF_CR_READ(x)		(((x) >> 8) & 0xFF)
+#define CIF_ISP_AWB_REF_CB_READ(x)		((x) & 0xFF)
+/* ISP_AWB_THRESH */
+#define CIF_ISP_AWB_MAX_CS_SET(x)		(((x) & 0xFF) << 8)
+#define CIF_ISP_AWB_MAX_CS_READ(x)		(((x) >> 8) & 0xFF)
+#define CIF_ISP_AWB_MIN_C_READ(x)		((x) & 0xFF)
+#define CIF_ISP_AWB_MIN_Y_SET(x)		(((x) & 0xFF) << 16)
+#define CIF_ISP_AWB_MIN_Y_READ(x)		(((x) >> 16) & 0xFF)
+#define CIF_ISP_AWB_MAX_Y_SET(x)		(((x) & 0xFF) << 24)
+#define CIF_ISP_AWB_MAX_Y_READ(x)		(((x) >> 24) & 0xFF)
+/* ISP_AWB_MEAN */
+#define CIF_ISP_AWB_GET_MEAN_CR_R(x)		((x) & 0xFF)
+#define CIF_ISP_AWB_GET_MEAN_CB_B(x)		(((x) >> 8) & 0xFF)
+#define CIF_ISP_AWB_GET_MEAN_Y_G(x)		(((x) >> 16) & 0xFF)
+/* ISP_AWB_WHITE_CNT */
+#define CIF_ISP_AWB_GET_PIXEL_CNT(x)		((x) & 0x3FFFFFF)
+
+#define CIF_ISP_AWB_GAINS_MAX_VAL		0x000003FF
+#define CIF_ISP_AWB_WINDOW_OFFSET_MAX		0x00000FFF
+#define CIF_ISP_AWB_WINDOW_MAX_SIZE		0x00001FFF
+#define CIF_ISP_AWB_CBCR_MAX_REF		0x000000FF
+#define CIF_ISP_AWB_THRES_MAX_YC		0x000000FF
+
+/* AE */
+/* ISP_EXP_CTRL */
+#define CIF_ISP_EXP_ENA				BIT(0)
+#define CIF_ISP_EXP_CTRL_AUTOSTOP		BIT(1)
+/*
+ *'1' luminance calculation according to  Y=(R+G+B) x 0.332 (85/256)
+ *'0' luminance calculation according to Y=16+0.25R+0.5G+0.1094B
+ */
+#define CIF_ISP_EXP_CTRL_MEASMODE_1		BIT(31)
+
+/* ISP_EXP_H_SIZE */
+#define CIF_ISP_EXP_H_SIZE_SET(x)		((x) & 0x7FF)
+#define CIF_ISP_EXP_HEIGHT_MASK			0x000007FF
+/* ISP_EXP_V_SIZE : vertical size must be a multiple of 2). */
+#define CIF_ISP_EXP_V_SIZE_SET(x)		((x) & 0x7FE)
+
+/* ISP_EXP_H_OFFSET */
+#define CIF_ISP_EXP_H_OFFSET_SET(x)		((x) & 0x1FFF)
+#define CIF_ISP_EXP_MAX_HOFFS			2424
+/* ISP_EXP_V_OFFSET */
+#define CIF_ISP_EXP_V_OFFSET_SET(x)		((x) & 0x1FFF)
+#define CIF_ISP_EXP_MAX_VOFFS			1806
+
+#define CIF_ISP_EXP_ROW_NUM			5
+#define CIF_ISP_EXP_COLUMN_NUM			5
+#define CIF_ISP_EXP_NUM_LUMA_REGS \
+	(CIF_ISP_EXP_ROW_NUM * CIF_ISP_EXP_COLUMN_NUM)
+#define CIF_ISP_EXP_BLOCK_MAX_HSIZE		516
+#define CIF_ISP_EXP_BLOCK_MIN_HSIZE		35
+#define CIF_ISP_EXP_BLOCK_MAX_VSIZE		390
+#define CIF_ISP_EXP_BLOCK_MIN_VSIZE		28
+#define CIF_ISP_EXP_MAX_HSIZE	\
+	(CIF_ISP_EXP_BLOCK_MAX_HSIZE * CIF_ISP_EXP_COLUMN_NUM + 1)
+#define CIF_ISP_EXP_MIN_HSIZE	\
+	(CIF_ISP_EXP_BLOCK_MIN_HSIZE * CIF_ISP_EXP_COLUMN_NUM + 1)
+#define CIF_ISP_EXP_MAX_VSIZE	\
+	(CIF_ISP_EXP_BLOCK_MAX_VSIZE * CIF_ISP_EXP_ROW_NUM + 1)
+#define CIF_ISP_EXP_MIN_VSIZE	\
+	(CIF_ISP_EXP_BLOCK_MIN_VSIZE * CIF_ISP_EXP_ROW_NUM + 1)
+
+/* LSC: ISP_LSC_CTRL */
+#define CIF_ISP_LSC_CTRL_ENA			BIT(0)
+#define CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
+#define CIF_ISP_LSC_GRAD_RESERVED		0xF000F000
+#define CIF_ISP_LSC_SAMPLE_RESERVED		0xF000F000
+#define CIF_ISP_LSC_SECTORS_MAX			17
+#define CIF_ISP_LSC_TABLE_DATA(v0, v1)     \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
+#define CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+#define CIF_ISP_LSC_GRAD_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+
+/* LSC: ISP_LSC_TABLE_SEL */
+#define CIF_ISP_LSC_TABLE_0			0
+#define CIF_ISP_LSC_TABLE_1			1
+
+/* LSC: ISP_LSC_STATUS */
+#define CIF_ISP_LSC_ACTIVE_TABLE		BIT(1)
+#define CIF_ISP_LSC_TABLE_ADDRESS_0		0
+#define CIF_ISP_LSC_TABLE_ADDRESS_153		153
+
+/* FLT */
+/* ISP_FILT_MODE */
+#define CIF_ISP_FLT_ENA				BIT(0)
+
+/*
+ * 0: green filter static mode (active filter factor = FILT_FAC_MID)
+ * 1: dynamic noise reduction/sharpen Default
+ */
+#define CIF_ISP_FLT_MODE_DNR			BIT(1)
+#define CIF_ISP_FLT_MODE_MAX			1
+#define CIF_ISP_FLT_CHROMA_V_MODE(x)		(((x) & 0x3) << 4)
+#define CIF_ISP_FLT_CHROMA_H_MODE(x)		(((x) & 0x3) << 6)
+#define CIF_ISP_FLT_CHROMA_MODE_MAX		3
+#define CIF_ISP_FLT_GREEN_STAGE1(x)		(((x) & 0xF) << 8)
+#define CIF_ISP_FLT_GREEN_STAGE1_MAX		8
+#define CIF_ISP_FLT_THREAD_RESERVED		0xFFFFFC00
+#define CIF_ISP_FLT_FAC_RESERVED		0xFFFFFFC0
+#define CIF_ISP_FLT_LUM_WEIGHT_RESERVED		0xFFF80000
+
+#define CIF_ISP_CTK_COEFF_RESERVED		0xFFFFF800
+#define CIF_ISP_XTALK_OFFSET_RESERVED		0xFFFFF000
+
+/* GOC */
+#define CIF_ISP_GAMMA_OUT_MODE_EQU		BIT(0)
+#define CIF_ISP_GOC_MODE_MAX			1
+#define CIF_ISP_GOC_RESERVED			0xFFFFF800
+/* ISP_CTRL BIT 11*/
+#define CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA_READ(x)	(((x) >> 11) & 1)
+
+/* DPCC */
+/* ISP_DPCC_MODE */
+#define CIF_ISP_DPCC_ENA			BIT(0)
+#define CIF_ISP_DPCC_MODE_MAX			0x07
+#define CIF_ISP_DPCC_OUTPUTMODE_MAX		0x0F
+#define CIF_ISP_DPCC_SETUSE_MAX			0x0F
+#define CIF_ISP_DPCC_METHODS_SET_RESERVED	0xFFFFE000
+#define CIF_ISP_DPCC_LINE_THRESH_RESERVED	0xFFFF0000
+#define CIF_ISP_DPCC_LINE_MAD_FAC_RESERVED	0xFFFFC0C0
+#define CIF_ISP_DPCC_PG_FAC_RESERVED		0xFFFFC0C0
+#define CIF_ISP_DPCC_RND_THRESH_RESERVED	0xFFFF0000
+#define CIF_ISP_DPCC_RG_FAC_RESERVED		0xFFFFC0C0
+#define CIF_ISP_DPCC_RO_LIMIT_RESERVED		0xFFFFF000
+#define CIF_ISP_DPCC_RND_OFFS_RESERVED		0xFFFFF000
+
+/* BLS */
+/* ISP_BLS_CTRL */
+#define CIF_ISP_BLS_ENA				BIT(0)
+#define CIF_ISP_BLS_MODE_MEASURED		BIT(1)
+#define CIF_ISP_BLS_MODE_FIXED			0
+#define CIF_ISP_BLS_WINDOW_1			BIT(2)
+#define CIF_ISP_BLS_WINDOW_2			(2 << 2)
+
+/* GAMMA-IN */
+#define CIFISP_DEGAMMA_X_RESERVED	\
+	((1 << 31) | (1 << 27) | (1 << 23) | (1 << 19) |\
+	(1 << 15) | (1 << 11) | (1 << 7) | (1 << 3))
+#define CIFISP_DEGAMMA_Y_RESERVED               0xFFFFF000
+
+/* AFM */
+#define CIF_ISP_AFM_ENA				BIT(0)
+#define CIF_ISP_AFM_THRES_RESERVED		0xFFFF0000
+#define CIF_ISP_AFM_VAR_SHIFT_RESERVED		0xFFF8FFF8
+#define CIF_ISP_AFM_WINDOW_X_RESERVED		0xE000
+#define CIF_ISP_AFM_WINDOW_Y_RESERVED		0xF000
+#define CIF_ISP_AFM_WINDOW_X_MIN		0x5
+#define CIF_ISP_AFM_WINDOW_Y_MIN		0x2
+#define CIF_ISP_AFM_WINDOW_X(x)			(((x) & 0x1FFF) << 16)
+#define CIF_ISP_AFM_WINDOW_Y(x)			((x) & 0x1FFF)
+
+/* DPF */
+#define CIF_ISP_DPF_MODE_EN			BIT(0)
+#define CIF_ISP_DPF_MODE_B_FLT_DIS		BIT(1)
+#define CIF_ISP_DPF_MODE_GB_FLT_DIS		BIT(2)
+#define CIF_ISP_DPF_MODE_GR_FLT_DIS		BIT(3)
+#define CIF_ISP_DPF_MODE_R_FLT_DIS		BIT(4)
+#define CIF_ISP_DPF_MODE_RB_FLTSIZE_9x9		BIT(5)
+#define CIF_ISP_DPF_MODE_NLL_SEGMENTATION	BIT(6)
+#define CIF_ISP_DPF_MODE_AWB_GAIN_COMP		BIT(7)
+#define CIF_ISP_DPF_MODE_LSC_GAIN_COMP		BIT(8)
+#define CIF_ISP_DPF_MODE_USE_NF_GAIN		BIT(9)
+#define CIF_ISP_DPF_NF_GAIN_RESERVED		0xFFFFF000
+#define CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1F
+#define CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3FF
+
+/* =================================================================== */
+/*                            CIF Registers                            */
+/* =================================================================== */
+#define CIF_CTRL_BASE			0x00000000
+#define CIF_CCL				(CIF_CTRL_BASE + 0x00000000)
+#define CIF_VI_ID			(CIF_CTRL_BASE + 0x00000008)
+#define CIF_ICCL			(CIF_CTRL_BASE + 0x00000010)
+#define CIF_IRCL			(CIF_CTRL_BASE + 0x00000014)
+#define CIF_VI_DPCL			(CIF_CTRL_BASE + 0x00000018)
+
+#define CIF_IMG_EFF_BASE		0x00000200
+#define CIF_IMG_EFF_CTRL		(CIF_IMG_EFF_BASE + 0x00000000)
+#define CIF_IMG_EFF_COLOR_SEL		(CIF_IMG_EFF_BASE + 0x00000004)
+#define CIF_IMG_EFF_MAT_1		(CIF_IMG_EFF_BASE + 0x00000008)
+#define CIF_IMG_EFF_MAT_2		(CIF_IMG_EFF_BASE + 0x0000000C)
+#define CIF_IMG_EFF_MAT_3		(CIF_IMG_EFF_BASE + 0x00000010)
+#define CIF_IMG_EFF_MAT_4		(CIF_IMG_EFF_BASE + 0x00000014)
+#define CIF_IMG_EFF_MAT_5		(CIF_IMG_EFF_BASE + 0x00000018)
+#define CIF_IMG_EFF_TINT		(CIF_IMG_EFF_BASE + 0x0000001C)
+#define CIF_IMG_EFF_CTRL_SHD		(CIF_IMG_EFF_BASE + 0x00000020)
+#define CIF_IMG_EFF_SHARPEN		(CIF_IMG_EFF_BASE + 0x00000024)
+
+#define CIF_SUPER_IMP_BASE		0x00000300
+#define CIF_SUPER_IMP_CTRL		(CIF_SUPER_IMP_BASE + 0x00000000)
+#define CIF_SUPER_IMP_OFFSET_X		(CIF_SUPER_IMP_BASE + 0x00000004)
+#define CIF_SUPER_IMP_OFFSET_Y		(CIF_SUPER_IMP_BASE + 0x00000008)
+#define CIF_SUPER_IMP_COLOR_Y		(CIF_SUPER_IMP_BASE + 0x0000000C)
+#define CIF_SUPER_IMP_COLOR_CB		(CIF_SUPER_IMP_BASE + 0x00000010)
+#define CIF_SUPER_IMP_COLOR_CR		(CIF_SUPER_IMP_BASE + 0x00000014)
+
+#define CIF_ISP_BASE			0x00000400
+#define CIF_ISP_CTRL			(CIF_ISP_BASE + 0x00000000)
+#define CIF_ISP_ACQ_PROP		(CIF_ISP_BASE + 0x00000004)
+#define CIF_ISP_ACQ_H_OFFS		(CIF_ISP_BASE + 0x00000008)
+#define CIF_ISP_ACQ_V_OFFS		(CIF_ISP_BASE + 0x0000000C)
+#define CIF_ISP_ACQ_H_SIZE		(CIF_ISP_BASE + 0x00000010)
+#define CIF_ISP_ACQ_V_SIZE		(CIF_ISP_BASE + 0x00000014)
+#define CIF_ISP_ACQ_NR_FRAMES		(CIF_ISP_BASE + 0x00000018)
+#define CIF_ISP_GAMMA_DX_LO		(CIF_ISP_BASE + 0x0000001C)
+#define CIF_ISP_GAMMA_DX_HI		(CIF_ISP_BASE + 0x00000020)
+#define CIF_ISP_GAMMA_R_Y0		(CIF_ISP_BASE + 0x00000024)
+#define CIF_ISP_GAMMA_R_Y1		(CIF_ISP_BASE + 0x00000028)
+#define CIF_ISP_GAMMA_R_Y2		(CIF_ISP_BASE + 0x0000002C)
+#define CIF_ISP_GAMMA_R_Y3		(CIF_ISP_BASE + 0x00000030)
+#define CIF_ISP_GAMMA_R_Y4		(CIF_ISP_BASE + 0x00000034)
+#define CIF_ISP_GAMMA_R_Y5		(CIF_ISP_BASE + 0x00000038)
+#define CIF_ISP_GAMMA_R_Y6		(CIF_ISP_BASE + 0x0000003C)
+#define CIF_ISP_GAMMA_R_Y7		(CIF_ISP_BASE + 0x00000040)
+#define CIF_ISP_GAMMA_R_Y8		(CIF_ISP_BASE + 0x00000044)
+#define CIF_ISP_GAMMA_R_Y9		(CIF_ISP_BASE + 0x00000048)
+#define CIF_ISP_GAMMA_R_Y10		(CIF_ISP_BASE + 0x0000004C)
+#define CIF_ISP_GAMMA_R_Y11		(CIF_ISP_BASE + 0x00000050)
+#define CIF_ISP_GAMMA_R_Y12		(CIF_ISP_BASE + 0x00000054)
+#define CIF_ISP_GAMMA_R_Y13		(CIF_ISP_BASE + 0x00000058)
+#define CIF_ISP_GAMMA_R_Y14		(CIF_ISP_BASE + 0x0000005C)
+#define CIF_ISP_GAMMA_R_Y15		(CIF_ISP_BASE + 0x00000060)
+#define CIF_ISP_GAMMA_R_Y16		(CIF_ISP_BASE + 0x00000064)
+#define CIF_ISP_GAMMA_G_Y0		(CIF_ISP_BASE + 0x00000068)
+#define CIF_ISP_GAMMA_G_Y1		(CIF_ISP_BASE + 0x0000006C)
+#define CIF_ISP_GAMMA_G_Y2		(CIF_ISP_BASE + 0x00000070)
+#define CIF_ISP_GAMMA_G_Y3		(CIF_ISP_BASE + 0x00000074)
+#define CIF_ISP_GAMMA_G_Y4		(CIF_ISP_BASE + 0x00000078)
+#define CIF_ISP_GAMMA_G_Y5		(CIF_ISP_BASE + 0x0000007C)
+#define CIF_ISP_GAMMA_G_Y6		(CIF_ISP_BASE + 0x00000080)
+#define CIF_ISP_GAMMA_G_Y7		(CIF_ISP_BASE + 0x00000084)
+#define CIF_ISP_GAMMA_G_Y8		(CIF_ISP_BASE + 0x00000088)
+#define CIF_ISP_GAMMA_G_Y9		(CIF_ISP_BASE + 0x0000008C)
+#define CIF_ISP_GAMMA_G_Y10		(CIF_ISP_BASE + 0x00000090)
+#define CIF_ISP_GAMMA_G_Y11		(CIF_ISP_BASE + 0x00000094)
+#define CIF_ISP_GAMMA_G_Y12		(CIF_ISP_BASE + 0x00000098)
+#define CIF_ISP_GAMMA_G_Y13		(CIF_ISP_BASE + 0x0000009C)
+#define CIF_ISP_GAMMA_G_Y14		(CIF_ISP_BASE + 0x000000A0)
+#define CIF_ISP_GAMMA_G_Y15		(CIF_ISP_BASE + 0x000000A4)
+#define CIF_ISP_GAMMA_G_Y16		(CIF_ISP_BASE + 0x000000A8)
+#define CIF_ISP_GAMMA_B_Y0		(CIF_ISP_BASE + 0x000000AC)
+#define CIF_ISP_GAMMA_B_Y1		(CIF_ISP_BASE + 0x000000B0)
+#define CIF_ISP_GAMMA_B_Y2		(CIF_ISP_BASE + 0x000000B4)
+#define CIF_ISP_GAMMA_B_Y3		(CIF_ISP_BASE + 0x000000B8)
+#define CIF_ISP_GAMMA_B_Y4		(CIF_ISP_BASE + 0x000000BC)
+#define CIF_ISP_GAMMA_B_Y5		(CIF_ISP_BASE + 0x000000C0)
+#define CIF_ISP_GAMMA_B_Y6		(CIF_ISP_BASE + 0x000000C4)
+#define CIF_ISP_GAMMA_B_Y7		(CIF_ISP_BASE + 0x000000C8)
+#define CIF_ISP_GAMMA_B_Y8		(CIF_ISP_BASE + 0x000000CC)
+#define CIF_ISP_GAMMA_B_Y9		(CIF_ISP_BASE + 0x000000D0)
+#define CIF_ISP_GAMMA_B_Y10		(CIF_ISP_BASE + 0x000000D4)
+#define CIF_ISP_GAMMA_B_Y11		(CIF_ISP_BASE + 0x000000D8)
+#define CIF_ISP_GAMMA_B_Y12		(CIF_ISP_BASE + 0x000000DC)
+#define CIF_ISP_GAMMA_B_Y13		(CIF_ISP_BASE + 0x000000E0)
+#define CIF_ISP_GAMMA_B_Y14		(CIF_ISP_BASE + 0x000000E4)
+#define CIF_ISP_GAMMA_B_Y15		(CIF_ISP_BASE + 0x000000E8)
+#define CIF_ISP_GAMMA_B_Y16		(CIF_ISP_BASE + 0x000000EC)
+#define CIF_ISP_AWB_PROP		(CIF_ISP_BASE + 0x00000110)
+#define CIF_ISP_AWB_WND_H_OFFS		(CIF_ISP_BASE + 0x00000114)
+#define CIF_ISP_AWB_WND_V_OFFS		(CIF_ISP_BASE + 0x00000118)
+#define CIF_ISP_AWB_WND_H_SIZE		(CIF_ISP_BASE + 0x0000011C)
+#define CIF_ISP_AWB_WND_V_SIZE		(CIF_ISP_BASE + 0x00000120)
+#define CIF_ISP_AWB_FRAMES		(CIF_ISP_BASE + 0x00000124)
+#define CIF_ISP_AWB_REF			(CIF_ISP_BASE + 0x00000128)
+#define CIF_ISP_AWB_THRESH		(CIF_ISP_BASE + 0x0000012C)
+#define CIF_ISP_AWB_GAIN_G		(CIF_ISP_BASE + 0x00000138)
+#define CIF_ISP_AWB_GAIN_RB		(CIF_ISP_BASE + 0x0000013C)
+#define CIF_ISP_AWB_WHITE_CNT		(CIF_ISP_BASE + 0x00000140)
+#define CIF_ISP_AWB_MEAN		(CIF_ISP_BASE + 0x00000144)
+#define CIF_ISP_CC_COEFF_0		(CIF_ISP_BASE + 0x00000170)
+#define CIF_ISP_CC_COEFF_1		(CIF_ISP_BASE + 0x00000174)
+#define CIF_ISP_CC_COEFF_2		(CIF_ISP_BASE + 0x00000178)
+#define CIF_ISP_CC_COEFF_3		(CIF_ISP_BASE + 0x0000017C)
+#define CIF_ISP_CC_COEFF_4		(CIF_ISP_BASE + 0x00000180)
+#define CIF_ISP_CC_COEFF_5		(CIF_ISP_BASE + 0x00000184)
+#define CIF_ISP_CC_COEFF_6		(CIF_ISP_BASE + 0x00000188)
+#define CIF_ISP_CC_COEFF_7		(CIF_ISP_BASE + 0x0000018C)
+#define CIF_ISP_CC_COEFF_8		(CIF_ISP_BASE + 0x00000190)
+#define CIF_ISP_OUT_H_OFFS		(CIF_ISP_BASE + 0x00000194)
+#define CIF_ISP_OUT_V_OFFS		(CIF_ISP_BASE + 0x00000198)
+#define CIF_ISP_OUT_H_SIZE		(CIF_ISP_BASE + 0x0000019C)
+#define CIF_ISP_OUT_V_SIZE		(CIF_ISP_BASE + 0x000001A0)
+#define CIF_ISP_DEMOSAIC		(CIF_ISP_BASE + 0x000001A4)
+#define CIF_ISP_FLAGS_SHD		(CIF_ISP_BASE + 0x000001A8)
+#define CIF_ISP_OUT_H_OFFS_SHD		(CIF_ISP_BASE + 0x000001AC)
+#define CIF_ISP_OUT_V_OFFS_SHD		(CIF_ISP_BASE + 0x000001B0)
+#define CIF_ISP_OUT_H_SIZE_SHD		(CIF_ISP_BASE + 0x000001B4)
+#define CIF_ISP_OUT_V_SIZE_SHD		(CIF_ISP_BASE + 0x000001B8)
+#define CIF_ISP_IMSC			(CIF_ISP_BASE + 0x000001BC)
+#define CIF_ISP_RIS			(CIF_ISP_BASE + 0x000001C0)
+#define CIF_ISP_MIS			(CIF_ISP_BASE + 0x000001C4)
+#define CIF_ISP_ICR			(CIF_ISP_BASE + 0x000001C8)
+#define CIF_ISP_ISR			(CIF_ISP_BASE + 0x000001CC)
+#define CIF_ISP_CT_COEFF_0		(CIF_ISP_BASE + 0x000001D0)
+#define CIF_ISP_CT_COEFF_1		(CIF_ISP_BASE + 0x000001D4)
+#define CIF_ISP_CT_COEFF_2		(CIF_ISP_BASE + 0x000001D8)
+#define CIF_ISP_CT_COEFF_3		(CIF_ISP_BASE + 0x000001DC)
+#define CIF_ISP_CT_COEFF_4		(CIF_ISP_BASE + 0x000001E0)
+#define CIF_ISP_CT_COEFF_5		(CIF_ISP_BASE + 0x000001E4)
+#define CIF_ISP_CT_COEFF_6		(CIF_ISP_BASE + 0x000001E8)
+#define CIF_ISP_CT_COEFF_7		(CIF_ISP_BASE + 0x000001EC)
+#define CIF_ISP_CT_COEFF_8		(CIF_ISP_BASE + 0x000001F0)
+#define CIF_ISP_GAMMA_OUT_MODE		(CIF_ISP_BASE + 0x000001F4)
+#define CIF_ISP_GAMMA_OUT_Y_0		(CIF_ISP_BASE + 0x000001F8)
+#define CIF_ISP_GAMMA_OUT_Y_1		(CIF_ISP_BASE + 0x000001FC)
+#define CIF_ISP_GAMMA_OUT_Y_2		(CIF_ISP_BASE + 0x00000200)
+#define CIF_ISP_GAMMA_OUT_Y_3		(CIF_ISP_BASE + 0x00000204)
+#define CIF_ISP_GAMMA_OUT_Y_4		(CIF_ISP_BASE + 0x00000208)
+#define CIF_ISP_GAMMA_OUT_Y_5		(CIF_ISP_BASE + 0x0000020C)
+#define CIF_ISP_GAMMA_OUT_Y_6		(CIF_ISP_BASE + 0x00000210)
+#define CIF_ISP_GAMMA_OUT_Y_7		(CIF_ISP_BASE + 0x00000214)
+#define CIF_ISP_GAMMA_OUT_Y_8		(CIF_ISP_BASE + 0x00000218)
+#define CIF_ISP_GAMMA_OUT_Y_9		(CIF_ISP_BASE + 0x0000021C)
+#define CIF_ISP_GAMMA_OUT_Y_10		(CIF_ISP_BASE + 0x00000220)
+#define CIF_ISP_GAMMA_OUT_Y_11		(CIF_ISP_BASE + 0x00000224)
+#define CIF_ISP_GAMMA_OUT_Y_12		(CIF_ISP_BASE + 0x00000228)
+#define CIF_ISP_GAMMA_OUT_Y_13		(CIF_ISP_BASE + 0x0000022C)
+#define CIF_ISP_GAMMA_OUT_Y_14		(CIF_ISP_BASE + 0x00000230)
+#define CIF_ISP_GAMMA_OUT_Y_15		(CIF_ISP_BASE + 0x00000234)
+#define CIF_ISP_GAMMA_OUT_Y_16		(CIF_ISP_BASE + 0x00000238)
+#define CIF_ISP_ERR			(CIF_ISP_BASE + 0x0000023C)
+#define CIF_ISP_ERR_CLR			(CIF_ISP_BASE + 0x00000240)
+#define CIF_ISP_FRAME_COUNT		(CIF_ISP_BASE + 0x00000244)
+#define CIF_ISP_CT_OFFSET_R		(CIF_ISP_BASE + 0x00000248)
+#define CIF_ISP_CT_OFFSET_G		(CIF_ISP_BASE + 0x0000024C)
+#define CIF_ISP_CT_OFFSET_B		(CIF_ISP_BASE + 0x00000250)
+
+#define CIF_ISP_FLASH_BASE		0x00000660
+#define CIF_ISP_FLASH_CMD		(CIF_ISP_FLASH_BASE + 0x00000000)
+#define CIF_ISP_FLASH_CONFIG		(CIF_ISP_FLASH_BASE + 0x00000004)
+#define CIF_ISP_FLASH_PREDIV		(CIF_ISP_FLASH_BASE + 0x00000008)
+#define CIF_ISP_FLASH_DELAY		(CIF_ISP_FLASH_BASE + 0x0000000C)
+#define CIF_ISP_FLASH_TIME		(CIF_ISP_FLASH_BASE + 0x00000010)
+#define CIF_ISP_FLASH_MAXP		(CIF_ISP_FLASH_BASE + 0x00000014)
+
+#define CIF_ISP_SH_BASE			0x00000680
+#define CIF_ISP_SH_CTRL			(CIF_ISP_SH_BASE + 0x00000000)
+#define CIF_ISP_SH_PREDIV		(CIF_ISP_SH_BASE + 0x00000004)
+#define CIF_ISP_SH_DELAY		(CIF_ISP_SH_BASE + 0x00000008)
+#define CIF_ISP_SH_TIME			(CIF_ISP_SH_BASE + 0x0000000C)
+
+#define CIF_C_PROC_BASE			0x00000800
+#define CIF_C_PROC_CTRL			(CIF_C_PROC_BASE + 0x00000000)
+#define CIF_C_PROC_CONTRAST		(CIF_C_PROC_BASE + 0x00000004)
+#define CIF_C_PROC_BRIGHTNESS		(CIF_C_PROC_BASE + 0x00000008)
+#define CIF_C_PROC_SATURATION		(CIF_C_PROC_BASE + 0x0000000C)
+#define CIF_C_PROC_HUE			(CIF_C_PROC_BASE + 0x00000010)
+
+#define CIF_DUAL_CROP_BASE		0x00000880
+#define CIF_DUAL_CROP_CTRL		(CIF_DUAL_CROP_BASE + 0x00000000)
+#define CIF_DUAL_CROP_M_H_OFFS		(CIF_DUAL_CROP_BASE + 0x00000004)
+#define CIF_DUAL_CROP_M_V_OFFS		(CIF_DUAL_CROP_BASE + 0x00000008)
+#define CIF_DUAL_CROP_M_H_SIZE		(CIF_DUAL_CROP_BASE + 0x0000000C)
+#define CIF_DUAL_CROP_M_V_SIZE		(CIF_DUAL_CROP_BASE + 0x00000010)
+#define CIF_DUAL_CROP_S_H_OFFS		(CIF_DUAL_CROP_BASE + 0x00000014)
+#define CIF_DUAL_CROP_S_V_OFFS		(CIF_DUAL_CROP_BASE + 0x00000018)
+#define CIF_DUAL_CROP_S_H_SIZE		(CIF_DUAL_CROP_BASE + 0x0000001C)
+#define CIF_DUAL_CROP_S_V_SIZE		(CIF_DUAL_CROP_BASE + 0x00000020)
+#define CIF_DUAL_CROP_M_H_OFFS_SHD	(CIF_DUAL_CROP_BASE + 0x00000024)
+#define CIF_DUAL_CROP_M_V_OFFS_SHD	(CIF_DUAL_CROP_BASE + 0x00000028)
+#define CIF_DUAL_CROP_M_H_SIZE_SHD	(CIF_DUAL_CROP_BASE + 0x0000002C)
+#define CIF_DUAL_CROP_M_V_SIZE_SHD	(CIF_DUAL_CROP_BASE + 0x00000030)
+#define CIF_DUAL_CROP_S_H_OFFS_SHD	(CIF_DUAL_CROP_BASE + 0x00000034)
+#define CIF_DUAL_CROP_S_V_OFFS_SHD	(CIF_DUAL_CROP_BASE + 0x00000038)
+#define CIF_DUAL_CROP_S_H_SIZE_SHD	(CIF_DUAL_CROP_BASE + 0x0000003C)
+#define CIF_DUAL_CROP_S_V_SIZE_SHD	(CIF_DUAL_CROP_BASE + 0x00000040)
+
+#define CIF_MRSZ_BASE			0x00000C00
+#define CIF_MRSZ_CTRL			(CIF_MRSZ_BASE + 0x00000000)
+#define CIF_MRSZ_SCALE_HY		(CIF_MRSZ_BASE + 0x00000004)
+#define CIF_MRSZ_SCALE_HCB		(CIF_MRSZ_BASE + 0x00000008)
+#define CIF_MRSZ_SCALE_HCR		(CIF_MRSZ_BASE + 0x0000000C)
+#define CIF_MRSZ_SCALE_VY		(CIF_MRSZ_BASE + 0x00000010)
+#define CIF_MRSZ_SCALE_VC		(CIF_MRSZ_BASE + 0x00000014)
+#define CIF_MRSZ_PHASE_HY		(CIF_MRSZ_BASE + 0x00000018)
+#define CIF_MRSZ_PHASE_HC		(CIF_MRSZ_BASE + 0x0000001C)
+#define CIF_MRSZ_PHASE_VY		(CIF_MRSZ_BASE + 0x00000020)
+#define CIF_MRSZ_PHASE_VC		(CIF_MRSZ_BASE + 0x00000024)
+#define CIF_MRSZ_SCALE_LUT_ADDR		(CIF_MRSZ_BASE + 0x00000028)
+#define CIF_MRSZ_SCALE_LUT		(CIF_MRSZ_BASE + 0x0000002C)
+#define CIF_MRSZ_CTRL_SHD		(CIF_MRSZ_BASE + 0x00000030)
+#define CIF_MRSZ_SCALE_HY_SHD		(CIF_MRSZ_BASE + 0x00000034)
+#define CIF_MRSZ_SCALE_HCB_SHD		(CIF_MRSZ_BASE + 0x00000038)
+#define CIF_MRSZ_SCALE_HCR_SHD		(CIF_MRSZ_BASE + 0x0000003C)
+#define CIF_MRSZ_SCALE_VY_SHD		(CIF_MRSZ_BASE + 0x00000040)
+#define CIF_MRSZ_SCALE_VC_SHD		(CIF_MRSZ_BASE + 0x00000044)
+#define CIF_MRSZ_PHASE_HY_SHD		(CIF_MRSZ_BASE + 0x00000048)
+#define CIF_MRSZ_PHASE_HC_SHD		(CIF_MRSZ_BASE + 0x0000004C)
+#define CIF_MRSZ_PHASE_VY_SHD		(CIF_MRSZ_BASE + 0x00000050)
+#define CIF_MRSZ_PHASE_VC_SHD		(CIF_MRSZ_BASE + 0x00000054)
+
+#define CIF_SRSZ_BASE			0x00001000
+#define CIF_SRSZ_CTRL			(CIF_SRSZ_BASE + 0x00000000)
+#define CIF_SRSZ_SCALE_HY		(CIF_SRSZ_BASE + 0x00000004)
+#define CIF_SRSZ_SCALE_HCB		(CIF_SRSZ_BASE + 0x00000008)
+#define CIF_SRSZ_SCALE_HCR		(CIF_SRSZ_BASE + 0x0000000C)
+#define CIF_SRSZ_SCALE_VY		(CIF_SRSZ_BASE + 0x00000010)
+#define CIF_SRSZ_SCALE_VC		(CIF_SRSZ_BASE + 0x00000014)
+#define CIF_SRSZ_PHASE_HY		(CIF_SRSZ_BASE + 0x00000018)
+#define CIF_SRSZ_PHASE_HC		(CIF_SRSZ_BASE + 0x0000001C)
+#define CIF_SRSZ_PHASE_VY		(CIF_SRSZ_BASE + 0x00000020)
+#define CIF_SRSZ_PHASE_VC		(CIF_SRSZ_BASE + 0x00000024)
+#define CIF_SRSZ_SCALE_LUT_ADDR		(CIF_SRSZ_BASE + 0x00000028)
+#define CIF_SRSZ_SCALE_LUT		(CIF_SRSZ_BASE + 0x0000002C)
+#define CIF_SRSZ_CTRL_SHD		(CIF_SRSZ_BASE + 0x00000030)
+#define CIF_SRSZ_SCALE_HY_SHD		(CIF_SRSZ_BASE + 0x00000034)
+#define CIF_SRSZ_SCALE_HCB_SHD		(CIF_SRSZ_BASE + 0x00000038)
+#define CIF_SRSZ_SCALE_HCR_SHD		(CIF_SRSZ_BASE + 0x0000003C)
+#define CIF_SRSZ_SCALE_VY_SHD		(CIF_SRSZ_BASE + 0x00000040)
+#define CIF_SRSZ_SCALE_VC_SHD		(CIF_SRSZ_BASE + 0x00000044)
+#define CIF_SRSZ_PHASE_HY_SHD		(CIF_SRSZ_BASE + 0x00000048)
+#define CIF_SRSZ_PHASE_HC_SHD		(CIF_SRSZ_BASE + 0x0000004C)
+#define CIF_SRSZ_PHASE_VY_SHD		(CIF_SRSZ_BASE + 0x00000050)
+#define CIF_SRSZ_PHASE_VC_SHD		(CIF_SRSZ_BASE + 0x00000054)
+
+#define CIF_MI_BASE			0x00001400
+#define CIF_MI_CTRL			(CIF_MI_BASE + 0x00000000)
+#define CIF_MI_INIT			(CIF_MI_BASE + 0x00000004)
+#define CIF_MI_MP_Y_BASE_AD_INIT	(CIF_MI_BASE + 0x00000008)
+#define CIF_MI_MP_Y_SIZE_INIT		(CIF_MI_BASE + 0x0000000C)
+#define CIF_MI_MP_Y_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000010)
+#define CIF_MI_MP_Y_OFFS_CNT_START	(CIF_MI_BASE + 0x00000014)
+#define CIF_MI_MP_Y_IRQ_OFFS_INIT	(CIF_MI_BASE + 0x00000018)
+#define CIF_MI_MP_CB_BASE_AD_INIT	(CIF_MI_BASE + 0x0000001C)
+#define CIF_MI_MP_CB_SIZE_INIT		(CIF_MI_BASE + 0x00000020)
+#define CIF_MI_MP_CB_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000024)
+#define CIF_MI_MP_CB_OFFS_CNT_START	(CIF_MI_BASE + 0x00000028)
+#define CIF_MI_MP_CR_BASE_AD_INIT	(CIF_MI_BASE + 0x0000002C)
+#define CIF_MI_MP_CR_SIZE_INIT		(CIF_MI_BASE + 0x00000030)
+#define CIF_MI_MP_CR_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000034)
+#define CIF_MI_MP_CR_OFFS_CNT_START	(CIF_MI_BASE + 0x00000038)
+#define CIF_MI_SP_Y_BASE_AD_INIT	(CIF_MI_BASE + 0x0000003C)
+#define CIF_MI_SP_Y_SIZE_INIT		(CIF_MI_BASE + 0x00000040)
+#define CIF_MI_SP_Y_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000044)
+#define CIF_MI_SP_Y_OFFS_CNT_START	(CIF_MI_BASE + 0x00000048)
+#define CIF_MI_SP_Y_LLENGTH		(CIF_MI_BASE + 0x0000004C)
+#define CIF_MI_SP_CB_BASE_AD_INIT	(CIF_MI_BASE + 0x00000050)
+#define CIF_MI_SP_CB_SIZE_INIT		(CIF_MI_BASE + 0x00000054)
+#define CIF_MI_SP_CB_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000058)
+#define CIF_MI_SP_CB_OFFS_CNT_START	(CIF_MI_BASE + 0x0000005C)
+#define CIF_MI_SP_CR_BASE_AD_INIT	(CIF_MI_BASE + 0x00000060)
+#define CIF_MI_SP_CR_SIZE_INIT		(CIF_MI_BASE + 0x00000064)
+#define CIF_MI_SP_CR_OFFS_CNT_INIT	(CIF_MI_BASE + 0x00000068)
+#define CIF_MI_SP_CR_OFFS_CNT_START	(CIF_MI_BASE + 0x0000006C)
+#define CIF_MI_BYTE_CNT			(CIF_MI_BASE + 0x00000070)
+#define CIF_MI_CTRL_SHD			(CIF_MI_BASE + 0x00000074)
+#define CIF_MI_MP_Y_BASE_AD_SHD		(CIF_MI_BASE + 0x00000078)
+#define CIF_MI_MP_Y_SIZE_SHD		(CIF_MI_BASE + 0x0000007C)
+#define CIF_MI_MP_Y_OFFS_CNT_SHD	(CIF_MI_BASE + 0x00000080)
+#define CIF_MI_MP_Y_IRQ_OFFS_SHD	(CIF_MI_BASE + 0x00000084)
+#define CIF_MI_MP_CB_BASE_AD_SHD	(CIF_MI_BASE + 0x00000088)
+#define CIF_MI_MP_CB_SIZE_SHD		(CIF_MI_BASE + 0x0000008C)
+#define CIF_MI_MP_CB_OFFS_CNT_SHD	(CIF_MI_BASE + 0x00000090)
+#define CIF_MI_MP_CR_BASE_AD_SHD	(CIF_MI_BASE + 0x00000094)
+#define CIF_MI_MP_CR_SIZE_SHD		(CIF_MI_BASE + 0x00000098)
+#define CIF_MI_MP_CR_OFFS_CNT_SHD	(CIF_MI_BASE + 0x0000009C)
+#define CIF_MI_SP_Y_BASE_AD_SHD		(CIF_MI_BASE + 0x000000A0)
+#define CIF_MI_SP_Y_SIZE_SHD		(CIF_MI_BASE + 0x000000A4)
+#define CIF_MI_SP_Y_OFFS_CNT_SHD	(CIF_MI_BASE + 0x000000A8)
+#define CIF_MI_SP_CB_BASE_AD_SHD	(CIF_MI_BASE + 0x000000B0)
+#define CIF_MI_SP_CB_SIZE_SHD		(CIF_MI_BASE + 0x000000B4)
+#define CIF_MI_SP_CB_OFFS_CNT_SHD	(CIF_MI_BASE + 0x000000B8)
+#define CIF_MI_SP_CR_BASE_AD_SHD	(CIF_MI_BASE + 0x000000BC)
+#define CIF_MI_SP_CR_SIZE_SHD		(CIF_MI_BASE + 0x000000C0)
+#define CIF_MI_SP_CR_OFFS_CNT_SHD	(CIF_MI_BASE + 0x000000C4)
+#define CIF_MI_DMA_Y_PIC_START_AD	(CIF_MI_BASE + 0x000000C8)
+#define CIF_MI_DMA_Y_PIC_WIDTH		(CIF_MI_BASE + 0x000000CC)
+#define CIF_MI_DMA_Y_LLENGTH		(CIF_MI_BASE + 0x000000D0)
+#define CIF_MI_DMA_Y_PIC_SIZE		(CIF_MI_BASE + 0x000000D4)
+#define CIF_MI_DMA_CB_PIC_START_AD	(CIF_MI_BASE + 0x000000D8)
+#define CIF_MI_DMA_CR_PIC_START_AD	(CIF_MI_BASE + 0x000000E8)
+#define CIF_MI_IMSC			(CIF_MI_BASE + 0x000000F8)
+#define CIF_MI_RIS			(CIF_MI_BASE + 0x000000FC)
+#define CIF_MI_MIS			(CIF_MI_BASE + 0x00000100)
+#define CIF_MI_ICR			(CIF_MI_BASE + 0x00000104)
+#define CIF_MI_ISR			(CIF_MI_BASE + 0x00000108)
+#define CIF_MI_STATUS			(CIF_MI_BASE + 0x0000010C)
+#define CIF_MI_STATUS_CLR		(CIF_MI_BASE + 0x00000110)
+#define CIF_MI_SP_Y_PIC_WIDTH		(CIF_MI_BASE + 0x00000114)
+#define CIF_MI_SP_Y_PIC_HEIGHT		(CIF_MI_BASE + 0x00000118)
+#define CIF_MI_SP_Y_PIC_SIZE		(CIF_MI_BASE + 0x0000011C)
+#define CIF_MI_DMA_CTRL			(CIF_MI_BASE + 0x00000120)
+#define CIF_MI_DMA_START		(CIF_MI_BASE + 0x00000124)
+#define CIF_MI_DMA_STATUS		(CIF_MI_BASE + 0x00000128)
+#define CIF_MI_PIXEL_COUNT		(CIF_MI_BASE + 0x0000012C)
+#define CIF_MI_MP_Y_BASE_AD_INIT2	(CIF_MI_BASE + 0x00000130)
+#define CIF_MI_MP_CB_BASE_AD_INIT2	(CIF_MI_BASE + 0x00000134)
+#define CIF_MI_MP_CR_BASE_AD_INIT2	(CIF_MI_BASE + 0x00000138)
+#define CIF_MI_SP_Y_BASE_AD_INIT2	(CIF_MI_BASE + 0x0000013C)
+#define CIF_MI_SP_CB_BASE_AD_INIT2	(CIF_MI_BASE + 0x00000140)
+#define CIF_MI_SP_CR_BASE_AD_INIT2	(CIF_MI_BASE + 0x00000144)
+#define CIF_MI_XTD_FORMAT_CTRL		(CIF_MI_BASE + 0x00000148)
+
+#define CIF_SMIA_BASE			0x00001A00
+#define CIF_SMIA_CTRL			(CIF_SMIA_BASE + 0x00000000)
+#define CIF_SMIA_STATUS			(CIF_SMIA_BASE + 0x00000004)
+#define CIF_SMIA_IMSC			(CIF_SMIA_BASE + 0x00000008)
+#define CIF_SMIA_RIS			(CIF_SMIA_BASE + 0x0000000C)
+#define CIF_SMIA_MIS			(CIF_SMIA_BASE + 0x00000010)
+#define CIF_SMIA_ICR			(CIF_SMIA_BASE + 0x00000014)
+#define CIF_SMIA_ISR			(CIF_SMIA_BASE + 0x00000018)
+#define CIF_SMIA_DATA_FORMAT_SEL	(CIF_SMIA_BASE + 0x0000001C)
+#define CIF_SMIA_SOF_EMB_DATA_LINES	(CIF_SMIA_BASE + 0x00000020)
+#define CIF_SMIA_EMB_HSTART		(CIF_SMIA_BASE + 0x00000024)
+#define CIF_SMIA_EMB_HSIZE		(CIF_SMIA_BASE + 0x00000028)
+#define CIF_SMIA_EMB_VSTART		(CIF_SMIA_BASE + 0x0000002c)
+#define CIF_SMIA_NUM_LINES		(CIF_SMIA_BASE + 0x00000030)
+#define CIF_SMIA_EMB_DATA_FIFO		(CIF_SMIA_BASE + 0x00000034)
+#define CIF_SMIA_EMB_DATA_WATERMARK	(CIF_SMIA_BASE + 0x00000038)
+
+#define CIF_MIPI_BASE			0x00001C00
+#define CIF_MIPI_CTRL			(CIF_MIPI_BASE + 0x00000000)
+#define CIF_MIPI_STATUS			(CIF_MIPI_BASE + 0x00000004)
+#define CIF_MIPI_IMSC			(CIF_MIPI_BASE + 0x00000008)
+#define CIF_MIPI_RIS			(CIF_MIPI_BASE + 0x0000000C)
+#define CIF_MIPI_MIS			(CIF_MIPI_BASE + 0x00000010)
+#define CIF_MIPI_ICR			(CIF_MIPI_BASE + 0x00000014)
+#define CIF_MIPI_ISR			(CIF_MIPI_BASE + 0x00000018)
+#define CIF_MIPI_CUR_DATA_ID		(CIF_MIPI_BASE + 0x0000001C)
+#define CIF_MIPI_IMG_DATA_SEL		(CIF_MIPI_BASE + 0x00000020)
+#define CIF_MIPI_ADD_DATA_SEL_1		(CIF_MIPI_BASE + 0x00000024)
+#define CIF_MIPI_ADD_DATA_SEL_2		(CIF_MIPI_BASE + 0x00000028)
+#define CIF_MIPI_ADD_DATA_SEL_3		(CIF_MIPI_BASE + 0x0000002C)
+#define CIF_MIPI_ADD_DATA_SEL_4		(CIF_MIPI_BASE + 0x00000030)
+#define CIF_MIPI_ADD_DATA_FIFO		(CIF_MIPI_BASE + 0x00000034)
+#define CIF_MIPI_FIFO_FILL_LEVEL	(CIF_MIPI_BASE + 0x00000038)
+#define CIF_MIPI_COMPRESSED_MODE	(CIF_MIPI_BASE + 0x0000003C)
+#define CIF_MIPI_FRAME			(CIF_MIPI_BASE + 0x00000040)
+#define CIF_MIPI_GEN_SHORT_DT		(CIF_MIPI_BASE + 0x00000044)
+#define CIF_MIPI_GEN_SHORT_8_9		(CIF_MIPI_BASE + 0x00000048)
+#define CIF_MIPI_GEN_SHORT_A_B		(CIF_MIPI_BASE + 0x0000004C)
+#define CIF_MIPI_GEN_SHORT_C_D		(CIF_MIPI_BASE + 0x00000050)
+#define CIF_MIPI_GEN_SHORT_E_F		(CIF_MIPI_BASE + 0x00000054)
+
+#define CIF_ISP_AFM_BASE		0x00002000
+#define CIF_ISP_AFM_CTRL		(CIF_ISP_AFM_BASE + 0x00000000)
+#define CIF_ISP_AFM_LT_A		(CIF_ISP_AFM_BASE + 0x00000004)
+#define CIF_ISP_AFM_RB_A		(CIF_ISP_AFM_BASE + 0x00000008)
+#define CIF_ISP_AFM_LT_B		(CIF_ISP_AFM_BASE + 0x0000000C)
+#define CIF_ISP_AFM_RB_B		(CIF_ISP_AFM_BASE + 0x00000010)
+#define CIF_ISP_AFM_LT_C		(CIF_ISP_AFM_BASE + 0x00000014)
+#define CIF_ISP_AFM_RB_C		(CIF_ISP_AFM_BASE + 0x00000018)
+#define CIF_ISP_AFM_THRES		(CIF_ISP_AFM_BASE + 0x0000001C)
+#define CIF_ISP_AFM_VAR_SHIFT		(CIF_ISP_AFM_BASE + 0x00000020)
+#define CIF_ISP_AFM_SUM_A		(CIF_ISP_AFM_BASE + 0x00000024)
+#define CIF_ISP_AFM_SUM_B		(CIF_ISP_AFM_BASE + 0x00000028)
+#define CIF_ISP_AFM_SUM_C		(CIF_ISP_AFM_BASE + 0x0000002C)
+#define CIF_ISP_AFM_LUM_A		(CIF_ISP_AFM_BASE + 0x00000030)
+#define CIF_ISP_AFM_LUM_B		(CIF_ISP_AFM_BASE + 0x00000034)
+#define CIF_ISP_AFM_LUM_C		(CIF_ISP_AFM_BASE + 0x00000038)
+
+#define CIF_ISP_LSC_BASE		0x00002200
+#define CIF_ISP_LSC_CTRL		(CIF_ISP_LSC_BASE + 0x00000000)
+#define CIF_ISP_LSC_R_TABLE_ADDR	(CIF_ISP_LSC_BASE + 0x00000004)
+#define CIF_ISP_LSC_GR_TABLE_ADDR	(CIF_ISP_LSC_BASE + 0x00000008)
+#define CIF_ISP_LSC_B_TABLE_ADDR	(CIF_ISP_LSC_BASE + 0x0000000C)
+#define CIF_ISP_LSC_GB_TABLE_ADDR	(CIF_ISP_LSC_BASE + 0x00000010)
+#define CIF_ISP_LSC_R_TABLE_DATA	(CIF_ISP_LSC_BASE + 0x00000014)
+#define CIF_ISP_LSC_GR_TABLE_DATA	(CIF_ISP_LSC_BASE + 0x00000018)
+#define CIF_ISP_LSC_B_TABLE_DATA	(CIF_ISP_LSC_BASE + 0x0000001C)
+#define CIF_ISP_LSC_GB_TABLE_DATA	(CIF_ISP_LSC_BASE + 0x00000020)
+#define CIF_ISP_LSC_XGRAD_01		(CIF_ISP_LSC_BASE + 0x00000024)
+#define CIF_ISP_LSC_XGRAD_23		(CIF_ISP_LSC_BASE + 0x00000028)
+#define CIF_ISP_LSC_XGRAD_45		(CIF_ISP_LSC_BASE + 0x0000002C)
+#define CIF_ISP_LSC_XGRAD_67		(CIF_ISP_LSC_BASE + 0x00000030)
+#define CIF_ISP_LSC_YGRAD_01		(CIF_ISP_LSC_BASE + 0x00000034)
+#define CIF_ISP_LSC_YGRAD_23		(CIF_ISP_LSC_BASE + 0x00000038)
+#define CIF_ISP_LSC_YGRAD_45		(CIF_ISP_LSC_BASE + 0x0000003C)
+#define CIF_ISP_LSC_YGRAD_67		(CIF_ISP_LSC_BASE + 0x00000040)
+#define CIF_ISP_LSC_XSIZE_01		(CIF_ISP_LSC_BASE + 0x00000044)
+#define CIF_ISP_LSC_XSIZE_23		(CIF_ISP_LSC_BASE + 0x00000048)
+#define CIF_ISP_LSC_XSIZE_45		(CIF_ISP_LSC_BASE + 0x0000004C)
+#define CIF_ISP_LSC_XSIZE_67		(CIF_ISP_LSC_BASE + 0x00000050)
+#define CIF_ISP_LSC_YSIZE_01		(CIF_ISP_LSC_BASE + 0x00000054)
+#define CIF_ISP_LSC_YSIZE_23		(CIF_ISP_LSC_BASE + 0x00000058)
+#define CIF_ISP_LSC_YSIZE_45		(CIF_ISP_LSC_BASE + 0x0000005C)
+#define CIF_ISP_LSC_YSIZE_67		(CIF_ISP_LSC_BASE + 0x00000060)
+#define CIF_ISP_LSC_TABLE_SEL		(CIF_ISP_LSC_BASE + 0x00000064)
+#define CIF_ISP_LSC_STATUS		(CIF_ISP_LSC_BASE + 0x00000068)
+
+#define CIF_ISP_IS_BASE			0x00002300
+#define CIF_ISP_IS_CTRL			(CIF_ISP_IS_BASE + 0x00000000)
+#define CIF_ISP_IS_RECENTER		(CIF_ISP_IS_BASE + 0x00000004)
+#define CIF_ISP_IS_H_OFFS		(CIF_ISP_IS_BASE + 0x00000008)
+#define CIF_ISP_IS_V_OFFS		(CIF_ISP_IS_BASE + 0x0000000C)
+#define CIF_ISP_IS_H_SIZE		(CIF_ISP_IS_BASE + 0x00000010)
+#define CIF_ISP_IS_V_SIZE		(CIF_ISP_IS_BASE + 0x00000014)
+#define CIF_ISP_IS_MAX_DX		(CIF_ISP_IS_BASE + 0x00000018)
+#define CIF_ISP_IS_MAX_DY		(CIF_ISP_IS_BASE + 0x0000001C)
+#define CIF_ISP_IS_DISPLACE		(CIF_ISP_IS_BASE + 0x00000020)
+#define CIF_ISP_IS_H_OFFS_SHD		(CIF_ISP_IS_BASE + 0x00000024)
+#define CIF_ISP_IS_V_OFFS_SHD		(CIF_ISP_IS_BASE + 0x00000028)
+#define CIF_ISP_IS_H_SIZE_SHD		(CIF_ISP_IS_BASE + 0x0000002C)
+#define CIF_ISP_IS_V_SIZE_SHD		(CIF_ISP_IS_BASE + 0x00000030)
+
+#define CIF_ISP_HIST_BASE		0x00002400
+
+#define CIF_ISP_HIST_PROP		(CIF_ISP_HIST_BASE + 0x00000000)
+#define CIF_ISP_HIST_H_OFFS		(CIF_ISP_HIST_BASE + 0x00000004)
+#define CIF_ISP_HIST_V_OFFS		(CIF_ISP_HIST_BASE + 0x00000008)
+#define CIF_ISP_HIST_H_SIZE		(CIF_ISP_HIST_BASE + 0x0000000C)
+#define CIF_ISP_HIST_V_SIZE		(CIF_ISP_HIST_BASE + 0x00000010)
+#define CIF_ISP_HIST_BIN_0		(CIF_ISP_HIST_BASE + 0x00000014)
+#define CIF_ISP_HIST_BIN_1		(CIF_ISP_HIST_BASE + 0x00000018)
+#define CIF_ISP_HIST_BIN_2		(CIF_ISP_HIST_BASE + 0x0000001C)
+#define CIF_ISP_HIST_BIN_3		(CIF_ISP_HIST_BASE + 0x00000020)
+#define CIF_ISP_HIST_BIN_4		(CIF_ISP_HIST_BASE + 0x00000024)
+#define CIF_ISP_HIST_BIN_5		(CIF_ISP_HIST_BASE + 0x00000028)
+#define CIF_ISP_HIST_BIN_6		(CIF_ISP_HIST_BASE + 0x0000002C)
+#define CIF_ISP_HIST_BIN_7		(CIF_ISP_HIST_BASE + 0x00000030)
+#define CIF_ISP_HIST_BIN_8		(CIF_ISP_HIST_BASE + 0x00000034)
+#define CIF_ISP_HIST_BIN_9		(CIF_ISP_HIST_BASE + 0x00000038)
+#define CIF_ISP_HIST_BIN_10		(CIF_ISP_HIST_BASE + 0x0000003C)
+#define CIF_ISP_HIST_BIN_11		(CIF_ISP_HIST_BASE + 0x00000040)
+#define CIF_ISP_HIST_BIN_12		(CIF_ISP_HIST_BASE + 0x00000044)
+#define CIF_ISP_HIST_BIN_13		(CIF_ISP_HIST_BASE + 0x00000048)
+#define CIF_ISP_HIST_BIN_14		(CIF_ISP_HIST_BASE + 0x0000004C)
+#define CIF_ISP_HIST_BIN_15		(CIF_ISP_HIST_BASE + 0x00000050)
+#define CIF_ISP_HIST_WEIGHT_00TO30	(CIF_ISP_HIST_BASE + 0x00000054)
+#define CIF_ISP_HIST_WEIGHT_40TO21	(CIF_ISP_HIST_BASE + 0x00000058)
+#define CIF_ISP_HIST_WEIGHT_31TO12	(CIF_ISP_HIST_BASE + 0x0000005C)
+#define CIF_ISP_HIST_WEIGHT_22TO03	(CIF_ISP_HIST_BASE + 0x00000060)
+#define CIF_ISP_HIST_WEIGHT_13TO43	(CIF_ISP_HIST_BASE + 0x00000064)
+#define CIF_ISP_HIST_WEIGHT_04TO34	(CIF_ISP_HIST_BASE + 0x00000068)
+#define CIF_ISP_HIST_WEIGHT_44		(CIF_ISP_HIST_BASE + 0x0000006C)
+
+#define CIF_ISP_FILT_BASE		0x00002500
+#define CIF_ISP_FILT_MODE		(CIF_ISP_FILT_BASE + 0x00000000)
+#define CIF_ISP_FILT_THRESH_BL0		(CIF_ISP_FILT_BASE + 0x00000028)
+#define CIF_ISP_FILT_THRESH_BL1		(CIF_ISP_FILT_BASE + 0x0000002c)
+#define CIF_ISP_FILT_THRESH_SH0		(CIF_ISP_FILT_BASE + 0x00000030)
+#define CIF_ISP_FILT_THRESH_SH1		(CIF_ISP_FILT_BASE + 0x00000034)
+#define CIF_ISP_FILT_LUM_WEIGHT		(CIF_ISP_FILT_BASE + 0x00000038)
+#define CIF_ISP_FILT_FAC_SH1		(CIF_ISP_FILT_BASE + 0x0000003c)
+#define CIF_ISP_FILT_FAC_SH0		(CIF_ISP_FILT_BASE + 0x00000040)
+#define CIF_ISP_FILT_FAC_MID		(CIF_ISP_FILT_BASE + 0x00000044)
+#define CIF_ISP_FILT_FAC_BL0		(CIF_ISP_FILT_BASE + 0x00000048)
+#define CIF_ISP_FILT_FAC_BL1		(CIF_ISP_FILT_BASE + 0x0000004C)
+
+#define CIF_ISP_CAC_BASE		0x00002580
+#define CIF_ISP_CAC_CTRL		(CIF_ISP_CAC_BASE + 0x00000000)
+#define CIF_ISP_CAC_COUNT_START		(CIF_ISP_CAC_BASE + 0x00000004)
+#define CIF_ISP_CAC_A			(CIF_ISP_CAC_BASE + 0x00000008)
+#define CIF_ISP_CAC_B			(CIF_ISP_CAC_BASE + 0x0000000C)
+#define CIF_ISP_CAC_C			(CIF_ISP_CAC_BASE + 0x00000010)
+#define CIF_ISP_X_NORM			(CIF_ISP_CAC_BASE + 0x00000014)
+#define CIF_ISP_Y_NORM			(CIF_ISP_CAC_BASE + 0x00000018)
+
+#define CIF_ISP_EXP_BASE		0x00002600
+#define CIF_ISP_EXP_CTRL		(CIF_ISP_EXP_BASE + 0x00000000)
+#define CIF_ISP_EXP_H_OFFSET		(CIF_ISP_EXP_BASE + 0x00000004)
+#define CIF_ISP_EXP_V_OFFSET		(CIF_ISP_EXP_BASE + 0x00000008)
+#define CIF_ISP_EXP_H_SIZE		(CIF_ISP_EXP_BASE + 0x0000000C)
+#define CIF_ISP_EXP_V_SIZE		(CIF_ISP_EXP_BASE + 0x00000010)
+#define CIF_ISP_EXP_MEAN_00		(CIF_ISP_EXP_BASE + 0x00000014)
+#define CIF_ISP_EXP_MEAN_10		(CIF_ISP_EXP_BASE + 0x00000018)
+#define CIF_ISP_EXP_MEAN_20		(CIF_ISP_EXP_BASE + 0x0000001c)
+#define CIF_ISP_EXP_MEAN_30		(CIF_ISP_EXP_BASE + 0x00000020)
+#define CIF_ISP_EXP_MEAN_40		(CIF_ISP_EXP_BASE + 0x00000024)
+#define CIF_ISP_EXP_MEAN_01		(CIF_ISP_EXP_BASE + 0x00000028)
+#define CIF_ISP_EXP_MEAN_11		(CIF_ISP_EXP_BASE + 0x0000002c)
+#define CIF_ISP_EXP_MEAN_21		(CIF_ISP_EXP_BASE + 0x00000030)
+#define CIF_ISP_EXP_MEAN_31		(CIF_ISP_EXP_BASE + 0x00000034)
+#define CIF_ISP_EXP_MEAN_41		(CIF_ISP_EXP_BASE + 0x00000038)
+#define CIF_ISP_EXP_MEAN_02		(CIF_ISP_EXP_BASE + 0x0000003c)
+#define CIF_ISP_EXP_MEAN_12		(CIF_ISP_EXP_BASE + 0x00000040)
+#define CIF_ISP_EXP_MEAN_22		(CIF_ISP_EXP_BASE + 0x00000044)
+#define CIF_ISP_EXP_MEAN_32		(CIF_ISP_EXP_BASE + 0x00000048)
+#define CIF_ISP_EXP_MEAN_42		(CIF_ISP_EXP_BASE + 0x0000004c)
+#define CIF_ISP_EXP_MEAN_03		(CIF_ISP_EXP_BASE + 0x00000050)
+#define CIF_ISP_EXP_MEAN_13		(CIF_ISP_EXP_BASE + 0x00000054)
+#define CIF_ISP_EXP_MEAN_23		(CIF_ISP_EXP_BASE + 0x00000058)
+#define CIF_ISP_EXP_MEAN_33		(CIF_ISP_EXP_BASE + 0x0000005c)
+#define CIF_ISP_EXP_MEAN_43		(CIF_ISP_EXP_BASE + 0x00000060)
+#define CIF_ISP_EXP_MEAN_04		(CIF_ISP_EXP_BASE + 0x00000064)
+#define CIF_ISP_EXP_MEAN_14		(CIF_ISP_EXP_BASE + 0x00000068)
+#define CIF_ISP_EXP_MEAN_24		(CIF_ISP_EXP_BASE + 0x0000006c)
+#define CIF_ISP_EXP_MEAN_34		(CIF_ISP_EXP_BASE + 0x00000070)
+#define CIF_ISP_EXP_MEAN_44		(CIF_ISP_EXP_BASE + 0x00000074)
+
+#define CIF_ISP_BLS_BASE		0x00002700
+#define CIF_ISP_BLS_CTRL		(CIF_ISP_BLS_BASE + 0x00000000)
+#define CIF_ISP_BLS_SAMPLES		(CIF_ISP_BLS_BASE + 0x00000004)
+#define CIF_ISP_BLS_H1_START		(CIF_ISP_BLS_BASE + 0x00000008)
+#define CIF_ISP_BLS_H1_STOP		(CIF_ISP_BLS_BASE + 0x0000000c)
+#define CIF_ISP_BLS_V1_START		(CIF_ISP_BLS_BASE + 0x00000010)
+#define CIF_ISP_BLS_V1_STOP		(CIF_ISP_BLS_BASE + 0x00000014)
+#define CIF_ISP_BLS_H2_START		(CIF_ISP_BLS_BASE + 0x00000018)
+#define CIF_ISP_BLS_H2_STOP		(CIF_ISP_BLS_BASE + 0x0000001c)
+#define CIF_ISP_BLS_V2_START		(CIF_ISP_BLS_BASE + 0x00000020)
+#define CIF_ISP_BLS_V2_STOP		(CIF_ISP_BLS_BASE + 0x00000024)
+#define CIF_ISP_BLS_A_FIXED		(CIF_ISP_BLS_BASE + 0x00000028)
+#define CIF_ISP_BLS_B_FIXED		(CIF_ISP_BLS_BASE + 0x0000002c)
+#define CIF_ISP_BLS_C_FIXED		(CIF_ISP_BLS_BASE + 0x00000030)
+#define CIF_ISP_BLS_D_FIXED		(CIF_ISP_BLS_BASE + 0x00000034)
+#define CIF_ISP_BLS_A_MEASURED		(CIF_ISP_BLS_BASE + 0x00000038)
+#define CIF_ISP_BLS_B_MEASURED		(CIF_ISP_BLS_BASE + 0x0000003c)
+#define CIF_ISP_BLS_C_MEASURED		(CIF_ISP_BLS_BASE + 0x00000040)
+#define CIF_ISP_BLS_D_MEASURED		(CIF_ISP_BLS_BASE + 0x00000044)
+
+#define CIF_ISP_DPF_BASE		0x00002800
+#define CIF_ISP_DPF_MODE		(CIF_ISP_DPF_BASE + 0x00000000)
+#define CIF_ISP_DPF_STRENGTH_R		(CIF_ISP_DPF_BASE + 0x00000004)
+#define CIF_ISP_DPF_STRENGTH_G		(CIF_ISP_DPF_BASE + 0x00000008)
+#define CIF_ISP_DPF_STRENGTH_B		(CIF_ISP_DPF_BASE + 0x0000000C)
+#define CIF_ISP_DPF_S_WEIGHT_G_1_4	(CIF_ISP_DPF_BASE + 0x00000010)
+#define CIF_ISP_DPF_S_WEIGHT_G_5_6	(CIF_ISP_DPF_BASE + 0x00000014)
+#define CIF_ISP_DPF_S_WEIGHT_RB_1_4	(CIF_ISP_DPF_BASE + 0x00000018)
+#define CIF_ISP_DPF_S_WEIGHT_RB_5_6	(CIF_ISP_DPF_BASE + 0x0000001C)
+#define CIF_ISP_DPF_NULL_COEFF_0	(CIF_ISP_DPF_BASE + 0x00000020)
+#define CIF_ISP_DPF_NULL_COEFF_1	(CIF_ISP_DPF_BASE + 0x00000024)
+#define CIF_ISP_DPF_NULL_COEFF_2	(CIF_ISP_DPF_BASE + 0x00000028)
+#define CIF_ISP_DPF_NULL_COEFF_3	(CIF_ISP_DPF_BASE + 0x0000002C)
+#define CIF_ISP_DPF_NULL_COEFF_4	(CIF_ISP_DPF_BASE + 0x00000030)
+#define CIF_ISP_DPF_NULL_COEFF_5	(CIF_ISP_DPF_BASE + 0x00000034)
+#define CIF_ISP_DPF_NULL_COEFF_6	(CIF_ISP_DPF_BASE + 0x00000038)
+#define CIF_ISP_DPF_NULL_COEFF_7	(CIF_ISP_DPF_BASE + 0x0000003C)
+#define CIF_ISP_DPF_NULL_COEFF_8	(CIF_ISP_DPF_BASE + 0x00000040)
+#define CIF_ISP_DPF_NULL_COEFF_9	(CIF_ISP_DPF_BASE + 0x00000044)
+#define CIF_ISP_DPF_NULL_COEFF_10	(CIF_ISP_DPF_BASE + 0x00000048)
+#define CIF_ISP_DPF_NULL_COEFF_11	(CIF_ISP_DPF_BASE + 0x0000004C)
+#define CIF_ISP_DPF_NULL_COEFF_12	(CIF_ISP_DPF_BASE + 0x00000050)
+#define CIF_ISP_DPF_NULL_COEFF_13	(CIF_ISP_DPF_BASE + 0x00000054)
+#define CIF_ISP_DPF_NULL_COEFF_14	(CIF_ISP_DPF_BASE + 0x00000058)
+#define CIF_ISP_DPF_NULL_COEFF_15	(CIF_ISP_DPF_BASE + 0x0000005C)
+#define CIF_ISP_DPF_NULL_COEFF_16	(CIF_ISP_DPF_BASE + 0x00000060)
+#define CIF_ISP_DPF_NF_GAIN_R		(CIF_ISP_DPF_BASE + 0x00000064)
+#define CIF_ISP_DPF_NF_GAIN_GR		(CIF_ISP_DPF_BASE + 0x00000068)
+#define CIF_ISP_DPF_NF_GAIN_GB		(CIF_ISP_DPF_BASE + 0x0000006C)
+#define CIF_ISP_DPF_NF_GAIN_B		(CIF_ISP_DPF_BASE + 0x00000070)
+
+#define CIF_ISP_DPCC_BASE		0x00002900
+#define CIF_ISP_DPCC_MODE		(CIF_ISP_DPCC_BASE + 0x00000000)
+#define CIF_ISP_DPCC_OUTPUT_MODE	(CIF_ISP_DPCC_BASE + 0x00000004)
+#define CIF_ISP_DPCC_SET_USE		(CIF_ISP_DPCC_BASE + 0x00000008)
+#define CIF_ISP_DPCC_METHODS_SET_1	(CIF_ISP_DPCC_BASE + 0x0000000C)
+#define CIF_ISP_DPCC_METHODS_SET_2	(CIF_ISP_DPCC_BASE + 0x00000010)
+#define CIF_ISP_DPCC_METHODS_SET_3	(CIF_ISP_DPCC_BASE + 0x00000014)
+#define CIF_ISP_DPCC_LINE_THRESH_1	(CIF_ISP_DPCC_BASE + 0x00000018)
+#define CIF_ISP_DPCC_LINE_MAD_FAC_1	(CIF_ISP_DPCC_BASE + 0x0000001C)
+#define CIF_ISP_DPCC_PG_FAC_1		(CIF_ISP_DPCC_BASE + 0x00000020)
+#define CIF_ISP_DPCC_RND_THRESH_1	(CIF_ISP_DPCC_BASE + 0x00000024)
+#define CIF_ISP_DPCC_RG_FAC_1		(CIF_ISP_DPCC_BASE + 0x00000028)
+#define CIF_ISP_DPCC_LINE_THRESH_2	(CIF_ISP_DPCC_BASE + 0x0000002C)
+#define CIF_ISP_DPCC_LINE_MAD_FAC_2	(CIF_ISP_DPCC_BASE + 0x00000030)
+#define CIF_ISP_DPCC_PG_FAC_2		(CIF_ISP_DPCC_BASE + 0x00000034)
+#define CIF_ISP_DPCC_RND_THRESH_2	(CIF_ISP_DPCC_BASE + 0x00000038)
+#define CIF_ISP_DPCC_RG_FAC_2		(CIF_ISP_DPCC_BASE + 0x0000003C)
+#define CIF_ISP_DPCC_LINE_THRESH_3	(CIF_ISP_DPCC_BASE + 0x00000040)
+#define CIF_ISP_DPCC_LINE_MAD_FAC_3	(CIF_ISP_DPCC_BASE + 0x00000044)
+#define CIF_ISP_DPCC_PG_FAC_3		(CIF_ISP_DPCC_BASE + 0x00000048)
+#define CIF_ISP_DPCC_RND_THRESH_3	(CIF_ISP_DPCC_BASE + 0x0000004C)
+#define CIF_ISP_DPCC_RG_FAC_3		(CIF_ISP_DPCC_BASE + 0x00000050)
+#define CIF_ISP_DPCC_RO_LIMITS		(CIF_ISP_DPCC_BASE + 0x00000054)
+#define CIF_ISP_DPCC_RND_OFFS		(CIF_ISP_DPCC_BASE + 0x00000058)
+#define CIF_ISP_DPCC_BPT_CTRL		(CIF_ISP_DPCC_BASE + 0x0000005C)
+#define CIF_ISP_DPCC_BPT_NUMBER		(CIF_ISP_DPCC_BASE + 0x00000060)
+#define CIF_ISP_DPCC_BPT_ADDR		(CIF_ISP_DPCC_BASE + 0x00000064)
+#define CIF_ISP_DPCC_BPT_DATA		(CIF_ISP_DPCC_BASE + 0x00000068)
+
+#define CIF_ISP_WDR_BASE		0x00002A00
+#define CIF_ISP_WDR_CTRL		(CIF_ISP_WDR_BASE + 0x00000000)
+#define CIF_ISP_WDR_TONECURVE_1		(CIF_ISP_WDR_BASE + 0x00000004)
+#define CIF_ISP_WDR_TONECURVE_2		(CIF_ISP_WDR_BASE + 0x00000008)
+#define CIF_ISP_WDR_TONECURVE_3		(CIF_ISP_WDR_BASE + 0x0000000C)
+#define CIF_ISP_WDR_TONECURVE_4		(CIF_ISP_WDR_BASE + 0x00000010)
+#define CIF_ISP_WDR_TONECURVE_YM_0	(CIF_ISP_WDR_BASE + 0x00000014)
+#define CIF_ISP_WDR_TONECURVE_YM_1	(CIF_ISP_WDR_BASE + 0x00000018)
+#define CIF_ISP_WDR_TONECURVE_YM_2	(CIF_ISP_WDR_BASE + 0x0000001C)
+#define CIF_ISP_WDR_TONECURVE_YM_3	(CIF_ISP_WDR_BASE + 0x00000020)
+#define CIF_ISP_WDR_TONECURVE_YM_4	(CIF_ISP_WDR_BASE + 0x00000024)
+#define CIF_ISP_WDR_TONECURVE_YM_5	(CIF_ISP_WDR_BASE + 0x00000028)
+#define CIF_ISP_WDR_TONECURVE_YM_6	(CIF_ISP_WDR_BASE + 0x0000002C)
+#define CIF_ISP_WDR_TONECURVE_YM_7	(CIF_ISP_WDR_BASE + 0x00000030)
+#define CIF_ISP_WDR_TONECURVE_YM_8	(CIF_ISP_WDR_BASE + 0x00000034)
+#define CIF_ISP_WDR_TONECURVE_YM_9	(CIF_ISP_WDR_BASE + 0x00000038)
+#define CIF_ISP_WDR_TONECURVE_YM_10	(CIF_ISP_WDR_BASE + 0x0000003C)
+#define CIF_ISP_WDR_TONECURVE_YM_11	(CIF_ISP_WDR_BASE + 0x00000040)
+#define CIF_ISP_WDR_TONECURVE_YM_12	(CIF_ISP_WDR_BASE + 0x00000044)
+#define CIF_ISP_WDR_TONECURVE_YM_13	(CIF_ISP_WDR_BASE + 0x00000048)
+#define CIF_ISP_WDR_TONECURVE_YM_14	(CIF_ISP_WDR_BASE + 0x0000004C)
+#define CIF_ISP_WDR_TONECURVE_YM_15	(CIF_ISP_WDR_BASE + 0x00000050)
+#define CIF_ISP_WDR_TONECURVE_YM_16	(CIF_ISP_WDR_BASE + 0x00000054)
+#define CIF_ISP_WDR_TONECURVE_YM_17	(CIF_ISP_WDR_BASE + 0x00000058)
+#define CIF_ISP_WDR_TONECURVE_YM_18	(CIF_ISP_WDR_BASE + 0x0000005C)
+#define CIF_ISP_WDR_TONECURVE_YM_19	(CIF_ISP_WDR_BASE + 0x00000060)
+#define CIF_ISP_WDR_TONECURVE_YM_20	(CIF_ISP_WDR_BASE + 0x00000064)
+#define CIF_ISP_WDR_TONECURVE_YM_21	(CIF_ISP_WDR_BASE + 0x00000068)
+#define CIF_ISP_WDR_TONECURVE_YM_22	(CIF_ISP_WDR_BASE + 0x0000006C)
+#define CIF_ISP_WDR_TONECURVE_YM_23	(CIF_ISP_WDR_BASE + 0x00000070)
+#define CIF_ISP_WDR_TONECURVE_YM_24	(CIF_ISP_WDR_BASE + 0x00000074)
+#define CIF_ISP_WDR_TONECURVE_YM_25	(CIF_ISP_WDR_BASE + 0x00000078)
+#define CIF_ISP_WDR_TONECURVE_YM_26	(CIF_ISP_WDR_BASE + 0x0000007C)
+#define CIF_ISP_WDR_TONECURVE_YM_27	(CIF_ISP_WDR_BASE + 0x00000080)
+#define CIF_ISP_WDR_TONECURVE_YM_28	(CIF_ISP_WDR_BASE + 0x00000084)
+#define CIF_ISP_WDR_TONECURVE_YM_29	(CIF_ISP_WDR_BASE + 0x00000088)
+#define CIF_ISP_WDR_TONECURVE_YM_30	(CIF_ISP_WDR_BASE + 0x0000008C)
+#define CIF_ISP_WDR_TONECURVE_YM_31	(CIF_ISP_WDR_BASE + 0x00000090)
+#define CIF_ISP_WDR_TONECURVE_YM_32	(CIF_ISP_WDR_BASE + 0x00000094)
+#define CIF_ISP_WDR_OFFSET		(CIF_ISP_WDR_BASE + 0x00000098)
+#define CIF_ISP_WDR_DELTAMIN		(CIF_ISP_WDR_BASE + 0x0000009C)
+#define CIF_ISP_WDR_TONECURVE_1_SHD	(CIF_ISP_WDR_BASE + 0x000000A0)
+#define CIF_ISP_WDR_TONECURVE_2_SHD	(CIF_ISP_WDR_BASE + 0x000000A4)
+#define CIF_ISP_WDR_TONECURVE_3_SHD	(CIF_ISP_WDR_BASE + 0x000000A8)
+#define CIF_ISP_WDR_TONECURVE_4_SHD	(CIF_ISP_WDR_BASE + 0x000000AC)
+#define CIF_ISP_WDR_TONECURVE_YM_0_SHD	(CIF_ISP_WDR_BASE + 0x000000B0)
+#define CIF_ISP_WDR_TONECURVE_YM_1_SHD	(CIF_ISP_WDR_BASE + 0x000000B4)
+#define CIF_ISP_WDR_TONECURVE_YM_2_SHD	(CIF_ISP_WDR_BASE + 0x000000B8)
+#define CIF_ISP_WDR_TONECURVE_YM_3_SHD	(CIF_ISP_WDR_BASE + 0x000000BC)
+#define CIF_ISP_WDR_TONECURVE_YM_4_SHD	(CIF_ISP_WDR_BASE + 0x000000C0)
+#define CIF_ISP_WDR_TONECURVE_YM_5_SHD	(CIF_ISP_WDR_BASE + 0x000000C4)
+#define CIF_ISP_WDR_TONECURVE_YM_6_SHD	(CIF_ISP_WDR_BASE + 0x000000C8)
+#define CIF_ISP_WDR_TONECURVE_YM_7_SHD	(CIF_ISP_WDR_BASE + 0x000000CC)
+#define CIF_ISP_WDR_TONECURVE_YM_8_SHD	(CIF_ISP_WDR_BASE + 0x000000D0)
+#define CIF_ISP_WDR_TONECURVE_YM_9_SHD	(CIF_ISP_WDR_BASE + 0x000000D4)
+#define CIF_ISP_WDR_TONECURVE_YM_10_SHD	(CIF_ISP_WDR_BASE + 0x000000D8)
+#define CIF_ISP_WDR_TONECURVE_YM_11_SHD	(CIF_ISP_WDR_BASE + 0x000000DC)
+#define CIF_ISP_WDR_TONECURVE_YM_12_SHD	(CIF_ISP_WDR_BASE + 0x000000E0)
+#define CIF_ISP_WDR_TONECURVE_YM_13_SHD	(CIF_ISP_WDR_BASE + 0x000000E4)
+#define CIF_ISP_WDR_TONECURVE_YM_14_SHD	(CIF_ISP_WDR_BASE + 0x000000E8)
+#define CIF_ISP_WDR_TONECURVE_YM_15_SHD	(CIF_ISP_WDR_BASE + 0x000000EC)
+#define CIF_ISP_WDR_TONECURVE_YM_16_SHD	(CIF_ISP_WDR_BASE + 0x000000F0)
+#define CIF_ISP_WDR_TONECURVE_YM_17_SHD	(CIF_ISP_WDR_BASE + 0x000000F4)
+#define CIF_ISP_WDR_TONECURVE_YM_18_SHD	(CIF_ISP_WDR_BASE + 0x000000F8)
+#define CIF_ISP_WDR_TONECURVE_YM_19_SHD	(CIF_ISP_WDR_BASE + 0x000000FC)
+#define CIF_ISP_WDR_TONECURVE_YM_20_SHD	(CIF_ISP_WDR_BASE + 0x00000100)
+#define CIF_ISP_WDR_TONECURVE_YM_21_SHD	(CIF_ISP_WDR_BASE + 0x00000104)
+#define CIF_ISP_WDR_TONECURVE_YM_22_SHD	(CIF_ISP_WDR_BASE + 0x00000108)
+#define CIF_ISP_WDR_TONECURVE_YM_23_SHD	(CIF_ISP_WDR_BASE + 0x0000010C)
+#define CIF_ISP_WDR_TONECURVE_YM_24_SHD	(CIF_ISP_WDR_BASE + 0x00000110)
+#define CIF_ISP_WDR_TONECURVE_YM_25_SHD	(CIF_ISP_WDR_BASE + 0x00000114)
+#define CIF_ISP_WDR_TONECURVE_YM_26_SHD	(CIF_ISP_WDR_BASE + 0x00000118)
+#define CIF_ISP_WDR_TONECURVE_YM_27_SHD	(CIF_ISP_WDR_BASE + 0x0000011C)
+#define CIF_ISP_WDR_TONECURVE_YM_28_SHD	(CIF_ISP_WDR_BASE + 0x00000120)
+#define CIF_ISP_WDR_TONECURVE_YM_29_SHD	(CIF_ISP_WDR_BASE + 0x00000124)
+#define CIF_ISP_WDR_TONECURVE_YM_30_SHD	(CIF_ISP_WDR_BASE + 0x00000128)
+#define CIF_ISP_WDR_TONECURVE_YM_31_SHD	(CIF_ISP_WDR_BASE + 0x0000012C)
+#define CIF_ISP_WDR_TONECURVE_YM_32_SHD	(CIF_ISP_WDR_BASE + 0x00000130)
+
+#define CIF_ISP_VSM_BASE		0x00002F00
+#define CIF_ISP_VSM_MODE		(CIF_ISP_VSM_BASE + 0x00000000)
+#define CIF_ISP_VSM_H_OFFS		(CIF_ISP_VSM_BASE + 0x00000004)
+#define CIF_ISP_VSM_V_OFFS		(CIF_ISP_VSM_BASE + 0x00000008)
+#define CIF_ISP_VSM_H_SIZE		(CIF_ISP_VSM_BASE + 0x0000000C)
+#define CIF_ISP_VSM_V_SIZE		(CIF_ISP_VSM_BASE + 0x00000010)
+#define CIF_ISP_VSM_H_SEGMENTS		(CIF_ISP_VSM_BASE + 0x00000014)
+#define CIF_ISP_VSM_V_SEGMENTS		(CIF_ISP_VSM_BASE + 0x00000018)
+#define CIF_ISP_VSM_DELTA_H		(CIF_ISP_VSM_BASE + 0x0000001C)
+#define CIF_ISP_VSM_DELTA_V		(CIF_ISP_VSM_BASE + 0x00000020)
+
+void disable_dcrop(struct rkisp1_stream *stream, bool async);
+void config_dcrop(struct rkisp1_stream *stream, struct v4l2_rect *rect,
+		  bool async);
+
+void dump_rsz_regs(struct device *dev, struct rkisp1_stream *stream);
+void disable_rsz(struct rkisp1_stream *stream, bool async);
+void config_rsz(struct rkisp1_stream *stream, struct v4l2_rect *in_y,
+		struct v4l2_rect *in_c, struct v4l2_rect *out_y,
+		struct v4l2_rect *out_c, bool async);
+
+void config_mi_ctrl(struct rkisp1_stream *stream);
+
+void mp_clr_frame_end_int(void __iomem *base);
+void sp_clr_frame_end_int(void __iomem *base);
+
+bool mp_is_frame_end_int_masked(void __iomem *base);
+bool sp_is_frame_end_int_masked(void __iomem *base);
+bool mp_is_stream_stopped(void __iomem *base);
+bool sp_is_stream_stopped(void __iomem *base);
+
+static inline void mi_set_y_size(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.y_size_init);
+}
+
+static inline void mi_set_cb_size(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cb_size_init);
+}
+
+static inline void mi_set_cr_size(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cr_size_init);
+}
+
+static inline void mi_set_y_addr(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.y_base_ad_init);
+}
+
+static inline void mi_set_cb_addr(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cb_base_ad_init);
+}
+
+static inline void mi_set_cr_addr(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cr_base_ad_init);
+}
+
+static inline void mi_set_y_offset(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.y_offs_cnt_init);
+}
+
+static inline void mi_set_cb_offset(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cb_offs_cnt_init);
+}
+
+static inline void mi_set_cr_offset(struct rkisp1_stream *stream, int val)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+
+	writel(val, base + stream->config->mi.cr_offs_cnt_init);
+}
+
+static inline void mi_frame_end_int_enable(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *addr = base + CIF_MI_IMSC;
+
+	writel(CIF_MI_FRAME(stream) | readl(addr), addr);
+}
+
+static inline void mi_frame_end_int_disable(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *addr = base + CIF_MI_IMSC;
+
+	writel(~CIF_MI_FRAME(stream) & readl(addr), addr);
+}
+
+static inline void mi_frame_end_int_clear(struct rkisp1_stream *stream)
+{
+	void __iomem *base = stream->ispdev->base_addr;
+	void __iomem *addr = base + CIF_MI_ICR;
+
+	writel(CIF_MI_FRAME(stream), addr);
+}
+
+static inline void mp_set_chain_mode(void __iomem *base)
+{
+	u32 dpcl = readl(base + CIF_VI_DPCL);
+
+	dpcl |= CIF_VI_DPCL_CHAN_MODE_MP;
+	writel(dpcl, base + CIF_VI_DPCL);
+}
+
+static inline void sp_set_chain_mode(void __iomem *base)
+{
+	u32 dpcl = readl(base + CIF_VI_DPCL);
+
+	dpcl |= CIF_VI_DPCL_CHAN_MODE_SP;
+	writel(dpcl, base + CIF_VI_DPCL);
+}
+
+static inline void mp_set_data_path(void __iomem *base)
+{
+	u32 dpcl = readl(base + CIF_VI_DPCL);
+
+	dpcl = dpcl | CIF_VI_DPCL_CHAN_MODE_MP | CIF_VI_DPCL_MP_MUX_MRSZ_MI;
+	writel(dpcl, base + CIF_VI_DPCL);
+}
+
+static inline void sp_set_data_path(void __iomem *base)
+{
+	u32 dpcl = readl(base + CIF_VI_DPCL);
+
+	dpcl |= CIF_VI_DPCL_CHAN_MODE_SP;
+	writel(dpcl, base + CIF_VI_DPCL);
+}
+
+static inline void mp_set_uv_swap(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_XTD_FORMAT_CTRL;
+	u32 reg = readl(addr) & ~BIT(0);
+
+	writel(reg | CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP, addr);
+}
+
+static inline void sp_set_uv_swap(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_XTD_FORMAT_CTRL;
+	u32 reg = readl(addr) & ~BIT(1);
+
+	writel(reg | CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP, addr);
+}
+
+static inline void sp_set_y_width(void __iomem *base, u32 val)
+{
+	writel(val, base + CIF_MI_SP_Y_PIC_WIDTH);
+}
+
+static inline void sp_set_y_height(void __iomem *base, u32 val)
+{
+	writel(val, base + CIF_MI_SP_Y_PIC_HEIGHT);
+}
+
+static inline void sp_set_y_line_length(void __iomem *base, u32 val)
+{
+	writel(val, base + CIF_MI_SP_Y_LLENGTH);
+}
+
+static inline void mp_mi_ctrl_set_format(void __iomem *base, u32 val)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+	u32 reg = readl(addr) & ~MI_CTRL_MP_FMT_MASK;
+
+	writel(reg | val, addr);
+}
+
+static inline void sp_mi_ctrl_set_format(void __iomem *base, u32 val)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+	u32 reg = readl(addr) & ~MI_CTRL_SP_FMT_MASK;
+
+	writel(reg | val, addr);
+}
+
+static inline void mi_ctrl_mpyuv_enable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(CIF_MI_CTRL_MP_ENABLE | readl(addr), addr);
+}
+
+static inline void mi_ctrl_mpyuv_disable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(~CIF_MI_CTRL_MP_ENABLE & readl(addr), addr);
+}
+
+static inline void mi_ctrl_mp_disable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(~(CIF_MI_CTRL_MP_ENABLE | CIF_MI_CTRL_RAW_ENABLE) & readl(addr),
+	       addr);
+}
+
+static inline void mi_ctrl_spyuv_enable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(CIF_MI_CTRL_SP_ENABLE | readl(addr), addr);
+}
+
+static inline void mi_ctrl_spyuv_disable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(~CIF_MI_CTRL_SP_ENABLE & readl(addr), addr);
+}
+
+static inline void mi_ctrl_sp_disable(void __iomem *base)
+{
+	mi_ctrl_spyuv_disable(base);
+}
+
+static inline void mi_ctrl_mpraw_enable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(CIF_MI_CTRL_RAW_ENABLE | readl(addr), addr);
+}
+
+static inline void mi_ctrl_mpraw_disable(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(~CIF_MI_CTRL_RAW_ENABLE & readl(addr), addr);
+}
+
+static inline void mp_mi_ctrl_autoupdate_en(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(readl(addr) | CIF_MI_MP_AUTOUPDATE_ENABLE, addr);
+}
+
+static inline void sp_mi_ctrl_autoupdate_en(void __iomem *base)
+{
+	void __iomem *addr = base + CIF_MI_CTRL;
+
+	writel(readl(addr) | CIF_MI_SP_AUTOUPDATE_ENABLE, addr);
+}
+
+static inline void force_cfg_update(void __iomem *base)
+{
+	writel(CIF_MI_INIT_SOFT_UPD, base + CIF_MI_INIT);
+}
+
+#endif /* _RKISP1_REGS_H */
-- 
2.22.0

