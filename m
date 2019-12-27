Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4077012BADF
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 21:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfL0UCM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 15:02:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46618 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfL0UCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 15:02:09 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 34722292887
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Yichong Zhong <zyc@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: [PATCH v12 03/11] media: staging: rkisp1: add streaming paths
Date:   Fri, 27 Dec 2019 17:01:08 -0300
Message-Id: <20191227200116.2612137-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227200116.2612137-1-helen.koike@collabora.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2 capture device interface to rkisp1 driver, allowing users to
get frames from ISP1.
ISP1 has two major streaming paths, mainpah and selfpah, with different
capabilities.
Each one has an independent crop and resizer, thus add a capture video
device and a resizer subdevice for each of the paths.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v12:
- Several cleanups, renaming, removal of unecessary code, re-writting
for redability, code re-structuring to increase maintainability
- debugfs
- resizer and crop was moved out from the capture to its own media
subdevice implemented in rkisp1-resizer.c
- Commit re-organization to not break bisectability

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

 drivers/staging/media/rkisp1/Makefile         |    6 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c | 1437 +++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-common.h  |   72 +
 drivers/staging/media/rkisp1/rkisp1-dev.c     |   81 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  775 +++++++++
 5 files changed, 2364 insertions(+), 7 deletions(-)
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-capture.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-resizer.c

diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/staging/media/rkisp1/Makefile
index 2faa73fc2b7f..1725b990d669 100644
--- a/drivers/staging/media/rkisp1/Makefile
+++ b/drivers/staging/media/rkisp1/Makefile
@@ -1,4 +1,6 @@
 obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
-rockchip-isp1-objs += 	rkisp1-common.o \
+rockchip-isp1-objs += 	rkisp1-capture.o \
+			rkisp1-common.o \
 			rkisp1-dev.o \
