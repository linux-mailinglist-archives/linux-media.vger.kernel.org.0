Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814E812BADB
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 21:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfL0UCF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 15:02:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46586 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfL0UCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 15:02:05 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 6CA8B292885
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
Subject: [PATCH v12 02/11] media: staging: rkisp1: add Rockchip ISP1 base driver
Date:   Fri, 27 Dec 2019 17:01:07 -0300
Message-Id: <20191227200116.2612137-3-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227200116.2612137-1-helen.koike@collabora.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add base driver for Rockchip Image Signal Processing v1 Unit, with isp
subdevice and sensor biddings.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[fixed compilation and run time errors regarding new v4l2 async API]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v12:
- Several cleanups, renaming, removal of unecessary code, re-writting
for redability, re-structuring
- Fix format/crop pad propagation
- Commit re-organization to not break bisectability
- Fix module's license macro

Changes in v11:
- Fix compiling warnings
- Fix checkpatch errors

Changes in v10:
- unsquash

Changes in v9:
isp
- remove unnecessary double parenthesis
- remove double call to media_entity_remote_pad(local) in
get_remote_sensor()
- remove ctrl_handler from struct rkisp1_isp_subdev
- replace v4l2_{dgb,info,warn,err} by dev_*
- fix error returned in link_validate
- remove s_power() callback
- add regwrite/regread wrappers
- add macros RKISP1_DEF_SRC_PAD_FMT/RKISP1_DEF_SINK_PAD_FMT
- several minor cleanups
- s/RKISP1_ISP_PAD_SINK([^_])/RKISP1_ISP_PAD_SINK_VIDEO\1/
- merge tables rkisp1_isp_input_formats and rkisp1_isp_output_formats
- in_fmt and out_fmt as pointers
- simply struct rkisp1_isp_subdev to work correctly with try format
- fix crop/fmt propagation
- squash
- migrate to staging
core
- remove ctrl_handler from struct rkisp1_isp_subdev
- replace v4l2_{dgb,info,warn,err} by dev_*
- s/pr_info/dev_dbg
- s/int size/unsigned int size
- remove module param rkisp1_debug
- coding style fixes
- fix error in subdev_notifier_bound, check dphy before assigning to sensor->dphy
- remove subdevs fixed size array from rkisp1_pipeline
- remove sensors list, as it can be identified from the media topology
- Kconfig: add COMPILE_TEST in the dependency
- use v4l2_pipeline_pm_use and remove _isp_pipeline_s_power() and _subdev_set_power()
- remove struct rkisp1_pipeline and retrieve pipeline information from the media framework
- remove remaining rk3288 code
- cache pixel rate control in sctruct sensor_async_subdev
- remove enum rkisp1_sd_type
- squash
- move to staging

Changes in v8: None
Changes in v7:
isp
- fixed warning because of unknown entity type
- fixed v4l2-compliance errors regarding rkisp1 formats, try formats
and default values
- fix typo riksp1/rkisp1
- redesign: remove mipi/csi subdevice, sensors connect directly to the
isp subdevice in the media topology now. As a consequence, remove the
hack in mipidphy_g_mbus_config() where information from the sensor was
being propagated through the topology.
- From the old dphy:
        * cache get_remote_sensor() in s_stream
        * use V4L2_CID_PIXEL_RATE instead of V4L2_CID_LINK_FREQ
- Replace stream state with a boolean
- code styling and checkpatch fixes
- fix stop_stream (return after calling stop, do not reenable the stream)
- fix rkisp1_isp_sd_get_selection when V4L2_SUBDEV_FORMAT_TRY is set
- fix get format in output (isp_sd->out_fmt.mbus_code was being ignored)
- s/intput/input
- remove #define sd_to_isp_sd(_sd), add a static inline as it will be
reused by the capture
core
- VIDEO_ROCKCHIP_ISP1 selects VIDEOBUF2_VMALLOC
- add PHY_ROCKCHIP_DPHY as a dependency for VIDEO_ROCKCHIP_ISP1
- Fix compilation and runtime errors due to bitrotting
The code has bit-rotten since March 2018, fix compilation errors.
The new V4L2 async notifier API requires notifiers to be initialized by
a call to v4l2_async_notifier_init() before being used, do so.
- Add missing module device table
- use clk_bulk framework
- add missing notifiers cleanups
- s/strlcpy/strscpy
- normalize bus_info name
- fix s_stream error path, stream_cnt wans't being decremented properly
- use devm_platform_ioremap_resource() helper
- s/deice/device
- redesign: remove mipi/csi subdevice, sensors connect directly to the
isp subdevice in the media topology now.
- remove "saved_state" member from rkisp1_stream struct
- Reverse the order of MIs
- Simplify MI interrupt handling
Rather than adding unnecessary indirection, just use stream index to
handle MI interrupt enable/disable/clear, since the stream index matches
the order of bits now, thanks to previous patch. While at it, remove
some dead code.
- code styling and checkpatch fixes

 drivers/staging/media/Kconfig                |    2 +
 drivers/staging/media/Makefile               |    1 +
 drivers/staging/media/rkisp1/Kconfig         |   13 +
 drivers/staging/media/rkisp1/Makefile        |    4 +
 drivers/staging/media/rkisp1/rkisp1-common.c |   37 +
 drivers/staging/media/rkisp1/rkisp1-common.h |  200 +++
 drivers/staging/media/rkisp1/rkisp1-dev.c    |  466 +++++++
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 1133 ++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-regs.h   | 1264 ++++++++++++++++++
 9 files changed, 3120 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-dev.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-isp.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-regs.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index a47484473883..db467c5c2fd2 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -40,4 +40,6 @@ source "drivers/staging/media/soc_camera/Kconfig"
 
 source "drivers/staging/media/phy-rockchip-dphy/Kconfig"
 