-			rkisp1-isp.o
+			rkisp1-isp.o \
+			rkisp1-resizer.o
diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
new file mode 100644
index 000000000000..524e0dd38c1b
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -0,0 +1,1437 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - V4l capture device
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
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
+#include "rkisp1-common.h"
+
+/*
+ * NOTE: There are two capture video devices in rkisp1, selfpath and mainpath.
+ *
+ * differences between selfpath and mainpath
+ * available mp sink input: isp
+ * available sp sink input : isp, dma(TODO)
+ * available mp sink pad fmts: yuv422, raw
+ * available sp sink pad fmts: yuv422, yuv420......
+ * available mp source fmts: yuv, raw, jpeg(TODO)
+ * available sp source fmts: yuv, rgb
+ */
+
+#define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
+#define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
+
+#define RKISP1_MIN_BUFFERS_NEEDED 3
+
+enum rkisp1_plane {
+	RKISP1_PLANE_Y	= 0,
+	RKISP1_PLANE_CB	= 1,
+	RKISP1_PLANE_CR	= 2
+};
+
+/*
+ * @fourcc: pixel format
+ * @fmt_type: helper filed for pixel format
+ * @uv_swap: if cb cr swaped, for yuv
+ * @write_format: defines how YCbCr self picture data is written to memory
+ * @output_format: defines sp output format
+ */
+struct rkisp1_capture_fmt_cfg {
+	u32 fourcc;
+	u8 fmt_type;
+	u8 uv_swap;
+	u32 write_format;
+	u32 output_format;
+};
+
+struct rkisp1_capture_ops {
+	void (*config)(struct rkisp1_capture *cap);
+	void (*stop)(struct rkisp1_capture *cap);
+	void (*enable)(struct rkisp1_capture *cap);
+	void (*disable)(struct rkisp1_capture *cap);
+	void (*set_data_path)(struct rkisp1_capture *cap);
+	bool (*is_stopped)(struct rkisp1_capture *cap);
+};
+
+struct rkisp1_capture_config {
+	const struct rkisp1_capture_fmt_cfg *fmts;
+	int fmt_size;
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
+static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
+	/* yuv422 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.fmt_type = RKISP1_FMT_YUV,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv420 */
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv444 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUV444M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+	},
+	/* raw */
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.fmt_type = RKISP1_FMT_BAYER,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+	},
+};
+
+static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
+	/* yuv422 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV422P,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU422M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+	},
+	/* yuv420 */
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YUV420,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	}, {
+		.fourcc = V4L2_PIX_FMT_YVU420,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 1,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+	},
+	/* yuv444 */
+	{
+		.fourcc = V4L2_PIX_FMT_YUV444M,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV444,
+	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.fmt_type = RKISP1_FMT_YUV,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
+	},
+	/* rgb */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.fmt_type = RKISP1_FMT_RGB,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
+	}, {
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.fmt_type = RKISP1_FMT_RGB,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
+	}, {
+		.fourcc = V4L2_PIX_FMT_BGR666,
+		.fmt_type = RKISP1_FMT_RGB,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
+	},
+};
+
+static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
+	.fmts = rkisp1_mp_fmts,
+	.fmt_size = ARRAY_SIZE(rkisp1_mp_fmts),
+	.mi = {
+		.y_size_init =		RKISP1_CIF_MI_MP_Y_SIZE_INIT,
+		.cb_size_init =		RKISP1_CIF_MI_MP_CB_SIZE_INIT,
+		.cr_size_init =		RKISP1_CIF_MI_MP_CR_SIZE_INIT,
+		.y_base_ad_init =	RKISP1_CIF_MI_MP_Y_BASE_AD_INIT,
+		.cb_base_ad_init =	RKISP1_CIF_MI_MP_CB_BASE_AD_INIT,
+		.cr_base_ad_init =	RKISP1_CIF_MI_MP_CR_BASE_AD_INIT,
+		.y_offs_cnt_init =	RKISP1_CIF_MI_MP_Y_OFFS_CNT_INIT,
+		.cb_offs_cnt_init =	RKISP1_CIF_MI_MP_CB_OFFS_CNT_INIT,
+		.cr_offs_cnt_init =	RKISP1_CIF_MI_MP_CR_OFFS_CNT_INIT,
+	},
+};
+
+static const struct rkisp1_capture_config rkisp1_capture_config_sp = {
+	.fmts = rkisp1_sp_fmts,
+	.fmt_size = ARRAY_SIZE(rkisp1_sp_fmts),
+	.mi = {
+		.y_size_init =		RKISP1_CIF_MI_SP_Y_SIZE_INIT,
+		.cb_size_init =		RKISP1_CIF_MI_SP_CB_SIZE_INIT,
+		.cr_size_init =		RKISP1_CIF_MI_SP_CR_SIZE_INIT,
+		.y_base_ad_init =	RKISP1_CIF_MI_SP_Y_BASE_AD_INIT,
+		.cb_base_ad_init =	RKISP1_CIF_MI_SP_CB_BASE_AD_INIT,
+		.cr_base_ad_init =	RKISP1_CIF_MI_SP_CR_BASE_AD_INIT,
+		.y_offs_cnt_init =	RKISP1_CIF_MI_SP_Y_OFFS_CNT_INIT,
+		.cb_offs_cnt_init =	RKISP1_CIF_MI_SP_CB_OFFS_CNT_INIT,
+		.cr_offs_cnt_init =	RKISP1_CIF_MI_SP_CR_OFFS_CNT_INIT,
+	},
+};
+
+static inline struct rkisp1_vdev_node *
+rkisp1_vdev_to_node(struct video_device *vdev)
+{
+	return container_of(vdev, struct rkisp1_vdev_node, vdev);
+}
+
+/* ----------------------------------------------------------------------------
+ * Stream operations for self-picture path (sp) and main-picture path (mp)
+ */
+
+static void rkisp1_mi_config_ctrl(struct rkisp1_capture *cap)
+{
+	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
+
+	mi_ctrl &= ~GENMASK(17, 16);
+	mi_ctrl |= RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_64;
+
+	mi_ctrl &= ~GENMASK(19, 18);
+	mi_ctrl |= RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_64;
+
+	mi_ctrl |= RKISP1_CIF_MI_CTRL_INIT_BASE_EN |
+		   RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN;
+
+	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static u32 rkisp1_pixfmt_comp_size(const struct v4l2_pix_format_mplane *pixm,
+				   unsigned int component)
+{
+	/*
+	 * If packed format, then plane_fmt[0].sizeimage is the sum of all
+	 * components, so we need to calculate just the size of Y component.
+	 * See rkisp1_fill_pixfmt().
+	 */
+	if (!component && pixm->num_planes == 1)
+		return pixm->plane_fmt[0].bytesperline * pixm->height;
+	return pixm->plane_fmt[component].sizeimage;
+}
+
+static void rkisp1_irq_frame_end_enable(struct rkisp1_capture *cap)
+{
+	u32 mi_imsc = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_IMSC);
+
+	mi_imsc |= RKISP1_CIF_MI_FRAME(cap);
+	rkisp1_write(cap->rkisp1, mi_imsc, RKISP1_CIF_MI_IMSC);
+}
+
+static void rkisp1_mp_config(struct rkisp1_capture *cap)
+{
+	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	struct rkisp1_device *rkisp1 = cap->rkisp1;
+	u32 reg;
+
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
+		     cap->config->mi.y_size_init);
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB),
+		     cap->config->mi.cb_size_init);
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR),
+		     cap->config->mi.cr_size_init);
+
+	rkisp1_irq_frame_end_enable(cap);
+	if (cap->pix.cfg->uv_swap) {
+		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+
+		reg = (reg & ~BIT(0)) |
+		      RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
+		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+	}
+
+	rkisp1_mi_config_ctrl(cap);
+
+	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
+	reg &= ~RKISP1_MI_CTRL_MP_FMT_MASK;
+	reg |= cap->pix.cfg->write_format;
+	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_CTRL);
+
+	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
+	reg |= RKISP1_CIF_MI_MP_AUTOUPDATE_ENABLE;
+	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_sp_config(struct rkisp1_capture *cap)
+{
+	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	struct rkisp1_device *rkisp1 = cap->rkisp1;
+	u32 mi_ctrl;
+
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
+		     cap->config->mi.y_size_init);
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB),
+		     cap->config->mi.cb_size_init);
+	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR),
+		     cap->config->mi.cr_size_init);
+
+	rkisp1_write(rkisp1, pixm->width, RKISP1_CIF_MI_SP_Y_PIC_WIDTH);
+	rkisp1_write(rkisp1, pixm->height, RKISP1_CIF_MI_SP_Y_PIC_HEIGHT);
+	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
+
+	rkisp1_irq_frame_end_enable(cap);
+	if (cap->pix.cfg->uv_swap) {
+		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+
+		rkisp1_write(rkisp1, reg & ~BIT(1),
+			     RKISP1_CIF_MI_XTD_FORMAT_CTRL);
+	}
+
+	rkisp1_mi_config_ctrl(cap);
+
+	mi_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_MI_CTRL);
+	mi_ctrl &= ~RKISP1_MI_CTRL_SP_FMT_MASK;
+	mi_ctrl |= cap->pix.cfg->write_format |
+		   RKISP1_MI_CTRL_SP_INPUT_YUV422 |
+		   cap->pix.cfg->output_format |
+		   RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE;
+	rkisp1_write(rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_mp_disable(struct rkisp1_capture *cap)
+{
+	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
+
+	mi_ctrl &= ~(RKISP1_CIF_MI_CTRL_MP_ENABLE |
+		     RKISP1_CIF_MI_CTRL_RAW_ENABLE);
+	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_sp_disable(struct rkisp1_capture *cap)
+{
+	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
+
+	mi_ctrl &= ~RKISP1_CIF_MI_CTRL_SP_ENABLE;
+	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_mp_enable(struct rkisp1_capture *cap)
+{
+	const struct rkisp1_capture_fmt_cfg *isp_fmt = cap->pix.cfg;
+	u32 mi_ctrl;
+
+	rkisp1_mp_disable(cap);
+
+	mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
+	if (isp_fmt->fmt_type == RKISP1_FMT_BAYER)
+		mi_ctrl |= RKISP1_CIF_MI_CTRL_RAW_ENABLE;
+	/* YUV */
+	else
+		mi_ctrl |= RKISP1_CIF_MI_CTRL_MP_ENABLE;
+
+	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_sp_enable(struct rkisp1_capture *cap)
+{
+	u32 mi_ctrl = rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL);
+
+	mi_ctrl |= RKISP1_CIF_MI_CTRL_SP_ENABLE;
+	rkisp1_write(cap->rkisp1, mi_ctrl, RKISP1_CIF_MI_CTRL);
+}
+
+static void rkisp1_mp_sp_stop(struct rkisp1_capture *cap)
+{
+	if (!cap->is_streaming)
+		return;
+	rkisp1_write(cap->rkisp1,
+		     RKISP1_CIF_MI_FRAME(cap), RKISP1_CIF_MI_ICR);
+	cap->ops->disable(cap);
+}
+
+static bool rkisp1_mp_is_stopped(struct rkisp1_capture *cap)
+{
+	u32 en = RKISP1_CIF_MI_CTRL_SHD_MP_IN_ENABLED |
+		 RKISP1_CIF_MI_CTRL_SHD_RAW_OUT_ENABLED;
+
+	return !(rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL_SHD) & en);
+}
+
+static bool rkisp1_sp_is_stopped(struct rkisp1_capture *cap)
+{
+	return !(rkisp1_read(cap->rkisp1, RKISP1_CIF_MI_CTRL_SHD) &
+		 RKISP1_CIF_MI_CTRL_SHD_SP_IN_ENABLED);
+}
+
+static void rkisp1_mp_set_data_path(struct rkisp1_capture *cap)
+{
+	u32 dpcl = rkisp1_read(cap->rkisp1, RKISP1_CIF_VI_DPCL);
+
+	dpcl = dpcl | RKISP1_CIF_VI_DPCL_CHAN_MODE_MP |
+	       RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI;
+	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+}
+
+static void rkisp1_sp_set_data_path(struct rkisp1_capture *cap)
+{
+	u32 dpcl = rkisp1_read(cap->rkisp1, RKISP1_CIF_VI_DPCL);
+
+	dpcl |= RKISP1_CIF_VI_DPCL_CHAN_MODE_SP;
+	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+}
+
+static struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
+	.config = rkisp1_mp_config,
+	.enable = rkisp1_mp_enable,
+	.disable = rkisp1_mp_disable,
+	.stop = rkisp1_mp_sp_stop,
+	.set_data_path = rkisp1_mp_set_data_path,
+	.is_stopped = rkisp1_mp_is_stopped,
+};
+
+static struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
+	.config = rkisp1_sp_config,
+	.enable = rkisp1_sp_enable,
+	.disable = rkisp1_sp_disable,
+	.stop = rkisp1_mp_sp_stop,
+	.set_data_path = rkisp1_sp_set_data_path,
+	.is_stopped = rkisp1_sp_is_stopped,
+};
+
+/* ----------------------------------------------------------------------------
+ * Frame buffer operations
+ */
+
+static int rkisp1_dummy_buf_create(struct rkisp1_capture *cap)
+{
+	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	struct rkisp1_dummy_buffer *dummy_buf = &cap->buf.dummy;
+
+	dummy_buf->size = max3(rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
+			       rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB),
+			       rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR));
+
+	/* The driver never access vaddr, no mapping is required */
+	dummy_buf->vaddr = dma_alloc_attrs(cap->rkisp1->dev,
+					   dummy_buf->size,
+					   &dummy_buf->dma_addr,
+					   GFP_KERNEL,
+					   DMA_ATTR_NO_KERNEL_MAPPING);
+	if (!dummy_buf->vaddr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void rkisp1_dummy_buf_destroy(struct rkisp1_capture *cap)
+{
+	dma_free_attrs(cap->rkisp1->dev,
+		       cap->buf.dummy.size, cap->buf.dummy.vaddr,
+		       cap->buf.dummy.dma_addr, DMA_ATTR_NO_KERNEL_MAPPING);
+}
+
+static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
+{
+	/*
+	 * Use the dummy space allocated by dma_alloc_coherent to
+	 * throw data if there is no available buffer.
+	 */
+	if (cap->buf.next) {
+		u32 *buff_addr = cap->buf.next->buff_addr;
+
+		rkisp1_write(cap->rkisp1,
+			     buff_addr[RKISP1_PLANE_Y],
+			     cap->config->mi.y_base_ad_init);
+		rkisp1_write(cap->rkisp1,
+			     buff_addr[RKISP1_PLANE_CB],
+			     cap->config->mi.cb_base_ad_init);
+		rkisp1_write(cap->rkisp1,
+			     buff_addr[RKISP1_PLANE_CR],
+			     cap->config->mi.cr_base_ad_init);
+	} else {
+		rkisp1_write(cap->rkisp1,
+			     cap->buf.dummy.dma_addr,
+			     cap->config->mi.y_base_ad_init);
+		rkisp1_write(cap->rkisp1,
+			     cap->buf.dummy.dma_addr,
+			     cap->config->mi.cb_base_ad_init);
+		rkisp1_write(cap->rkisp1,
+			     cap->buf.dummy.dma_addr,
+			     cap->config->mi.cr_base_ad_init);
+	}
+
+	/* Set plane offsets */
+	rkisp1_write(cap->rkisp1, 0, cap->config->mi.y_offs_cnt_init);
+	rkisp1_write(cap->rkisp1, 0, cap->config->mi.cb_offs_cnt_init);
+	rkisp1_write(cap->rkisp1, 0, cap->config->mi.cr_offs_cnt_init);
+}
+
+/*
+ * This function is called when a frame end comes. The next frame
+ * is processing and we should set up buffer for next-next frame,
+ * otherwise it will overflow.
+ */
+static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
+{
+	struct rkisp1_isp *isp = &cap->rkisp1->isp;
+	struct rkisp1_buffer *curr_buf = cap->buf.curr;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cap->buf.lock, flags);
+
+	if (curr_buf) {
+		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
+		curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
+		curr_buf->vb.field = V4L2_FIELD_NONE;
+		vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	} else {
+		cap->rkisp1->debug.frame_drop[cap->id]++;
+	}
+
+	cap->buf.curr = cap->buf.next;
+	cap->buf.next = NULL;
+
+	if (!list_empty(&cap->buf.queue)) {
+		cap->buf.next = list_first_entry(&cap->buf.queue,
+						 struct rkisp1_buffer,
+						 queue);
+		list_del(&cap->buf.next->queue);
+	}
+	spin_unlock_irqrestore(&cap->buf.lock, flags);
+
+	rkisp1_set_next_buf(cap);
+}
+
+void rkisp1_capture_isr(struct rkisp1_device *rkisp1)
+{
+	unsigned int i;
+	u32 status;
+
+	status = rkisp1_read(rkisp1, RKISP1_CIF_MI_MIS);
+	rkisp1_write(rkisp1, status, RKISP1_CIF_MI_ICR);
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
+		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
+			continue;
+		if (!cap->is_stopping) {
+			rkisp1_handle_buffer(cap);
+			continue;
+		}
+		/*
+		 * Make sure stream is actually stopped, whose state
+		 * can be read from the shadow register, before
+		 * wake_up() thread which would immediately free all
+		 * frame buffers. stop() takes effect at the next
+		 * frame end that sync the configurations to shadow
+		 * regs.
+		 */
+		if (!cap->ops->is_stopped(cap)) {
+			cap->ops->stop(cap);
+			continue;
+		}
+		cap->is_stopping = false;
+		cap->is_streaming = false;
+		wake_up(&cap->done);
+	}
+}
+
+/* ----------------------------------------------------------------------------
+ * Vb2 operations
+ */
+
+static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
+				  unsigned int *num_buffers,
+				  unsigned int *num_planes,
+				  unsigned int sizes[],
+				  struct device *alloc_devs[])
+{
+	struct rkisp1_capture *cap = queue->drv_priv;
+	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	unsigned int i;
+
+	if (*num_planes) {
+		if (*num_planes != pixm->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < pixm->num_planes; i++)
+			if (sizes[i] < pixm->plane_fmt[i].sizeimage)
+				return -EINVAL;
+	} else {
+		*num_planes = pixm->num_planes;
+		for (i = 0; i < pixm->num_planes; i++)
+			sizes[i] = pixm->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_buffer *ispbuf =
+		container_of(vbuf, struct rkisp1_buffer, vb);
+	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
+	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
+	unsigned long flags;
+	unsigned int i;
+
+	memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
+	for (i = 0; i < pixm->num_planes; i++)
+		ispbuf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	/* Convert to non-MPLANE */
+	if (pixm->num_planes == 1) {
+		ispbuf->buff_addr[RKISP1_PLANE_CB] =
+			ispbuf->buff_addr[RKISP1_PLANE_Y] +
+			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y);
+		ispbuf->buff_addr[RKISP1_PLANE_CR] =
+			ispbuf->buff_addr[RKISP1_PLANE_CB] +
+			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB);
+	}
+
+	spin_lock_irqsave(&cap->buf.lock, flags);
+
+	/*
+	 * If there's no next buffer assigned, queue this buffer directly
+	 * as the next buffer, and update the memory interface.
+	 */
+	if (cap->is_streaming && !cap->buf.next &&
+	    atomic_read(&cap->rkisp1->isp.frame_sequence) == -1) {
+		cap->buf.next = ispbuf;
+		rkisp1_set_next_buf(cap);
+	} else {
+		list_add_tail(&ispbuf->queue, &cap->buf.queue);
+	}
+	spin_unlock_irqrestore(&cap->buf.lock, flags);
+}
+
+static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct rkisp1_capture *cap = vb->vb2_queue->drv_priv;
+	unsigned int i;
+
+	for (i = 0; i < cap->pix.fmt.num_planes; i++) {
+		unsigned long size = cap->pix.fmt.plane_fmt[i].sizeimage;
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_err(cap->rkisp1->dev,
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
+static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
+				      enum vb2_buffer_state state)
+{
+	unsigned long flags;
+	struct rkisp1_buffer *buf;
+
+	spin_lock_irqsave(&cap->buf.lock, flags);
+	if (cap->buf.curr) {
+		vb2_buffer_done(&cap->buf.curr->vb.vb2_buf, state);
+		cap->buf.curr = NULL;
+	}
+	if (cap->buf.next) {
+		vb2_buffer_done(&cap->buf.next->vb.vb2_buf, state);
+		cap->buf.next = NULL;
+	}
+	while (!list_empty(&cap->buf.queue)) {
+		buf = list_first_entry(&cap->buf.queue,
+				       struct rkisp1_buffer, queue);
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+	spin_unlock_irqrestore(&cap->buf.lock, flags);
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
+		if (ret)
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
+
+	return v4l2_subdev_call(sd, video, s_stream, false);
+}
+
+static int rkisp1_pipeline_enable_cb(struct media_entity *from,
+				     struct media_entity *curr)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
+
+	return v4l2_subdev_call(sd, video, s_stream, true);
+}
+
+static void rkisp1_stream_stop(struct rkisp1_capture *cap)
+{
+	int ret;
+
+	/* Stream should stop in interrupt. If it dosn't, stop it by force. */
+	cap->is_stopping = true;
+	ret = wait_event_timeout(cap->done,
+				 !cap->is_streaming,
+				 msecs_to_jiffies(1000));
+	if (!ret) {
+		cap->rkisp1->debug.stop_timeout[cap->id]++;
+		cap->ops->stop(cap);
+		cap->is_stopping = false;
+		cap->is_streaming = false;
+	}
+}
+
+static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
+{
+	struct rkisp1_capture *cap = queue->drv_priv;
+	struct rkisp1_vdev_node *node = &cap->vnode;
+	struct rkisp1_device *rkisp1 = cap->rkisp1;
+	int ret;
+
+	rkisp1_stream_stop(cap);
+	media_pipeline_stop(&node->vdev.entity);
+	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
+					rkisp1_pipeline_disable_cb);
+	if (ret)
+		dev_err(rkisp1->dev,
+			"pipeline stream-off failed error:%d\n", ret);
+
+	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
+
+	ret = v4l2_pipeline_pm_use(&node->vdev.entity, 0);
+	if (ret)
+		dev_err(rkisp1->dev, "pipeline close failed error:%d\n", ret);
+
+	ret = pm_runtime_put(rkisp1->dev);
+	if (ret)
+		dev_err(rkisp1->dev, "power down failed error:%d\n", ret);
+
+	rkisp1_dummy_buf_destroy(cap);
+}
+
+/*
+ * Most of registers inside rockchip ISP1 have shadow register since
+ * they must be not be changed during processing a frame.
+ * Usually, each sub-module updates its shadow register after
+ * processing the last pixel of a frame.
+ */
+static void rkisp1_stream_start(struct rkisp1_capture *cap)
+{
+	struct rkisp1_device *rkisp1 = cap->rkisp1;
+	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
+
+	cap->ops->set_data_path(cap);
+	cap->ops->config(cap);
+
+	/* Setup a buffer for the next frame */
+	rkisp1_handle_buffer(cap);
+	cap->ops->enable(cap);
+	/* It's safe to config ACTIVE and SHADOW regs for the
+	 * first stream. While when the second is starting, do NOT
+	 * force update because it also update the first one.
+	 *
+	 * The latter case would drop one more buf(that is 2) since
+	 * there's not buf in shadow when the second FE received. This's
+	 * also required because the second FE maybe corrupt especially
+	 * when run at 120fps.
+	 */
+	if (!other->is_streaming) {
+		/* force cfg update */
+		rkisp1_write(rkisp1,
+			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
+		rkisp1_handle_buffer(cap);
+	}
+	cap->is_streaming = true;
+}
+
+static int
+rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
+{
+	struct rkisp1_capture *cap = queue->drv_priv;
+	struct media_entity *entity = &cap->vnode.vdev.entity;
+	int ret;
+
+	ret = rkisp1_dummy_buf_create(cap);
+	if (ret)
+		goto err_ret_buffers;
+
+	ret = pm_runtime_get_sync(cap->rkisp1->dev);
+	if (ret) {
+		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
+		goto err_destroy_dummy;
+	}
+	ret = v4l2_pipeline_pm_use(entity, 1);
+	if (ret) {
+		dev_err(cap->rkisp1->dev, "open cif pipeline failed %d\n", ret);
+		goto err_pipe_pm_put;
+	}
+
+	rkisp1_stream_start(cap);
+
+	/* start sub-devices */
+	ret = rkisp1_pipeline_sink_walk(entity, NULL,
+					rkisp1_pipeline_enable_cb);
+	if (ret)
+		goto err_stop_stream;
+
+	ret = media_pipeline_start(entity, &cap->rkisp1->pipe);
+	if (ret) {
+		dev_err(cap->rkisp1->dev, "start pipeline failed %d\n", ret);
+		goto err_pipe_disable;
+	}
+
+	return 0;
+
+err_pipe_disable:
+	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
+err_stop_stream:
+	rkisp1_stream_stop(cap);
+	v4l2_pipeline_pm_use(entity, 0);
+err_pipe_pm_put:
+	pm_runtime_put(cap->rkisp1->dev);
+err_destroy_dummy:
+	rkisp1_dummy_buf_destroy(cap);
+err_ret_buffers:
+	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static struct vb2_ops rkisp1_vb2_ops = {
+	.queue_setup = rkisp1_vb2_queue_setup,
+	.buf_queue = rkisp1_vb2_buf_queue,
+	.buf_prepare = rkisp1_vb2_buf_prepare,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = rkisp1_vb2_stop_streaming,
+	.start_streaming = rkisp1_vb2_start_streaming,
+};
+
+/* ----------------------------------------------------------------------------
+ * IOCTLs operations
+ */
+
+static const struct v4l2_format_info *
+rkisp1_fill_pixfmt(struct v4l2_pix_format_mplane *pixm,
+		   enum rkisp1_stream_id id)
+{
+	struct v4l2_plane_pix_format *plane_y = &pixm->plane_fmt[0];
+	const struct v4l2_format_info *info;
+	unsigned int i;
+	u32 stride;
+
+	info = v4l2_format_info(pixm->pixelformat);
+	pixm->num_planes = info->mem_planes;
+	stride = info->bpp[0] * pixm->width;
+	/* Self path supports custom stride but Main path doesn't */
+	if (id == RKISP1_MAINPATH || plane_y->bytesperline < stride)
+		plane_y->bytesperline = stride;
+	plane_y->sizeimage = plane_y->bytesperline * pixm->height;
+
+	/* normalize stride to pixels per line */
+	stride = DIV_ROUND_UP(plane_y->bytesperline, info->bpp[0]);
+
+	for (i = 1; i < info->comp_planes; i++) {
+		struct v4l2_plane_pix_format *plane = &pixm->plane_fmt[i];
+
+		/* bytesperline for other components derive from Y component */
+		plane->bytesperline = DIV_ROUND_UP(stride, info->hdiv) *
+				      info->bpp[i];
+		plane->sizeimage = plane->bytesperline *
+				   DIV_ROUND_UP(pixm->height, info->vdiv);
+	}
+
+	/*
+	 * If pixfmt is packed, then plane_fmt[0] should contain the total size
+	 * considering all components. plane_fmt[i] for i > 0 should be ignored
+	 * by userspace as mem_planes == 1, but we are keeping information there
+	 * for convenience.
+	 */
+	if (info->mem_planes == 1)
+		for (i = 1; i < info->comp_planes; i++)
+			plane_y->sizeimage += pixm->plane_fmt[i].sizeimage;
+
+	return info;
+}
+
+static const struct rkisp1_capture_fmt_cfg *
+rkisp1_find_fmt_cfg(const struct rkisp1_capture *cap, const u32 pixelfmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < cap->config->fmt_size; i++) {
+		if (cap->config->fmts[i].fourcc == pixelfmt)
+			return &cap->config->fmts[i];
+	}
+	return NULL;
+}
+
+static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
+			   struct v4l2_pix_format_mplane *pixm,
+			   const struct rkisp1_capture_fmt_cfg **fmt_cfg,
+			   const struct v4l2_format_info **fmt_info)
+{
+	const struct rkisp1_capture_config *config = cap->config;
+	struct rkisp1_capture *other_cap =
+			&cap->rkisp1->capture_devs[cap->id ^ 1];
+	const struct rkisp1_capture_fmt_cfg *fmt;
+	const struct v4l2_format_info *info;
+	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
+					    RKISP1_RSZ_SP_SRC_MAX_WIDTH };
+	const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
+					     RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
+
+	fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
+	if (!fmt) {
+		fmt = config->fmts;
+		pixm->pixelformat = fmt->fourcc;
+	}
+
+	pixm->width = clamp_t(u32, pixm->width,
+			      RKISP1_RSZ_SRC_MIN_WIDTH, max_widths[cap->id]);
+	pixm->height = clamp_t(u32, pixm->height,
+			       RKISP1_RSZ_SRC_MIN_HEIGHT, max_heights[cap->id]);
+
+	pixm->field = V4L2_FIELD_NONE;
+	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+
+	info = rkisp1_fill_pixfmt(pixm, cap->id);
+
+	/* can not change quantization when stream-on */
+	if (other_cap->is_streaming)
+		pixm->quantization = other_cap->pix.fmt.quantization;
+	/* output full range by default, take effect in params */
+	else if (!pixm->quantization ||
+		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
+		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	if (fmt_cfg)
+		*fmt_cfg = fmt;
+	if (fmt_info)
+		*fmt_info = info;
+}
+
+static void rkisp1_set_fmt(struct rkisp1_capture *cap,
+			   struct v4l2_pix_format_mplane *pixm)
+{
+	rkisp1_try_fmt(cap, pixm, &cap->pix.cfg, &cap->pix.info);
+	cap->pix.fmt = *pixm;
+
+	/* SP supports custom stride in number of pixels of the Y plane */
+	if (cap->id == RKISP1_SELFPATH)
+		cap->sp_y_stride = pixm->plane_fmt[0].bytesperline /
+				   cap->pix.info->bpp[0];
+}
+
+static int rkisp1_try_fmt_vid_cap_mplane(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	struct rkisp1_capture *cap = video_drvdata(file);
+
+	rkisp1_try_fmt(cap, &f->fmt.pix_mp, NULL, NULL);
+
+	return 0;
+}
+
+static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+					  struct v4l2_fmtdesc *f)
+{
+	struct rkisp1_capture *cap = video_drvdata(file);
+	const struct rkisp1_capture_fmt_cfg *fmt = NULL;
+
+	if (f->index >= cap->config->fmt_size)
+		return -EINVAL;
+
+	fmt = &cap->config->fmts[f->index];
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
+				       void *priv, struct v4l2_format *f)
+{
+	struct rkisp1_capture *cap = video_drvdata(file);
+	struct rkisp1_vdev_node *node =
+				rkisp1_vdev_to_node(&cap->vnode.vdev);
+
+	if (vb2_is_busy(&node->buf_queue))
+		return -EBUSY;
+
+	rkisp1_set_fmt(cap, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int rkisp1_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+				       struct v4l2_format *f)
+{
+	struct rkisp1_capture *cap = video_drvdata(file);
+
+	f->fmt.pix_mp = cap->pix.fmt;
+
+	return 0;
+}
+
+static int
+rkisp1_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	struct rkisp1_capture *cap_dev = video_drvdata(file);
+	struct rkisp1_device *rkisp1 = cap_dev->rkisp1;
+
+	strscpy(cap->driver, rkisp1->dev->driver->name, sizeof(cap->driver));
+	strscpy(cap->card, rkisp1->dev->driver->name, sizeof(cap->card));
+	strscpy(cap->bus_info, RKISP1_BUS_INFO, sizeof(cap->bus_info));
+
+	return 0;
+}
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
+	.vidioc_querycap = rkisp1_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int rkisp1_capture_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *sd =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct rkisp1_capture *cap = video_get_drvdata(vdev);
+	struct rkisp1_isp *isp = &cap->rkisp1->isp;
+	struct v4l2_subdev_format sd_fmt;
+	int ret;
+
+	if (cap->id == RKISP1_SELFPATH &&
+	    isp->src_fmt->mbus_code != MEDIA_BUS_FMT_YUYV8_2X8) {
+		dev_err(cap->rkisp1->dev,
+			"selfpath only supports MEDIA_BUS_FMT_YUYV8_2X8\n");
+		return -EPIPE;
+	}
+
+	if (cap->pix.cfg->fmt_type != isp->src_fmt->fmt_type) {
+		dev_err(cap->rkisp1->dev,
+			"format type mismatch in link '%s:%d->%s:%d'\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index);
+		return -EPIPE;
+	}
+
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = link->source->index;
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
+		return ret;
+
+	if (sd_fmt.format.height != cap->pix.fmt.height ||
+	    sd_fmt.format.width != cap->pix.fmt.width)
+		return -EPIPE;
+
+	return 0;
+}
+
+/* ----------------------------------------------------------------------------
+ * core functions
+ */
+
+static const struct media_entity_operations rkisp1_media_ops = {
+	.link_validate = rkisp1_capture_link_validate,
+};
+
+static const struct v4l2_file_operations rkisp1_fops = {
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
+{
+	media_entity_cleanup(&cap->vnode.vdev.entity);
+	video_unregister_device(&cap->vnode.vdev);
+}
+
+void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_capture *mp = &rkisp1->capture_devs[RKISP1_MAINPATH];
+	struct rkisp1_capture *sp = &rkisp1->capture_devs[RKISP1_SELFPATH];
+
+	rkisp1_unregister_capture(mp);
+	rkisp1_unregister_capture(sp);
+}
+
+static int rkisp1_register_capture(struct rkisp1_capture *cap)
+{
+	const char * const dev_names[] = {RKISP1_MP_DEV_NAME,
+					  RKISP1_SP_DEV_NAME};
+	struct v4l2_device *v4l2_dev = &cap->rkisp1->v4l2_dev;
+	struct video_device *vdev = &cap->vnode.vdev;
+	struct rkisp1_vdev_node *node;
+	struct vb2_queue *q;
+	int ret;
+
+	strscpy(vdev->name, dev_names[cap->id], sizeof(vdev->name));
+	node = rkisp1_vdev_to_node(vdev);
+	mutex_init(&node->vlock);
+
+	vdev->ioctl_ops = &rkisp1_v4l2_ioctl_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &rkisp1_fops;
+	vdev->minor = -1;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->lock = &node->vlock;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			    V4L2_CAP_STREAMING;
+	vdev->entity.ops = &rkisp1_media_ops;
+	video_set_drvdata(vdev, cap);
+	vdev->vfl_dir = VFL_DIR_RX;
+	node->pad.flags = MEDIA_PAD_FL_SINK;
+
+	q = &node->buf_queue;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	q->drv_priv = cap;
+	q->ops = &rkisp1_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct rkisp1_buffer);
+	q->min_buffers_needed = RKISP1_MIN_BUFFERS_NEEDED;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &node->vlock;
+	q->dev = cap->rkisp1->dev;
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(cap->rkisp1->dev,
+			"vb2 queue init failed (err=%d)\n", ret);
+		return ret;
+	}
+
+	vdev->queue = q;
+
+	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	if (ret) {
+		dev_err(cap->rkisp1->dev,
+			"failed to register %s, ret=%d\n", vdev->name, ret);
+		return ret;
+	}
+	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
+		  vdev->num);
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
+	if (ret) {
+		video_unregister_device(vdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void
+rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
+{
+	struct rkisp1_capture *cap = &rkisp1->capture_devs[id];
+	struct v4l2_pix_format_mplane pixm;
+
+	memset(cap, 0, sizeof(*cap));
+	cap->id = id;
+	cap->rkisp1 = rkisp1;
+
+	INIT_LIST_HEAD(&cap->buf.queue);
+	init_waitqueue_head(&cap->done);
+	spin_lock_init(&cap->buf.lock);
+	if (cap->id == RKISP1_SELFPATH) {
+		cap->ops = &rkisp1_capture_ops_sp;
+		cap->config = &rkisp1_capture_config_sp;
+	} else {
+		cap->ops = &rkisp1_capture_ops_mp;
+		cap->config = &rkisp1_capture_config_mp;
+	}
+
+	cap->is_streaming = false;
+
+	memset(&pixm, 0, sizeof(pixm));
+	pixm.pixelformat = V4L2_PIX_FMT_YUYV;
+	pixm.width = RKISP1_DEFAULT_WIDTH;
+	pixm.height = RKISP1_DEFAULT_HEIGHT;
+	rkisp1_set_fmt(cap, &pixm);
+}
+
+int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_capture *cap;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
+		rkisp1_capture_init(rkisp1, i);
+		cap = &rkisp1->capture_devs[i];
+		cap->rkisp1 = rkisp1;
+		ret = rkisp1_register_capture(cap);
+		if (ret)
+			goto err_unreg_capture_devs;
+	}
+
+	return 0;
+
+err_unreg_capture_devs:
+	for (j = 0; j < i; j++) {
+		cap = &rkisp1->capture_devs[j];
+		rkisp1_unregister_capture(cap);
+	}
+
+	return ret;
+}
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 111f49224402..9815aaf67424 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -41,6 +41,16 @@
 
 #define RKISP1_MAX_BUS_CLK	8
 
+enum rkisp1_rsz_pad {
+	RKISP1_RSZ_PAD_SINK,
+	RKISP1_RSZ_PAD_SRC,
+};
+
+enum rkisp1_stream_id {
+	RKISP1_MAINPATH,
+	RKISP1_SELFPATH,
+};
+
 enum rkisp1_fmt_pix_type {
 	RKISP1_FMT_YUV,
 	RKISP1_FMT_RGB,
@@ -124,11 +134,63 @@ struct rkisp1_dummy_buffer {
 
 struct rkisp1_device;
 
+/*
+ * struct rkisp1_capture - ISP capture video device
+ *
+ * @pix.fmt: buffer format
+ * @pix.info: pixel information
+ * @pix.cfg: pixel configuration
+ *
+ * @buf.lock: lock to protect buf_queue
+ * @buf.queue: queued buffer list
+ * @buf.dummy: dummy space to store dropped data
+ *
+ * rkisp1 use shadowsock registers, so it need two buffer at a time
+ * @buf.curr: the buffer used for current frame
+ * @buf.next: the buffer used for next frame
+ */
+struct rkisp1_capture {
+	struct rkisp1_vdev_node vnode;
+	struct rkisp1_device *rkisp1;
+	enum rkisp1_stream_id id;
+	struct rkisp1_capture_ops *ops;
+	const struct rkisp1_capture_config *config;
+	bool is_streaming;
+	bool is_stopping;
+	wait_queue_head_t done;
+	unsigned int sp_y_stride;
+	struct {
+		/* protects queue, curr and next */
+		spinlock_t lock;
+		struct list_head queue;
+		struct rkisp1_dummy_buffer dummy;
+		struct rkisp1_buffer *curr;
+		struct rkisp1_buffer *next;
+	} buf;
+	struct {
+		const struct rkisp1_capture_fmt_cfg *cfg;
+		const struct v4l2_format_info *info;
+		struct v4l2_pix_format_mplane fmt;
+	} pix;
+};
+
+struct rkisp1_resizer {
+	struct v4l2_subdev sd;
+	enum rkisp1_stream_id id;
+	struct rkisp1_device *rkisp1;
+	struct media_pad pads[RKISP1_ISP_PAD_MAX];
+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
+	const struct rkisp1_rsz_config *config;
+	enum rkisp1_fmt_pix_type fmt_type;
+};
+
 struct rkisp1_debug {
 	struct dentry *debugfs_dir;
 	unsigned long data_loss;
 	unsigned long pic_size_error;
 	unsigned long mipi_error;
+	unsigned long stop_timeout[2];
+	unsigned long frame_drop[2];
 };
 
 /*
@@ -136,6 +198,7 @@ struct rkisp1_debug {
  * @base_addr: base register address
  * @active_sensor: sensor in-use, set when streaming on
  * @isp: ISP sub-device
+ * @rkisp1_capture: capture video device
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -149,6 +212,8 @@ struct rkisp1_device {
 	struct v4l2_async_notifier notifier;
 	struct rkisp1_sensor_async *active_sensor;
 	struct rkisp1_isp isp;
+	struct rkisp1_resizer resizer_devs[2];
+	struct rkisp1_capture capture_devs[2];
 	struct media_pipeline pipe;
 	struct vb2_alloc_ctx *alloc_ctx;
 	struct rkisp1_debug debug;
@@ -196,5 +261,12 @@ const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
 
 void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
 void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
+void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
+
+int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
+void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
+
+int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1);
+void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1);
 
 #endif /* _RKISP1_COMMON_H */
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index fa8f8b673f9f..3644563badd0 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -37,6 +37,8 @@
  *
  * ISP Block Diagram
  * -----------------
+ *                                                             rkisp1-resizer.c          rkisp1-capture.c
+ *                                                          |====================|  |=======================|
  *                                rkisp1-isp.c                              Main Picture Path
  *                        |==========================|      |===============================================|
  *                        +-----------+  +--+--+--+--+      +--------+  +--------+              +-----------+
@@ -72,8 +74,23 @@
  *    +----------+      |------+------|
  *                      |     ISP     |
  *                      |------+------|
- *                      |  2   |  3   |
- *                      +------+------+
+ *        +-------------|  2   |  3   |
+ *        |             +------+------+
+ *        |                |
+ *        v                v
+ *  +- ---------+    +-----------+
+ *  |     0     |    |     0     |
+ *  -------------    -------------
+ *  |  Resizer  |    |  Resizer  |
+ *  ------------|    ------------|
+ *  |     1     |    |     1     |
+ *  +-----------+    +-----------+
+ *        |                |
+ *        v                v
+ *  +-----------+    +-----------+
+ *  | selfpath  |    | mainpath  |
+ *  | (capture) |    | (capture) |
+ *  +-----------+    +-----------+
  */
 
 struct rkisp1_match_data {
@@ -87,14 +104,18 @@ struct rkisp1_match_data {
 
 static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 {
+	struct media_entity *source, *sink;
 	unsigned int flags, source_pad;
 	struct v4l2_subdev *sd;
+	unsigned int i;
 	int ret;
 
 	/* sensor links */
 	flags = MEDIA_LNK_FL_ENABLED;
 	list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {
-		if (sd == &rkisp1->isp.sd)
+		if (sd == &rkisp1->isp.sd ||
+		    sd == &rkisp1->resizer_devs[RKISP1_MAINPATH].sd ||
+		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
 			continue;
 
 		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
@@ -116,6 +137,25 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 		flags = 0;
 	}
 
+	flags = MEDIA_LNK_FL_ENABLED;
+
+	/* create ISP->RSZ->CAP links */
+	for (i = 0; i < 2; i++) {
+		source = &rkisp1->isp.sd.entity;
+		sink = &rkisp1->resizer_devs[i].sd.entity;
+		ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
+					    sink, RKISP1_RSZ_PAD_SINK, flags);
+		if (ret)
+			return ret;
+
+		source = sink;
+		sink = &rkisp1->capture_devs[i].vnode.vdev.entity;
+		ret = media_create_pad_link(source, RKISP1_RSZ_PAD_SRC,
+					    sink, 0, flags);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -288,15 +328,29 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		return ret;
 
+	ret = rkisp1_resizer_devs_register(rkisp1);
+	if (ret)
+		goto err_unreg_isp_subdev;
+
+	ret = rkisp1_capture_devs_register(rkisp1);
+	if (ret)
+		goto err_unreg_resizer_devs;
+
 	ret = rkisp1_subdev_notifier(rkisp1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"Failed to register subdev notifier(%d)\n", ret);
-		rkisp1_isp_unregister(rkisp1);
-		return ret;
+		goto err_unreg_capture_devs;
 	}
 
 	return 0;
+err_unreg_capture_devs:
+	rkisp1_capture_devs_unregister(rkisp1);
+err_unreg_resizer_devs:
+	rkisp1_resizer_devs_unregister(rkisp1);
+err_unreg_isp_subdev:
+	rkisp1_isp_unregister(rkisp1);
+	return ret;
 }
 
 static irqreturn_t rkisp1_isr(int irq, void *ctx)
@@ -304,6 +358,13 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 	struct device *dev = ctx;
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 
+	/*
+	 * Call rkisp1_capture_isr() first to handle the frame that
+	 * potentially completed using the current frame_sequence number before
+	 * it is potentially incremented by rkisp1_isp_isr() in the vertical
+	 * sync.
+	 */
+	rkisp1_capture_isr(rkisp1);
 	rkisp1_isp_isr(rkisp1);
 	rkisp1_mipi_isr(rkisp1);
 
@@ -347,6 +408,14 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			     &debug->pic_size_error);
 	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
 			     &debug->mipi_error);
+	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
+			     &debug->stop_timeout[RKISP1_MAINPATH]);
+	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
+			     &debug->stop_timeout[RKISP1_SELFPATH]);
+	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
+			     &debug->frame_drop[RKISP1_MAINPATH]);
+	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
+			     &debug->frame_drop[RKISP1_SELFPATH]);
 }
 
 static int rkisp1_probe(struct platform_device *pdev)