+source "drivers/staging/media/rkisp1/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index b0eae3906208..1beb9a6374b0 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_SOC_CAMERA)	+= soc_camera/
 obj-$(CONFIG_PHY_ROCKCHIP_DPHY)		+= phy-rockchip-dphy/
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rkisp1/
diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
new file mode 100644
index 000000000000..7fa7b402ae0d
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ROCKCHIP_ISP1
+	tristate "Rockchip Image Signal Processing v1 Unit driver"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_FWNODE
+	select PHY_ROCKCHIP_DPHY
+	default n
+	help
+	  Support for ISP1 on the rockchip SoC.
diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/staging/media/rkisp1/Makefile
new file mode 100644
index 000000000000..2faa73fc2b7f
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Makefile
@@ -0,0 +1,4 @@
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
+rockchip-isp1-objs += 	rkisp1-common.o \
+			rkisp1-dev.o \
+			rkisp1-isp.o
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.c b/drivers/staging/media/rkisp1/rkisp1-common.c
new file mode 100644
index 000000000000..cf889666e166
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-common.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Common definitions
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ */
+
+#include <media/v4l2-rect.h>
+
+#include "rkisp1-common.h"
+
+static const struct v4l2_rect rkisp1_sd_min_crop = {
+	.width = RKISP1_ISP_MIN_WIDTH,
+	.height = RKISP1_ISP_MIN_HEIGHT,
+	.top = 0,
+	.left = 0,
+};
+
+void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
+				const struct v4l2_rect *bounds)
+{
+	v4l2_rect_set_min_size(crop, &rkisp1_sd_min_crop);
+	v4l2_rect_map_inside(crop, bounds);
+}
+
+void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
+			   const struct v4l2_mbus_framefmt *bounds)
+{
+	struct v4l2_rect crop_bounds = {
+		.left = 0,
+		.top = 0,
+		.width = bounds->width,
+		.height = bounds->height,
+	};
+
+	rkisp1_sd_adjust_crop_rect(crop, &crop_bounds);
+}
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
new file mode 100644
index 000000000000..111f49224402
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Common definitions
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_COMMON_H
+#define _RKISP1_COMMON_H
+
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "rkisp1-regs.h"
+
+#define RKISP1_ISP_MAX_WIDTH		4032
+#define RKISP1_ISP_MAX_HEIGHT		3024
+#define RKISP1_ISP_MIN_WIDTH		32
+#define RKISP1_ISP_MIN_HEIGHT		32
+
+#define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
+#define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
+#define RKISP1_RSZ_SP_SRC_MAX_WIDTH		1920
+#define RKISP1_RSZ_SP_SRC_MAX_HEIGHT		1920
+#define RKISP1_RSZ_SRC_MIN_WIDTH		32
+#define RKISP1_RSZ_SRC_MIN_HEIGHT		16
+
+#define RKISP1_DEFAULT_WIDTH		800
+#define RKISP1_DEFAULT_HEIGHT		600
+
+#define RKISP1_DRIVER_NAME	"rkisp1"
+#define RKISP1_BUS_INFO		"platform: " RKISP1_DRIVER_NAME
+
+#define RKISP1_MAX_BUS_CLK	8
+
+enum rkisp1_fmt_pix_type {
+	RKISP1_FMT_YUV,
+	RKISP1_FMT_RGB,
+	RKISP1_FMT_BAYER,
+	RKISP1_FMT_JPEG,
+};
+
+enum rkisp1_fmt_raw_pat_type {
+	RKISP1_RAW_RGGB = 0,
+	RKISP1_RAW_GRBG,
+	RKISP1_RAW_GBRG,
+	RKISP1_RAW_BGGR,
+};
+
+enum rkisp1_isp_pad {
+	RKISP1_ISP_PAD_SINK_VIDEO,
+	RKISP1_ISP_PAD_SINK_PARAMS,
+	RKISP1_ISP_PAD_SOURCE_VIDEO,
+	RKISP1_ISP_PAD_SOURCE_STATS,
+	RKISP1_ISP_PAD_MAX
+};
+
+/*
+ * struct rkisp1_sensor_async - Sensor information
+ * @mbus: media bus configuration
+ */
+struct rkisp1_sensor_async {
+	struct v4l2_async_subdev asd;
+	struct v4l2_mbus_config mbus;
+	unsigned int lanes;
+	struct v4l2_subdev *sd;
+	struct v4l2_ctrl *pixel_rate_ctrl;
+	struct phy *dphy;
+};
+
+/*
+ * struct rkisp1_isp - ISP sub-device
+ *
+ * See Cropping regions of ISP in rkisp1.c for details
+ * @sink_frm: input size, don't have to be equal to sensor size
+ * @sink_fmt: input format
+ * @sink_crop: crop for sink pad
+ * @src_fmt: output format
+ * @src_crop: output size
+ *
+ * @is_dphy_errctrl_disabled : if dphy errctrl is disabled (avoid endless interrupt)
+ * @frame_sequence: used to synchronize frame_id between video devices.
+ * @quantization: output quantization
+ */
+struct rkisp1_isp {
+	struct v4l2_subdev sd;
+	struct media_pad pads[RKISP1_ISP_PAD_MAX];
+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
+	const struct rkisp1_isp_mbus_info *sink_fmt;
+	const struct rkisp1_isp_mbus_info *src_fmt;
+	bool is_dphy_errctrl_disabled;
+	atomic_t frame_sequence;
+};
+
+struct rkisp1_vdev_node {
+	struct vb2_queue buf_queue;
+	struct mutex vlock; /* ioctl serialization mutex */
+	struct video_device vdev;
+	struct media_pad pad;
+};
+
+struct rkisp1_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	union {
+		u32 buff_addr[VIDEO_MAX_PLANES];
+		void *vaddr[VIDEO_MAX_PLANES];
+	};
+};
+
+struct rkisp1_dummy_buffer {
+	void *vaddr;
+	dma_addr_t dma_addr;
+	u32 size;
+};
+
+struct rkisp1_device;
+
+struct rkisp1_debug {
+	struct dentry *debugfs_dir;
+	unsigned long data_loss;
+	unsigned long pic_size_error;
+	unsigned long mipi_error;
+};
+
+/*
+ * struct rkisp1_device - ISP platform device
+ * @base_addr: base register address
+ * @active_sensor: sensor in-use, set when streaming on
+ * @isp: ISP sub-device
+ */
+struct rkisp1_device {
+	void __iomem *base_addr;
+	int irq;
+	struct device *dev;
+	unsigned int clk_size;
+	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
+	struct v4l2_device v4l2_dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_device media_dev;
+	struct v4l2_async_notifier notifier;
+	struct rkisp1_sensor_async *active_sensor;
+	struct rkisp1_isp isp;
+	struct media_pipeline pipe;
+	struct vb2_alloc_ctx *alloc_ctx;
+	struct rkisp1_debug debug;
+};
+
+/*
+ * struct rkisp1_isp_mbus_info - ISP pad format info
+ *
+ * Translate mbus_code to hardware format values
+ *
+ * @bus_width: used for parallel
+ */
+struct rkisp1_isp_mbus_info {
+	u32 mbus_code;
+	enum rkisp1_fmt_pix_type fmt_type;
+	u32 mipi_dt;
+	u32 yuv_seq;
+	u8 bus_width;
+	enum rkisp1_fmt_raw_pat_type bayer_pat;
+	unsigned int direction;
+};
+
+static inline void
+rkisp1_write(struct rkisp1_device *rkisp1, u32 val, unsigned int addr)
+{
+	writel(val, rkisp1->base_addr + addr);
+}
+
+static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
+{
+	return readl(rkisp1->base_addr + addr);
+}
+
+void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
+				const struct v4l2_rect *bounds);
+
+void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
+			   const struct v4l2_mbus_framefmt *bounds);
+
+int rkisp1_isp_register(struct rkisp1_device *rkisp1,
+			struct v4l2_device *v4l2_dev);
+void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
+
+const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
+
+void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
+void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
+
+#endif /* _RKISP1_COMMON_H */
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
new file mode 100644
index 000000000000..fa8f8b673f9f
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Base driver
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <media/v4l2-fwnode.h>
+
+#include "rkisp1-common.h"
+
+/*
+ * ISP Details
+ * -----------
+ *
+ * ISP Comprises with:
+ *	MIPI serial camera interface
+ *	Image Signal Processing
+ *	Many Image Enhancement Blocks
+ *	Crop
+ *	Resizer
+ *	RBG display ready image
+ *	Image Rotation
+ *
+ * ISP Block Diagram
+ * -----------------
+ *                                rkisp1-isp.c                              Main Picture Path
+ *                        |==========================|      |===============================================|
+ *                        +-----------+  +--+--+--+--+      +--------+  +--------+              +-----------+
+ *                        |           |  |  |  |  |  |      |        |  |        |              |           |
+ * +--------+    |\       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |------------->|           |
+ * |  MIPI  |--->|  \     |           |  |  |  |  |  |   |  |        |  |        |              |           |
+ * +--------+    |   |    |           |  |IE|IE|IE|IE|   |  +--------+  +--------+              |  Memory   |
+ *               |MUX|--->|    ISP    |->|0 |1 |2 |3 |---+                                      | Interface |
+ * +--------+    |   |    |           |  |  |  |  |  |   |  +--------+  +--------+  +--------+  |           |
+ * |Parallel|--->|  /     |           |  |  |  |  |  |   |  |        |  |        |  |        |  |           |
+ * +--------+    |/       |           |  |  |  |  |  |   -->|  Crop  |->|  RSZ   |->|  RGB   |->|           |
+ *                        |           |  |  |  |  |  |      |        |  |        |  | Rotate |  |           |
+ *                        +-----------+  +--+--+--+--+      +--------+  +--------+  +--------+  +-----------+
+ *                                               ^
+ * +--------+                                    |          |===============================================|
+ * |  DMA   |------------------------------------+                          Self Picture Path
+ * +--------+
+ *
+ *
+ * Media Topology
+ * --------------
+ *      +----------+     +----------+
+ *      | Sensor 2 |     | Sensor X |
+ *      ------------ ... ------------
+ *      |    0     |     |    0     |
+ *      +----------+     +----------+
+ *                  \      |
+ *                   \     |
+ *    +----------+    \    |
+ *    | Sensor 1 |     v   v
+ *    ------------      +------+------+
+ *    |    0     |----->|  0   |  1   |
+ *    +----------+      |------+------|
+ *                      |     ISP     |
+ *                      |------+------|
+ *                      |  2   |  3   |
+ *                      +------+------+
+ */
+
+struct rkisp1_match_data {
+	const char * const *clks;
+	unsigned int size;
+};
+
+/* ----------------------------------------------------------------------------
+ * Sensor DT bindings
+ */
+
+static int rkisp1_create_links(struct rkisp1_device *rkisp1)
+{
+	unsigned int flags, source_pad;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	/* sensor links */
+	flags = MEDIA_LNK_FL_ENABLED;
+	list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {
+		if (sd == &rkisp1->isp.sd)
+			continue;
+
+		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+						  MEDIA_PAD_FL_SOURCE);
+		if (ret) {
+			dev_err(sd->dev, "failed to find src pad for %s\n",
+				sd->name);
+			return ret;
+		}
+		source_pad = ret;
+
+		ret = media_create_pad_link(&sd->entity, source_pad,
+					    &rkisp1->isp.sd.entity,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
+					    flags);
+		if (ret)
+			return ret;
+
+		flags = 0;
+	}
+
+	return 0;
+}
+
+static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *sd,
+					struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_device *rkisp1 =
+		container_of(notifier, struct rkisp1_device, notifier);
+	struct rkisp1_sensor_async *s_asd =
+		container_of(asd, struct rkisp1_sensor_async, asd);
+
+	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
+						V4L2_CID_PIXEL_RATE);
+	s_asd->sd = sd;
+	s_asd->dphy = devm_phy_get(rkisp1->dev, "dphy");
+	if (IS_ERR(s_asd->dphy)) {
+		if (PTR_ERR(s_asd->dphy) != -EPROBE_DEFER)
+			dev_err(rkisp1->dev, "Couldn't get the MIPI D-PHY\n");
+		return PTR_ERR(s_asd->dphy);
+	}
+
+	phy_init(s_asd->dphy);
+
+	return 0;
+}
+
+static void rkisp1_subdev_notifier_unbind(struct v4l2_async_notifier *notifier,
+					  struct v4l2_subdev *sd,
+					  struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_sensor_async *s_asd =
+		container_of(asd, struct rkisp1_sensor_async, asd);
+
+	phy_exit(s_asd->dphy);
+}
+
+static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct rkisp1_device *rkisp1 =
+		container_of(notifier, struct rkisp1_device, notifier);
+	int ret;
+
+	mutex_lock(&rkisp1->media_dev.graph_mutex);
+	ret = rkisp1_create_links(rkisp1);
+	if (ret)
+		goto unlock;
+	ret = v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
+	if (ret)
+		goto unlock;
+
+	dev_dbg(rkisp1->dev, "Async subdev notifier completed\n");
+
+unlock:
+	mutex_unlock(&rkisp1->media_dev.graph_mutex);
+	return ret;
+}
+
+static int rkisp1_fwnode_parse(struct device *dev,
+			       struct v4l2_fwnode_endpoint *vep,
+			       struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_sensor_async *s_asd =
+			container_of(asd, struct rkisp1_sensor_async, asd);
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Only CSI2 bus type is currently supported\n");
+		return -EINVAL;
+	}
+
+	if (vep->base.port != 0) {
+		dev_err(dev, "The ISP has only port 0\n");
+		return -EINVAL;
+	}
+
+	s_asd->mbus.type = vep->bus_type;
+	s_asd->mbus.flags = vep->bus.mipi_csi2.flags;
+	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	switch (vep->bus.mipi_csi2.num_data_lanes) {
+	case 1:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_1_LANE;
+		break;
+	case 2:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_2_LANE;
+		break;
+	case 3:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_3_LANE;
+		break;
+	case 4:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_4_LANE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
+	.bound = rkisp1_subdev_notifier_bound,
+	.unbind = rkisp1_subdev_notifier_unbind,
+	.complete = rkisp1_subdev_notifier_complete,
+};
+
+static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
+{
+	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
+	struct device *dev = rkisp1->dev;
+	int ret;
+
+	v4l2_async_notifier_init(ntf);
+
+	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
+					sizeof(struct rkisp1_sensor_async),
+					0, rkisp1_fwnode_parse);
+	if (ret)
+		return ret;
+
+	if (list_empty(&ntf->asd_list))
+		return -ENODEV;
+
+	ntf->ops = &rkisp1_subdev_notifier_ops;
+
+	return v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
+}
+
+/* ----------------------------------------------------------------------------
+ * Power
+ */
+
+static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+{
+	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(rkisp1->clk_size, rkisp1->clks);
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
+{
+	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret)
+		return ret;
+	ret = clk_bulk_prepare_enable(rkisp1->clk_size, rkisp1->clks);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkisp1_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
+};
+
+/* ----------------------------------------------------------------------------
+ * Core
+ */
+
+static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
+{
+	int ret;
+
+	ret = rkisp1_isp_register(rkisp1, &rkisp1->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = rkisp1_subdev_notifier(rkisp1);
+	if (ret) {
+		dev_err(rkisp1->dev,
+			"Failed to register subdev notifier(%d)\n", ret);
+		rkisp1_isp_unregister(rkisp1);
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t rkisp1_isr(int irq, void *ctx)
+{
+	struct device *dev = ctx;
+	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+
+	rkisp1_isp_isr(rkisp1);
+	rkisp1_mipi_isr(rkisp1);
+
+	return IRQ_HANDLED;
+}
+
+static const char * const rk3399_isp_clks[] = {
+	"clk_isp",
+	"aclk_isp",
+	"hclk_isp",
+	"aclk_isp_wrap",
+	"hclk_isp_wrap",
+};
+
+static const struct rkisp1_match_data rk3399_isp_clk_data = {
+	.clks = rk3399_isp_clks,
+	.size = ARRAY_SIZE(rk3399_isp_clks),
+};
+
+static const struct of_device_id rkisp1_of_match[] = {
+	{
+		.compatible = "rockchip,rk3399-cif-isp",
+		.data = &rk3399_isp_clk_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rkisp1_of_match);
+
+static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_debug *debug = &rkisp1->debug;
+
+	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
+	if (!debug->debugfs_dir) {
+		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
+		return;
+	}
+	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
+			     &debug->data_loss);
+	debugfs_create_ulong("pic_size_error", 0444,  debug->debugfs_dir,
+			     &debug->pic_size_error);
+	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
+			     &debug->mipi_error);
+}
+
+static int rkisp1_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	const struct rkisp1_match_data *clk_data;
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct rkisp1_device *rkisp1;
+	struct v4l2_device *v4l2_dev;
+	unsigned int i;
+	int ret, irq;
+
+	match = of_match_node(rkisp1_of_match, node);
+	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
+	if (!rkisp1)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rkisp1);
+	rkisp1->dev = dev;
+
+	rkisp1_debug_init(rkisp1);
+
+	rkisp1->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rkisp1->base_addr))
+		return PTR_ERR(rkisp1->base_addr);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, rkisp1_isr, IRQF_SHARED,
+			       dev_driver_string(dev), dev);
+	if (ret) {
+		dev_err(dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	rkisp1->irq = irq;
+	clk_data = match->data;
+
+	for (i = 0; i < clk_data->size; i++)
+		rkisp1->clks[i].id = clk_data->clks[i];
+	ret = devm_clk_bulk_get(dev, clk_data->size, rkisp1->clks);
+	if (ret)
+		return ret;
+	rkisp1->clk_size = clk_data->size;
+
+	pm_runtime_enable(&pdev->dev);
+
+	strscpy(rkisp1->media_dev.model, RKISP1_DRIVER_NAME,
+		sizeof(rkisp1->media_dev.model));
+	rkisp1->media_dev.dev = &pdev->dev;
+	strscpy(rkisp1->media_dev.bus_info,
+		"platform: " RKISP1_DRIVER_NAME,
+		sizeof(rkisp1->media_dev.bus_info));
+	media_device_init(&rkisp1->media_dev);
+
+	v4l2_dev = &rkisp1->v4l2_dev;
+	v4l2_dev->mdev = &rkisp1->media_dev;
+	strscpy(v4l2_dev->name, RKISP1_DRIVER_NAME, sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(rkisp1->dev, &rkisp1->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = media_device_register(&rkisp1->media_dev);
+	if (ret) {
+		dev_err(dev, "Failed to register media device: %d\n", ret);
+		goto err_unreg_v4l2_dev;
+	}
+
+	ret = rkisp1_entities_register(rkisp1);
+	if (ret)
+		goto err_unreg_media_dev;
+
+	return 0;
+
+err_unreg_media_dev:
+	media_device_unregister(&rkisp1->media_dev);
+err_unreg_v4l2_dev:
+	v4l2_device_unregister(&rkisp1->v4l2_dev);
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int rkisp1_remove(struct platform_device *pdev)
+{
+	struct rkisp1_device *rkisp1 = platform_get_drvdata(pdev);
+
+	v4l2_async_notifier_unregister(&rkisp1->notifier);
+	v4l2_async_notifier_cleanup(&rkisp1->notifier);
+
+	rkisp1_isp_unregister(rkisp1);
+
+	media_device_unregister(&rkisp1->media_dev);
+	v4l2_device_unregister(&rkisp1->v4l2_dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
+	return 0;
+}
+
+static struct platform_driver rkisp1_drv = {
+	.driver = {
+		.name = RKISP1_DRIVER_NAME,
+		.of_match_table = of_match_ptr(rkisp1_of_match),
+		.pm = &rkisp1_pm_ops,
+	},
+	.probe = rkisp1_probe,
+	.remove = rkisp1_remove,
+};
+
+module_platform_driver(rkisp1_drv);
+MODULE_DESCRIPTION("Rockchip ISP1 platform driver");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
new file mode 100644
index 000000000000..abf63e7f74bd
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -0,0 +1,1133 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - ISP Subdevice
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *
+ * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-event.h>
+
+#include "rkisp1-common.h"
+
+#define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
+#define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
+
+#define RKISP1_ISP_DEV_NAME	RKISP1_DRIVER_NAME "_isp"
+
+#define RKISP1_DIR_SRC BIT(0)
+#define RKISP1_DIR_SINK BIT(1)
+#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
+
+/*
+ * NOTE: MIPI controller and input MUX are also configured in this file,
+ * because ISP Subdev is not only describe ISP submodule(input size,format,
+ * output size, format), but also a virtual route device.
+ */
+
+/*
+ * There are many variables named with format/frame in below code,
+ * please see here for their meaning.
+ * Cropping in the sink pad defines the image region from the sensor.
+ * Cropping in the source pad defines the region for the Image Stabilizer (IS)
+ *
+ * Cropping regions of ISP
+ *
+ * +---------------------------------------------------------+
+ * | Sensor image                                            |
+ * | +---------------------------------------------------+   |
+ * | | CIF_ISP_ACQ (for black level)                     |   |
+ * | | sink pad format                                   |   |
+ * | | +--------------------------------------------+    |   |
+ * | | |    CIF_ISP_OUT                             |    |   |
+ * | | |    sink pad crop                           |    |   |
+ * | | |    +---------------------------------+     |    |   |
+ * | | |    |   CIF_ISP_IS                    |     |    |   |
+ * | | |    |   source pad crop and format    |     |    |   |
+ * | | |    +---------------------------------+     |    |   |
+ * | | +--------------------------------------------+    |   |
+ * | +---------------------------------------------------+   |
+ * +---------------------------------------------------------+
+ */
+
+static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.fmt_type	= RKISP1_FMT_YUV,
+		.direction	= RKISP1_DIR_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RKISP1_RAW_RGGB,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RKISP1_RAW_BGGR,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RKISP1_RAW_GBRG,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RKISP1_RAW_GRBG,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RKISP1_RAW_RGGB,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RKISP1_RAW_BGGR,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RKISP1_RAW_GBRG,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RKISP1_RAW_GRBG,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RKISP1_RAW_RGGB,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RKISP1_RAW_BGGR,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RKISP1_RAW_GBRG,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.fmt_type	= RKISP1_FMT_BAYER,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RKISP1_RAW_GRBG,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_SINK_SRC,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
+		.fmt_type	= RKISP1_FMT_YUV,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_SINK,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
+		.fmt_type	= RKISP1_FMT_YUV,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_SINK,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.fmt_type	= RKISP1_FMT_YUV,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_SINK,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
+		.fmt_type	= RKISP1_FMT_YUV,
+		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_SINK,
+	},
+};
+
+/* ----------------------------------------------------------------------------
+ * Helpers
+ */
+
+const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
+		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
+
+		if (fmt->mbus_code == mbus_code)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
+{
+	struct media_pad *local, *remote;
+	struct media_entity *sensor_me;
+
+	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
+	remote = media_entity_remote_pad(local);
+	if (!remote) {
+		dev_warn(sd->dev, "No link between isp and sensor\n");
+		return NULL;
+	}
+
+	sensor_me = remote->entity;
+	return media_entity_to_v4l2_subdev(sensor_me);
+}
+
+static struct v4l2_mbus_framefmt *
+rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
+		       struct v4l2_subdev_pad_config *cfg,
+		       unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&isp->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_format(&isp->sd, isp->pad_cfg, pad);
+}
+
+static struct v4l2_rect *
+rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
+			struct v4l2_subdev_pad_config *cfg,
+			unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_crop(&isp->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_crop(&isp->sd, isp->pad_cfg, pad);
+}
+
+/* ----------------------------------------------------------------------------
+ * Camera Interface registers configurations
+ */
+
+/*
+ * Image Stabilization.
+ * This should only be called when configuring CIF
+ * or at the frame end interrupt
+ */
+static void rkisp1_config_ism(struct rkisp1_device *rkisp1)
+{
+	struct v4l2_rect *src_crop =
+		rkisp1_isp_get_pad_crop(&rkisp1->isp, NULL,
+					RKISP1_ISP_PAD_SOURCE_VIDEO,
+					V4L2_SUBDEV_FORMAT_ACTIVE);
+	u32 val;
+
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_RECENTER);
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_MAX_DX);
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_MAX_DY);
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IS_DISPLACE);
+	rkisp1_write(rkisp1, src_crop->left, RKISP1_CIF_ISP_IS_H_OFFS);
+	rkisp1_write(rkisp1, src_crop->top, RKISP1_CIF_ISP_IS_V_OFFS);
+	rkisp1_write(rkisp1, src_crop->width, RKISP1_CIF_ISP_IS_H_SIZE);
+	rkisp1_write(rkisp1, src_crop->height, RKISP1_CIF_ISP_IS_V_SIZE);
+
+	/* IS(Image Stabilization) is always on, working as output crop */
+	rkisp1_write(rkisp1, 1, RKISP1_CIF_ISP_IS_CTRL);
+	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
+	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD;
+	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+}
+
+/*
+ * configure ISP blocks with input format, size......
+ */
+static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
+{
+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
+	const struct rkisp1_isp_mbus_info *src_fmt, *sink_fmt;
+	struct rkisp1_sensor_async *sensor;
+	struct v4l2_mbus_framefmt *sink_frm;
+	struct v4l2_rect *sink_crop;
+
+	sensor = rkisp1->active_sensor;
+	sink_fmt = rkisp1->isp.sink_fmt;
+	src_fmt = rkisp1->isp.src_fmt;
+	sink_frm = rkisp1_isp_get_pad_fmt(&rkisp1->isp, NULL,
+					  RKISP1_ISP_PAD_SINK_VIDEO,
+					  V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_crop = rkisp1_isp_get_pad_crop(&rkisp1->isp, NULL,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
+					    V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (sink_fmt->fmt_type == RKISP1_FMT_BAYER) {
+		acq_mult = 1;
+		if (src_fmt->fmt_type == RKISP1_FMT_BAYER) {
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
+			else
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
+		} else {
+			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC_TH(0xc),
+				     RKISP1_CIF_ISP_DEMOSAIC);
+
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
+			else
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
+		}
+	} else if (sink_fmt->fmt_type == RKISP1_FMT_YUV) {
+		acq_mult = 2;
+		if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+		} else {
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
+			else
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+		}
+
+		irq_mask |= RKISP1_CIF_ISP_DATA_LOSS;
+	}
+
+	/* Set up input acquisition properties */
+	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
+	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		if (sensor->mbus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
+	}
+
+	if (sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		if (sensor->mbus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
+
+		if (sensor->mbus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
+	}
+
+	rkisp1_write(rkisp1, isp_ctrl, RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, signal | sink_fmt->yuv_seq |
+		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
+		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL,
+		     RKISP1_CIF_ISP_ACQ_PROP);
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_NR_FRAMES);
+
+	/* Acquisition Size */
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_H_OFFS);
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_ACQ_V_OFFS);
+	rkisp1_write(rkisp1,
+		     acq_mult * sink_frm->width, RKISP1_CIF_ISP_ACQ_H_SIZE);
+	rkisp1_write(rkisp1, sink_frm->height, RKISP1_CIF_ISP_ACQ_V_SIZE);
+
+	/* ISP Out Area */
+	rkisp1_write(rkisp1, sink_crop->left, RKISP1_CIF_ISP_OUT_H_OFFS);
+	rkisp1_write(rkisp1, sink_crop->top, RKISP1_CIF_ISP_OUT_V_OFFS);
+	rkisp1_write(rkisp1, sink_crop->width, RKISP1_CIF_ISP_OUT_H_SIZE);
+	rkisp1_write(rkisp1, sink_crop->height, RKISP1_CIF_ISP_OUT_V_SIZE);
+
+	irq_mask |= RKISP1_CIF_ISP_FRAME | RKISP1_CIF_ISP_V_START |
+		    RKISP1_CIF_ISP_PIC_SIZE_ERROR | RKISP1_CIF_ISP_FRAME_IN;
+	rkisp1_write(rkisp1, irq_mask, RKISP1_CIF_ISP_IMSC);
+
+	return 0;
+}
+
+static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
+{
+	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
+	u32 val, input_sel;
+
+	switch (sink_fmt->bus_width) {
+	case 8:
+		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
+		break;
+	case 10:
+		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
+		break;
+	case 12:
+		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
+		break;
+	default:
+		dev_err(rkisp1->dev, "Invalid bus width\n");
+		return -EINVAL;
+	}
+
+	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ACQ_PROP);
+	rkisp1_write(rkisp1, val | input_sel, RKISP1_CIF_ISP_ACQ_PROP);
+
+	return 0;
+}
+
+static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
+{
+	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
+	unsigned int lanes;
+	u32 mipi_ctrl;
+
+	/*
+	 * rkisp1->active_sensor->mbus is set in isp or d-phy notifier_bound
+	 * function
+	 */
+	switch (rkisp1->active_sensor->mbus.flags & V4L2_MBUS_CSI2_LANES) {
+	case V4L2_MBUS_CSI2_4_LANE:
+		lanes = 4;
+		break;
+	case V4L2_MBUS_CSI2_3_LANE:
+		lanes = 3;
+		break;
+	case V4L2_MBUS_CSI2_2_LANE:
+		lanes = 2;
+		break;
+	case V4L2_MBUS_CSI2_1_LANE:
+		lanes = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mipi_ctrl = RKISP1_CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
+		    RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
+		    RKISP1_CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP |
+		    RKISP1_CIF_MIPI_CTRL_CLOCKLANE_ENA;
+
+	rkisp1_write(rkisp1, mipi_ctrl, RKISP1_CIF_MIPI_CTRL);
+
+	/* Configure Data Type and Virtual Channel */
+	rkisp1_write(rkisp1,
+		     RKISP1_CIF_MIPI_DATA_SEL_DT(sink_fmt->mipi_dt) |
+		     RKISP1_CIF_MIPI_DATA_SEL_VC(0),
+		     RKISP1_CIF_MIPI_IMG_DATA_SEL);
+
+	/* Clear MIPI interrupts */
+	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MIPI_ICR);
+	/*
+	 * Disable RKISP1_CIF_MIPI_ERR_DPHY interrupt here temporary for
+	 * isp bus may be dead when switch isp.
+	 */
+	rkisp1_write(rkisp1,
+		     RKISP1_CIF_MIPI_FRAME_END | RKISP1_CIF_MIPI_ERR_CSI |
+		     RKISP1_CIF_MIPI_ERR_DPHY |
+		     RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(0x03) |
+		     RKISP1_CIF_MIPI_ADD_DATA_OVFLW,
+		     RKISP1_CIF_MIPI_IMSC);
+
+	dev_dbg(rkisp1->dev, "\n  MIPI_CTRL 0x%08x\n"
+		"  MIPI_IMG_DATA_SEL 0x%08x\n"
+		"  MIPI_STATUS 0x%08x\n"
+		"  MIPI_IMSC 0x%08x\n",
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMG_DATA_SEL),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_STATUS),
+		rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC));
+
+	return 0;
+}
+
+/* Configure MUX */
+static int rkisp1_config_path(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
+	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
+	int ret = 0;
+
+	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
+	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		ret = rkisp1_config_dvp(rkisp1);
+		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
+	} else if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+		ret = rkisp1_config_mipi(rkisp1);
+		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
+	}
+
+	rkisp1_write(rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
+
+	return ret;
+}
+
+/* Hardware configure Entry */
+static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
+{
+	u32 cif_id;
+	int ret;
+
+	cif_id = rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
+	dev_dbg(rkisp1->dev, "CIF_ID 0x%08x\n", cif_id);
+
+	ret = rkisp1_config_isp(rkisp1);
+	if (ret)
+		return ret;
+	ret = rkisp1_config_path(rkisp1);
+	if (ret)
+		return ret;
+	rkisp1_config_ism(rkisp1);
+
+	return 0;
+}
+
+static int rkisp1_isp_stop(struct rkisp1_device *rkisp1)
+{
+	u32 val;
+
+	/*
+	 * ISP(mi) stop in mi frame end -> Stop ISP(mipi) ->
+	 * Stop ISP(isp) ->wait for ISP isp off
+	 */
+	/* stop and clear MI, MIPI, and ISP interrupts */
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_MIPI_IMSC);
+	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MIPI_ICR);
+
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_ISP_IMSC);
+	rkisp1_write(rkisp1, ~0, RKISP1_CIF_ISP_ICR);
+
+	rkisp1_write(rkisp1, 0, RKISP1_CIF_MI_IMSC);
+	rkisp1_write(rkisp1, ~0, RKISP1_CIF_MI_ICR);
+	val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+	rkisp1_write(rkisp1, val & (~RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA),
+		     RKISP1_CIF_MIPI_CTRL);
+	/* stop ISP */
+	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
+	val &= ~(RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE |
+		 RKISP1_CIF_ISP_CTRL_ISP_ENABLE);
+	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+
+	val = rkisp1_read(rkisp1,	RKISP1_CIF_ISP_CTRL);
+	rkisp1_write(rkisp1, val | RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD,
+		     RKISP1_CIF_ISP_CTRL);
+
+	readx_poll_timeout(readl, rkisp1->base_addr + RKISP1_CIF_ISP_RIS,
+			   val, val & RKISP1_CIF_ISP_OFF, 20, 100);
+	rkisp1_write(rkisp1,
+		     RKISP1_CIF_IRCL_MIPI_SW_RST | RKISP1_CIF_IRCL_ISP_SW_RST,
+		     RKISP1_CIF_IRCL);
+	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_IRCL);
+
+	return 0;
+}
+
+static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
+{
+	u32 val = RKISP1_CIF_ICCL_ISP_CLK | RKISP1_CIF_ICCL_CP_CLK |
+		  RKISP1_CIF_ICCL_MRSZ_CLK | RKISP1_CIF_ICCL_SRSZ_CLK |
+		  RKISP1_CIF_ICCL_JPEG_CLK | RKISP1_CIF_ICCL_MI_CLK |
+		  RKISP1_CIF_ICCL_IE_CLK | RKISP1_CIF_ICCL_MIPI_CLK |
+		  RKISP1_CIF_ICCL_DCROP_CLK;
+
+	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
+}
+
+static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
+{
+	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
+	u32 val;
+
+	rkisp1_config_clk(rkisp1);
+
+	/* Activate MIPI */
+	if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
+		rkisp1_write(rkisp1, val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA,
+			     RKISP1_CIF_MIPI_CTRL);
+	}
+	/* Activate ISP */
+	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
+	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
+	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
+	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
+	rkisp1_write(rkisp1, val, RKISP1_CIF_ISP_CTRL);
+
+	/*
+	 * CIF spec says to wait for sufficient time after enabling
+	 * the MIPI interface and before starting the sensor output.
+	 */
+	usleep_range(1000, 1200);
+
+	return 0;
+}
+
+/* ----------------------------------------------------------------------------
+ * Subdev pad operations
+ */
+
+static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int i, dir;
+	int pos = 0;
+
+	if (code->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
+		dir = RKISP1_DIR_SINK;
+	} else if (code->pad == RKISP1_ISP_PAD_SOURCE_VIDEO) {
+		dir = RKISP1_DIR_SRC;
+	} else {
+		if (code->index > 0)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_FIXED;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(rkisp1_isp_formats))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
+		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
+
+		if (fmt->direction & dir)
+			pos++;
+
+		if (code->index == pos - 1) {
+			code->code = fmt->mbus_code;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *sink_crop, *src_crop;
+
+	sink_fmt = v4l2_subdev_get_try_format(sd, cfg,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
+	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
+
+	sink_crop = v4l2_subdev_get_try_crop(sd, cfg,
+					     RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop->width = RKISP1_DEFAULT_WIDTH;
+	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
+	sink_crop->left = 0;
+	sink_crop->top = 0;
+
+	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
+					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	*src_fmt = *sink_fmt;
+	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
+	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	*src_crop = *sink_crop;
+
+	sink_fmt = v4l2_subdev_get_try_format(sd, cfg,
+					      RKISP1_ISP_PAD_SINK_PARAMS);
+	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
+					     RKISP1_ISP_PAD_SOURCE_STATS);
+	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
+	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_FIXED;
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_mbus_framefmt *format,
+				   unsigned int which)
+{
+	const struct rkisp1_isp_mbus_info *mbus_info;
+	struct v4l2_mbus_framefmt *src_fmt;
+	const struct v4l2_rect *src_crop;
+
+	src_fmt = rkisp1_isp_get_pad_fmt(isp, cfg,
+					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+
+	src_fmt->code = format->code;
+	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
+	if (!mbus_info) {
+		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
+		mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
+	}
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		isp->src_fmt = mbus_info;
+	src_fmt->width  = src_crop->width;
+	src_fmt->height = src_crop->height;
+	src_fmt->quantization = format->quantization;
+	/* full range by default */
+	if (!src_fmt->quantization)
+		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	*format = *src_fmt;
+}
+
+static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_rect *r, unsigned int which)
+{
+	struct v4l2_mbus_framefmt *src_fmt;
+	const struct v4l2_rect *sink_crop;
+	struct v4l2_rect *src_crop;
+
+	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+					   RKISP1_ISP_PAD_SOURCE_VIDEO,
+					   which);
+	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
+					    which);
+
+	src_crop->left = ALIGN(r->left, 2);
+	src_crop->width = ALIGN(r->width, 2);
+	src_crop->top = r->top;
+	src_crop->height = r->height;
+	rkisp1_sd_adjust_crop_rect(src_crop, sink_crop);
+
+	*r = *src_crop;
+
+	/* Propagate to out format */
+	src_fmt = rkisp1_isp_get_pad_fmt(isp, cfg,
+					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+	rkisp1_isp_set_src_fmt(isp, cfg, src_fmt, which);
+}
+
+static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
+				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_rect *r, unsigned int which)
+{
+	struct v4l2_rect *sink_crop, *src_crop;
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+					    which);
+	sink_fmt = rkisp1_isp_get_pad_fmt(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+					  which);
+
+	sink_crop->left = ALIGN(r->left, 2);
+	sink_crop->width = ALIGN(r->width, 2);
+	sink_crop->top = r->top;
+	sink_crop->height = r->height;
+	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
+
+	*r = *sink_crop;
+
+	/* Propagate to out crop */
+	src_crop = rkisp1_isp_get_pad_crop(isp, cfg,
+					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+	rkisp1_isp_set_src_crop(isp, cfg, src_crop, which);
+}
+
+static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_mbus_framefmt *format,
+				    unsigned int which)
+{
+	const struct rkisp1_isp_mbus_info *mbus_info;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_fmt = rkisp1_isp_get_pad_fmt(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+					  which);
+	sink_fmt->code = format->code;
+	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
+	if (!mbus_info) {
+		sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
+		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
+	}
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		isp->sink_fmt = mbus_info;
+
+	sink_fmt->width = clamp_t(u32, format->width,
+				  RKISP1_ISP_MIN_WIDTH,
+				  RKISP1_ISP_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, format->height,
+				   RKISP1_ISP_MIN_HEIGHT,
+				   RKISP1_ISP_MAX_HEIGHT);
+
+	*format = *sink_fmt;
+
+	/* Propagate to in crop */
+	sink_crop = rkisp1_isp_get_pad_crop(isp, cfg, RKISP1_ISP_PAD_SINK_VIDEO,
+					    which);
+	rkisp1_isp_set_sink_crop(isp, cfg, sink_crop, which);
+}
+
+static int rkisp1_isp_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+
+	fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad, fmt->which);
+	return 0;
+}
+
+static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+
+	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+		rkisp1_isp_set_sink_fmt(isp, cfg, &fmt->format, fmt->which);
+	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+		rkisp1_isp_set_src_fmt(isp, cfg, &fmt->format, fmt->which);
+	else
+		fmt->format = *rkisp1_isp_get_pad_fmt(isp, cfg, fmt->pad,
+						      fmt->which);
+
+	return 0;
+}
+
+static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+
+	if (sel->pad != RKISP1_ISP_PAD_SOURCE_VIDEO &&
+	    sel->pad != RKISP1_ISP_PAD_SINK_VIDEO)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
+			struct v4l2_mbus_framefmt *fmt;
+
+			fmt = rkisp1_isp_get_pad_fmt(isp, cfg, sel->pad,
+						     sel->which);
+			sel->r.height = fmt->height;
+			sel->r.width = fmt->width;
+			sel->r.left = 0;
+			sel->r.top = 0;
+		} else {
+			sel->r = *rkisp1_isp_get_pad_crop(isp, cfg,
+						RKISP1_ISP_PAD_SINK_VIDEO,
+						sel->which);
+		}
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *rkisp1_isp_get_pad_crop(isp, cfg, sel->pad,
+						  sel->which);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_device *rkisp1 =
+		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
+	struct rkisp1_isp *isp = container_of(sd, struct rkisp1_isp, sd);
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	dev_dbg(rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+
+	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+		rkisp1_isp_set_sink_crop(isp, cfg, &sel->r, sel->which);
+	else if (sel->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+		rkisp1_isp_set_src_crop(isp, cfg, &sel->r, sel->which);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rkisp1_subdev_link_validate(struct media_link *link)
+{
+	if (link->sink->index == RKISP1_ISP_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
+static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
+	.enum_mbus_code = rkisp1_isp_enum_mbus_code,
+	.get_selection = rkisp1_isp_get_selection,
+	.set_selection = rkisp1_isp_set_selection,
+	.init_cfg = rkisp1_isp_init_config,
+	.get_fmt = rkisp1_isp_get_fmt,
+	.set_fmt = rkisp1_isp_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+/* ----------------------------------------------------------------------------
+ * Stream operations
+ */
+
+static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
+				  struct rkisp1_sensor_async *sensor)
+{
+	union phy_configure_opts opts;
+	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+	s64 pixel_clock;
+
+	if (!sensor->pixel_rate_ctrl) {
+		dev_warn(sensor->sd->dev, "No pixel rate control in subdev\n");
+		return -EPIPE;
+	}
+
+	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
+	if (!pixel_clock) {
+		dev_err(sensor->sd->dev, "Invalid pixel rate value\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
+					 sensor->lanes, cfg);
+	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
+	phy_configure(sensor->dphy, &opts);
+	phy_power_on(sensor->dphy);
+
+	return 0;
+}
+
+static void rkisp1_mipi_csi2_stop(struct rkisp1_sensor_async *sensor)
+{
+	phy_power_off(sensor->dphy);
+}
+
+static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rkisp1_device *rkisp1 =
+		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
+	struct v4l2_subdev *sensor_sd;
+	int ret = 0;
+
+	if (!enable) {
+		ret = rkisp1_isp_stop(rkisp1);
+		if (ret)
+			return ret;
+		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+		return 0;
+	}
+
+	sensor_sd = rkisp1_get_remote_sensor(sd);
+	if (!sensor_sd)
+		return -ENODEV;
+	rkisp1->active_sensor = container_of(sensor_sd->asd,
+					     struct rkisp1_sensor_async, asd);
+
+	atomic_set(&rkisp1->isp.frame_sequence, -1);
+	ret = rkisp1_config_cif(rkisp1);
+	if (ret)
+		return ret;
+
+	if (rkisp1->active_sensor->mbus.type != V4L2_MBUS_CSI2_DPHY)
+		return -EINVAL;
+
+	ret = rkisp1_mipi_csi2_start(&rkisp1->isp, rkisp1->active_sensor);
+	if (ret)
+		return ret;
+
+	ret = rkisp1_isp_start(rkisp1);
+	if (ret)
+		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
+
+	return ret;
+}
+
+static int rkisp1_isp_subs_evt(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			       struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static const struct media_entity_operations rkisp1_isp_media_ops = {
+	.link_validate = rkisp1_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_video_ops rkisp1_isp_video_ops = {
+	.s_stream = rkisp1_isp_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops rkisp1_isp_core_ops = {
+	.subscribe_event = rkisp1_isp_subs_evt,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops rkisp1_isp_ops = {
+	.core = &rkisp1_isp_core_ops,
+	.video = &rkisp1_isp_video_ops,
+	.pad = &rkisp1_isp_pad_ops,
+};
+
+int rkisp1_isp_register(struct rkisp1_device *rkisp1,
+			struct v4l2_device *v4l2_dev)
+{
+	struct rkisp1_isp *isp = &rkisp1->isp;
+	struct media_pad *pads = isp->pads;
+	struct v4l2_subdev *sd = &isp->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &rkisp1_isp_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.ops = &rkisp1_isp_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, RKISP1_ISP_DEV_NAME, sizeof(sd->name));
+
+	pads[RKISP1_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+						MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP1_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	pads[RKISP1_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+
+	isp->sink_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SINK_PAD_FMT);
+	isp->src_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SRC_PAD_FMT);
+
+	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret) {
+		dev_err(sd->dev, "Failed to register isp subdev\n");
+		goto err_cleanup_media_entity;
+	}
+
+	rkisp1_isp_init_config(sd, rkisp1->isp.pad_cfg);
+	return 0;
+
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
+{
+	struct v4l2_subdev *sd = &rkisp1->isp.sd;
+
+	v4l2_device_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+/* ----------------------------------------------------------------------------
+ * Interrupt handlers
+ */
+
+void rkisp1_mipi_isr(struct rkisp1_device *rkisp1)
+{
+	u32 val, status;
+
+	status = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_MIS);
+	if (!status)
+		return;
+
+	rkisp1_write(rkisp1, status, RKISP1_CIF_MIPI_ICR);
+
+	/*
+	 * Disable DPHY errctrl interrupt, because this dphy
+	 * erctrl signal is asserted until the next changes
+	 * of line state. This time is may be too long and cpu
+	 * is hold in this interrupt.
+	 */
+	if (status & RKISP1_CIF_MIPI_ERR_CTRL(0x0f)) {
+		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
+		rkisp1_write(rkisp1, val & ~RKISP1_CIF_MIPI_ERR_CTRL(0x0f),
+			     RKISP1_CIF_MIPI_IMSC);
+		rkisp1->isp.is_dphy_errctrl_disabled = true;
+	}
+
+	/*
+	 * Enable DPHY errctrl interrupt again, if mipi have receive
+	 * the whole frame without any error.
+	 */
+	if (status == RKISP1_CIF_MIPI_FRAME_END) {
+		/*
+		 * Enable DPHY errctrl interrupt again, if mipi have receive
+		 * the whole frame without any error.
+		 */
+		if (rkisp1->isp.is_dphy_errctrl_disabled) {
+			val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_IMSC);
+			val |= RKISP1_CIF_MIPI_ERR_CTRL(0x0f);
+			rkisp1_write(rkisp1, val, RKISP1_CIF_MIPI_IMSC);
+			rkisp1->isp.is_dphy_errctrl_disabled = false;
+		}
+	} else {
+		rkisp1->debug.mipi_error++;
+	}
+}
+
+static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	/*
+	 * Increment the frame sequence on the vsync signal.
+	 * This will allow applications to detect dropped.
+	 * Note that there is a debugfs counter for dropped
+	 * frames, but using this event is more accurate.
+	 */
+	event.u.frame_sync.frame_sequence =
+		atomic_inc_return(&isp->frame_sequence);
+	v4l2_event_queue(isp->sd.devnode, &event);
+}
+
+void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
+{
+	u32 status, isp_err;
+
+	status = rkisp1_read(rkisp1, RKISP1_CIF_ISP_MIS);
+	if (!status)
+		return;
+
+	rkisp1_write(rkisp1, status, RKISP1_CIF_ISP_ICR);
+
+	/* Vertical sync signal, starting generating new frame */
+	if (status & RKISP1_CIF_ISP_V_START)
+		rkisp1_isp_queue_event_sof(&rkisp1->isp);
+
+	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
+		/* Clear pic_size_error */
+		isp_err = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ERR);
+		rkisp1_write(rkisp1, isp_err, RKISP1_CIF_ISP_ERR_CLR);
+		rkisp1->debug.pic_size_error++;
+	} else if (status & RKISP1_CIF_ISP_DATA_LOSS) {
+		/* keep track of data_loss in debugfs */
+		rkisp1->debug.data_loss++;
+	}
+}
diff --git a/drivers/staging/media/rkisp1/rkisp1-regs.h b/drivers/staging/media/rkisp1/rkisp1-regs.h
new file mode 100644
index 000000000000..46018f435b6f
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1-regs.h
@@ -0,0 +1,1264 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Registers header
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_REGS_H
+#define _RKISP1_REGS_H
+
+/* ISP_CTRL */
+#define RKISP1_CIF_ISP_CTRL_ISP_ENABLE			BIT(0)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT		(0 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		BIT(1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601		(2 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601	(3 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE		(4 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656	(5 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656	(6 << 1)
+#define RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE		BIT(4)
+#define RKISP1_CIF_ISP_CTRL_ISP_GAMMA_IN_ENA		BIT(6)
+#define RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA			BIT(7)
+#define RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD_PERMANENT	BIT(8)
+#define RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD			BIT(9)
+#define RKISP1_CIF_ISP_CTRL_ISP_GEN_CFG_UPD		BIT(10)
+#define RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA		BIT(11)
+#define RKISP1_CIF_ISP_CTRL_ISP_FLASH_MODE_ENA		BIT(12)
+#define RKISP1_CIF_ISP_CTRL_ISP_CSM_Y_FULL_ENA		BIT(13)
+#define RKISP1_CIF_ISP_CTRL_ISP_CSM_C_FULL_ENA		BIT(14)
+
+/* ISP_ACQ_PROP */
+#define RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE		BIT(0)
+#define RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW		BIT(1)
+#define RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW		BIT(2)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_RGGB		(0 << 3)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		BIT(3)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GBRG		(2 << 3)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_BGGR		(3 << 3)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(pat)		((pat) << 3)
+#define RKISP1_CIF_ISP_ACQ_PROP_YCBYCR			(0 << 7)
+#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			BIT(7)
+#define RKISP1_CIF_ISP_ACQ_PROP_CBYCRY			(2 << 7)
+#define RKISP1_CIF_ISP_ACQ_PROP_CRYCBY			(3 << 7)
+#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL		(0 << 9)
+#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		BIT(9)
+#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ODD		(2 << 9)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B		(0 << 12)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		BIT(12)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_MSB		(2 << 12)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO		(3 << 12)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_MSB		(4 << 12)
+
+/* VI_DPCL */
+#define RKISP1_CIF_VI_DPCL_DMA_JPEG			(0 << 0)
+#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		BIT(0)
+#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_JPEG		(2 << 0)
+#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			BIT(2)
+#define RKISP1_CIF_VI_DPCL_CHAN_MODE_SP			(2 << 2)
+#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MPSP		(3 << 2)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_SPMUX			(0 << 4)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			BIT(4)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_IE			(2 << 4)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_JPEG			(3 << 4)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_ISP			(4 << 4)
+#define RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL		(0 << 8)
+#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			BIT(8)
+#define RKISP1_CIF_VI_DPCL_IF_SEL_MIPI			(2 << 8)
+#define RKISP1_CIF_VI_DPCL_DMA_IE_MUX_DMA		BIT(10)
+#define RKISP1_CIF_VI_DPCL_DMA_SP_MUX_DMA		BIT(11)
+
+/* ISP_IMSC - ISP_MIS - ISP_RIS - ISP_ICR - ISP_ISR */
+#define RKISP1_CIF_ISP_OFF				BIT(0)
+#define RKISP1_CIF_ISP_FRAME				BIT(1)
+#define RKISP1_CIF_ISP_DATA_LOSS			BIT(2)
+#define RKISP1_CIF_ISP_PIC_SIZE_ERROR			BIT(3)
+#define RKISP1_CIF_ISP_AWB_DONE				BIT(4)
+#define RKISP1_CIF_ISP_FRAME_IN				BIT(5)
+#define RKISP1_CIF_ISP_V_START				BIT(6)
+#define RKISP1_CIF_ISP_H_START				BIT(7)
+#define RKISP1_CIF_ISP_FLASH_ON				BIT(8)
+#define RKISP1_CIF_ISP_FLASH_OFF			BIT(9)
+#define RKISP1_CIF_ISP_SHUTTER_ON			BIT(10)
+#define RKISP1_CIF_ISP_SHUTTER_OFF			BIT(11)
+#define RKISP1_CIF_ISP_AFM_SUM_OF			BIT(12)
+#define RKISP1_CIF_ISP_AFM_LUM_OF			BIT(13)
+#define RKISP1_CIF_ISP_AFM_FIN				BIT(14)
+#define RKISP1_CIF_ISP_HIST_MEASURE_RDY			BIT(15)
+#define RKISP1_CIF_ISP_FLASH_CAP			BIT(17)
+#define RKISP1_CIF_ISP_EXP_END				BIT(18)
+#define RKISP1_CIF_ISP_VSM_END				BIT(19)
+
+/* ISP_ERR */
+#define RKISP1_CIF_ISP_ERR_INFORM_SIZE			BIT(0)
+#define RKISP1_CIF_ISP_ERR_IS_SIZE			BIT(1)
+#define RKISP1_CIF_ISP_ERR_OUTFORM_SIZE			BIT(2)
+
+/* MI_CTRL */
+#define RKISP1_CIF_MI_CTRL_MP_ENABLE			BIT(0)
+#define RKISP1_CIF_MI_CTRL_SP_ENABLE			(2 << 0)
+#define RKISP1_CIF_MI_CTRL_JPEG_ENABLE			(4 << 0)
+#define RKISP1_CIF_MI_CTRL_RAW_ENABLE			(8 << 0)
+#define RKISP1_CIF_MI_CTRL_HFLIP			BIT(4)
+#define RKISP1_CIF_MI_CTRL_VFLIP			BIT(5)
+#define RKISP1_CIF_MI_CTRL_ROT				BIT(6)
+#define RKISP1_CIF_MI_BYTE_SWAP				BIT(7)
+#define RKISP1_CIF_MI_SP_Y_FULL_YUV2RGB			BIT(8)
+#define RKISP1_CIF_MI_SP_CBCR_FULL_YUV2RGB		BIT(9)
+#define RKISP1_CIF_MI_SP_422NONCOSITEED			BIT(10)
+#define RKISP1_CIF_MI_MP_PINGPONG_ENABEL		BIT(11)
+#define RKISP1_CIF_MI_SP_PINGPONG_ENABEL		BIT(12)
+#define RKISP1_CIF_MI_MP_AUTOUPDATE_ENABLE		BIT(13)
+#define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
+#define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_16		(0 << 16)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		BIT(16)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_64		(2 << 16)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_16		(0 << 18)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		BIT(18)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_64		(2 << 18)
+#define RKISP1_CIF_MI_CTRL_INIT_BASE_EN			BIT(20)
+#define RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN		BIT(21)
+#define RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8		(0 << 22)
+#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		BIT(22)
+#define RKISP1_MI_CTRL_MP_WRITE_YUVINT			(2 << 22)
+#define RKISP1_MI_CTRL_MP_WRITE_RAW12			(2 << 22)
+#define RKISP1_MI_CTRL_SP_WRITE_PLA			(0 << 24)
+#define RKISP1_MI_CTRL_SP_WRITE_SPLA			BIT(24)
+#define RKISP1_MI_CTRL_SP_WRITE_INT			(2 << 24)
+#define RKISP1_MI_CTRL_SP_INPUT_YUV400			(0 << 26)
+#define RKISP1_MI_CTRL_SP_INPUT_YUV420			BIT(26)
+#define RKISP1_MI_CTRL_SP_INPUT_YUV422			(2 << 26)
+#define RKISP1_MI_CTRL_SP_INPUT_YUV444			(3 << 26)
+#define RKISP1_MI_CTRL_SP_OUTPUT_YUV400			(0 << 28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			BIT(28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_YUV422			(2 << 28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_YUV444			(3 << 28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_RGB565			(4 << 28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_RGB666			(5 << 28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_RGB888			(6 << 28)
+
+#define RKISP1_MI_CTRL_MP_FMT_MASK			GENMASK(23, 22)
+#define RKISP1_MI_CTRL_SP_FMT_MASK			GENMASK(30, 24)
+
+/* MI_INIT */
+#define RKISP1_CIF_MI_INIT_SKIP				BIT(2)
+#define RKISP1_CIF_MI_INIT_SOFT_UPD			BIT(4)
+
+/* MI_CTRL_SHD */
+#define RKISP1_CIF_MI_CTRL_SHD_MP_IN_ENABLED		BIT(0)
+#define RKISP1_CIF_MI_CTRL_SHD_SP_IN_ENABLED		BIT(1)
+#define RKISP1_CIF_MI_CTRL_SHD_JPEG_IN_ENABLED		BIT(2)
+#define RKISP1_CIF_MI_CTRL_SHD_RAW_IN_ENABLED		BIT(3)
+#define RKISP1_CIF_MI_CTRL_SHD_MP_OUT_ENABLED		BIT(16)
+#define RKISP1_CIF_MI_CTRL_SHD_SP_OUT_ENABLED		BIT(17)
+#define RKISP1_CIF_MI_CTRL_SHD_JPEG_OUT_ENABLED		BIT(18)
+#define RKISP1_CIF_MI_CTRL_SHD_RAW_OUT_ENABLED		BIT(19)
+
+/* RSZ_CTRL */
+#define RKISP1_CIF_RSZ_CTRL_SCALE_HY_ENABLE		BIT(0)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_HC_ENABLE		BIT(1)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_VY_ENABLE		BIT(2)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_VC_ENABLE		BIT(3)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_HY_UP			BIT(4)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_HC_UP			BIT(5)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_VY_UP			BIT(6)
+#define RKISP1_CIF_RSZ_CTRL_SCALE_VC_UP			BIT(7)
+#define RKISP1_CIF_RSZ_CTRL_CFG_UPD			BIT(8)
+#define RKISP1_CIF_RSZ_CTRL_CFG_UPD_AUTO		BIT(9)
+#define RKISP1_CIF_RSZ_SCALER_FACTOR			BIT(16)
+
+/* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
+#define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
+#define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
+#define RKISP1_CIF_MI_FILL_MP_Y				BIT(3)
+#define RKISP1_CIF_MI_WRAP_MP_Y				BIT(4)
+#define RKISP1_CIF_MI_WRAP_MP_CB			BIT(5)
+#define RKISP1_CIF_MI_WRAP_MP_CR			BIT(6)
+#define RKISP1_CIF_MI_WRAP_SP_Y				BIT(7)
+#define RKISP1_CIF_MI_WRAP_SP_CB			BIT(8)
+#define RKISP1_CIF_MI_WRAP_SP_CR			BIT(9)
+#define RKISP1_CIF_MI_DMA_READY				BIT(11)
+
+/* MI_STATUS */
+#define RKISP1_CIF_MI_STATUS_MP_Y_FIFO_FULL		BIT(0)
+#define RKISP1_CIF_MI_STATUS_SP_Y_FIFO_FULL		BIT(4)
+
+/* MI_DMA_CTRL */
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_16		(0 << 0)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		BIT(0)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_64		(2 << 0)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_16	(0 << 2)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	BIT(2)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_64	(2 << 2)
+#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PLANAR		(0 << 4)
+#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		BIT(4)
+#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
+#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		BIT(6)
+#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED		(2 << 4)
+#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV422		(2 << 6)
+#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV444		(3 << 6)
+#define RKISP1_CIF_MI_DMA_CTRL_BYTE_SWAP		BIT(8)
+#define RKISP1_CIF_MI_DMA_CTRL_CONTINUOUS_ENA		BIT(9)
+#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_NO		(0 << 12)
+#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		BIT(12)
+#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_16BIT		(2 << 12)
+/* MI_DMA_START */
+#define RKISP1_CIF_MI_DMA_START_ENABLE			BIT(0)
+/* MI_XTD_FORMAT_CTRL  */
+#define RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP	BIT(0)
+#define RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP	BIT(1)
+#define RKISP1_CIF_MI_XTD_FMT_CTRL_DMA_CB_CR_SWAP	BIT(2)
+
+/* CCL */
+#define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
+/* ICCL */
+#define RKISP1_CIF_ICCL_ISP_CLK				BIT(0)
+#define RKISP1_CIF_ICCL_CP_CLK				BIT(1)
+#define RKISP1_CIF_ICCL_RES_2				BIT(2)
+#define RKISP1_CIF_ICCL_MRSZ_CLK			BIT(3)
+#define RKISP1_CIF_ICCL_SRSZ_CLK			BIT(4)
+#define RKISP1_CIF_ICCL_JPEG_CLK			BIT(5)
+#define RKISP1_CIF_ICCL_MI_CLK				BIT(6)
+#define RKISP1_CIF_ICCL_RES_7				BIT(7)
+#define RKISP1_CIF_ICCL_IE_CLK				BIT(8)
+#define RKISP1_CIF_ICCL_SIMP_CLK			BIT(9)
+#define RKISP1_CIF_ICCL_SMIA_CLK			BIT(10)
+#define RKISP1_CIF_ICCL_MIPI_CLK			BIT(11)
+#define RKISP1_CIF_ICCL_DCROP_CLK			BIT(12)
+/* IRCL */
+#define RKISP1_CIF_IRCL_ISP_SW_RST			BIT(0)
+#define RKISP1_CIF_IRCL_CP_SW_RST			BIT(1)
+#define RKISP1_CIF_IRCL_YCS_SW_RST			BIT(2)
+#define RKISP1_CIF_IRCL_MRSZ_SW_RST			BIT(3)
+#define RKISP1_CIF_IRCL_SRSZ_SW_RST			BIT(4)
+#define RKISP1_CIF_IRCL_JPEG_SW_RST			BIT(5)
+#define RKISP1_CIF_IRCL_MI_SW_RST			BIT(6)
+#define RKISP1_CIF_IRCL_CIF_SW_RST			BIT(7)
+#define RKISP1_CIF_IRCL_IE_SW_RST			BIT(8)
+#define RKISP1_CIF_IRCL_SI_SW_RST			BIT(9)
+#define RKISP1_CIF_IRCL_MIPI_SW_RST			BIT(11)
+
+/* C_PROC_CTR */
+#define RKISP1_CIF_C_PROC_CTR_ENABLE			BIT(0)
+#define RKISP1_CIF_C_PROC_YOUT_FULL			BIT(1)
+#define RKISP1_CIF_C_PROC_YIN_FULL			BIT(2)
+#define RKISP1_CIF_C_PROC_COUT_FULL			BIT(3)
+#define RKISP1_CIF_C_PROC_CTRL_RESERVED			0xFFFFFFFE
+#define RKISP1_CIF_C_PROC_CONTRAST_RESERVED		0xFFFFFF00
+#define RKISP1_CIF_C_PROC_BRIGHTNESS_RESERVED		0xFFFFFF00
+#define RKISP1_CIF_C_PROC_HUE_RESERVED			0xFFFFFF00
+#define RKISP1_CIF_C_PROC_SATURATION_RESERVED		0xFFFFFF00
+#define RKISP1_CIF_C_PROC_MACC_RESERVED			0xE000E000
+#define RKISP1_CIF_C_PROC_TONE_RESERVED			0xF000
+/* DUAL_CROP_CTRL */
+#define RKISP1_CIF_DUAL_CROP_MP_MODE_BYPASS		(0 << 0)
+#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		BIT(0)
+#define RKISP1_CIF_DUAL_CROP_MP_MODE_RAW		(2 << 0)
+#define RKISP1_CIF_DUAL_CROP_SP_MODE_BYPASS		(0 << 2)
+#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		BIT(2)
+#define RKISP1_CIF_DUAL_CROP_SP_MODE_RAW		(2 << 2)
+#define RKISP1_CIF_DUAL_CROP_CFG_UPD_PERMANENT		BIT(4)
+#define RKISP1_CIF_DUAL_CROP_CFG_UPD			BIT(5)
+#define RKISP1_CIF_DUAL_CROP_GEN_CFG_UPD		BIT(6)
+
+/* IMG_EFF_CTRL */
+#define RKISP1_CIF_IMG_EFF_CTRL_ENABLE			BIT(0)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE		(0 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		BIT(1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA		(2 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL		(3 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS		(4 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH		(5 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN		(6 << 1)
+#define RKISP1_CIF_IMG_EFF_CTRL_CFG_UPD			BIT(4)
+#define RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL		BIT(5)
+
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE_SHIFT	0
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE_SHIFT	1
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA_SHIFT	2
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL_SHIFT	3
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS_SHIFT	4
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SKETCH_SHIFT	5
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_SHARPEN_SHIFT	6
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_MASK		0xE
+
+/* IMG_EFF_COLOR_SEL */
+#define RKISP1_CIF_IMG_EFF_COLOR_RGB			0
+#define RKISP1_CIF_IMG_EFF_COLOR_B			BIT(0)
+#define RKISP1_CIF_IMG_EFF_COLOR_G			(2 << 0)
+#define RKISP1_CIF_IMG_EFF_COLOR_GB			(3 << 0)
+#define RKISP1_CIF_IMG_EFF_COLOR_R			(4 << 0)
+#define RKISP1_CIF_IMG_EFF_COLOR_RB			(5 << 0)
+#define RKISP1_CIF_IMG_EFF_COLOR_RG			(6 << 0)
+#define RKISP1_CIF_IMG_EFF_COLOR_RGB2			(7 << 0)
+
+/* MIPI_CTRL */
+#define RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA			BIT(0)
+#define RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(a)		(((a) & 0xF) << 8)
+#define RKISP1_CIF_MIPI_CTRL_NUM_LANES(a)		(((a) & 0x3) << 12)
+#define RKISP1_CIF_MIPI_CTRL_ERR_SOT_HS_SKIP		BIT(16)
+#define RKISP1_CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP	BIT(17)
+#define RKISP1_CIF_MIPI_CTRL_CLOCKLANE_ENA		BIT(18)
+
+/* MIPI_DATA_SEL */
+#define RKISP1_CIF_MIPI_DATA_SEL_VC(a)			(((a) & 0x3) << 6)
+#define RKISP1_CIF_MIPI_DATA_SEL_DT(a)			(((a) & 0x3F) << 0)
+/* MIPI DATA_TYPE */
+#define RKISP1_CIF_CSI2_DT_YUV420_8b			0x18
+#define RKISP1_CIF_CSI2_DT_YUV420_10b			0x19
+#define RKISP1_CIF_CSI2_DT_YUV422_8b			0x1E
+#define RKISP1_CIF_CSI2_DT_YUV422_10b			0x1F
+#define RKISP1_CIF_CSI2_DT_RGB565			0x22
+#define RKISP1_CIF_CSI2_DT_RGB666			0x23
+#define RKISP1_CIF_CSI2_DT_RGB888			0x24
+#define RKISP1_CIF_CSI2_DT_RAW8				0x2A
+#define RKISP1_CIF_CSI2_DT_RAW10			0x2B
+#define RKISP1_CIF_CSI2_DT_RAW12			0x2C
+
+/* MIPI_IMSC, MIPI_RIS, MIPI_MIS, MIPI_ICR, MIPI_ISR */
+#define RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(a)		(((a) & 0xF) << 0)
+#define RKISP1_CIF_MIPI_ERR_SOT(a)			(((a) & 0xF) << 4)
+#define RKISP1_CIF_MIPI_ERR_SOT_SYNC(a)			(((a) & 0xF) << 8)
+#define RKISP1_CIF_MIPI_ERR_EOT_SYNC(a)			(((a) & 0xF) << 12)
+#define RKISP1_CIF_MIPI_ERR_CTRL(a)			(((a) & 0xF) << 16)
+#define RKISP1_CIF_MIPI_ERR_PROTOCOL			BIT(20)
+#define RKISP1_CIF_MIPI_ERR_ECC1			BIT(21)
+#define RKISP1_CIF_MIPI_ERR_ECC2			BIT(22)
+#define RKISP1_CIF_MIPI_ERR_CS				BIT(23)
+#define RKISP1_CIF_MIPI_FRAME_END			BIT(24)
+#define RKISP1_CIF_MIPI_ADD_DATA_OVFLW			BIT(25)
+#define RKISP1_CIF_MIPI_ADD_DATA_WATER_MARK		BIT(26)
+
+#define RKISP1_CIF_MIPI_ERR_CSI  (RKISP1_CIF_MIPI_ERR_PROTOCOL | \
+	RKISP1_CIF_MIPI_ERR_ECC1 | \
+	RKISP1_CIF_MIPI_ERR_ECC2 | \
+	RKISP1_CIF_MIPI_ERR_CS)
+
+#define RKISP1_CIF_MIPI_ERR_DPHY  (RKISP1_CIF_MIPI_ERR_SOT(3) | \
+	RKISP1_CIF_MIPI_ERR_SOT_SYNC(3) | \
+	RKISP1_CIF_MIPI_ERR_EOT_SYNC(3) | \
+	RKISP1_CIF_MIPI_ERR_CTRL(3))
+
+/* SUPER_IMPOSE */
+#define RKISP1_CIF_SUPER_IMP_CTRL_NORMAL_MODE		BIT(0)
+#define RKISP1_CIF_SUPER_IMP_CTRL_REF_IMG_MEM		BIT(1)
+#define RKISP1_CIF_SUPER_IMP_CTRL_TRANSP_DIS		BIT(2)
+
+/* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS		(0 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB		BIT(0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_RED		(2 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN		(3 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE		(4 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_LUM		(5 << 0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_MASK		0x7
+#define RKISP1_CIF_ISP_HIST_PREDIV_SET(x)		(((x) & 0x7F) << 3)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_SET(v0, v1, v2, v3)	\
+				     (((v0) & 0x1F) | (((v1) & 0x1F) << 8)  |\
+				     (((v2) & 0x1F) << 16) | \
+				     (((v3) & 0x1F) << 24))
+
+#define RKISP1_CIF_ISP_HIST_WINDOW_OFFSET_RESERVED	0xFFFFF000
+#define RKISP1_CIF_ISP_HIST_WINDOW_SIZE_RESERVED	0xFFFFF800
+#define RKISP1_CIF_ISP_HIST_WEIGHT_RESERVED		0xE0E0E0E0
+#define RKISP1_CIF_ISP_MAX_HIST_PREDIVIDER		0x0000007F
+#define RKISP1_CIF_ISP_HIST_ROW_NUM			5
+#define RKISP1_CIF_ISP_HIST_COLUMN_NUM			5
+
+/* AUTO FOCUS MEASUREMENT:  ISP_AFM_CTRL */
+#define RKISP1_ISP_AFM_CTRL_ENABLE			BIT(0)
+
+/* SHUTTER CONTROL */
+#define RKISP1_CIF_ISP_SH_CTRL_SH_ENA			BIT(0)
+#define RKISP1_CIF_ISP_SH_CTRL_REP_EN			BIT(1)
+#define RKISP1_CIF_ISP_SH_CTRL_SRC_SH_TRIG		BIT(2)
+#define RKISP1_CIF_ISP_SH_CTRL_EDGE_POS			BIT(3)
+#define RKISP1_CIF_ISP_SH_CTRL_POL_LOW			BIT(4)
+
+/* FLASH MODULE */
+/* ISP_FLASH_CMD */
+#define RKISP1_CIFFLASH_CMD_PRELIGHT_ON			BIT(0)
+#define RKISP1_CIFFLASH_CMD_FLASH_ON			BIT(1)
+#define RKISP1_CIFFLASH_CMD_PRE_FLASH_ON		BIT(2)
+/* ISP_FLASH_CONFIG */
+#define RKISP1_CIFFLASH_CONFIG_PRELIGHT_END		BIT(0)
+#define RKISP1_CIFFLASH_CONFIG_VSYNC_POS		BIT(1)
+#define RKISP1_CIFFLASH_CONFIG_PRELIGHT_LOW		BIT(2)
+#define RKISP1_CIFFLASH_CONFIG_SRC_FL_TRIG		BIT(3)
+#define RKISP1_CIFFLASH_CONFIG_DELAY(a)			(((a) & 0xF) << 4)
+
+/* Demosaic:  ISP_DEMOSAIC */
+#define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
+#define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
+
+/* AWB */
+/* ISP_AWB_PROP */
+#define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
+#define RKISP1_CIF_ISP_AWB_YMAX_READ(x)			(((x) >> 2) & 1)
+#define RKISP1_CIF_ISP_AWB_MODE_RGB_EN			((1 << 31) | (0x2 << 0))
+#define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
+#define RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN		((0 << 31) | (0x2 << 0))
+#define RKISP1_CIF_ISP_AWB_MODE_MASK_NONE		0xFFFFFFFC
+#define RKISP1_CIF_ISP_AWB_MODE_READ(x)			((x) & 3)
+/* ISP_AWB_GAIN_RB, ISP_AWB_GAIN_G  */
+#define RKISP1_CIF_ISP_AWB_GAIN_R_SET(x)		(((x) & 0x3FF) << 16)
+#define RKISP1_CIF_ISP_AWB_GAIN_R_READ(x)		(((x) >> 16) & 0x3FF)
+#define RKISP1_CIF_ISP_AWB_GAIN_B_SET(x)		((x) & 0x3FFF)
+#define RKISP1_CIF_ISP_AWB_GAIN_B_READ(x)		((x) & 0x3FFF)
+/* ISP_AWB_REF */
+#define RKISP1_CIF_ISP_AWB_REF_CR_SET(x)		(((x) & 0xFF) << 8)
+#define RKISP1_CIF_ISP_AWB_REF_CR_READ(x)		(((x) >> 8) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_REF_CB_READ(x)		((x) & 0xFF)
+/* ISP_AWB_THRESH */
+#define RKISP1_CIF_ISP_AWB_MAX_CS_SET(x)		(((x) & 0xFF) << 8)
+#define RKISP1_CIF_ISP_AWB_MAX_CS_READ(x)		(((x) >> 8) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_MIN_C_READ(x)		((x) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_MIN_Y_SET(x)			(((x) & 0xFF) << 16)
+#define RKISP1_CIF_ISP_AWB_MIN_Y_READ(x)		(((x) >> 16) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_MAX_Y_SET(x)			(((x) & 0xFF) << 24)
+#define RKISP1_CIF_ISP_AWB_MAX_Y_READ(x)			(((x) >> 24) & 0xFF)
+/* ISP_AWB_MEAN */
+#define RKISP1_CIF_ISP_AWB_GET_MEAN_CR_R(x)		((x) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_GET_MEAN_CB_B(x)		(((x) >> 8) & 0xFF)
+#define RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(x)		(((x) >> 16) & 0xFF)
+/* ISP_AWB_WHITE_CNT */
+#define RKISP1_CIF_ISP_AWB_GET_PIXEL_CNT(x)		((x) & 0x3FFFFFF)
+
+#define RKISP1_CIF_ISP_AWB_GAINS_MAX_VAL		0x000003FF
+#define RKISP1_CIF_ISP_AWB_WINDOW_OFFSET_MAX		0x00000FFF
+#define RKISP1_CIF_ISP_AWB_WINDOW_MAX_SIZE		0x00001FFF
+#define RKISP1_CIF_ISP_AWB_CBCR_MAX_REF			0x000000FF
+#define RKISP1_CIF_ISP_AWB_THRES_MAX_YC			0x000000FF
+
+/* AE */
+/* ISP_EXP_CTRL */
+#define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
+#define RKISP1_CIF_ISP_EXP_CTRL_AUTOSTOP		BIT(1)
+/*
+ *'1' luminance calculation according to  Y=(R+G+B) x 0.332 (85/256)
+ *'0' luminance calculation according to Y=16+0.25R+0.5G+0.1094B
+ */
+#define RKISP1_CIF_ISP_EXP_CTRL_MEASMODE_1		BIT(31)
+
+/* ISP_EXP_H_SIZE */
+#define RKISP1_CIF_ISP_EXP_H_SIZE_SET(x)		((x) & 0x7FF)
+#define RKISP1_CIF_ISP_EXP_HEIGHT_MASK			0x000007FF
+/* ISP_EXP_V_SIZE : vertical size must be a multiple of 2). */
+#define RKISP1_CIF_ISP_EXP_V_SIZE_SET(x)		((x) & 0x7FE)
+
+/* ISP_EXP_H_OFFSET */
+#define RKISP1_CIF_ISP_EXP_H_OFFSET_SET(x)		((x) & 0x1FFF)
+#define RKISP1_CIF_ISP_EXP_MAX_HOFFS			2424
+/* ISP_EXP_V_OFFSET */
+#define RKISP1_CIF_ISP_EXP_V_OFFSET_SET(x)		((x) & 0x1FFF)
+#define RKISP1_CIF_ISP_EXP_MAX_VOFFS			1806
+
+#define RKISP1_CIF_ISP_EXP_ROW_NUM			5
+#define RKISP1_CIF_ISP_EXP_COLUMN_NUM			5
+#define RKISP1_CIF_ISP_EXP_NUM_LUMA_REGS \
+	(RKISP1_CIF_ISP_EXP_ROW_NUM * RKISP1_CIF_ISP_EXP_COLUMN_NUM)
+#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE		516
+#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE		35
+#define RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE		390
+#define RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE		28
+#define RKISP1_CIF_ISP_EXP_MAX_HSIZE	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
+#define RKISP1_CIF_ISP_EXP_MIN_HSIZE	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_HSIZE * RKISP1_CIF_ISP_EXP_COLUMN_NUM + 1)
+#define RKISP1_CIF_ISP_EXP_MAX_VSIZE	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MAX_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
+#define RKISP1_CIF_ISP_EXP_MIN_VSIZE	\
+	(RKISP1_CIF_ISP_EXP_BLOCK_MIN_VSIZE * RKISP1_CIF_ISP_EXP_ROW_NUM + 1)
+
+/* LSC: ISP_LSC_CTRL */
+#define RKISP1_CIF_ISP_LSC_CTRL_ENA			BIT(0)
+#define RKISP1_CIF_ISP_LSC_SECT_SIZE_RESERVED		0xFC00FC00
+#define RKISP1_CIF_ISP_LSC_GRAD_RESERVED		0xF000F000
+#define RKISP1_CIF_ISP_LSC_SAMPLE_RESERVED		0xF000F000
+#define RKISP1_CIF_ISP_LSC_SECTORS_MAX			17
+#define RKISP1_CIF_ISP_LSC_TABLE_DATA(v0, v1)     \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 12))
+#define RKISP1_CIF_ISP_LSC_SECT_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+#define RKISP1_CIF_ISP_LSC_GRAD_SIZE(v0, v1)      \
+	(((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
+
+/* LSC: ISP_LSC_TABLE_SEL */
+#define RKISP1_CIF_ISP_LSC_TABLE_0			0
+#define RKISP1_CIF_ISP_LSC_TABLE_1			1
+
+/* LSC: ISP_LSC_STATUS */
+#define RKISP1_CIF_ISP_LSC_ACTIVE_TABLE			BIT(1)
+#define RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_0		0
+#define RKISP1_CIF_ISP_LSC_TABLE_ADDRESS_153		153
+
+/* FLT */
+/* ISP_FILT_MODE */
+#define RKISP1_CIF_ISP_FLT_ENA				BIT(0)
+
+/*
+ * 0: green filter static mode (active filter factor = FILT_FAC_MID)
+ * 1: dynamic noise reduction/sharpen Default
+ */
+#define RKISP1_CIF_ISP_FLT_MODE_DNR			BIT(1)
+#define RKISP1_CIF_ISP_FLT_MODE_MAX			1
+#define RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(x)		(((x) & 0x3) << 4)
+#define RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(x)		(((x) & 0x3) << 6)
+#define RKISP1_CIF_ISP_FLT_CHROMA_MODE_MAX		3
+#define RKISP1_CIF_ISP_FLT_GREEN_STAGE1(x)		(((x) & 0xF) << 8)
+#define RKISP1_CIF_ISP_FLT_GREEN_STAGE1_MAX		8
+#define RKISP1_CIF_ISP_FLT_THREAD_RESERVED		0xFFFFFC00
+#define RKISP1_CIF_ISP_FLT_FAC_RESERVED			0xFFFFFFC0
+#define RKISP1_CIF_ISP_FLT_LUM_WEIGHT_RESERVED		0xFFF80000
+
+#define RKISP1_CIF_ISP_CTK_COEFF_RESERVED		0xFFFFF800
+#define RKISP1_CIF_ISP_XTALK_OFFSET_RESERVED		0xFFFFF000
+
+/* GOC */
+#define RKISP1_CIF_ISP_GAMMA_OUT_MODE_EQU		BIT(0)
+#define RKISP1_CIF_ISP_GOC_MODE_MAX			1
+#define RKISP1_CIF_ISP_GOC_RESERVED			0xFFFFF800
+/* ISP_CTRL BIT 11*/
+#define RKISP1_CIF_ISP_CTRL_ISP_GAMMA_OUT_ENA_READ(x)	(((x) >> 11) & 1)
+
+/* DPCC */
+/* ISP_DPCC_MODE */
+#define RKISP1_CIF_ISP_DPCC_ENA				BIT(0)
+#define RKISP1_CIF_ISP_DPCC_MODE_MAX			0x07
+#define RKISP1_CIF_ISP_DPCC_OUTPUTMODE_MAX		0x0F
+#define RKISP1_CIF_ISP_DPCC_SETUSE_MAX			0x0F
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_RESERVED	0xFFFFE000
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_RESERVED	0xFFFF0000
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_RESERVED	0xFFFFC0C0
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_RESERVED		0xFFFFC0C0
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_RESERVED		0xFFFF0000
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_RESERVED		0xFFFFC0C0
+#define RKISP1_CIF_ISP_DPCC_RO_LIMIT_RESERVED		0xFFFFF000
+#define RKISP1_CIF_ISP_DPCC_RND_OFFS_RESERVED		0xFFFFF000
+
+/* BLS */
+/* ISP_BLS_CTRL */
+#define RKISP1_CIF_ISP_BLS_ENA				BIT(0)
+#define RKISP1_CIF_ISP_BLS_MODE_MEASURED		BIT(1)
+#define RKISP1_CIF_ISP_BLS_MODE_FIXED			0
+#define RKISP1_CIF_ISP_BLS_WINDOW_1			BIT(2)
+#define RKISP1_CIF_ISP_BLS_WINDOW_2			(2 << 2)
+
+/* GAMMA-IN */
+#define RKISP1_CIFISP_DEGAMMA_X_RESERVED	\
+	((1 << 31) | (1 << 27) | (1 << 23) | (1 << 19) |\
+	(1 << 15) | (1 << 11) | (1 << 7) | (1 << 3))
+#define RKISP1_CIFISP_DEGAMMA_Y_RESERVED		0xFFFFF000
+
+/* AFM */
+#define RKISP1_CIF_ISP_AFM_ENA				BIT(0)
+#define RKISP1_CIF_ISP_AFM_THRES_RESERVED		0xFFFF0000
+#define RKISP1_CIF_ISP_AFM_VAR_SHIFT_RESERVED		0xFFF8FFF8
+#define RKISP1_CIF_ISP_AFM_WINDOW_X_RESERVED		0xE000
+#define RKISP1_CIF_ISP_AFM_WINDOW_Y_RESERVED		0xF000
+#define RKISP1_CIF_ISP_AFM_WINDOW_X_MIN			0x5
+#define RKISP1_CIF_ISP_AFM_WINDOW_Y_MIN			0x2
+#define RKISP1_CIF_ISP_AFM_WINDOW_X(x)			(((x) & 0x1FFF) << 16)
+#define RKISP1_CIF_ISP_AFM_WINDOW_Y(x)			((x) & 0x1FFF)
+
+/* DPF */
+#define RKISP1_CIF_ISP_DPF_MODE_EN			BIT(0)
+#define RKISP1_CIF_ISP_DPF_MODE_B_FLT_DIS		BIT(1)
+#define RKISP1_CIF_ISP_DPF_MODE_GB_FLT_DIS		BIT(2)
+#define RKISP1_CIF_ISP_DPF_MODE_GR_FLT_DIS		BIT(3)
+#define RKISP1_CIF_ISP_DPF_MODE_R_FLT_DIS		BIT(4)
+#define RKISP1_CIF_ISP_DPF_MODE_RB_FLTSIZE_9x9		BIT(5)
+#define RKISP1_CIF_ISP_DPF_MODE_NLL_SEGMENTATION	BIT(6)
+#define RKISP1_CIF_ISP_DPF_MODE_AWB_GAIN_COMP		BIT(7)
+#define RKISP1_CIF_ISP_DPF_MODE_LSC_GAIN_COMP		BIT(8)
+#define RKISP1_CIF_ISP_DPF_MODE_USE_NF_GAIN		BIT(9)
+#define RKISP1_CIF_ISP_DPF_NF_GAIN_RESERVED		0xFFFFF000
+#define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1F
+#define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3FF
+
+/* =================================================================== */
+/*                            CIF Registers                            */
+/* =================================================================== */
+#define RKISP1_CIF_CTRL_BASE			0x00000000
+#define RKISP1_CIF_CCL				(RKISP1_CIF_CTRL_BASE + 0x00000000)
+#define RKISP1_CIF_VI_ID			(RKISP1_CIF_CTRL_BASE + 0x00000008)
+#define RKISP1_CIF_ICCL				(RKISP1_CIF_CTRL_BASE + 0x00000010)
+#define RKISP1_CIF_IRCL				(RKISP1_CIF_CTRL_BASE + 0x00000014)
+#define RKISP1_CIF_VI_DPCL			(RKISP1_CIF_CTRL_BASE + 0x00000018)
+
+#define RKISP1_CIF_IMG_EFF_BASE			0x00000200
+#define RKISP1_CIF_IMG_EFF_CTRL			(RKISP1_CIF_IMG_EFF_BASE + 0x00000000)
+#define RKISP1_CIF_IMG_EFF_COLOR_SEL		(RKISP1_CIF_IMG_EFF_BASE + 0x00000004)
+#define RKISP1_CIF_IMG_EFF_MAT_1		(RKISP1_CIF_IMG_EFF_BASE + 0x00000008)
+#define RKISP1_CIF_IMG_EFF_MAT_2		(RKISP1_CIF_IMG_EFF_BASE + 0x0000000C)
+#define RKISP1_CIF_IMG_EFF_MAT_3		(RKISP1_CIF_IMG_EFF_BASE + 0x00000010)
+#define RKISP1_CIF_IMG_EFF_MAT_4		(RKISP1_CIF_IMG_EFF_BASE + 0x00000014)
+#define RKISP1_CIF_IMG_EFF_MAT_5		(RKISP1_CIF_IMG_EFF_BASE + 0x00000018)
+#define RKISP1_CIF_IMG_EFF_TINT			(RKISP1_CIF_IMG_EFF_BASE + 0x0000001C)
+#define RKISP1_CIF_IMG_EFF_CTRL_SHD		(RKISP1_CIF_IMG_EFF_BASE + 0x00000020)
+#define RKISP1_CIF_IMG_EFF_SHARPEN		(RKISP1_CIF_IMG_EFF_BASE + 0x00000024)
+
+#define RKISP1_CIF_SUPER_IMP_BASE		0x00000300
+#define RKISP1_CIF_SUPER_IMP_CTRL		(RKISP1_CIF_SUPER_IMP_BASE + 0x00000000)
+#define RKISP1_CIF_SUPER_IMP_OFFSET_X		(RKISP1_CIF_SUPER_IMP_BASE + 0x00000004)
+#define RKISP1_CIF_SUPER_IMP_OFFSET_Y		(RKISP1_CIF_SUPER_IMP_BASE + 0x00000008)
+#define RKISP1_CIF_SUPER_IMP_COLOR_Y		(RKISP1_CIF_SUPER_IMP_BASE + 0x0000000C)
+#define RKISP1_CIF_SUPER_IMP_COLOR_CB		(RKISP1_CIF_SUPER_IMP_BASE + 0x00000010)
+#define RKISP1_CIF_SUPER_IMP_COLOR_CR		(RKISP1_CIF_SUPER_IMP_BASE + 0x00000014)
+
+#define RKISP1_CIF_ISP_BASE			0x00000400
+#define RKISP1_CIF_ISP_CTRL			(RKISP1_CIF_ISP_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_ACQ_PROP			(RKISP1_CIF_ISP_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_ACQ_H_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_ACQ_V_OFFS		(RKISP1_CIF_ISP_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_ACQ_H_SIZE		(RKISP1_CIF_ISP_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_ACQ_V_SIZE		(RKISP1_CIF_ISP_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_ACQ_NR_FRAMES		(RKISP1_CIF_ISP_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_GAMMA_DX_LO		(RKISP1_CIF_ISP_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_GAMMA_DX_HI		(RKISP1_CIF_ISP_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_GAMMA_R_Y0		(RKISP1_CIF_ISP_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_GAMMA_R_Y1		(RKISP1_CIF_ISP_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_GAMMA_R_Y2		(RKISP1_CIF_ISP_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_GAMMA_R_Y3		(RKISP1_CIF_ISP_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_GAMMA_R_Y4		(RKISP1_CIF_ISP_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_GAMMA_R_Y5		(RKISP1_CIF_ISP_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_GAMMA_R_Y6		(RKISP1_CIF_ISP_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_GAMMA_R_Y7		(RKISP1_CIF_ISP_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_GAMMA_R_Y8		(RKISP1_CIF_ISP_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_GAMMA_R_Y9		(RKISP1_CIF_ISP_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_GAMMA_R_Y10		(RKISP1_CIF_ISP_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_GAMMA_R_Y11		(RKISP1_CIF_ISP_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_GAMMA_R_Y12		(RKISP1_CIF_ISP_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_GAMMA_R_Y13		(RKISP1_CIF_ISP_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_GAMMA_R_Y14		(RKISP1_CIF_ISP_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_GAMMA_R_Y15		(RKISP1_CIF_ISP_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_GAMMA_R_Y16		(RKISP1_CIF_ISP_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_GAMMA_G_Y0		(RKISP1_CIF_ISP_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_GAMMA_G_Y1		(RKISP1_CIF_ISP_BASE + 0x0000006C)
+#define RKISP1_CIF_ISP_GAMMA_G_Y2		(RKISP1_CIF_ISP_BASE + 0x00000070)
+#define RKISP1_CIF_ISP_GAMMA_G_Y3		(RKISP1_CIF_ISP_BASE + 0x00000074)
+#define RKISP1_CIF_ISP_GAMMA_G_Y4		(RKISP1_CIF_ISP_BASE + 0x00000078)
+#define RKISP1_CIF_ISP_GAMMA_G_Y5		(RKISP1_CIF_ISP_BASE + 0x0000007C)
+#define RKISP1_CIF_ISP_GAMMA_G_Y6		(RKISP1_CIF_ISP_BASE + 0x00000080)
+#define RKISP1_CIF_ISP_GAMMA_G_Y7		(RKISP1_CIF_ISP_BASE + 0x00000084)
+#define RKISP1_CIF_ISP_GAMMA_G_Y8		(RKISP1_CIF_ISP_BASE + 0x00000088)
+#define RKISP1_CIF_ISP_GAMMA_G_Y9		(RKISP1_CIF_ISP_BASE + 0x0000008C)
+#define RKISP1_CIF_ISP_GAMMA_G_Y10		(RKISP1_CIF_ISP_BASE + 0x00000090)
+#define RKISP1_CIF_ISP_GAMMA_G_Y11		(RKISP1_CIF_ISP_BASE + 0x00000094)
+#define RKISP1_CIF_ISP_GAMMA_G_Y12		(RKISP1_CIF_ISP_BASE + 0x00000098)
+#define RKISP1_CIF_ISP_GAMMA_G_Y13		(RKISP1_CIF_ISP_BASE + 0x0000009C)
+#define RKISP1_CIF_ISP_GAMMA_G_Y14		(RKISP1_CIF_ISP_BASE + 0x000000A0)
+#define RKISP1_CIF_ISP_GAMMA_G_Y15		(RKISP1_CIF_ISP_BASE + 0x000000A4)
+#define RKISP1_CIF_ISP_GAMMA_G_Y16		(RKISP1_CIF_ISP_BASE + 0x000000A8)
+#define RKISP1_CIF_ISP_GAMMA_B_Y0		(RKISP1_CIF_ISP_BASE + 0x000000AC)
+#define RKISP1_CIF_ISP_GAMMA_B_Y1		(RKISP1_CIF_ISP_BASE + 0x000000B0)
+#define RKISP1_CIF_ISP_GAMMA_B_Y2		(RKISP1_CIF_ISP_BASE + 0x000000B4)
+#define RKISP1_CIF_ISP_GAMMA_B_Y3		(RKISP1_CIF_ISP_BASE + 0x000000B8)
+#define RKISP1_CIF_ISP_GAMMA_B_Y4		(RKISP1_CIF_ISP_BASE + 0x000000BC)
+#define RKISP1_CIF_ISP_GAMMA_B_Y5		(RKISP1_CIF_ISP_BASE + 0x000000C0)
+#define RKISP1_CIF_ISP_GAMMA_B_Y6		(RKISP1_CIF_ISP_BASE + 0x000000C4)
+#define RKISP1_CIF_ISP_GAMMA_B_Y7		(RKISP1_CIF_ISP_BASE + 0x000000C8)
+#define RKISP1_CIF_ISP_GAMMA_B_Y8		(RKISP1_CIF_ISP_BASE + 0x000000CC)
+#define RKISP1_CIF_ISP_GAMMA_B_Y9		(RKISP1_CIF_ISP_BASE + 0x000000D0)
+#define RKISP1_CIF_ISP_GAMMA_B_Y10		(RKISP1_CIF_ISP_BASE + 0x000000D4)
+#define RKISP1_CIF_ISP_GAMMA_B_Y11		(RKISP1_CIF_ISP_BASE + 0x000000D8)
+#define RKISP1_CIF_ISP_GAMMA_B_Y12		(RKISP1_CIF_ISP_BASE + 0x000000DC)
+#define RKISP1_CIF_ISP_GAMMA_B_Y13		(RKISP1_CIF_ISP_BASE + 0x000000E0)
+#define RKISP1_CIF_ISP_GAMMA_B_Y14		(RKISP1_CIF_ISP_BASE + 0x000000E4)
+#define RKISP1_CIF_ISP_GAMMA_B_Y15		(RKISP1_CIF_ISP_BASE + 0x000000E8)
+#define RKISP1_CIF_ISP_GAMMA_B_Y16		(RKISP1_CIF_ISP_BASE + 0x000000EC)
+#define RKISP1_CIF_ISP_AWB_PROP			(RKISP1_CIF_ISP_BASE + 0x00000110)
+#define RKISP1_CIF_ISP_AWB_WND_H_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000114)
+#define RKISP1_CIF_ISP_AWB_WND_V_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000118)
+#define RKISP1_CIF_ISP_AWB_WND_H_SIZE		(RKISP1_CIF_ISP_BASE + 0x0000011C)
+#define RKISP1_CIF_ISP_AWB_WND_V_SIZE		(RKISP1_CIF_ISP_BASE + 0x00000120)
+#define RKISP1_CIF_ISP_AWB_FRAMES		(RKISP1_CIF_ISP_BASE + 0x00000124)
+#define RKISP1_CIF_ISP_AWB_REF			(RKISP1_CIF_ISP_BASE + 0x00000128)
+#define RKISP1_CIF_ISP_AWB_THRESH		(RKISP1_CIF_ISP_BASE + 0x0000012C)
+#define RKISP1_CIF_ISP_AWB_GAIN_G		(RKISP1_CIF_ISP_BASE + 0x00000138)
+#define RKISP1_CIF_ISP_AWB_GAIN_RB		(RKISP1_CIF_ISP_BASE + 0x0000013C)
+#define RKISP1_CIF_ISP_AWB_WHITE_CNT		(RKISP1_CIF_ISP_BASE + 0x00000140)
+#define RKISP1_CIF_ISP_AWB_MEAN			(RKISP1_CIF_ISP_BASE + 0x00000144)
+#define RKISP1_CIF_ISP_CC_COEFF_0		(RKISP1_CIF_ISP_BASE + 0x00000170)
+#define RKISP1_CIF_ISP_CC_COEFF_1		(RKISP1_CIF_ISP_BASE + 0x00000174)
+#define RKISP1_CIF_ISP_CC_COEFF_2		(RKISP1_CIF_ISP_BASE + 0x00000178)
+#define RKISP1_CIF_ISP_CC_COEFF_3		(RKISP1_CIF_ISP_BASE + 0x0000017C)
+#define RKISP1_CIF_ISP_CC_COEFF_4		(RKISP1_CIF_ISP_BASE + 0x00000180)
+#define RKISP1_CIF_ISP_CC_COEFF_5		(RKISP1_CIF_ISP_BASE + 0x00000184)
+#define RKISP1_CIF_ISP_CC_COEFF_6		(RKISP1_CIF_ISP_BASE + 0x00000188)
+#define RKISP1_CIF_ISP_CC_COEFF_7		(RKISP1_CIF_ISP_BASE + 0x0000018C)
+#define RKISP1_CIF_ISP_CC_COEFF_8		(RKISP1_CIF_ISP_BASE + 0x00000190)
+#define RKISP1_CIF_ISP_OUT_H_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000194)
+#define RKISP1_CIF_ISP_OUT_V_OFFS		(RKISP1_CIF_ISP_BASE + 0x00000198)
+#define RKISP1_CIF_ISP_OUT_H_SIZE		(RKISP1_CIF_ISP_BASE + 0x0000019C)
+#define RKISP1_CIF_ISP_OUT_V_SIZE		(RKISP1_CIF_ISP_BASE + 0x000001A0)
+#define RKISP1_CIF_ISP_DEMOSAIC			(RKISP1_CIF_ISP_BASE + 0x000001A4)
+#define RKISP1_CIF_ISP_FLAGS_SHD		(RKISP1_CIF_ISP_BASE + 0x000001A8)
+#define RKISP1_CIF_ISP_OUT_H_OFFS_SHD		(RKISP1_CIF_ISP_BASE + 0x000001AC)
+#define RKISP1_CIF_ISP_OUT_V_OFFS_SHD		(RKISP1_CIF_ISP_BASE + 0x000001B0)
+#define RKISP1_CIF_ISP_OUT_H_SIZE_SHD		(RKISP1_CIF_ISP_BASE + 0x000001B4)
+#define RKISP1_CIF_ISP_OUT_V_SIZE_SHD		(RKISP1_CIF_ISP_BASE + 0x000001B8)
+#define RKISP1_CIF_ISP_IMSC			(RKISP1_CIF_ISP_BASE + 0x000001BC)
+#define RKISP1_CIF_ISP_RIS			(RKISP1_CIF_ISP_BASE + 0x000001C0)
+#define RKISP1_CIF_ISP_MIS			(RKISP1_CIF_ISP_BASE + 0x000001C4)
+#define RKISP1_CIF_ISP_ICR			(RKISP1_CIF_ISP_BASE + 0x000001C8)
+#define RKISP1_CIF_ISP_ISR			(RKISP1_CIF_ISP_BASE + 0x000001CC)
+#define RKISP1_CIF_ISP_CT_COEFF_0		(RKISP1_CIF_ISP_BASE + 0x000001D0)
+#define RKISP1_CIF_ISP_CT_COEFF_1		(RKISP1_CIF_ISP_BASE + 0x000001D4)
+#define RKISP1_CIF_ISP_CT_COEFF_2		(RKISP1_CIF_ISP_BASE + 0x000001D8)
+#define RKISP1_CIF_ISP_CT_COEFF_3		(RKISP1_CIF_ISP_BASE + 0x000001DC)
+#define RKISP1_CIF_ISP_CT_COEFF_4		(RKISP1_CIF_ISP_BASE + 0x000001E0)
+#define RKISP1_CIF_ISP_CT_COEFF_5		(RKISP1_CIF_ISP_BASE + 0x000001E4)
+#define RKISP1_CIF_ISP_CT_COEFF_6		(RKISP1_CIF_ISP_BASE + 0x000001E8)
+#define RKISP1_CIF_ISP_CT_COEFF_7		(RKISP1_CIF_ISP_BASE + 0x000001EC)
+#define RKISP1_CIF_ISP_CT_COEFF_8		(RKISP1_CIF_ISP_BASE + 0x000001F0)
+#define RKISP1_CIF_ISP_GAMMA_OUT_MODE		(RKISP1_CIF_ISP_BASE + 0x000001F4)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_0		(RKISP1_CIF_ISP_BASE + 0x000001F8)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_1		(RKISP1_CIF_ISP_BASE + 0x000001FC)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_2		(RKISP1_CIF_ISP_BASE + 0x00000200)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_3		(RKISP1_CIF_ISP_BASE + 0x00000204)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_4		(RKISP1_CIF_ISP_BASE + 0x00000208)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_5		(RKISP1_CIF_ISP_BASE + 0x0000020C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_6		(RKISP1_CIF_ISP_BASE + 0x00000210)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_7		(RKISP1_CIF_ISP_BASE + 0x00000214)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_8		(RKISP1_CIF_ISP_BASE + 0x00000218)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_9		(RKISP1_CIF_ISP_BASE + 0x0000021C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_10		(RKISP1_CIF_ISP_BASE + 0x00000220)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_11		(RKISP1_CIF_ISP_BASE + 0x00000224)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_12		(RKISP1_CIF_ISP_BASE + 0x00000228)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_13		(RKISP1_CIF_ISP_BASE + 0x0000022C)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_14		(RKISP1_CIF_ISP_BASE + 0x00000230)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_15		(RKISP1_CIF_ISP_BASE + 0x00000234)
+#define RKISP1_CIF_ISP_GAMMA_OUT_Y_16		(RKISP1_CIF_ISP_BASE + 0x00000238)
+#define RKISP1_CIF_ISP_ERR			(RKISP1_CIF_ISP_BASE + 0x0000023C)
+#define RKISP1_CIF_ISP_ERR_CLR			(RKISP1_CIF_ISP_BASE + 0x00000240)
+#define RKISP1_CIF_ISP_FRAME_COUNT		(RKISP1_CIF_ISP_BASE + 0x00000244)
+#define RKISP1_CIF_ISP_CT_OFFSET_R		(RKISP1_CIF_ISP_BASE + 0x00000248)
+#define RKISP1_CIF_ISP_CT_OFFSET_G		(RKISP1_CIF_ISP_BASE + 0x0000024C)
+#define RKISP1_CIF_ISP_CT_OFFSET_B		(RKISP1_CIF_ISP_BASE + 0x00000250)
+
+#define RKISP1_CIF_ISP_FLASH_BASE		0x00000660
+#define RKISP1_CIF_ISP_FLASH_CMD		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_FLASH_CONFIG		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_FLASH_PREDIV		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_FLASH_DELAY		(RKISP1_CIF_ISP_FLASH_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_FLASH_TIME		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_FLASH_MAXP		(RKISP1_CIF_ISP_FLASH_BASE + 0x00000014)
+
+#define RKISP1_CIF_ISP_SH_BASE			0x00000680
+#define RKISP1_CIF_ISP_SH_CTRL			(RKISP1_CIF_ISP_SH_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_SH_PREDIV		(RKISP1_CIF_ISP_SH_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_SH_DELAY			(RKISP1_CIF_ISP_SH_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_SH_TIME			(RKISP1_CIF_ISP_SH_BASE + 0x0000000C)
+
+#define RKISP1_CIF_C_PROC_BASE			0x00000800
+#define RKISP1_CIF_C_PROC_CTRL			(RKISP1_CIF_C_PROC_BASE + 0x00000000)
+#define RKISP1_CIF_C_PROC_CONTRAST		(RKISP1_CIF_C_PROC_BASE + 0x00000004)
+#define RKISP1_CIF_C_PROC_BRIGHTNESS		(RKISP1_CIF_C_PROC_BASE + 0x00000008)
+#define RKISP1_CIF_C_PROC_SATURATION		(RKISP1_CIF_C_PROC_BASE + 0x0000000C)
+#define RKISP1_CIF_C_PROC_HUE			(RKISP1_CIF_C_PROC_BASE + 0x00000010)
+
+#define RKISP1_CIF_DUAL_CROP_BASE		0x00000880
+#define RKISP1_CIF_DUAL_CROP_CTRL		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000000)
+#define RKISP1_CIF_DUAL_CROP_M_H_OFFS		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000004)
+#define RKISP1_CIF_DUAL_CROP_M_V_OFFS		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000008)
+#define RKISP1_CIF_DUAL_CROP_M_H_SIZE		(RKISP1_CIF_DUAL_CROP_BASE + 0x0000000C)
+#define RKISP1_CIF_DUAL_CROP_M_V_SIZE		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000010)
+#define RKISP1_CIF_DUAL_CROP_S_H_OFFS		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000014)
+#define RKISP1_CIF_DUAL_CROP_S_V_OFFS		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000018)
+#define RKISP1_CIF_DUAL_CROP_S_H_SIZE		(RKISP1_CIF_DUAL_CROP_BASE + 0x0000001C)
+#define RKISP1_CIF_DUAL_CROP_S_V_SIZE		(RKISP1_CIF_DUAL_CROP_BASE + 0x00000020)
+#define RKISP1_CIF_DUAL_CROP_M_H_OFFS_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000024)
+#define RKISP1_CIF_DUAL_CROP_M_V_OFFS_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000028)
+#define RKISP1_CIF_DUAL_CROP_M_H_SIZE_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x0000002C)
+#define RKISP1_CIF_DUAL_CROP_M_V_SIZE_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000030)
+#define RKISP1_CIF_DUAL_CROP_S_H_OFFS_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000034)
+#define RKISP1_CIF_DUAL_CROP_S_V_OFFS_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000038)
+#define RKISP1_CIF_DUAL_CROP_S_H_SIZE_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x0000003C)
+#define RKISP1_CIF_DUAL_CROP_S_V_SIZE_SHD	(RKISP1_CIF_DUAL_CROP_BASE + 0x00000040)
+
+#define RKISP1_CIF_MRSZ_BASE			0x00000C00
+#define RKISP1_CIF_MRSZ_CTRL			(RKISP1_CIF_MRSZ_BASE + 0x00000000)
+#define RKISP1_CIF_MRSZ_SCALE_HY		(RKISP1_CIF_MRSZ_BASE + 0x00000004)
+#define RKISP1_CIF_MRSZ_SCALE_HCB		(RKISP1_CIF_MRSZ_BASE + 0x00000008)
+#define RKISP1_CIF_MRSZ_SCALE_HCR		(RKISP1_CIF_MRSZ_BASE + 0x0000000C)
+#define RKISP1_CIF_MRSZ_SCALE_VY		(RKISP1_CIF_MRSZ_BASE + 0x00000010)
+#define RKISP1_CIF_MRSZ_SCALE_VC		(RKISP1_CIF_MRSZ_BASE + 0x00000014)
+#define RKISP1_CIF_MRSZ_PHASE_HY		(RKISP1_CIF_MRSZ_BASE + 0x00000018)
+#define RKISP1_CIF_MRSZ_PHASE_HC		(RKISP1_CIF_MRSZ_BASE + 0x0000001C)
+#define RKISP1_CIF_MRSZ_PHASE_VY		(RKISP1_CIF_MRSZ_BASE + 0x00000020)
+#define RKISP1_CIF_MRSZ_PHASE_VC		(RKISP1_CIF_MRSZ_BASE + 0x00000024)
+#define RKISP1_CIF_MRSZ_SCALE_LUT_ADDR		(RKISP1_CIF_MRSZ_BASE + 0x00000028)
+#define RKISP1_CIF_MRSZ_SCALE_LUT		(RKISP1_CIF_MRSZ_BASE + 0x0000002C)
+#define RKISP1_CIF_MRSZ_CTRL_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000030)
+#define RKISP1_CIF_MRSZ_SCALE_HY_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000034)
+#define RKISP1_CIF_MRSZ_SCALE_HCB_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000038)
+#define RKISP1_CIF_MRSZ_SCALE_HCR_SHD		(RKISP1_CIF_MRSZ_BASE + 0x0000003C)
+#define RKISP1_CIF_MRSZ_SCALE_VY_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000040)
+#define RKISP1_CIF_MRSZ_SCALE_VC_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000044)
+#define RKISP1_CIF_MRSZ_PHASE_HY_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000048)
+#define RKISP1_CIF_MRSZ_PHASE_HC_SHD		(RKISP1_CIF_MRSZ_BASE + 0x0000004C)
+#define RKISP1_CIF_MRSZ_PHASE_VY_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000050)
+#define RKISP1_CIF_MRSZ_PHASE_VC_SHD		(RKISP1_CIF_MRSZ_BASE + 0x00000054)
+
+#define RKISP1_CIF_SRSZ_BASE			0x00001000
+#define RKISP1_CIF_SRSZ_CTRL			(RKISP1_CIF_SRSZ_BASE + 0x00000000)
+#define RKISP1_CIF_SRSZ_SCALE_HY		(RKISP1_CIF_SRSZ_BASE + 0x00000004)
+#define RKISP1_CIF_SRSZ_SCALE_HCB		(RKISP1_CIF_SRSZ_BASE + 0x00000008)
+#define RKISP1_CIF_SRSZ_SCALE_HCR		(RKISP1_CIF_SRSZ_BASE + 0x0000000C)
+#define RKISP1_CIF_SRSZ_SCALE_VY		(RKISP1_CIF_SRSZ_BASE + 0x00000010)
+#define RKISP1_CIF_SRSZ_SCALE_VC		(RKISP1_CIF_SRSZ_BASE + 0x00000014)
+#define RKISP1_CIF_SRSZ_PHASE_HY		(RKISP1_CIF_SRSZ_BASE + 0x00000018)
+#define RKISP1_CIF_SRSZ_PHASE_HC		(RKISP1_CIF_SRSZ_BASE + 0x0000001C)
+#define RKISP1_CIF_SRSZ_PHASE_VY		(RKISP1_CIF_SRSZ_BASE + 0x00000020)
+#define RKISP1_CIF_SRSZ_PHASE_VC		(RKISP1_CIF_SRSZ_BASE + 0x00000024)
+#define RKISP1_CIF_SRSZ_SCALE_LUT_ADDR		(RKISP1_CIF_SRSZ_BASE + 0x00000028)
+#define RKISP1_CIF_SRSZ_SCALE_LUT		(RKISP1_CIF_SRSZ_BASE + 0x0000002C)
+#define RKISP1_CIF_SRSZ_CTRL_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000030)
+#define RKISP1_CIF_SRSZ_SCALE_HY_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000034)
+#define RKISP1_CIF_SRSZ_SCALE_HCB_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000038)
+#define RKISP1_CIF_SRSZ_SCALE_HCR_SHD		(RKISP1_CIF_SRSZ_BASE + 0x0000003C)
+#define RKISP1_CIF_SRSZ_SCALE_VY_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000040)
+#define RKISP1_CIF_SRSZ_SCALE_VC_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000044)
+#define RKISP1_CIF_SRSZ_PHASE_HY_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000048)
+#define RKISP1_CIF_SRSZ_PHASE_HC_SHD		(RKISP1_CIF_SRSZ_BASE + 0x0000004C)
+#define RKISP1_CIF_SRSZ_PHASE_VY_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000050)
+#define RKISP1_CIF_SRSZ_PHASE_VC_SHD		(RKISP1_CIF_SRSZ_BASE + 0x00000054)
+
+#define RKISP1_CIF_MI_BASE			0x00001400
+#define RKISP1_CIF_MI_CTRL			(RKISP1_CIF_MI_BASE + 0x00000000)
+#define RKISP1_CIF_MI_INIT			(RKISP1_CIF_MI_BASE + 0x00000004)
+#define RKISP1_CIF_MI_MP_Y_BASE_AD_INIT		(RKISP1_CIF_MI_BASE + 0x00000008)
+#define RKISP1_CIF_MI_MP_Y_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x0000000C)
+#define RKISP1_CIF_MI_MP_Y_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000010)
+#define RKISP1_CIF_MI_MP_Y_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x00000014)
+#define RKISP1_CIF_MI_MP_Y_IRQ_OFFS_INIT	(RKISP1_CIF_MI_BASE + 0x00000018)
+#define RKISP1_CIF_MI_MP_CB_BASE_AD_INIT	(RKISP1_CIF_MI_BASE + 0x0000001C)
+#define RKISP1_CIF_MI_MP_CB_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x00000020)
+#define RKISP1_CIF_MI_MP_CB_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000024)
+#define RKISP1_CIF_MI_MP_CB_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x00000028)
+#define RKISP1_CIF_MI_MP_CR_BASE_AD_INIT	(RKISP1_CIF_MI_BASE + 0x0000002C)
+#define RKISP1_CIF_MI_MP_CR_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x00000030)
+#define RKISP1_CIF_MI_MP_CR_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000034)
+#define RKISP1_CIF_MI_MP_CR_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x00000038)
+#define RKISP1_CIF_MI_SP_Y_BASE_AD_INIT		(RKISP1_CIF_MI_BASE + 0x0000003C)
+#define RKISP1_CIF_MI_SP_Y_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x00000040)
+#define RKISP1_CIF_MI_SP_Y_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000044)
+#define RKISP1_CIF_MI_SP_Y_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x00000048)
+#define RKISP1_CIF_MI_SP_Y_LLENGTH		(RKISP1_CIF_MI_BASE + 0x0000004C)
+#define RKISP1_CIF_MI_SP_CB_BASE_AD_INIT	(RKISP1_CIF_MI_BASE + 0x00000050)
+#define RKISP1_CIF_MI_SP_CB_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x00000054)
+#define RKISP1_CIF_MI_SP_CB_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000058)
+#define RKISP1_CIF_MI_SP_CB_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x0000005C)
+#define RKISP1_CIF_MI_SP_CR_BASE_AD_INIT	(RKISP1_CIF_MI_BASE + 0x00000060)
+#define RKISP1_CIF_MI_SP_CR_SIZE_INIT		(RKISP1_CIF_MI_BASE + 0x00000064)
+#define RKISP1_CIF_MI_SP_CR_OFFS_CNT_INIT	(RKISP1_CIF_MI_BASE + 0x00000068)
+#define RKISP1_CIF_MI_SP_CR_OFFS_CNT_START	(RKISP1_CIF_MI_BASE + 0x0000006C)
+#define RKISP1_CIF_MI_BYTE_CNT			(RKISP1_CIF_MI_BASE + 0x00000070)
+#define RKISP1_CIF_MI_CTRL_SHD			(RKISP1_CIF_MI_BASE + 0x00000074)
+#define RKISP1_CIF_MI_MP_Y_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x00000078)
+#define RKISP1_CIF_MI_MP_Y_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x0000007C)
+#define RKISP1_CIF_MI_MP_Y_OFFS_CNT_SHD		(RKISP1_CIF_MI_BASE + 0x00000080)
+#define RKISP1_CIF_MI_MP_Y_IRQ_OFFS_SHD		(RKISP1_CIF_MI_BASE + 0x00000084)
+#define RKISP1_CIF_MI_MP_CB_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x00000088)
+#define RKISP1_CIF_MI_MP_CB_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x0000008C)
+#define RKISP1_CIF_MI_MP_CB_OFFS_CNT_SHD	(RKISP1_CIF_MI_BASE + 0x00000090)
+#define RKISP1_CIF_MI_MP_CR_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x00000094)
+#define RKISP1_CIF_MI_MP_CR_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x00000098)
+#define RKISP1_CIF_MI_MP_CR_OFFS_CNT_SHD	(RKISP1_CIF_MI_BASE + 0x0000009C)
+#define RKISP1_CIF_MI_SP_Y_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x000000A0)
+#define RKISP1_CIF_MI_SP_Y_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x000000A4)
+#define RKISP1_CIF_MI_SP_Y_OFFS_CNT_SHD		(RKISP1_CIF_MI_BASE + 0x000000A8)
+#define RKISP1_CIF_MI_SP_CB_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x000000B0)
+#define RKISP1_CIF_MI_SP_CB_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x000000B4)
+#define RKISP1_CIF_MI_SP_CB_OFFS_CNT_SHD	(RKISP1_CIF_MI_BASE + 0x000000B8)
+#define RKISP1_CIF_MI_SP_CR_BASE_AD_SHD		(RKISP1_CIF_MI_BASE + 0x000000BC)
+#define RKISP1_CIF_MI_SP_CR_SIZE_SHD		(RKISP1_CIF_MI_BASE + 0x000000C0)
+#define RKISP1_CIF_MI_SP_CR_OFFS_CNT_SHD	(RKISP1_CIF_MI_BASE + 0x000000C4)
+#define RKISP1_CIF_MI_DMA_Y_PIC_START_AD	(RKISP1_CIF_MI_BASE + 0x000000C8)
+#define RKISP1_CIF_MI_DMA_Y_PIC_WIDTH		(RKISP1_CIF_MI_BASE + 0x000000CC)
+#define RKISP1_CIF_MI_DMA_Y_LLENGTH		(RKISP1_CIF_MI_BASE + 0x000000D0)
+#define RKISP1_CIF_MI_DMA_Y_PIC_SIZE		(RKISP1_CIF_MI_BASE + 0x000000D4)
+#define RKISP1_CIF_MI_DMA_CB_PIC_START_AD	(RKISP1_CIF_MI_BASE + 0x000000D8)
+#define RKISP1_CIF_MI_DMA_CR_PIC_START_AD	(RKISP1_CIF_MI_BASE + 0x000000E8)
+#define RKISP1_CIF_MI_IMSC			(RKISP1_CIF_MI_BASE + 0x000000F8)
+#define RKISP1_CIF_MI_RIS			(RKISP1_CIF_MI_BASE + 0x000000FC)
+#define RKISP1_CIF_MI_MIS			(RKISP1_CIF_MI_BASE + 0x00000100)
+#define RKISP1_CIF_MI_ICR			(RKISP1_CIF_MI_BASE + 0x00000104)
+#define RKISP1_CIF_MI_ISR			(RKISP1_CIF_MI_BASE + 0x00000108)
+#define RKISP1_CIF_MI_STATUS			(RKISP1_CIF_MI_BASE + 0x0000010C)
+#define RKISP1_CIF_MI_STATUS_CLR		(RKISP1_CIF_MI_BASE + 0x00000110)
+#define RKISP1_CIF_MI_SP_Y_PIC_WIDTH		(RKISP1_CIF_MI_BASE + 0x00000114)
+#define RKISP1_CIF_MI_SP_Y_PIC_HEIGHT		(RKISP1_CIF_MI_BASE + 0x00000118)
+#define RKISP1_CIF_MI_SP_Y_PIC_SIZE		(RKISP1_CIF_MI_BASE + 0x0000011C)
+#define RKISP1_CIF_MI_DMA_CTRL			(RKISP1_CIF_MI_BASE + 0x00000120)
+#define RKISP1_CIF_MI_DMA_START			(RKISP1_CIF_MI_BASE + 0x00000124)
+#define RKISP1_CIF_MI_DMA_STATUS		(RKISP1_CIF_MI_BASE + 0x00000128)
+#define RKISP1_CIF_MI_PIXEL_COUNT		(RKISP1_CIF_MI_BASE + 0x0000012C)
+#define RKISP1_CIF_MI_MP_Y_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000130)
+#define RKISP1_CIF_MI_MP_CB_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000134)
+#define RKISP1_CIF_MI_MP_CR_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000138)
+#define RKISP1_CIF_MI_SP_Y_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x0000013C)
+#define RKISP1_CIF_MI_SP_CB_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000140)
+#define RKISP1_CIF_MI_SP_CR_BASE_AD_INIT2	(RKISP1_CIF_MI_BASE + 0x00000144)
+#define RKISP1_CIF_MI_XTD_FORMAT_CTRL		(RKISP1_CIF_MI_BASE + 0x00000148)
+
+#define RKISP1_CIF_SMIA_BASE			0x00001A00
+#define RKISP1_CIF_SMIA_CTRL			(RKISP1_CIF_SMIA_BASE + 0x00000000)
+#define RKISP1_CIF_SMIA_STATUS			(RKISP1_CIF_SMIA_BASE + 0x00000004)
+#define RKISP1_CIF_SMIA_IMSC			(RKISP1_CIF_SMIA_BASE + 0x00000008)
+#define RKISP1_CIF_SMIA_RIS			(RKISP1_CIF_SMIA_BASE + 0x0000000C)
+#define RKISP1_CIF_SMIA_MIS			(RKISP1_CIF_SMIA_BASE + 0x00000010)
+#define RKISP1_CIF_SMIA_ICR			(RKISP1_CIF_SMIA_BASE + 0x00000014)
+#define RKISP1_CIF_SMIA_ISR			(RKISP1_CIF_SMIA_BASE + 0x00000018)
+#define RKISP1_CIF_SMIA_DATA_FORMAT_SEL		(RKISP1_CIF_SMIA_BASE + 0x0000001C)
+#define RKISP1_CIF_SMIA_SOF_EMB_DATA_LINES	(RKISP1_CIF_SMIA_BASE + 0x00000020)
+#define RKISP1_CIF_SMIA_EMB_HSTART		(RKISP1_CIF_SMIA_BASE + 0x00000024)
+#define RKISP1_CIF_SMIA_EMB_HSIZE		(RKISP1_CIF_SMIA_BASE + 0x00000028)
+#define RKISP1_CIF_SMIA_EMB_VSTART		(RKISP1_CIF_SMIA_BASE + 0x0000002c)
+#define RKISP1_CIF_SMIA_NUM_LINES		(RKISP1_CIF_SMIA_BASE + 0x00000030)
+#define RKISP1_CIF_SMIA_EMB_DATA_FIFO		(RKISP1_CIF_SMIA_BASE + 0x00000034)
+#define RKISP1_CIF_SMIA_EMB_DATA_WATERMARK	(RKISP1_CIF_SMIA_BASE + 0x00000038)
+
+#define RKISP1_CIF_MIPI_BASE			0x00001C00
+#define RKISP1_CIF_MIPI_CTRL			(RKISP1_CIF_MIPI_BASE + 0x00000000)
+#define RKISP1_CIF_MIPI_STATUS			(RKISP1_CIF_MIPI_BASE + 0x00000004)
+#define RKISP1_CIF_MIPI_IMSC			(RKISP1_CIF_MIPI_BASE + 0x00000008)
+#define RKISP1_CIF_MIPI_RIS			(RKISP1_CIF_MIPI_BASE + 0x0000000C)
+#define RKISP1_CIF_MIPI_MIS			(RKISP1_CIF_MIPI_BASE + 0x00000010)
+#define RKISP1_CIF_MIPI_ICR			(RKISP1_CIF_MIPI_BASE + 0x00000014)
+#define RKISP1_CIF_MIPI_ISR			(RKISP1_CIF_MIPI_BASE + 0x00000018)
+#define RKISP1_CIF_MIPI_CUR_DATA_ID		(RKISP1_CIF_MIPI_BASE + 0x0000001C)
+#define RKISP1_CIF_MIPI_IMG_DATA_SEL		(RKISP1_CIF_MIPI_BASE + 0x00000020)
+#define RKISP1_CIF_MIPI_ADD_DATA_SEL_1		(RKISP1_CIF_MIPI_BASE + 0x00000024)
+#define RKISP1_CIF_MIPI_ADD_DATA_SEL_2		(RKISP1_CIF_MIPI_BASE + 0x00000028)
+#define RKISP1_CIF_MIPI_ADD_DATA_SEL_3		(RKISP1_CIF_MIPI_BASE + 0x0000002C)
+#define RKISP1_CIF_MIPI_ADD_DATA_SEL_4		(RKISP1_CIF_MIPI_BASE + 0x00000030)
+#define RKISP1_CIF_MIPI_ADD_DATA_FIFO		(RKISP1_CIF_MIPI_BASE + 0x00000034)
+#define RKISP1_CIF_MIPI_FIFO_FILL_LEVEL		(RKISP1_CIF_MIPI_BASE + 0x00000038)
+#define RKISP1_CIF_MIPI_COMPRESSED_MODE		(RKISP1_CIF_MIPI_BASE + 0x0000003C)
+#define RKISP1_CIF_MIPI_FRAME			(RKISP1_CIF_MIPI_BASE + 0x00000040)
+#define RKISP1_CIF_MIPI_GEN_SHORT_DT		(RKISP1_CIF_MIPI_BASE + 0x00000044)
+#define RKISP1_CIF_MIPI_GEN_SHORT_8_9		(RKISP1_CIF_MIPI_BASE + 0x00000048)
+#define RKISP1_CIF_MIPI_GEN_SHORT_A_B		(RKISP1_CIF_MIPI_BASE + 0x0000004C)
+#define RKISP1_CIF_MIPI_GEN_SHORT_C_D		(RKISP1_CIF_MIPI_BASE + 0x00000050)
+#define RKISP1_CIF_MIPI_GEN_SHORT_E_F		(RKISP1_CIF_MIPI_BASE + 0x00000054)
+
+#define RKISP1_CIF_ISP_AFM_BASE			0x00002000
+#define RKISP1_CIF_ISP_AFM_CTRL			(RKISP1_CIF_ISP_AFM_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AFM_LT_A			(RKISP1_CIF_ISP_AFM_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_AFM_RB_A			(RKISP1_CIF_ISP_AFM_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_AFM_LT_B			(RKISP1_CIF_ISP_AFM_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_AFM_RB_B			(RKISP1_CIF_ISP_AFM_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_AFM_LT_C			(RKISP1_CIF_ISP_AFM_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_AFM_RB_C			(RKISP1_CIF_ISP_AFM_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_AFM_THRES		(RKISP1_CIF_ISP_AFM_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_AFM_VAR_SHIFT		(RKISP1_CIF_ISP_AFM_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_AFM_SUM_A		(RKISP1_CIF_ISP_AFM_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_AFM_SUM_B		(RKISP1_CIF_ISP_AFM_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_AFM_SUM_C		(RKISP1_CIF_ISP_AFM_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_AFM_LUM_A		(RKISP1_CIF_ISP_AFM_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_AFM_LUM_B		(RKISP1_CIF_ISP_AFM_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_AFM_LUM_C		(RKISP1_CIF_ISP_AFM_BASE + 0x00000038)
+
+#define RKISP1_CIF_ISP_LSC_BASE			0x00002200
+#define RKISP1_CIF_ISP_LSC_CTRL			(RKISP1_CIF_ISP_LSC_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_LSC_R_TABLE_ADDR		(RKISP1_CIF_ISP_LSC_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_LSC_GR_TABLE_ADDR	(RKISP1_CIF_ISP_LSC_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_LSC_B_TABLE_ADDR		(RKISP1_CIF_ISP_LSC_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_LSC_GB_TABLE_ADDR	(RKISP1_CIF_ISP_LSC_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_LSC_R_TABLE_DATA		(RKISP1_CIF_ISP_LSC_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_LSC_GR_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_LSC_B_TABLE_DATA		(RKISP1_CIF_ISP_LSC_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_LSC_GB_TABLE_DATA	(RKISP1_CIF_ISP_LSC_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_LSC_XGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_LSC_XGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_LSC_XGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_LSC_XGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_LSC_YGRAD_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_LSC_YGRAD_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_LSC_YGRAD_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_LSC_YGRAD_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_LSC_XSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_LSC_XSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_LSC_XSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_LSC_XSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_LSC_YSIZE_01		(RKISP1_CIF_ISP_LSC_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_LSC_YSIZE_23		(RKISP1_CIF_ISP_LSC_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_LSC_YSIZE_45		(RKISP1_CIF_ISP_LSC_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_LSC_YSIZE_67		(RKISP1_CIF_ISP_LSC_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_LSC_TABLE_SEL		(RKISP1_CIF_ISP_LSC_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_LSC_STATUS		(RKISP1_CIF_ISP_LSC_BASE + 0x00000068)
+
+#define RKISP1_CIF_ISP_IS_BASE			0x00002300
+#define RKISP1_CIF_ISP_IS_CTRL			(RKISP1_CIF_ISP_IS_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_IS_RECENTER		(RKISP1_CIF_ISP_IS_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_IS_H_OFFS		(RKISP1_CIF_ISP_IS_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_IS_V_OFFS		(RKISP1_CIF_ISP_IS_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_IS_H_SIZE		(RKISP1_CIF_ISP_IS_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_IS_V_SIZE		(RKISP1_CIF_ISP_IS_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_IS_MAX_DX		(RKISP1_CIF_ISP_IS_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_IS_MAX_DY		(RKISP1_CIF_ISP_IS_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_IS_DISPLACE		(RKISP1_CIF_ISP_IS_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_IS_H_OFFS_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_IS_V_OFFS_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_IS_H_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_IS_V_SIZE_SHD		(RKISP1_CIF_ISP_IS_BASE + 0x00000030)
+
+#define RKISP1_CIF_ISP_HIST_BASE		0x00002400
+
+#define RKISP1_CIF_ISP_HIST_PROP		(RKISP1_CIF_ISP_HIST_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_HIST_H_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_HIST_V_OFFS		(RKISP1_CIF_ISP_HIST_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_HIST_H_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_HIST_V_SIZE		(RKISP1_CIF_ISP_HIST_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_HIST_BIN_0		(RKISP1_CIF_ISP_HIST_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_HIST_BIN_1		(RKISP1_CIF_ISP_HIST_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_HIST_BIN_2		(RKISP1_CIF_ISP_HIST_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_HIST_BIN_3		(RKISP1_CIF_ISP_HIST_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_HIST_BIN_4		(RKISP1_CIF_ISP_HIST_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_HIST_BIN_5		(RKISP1_CIF_ISP_HIST_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_HIST_BIN_6		(RKISP1_CIF_ISP_HIST_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_HIST_BIN_7		(RKISP1_CIF_ISP_HIST_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_HIST_BIN_8		(RKISP1_CIF_ISP_HIST_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_HIST_BIN_9		(RKISP1_CIF_ISP_HIST_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_HIST_BIN_10		(RKISP1_CIF_ISP_HIST_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_HIST_BIN_11		(RKISP1_CIF_ISP_HIST_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_HIST_BIN_12		(RKISP1_CIF_ISP_HIST_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_HIST_BIN_13		(RKISP1_CIF_ISP_HIST_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_HIST_BIN_14		(RKISP1_CIF_ISP_HIST_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_HIST_BIN_15		(RKISP1_CIF_ISP_HIST_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_00TO30	(RKISP1_CIF_ISP_HIST_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_40TO21	(RKISP1_CIF_ISP_HIST_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_31TO12	(RKISP1_CIF_ISP_HIST_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_22TO03	(RKISP1_CIF_ISP_HIST_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_13TO43	(RKISP1_CIF_ISP_HIST_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_04TO34	(RKISP1_CIF_ISP_HIST_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_HIST_WEIGHT_44		(RKISP1_CIF_ISP_HIST_BASE + 0x0000006C)
+
+#define RKISP1_CIF_ISP_FILT_BASE		0x00002500
+#define RKISP1_CIF_ISP_FILT_MODE		(RKISP1_CIF_ISP_FILT_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_FILT_THRESH_BL0		(RKISP1_CIF_ISP_FILT_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_FILT_THRESH_BL1		(RKISP1_CIF_ISP_FILT_BASE + 0x0000002c)
+#define RKISP1_CIF_ISP_FILT_THRESH_SH0		(RKISP1_CIF_ISP_FILT_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_FILT_THRESH_SH1		(RKISP1_CIF_ISP_FILT_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_FILT_LUM_WEIGHT		(RKISP1_CIF_ISP_FILT_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_FILT_FAC_SH1		(RKISP1_CIF_ISP_FILT_BASE + 0x0000003c)
+#define RKISP1_CIF_ISP_FILT_FAC_SH0		(RKISP1_CIF_ISP_FILT_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_FILT_FAC_MID		(RKISP1_CIF_ISP_FILT_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_FILT_FAC_BL0		(RKISP1_CIF_ISP_FILT_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_FILT_FAC_BL1		(RKISP1_CIF_ISP_FILT_BASE + 0x0000004C)
+
+#define RKISP1_CIF_ISP_CAC_BASE			0x00002580
+#define RKISP1_CIF_ISP_CAC_CTRL			(RKISP1_CIF_ISP_CAC_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_CAC_COUNT_START		(RKISP1_CIF_ISP_CAC_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_CAC_A			(RKISP1_CIF_ISP_CAC_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_CAC_B			(RKISP1_CIF_ISP_CAC_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_CAC_C			(RKISP1_CIF_ISP_CAC_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_X_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_Y_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
+
+#define RKISP1_CIF_ISP_EXP_BASE			0x00002600
+#define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_EXP_H_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_EXP_V_OFFSET		(RKISP1_CIF_ISP_EXP_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_EXP_H_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_EXP_V_SIZE		(RKISP1_CIF_ISP_EXP_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_EXP_MEAN_00		(RKISP1_CIF_ISP_EXP_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_EXP_MEAN_10		(RKISP1_CIF_ISP_EXP_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_EXP_MEAN_20		(RKISP1_CIF_ISP_EXP_BASE + 0x0000001c)
+#define RKISP1_CIF_ISP_EXP_MEAN_30		(RKISP1_CIF_ISP_EXP_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_EXP_MEAN_40		(RKISP1_CIF_ISP_EXP_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_EXP_MEAN_01		(RKISP1_CIF_ISP_EXP_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_EXP_MEAN_11		(RKISP1_CIF_ISP_EXP_BASE + 0x0000002c)
+#define RKISP1_CIF_ISP_EXP_MEAN_21		(RKISP1_CIF_ISP_EXP_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_EXP_MEAN_31		(RKISP1_CIF_ISP_EXP_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_EXP_MEAN_41		(RKISP1_CIF_ISP_EXP_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_EXP_MEAN_02		(RKISP1_CIF_ISP_EXP_BASE + 0x0000003c)
+#define RKISP1_CIF_ISP_EXP_MEAN_12		(RKISP1_CIF_ISP_EXP_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_EXP_MEAN_22		(RKISP1_CIF_ISP_EXP_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_EXP_MEAN_32		(RKISP1_CIF_ISP_EXP_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_EXP_MEAN_42		(RKISP1_CIF_ISP_EXP_BASE + 0x0000004c)
+#define RKISP1_CIF_ISP_EXP_MEAN_03		(RKISP1_CIF_ISP_EXP_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_EXP_MEAN_13		(RKISP1_CIF_ISP_EXP_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_EXP_MEAN_23		(RKISP1_CIF_ISP_EXP_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_EXP_MEAN_33		(RKISP1_CIF_ISP_EXP_BASE + 0x0000005c)
+#define RKISP1_CIF_ISP_EXP_MEAN_43		(RKISP1_CIF_ISP_EXP_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_EXP_MEAN_04		(RKISP1_CIF_ISP_EXP_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_EXP_MEAN_14		(RKISP1_CIF_ISP_EXP_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_EXP_MEAN_24		(RKISP1_CIF_ISP_EXP_BASE + 0x0000006c)
+#define RKISP1_CIF_ISP_EXP_MEAN_34		(RKISP1_CIF_ISP_EXP_BASE + 0x00000070)
+#define RKISP1_CIF_ISP_EXP_MEAN_44		(RKISP1_CIF_ISP_EXP_BASE + 0x00000074)
+
+#define RKISP1_CIF_ISP_BLS_BASE			0x00002700
+#define RKISP1_CIF_ISP_BLS_CTRL			(RKISP1_CIF_ISP_BLS_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_BLS_SAMPLES		(RKISP1_CIF_ISP_BLS_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_BLS_H1_START		(RKISP1_CIF_ISP_BLS_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_BLS_H1_STOP		(RKISP1_CIF_ISP_BLS_BASE + 0x0000000c)
+#define RKISP1_CIF_ISP_BLS_V1_START		(RKISP1_CIF_ISP_BLS_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_BLS_V1_STOP		(RKISP1_CIF_ISP_BLS_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_BLS_H2_START		(RKISP1_CIF_ISP_BLS_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_BLS_H2_STOP		(RKISP1_CIF_ISP_BLS_BASE + 0x0000001c)
+#define RKISP1_CIF_ISP_BLS_V2_START		(RKISP1_CIF_ISP_BLS_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_BLS_V2_STOP		(RKISP1_CIF_ISP_BLS_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_BLS_A_FIXED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_BLS_B_FIXED		(RKISP1_CIF_ISP_BLS_BASE + 0x0000002c)
+#define RKISP1_CIF_ISP_BLS_C_FIXED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_BLS_D_FIXED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_BLS_A_MEASURED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_BLS_B_MEASURED		(RKISP1_CIF_ISP_BLS_BASE + 0x0000003c)
+#define RKISP1_CIF_ISP_BLS_C_MEASURED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_BLS_D_MEASURED		(RKISP1_CIF_ISP_BLS_BASE + 0x00000044)
+
+#define RKISP1_CIF_ISP_DPF_BASE			0x00002800
+#define RKISP1_CIF_ISP_DPF_MODE			(RKISP1_CIF_ISP_DPF_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_DPF_STRENGTH_R		(RKISP1_CIF_ISP_DPF_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_DPF_STRENGTH_G		(RKISP1_CIF_ISP_DPF_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_DPF_STRENGTH_B		(RKISP1_CIF_ISP_DPF_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_DPF_S_WEIGHT_G_1_4	(RKISP1_CIF_ISP_DPF_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_DPF_S_WEIGHT_G_5_6	(RKISP1_CIF_ISP_DPF_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_1_4	(RKISP1_CIF_ISP_DPF_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_DPF_S_WEIGHT_RB_5_6	(RKISP1_CIF_ISP_DPF_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_0		(RKISP1_CIF_ISP_DPF_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_1		(RKISP1_CIF_ISP_DPF_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_2		(RKISP1_CIF_ISP_DPF_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_3		(RKISP1_CIF_ISP_DPF_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_4		(RKISP1_CIF_ISP_DPF_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_5		(RKISP1_CIF_ISP_DPF_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_6		(RKISP1_CIF_ISP_DPF_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_7		(RKISP1_CIF_ISP_DPF_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_8		(RKISP1_CIF_ISP_DPF_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_9		(RKISP1_CIF_ISP_DPF_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_10	(RKISP1_CIF_ISP_DPF_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_11	(RKISP1_CIF_ISP_DPF_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_12	(RKISP1_CIF_ISP_DPF_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_13	(RKISP1_CIF_ISP_DPF_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_14	(RKISP1_CIF_ISP_DPF_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_15	(RKISP1_CIF_ISP_DPF_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_DPF_NULL_COEFF_16	(RKISP1_CIF_ISP_DPF_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_DPF_NF_GAIN_R		(RKISP1_CIF_ISP_DPF_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_DPF_NF_GAIN_GR		(RKISP1_CIF_ISP_DPF_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_DPF_NF_GAIN_GB		(RKISP1_CIF_ISP_DPF_BASE + 0x0000006C)
+#define RKISP1_CIF_ISP_DPF_NF_GAIN_B		(RKISP1_CIF_ISP_DPF_BASE + 0x00000070)
+
+#define RKISP1_CIF_ISP_DPCC_BASE		0x00002900
+#define RKISP1_CIF_ISP_DPCC_MODE		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_DPCC_OUTPUT_MODE		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_DPCC_SET_USE		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_1	(RKISP1_CIF_ISP_DPCC_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_2	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_DPCC_METHODS_SET_3	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_1	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_1	(RKISP1_CIF_ISP_DPCC_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_1		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_1	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_1		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_2	(RKISP1_CIF_ISP_DPCC_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_2	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_2		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_2	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_2		(RKISP1_CIF_ISP_DPCC_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_DPCC_LINE_THRESH_3	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_DPCC_LINE_MAD_FAC_3	(RKISP1_CIF_ISP_DPCC_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_DPCC_PG_FAC_3		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_DPCC_RND_THRESH_3	(RKISP1_CIF_ISP_DPCC_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_DPCC_RG_FAC_3		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_DPCC_RO_LIMITS		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_DPCC_RND_OFFS		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_DPCC_BPT_CTRL		(RKISP1_CIF_ISP_DPCC_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_DPCC_BPT_NUMBER		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_DPCC_BPT_ADDR		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_DPCC_BPT_DATA		(RKISP1_CIF_ISP_DPCC_BASE + 0x00000068)
+
+#define RKISP1_CIF_ISP_WDR_BASE			0x00002A00
+#define RKISP1_CIF_ISP_WDR_CTRL			(RKISP1_CIF_ISP_WDR_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_1		(RKISP1_CIF_ISP_WDR_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_2		(RKISP1_CIF_ISP_WDR_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_3		(RKISP1_CIF_ISP_WDR_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_4		(RKISP1_CIF_ISP_WDR_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0	(RKISP1_CIF_ISP_WDR_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1	(RKISP1_CIF_ISP_WDR_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2	(RKISP1_CIF_ISP_WDR_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3	(RKISP1_CIF_ISP_WDR_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4	(RKISP1_CIF_ISP_WDR_BASE + 0x00000024)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5	(RKISP1_CIF_ISP_WDR_BASE + 0x00000028)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6	(RKISP1_CIF_ISP_WDR_BASE + 0x0000002C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7	(RKISP1_CIF_ISP_WDR_BASE + 0x00000030)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8	(RKISP1_CIF_ISP_WDR_BASE + 0x00000034)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9	(RKISP1_CIF_ISP_WDR_BASE + 0x00000038)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10	(RKISP1_CIF_ISP_WDR_BASE + 0x0000003C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11	(RKISP1_CIF_ISP_WDR_BASE + 0x00000040)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12	(RKISP1_CIF_ISP_WDR_BASE + 0x00000044)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13	(RKISP1_CIF_ISP_WDR_BASE + 0x00000048)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14	(RKISP1_CIF_ISP_WDR_BASE + 0x0000004C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15	(RKISP1_CIF_ISP_WDR_BASE + 0x00000050)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16	(RKISP1_CIF_ISP_WDR_BASE + 0x00000054)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17	(RKISP1_CIF_ISP_WDR_BASE + 0x00000058)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18	(RKISP1_CIF_ISP_WDR_BASE + 0x0000005C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19	(RKISP1_CIF_ISP_WDR_BASE + 0x00000060)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20	(RKISP1_CIF_ISP_WDR_BASE + 0x00000064)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21	(RKISP1_CIF_ISP_WDR_BASE + 0x00000068)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22	(RKISP1_CIF_ISP_WDR_BASE + 0x0000006C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23	(RKISP1_CIF_ISP_WDR_BASE + 0x00000070)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24	(RKISP1_CIF_ISP_WDR_BASE + 0x00000074)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25	(RKISP1_CIF_ISP_WDR_BASE + 0x00000078)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26	(RKISP1_CIF_ISP_WDR_BASE + 0x0000007C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27	(RKISP1_CIF_ISP_WDR_BASE + 0x00000080)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28	(RKISP1_CIF_ISP_WDR_BASE + 0x00000084)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29	(RKISP1_CIF_ISP_WDR_BASE + 0x00000088)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30	(RKISP1_CIF_ISP_WDR_BASE + 0x0000008C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31	(RKISP1_CIF_ISP_WDR_BASE + 0x00000090)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32	(RKISP1_CIF_ISP_WDR_BASE + 0x00000094)
+#define RKISP1_CIF_ISP_WDR_OFFSET		(RKISP1_CIF_ISP_WDR_BASE + 0x00000098)
+#define RKISP1_CIF_ISP_WDR_DELTAMIN		(RKISP1_CIF_ISP_WDR_BASE + 0x0000009C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_1_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000A0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_2_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000A4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_3_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000A8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_4_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000AC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000B0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000B4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000B8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000BC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000C0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000C4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000C8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000CC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000D0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000D4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000D8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000DC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000E0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000E4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000E8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000EC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000F0)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000F4)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000F8)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x000000FC)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000100)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000104)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000108)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000010C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000110)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000114)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000118)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000011C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000120)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000124)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000128)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012C)
+#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
+
+#define RKISP1_CIF_ISP_VSM_BASE			0x00002F00
+#define RKISP1_CIF_ISP_VSM_MODE			(RKISP1_CIF_ISP_VSM_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_VSM_H_OFFS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_VSM_V_OFFS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_VSM_H_SIZE		(RKISP1_CIF_ISP_VSM_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_VSM_V_SIZE		(RKISP1_CIF_ISP_VSM_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_VSM_H_SEGMENTS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_VSM_V_SEGMENTS		(RKISP1_CIF_ISP_VSM_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_VSM_DELTA_H		(RKISP1_CIF_ISP_VSM_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_VSM_DELTA_V		(RKISP1_CIF_ISP_VSM_BASE + 0x00000020)
+
+#endif /* _RKISP1_REGS_H */
-- 
2.24.0