@@ -440,6 +509,8 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&rkisp1->notifier);
 	v4l2_async_notifier_cleanup(&rkisp1->notifier);
 
+	rkisp1_capture_devs_unregister(rkisp1);
+	rkisp1_resizer_devs_unregister(rkisp1);
 	rkisp1_isp_unregister(rkisp1);
 
 	media_device_unregister(&rkisp1->media_dev);
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
new file mode 100644
index 000000000000..8cdc29c1a178
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - V4l resizer device
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include "rkisp1-common.h"
+
+#define RKISP1_RSZ_SP_DEV_NAME	RKISP1_DRIVER_NAME "_resizer_selfpath"
+#define RKISP1_RSZ_MP_DEV_NAME	RKISP1_DRIVER_NAME "_resizer_mainpath"
+
+#define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
+#define RKISP1_DEF_FMT_TYPE RKISP1_FMT_YUV
+
+#define RKISP1_MBUS_FMT_HDIV 2
+#define RKISP1_MBUS_FMT_VDIV 1
+
+enum rkisp1_shadow_regs_when {
+	RKISP1_SHADOW_REGS_SYNC,
+	RKISP1_SHADOW_REGS_ASYNC,
+};
+
+struct rkisp1_rsz_config {
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
+};
+
+static const struct rkisp1_rsz_config rkisp1_rsz_config_mp = {
+	/* constraints */
+	.max_rsz_width = RKISP1_RSZ_MP_SRC_MAX_WIDTH,
+	.max_rsz_height = RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
+	.min_rsz_width = RKISP1_RSZ_SRC_MIN_WIDTH,
+	.min_rsz_height = RKISP1_RSZ_SRC_MIN_HEIGHT,
+	/* registers */
+	.rsz = {
+		.ctrl =			RKISP1_CIF_MRSZ_CTRL,
+		.scale_hy =		RKISP1_CIF_MRSZ_SCALE_HY,
+		.scale_hcr =		RKISP1_CIF_MRSZ_SCALE_HCR,
+		.scale_hcb =		RKISP1_CIF_MRSZ_SCALE_HCB,
+		.scale_vy =		RKISP1_CIF_MRSZ_SCALE_VY,
+		.scale_vc =		RKISP1_CIF_MRSZ_SCALE_VC,
+		.scale_lut =		RKISP1_CIF_MRSZ_SCALE_LUT,
+		.scale_lut_addr =	RKISP1_CIF_MRSZ_SCALE_LUT_ADDR,
+		.scale_hy_shd =		RKISP1_CIF_MRSZ_SCALE_HY_SHD,
+		.scale_hcr_shd =	RKISP1_CIF_MRSZ_SCALE_HCR_SHD,
+		.scale_hcb_shd =	RKISP1_CIF_MRSZ_SCALE_HCB_SHD,
+		.scale_vy_shd =		RKISP1_CIF_MRSZ_SCALE_VY_SHD,
+		.scale_vc_shd =		RKISP1_CIF_MRSZ_SCALE_VC_SHD,
+		.phase_hy =		RKISP1_CIF_MRSZ_PHASE_HY,
+		.phase_hc =		RKISP1_CIF_MRSZ_PHASE_HC,
+		.phase_vy =		RKISP1_CIF_MRSZ_PHASE_VY,
+		.phase_vc =		RKISP1_CIF_MRSZ_PHASE_VC,
+		.ctrl_shd =		RKISP1_CIF_MRSZ_CTRL_SHD,
+		.phase_hy_shd =		RKISP1_CIF_MRSZ_PHASE_HY_SHD,
+		.phase_hc_shd =		RKISP1_CIF_MRSZ_PHASE_HC_SHD,
+		.phase_vy_shd =		RKISP1_CIF_MRSZ_PHASE_VY_SHD,
+		.phase_vc_shd =		RKISP1_CIF_MRSZ_PHASE_VC_SHD,
+	},
+	.dual_crop = {
+		.ctrl =			RKISP1_CIF_DUAL_CROP_CTRL,
+		.yuvmode_mask =		RKISP1_CIF_DUAL_CROP_MP_MODE_YUV,
+		.rawmode_mask =		RKISP1_CIF_DUAL_CROP_MP_MODE_RAW,
+		.h_offset =		RKISP1_CIF_DUAL_CROP_M_H_OFFS,
+		.v_offset =		RKISP1_CIF_DUAL_CROP_M_V_OFFS,
+		.h_size =		RKISP1_CIF_DUAL_CROP_M_H_SIZE,
+		.v_size =		RKISP1_CIF_DUAL_CROP_M_V_SIZE,
+	},
+};
+
+static const struct rkisp1_rsz_config rkisp1_rsz_config_sp = {
+	/* constraints */
+	.max_rsz_width = RKISP1_RSZ_SP_SRC_MAX_WIDTH,
+	.max_rsz_height = RKISP1_RSZ_SP_SRC_MAX_HEIGHT,
+	.min_rsz_width = RKISP1_RSZ_SRC_MIN_WIDTH,
+	.min_rsz_height = RKISP1_RSZ_SRC_MIN_HEIGHT,
+	/* registers */
+	.rsz = {
+		.ctrl =			RKISP1_CIF_SRSZ_CTRL,
+		.scale_hy =		RKISP1_CIF_SRSZ_SCALE_HY,
+		.scale_hcr =		RKISP1_CIF_SRSZ_SCALE_HCR,
+		.scale_hcb =		RKISP1_CIF_SRSZ_SCALE_HCB,
+		.scale_vy =		RKISP1_CIF_SRSZ_SCALE_VY,
+		.scale_vc =		RKISP1_CIF_SRSZ_SCALE_VC,
+		.scale_lut =		RKISP1_CIF_SRSZ_SCALE_LUT,
+		.scale_lut_addr =	RKISP1_CIF_SRSZ_SCALE_LUT_ADDR,
+		.scale_hy_shd =		RKISP1_CIF_SRSZ_SCALE_HY_SHD,
+		.scale_hcr_shd =	RKISP1_CIF_SRSZ_SCALE_HCR_SHD,
+		.scale_hcb_shd =	RKISP1_CIF_SRSZ_SCALE_HCB_SHD,
+		.scale_vy_shd =		RKISP1_CIF_SRSZ_SCALE_VY_SHD,
+		.scale_vc_shd =		RKISP1_CIF_SRSZ_SCALE_VC_SHD,
+		.phase_hy =		RKISP1_CIF_SRSZ_PHASE_HY,
+		.phase_hc =		RKISP1_CIF_SRSZ_PHASE_HC,
+		.phase_vy =		RKISP1_CIF_SRSZ_PHASE_VY,
+		.phase_vc =		RKISP1_CIF_SRSZ_PHASE_VC,
+		.ctrl_shd =		RKISP1_CIF_SRSZ_CTRL_SHD,
+		.phase_hy_shd =		RKISP1_CIF_SRSZ_PHASE_HY_SHD,
+		.phase_hc_shd =		RKISP1_CIF_SRSZ_PHASE_HC_SHD,
+		.phase_vy_shd =		RKISP1_CIF_SRSZ_PHASE_VY_SHD,
+		.phase_vc_shd =		RKISP1_CIF_SRSZ_PHASE_VC_SHD,
+	},
+	.dual_crop = {
+		.ctrl =			RKISP1_CIF_DUAL_CROP_CTRL,
+		.yuvmode_mask =		RKISP1_CIF_DUAL_CROP_SP_MODE_YUV,
+		.rawmode_mask =		RKISP1_CIF_DUAL_CROP_SP_MODE_RAW,
+		.h_offset =		RKISP1_CIF_DUAL_CROP_S_H_OFFS,
+		.v_offset =		RKISP1_CIF_DUAL_CROP_S_V_OFFS,
+		.h_size =		RKISP1_CIF_DUAL_CROP_S_H_SIZE,
+		.v_size =		RKISP1_CIF_DUAL_CROP_S_V_SIZE,
+	},
+};
+
+static struct v4l2_mbus_framefmt *
+rkisp1_rsz_get_pad_fmt(struct rkisp1_resizer *rsz,
+		       struct v4l2_subdev_pad_config *cfg,
+		       unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&rsz->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_format(&rsz->sd, rsz->pad_cfg, pad);
+}
+
+static struct v4l2_rect *
+rkisp1_rsz_get_pad_crop(struct rkisp1_resizer *rsz,
+			struct v4l2_subdev_pad_config *cfg,
+			unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_crop(&rsz->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_crop(&rsz->sd, rsz->pad_cfg, pad);
+}
+
+/* ----------------------------------------------------------------------------
+ * Dual crop hw configs
+ */
+
+static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
+				 enum rkisp1_shadow_regs_when when)
+{
+	u32 dc_ctrl = rkisp1_read(rsz->rkisp1, rsz->config->dual_crop.ctrl);
+	u32 mask = ~(rsz->config->dual_crop.yuvmode_mask |
+		     rsz->config->dual_crop.rawmode_mask);
+
+	dc_ctrl &= mask;
+	if (when == RKISP1_SHADOW_REGS_ASYNC)
+		dc_ctrl |= RKISP1_CIF_DUAL_CROP_GEN_CFG_UPD;
+	else
+		dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
+	rkisp1_write(rsz->rkisp1, dc_ctrl, rsz->config->dual_crop.ctrl);
+}
+
+/* configure dual-crop unit */
+static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz)
+{
+	struct rkisp1_device *rkisp1 = rsz->rkisp1;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *sink_crop;
+	u32 dc_ctrl;
+
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
+					    V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SINK,
+					  V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (sink_crop->width == sink_fmt->width &&
+	    sink_crop->height == sink_fmt->height &&
+	    sink_crop->left == 0 && sink_crop->top == 0) {
+		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_SYNC);
+		dev_dbg(rkisp1->dev, "capture %d crop disabled\n", rsz->id);
+		return;
+	}
+
+	dc_ctrl = rkisp1_read(rkisp1, rsz->config->dual_crop.ctrl);
+	rkisp1_write(rkisp1, sink_crop->left, rsz->config->dual_crop.h_offset);
+	rkisp1_write(rkisp1, sink_crop->top, rsz->config->dual_crop.v_offset);
+	rkisp1_write(rkisp1, sink_crop->width, rsz->config->dual_crop.h_size);
+	rkisp1_write(rkisp1, sink_crop->height, rsz->config->dual_crop.v_size);
+	dc_ctrl |= rsz->config->dual_crop.yuvmode_mask;
+	dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
+	rkisp1_write(rkisp1, dc_ctrl, rsz->config->dual_crop.ctrl);
+
+	dev_dbg(rkisp1->dev, "stream %d crop: %dx%d -> %dx%d\n", rsz->id,
+		sink_fmt->width, sink_fmt->height,
+		sink_crop->width, sink_crop->height);
+}
+
+/* ----------------------------------------------------------------------------
+ * Resizer hw configs
+ */
+
+static void rkisp1_rsz_dump_regs(struct rkisp1_resizer *rsz)
+{
+	dev_dbg(rsz->rkisp1->dev,
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
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.ctrl),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.ctrl_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hy),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hy_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hcb),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hcb_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hcr),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_hcr_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_vy),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_vy_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_vc),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.scale_vc_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_hy),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_hy_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_hc),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_hc_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_vy),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_vy_shd),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_vc),
+		rkisp1_read(rsz->rkisp1, rsz->config->rsz.phase_vc_shd));
+}
+
+static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
+				     enum rkisp1_shadow_regs_when when)
+{
+	u32 ctrl_cfg = rkisp1_read(rsz->rkisp1, rsz->config->rsz.ctrl);
+
+	if (when == RKISP1_SHADOW_REGS_ASYNC)
+		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO;
+	else
+		ctrl_cfg |= RKISP1_CIF_RSZ_CTRL_CFG_UPD;
+
+	rkisp1_write(rsz->rkisp1, ctrl_cfg, rsz->config->rsz.ctrl);
+}
+
+static u32 rkisp1_rsz_calc_ratio(u32 len_sink, u32 len_src)
+{
+	if (len_sink < len_src)
+		return ((len_sink - 1) * RKISP1_CIF_RSZ_SCALER_FACTOR) /
+		       (len_src - 1);
+
+	return ((len_src - 1) * RKISP1_CIF_RSZ_SCALER_FACTOR) /
+	       (len_sink - 1) + 1;
+}
+
+static void rkisp1_rsz_disable(struct rkisp1_resizer *rsz,
+			       enum rkisp1_shadow_regs_when when)
+{
+	rkisp1_write(rsz->rkisp1, 0, rsz->config->rsz.ctrl);
+
+	if (when == RKISP1_SHADOW_REGS_SYNC)
+		rkisp1_rsz_update_shadow(rsz, when);
+}
+
+static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
+				   struct v4l2_rect *sink_y,
+				   struct v4l2_rect *sink_c,
+				   struct v4l2_rect *src_y,
+				   struct v4l2_rect *src_c,
+				   enum rkisp1_shadow_regs_when when)
+{
+	struct rkisp1_device *rkisp1 = rsz->rkisp1;
+	u32 ratio, rsz_ctrl = 0;
+	unsigned int i;
+
+	/* No phase offset */
+	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_hy);
+	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_hc);
+	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_vy);
+	rkisp1_write(rkisp1, 0, rsz->config->rsz.phase_vc);
+
+	/* Linear interpolation */
+	for (i = 0; i < 64; i++) {
+		rkisp1_write(rkisp1, i, rsz->config->rsz.scale_lut_addr);
+		rkisp1_write(rkisp1, i, rsz->config->rsz.scale_lut);
+	}
+
+	if (sink_y->width != src_y->width) {
+		rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HY_ENABLE;
+		if (sink_y->width < src_y->width)
+			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HY_UP;
+		ratio = rkisp1_rsz_calc_ratio(sink_y->width, src_y->width);
+		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hy);
+	}
+
+	if (sink_c->width != src_c->width) {
+		rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HC_ENABLE;
+		if (sink_c->width < src_c->width)
+			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_HC_UP;
+		ratio = rkisp1_rsz_calc_ratio(sink_c->width, src_c->width);
+		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hcb);
+		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_hcr);
+	}
+
+	if (sink_y->height != src_y->height) {
+		rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VY_ENABLE;
+		if (sink_y->height < src_y->height)
+			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VY_UP;
+		ratio = rkisp1_rsz_calc_ratio(sink_y->height, src_y->height);
+		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_vy);
+	}
+
+	if (sink_c->height != src_c->height) {
+		rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VC_ENABLE;
+		if (sink_c->height < src_c->height)
+			rsz_ctrl |= RKISP1_CIF_RSZ_CTRL_SCALE_VC_UP;
+		ratio = rkisp1_rsz_calc_ratio(sink_c->height, src_c->height);
+		rkisp1_write(rkisp1, ratio, rsz->config->rsz.scale_vc);
+	}
+
+	rkisp1_write(rkisp1, rsz_ctrl, rsz->config->rsz.ctrl);
+
+	rkisp1_rsz_update_shadow(rsz, when);
+}
+
+static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
+			      enum rkisp1_shadow_regs_when when)
+{
+	u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
+	struct v4l2_rect sink_y, sink_c, src_y, src_c;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
+					    V4L2_SUBDEV_FORMAT_ACTIVE);
+	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SRC,
+					 V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (rsz->fmt_type == RKISP1_FMT_BAYER) {
+		rkisp1_rsz_disable(rsz, when);
+		return;
+	}
+
+	sink_y.width = sink_crop->width;
+	sink_y.height = sink_crop->height;
+	src_y.width = src_fmt->width;
+	src_y.height = src_fmt->height;
+
+	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
+	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
+
+	if (rsz->fmt_type == RKISP1_FMT_YUV) {
+		struct rkisp1_capture *cap =
+			&rsz->rkisp1->capture_devs[rsz->id];
+		const struct v4l2_format_info *pixfmt_info =
+			v4l2_format_info(cap->pix.fmt.pixelformat);
+
+		hdiv = pixfmt_info->hdiv;
+		vdiv = pixfmt_info->vdiv;
+	}
+	src_c.width = src_y.width / hdiv;
+	src_c.height = src_y.height / vdiv;
+
+	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
+		rkisp1_rsz_disable(rsz, when);
+		return;
+	}
+
+	dev_dbg(rsz->rkisp1->dev, "stream %d rsz/scale: %dx%d -> %dx%d\n",
+		rsz->id, sink_crop->width, sink_crop->height,
+		src_fmt->width, src_fmt->height);
+	dev_dbg(rsz->rkisp1->dev, "chroma scaling %dx%d -> %dx%d\n",
+		sink_c.width, sink_c.height, src_c.width, src_c.height);
+
+	/* set values in the hw */
+	rkisp1_rsz_config_regs(rsz, &sink_y, &sink_c, &src_y, &src_c, when);
+
+	rkisp1_rsz_dump_regs(rsz);
+}
+
+/* ----------------------------------------------------------------------------
+ * Subdev pad operations
+ */
+
+static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+	struct v4l2_subdev_pad_config dummy_cfg;
+	u32 pad = code->pad;
+	int ret;
+
+	/* supported mbus codes are the same in isp sink pad */
+	code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
+	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
+			       &dummy_cfg, code);
+
+	/* restore pad */
+	code->pad = pad;
+	return ret;
+}
+
+static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_fmt = v4l2_subdev_get_try_format(sd, cfg, RKISP1_RSZ_PAD_SRC);
+	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
+	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = RKISP1_DEF_FMT;
+
+	sink_crop = v4l2_subdev_get_try_crop(sd, cfg, RKISP1_RSZ_PAD_SINK);
+	sink_crop->width = RKISP1_DEFAULT_WIDTH;
+	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
+	sink_crop->left = 0;
+	sink_crop->top = 0;
+
+	src_fmt = v4l2_subdev_get_try_format(sd, cfg, RKISP1_RSZ_PAD_SINK);
+	*src_fmt = *sink_fmt;
+
+	/* NOTE: there is no crop in the source pad, only in the sink */
+
+	return 0;
+}
+
+static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_mbus_framefmt *format,
+				   unsigned int which)
+{
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
+	src_fmt->width = clamp_t(u32, format->width,
+				 rsz->config->min_rsz_width,
+				 rsz->config->max_rsz_width);
+	src_fmt->height = clamp_t(u32, format->height,
+				  rsz->config->min_rsz_height,
+				  rsz->config->max_rsz_height);
+
+	*format = *src_fmt;
+}
+
+static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
+				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_rect *r,
+				     unsigned int which)
+{
+	const struct rkisp1_isp_mbus_info *mbus_info;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+					    which);
+
+	/* Not crop for MP bayer raw data */
+	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
+
+	if (rsz->id == RKISP1_MAINPATH &&
+	    mbus_info->fmt_type == RKISP1_FMT_BAYER) {
+		sink_crop->left = 0;
+		sink_crop->top = 0;
+		sink_crop->width = sink_fmt->width;
+		sink_crop->height = sink_fmt->height;
+		return;
+	}
+
+	sink_crop->left = ALIGN(r->left, 2);
+	sink_crop->width = ALIGN(r->width, 2);
+	sink_crop->top = r->top;
+	sink_crop->height = r->height;
+	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
+
+	*r = *sink_crop;
+}
+
+static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_mbus_framefmt *format,
+				    unsigned int which)
+{
+	const struct rkisp1_isp_mbus_info *mbus_info;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
+	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
+	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+					    which);
+	sink_fmt->code = format->code;
+	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
+	if (!mbus_info) {
+		sink_fmt->code = RKISP1_DEF_FMT;
+		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
+	}
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		rsz->fmt_type = mbus_info->fmt_type;
+
+	if (rsz->id == RKISP1_MAINPATH &&
+	    mbus_info->fmt_type == RKISP1_FMT_BAYER) {
+		sink_crop->left = 0;
+		sink_crop->top = 0;
+		sink_crop->width = sink_fmt->width;
+		sink_crop->height = sink_fmt->height;
+		return;
+	}
+
+	/* Propagete to source pad */
+	src_fmt->code = sink_fmt->code;
+
+	sink_fmt->width = clamp_t(u32, format->width,
+				  rsz->config->min_rsz_width,
+				  rsz->config->max_rsz_width);
+	sink_fmt->height = clamp_t(u32, format->height,
+				   rsz->config->min_rsz_height,
+				   rsz->config->max_rsz_height);
+
+	*format = *sink_fmt;
+
+	/* Update sink crop */
+	rkisp1_rsz_set_sink_crop(rsz, cfg, sink_crop, which);
+}
+
+static int rkisp1_rsz_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+
+	fmt->format = *rkisp1_rsz_get_pad_fmt(rsz, cfg, fmt->pad, fmt->which);
+	return 0;
+}
+
+static int rkisp1_rsz_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+
+	if (fmt->pad == RKISP1_RSZ_PAD_SINK)
+		rkisp1_rsz_set_sink_fmt(rsz, cfg, &fmt->format, fmt->which);
+	else
+		rkisp1_rsz_set_src_fmt(rsz, cfg, &fmt->format, fmt->which);
+
+	return 0;
+}
+
+static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+	struct v4l2_mbus_framefmt *mf_sink;
+
+	if (sel->pad == RKISP1_RSZ_PAD_SRC)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		mf_sink = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+						 sel->which);
+		sel->r.height = mf_sink->height;
+		sel->r.width = mf_sink->width;
+		sel->r.left = 0;
+		sel->r.top = 0;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
+						  sel->which);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+
+	if (sel->target != V4L2_SEL_TGT_CROP || sel->pad == RKISP1_RSZ_PAD_SRC)
+		return -EINVAL;
+
+	dev_dbg(sd->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+
+	rkisp1_rsz_set_sink_crop(rsz, cfg, &sel->r, sel->which);
+
+	return 0;
+}
+
+static const struct media_entity_operations rkisp1_rsz_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_pad_ops rkisp1_rsz_pad_ops = {
+	.enum_mbus_code = rkisp1_rsz_enum_mbus_code,
+	.get_selection = rkisp1_rsz_get_selection,
+	.set_selection = rkisp1_rsz_set_selection,
+	.init_cfg = rkisp1_rsz_init_config,
+	.get_fmt = rkisp1_rsz_get_fmt,
+	.set_fmt = rkisp1_rsz_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+/* ----------------------------------------------------------------------------
+ * Stream operations
+ */
+
+static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rkisp1_resizer *rsz =
+		container_of(sd, struct rkisp1_resizer, sd);
+	struct rkisp1_device *rkisp1 = rsz->rkisp1;
+	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
+	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
+
+	if (!enable) {
+		rkisp1_dcrop_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
+		rkisp1_rsz_disable(rsz, RKISP1_SHADOW_REGS_ASYNC);
+		return 0;
+	}
+
+	if (other->is_streaming)
+		when = RKISP1_SHADOW_REGS_ASYNC;
+
+	rkisp1_rsz_config(rsz, when);
+	rkisp1_dcrop_config(rsz);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops rkisp1_rsz_video_ops = {
+	.s_stream = rkisp1_rsz_s_stream,
+};
+
+static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
+	.video = &rkisp1_rsz_video_ops,
+	.pad = &rkisp1_rsz_pad_ops,
+};
+
+static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
+{
+	v4l2_device_unregister_subdev(&rsz->sd);
+	media_entity_cleanup(&rsz->sd.entity);
+}
+
+static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
+{
+	const char * const dev_names[] = {RKISP1_RSZ_MP_DEV_NAME,
+					  RKISP1_RSZ_SP_DEV_NAME};
+	struct media_pad *pads = rsz->pads;
+	struct v4l2_subdev *sd = &rsz->sd;
+	int ret;
+
+	if (rsz->id == RKISP1_SELFPATH)
+		rsz->config = &rkisp1_rsz_config_sp;
+	else
+		rsz->config = &rkisp1_rsz_config_mp;
+
+	v4l2_subdev_init(sd, &rkisp1_rsz_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.ops = &rkisp1_rsz_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, dev_names[rsz->id], sizeof(sd->name));
+
+	pads[RKISP1_RSZ_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					  MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP1_RSZ_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
+					 MEDIA_PAD_FL_MUST_CONNECT;
+
+	rsz->fmt_type = RKISP1_DEF_FMT_TYPE;
+
+	ret = media_entity_pads_init(&sd->entity, 2, pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev(&rsz->rkisp1->v4l2_dev, sd);
+	if (ret) {
+		dev_err(sd->dev, "Failed to register resizer subdev\n");
+		goto err_cleanup_media_entity;
+	}
+
+	rkisp1_rsz_init_config(sd, rsz->pad_cfg);
+	return 0;
+
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_resizer *rsz;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
+		rsz = &rkisp1->resizer_devs[i];
+		rsz->rkisp1 = rkisp1;
+		rsz->id = i;
+		ret = rkisp1_rsz_register(rsz);
+		if (ret)
+			goto err_unreg_resizer_devs;
+	}
+
+	return 0;
+
+err_unreg_resizer_devs:
+	for (j = 0; j < i; j++) {
+		rsz = &rkisp1->resizer_devs[j];
+		rkisp1_rsz_unregister(rsz);
+	}
+
+	return ret;
+}
+
+void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_resizer *mp = &rkisp1->resizer_devs[RKISP1_MAINPATH];
+	struct rkisp1_resizer *sp = &rkisp1->resizer_devs[RKISP1_SELFPATH];
+
+	rkisp1_rsz_unregister(mp);
+	rkisp1_rsz_unregister(sp);
+}
-- 
2.24.0

