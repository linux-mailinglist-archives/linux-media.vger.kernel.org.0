Return-Path: <linux-media+bounces-44654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14960BE144A
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 335864EABA0
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0392121B91D;
	Thu, 16 Oct 2025 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="p2SRNljE"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1802.securemx.jp [210.130.202.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EABB218592;
	Thu, 16 Oct 2025 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760581873; cv=none; b=P7FSggedMsMjsY7WuZI57CvrfZfb01UGsxEAbKrJz3ZUWm9I3VGuq/MzL9nZoHaybmJgU+cZCmtvjASG5RUUOJtctHFUhHuhqiCp5aQhfDW1ArANoh8ggVSb6trg/tQkbr4FY1y6uqa6ONdnqsNbv8ezpNoZG9YMTs/sT05CXlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760581873; c=relaxed/simple;
	bh=7lGasCb8ksByJpoeDyAioPELcrYQMRIbahwwPZjq1O8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/lhgfyscnxT95gY/LQ0vBBY/zNUfyZ5//4NypxHVCKgB8Z+lHTplrg3B5ky4EWtZUcNE60oBA08TJv0t4FXIazMCSqhQAQN4rRTF21sca/wGy9yshe021RltyKzUy1MfpLaGZg1ZTHkgQpqljIuYGsGf8TSyDwCAuEeknh2PGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=p2SRNljE; arc=none smtp.client-ip=210.130.202.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581823;x=1761791423;bh=7lGasCb8ksByJpoeDyAioPELcrYQMRIbahwwPZjq1O8=;b=p2S
	RNljEczYWI7rHbIXJ8RF2u8sxY2DDY80wB4xXj65Tn/ArjbYuRd9Ks3tT3zeAh1QggpNH45IEpIpx
	gTi0wbfRpThsgn4tkAH5P4VzDUEtb0qaWkGpBXTIKUgR7ZAVa0WOjMAd6OnlRv5ttmce5Hm42EFbk
	GAvSMpAgJ4/lErNefKjJFgVpxYhL1uztgO+gOk+ivQ8gs+a99vV7+j1d512y/nwXFlzpGL3S64qMv
	sm74tVngQHP69nf5GJcTMeiWeoBM5eXeILjnZ3n4ZWQydWgrAc1S3c/1Mno+lMvkegG7eGECxsZ/e
	hck9K0eUD4JbqnXm6zd5fl3E+7ffhuQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 59G2UMK13462938; Thu, 16 Oct 2025 11:30:23 +0900
X-Iguazu-Qid: 2yAbDoX6m4uSdf7SPG
X-Iguazu-QSIG: v=2; s=0; t=1760581822; q=2yAbDoX6m4uSdf7SPG; m=gjAWXgs1ZcdG0OcCLZiRcIQMfahlCmOgpZu/iZXQeOg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkk2GV6zyPZ; Thu, 16 Oct 2025 11:30:22 +0900 (JST)
X-SA-MID: 53072916
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:42 +0900
Subject: [PATCH v13 5/7] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-5-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add support to Video Input Interface on Toshiba Visconti ARM SoCs.
The interface device includes frame grabber,
video DMAC and image signal processor.

A driver instance provides three /dev/videoX device files;
one for RGB image capture, another one for optional RGB capture
with different parameters and the last one for RAW capture.

Through the device files, the driver provides streaming interface.
Both DMABUF and MMAP operations are supported.
The buffer provided by a userland application should be DMA-contiguous.

The driver is based on media controller framework.
Its operations are roughly mapped to three subdrivers;
CSI2 receiver subdevice, ISP subdevice and capture devices.

The Video DMACs have 32bit address space
and currently corresponding IOMMU driver is not provided.
Therefore, memory-block address for captured image is 32bit IOVA
which is equal to 32bit-truncated physical address.
When the Visconti IOMMU driver (currently under development) is accepted,
the hardware layer will use 32bit IOVA mapped by the attached IOMMU.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Resend v1 because a patch exceeds size limit.

Changelog v3:
- Adapted to media control framework
- Introduced ISP subdevice, capture device
- Remove private IOCTLs and add vendor specific V4L2 controls
- Change function name avoiding camelcase and uppercase letters

Changelog v4:
- fix style problems at the v3 patch
- remove "index" member
- update example
- Split patches because the v3 patch exceeds size limit
- Stop using ID number to identify driver instance:
  - Use dynamically allocated structure to hold driver's context,
    instead of static one indexed by ID number.
  - internal functions accept context structure instead of ID number.
- Use pm_runtime to trigger initialization of HW
  along with open/close of device files.

Changelog v5:
- Fix coding style problems in viif.c

Changelog v6:
- update dependency description of Kconfig
- bugfix: usage of buffer pointed with dma_active
- remove unused macros
- add viif_common.c for commonly used register buffer control routine
- add initialization of Bus Controller (HWAIF) and Memory Protection Unit
- removed hwd_ and HWD_ prefix
- update source code documentation
- Suggestion from Hans Verkuil
  - pointer to userland memory is removed from uAPI arguments
    - style of structure is now "nested" instead of "chained by pointer";
  - use div64_u64 for 64bit division
  - define Visconti specific control IDs in v4l2-controls.h
  - set proper initial size to v4l2_ctrl_handler_init()
  - set all buffers to QUEUED state on an error at start_streaming
  - use vb2_is_busy() instead of vb2_is_streaming()
  - add parameter check for s->type and s->target in get_selection()
  - remove ioctls related to DV format and EDID
  - release v4l2 fh instance on and error at opening device file
  - support VB2_MMAP mode for streaming operation
  - add initial value to each vendor specific control
  - GET_LAST_CAPTURE_STATUS control is updated asynchronously from workqueue
  - applied v4l2-compliance
- Suggestion from Sakari Ailus
  - use div64_u64 for 64bit division
  - update copyright's year
  - use common definition of MIPI CSI2 DataTypes
  - remove redundant cast
  - use bool instead of HWD_VIIF_ENABLE/DISABLE
  - simplify comparison to 0
  - simplify statements with trigram operator
  - remove redundant local variables
  - simplify timeout loop
  - use general integer types instead of u32/s32
- Suggestion from Laurent Pinchart
  - moved VIIF driver to driver/platform/toshiba/visconti
  - add CSI2RX subdevice
  - change register access: struct-style to macro-style
  - use common definition of MIPI CSI2 DataTypes
  - Kconfig: add SPDX header, add V4L2_ASYNC
  - remove unused type definitions
  - define enums instead of successive macro constants
  - remove redundant parenthesis of macro constant
  - embed struct hwd_res into struct viif_device
  - turn switch-case into table lookup
  - use xxx_dma instead of xxx_paddr for variable names of IOVA
  - literal value: just 0 instead of 0x0
  - use literal 1 or 0 instead of HWD_VIIF_ENABLE, DISABLE for register access
  - use true or false instead of HWD_VIIF_ENABLE, DISABLE for function calls
  - remove ioctl request handlers which refers subdevices

Changelog v7:
- change compatible string to visconti5-viif
- remove unused variables
- set static to internal functions
- Suggestion from kernel test robot <lkp@intel.com>
  - update references to headers

Changelog v8:
- bugfix: handling return value of visconti_viif_parse_dt()
- add visconti_viif_subdev_notifier_register() to gather
  all operations around v4l2_async_notifier
- update for v6.6-rc2
  - use v4l2_async_connection instead of v4l2_async_subdev
  - aid for devices using subdev active state
- add __maybe_unused for runtime_pm callbacks
- Suggestion from Krzysztof Kozlowski
  - use static initialization of local variable
  - use dev_err_probe()
  - remove error message for DMA memory allocation failure
  - remove unused comment messages
  - add error handling at fail of workqueue_create()
  - remove redundant mutex for pm_runtime callback routines
- Suggestion from Hans Verkuil
  - remove pr_info() calls
  - build check with media_stage.git
  - some lacks for kerneldoc description

Changelog v9:
- applied sparse checker
  - add static qualifier to a file scoped local variable
  - expand functions for acquiring/releasing locks
- bugfix: use NULL (instead of 0) for pad::get_fmt subdevice API
- fix warnings for cast between ptr and dma_addr_t
- call div64_u64 for 64bit division
- rebase to media_staging tree; update Visconti specific control IDs

Changelog v10:
- remove vendor specific compound controls
- remove "rawpack mode" flag
  - RAW16, RAW18, RAW20 (to be implemented and tested) should be used instead
- catch up to v6.9-rc4

Changelog v11:
- stop merging sensor's controls to capture device's
- remove redundant parameter checkings
- update routines handling crop/compose rects of the ISP subdevice
- update kerneldoc comments
- update copyright year

Changelog v12:
- expand functions used only once
- separate IRQ handlers one for VSync and the other for error.
- remove redundant NULL check at visconti_viif_create_sensor_link()
- return error at "missing CSI-2 properties in endpoint"
- detailed error message at return of platform_get_irq()
- improve cast operations for viif_dev->tables_dma
- use RUNTIME_PM_OPS instead of SET_RUNTIME_PM_OPS
- improve identifiers for include guards
- remove unused v4l2-m2m.h
- add comment to VIIF_SYS_CLK macro
- use struct v4l2_rect instead of viif_img_area to hold crop rectangle
- name capture devices cap_{post0, post1, sub} for better understanding
- remove viif_csi2rx subdevice and made it independent driver
- limit vbp size; there might be a sensor with too large vbp; tested with IMX335
- newly add viif_resizer subdevice between ISP and Capture devices.
  - they are available on the capture paths for cap_dev_post0 and cap_dev_post1
  - Resizer offer resize and crop feature; ISP's feature is dropped
- use v4l2_subdev_enable_streams() to start streaming
- implement callback enable_streams and disable_streams, instead of s_steram
- applied rules for setting parameters of downstream pads
- use lowercase hexadecimal literals
- hardware limitation: cap_sub can capture only RAW8 or RAW16
  - for RAW10, 12, 14 input, pixel values are shifted to MSB
- add spinlocks to status_err, reported_err_main, reported_err_sub
- call pm_runtime API at start/stop streaming, instead of file handle callback
- use guard(spinlock)(locked_variable) macros
  - also use custom guard macros for viif_isp_guard
- migration to v6.12: signature of platform_driver::remove is changed

Changelog v13:
- wrap one line at 80 characters
- change banner comment style
- update comment style; spacing at the start and end, capitalize first letter
- add support for clock and reset framework
- add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
- add entries to MAINTAINERS file
- add debugfs to pass debug and status information
- use system clock rate obtained from the framework, instead of constant value
- remove resizer subdevice
- remove CROP and COMPOSE API from ISP subdevice
- use scoped_guard() to acquire a lock
- remove CSI2 specific operations from visconti_viif_subdev_notifier_register()
- update error handling sequence at visconti_viif_subdev_notifier_register()
- check return value of visconti_viif_subdev_notifier_register()
- correct error handling sequence at probe()
- call mutex_destroy() explicitly at error handling sequence, and remove()
- call media_device_cleanup() as a counter part of media_device_init()
- correct teardown sequence at remove()
- correct MASK bits to disable interrupt at runtime_suspend()
- remove CSI2 specific members in struct viif_device and struct viif_remote_async
- add output format UYVY
- add API in parameter interface; struct viif_l2_crop_config.
- remove API in statistics interface; struct viif_reported_errors, struct viif_csi2rx_dphy_calibration_status and struct viif_csi2rx_err_status.
- no need for error message at failure of platform_get_irq()
- fixed error message on V4L2_CID_HBLANK
- add callback for ioctl(VIDIOC_ENUM_FRAMESIZES); framesize should be multiple of 2.
- use unsigned int variables for loop index
- remove U suffix on numeric value
- use BIT() macro instead of shift operator
- remove unused constants
- fix v4l2-compliance fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
- rename functions in viif_common.h: hwd_viif_xxxxx() -> viif_xxxxx(); no need to keep redundant names.
- change the type of argument vc_main and vc_sub in viif_mux_start(); s32 -> u32
- disable L2ISP undistortion at initialization.
---
 MAINTAINERS                                        |    1 +
 drivers/media/platform/toshiba/visconti/Kconfig    |   18 +
 drivers/media/platform/toshiba/visconti/Makefile   |    2 +
 drivers/media/platform/toshiba/visconti/viif.c     |  687 +++++++
 drivers/media/platform/toshiba/visconti/viif.h     |  391 ++++
 .../media/platform/toshiba/visconti/viif_capture.c | 1470 +++++++++++++++
 .../media/platform/toshiba/visconti/viif_capture.h |   24 +
 .../media/platform/toshiba/visconti/viif_common.c  |  250 +++
 .../media/platform/toshiba/visconti/viif_common.h  |   47 +
 drivers/media/platform/toshiba/visconti/viif_isp.c |  976 ++++++++++
 drivers/media/platform/toshiba/visconti/viif_isp.h |   20 +
 .../media/platform/toshiba/visconti/viif_regs.h    |  726 ++++++++
 include/uapi/linux/visconti_viif.h                 | 1911 ++++++++++++++++++++
 13 files changed, 6523 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce973791b367..cdd04f9a4459 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25987,6 +25987,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
 F:	drivers/media/platform/toshiba/visconti/
+F:	include/uapi/linux/visconti_viif.h
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
diff --git a/drivers/media/platform/toshiba/visconti/Kconfig b/drivers/media/platform/toshiba/visconti/Kconfig
index aa0b63f9f008..020fb483e45e 100644
--- a/drivers/media/platform/toshiba/visconti/Kconfig
+++ b/drivers/media/platform/toshiba/visconti/Kconfig
@@ -15,3 +15,21 @@ config VIDEO_VISCONTI_CSI2RX
 	  This driver yields 1 subdevice node for a hardware instance.
 	  To compile this driver as a module, choose M here: the
 	  module will be called visconti-csi2rx.
+
+config VIDEO_VISCONTI_VIIF
+	tristate "Visconti Camera Interface driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_FWNODE
+	help
+	  This is V4L2 driver for Toshiba Visconti Camera Interface hardware
+
+	  This driver yields 3 video device nodes
+	  and 1 media device node for a hardware instance.
+	  To compile this driver as a module, choose M here: the
+	  module will be called visconti-viif.
diff --git a/drivers/media/platform/toshiba/visconti/Makefile b/drivers/media/platform/toshiba/visconti/Makefile
index 62a029376134..e9fe874d6447 100644
--- a/drivers/media/platform/toshiba/visconti/Makefile
+++ b/drivers/media/platform/toshiba/visconti/Makefile
@@ -4,5 +4,7 @@
 #
 
 visconti-csi2rx-objs = csi2rx_drv.o
+visconti-viif-objs = viif.o viif_capture.o viif_common.o viif_isp.o
 
 obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) += visconti-csi2rx.o
+obj-$(CONFIG_VIDEO_VISCONTI_VIIF) += visconti-viif.o
diff --git a/drivers/media/platform/toshiba/visconti/viif.c b/drivers/media/platform/toshiba/visconti/viif.c
new file mode 100644
index 000000000000..16e8f108d996
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif.c
@@ -0,0 +1,687 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <media/v4l2-fwnode.h>
+
+#include "viif.h"
+#include "viif_capture.h"
+#include "viif_common.h"
+#include "viif_isp.h"
+#include "viif_regs.h"
+
+/*----------------------------------------------
+ * Register Access
+ */
+static inline void viif_hwaif_write(struct viif_device *viif_dev,
+				    unsigned int regid, u32 val)
+{
+	writel(val, viif_dev->hwaif_reg + regid);
+}
+
+static inline void viif_mpu_write(struct viif_device *viif_dev,
+				  unsigned int regid, u32 val)
+{
+	writel(val, viif_dev->mpu_reg + regid);
+}
+
+/*----------------------------------------------
+ * Low Layer hardware setup
+ */
+static void viif_mpu_disable(struct viif_device *viif_dev)
+{
+	viif_mpu_write(viif_dev, REG_MPU_MP_EN, 0);
+	viif_mpu_write(viif_dev, REG_MPU_MF_EN, 1);
+}
+
+static void viif_hwaif_enable(struct viif_device *viif_dev)
+{
+	/* Pass through; disable all entries */
+	viif_hwaif_write(viif_dev, REG_HWAIF_REGION_ENTRY_EN, 0);
+
+	/* No limit for outstanding requests */
+	viif_hwaif_write(viif_dev, REG_HWAIF_OSTD_RLEN, 0);
+	viif_hwaif_write(viif_dev, REG_HWAIF_OSTD_WREQ, 0);
+
+	/* No data-pack/outstanding */
+	viif_hwaif_write(viif_dev, REG_HWAIF_HWAIF_CONF, 0);
+
+	/* Enable bus access */
+	viif_hwaif_write(viif_dev, REG_HWAIF_HWAIF_EN, 1);
+}
+
+/*----------------------------------------------
+ * Debug information
+ */
+#ifdef CONFIG_DEBUG_FS
+static void viif_debug_init(struct viif_device *viif_dev)
+{
+	viif_dev->debugfs_dir =
+		debugfs_create_dir(dev_name(viif_dev->dev), NULL);
+	if (IS_ERR(viif_dev->debugfs_dir))
+		return;
+	debugfs_create_x32("reported_err_main", 0444, viif_dev->debugfs_dir,
+			   &viif_dev->reported_err_main);
+	debugfs_create_x32("reported_err_sub", 0444, viif_dev->debugfs_dir,
+			   &viif_dev->reported_err_sub);
+}
+
+static void viif_debug_cleanup(struct viif_device *viif_dev)
+{
+	debugfs_remove_recursive(viif_dev->debugfs_dir);
+	if (IS_ERR(viif_dev->debugfs_dir))
+		return;
+}
+#endif
+
+/*----------------------------------------------
+ * Handling V4L2 framework
+ */
+static irqreturn_t viif_vsync_irq_handler(int irq, void *dev_id)
+{
+	struct viif_device *viif_dev = dev_id;
+	u32 event_main, event_sub, mask;
+	u64 ts;
+
+	if (!viif_dev->irq_enabled)
+		return IRQ_HANDLED;
+
+	ts = ktime_get_ns();
+
+	/* Delayed Vsync of MAIN unit */
+	mask = viif_capture_read(viif_dev, REG_INT_M_SYNC_MASK);
+	event_main = viif_capture_read(viif_dev, REG_INT_M_SYNC) & ~mask;
+	if (event_main)
+		viif_capture_write(viif_dev, REG_INT_M_SYNC, event_main);
+
+	if (event_main & MASK_INT_M_SYNC_LINES_DELAY_INT2) {
+		u32 status_err, l2_transfer_status, val;
+
+		/* Unmask timeout error of gamma table */
+		viif_capture_write(viif_dev, REG_INT_M_MASK,
+				   MASK_INT_M_DELAY_INT_ERROR);
+		viif_dev->masked_gamma_path = 0;
+
+		/* Get abort status of L2ISP */
+		scoped_guard(spinlock, &viif_dev->regbuf_lock)
+		{
+			scoped_guard(viif_isp, viif_dev)
+			{
+				val = viif_capture_read(viif_dev,
+							REG_L2_CRGBF_ISP_INT);
+				viif_capture_write(viif_dev,
+						   REG_L2_CRGBF_ISP_INT, val);
+				l2_transfer_status = val &
+						     MASK_L2_STATUS_ERR_ALL;
+			}
+		}
+
+		scoped_guard(spinlock, &viif_dev->errflag_lock)
+		{
+			status_err = viif_dev->status_err;
+			viif_dev->status_err = 0;
+		}
+
+		visconti_viif_capture_switch_buffer(&viif_dev->cap_post0,
+						    status_err,
+						    l2_transfer_status, ts);
+		visconti_viif_capture_switch_buffer(&viif_dev->cap_post1,
+						    status_err,
+						    l2_transfer_status, ts);
+	}
+
+	/* Delayed Vsync of SUB unit */
+	mask = viif_capture_read(viif_dev, REG_INT_S_SYNC_MASK);
+	event_sub = viif_capture_read(viif_dev, REG_INT_S_SYNC) & ~mask;
+	if (event_sub)
+		viif_capture_write(viif_dev, REG_INT_S_SYNC, event_sub);
+
+	if (event_sub & MASK_INT_S_SYNC_LINES_DELAY_INT1)
+		visconti_viif_capture_switch_buffer(&viif_dev->cap_sub, 0, 0,
+						    ts);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t viif_status_err_irq_handler(int irq, void *dev_id)
+{
+	u32 event_main = 0, event_sub = 0, val, mask;
+	struct viif_device *viif_dev = dev_id;
+
+	if (!viif_dev->irq_enabled)
+		return IRQ_HANDLED;
+
+	mask = viif_capture_read(viif_dev, REG_INT_M_MASK);
+	event_main = viif_capture_read(viif_dev, REG_INT_M_STATUS) & ~mask;
+	if (event_main) {
+		viif_capture_write(viif_dev, REG_INT_M_STATUS, event_main);
+
+		/*
+		 * Mask for gamma table timeout error.
+		 * It will be unmasked at the next Vsync handler.
+		 */
+		val = FIELD_GET(MASK_INT_M_L2ISP_GAMMA_TABLE_TIMEOUT,
+				event_main);
+		if (val) {
+			viif_dev->masked_gamma_path |= val;
+			mask = MASK_INT_M_DELAY_INT_ERROR |
+			       FIELD_PREP(MASK_INT_M_L2ISP_GAMMA_TABLE_TIMEOUT,
+					  viif_dev->masked_gamma_path);
+			viif_capture_write(viif_dev, REG_INT_M_MASK, mask);
+		}
+
+		scoped_guard(spinlock, &viif_dev->errflag_lock)
+			viif_dev->status_err = event_main;
+	}
+
+	mask = viif_capture_read(viif_dev, REG_INT_S_MASK);
+	event_sub = viif_capture_read(viif_dev, REG_INT_S_STATUS) & ~mask;
+	if (event_sub)
+		viif_capture_write(viif_dev, REG_INT_S_STATUS, event_sub);
+
+#ifdef CONFIG_DEBUG_FS
+	scoped_guard(spinlock, &viif_dev->repflag_lock)
+	{
+		viif_dev->reported_err_main |= event_main;
+		viif_dev->reported_err_sub |= event_sub;
+	}
+#endif
+
+	dev_err(viif_dev->dev, "MAIN/SUB error 0x%x 0x%x.\n", event_main,
+		event_sub);
+
+	return IRQ_HANDLED;
+}
+
+/* ----- Async Notifier Operations----- */
+static int visconti_viif_create_sensor_link(struct viif_device *viif_dev)
+{
+	struct v4l2_subdev *remote_sd = viif_dev->remote_sd;
+	int source_pad;
+	int ret;
+
+	/* Camera subdev pad0 -> isp subdev pad0 */
+	source_pad = media_entity_get_fwnode_pad(
+		&remote_sd->entity, remote_sd->fwnode, MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0) {
+		dev_err(viif_dev->dev, "failed to find source pad\n");
+		return source_pad;
+	}
+
+	ret = media_create_pad_link(&remote_sd->entity, source_pad,
+				    &viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SINK_VIDEO,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (sensor:src -> isp:sink)\n");
+
+	return ret;
+}
+
+/**
+ * struct viif_remote_async -  remote subdevice information handled by
+ * v4l2_async APIs
+ * @asc:      async_connection
+ * @v4l2_sd:  v4l2_subdev for the subdevice
+ * @index:    index of the subdevice
+ */
+struct viif_remote_async {
+	struct v4l2_async_connection asc;
+	struct v4l2_subdev *v4l2_sd;
+	unsigned int index;
+};
+
+static int visconti_viif_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *v4l2_sd,
+				      struct v4l2_async_connection *asc)
+{
+	struct viif_device *viif_dev =
+		container_of(notifier, struct viif_device, notifier);
+	struct viif_remote_async *s_as =
+		container_of(asc, struct viif_remote_async, asc);
+
+	s_as->v4l2_sd = v4l2_sd;
+	if (!s_as->index) {
+		viif_dev->remote_sd = v4l2_sd;
+		return visconti_viif_create_sensor_link(viif_dev);
+	}
+
+	return 0;
+}
+
+static void visconti_viif_notify_unbind(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *subdev,
+					struct v4l2_async_connection *asc)
+{
+	struct viif_device *viif_dev =
+		container_of(notifier, struct viif_device, notifier);
+
+	if (viif_dev->remote_sd == subdev)
+		viif_dev->remote_sd = NULL;
+}
+
+static int visconti_viif_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	return v4l2_device_register_subdev_nodes(notifier->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations viif_notify_ops = {
+	.bound = visconti_viif_notify_bound,
+	.unbind = visconti_viif_notify_unbind,
+	.complete = visconti_viif_notify_complete,
+};
+
+static int visconti_viif_subdev_notifier_register(struct viif_device *viif_dev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(viif_dev->dev);
+	struct v4l2_async_notifier *ntf = &viif_dev->notifier;
+	struct fwnode_handle *ep;
+	unsigned int index = 0;
+	int ret = 0;
+
+	v4l2_async_nf_init(ntf, &viif_dev->v4l2_dev);
+	ntf->ops = &viif_notify_ops;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		struct v4l2_fwnode_endpoint vep = {};
+		struct viif_remote_async *viif_asd;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret) {
+			dev_err(viif_dev->dev,
+				"failed to parse endpoint %pfw\n", ep);
+			break;
+		}
+
+		viif_asd = v4l2_async_nf_add_fwnode_remote(
+			ntf, ep, struct viif_remote_async);
+		viif_asd->index = index++;
+	}
+
+	if (ret) {
+		fwnode_handle_put(ep);
+		goto error_nf_cleanup;
+	}
+
+	if (!index)
+		dev_dbg(viif_dev->dev, "No remote subdevice found\n");
+
+	ret = v4l2_async_nf_register(ntf);
+	if (ret)
+		goto error_nf_cleanup;
+
+	return 0;
+
+error_nf_cleanup:
+	v4l2_async_nf_cleanup(ntf);
+
+	return ret;
+}
+
+static int visconti_viif_create_links(struct viif_device *viif_dev)
+{
+	int ret;
+
+	ret = media_create_pad_link(&viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SRC_PATH0,
+				    &viif_dev->cap_post0.vdev.entity,
+				    VIIF_CAPTURE_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (isp:path0 -> capture0:sink)\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SRC_PATH1,
+				    &viif_dev->cap_post1.vdev.entity,
+				    VIIF_CAPTURE_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (isp:path1 -> capture1:sink)\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SRC_PATH2,
+				    &viif_dev->cap_sub.vdev.entity,
+				    VIIF_CAPTURE_PAD_SINK,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (isp:path2 -> capture2:sink)\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&viif_dev->params_dev.vdev.entity,
+				    VIIF_PARAMS_PAD_SRC,
+				    &viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SINK_PARAMS,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (params:src -> isp:params)\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&viif_dev->isp_subdev.sd.entity,
+				    VIIF_ISP_PAD_SRC_STATS,
+				    &viif_dev->stats_dev.vdev.entity,
+				    VIIF_STATS_PAD_SINK, MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(viif_dev->dev,
+			"failed create_pad_link (isp:stats -> stat:sink)\n");
+
+	return ret;
+}
+
+static const struct of_device_id visconti_viif_of_table[] = {
+	{
+		.compatible = "toshiba,visconti5-viif",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, visconti_viif_of_table);
+
+static irqreturn_t (*viif_irq_handlers[VIIF_NUM_IRQS])(int, void *) = {
+	viif_vsync_irq_handler,
+	viif_status_err_irq_handler,
+};
+
+static int visconti_viif_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct viif_device *viif_dev;
+	dma_addr_t tables_dma;
+	unsigned int i;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+	if (ret)
+		return ret;
+
+	viif_dev = devm_kzalloc(dev, sizeof(*viif_dev), GFP_KERNEL);
+	if (!viif_dev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, viif_dev);
+	viif_dev->dev = dev;
+
+	viif_dev->capture_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(viif_dev->capture_reg))
+		return PTR_ERR(viif_dev->capture_reg);
+
+	viif_dev->hwaif_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(viif_dev->hwaif_reg))
+		return PTR_ERR(viif_dev->hwaif_reg);
+
+	viif_dev->mpu_reg = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(viif_dev->mpu_reg))
+		return PTR_ERR(viif_dev->mpu_reg);
+
+	viif_dev->run_flag_main = false;
+
+	for (i = 0; i < ARRAY_SIZE(viif_irq_handlers); i++) {
+		int irq;
+
+		irq = platform_get_irq(pdev, i);
+		if (irq < 0)
+			return irq;
+		ret = devm_request_irq(dev, irq, viif_irq_handlers[i], 0,
+				       "viif", viif_dev);
+		if (ret)
+			return dev_err_probe(
+				dev, ret, "irq request failed: resource %d\n",
+				i);
+		viif_dev->irq[i] = irq;
+	}
+
+	viif_dev->clk_bsproc = devm_clk_get(dev, "bsproc");
+	if (IS_ERR(viif_dev->clk_bsproc))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->clk_bsproc),
+				     "cannot get clock bsproc");
+	viif_dev->clk_proc = devm_clk_get(dev, "proc");
+	if (IS_ERR(viif_dev->clk_proc))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->clk_proc),
+				     "cannot get clock proc");
+	viif_dev->clk_l1isp = devm_clk_get(dev, "l1isp");
+	if (IS_ERR(viif_dev->clk_l1isp))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->clk_l1isp),
+				     "cannot get clock l1isp");
+	viif_dev->clk_l2isp = devm_clk_get(dev, "l2isp");
+	if (IS_ERR(viif_dev->clk_l2isp))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->clk_l2isp),
+				     "cannot get clock l2isp");
+	viif_dev->rst_core = devm_reset_control_get_exclusive(dev, "core");
+	if (IS_ERR(viif_dev->rst_core))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->rst_core),
+				     "cannot get reset core");
+	viif_dev->rst_l1isp = devm_reset_control_get_exclusive(dev, "l1isp");
+	if (IS_ERR(viif_dev->rst_l1isp))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->rst_l1isp),
+				     "cannot get reset l1isp");
+	viif_dev->rst_l2isp = devm_reset_control_get_exclusive(dev, "l2isp");
+	if (IS_ERR(viif_dev->rst_l2isp))
+		return dev_err_probe(dev, PTR_ERR(viif_dev->rst_l2isp),
+				     "cannot get reset l2isp");
+
+	viif_dev->clkrate = clk_get_rate(viif_dev->clk_proc);
+	if (!viif_dev->clkrate)
+		return dev_err_probe(dev, -ENODEV,
+				     "cannot get system clock frequency");
+
+	viif_dev->tables = dma_alloc_wc(dev, sizeof(struct viif_table_area),
+					&tables_dma, GFP_KERNEL);
+	if (!viif_dev->tables)
+		return -ENOMEM;
+	viif_dev->tables_dma = tables_dma;
+
+	spin_lock_init(&viif_dev->regbuf_lock);
+	spin_lock_init(&viif_dev->errflag_lock);
+	spin_lock_init(&viif_dev->repflag_lock);
+	mutex_init(&viif_dev->stream_lock);
+
+	pm_runtime_enable(dev);
+
+	/* build media_dev */
+	viif_dev->media_dev.hw_revision = 0;
+	strscpy(viif_dev->media_dev.model, VIIF_DRIVER_NAME,
+		sizeof(viif_dev->media_dev.model));
+	viif_dev->media_dev.dev = dev;
+	media_device_init(&viif_dev->media_dev);
+
+	/* build v4l2_dev */
+	viif_dev->v4l2_dev.mdev = &viif_dev->media_dev;
+	ret = v4l2_device_register(dev, &viif_dev->v4l2_dev);
+	if (ret)
+		goto error_dma_free;
+
+	ret = media_device_register(&viif_dev->media_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register media device\n");
+		goto error_v4l2_unregister;
+	}
+
+	ret = visconti_viif_isp_register(viif_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register isp sub node\n");
+		goto error_media_unregister;
+	}
+
+	ret = visconti_viif_capture_register(viif_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register capture node\n");
+		goto error_isp_unregister;
+	}
+
+	ret = visconti_viif_create_links(viif_dev);
+	if (ret)
+		goto error_capture_unregister;
+
+	ret = visconti_viif_subdev_notifier_register(viif_dev);
+	if (ret)
+		goto error_capture_unregister;
+
+#ifdef CONFIG_DEBUG_FS
+	viif_debug_init(viif_dev);
+#endif
+
+	return 0;
+
+error_capture_unregister:
+	visconti_viif_capture_unregister(viif_dev);
+error_isp_unregister:
+	visconti_viif_isp_unregister(viif_dev);
+error_media_unregister:
+	media_device_unregister(&viif_dev->media_dev);
+error_v4l2_unregister:
+	v4l2_device_unregister(&viif_dev->v4l2_dev);
+error_dma_free:
+	media_device_cleanup(&viif_dev->media_dev);
+	pm_runtime_disable(dev);
+	mutex_destroy(&viif_dev->stream_lock);
+	dma_free_wc(&pdev->dev, sizeof(struct viif_table_area),
+		    viif_dev->tables,
+		    (dma_addr_t)(uintptr_t)viif_dev->tables_dma);
+
+	return ret;
+}
+
+static void visconti_viif_remove(struct platform_device *pdev)
+{
+	struct viif_device *viif_dev = platform_get_drvdata(pdev);
+
+#ifdef CONFIG_DEBUG_FS
+	viif_debug_cleanup(viif_dev);
+#endif
+
+	v4l2_async_nf_unregister(&viif_dev->notifier);
+	v4l2_async_nf_cleanup(&viif_dev->notifier);
+	visconti_viif_capture_unregister(viif_dev);
+	visconti_viif_isp_unregister(viif_dev);
+	media_device_unregister(&viif_dev->media_dev);
+	v4l2_device_unregister(&viif_dev->v4l2_dev);
+	media_device_cleanup(&viif_dev->media_dev);
+
+	pm_runtime_disable(&pdev->dev);
+	mutex_destroy(&viif_dev->stream_lock);
+	dma_free_wc(&pdev->dev, sizeof(struct viif_table_area),
+		    viif_dev->tables,
+		    (dma_addr_t)(uintptr_t)viif_dev->tables_dma);
+}
+
+static int visconti_viif_runtime_suspend(struct device *dev)
+{
+	struct viif_device *viif_dev = dev_get_drvdata(dev);
+	int i;
+
+	viif_dev->irq_enabled = false;
+	/* Make sure the IRQ handler will see the flag change */
+	mb();
+
+	/* Mask all IRQs */
+	viif_capture_write(viif_dev, REG_INT_M_SYNC_MASK,
+			   MASK_INT_M_SYNC_MASK_ALL);
+	viif_capture_write(viif_dev, REG_INT_M_MASK, MASK_INT_M_MASK_ALL);
+	viif_capture_write(viif_dev, REG_INT_S_SYNC_MASK,
+			   MASK_INT_S_SYNC_MASK_ALL);
+	viif_capture_write(viif_dev, REG_INT_S_MASK, MASK_INT_S_MASK_ALL);
+	viif_capture_read(viif_dev, REG_INT_M_SYNC_MASK);
+	viif_capture_read(viif_dev, REG_INT_M_MASK);
+	viif_capture_read(viif_dev, REG_INT_S_SYNC_MASK);
+	viif_capture_read(viif_dev, REG_INT_S_MASK);
+	for (i = 0; i < VIIF_NUM_IRQS; i++)
+		synchronize_irq(viif_dev->irq[i]);
+
+	reset_control_assert(viif_dev->rst_l2isp);
+	reset_control_assert(viif_dev->rst_l1isp);
+	reset_control_assert(viif_dev->rst_core);
+	clk_disable_unprepare(viif_dev->clk_l2isp);
+	clk_disable_unprepare(viif_dev->clk_l1isp);
+	clk_disable_unprepare(viif_dev->clk_proc);
+	clk_disable_unprepare(viif_dev->clk_bsproc);
+
+	return 0;
+}
+
+static int visconti_viif_runtime_resume(struct device *dev)
+{
+	struct viif_device *viif_dev = dev_get_drvdata(dev);
+
+	clk_prepare_enable(viif_dev->clk_bsproc);
+	clk_prepare_enable(viif_dev->clk_proc);
+	clk_prepare_enable(viif_dev->clk_l1isp);
+	clk_prepare_enable(viif_dev->clk_l2isp);
+	reset_control_deassert(viif_dev->rst_core);
+	reset_control_deassert(viif_dev->rst_l1isp);
+	reset_control_deassert(viif_dev->rst_l2isp);
+
+	/* Disable MPU */
+	viif_mpu_disable(viif_dev);
+	/* Enable HWAIF */
+	viif_hwaif_enable(viif_dev);
+
+	viif_dev->irq_enabled = true;
+	/* Make sure the IRQ handler will see the flag change */
+	mb();
+
+	/* VSYNC mask setting of MAIN unit */
+	viif_capture_write(viif_dev, REG_INT_M_SYNC_MASK,
+			   MASK_INT_M_SYNC_MASK_SET);
+
+	/* STATUS error mask setting of MAIN unit */
+	viif_capture_write(viif_dev, REG_INT_M_MASK,
+			   MASK_INT_M_DELAY_INT_ERROR);
+
+	/* VSYNC mask settings of SUB unit */
+	viif_capture_write(viif_dev, REG_INT_S_SYNC_MASK,
+			   MASK_INT_S_SYNC_MASK_SET);
+
+	/* STATUS error mask setting(unmask) of SUB unit */
+	viif_capture_write(viif_dev, REG_INT_S_MASK,
+			   MASK_INT_S_RESERVED_SET |
+				   MASK_INT_S_DELAY_INT_ERROR);
+
+	return 0;
+}
+
+static const struct dev_pm_ops visconti_viif_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(visconti_viif_runtime_suspend,
+		       visconti_viif_runtime_resume, NULL)
+};
+
+static struct platform_driver visconti_viif_driver = {
+	.probe = visconti_viif_probe,
+	.remove = visconti_viif_remove,
+	.driver = {
+		.name = VIIF_DRIVER_NAME,
+		.of_match_table = visconti_viif_of_table,
+		.pm = pm_ptr(&visconti_viif_pm_ops),
+	},
+};
+
+module_platform_driver(visconti_viif_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti Video Input driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/toshiba/visconti/viif.h b/drivers/media/platform/toshiba/visconti/viif.h
new file mode 100644
index 000000000000..dacc3698543a
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif.h
@@ -0,0 +1,391 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_H__
+#define __VIIF_H__
+
+#include <linux/visconti_viif.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mediabus.h>
+#include <media/videobuf2-dma-contig.h>
+
+#define VIIF_DRIVER_NAME "visconti-viif"
+
+#define VIIF_ISP_REGBUF_0 0
+#define VIIF_L2ISP_POST_0 0
+#define VIIF_L2ISP_POST_1 1
+#define VIIF_MAX_POST_NUM 2
+
+#define VIIF_CAPTURE_PAD_SINK 0
+
+#define VIIF_ISP_PAD_SINK_VIDEO	 0
+#define VIIF_ISP_PAD_SRC_PATH0	 1
+#define VIIF_ISP_PAD_SRC_PATH1	 2
+#define VIIF_ISP_PAD_SRC_PATH2	 3
+#define VIIF_ISP_PAD_SINK_PARAMS 4
+#define VIIF_ISP_PAD_SRC_STATS	 5
+#define VIIF_ISP_PAD_NUM	 6
+
+#define VIIF_PARAMS_PAD_SRC 0
+#define VIIF_PARAMS_PAD_NUM 1
+
+#define VIIF_STATS_PAD_SINK 0
+#define VIIF_STATS_PAD_NUM  1
+
+#define CAPTURE_PATH_MAIN_POST0 0
+#define CAPTURE_PATH_MAIN_POST1 1
+#define CAPTURE_PATH_SUB	2
+
+#define RESIZER_PATH_MAIN_POST0 0
+#define RESIZER_PATH_MAIN_POST1 1
+
+#define VIIF_DPC_TABLE_BYTES	   8192
+#define VIIF_LSC_TABLE_BYTES	   1536
+#define VIIF_UNDIST_TABLE_BYTES	   8192
+#define VIIF_L2_GAMMA_TABLE_BYTES  512
+#define VIIF_L2_GAMMA_TABLE_CH_NUM 6
+
+#define VIIF_NUM_IRQS 2
+
+enum viif_output_color_mode {
+	VIIF_COLOR_Y_G = 0,
+	VIIF_COLOR_U_B = 1U,
+	VIIF_COLOR_V_R = 2U,
+	VIIF_COLOR_YUV_RGB = 4U
+};
+
+/**
+ * struct viif_out_process - configuration of output process of MAIN unit and
+ * L2ISP
+ * @half_scale: true to enable half scaling
+ * @select_color: viif_output_color_mode "select output color"
+ * @alpha: alpha value used in case of ARGB8888 output. Range: [0..255]
+ */
+struct viif_out_process {
+	bool half_scale;
+	enum viif_output_color_mode select_color;
+	u8 alpha;
+};
+
+/**
+ * struct viif_fmt - description of supported output image format
+ * @fourcc: V4L2 fourcc format ID
+ * @bpp: bits per pixel for each plane
+ * @num_planes: number of planes in a image
+ * @colorspace: colorspace ID
+ * @pitch_align: alignment constraint of pitch
+ */
+struct viif_fmt {
+	u32 fourcc;
+	u8 bpp[3];
+	u8 num_planes;
+	u32 colorspace;
+	u32 pitch_align;
+};
+
+/**
+ * struct viif_table_area - table for ISP features.
+ *
+ * @dpc_table_h: DPC parameter table for high sensitivity image
+ * @dpc_table_m: DPC parameter table for middle sensitivity image
+ * @dpc_table_l: DPC parameter table for low sensitivity image
+ * @lsc_table_gr: LSC parameter table for Green(R) pixel
+ * @lsc_table_r: LSC parameter table for Red pixel
+ * @lsc_table_b: LSC parameter table for Blue pixel
+ * @lsc_table_gb: LSC parameter table for Green(B) pixel
+ * @undist_write_g: undistortion coefficient table for writing Green pixel
+ * @undist_read_b: undistortion coefficient table for reading Blue pixel
+ * @undist_read_g: undistortion coefficient table for reading Green pixel
+ * @undist_read_r: undistortion coefficient table for reading Red pixel
+ * @l2_gamma_table: L2 gamma coefficient table
+ *
+ * The memory block for this structure must be allocated with dma_alloc_wc()
+ * so that the allocated block will be physically continuous.
+ */
+struct viif_table_area {
+	/* L1ISP DPC */
+	u32 dpc_table_h[VIIF_DPC_TABLE_BYTES / sizeof(u32)];
+	u32 dpc_table_m[VIIF_DPC_TABLE_BYTES / sizeof(u32)];
+	u32 dpc_table_l[VIIF_DPC_TABLE_BYTES / sizeof(u32)];
+	/* L1ISP LSC */
+	u16 lsc_table_gr[VIIF_LSC_TABLE_BYTES / sizeof(u16)];
+	u16 lsc_table_r[VIIF_LSC_TABLE_BYTES / sizeof(u16)];
+	u16 lsc_table_b[VIIF_LSC_TABLE_BYTES / sizeof(u16)];
+	u16 lsc_table_gb[VIIF_LSC_TABLE_BYTES / sizeof(u16)];
+	/* L2ISP UNDIST */
+	u32 undist_write_g[VIIF_UNDIST_TABLE_BYTES / sizeof(u32)];
+	u32 undist_read_b[VIIF_UNDIST_TABLE_BYTES / sizeof(u32)];
+	u32 undist_read_g[VIIF_UNDIST_TABLE_BYTES / sizeof(u32)];
+	u32 undist_read_r[VIIF_UNDIST_TABLE_BYTES / sizeof(u32)];
+	/* L2ISP GAMMA */
+	u16 l2_gamma_table[VIIF_MAX_POST_NUM][VIIF_L2_GAMMA_TABLE_CH_NUM]
+			  [VIIF_L2_GAMMA_TABLE_BYTES / sizeof(u16)];
+};
+
+/**
+ * struct cap_dev - device node for capture device
+ * @pathid: 0 for MAIN POST0, 1 for MAIN POST1, 2 for SUB
+ * @vdev: video node
+ * @capture_pad: media pad
+ * @vlock: serialize ioctl to vb2_queue and video_device
+ * @vb2_vq: queue of buffers
+ * @buf_queue: list of available buffers
+ * @active: VDMAC will start writing to this buffer at the next VSYNC
+ * @dma_active: VDMAC will complete writing to this buffer at the next VSYNC
+ * @buf_cnt: number of queued buffers
+ * @sequence: total count of processed frames
+ * @buf_lock: serialize queue access (including ISR's)
+ * @v4l2_pix: current picture format (set by S_FMT)
+ * @out_format: output format for VDMAC
+ * @img_area: crop of output picture
+ * @out_process: output configuration
+ * @fmts: format supported by this capture device
+ * @fmt_size: sizeof fmts
+ * @viif_dev: reference to viif device
+ */
+struct cap_dev {
+	u32 pathid;
+	struct video_device vdev;
+	struct media_pad capture_pad;
+	struct mutex vlock; /* Serialize ioctl to vb2_queue and video_device */
+
+	/* vb2 queue, capture buffer list and active buffer pointer */
+	struct vb2_queue vb2_vq;
+	struct list_head buf_queue;
+	struct vb2_v4l2_buffer *active;
+	struct vb2_v4l2_buffer *dma_active;
+	int buf_cnt;
+	unsigned int sequence;
+	spinlock_t buf_lock; /* Serialize queue access (including ISR's) */
+
+	/* Current configuration of frame and pixel format */
+	struct v4l2_pix_format_mplane v4l2_pix;
+	unsigned int out_format;
+	struct v4l2_rect img_area;
+	struct viif_out_process out_process;
+
+	/* Format supported by this cap device */
+	const struct viif_fmt *fmts;
+	int fmt_size;
+
+	struct viif_device *viif_dev;
+};
+
+/**
+ * struct params_dev - device node for ISP parameters
+ * @vdev: video node
+ * @params_pad: media pad
+ * @vlock: serialize ioctl to vb2_queue and video_device
+ * @vb2_vq: queue of buffers
+ * @params_queue: list of available buffers
+ * @params_lock: serialize params_queue
+ */
+struct params_dev {
+	struct video_device vdev;
+	struct media_pad params_pad;
+	struct mutex vlock; /* Serialize ioctl to vb2_queue and video_device */
+
+	struct vb2_queue vb2_vq;
+	struct list_head params_queue;
+	spinlock_t params_lock; /* Serialize params_queue */
+};
+
+/**
+ * struct stats_dev - device node for ISP status
+ * @vdev: video node
+ * @stats_pad: media pad
+ * @vlock: serialize ioctl to vb2_queue and video_device
+ * @vb2_vq: queue of buffers
+ * @stats_queue: list of available buffers
+ * @stats_lock: serialize stats_queue
+ */
+struct stats_dev {
+	struct video_device vdev;
+	struct media_pad stats_pad;
+	struct mutex vlock; /* Serialize ioctl to vb2_queue and video_device */
+
+	struct vb2_queue vb2_vq;
+	struct list_head stats_queue;
+	spinlock_t stats_lock; /* Serialize stats_queue */
+};
+
+/**
+ * struct isp_subdev - device node for ISP subdevice
+ * @sd: v4l2 subdevice
+ * @pads: media pad
+ * @viif_dev: reference to viif device
+ */
+struct isp_subdev {
+	struct v4l2_subdev sd;
+	struct media_pad pads[VIIF_ISP_PAD_NUM];
+	struct viif_device *viif_dev;
+};
+
+/**
+ * struct viif_l2_roi_path_info - crop information of main paths
+ * @roi_num:
+ *
+ * - 1: crops of MAIN POST0 and POST1 share the same ROI
+ * - 2: crops of MAIN POST0 and POST1 have independent ROIs
+ *
+ * @post_enable_flag: flag to enable corresponding main path
+ * @post_crop_x: left of crop rect for a POST
+ * @post_crop_y: top of crop rect for a POST
+ * @post_crop_w: width of crop rect for a POST
+ * @post_crop_h: height of crop rect for a POST
+ */
+struct viif_l2_roi_path_info {
+	u32 roi_num;
+	bool post_enable_flag[VIIF_MAX_POST_NUM];
+	u32 post_crop_x[VIIF_MAX_POST_NUM];
+	u32 post_crop_y[VIIF_MAX_POST_NUM];
+	u32 post_crop_w[VIIF_MAX_POST_NUM];
+	u32 post_crop_h[VIIF_MAX_POST_NUM];
+};
+
+/**
+ * struct viif_img_clk - relation between realtime duration and number of lines
+ * @pixel_clock: picture transfer clock frequency
+ * @htotal_size: width of picture including blanking period
+ *
+ * These values are used to convert realtime duration (such as HW specific setup
+ * time) into number of lines in a picture. See sysclk_to_numlines() called at
+ * the reconfiguration of L1ISP HDRC feature.
+ */
+struct viif_img_clk {
+	unsigned int pixel_clock;
+	unsigned int htotal_size;
+};
+
+struct dentry;
+
+/**
+ * struct viif_device - driver information of Visconti VIIF
+ * @dev: device
+ * @v4l2_dev: v4l2 device
+ * @media_dev: media device
+ * @pipe: media pipeline
+ * @masked_gamma_path: flag to ignore L2_GAMMA error just after capture error
+ * @notifier: async subdev notification helper
+ * @cap_post0: capture device for MAIN PATH 0
+ * @cap_post1: capture device for MAIN PATH 1
+ * @cap_sub: capture device for MAIN PATH 2
+ * @isp_subdev: ISP subdevice
+ * @params_dev: streaming device for ISP parameter
+ * @stats_dev: streaming device for ISP status
+ * @remote_sd: currently active remote (possibly sensor) subdevice
+ * @debugfs_dir: directory object for the top of the debug information
+ * @stream_lock: serialize stream ON/OFF sequence
+ * @regbuf_lock: Serialize VIIF Register Buffer Access
+ * @clk_bsproc: reference to clock instance 'bsproc'
+ * @clk_proc: reference to clock instance 'proc'
+ * @clk_l1isp: reference to clock instance 'l1isp'
+ * @clk_l2isp: reference to clock instance 'l2isp'
+ * @rst_core: reference to reset controller 'core'
+ * @rst_l1isp: reference to reset controller 'l1isp'
+ * @rst_l2isp: reference to reset controller 'l2isp'
+ * @clkrate: clock frequency of 'proc'; expecting 500MHz
+ * @l2_roi_path_info: crop information of main paths
+ * @img_clk: relation between realtime duration and number of lines
+ * @run_flag_main: flag to check if the stream is ON
+ * @capture_reg: HW capture registers
+ * @hwaif_reg: HW bus interface registers
+ * @mpu_reg: HW memory protection unit registers
+ * @irq: IRQ number
+ * @irq_enabled: true when interrupts can be handled correctly
+ * @tables: table for ISP features (virtual address)
+ * @tables_dma: table for ISP features (IOVA)
+ * @errflag_lock: serialize access to status_err
+ * @repflag_lock: serialize access to reported_err_main, reported_err_sub
+ * @status_err: error of Main path in a frame
+ * @reported_err_main: accumulated error flags for MAIN path
+ * @reported_err_sub: accumulated error flags for SUB path
+ */
+struct viif_device {
+	struct device *dev;
+	struct v4l2_device v4l2_dev;
+	struct media_device media_dev;
+	struct media_pipeline pipe;
+	u32 masked_gamma_path;
+
+	struct v4l2_async_notifier notifier;
+
+	struct cap_dev cap_post0;
+	struct cap_dev cap_post1;
+	struct cap_dev cap_sub;
+	struct isp_subdev isp_subdev;
+	struct params_dev params_dev;
+	struct stats_dev stats_dev;
+	struct v4l2_subdev *remote_sd;
+
+	struct dentry *debugfs_dir;
+
+	/* stream_lock - Serialize stream ON/OFF sequence */
+	struct mutex stream_lock;
+
+	/* regbuf_lock - Serialize VIIF Register Buffer Access */
+	spinlock_t regbuf_lock;
+
+	struct clk *clk_bsproc;
+	struct clk *clk_proc;
+	struct clk *clk_l1isp;
+	struct clk *clk_l2isp;
+	struct reset_control *rst_core;
+	struct reset_control *rst_l1isp;
+	struct reset_control *rst_l2isp;
+
+	unsigned long clkrate;
+
+	struct viif_l2_roi_path_info l2_roi_path_info;
+	struct viif_img_clk img_clk;
+	bool run_flag_main;
+
+	void __iomem *capture_reg;
+	void __iomem *hwaif_reg;
+	void __iomem *mpu_reg;
+	unsigned int irq[VIIF_NUM_IRQS];
+
+	bool irq_enabled;
+
+	/* Memory region for tables referred by the HW */
+	struct viif_table_area *tables;
+	dma_addr_t tables_dma;
+
+	/* errflag_lock - serialize access to status_err */
+	spinlock_t errflag_lock;
+
+	/* repflag_lock - serialize access to reported_err_main, reported_err_sub */
+	spinlock_t repflag_lock;
+
+	/* Error flag checked at delayed vsync handler  */
+	u32 status_err;
+
+	/* Error flag checked at stats streaming interface */
+	u32 reported_err_main;
+	u32 reported_err_sub;
+};
+
+static inline void viif_capture_write(struct viif_device *viif_dev,
+				      unsigned int regid, u32 val)
+{
+	writel(val, viif_dev->capture_reg + regid);
+}
+
+static inline u32 viif_capture_read(struct viif_device *viif_dev,
+				    unsigned int regid)
+{
+	return readl(viif_dev->capture_reg + regid);
+}
+
+#endif /* __VIIF_H__ */
diff --git a/drivers/media/platform/toshiba/visconti/viif_capture.c b/drivers/media/platform/toshiba/visconti/viif_capture.c
new file mode 100644
index 000000000000..00200d7e26de
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_capture.c
@@ -0,0 +1,1470 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-subdev.h>
+
+#include "viif.h"
+#include "viif_capture.h"
+#include "viif_common.h"
+#include "viif_isp.h"
+#include "viif_regs.h"
+
+/* Single plane for RGB/Grayscale types, 3 planes for YUV types */
+#define VIIF_MAX_PLANE_NUM 3
+
+/* Maximum output size with ISP */
+#define VIIF_MAX_OUTPUT_IMG_WIDTH_ISP  5760
+#define VIIF_MAX_OUTPUT_IMG_HEIGHT_ISP 3240
+
+/* Minimum output size */
+#define VIIF_MIN_OUTPUT_IMG_WIDTH  128
+#define VIIF_MIN_OUTPUT_IMG_HEIGHT 128
+
+/* DMA settings for SUB path */
+#define VDMAC_SRAM_BASE_ADDR_W03 0x440U
+#define SRAM_SIZE_W_PORT	 0x200
+
+enum viif_color_format {
+	VIIF_YCBCR422_8_PACKED = 0,
+	VIIF_RGB888_PACKED = 1U,
+	VIIF_ARGB8888_PACKED = 3U,
+	VIIF_YCBCR422_8_PLANAR = 8U,
+	VIIF_RGB888_YCBCR444_8_PLANAR = 9U,
+	VIIF_ONE_COLOR_8 = 11U,
+	VIIF_YCBCR422_16_PLANAR = 12U,
+	VIIF_RGB161616_YCBCR444_16_PLANAR = 13U,
+	VIIF_ONE_COLOR_16 = 15U
+};
+
+/**
+ * struct viif_csc_param - color conversion information
+ * @r_cr_in_offset: input offset of R/Cr
+ * @g_y_in_offset: input offset of G/Y
+ * @b_cb_in_offset: input offset of B/Cb
+ * @coef: coefficient of matrix.
+ * @r_cr_out_offset: output offset of R/Cr
+ * @g_y_out_offset: output offset of G/Y
+ * @b_cb_out_offset: output offset of B/Cb
+ *
+ * Range of parameters is:
+ *
+ * - {r_cr,g_y,b_cb}_{in,out}_offset
+ *
+ *   - Range: [0x0..0x1ffff]
+ *
+ * - coef
+ *
+ *   - Range: [0x0..0xffff]
+ *   - [0] : c00(YG_YG), [1] : c01(UB_YG), [2] : c02(VR_YG),
+ *   - [3] : c10(YG_UB), [4] : c11(UB_UB), [5] : c12(VR_UB),
+ *   - [6] : c20(YG_VR), [7] : c21(UB_VR), [8] : c22(VR_VR)
+ */
+struct viif_csc_param {
+	u32 r_cr_in_offset;
+	u32 g_y_in_offset;
+	u32 b_cb_in_offset;
+	u32 coef[9];
+	u32 r_cr_out_offset;
+	u32 g_y_out_offset;
+	u32 b_cb_out_offset;
+};
+
+/**
+ * struct viif_pixelmap - pixelmap information
+ * @pmap_dma: start address of pixel data(DMA address). 4byte alignment.
+ * @pitch: pitch size of pixel map [unit: byte]
+ *
+ * Condition of pitch in case of L2ISP output is as below.
+ *
+ * * max: 32704
+ * * min: max (active width of image * k / r, 128)
+ * * alignment: 64
+ *
+ * Condition of pitch in the other cases is as below.
+ *
+ * * max: 65536
+ * * min: active width of image * k / r
+ * * alignment: 4
+ *
+ * k is the size of 1 pixel and the value is as below.
+ *
+ * * VIIF_YCBCR422_8_PACKED: 2
+ * * VIIF_RGB888_PACKED: 3
+ * * VIIF_ARGB8888_PACKED: 4
+ * * VIIF_YCBCR422_8_PLANAR: 1
+ * * VIIF_RGB888_YCBCR444_8_PLANAR: 1
+ * * VIIF_ONE_COLOR_8: 1
+ * * VIIF_YCBCR422_16_PLANAR: 2
+ * * VIIF_RGB161616_YCBCR444_16_PLANAR: 2
+ * * VIIF_ONE_COLOR_16: 2
+ *
+ * r is the correction factor for Cb or Cr of YCbCr422 planar and the value is
+ * as below.
+ *
+ * * YCbCr422 Cb-planar: 2
+ * * YCbCr422 Cr-planar: 2
+ * * others: 1
+ */
+struct viif_pixelmap {
+	dma_addr_t pmap_dma;
+	u32 pitch;
+};
+
+/**
+ * struct viif_img - image information
+ * @width: active width of image [unit: pixel]
+ * * Range: [128..5760](output from L2ISP)
+ * * Range: [128..4096](output from SUB unit)
+ * * The value should be even.
+ *
+ * @height: active height of image[line]
+ * * Range: [128..3240](output from L2ISP)
+ * * Range: [128..2160](output from SUB unit)
+ * * The value should be even.
+ *
+ * @num_planes: number of image planes for this image
+ *
+ * @format: viif_color_format "color format"
+ * * Below color formats are supported for input and output of MAIN unit
+ * * VIIF_YCBCR422_8_PACKED
+ * * VIIF_RGB888_PACKED
+ * * VIIF_ARGB8888_PACKED
+ * * VIIF_YCBCR422_8_PLANAR
+ * * VIIF_RGB888_YCBCR444_8_PLANAR
+ * * VIIF_ONE_COLOR_8
+ * * VIIF_YCBCR422_16_PLANAR
+ * * VIIF_RGB161616_YCBCR444_16_PLANAR
+ * * VIIF_ONE_COLOR_16
+ * * Below color formats are supported for output of SUB unit
+ * * VIIF_ONE_COLOR_8
+ * * VIIF_ONE_COLOR_16
+ *
+ * @pixelmap: pixelmap information
+ * * [0]: Y/G-planar, packed/Y/RAW
+ * * [1]: Cb/B-planar
+ * * [2]: Cr/R-planar
+ */
+struct viif_img {
+	u32 width;
+	u32 height;
+	u32 num_planes;
+	enum viif_color_format format;
+	struct viif_pixelmap pixelmap[VIIF_MAX_PLANE_NUM];
+};
+
+/*----------------------------------------------
+ * Low Layer Implementation
+ */
+/**
+ * viif_l2_set_output_csc() - Set output color space conversion parameters of
+ * L2ISP
+ *
+ * @viif_dev: the VIIF device
+ * @post_id: POST ID. Range: [0..1]
+ * @param: Pointer to output color space conversion parameters of L2ISP
+ */
+static void viif_l2_set_output_csc(struct viif_device *viif_dev, u32 post_id,
+				   const struct viif_csc_param *param)
+{
+	/* disable csc matrix when param is NULL */
+	if (!param) {
+		viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB(post_id), 0);
+		return;
+	}
+
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG_OFFSETI(post_id),
+			   param->g_y_in_offset);
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG1(post_id),
+			   FIELD_CSC_MTB_LOWER(param->coef[0]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG2(post_id),
+			   FIELD_CSC_MTB_UPPER(param->coef[1]) |
+				   FIELD_CSC_MTB_LOWER(param->coef[2]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_YG_OFFSETO(post_id),
+			   param->g_y_out_offset);
+
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB_OFFSETI(post_id),
+			   param->b_cb_in_offset);
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB1(post_id),
+			   FIELD_CSC_MTB_LOWER(param->coef[3]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB2(post_id),
+			   FIELD_CSC_MTB_UPPER(param->coef[4]) |
+				   FIELD_CSC_MTB_LOWER(param->coef[5]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CB_OFFSETO(post_id),
+			   param->b_cb_out_offset);
+
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR_OFFSETI(post_id),
+			   param->r_cr_in_offset);
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR1(post_id),
+			   FIELD_CSC_MTB_LOWER(param->coef[6]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR2(post_id),
+			   FIELD_CSC_MTB_UPPER(param->coef[7]) |
+				   FIELD_CSC_MTB_LOWER(param->coef[8]));
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB_CR_OFFSETO(post_id),
+			   param->r_cr_out_offset);
+
+	viif_capture_write(viif_dev, REG_L2_POST_X_CSC_MTB(post_id), 1);
+}
+
+/* Up to 2 ROIs are available to be passed to POSTs */
+/* Set ROI_NONE for a POST currently not running */
+#define VIIF_L2_ROI_MAX_NUM 2
+#define VIIF_L2_ROI_NONE    3
+
+/* Minimum crop width and height */
+#define VIIF_CROP_MIN_W 128
+#define VIIF_CROP_MIN_H 128
+
+/* Set ROI path condition when ROI num is 2 */
+static void viif_l2_set_roi_num_2(struct viif_device *viif_dev)
+{
+	struct viif_l2_roi_path_info *info = &viif_dev->l2_roi_path_info;
+	u32 i;
+
+	for (i = 0; i < VIIF_L2_ROI_MAX_NUM; i++) {
+		/* ROI-n is the same as CROP area of POST-n */
+		if (info->post_enable_flag[i]) {
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_H(i),
+					   info->post_crop_x[i]);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_V(i),
+					   info->post_crop_y[i]);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_HSIZE(i),
+					   info->post_crop_w[i]);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_VSIZE(i),
+					   info->post_crop_h[i]);
+			viif_capture_write(viif_dev, REG_L2_ROI_TO_POST(i), i);
+		} else {
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_H(i),
+					   0);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_V(i),
+					   0);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_HSIZE(i),
+					   VIIF_CROP_MIN_W);
+			viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_VSIZE(i),
+					   VIIF_CROP_MIN_H);
+			viif_capture_write(viif_dev, REG_L2_ROI_TO_POST(i),
+					   VIIF_L2_ROI_NONE);
+		}
+	}
+}
+
+/* Set ROI path condition when ROI num is 1 */
+static void viif_l2_set_roi_num_1(struct viif_device *viif_dev)
+{
+	struct viif_l2_roi_path_info *info = &viif_dev->l2_roi_path_info;
+	u32 val, x_min, x_max, y_min, y_max;
+	u32 i, x, y, w, h;
+
+	/* ROI0 is input to POST0 and POST1 */
+	if (info->post_enable_flag[0]) {
+		/* POST0 is enabled */
+		x_min = info->post_crop_x[0];
+		x_max = info->post_crop_x[0] + info->post_crop_w[0];
+		y_min = info->post_crop_y[0];
+		y_max = info->post_crop_y[0] + info->post_crop_h[0];
+		if (info->post_enable_flag[1]) {
+			/* POST1 is enabled */
+			x_min = min(x_min, info->post_crop_x[1]);
+			val = info->post_crop_x[1] + info->post_crop_w[1];
+			x_max = max(x_max, val);
+			y_min = min(y_min, info->post_crop_y[1]);
+			val = info->post_crop_y[1] + info->post_crop_h[1];
+			y_max = max(y_max, val);
+		}
+		x = x_min;
+		y = y_min;
+		w = x_max - x_min;
+		h = y_max - y_min;
+	} else if (info->post_enable_flag[1]) {
+		/* POST0 is disabled and POST1 is enabled */
+		x = info->post_crop_x[1];
+		w = info->post_crop_w[1];
+		y = info->post_crop_y[1];
+		h = info->post_crop_h[1];
+	} else {
+		/* All POSTs are disabled */
+		x = 0;
+		y = 0;
+		w = VIIF_CROP_MIN_W;
+		h = VIIF_CROP_MIN_H;
+	}
+	viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_H(0), x);
+	viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_OFS_V(0), y);
+	viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_HSIZE(0), w);
+	viif_capture_write(viif_dev, REG_L2_ROI_X_OUT_VSIZE(0), h);
+
+	for (i = 0; i < VIIF_MAX_POST_NUM; i++)
+		viif_capture_write(
+			viif_dev, REG_L2_ROI_TO_POST(i),
+			info->post_enable_flag[i] ? 0 : VIIF_L2_ROI_NONE);
+}
+
+/* Set ROI path condition */
+void visconti_viif_l2_set_roi_path(struct viif_device *viif_dev)
+{
+	if (viif_dev->l2_roi_path_info.roi_num == 1)
+		viif_l2_set_roi_num_1(viif_dev);
+	else
+		viif_l2_set_roi_num_2(viif_dev);
+}
+
+/**
+ * viif_l2_set_img_transmission() - Set image transfer condition of L2ISP
+ *
+ * @viif_dev: the VIIF device
+ * @post_id: POST ID. Range: [0..1]
+ * @enable: set True to enable image transfer of MAIN unit.
+ * @src: Pointer to crop area information
+ * @out_process: Pointer to output process information
+ * @img: Pointer to output image information
+ *
+ * see also: #viif_l2_set_roi_path
+ */
+static void
+viif_l2_set_img_transmission(struct viif_device *viif_dev, u32 post_id,
+			     bool enable, const struct v4l2_rect *src,
+			     const struct viif_out_process *out_process,
+			     const struct viif_img *img)
+{
+	const struct viif_pixelmap *pm;
+
+	/* DISABLE: no DMA transmission setup, set minimum crop rectangle */
+	if (!enable) {
+		viif_dev->l2_roi_path_info.post_enable_flag[post_id] = false;
+		viif_dev->l2_roi_path_info.post_crop_x[post_id] = 0;
+		viif_dev->l2_roi_path_info.post_crop_y[post_id] = 0;
+		viif_dev->l2_roi_path_info.post_crop_w[post_id] =
+			VIIF_CROP_MIN_W;
+		viif_dev->l2_roi_path_info.post_crop_h[post_id] =
+			VIIF_CROP_MIN_H;
+		visconti_viif_l2_set_roi_path(viif_dev);
+
+		return;
+	}
+
+	pm = &img->pixelmap[0];
+	viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_G(post_id),
+			   (u32)pm->pmap_dma);
+	viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_G(post_id),
+			   pm->pitch);
+	if (img->num_planes == 3) {
+		pm = &img->pixelmap[1];
+		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_B(post_id),
+				   (u32)pm->pmap_dma);
+		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_B(post_id),
+				   pm->pitch);
+		pm = &img->pixelmap[2];
+		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_STADR_R(post_id),
+				   (u32)pm->pmap_dma);
+		viif_capture_write(viif_dev, REG_L2_POST_X_OUT_PITCH_R(post_id),
+				   pm->pitch);
+	}
+
+	/* Set CROP */
+	viif_capture_write(viif_dev, REG_L2_POST_X_CAP_OFFSET(post_id),
+			   (src->top << 16) | src->left);
+	viif_capture_write(viif_dev, REG_L2_POST_X_CAP_SIZE(post_id),
+			   (src->height << 16) | src->width);
+
+	/* Set output process */
+	viif_capture_write(viif_dev, REG_L2_POST_X_HALF_SCALE_EN(post_id),
+			   out_process->half_scale ? 1 : 0);
+	viif_capture_write(viif_dev, REG_L2_POST_X_C_SELECT(post_id),
+			   out_process->select_color);
+	viif_capture_write(viif_dev, REG_L2_POST_X_OPORTALP(post_id),
+			   (u32)out_process->alpha);
+	viif_capture_write(viif_dev, REG_L2_POST_X_OPORTFMT(post_id),
+			   img->format);
+
+	/* Update ROI area and input to each POST */
+	viif_dev->l2_roi_path_info.post_enable_flag[post_id] = true;
+	viif_dev->l2_roi_path_info.post_crop_x[post_id] = src->left;
+	viif_dev->l2_roi_path_info.post_crop_y[post_id] = src->top;
+	viif_dev->l2_roi_path_info.post_crop_w[post_id] = src->width;
+	viif_dev->l2_roi_path_info.post_crop_h[post_id] = src->height;
+	visconti_viif_l2_set_roi_path(viif_dev);
+}
+
+/**
+ * viif_sub_set_img_transmission() - Set image transfer condition of SUB unit
+ *
+ * @viif_dev: the VIIF device
+ * @img: Pointer to output image information
+ */
+static void viif_sub_set_img_transmission(struct viif_device *viif_dev,
+					  const struct viif_img *img)
+{
+	dma_addr_t img_start_addr, img_end_addr;
+	u32 data_width, pitch, height;
+	u32 port_control;
+
+	/* Disable VDMAC when img is NULL */
+	if (!img) {
+		viif_capture_write(viif_dev, REG_IPORTS_IMGEN, 0);
+		port_control = ~BIT(3) &
+			       viif_capture_read(viif_dev, REG_VDM_W_ENABLE);
+		viif_capture_write(viif_dev, REG_VDM_W_ENABLE, port_control);
+		return;
+	}
+
+	img_start_addr = (u32)img->pixelmap[0].pmap_dma;
+	pitch = img->pixelmap[0].pitch;
+	height = img->height;
+
+	if (img->format == VIIF_ONE_COLOR_8) {
+		data_width = 0;
+		img_end_addr = img_start_addr + img->width - 1;
+	} else {
+		/* VIIF_ONE_COLOR_16 */
+		data_width = 1;
+		img_end_addr = img_start_addr + (img->width * 2) - 1;
+	}
+
+	viif_capture_write(viif_dev,
+			   REG_VDM_WPORT_X_W_SRAM_BASE(IDX_WPORT_SUB_IMG),
+			   VDMAC_SRAM_BASE_ADDR_W03);
+	viif_capture_write(viif_dev,
+			   REG_VDM_WPORT_X_W_SRAM_SIZE(IDX_WPORT_SUB_IMG),
+			   SRAM_SIZE_W_PORT);
+	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_STADR(IDX_WPORT_SUB_IMG),
+			   (u32)img_start_addr);
+	viif_capture_write(viif_dev,
+			   REG_VDM_WPORT_X_W_ENDADR(IDX_WPORT_SUB_IMG),
+			   (u32)img_end_addr);
+	viif_capture_write(viif_dev,
+			   REG_VDM_WPORT_X_W_HEIGHT(IDX_WPORT_SUB_IMG), height);
+	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_PITCH(IDX_WPORT_SUB_IMG),
+			   pitch);
+	viif_capture_write(viif_dev, REG_VDM_WPORT_X_W_CFG0(IDX_WPORT_SUB_IMG),
+			   data_width << 8);
+	port_control = BIT(3) | viif_capture_read(viif_dev, REG_VDM_W_ENABLE);
+	viif_capture_write(viif_dev, REG_VDM_W_ENABLE, port_control);
+	viif_capture_write(viif_dev, REG_IPORTS_IMGEN, 1);
+}
+
+/*----------------------------------------------
+ * handling V4L2 framework
+ */
+struct viif_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+};
+
+static inline struct viif_buffer *vb2_to_viif(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct viif_buffer, vb);
+}
+
+static inline struct cap_dev *video_drvdata_to_capdev(struct file *file)
+{
+	return (struct cap_dev *)video_drvdata(file);
+}
+
+static inline struct cap_dev *vb2queue_to_capdev(struct vb2_queue *vq)
+{
+	return (struct cap_dev *)vb2_get_drv_priv(vq);
+}
+
+/* ----- ISRs and VB2 Operations ----- */
+static void viif_set_img(struct cap_dev *cap_dev, struct vb2_buffer *vb)
+{
+	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct viif_img next_out_img;
+	int i;
+
+	next_out_img.width = pix->width;
+	next_out_img.height = pix->height;
+	next_out_img.format = cap_dev->out_format;
+	next_out_img.num_planes = pix->num_planes;
+
+	for (i = 0; i < pix->num_planes; i++) {
+		next_out_img.pixelmap[i].pitch = pix->plane_fmt[i].bytesperline;
+		next_out_img.pixelmap[i].pmap_dma =
+			vb2_dma_contig_plane_dma_addr(vb, i);
+	}
+
+	guard(spinlock)(&viif_dev->regbuf_lock);
+	guard(viif_isp)(viif_dev);
+
+	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0)
+		viif_l2_set_img_transmission(viif_dev, VIIF_L2ISP_POST_0, true,
+					     &cap_dev->img_area,
+					     &cap_dev->out_process,
+					     &next_out_img);
+	else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1)
+		viif_l2_set_img_transmission(viif_dev, VIIF_L2ISP_POST_1, true,
+					     &cap_dev->img_area,
+					     &cap_dev->out_process,
+					     &next_out_img);
+	else if (cap_dev->pathid == CAPTURE_PATH_SUB)
+		viif_sub_set_img_transmission(viif_dev, &next_out_img);
+}
+
+/**
+ * viif_capture_switch_buffer() is called from interrupt service routine
+ * triggered by VSync with some fixed delay.
+ * The function may switch DMA target buffer by calling viif_set_img().
+ * The VIIF DMA HW captures the destination address at next VSync
+ * and completes transfer at one more after.
+ * Therefore, filled buffer is available at the one after next ISR.
+ *
+ * To avoid DMA HW getting stuck, we always need to set valid destination
+ * address.
+ * If a prepared buffer is not available, we reuse the buffer currently being
+ * transferred to.
+ *
+ * The cap_dev structure has two pointers and a queue to handle video buffers;
+ + Description of each item at the entry of this function:
+ * * buf_queue:  holds prepared buffers, set by vb2_queue()
+ * * active:     pointing at address captured (and to be filled) by DMA HW
+ * * dma_active: pointing at buffer filled by DMA HW
+ *
+ * Rules to update items:
+ * * when buf_queue is not empty, "active" buffer goes "dma_active"
+ * * when buf_queue is empty:
+ *   * "active" buffer stays the same.
+ *   * DMA HW fills the same buffer for coming two frames
+ *   * "dma_active" gets NULL
+ *   * The Filled buffer will be reused. It should not go "DONE" at next ISR
+ *
+ * Simulation:
+ * | buf_queue   | active  | dma_active | note |
+ * | X           | NULL    | NULL       |      |
+ * <QBUF BUF0>
+ * | X           | BUF0    | NULL       | BUF0 stays |
+ * | X           | BUF0    | NULL       | BUF0 stays |
+ * <QBUF BUF1>
+ * <QBUF BUF2>
+ * | BUF2 BUF1   | BUF0    | NULL       |      |
+ * | BUF2        | BUF1    | BUF0       | BUF0 goes DONE |
+ * | X           | BUF2    | BUF1       | BUF1 goes DONE, BUF2 stays |
+ * | X           | BUF2    | NULL       | BUF2 stays |
+ */
+void visconti_viif_capture_switch_buffer(struct cap_dev *cap_dev,
+					 u32 status_err, u32 l2_transfer_status,
+					 u64 timestamp)
+{
+	guard(spinlock)(&cap_dev->buf_lock);
+
+	if (cap_dev->dma_active) {
+		/* DMA has completed and another framebuffer instance is set */
+		struct vb2_v4l2_buffer *vbuf = cap_dev->dma_active;
+		enum vb2_buffer_state state;
+
+		cap_dev->buf_cnt--;
+		vbuf->vb2_buf.timestamp = timestamp;
+		vbuf->sequence = cap_dev->sequence++;
+		vbuf->field = V4L2_FIELD_NONE;
+		if (status_err || l2_transfer_status)
+			state = VB2_BUF_STATE_ERROR;
+		else
+			state = VB2_BUF_STATE_DONE;
+
+		vb2_buffer_done(&vbuf->vb2_buf, state);
+	}
+
+	/* Pop the queue to and set as the next DMA target */
+	/* if the queue is empty, reuse current buffer */
+	if (!list_empty(&cap_dev->buf_queue)) {
+		struct viif_buffer *buf = list_entry(cap_dev->buf_queue.next,
+						     struct viif_buffer, queue);
+		list_del_init(&buf->queue);
+		viif_set_img(cap_dev, &buf->vb.vb2_buf);
+		cap_dev->dma_active = cap_dev->active;
+		cap_dev->active = &buf->vb;
+	} else {
+		cap_dev->dma_active = NULL;
+	}
+}
+
+/* --- Capture buffer control --- */
+static int viif_vb2_setup(struct vb2_queue *vq, unsigned int *count,
+			  unsigned int *num_planes, unsigned int sizes[],
+			  struct device *alloc_devs[])
+{
+	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
+	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
+	unsigned int i;
+
+	/* num_planes is set: just check plane sizes. */
+	if (*num_planes) {
+		if (*num_planes != pix->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < pix->num_planes; i++)
+			if (sizes[i] < pix->plane_fmt[i].sizeimage)
+				return -EINVAL;
+
+		return 0;
+	}
+
+	/* num_planes not set: called from REQBUFS, just set plane sizes. */
+	*num_planes = pix->num_planes;
+	for (i = 0; i < pix->num_planes; i++)
+		sizes[i] = pix->plane_fmt[i].sizeimage;
+
+	cap_dev->buf_cnt = 0;
+
+	return 0;
+}
+
+static void viif_vb2_queue(struct vb2_buffer *vb)
+{
+	struct cap_dev *cap_dev = vb2queue_to_capdev(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct viif_buffer *buf = vb2_to_viif(vbuf);
+
+	guard(spinlock_irqsave)(&cap_dev->buf_lock);
+
+	list_add_tail(&buf->queue, &cap_dev->buf_queue);
+	cap_dev->buf_cnt++;
+}
+
+static int viif_vb2_prepare(struct vb2_buffer *vb)
+{
+	struct cap_dev *cap_dev = vb2queue_to_capdev(vb->vb2_queue);
+	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	unsigned int i;
+
+	for (i = 0; i < pix->num_planes; i++) {
+		if (vb2_plane_size(vb, i) < pix->plane_fmt[i].sizeimage) {
+			dev_info(viif_dev->dev,
+				 "Plane size too small (%lu < %u)\n",
+				 vb2_plane_size(vb, i),
+				 pix->plane_fmt[i].sizeimage);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb, i, pix->plane_fmt[i].sizeimage);
+	}
+	return 0;
+}
+
+static void viif_return_all_buffers(struct cap_dev *cap_dev,
+				    enum vb2_buffer_state state)
+{
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct viif_buffer *buf;
+
+	guard(spinlock_irqsave)(&cap_dev->buf_lock);
+
+	/* Buffer control */
+	if (cap_dev->active) {
+		vb2_buffer_done(&cap_dev->active->vb2_buf, state);
+		cap_dev->buf_cnt--;
+		cap_dev->active = NULL;
+	}
+	if (cap_dev->dma_active) {
+		vb2_buffer_done(&cap_dev->dma_active->vb2_buf, state);
+		cap_dev->buf_cnt--;
+		cap_dev->dma_active = NULL;
+	}
+
+	/* Release all queued buffers. */
+	list_for_each_entry(buf, &cap_dev->buf_queue, queue) {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		cap_dev->buf_cnt--;
+	}
+	INIT_LIST_HEAD(&cap_dev->buf_queue);
+	if (cap_dev->buf_cnt)
+		dev_err(viif_dev->dev, "Buffer count error %d\n",
+			cap_dev->buf_cnt);
+}
+
+static int viif_l2_set_format(struct cap_dev *cap_dev);
+static const struct viif_fmt *get_viif_fmt_from_fourcc(struct cap_dev *cap_dev,
+						       unsigned int fourcc);
+
+static int viif_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	guard(mutex)(&viif_dev->stream_lock);
+
+	ret = video_device_pipeline_start(&cap_dev->vdev, &viif_dev->pipe);
+	if (ret) {
+		dev_err(viif_dev->dev, "start pipeline failed %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(viif_dev->dev);
+	if (ret) {
+		dev_err(viif_dev->dev, "failed to power on %d\n", ret);
+		goto release_pipe;
+	}
+
+	cap_dev->sequence = 0;
+
+	/* Currently, we assume that POST0 is enabled first and disabled last */
+	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
+		/* POST0/POST1 common initialization starts here*/
+		ret = visconti_viif_isp_main_set_unit(viif_dev);
+		if (ret) {
+			dev_err(viif_dev->dev,
+				"Setting up main path0 L1ISP failed %d\n", ret);
+			goto config_path_end;
+		}
+		/*
+		 * POST0 and POST1 use the same parameter
+		 * for undistortion and scaling.
+		 * Separate parameters can be set in viif_l2_set_roi.
+		 */
+		viif_dev->l2_roi_path_info.roi_num = 1;
+		/*
+		 * Initialize the coordinate of crop rectangles here.
+		 * The size will be initialized in viif_l2_set_format().
+		 * The coordinate can be set using parameter buffer in
+		 * viif_l2_set_crop().
+		 *
+		 * Considering the typical sequence shown below:
+		 *    - start streaming POST0
+		 *    - set coordinate using parameter buffer
+		 *    - start streaming POST1
+		 *
+		 * to avoid losing POST1's coordinate,
+		 * initial coordinates of both POSTs should be set
+		 * at the POST0's initialization, not at each POST's.
+		 */
+		viif_dev->cap_post0.img_area.left = 0;
+		viif_dev->cap_post0.img_area.top = 0;
+		viif_dev->cap_post1.img_area.left = 0;
+		viif_dev->cap_post1.img_area.top = 0;
+
+		/* POST0 specific initialization starts here */
+		ret = viif_l2_set_format(cap_dev);
+		if (ret) {
+			dev_err(viif_dev->dev,
+				"Setting up main path0 L2VDM failed %d\n", ret);
+			goto config_path_end;
+		}
+	} else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1) {
+		ret = viif_l2_set_format(cap_dev);
+		if (ret) {
+			dev_err(viif_dev->dev,
+				"Setting up main path1 L2VDM failed %d\n", ret);
+			goto config_path_end;
+		}
+	} else {
+		cap_dev->out_format =
+			get_viif_fmt_from_fourcc(cap_dev,
+						 cap_dev->v4l2_pix.pixelformat)
+						->bpp[0] > 8 ?
+				VIIF_ONE_COLOR_16 :
+				VIIF_ONE_COLOR_8;
+		ret = visconti_viif_isp_sub_set_unit(viif_dev);
+		if (ret) {
+			dev_err(viif_dev->dev,
+				"Setting up sub path failed %d\n", ret);
+			goto config_path_end;
+		}
+	}
+
+	remote_pad = media_pad_remote_pad_first(&cap_dev->vdev.entity.pads[0]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, BIT(0));
+	if (ret)
+		dev_err(viif_dev->dev,
+			"Start resizer/isp subdevice stream failed. %d\n", ret);
+
+config_path_end:
+	if (ret) {
+		viif_return_all_buffers(cap_dev, VB2_BUF_STATE_QUEUED);
+		pm_runtime_put(viif_dev->dev);
+		ret = -EPIPE;
+	}
+release_pipe:
+	if (ret)
+		video_device_pipeline_stop(&cap_dev->vdev);
+	return ret;
+}
+
+static void viif_stop_streaming(struct vb2_queue *vq)
+{
+	struct cap_dev *cap_dev = vb2queue_to_capdev(vq);
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	int ret;
+
+	guard(mutex)(&viif_dev->stream_lock);
+
+	remote_pad = media_pad_remote_pad_first(&cap_dev->vdev.entity.pads[0]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT(0));
+	if (ret)
+		dev_err(viif_dev->dev, "Stop isp subdevice stream failed %d\n",
+			ret);
+
+	viif_return_all_buffers(cap_dev, VB2_BUF_STATE_ERROR);
+
+	ret = pm_runtime_put(viif_dev->dev);
+	if (ret)
+		dev_err(viif_dev->dev, "power down failed %d\n", ret);
+
+	video_device_pipeline_stop(&cap_dev->vdev);
+}
+
+static const struct vb2_ops viif_vb2_ops = {
+	.queue_setup = viif_vb2_setup,
+	.buf_queue = viif_vb2_queue,
+	.buf_prepare = viif_vb2_prepare,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = viif_start_streaming,
+	.stop_streaming = viif_stop_streaming,
+};
+
+/* --- VIIF hardware settings --- */
+/* L2ISP output csc setting for YUV to RGB(ITU-R BT.709) */
+static const struct viif_csc_param viif_csc_yuv2rgb = {
+	.r_cr_in_offset = 0x18000,
+	.g_y_in_offset = 0x1f000,
+	.b_cb_in_offset = 0x18000,
+	.coef = {
+		[0] = 0x1000,
+		[1] = 0xfd12,
+		[2] = 0xf8ad,
+		[3] = 0x1000,
+		[4] = 0x1d07,
+		[5] = 0x0000,
+		[6] = 0x1000,
+		[7] = 0x0000,
+		[8] = 0x18a2,
+	},
+	.r_cr_out_offset = 0x1000,
+	.g_y_out_offset = 0x1000,
+	.b_cb_out_offset = 0x1000,
+};
+
+/* L2ISP output csc setting for RGB to YUV(ITU-R BT.709) */
+static const struct viif_csc_param viif_csc_rgb2yuv = {
+	.r_cr_in_offset = 0x1f000,
+	.g_y_in_offset = 0x1f000,
+	.b_cb_in_offset = 0x1f000,
+	.coef = {
+		[0] = 0x0b71,
+		[1] = 0x0128,
+		[2] = 0x0367,
+		[3] = 0xf9b1,
+		[4] = 0x082f,
+		[5] = 0xfe20,
+		[6] = 0xf891,
+		[7] = 0xff40,
+		[8] = 0x082f,
+	},
+	.r_cr_out_offset = 0x8000,
+	.g_y_out_offset = 0x1000,
+	.b_cb_out_offset = 0x8000,
+};
+
+static int viif_l2_set_format(struct cap_dev *cap_dev)
+{
+	struct v4l2_pix_format_mplane *pix = &cap_dev->v4l2_pix;
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	const struct viif_csc_param *csc_param = NULL;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	bool inp_is_rgb = false;
+	bool out_is_rgb = false;
+	u32 postid;
+	int ret;
+
+	/* check path id */
+	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0) {
+		fmt.pad = VIIF_ISP_PAD_SRC_PATH0;
+		postid = VIIF_L2ISP_POST_0;
+	} else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1) {
+		fmt.pad = VIIF_ISP_PAD_SRC_PATH1;
+		postid = VIIF_L2ISP_POST_1;
+	} else {
+		return -EINVAL;
+	}
+
+	cap_dev->out_process.half_scale = false;
+	cap_dev->out_process.select_color = VIIF_COLOR_YUV_RGB;
+	cap_dev->out_process.alpha = 0;
+
+	ret = v4l2_subdev_call(&viif_dev->isp_subdev.sd, pad, get_fmt, NULL,
+			       &fmt);
+	if (!ret) {
+		inp_is_rgb = (fmt.format.code == MEDIA_BUS_FMT_RGB888_1X24);
+		cap_dev->img_area.width = fmt.format.width;
+		cap_dev->img_area.height = fmt.format.height;
+	} else {
+		cap_dev->img_area.width = pix->width;
+		cap_dev->img_area.height = pix->height;
+	}
+
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_RGB24:
+		cap_dev->out_format = VIIF_RGB888_PACKED;
+		out_is_rgb = true;
+		break;
+	case V4L2_PIX_FMT_ABGR32:
+		cap_dev->out_format = VIIF_ARGB8888_PACKED;
+		cap_dev->out_process.alpha = 0xff;
+		out_is_rgb = true;
+		break;
+	case V4L2_PIX_FMT_YUV422M:
+		cap_dev->out_format = VIIF_YCBCR422_8_PLANAR;
+		break;
+	case V4L2_PIX_FMT_YUV444M:
+		cap_dev->out_format = VIIF_RGB888_YCBCR444_8_PLANAR;
+		break;
+	case V4L2_PIX_FMT_Y16:
+		cap_dev->out_format = VIIF_ONE_COLOR_16;
+		cap_dev->out_process.select_color = VIIF_COLOR_Y_G;
+		break;
+	case V4L2_PIX_FMT_UYVY:
+		cap_dev->out_format = VIIF_YCBCR422_8_PACKED;
+		break;
+	}
+
+	if (!inp_is_rgb && out_is_rgb)
+		csc_param = &viif_csc_yuv2rgb; /* YUV -> RGB */
+	else if (inp_is_rgb && !out_is_rgb)
+		csc_param = &viif_csc_rgb2yuv; /* RGB -> YUV */
+
+	viif_l2_set_output_csc(viif_dev, postid, csc_param);
+
+	return 0;
+}
+
+/* --- IOCTL Operations --- */
+static const struct viif_fmt viif_capture_fmt_list_mainpath[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.bpp = { 24, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 384,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_ABGR32,
+		.bpp = { 32, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 512,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV422M,
+		.bpp = { 8, 4, 4 },
+		.num_planes = 3,
+		.colorspace = V4L2_COLORSPACE_REC709,
+		.pitch_align = 128,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUV444M,
+		.bpp = { 8, 8, 8 },
+		.num_planes = 3,
+		.colorspace = V4L2_COLORSPACE_REC709,
+		.pitch_align = 128,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y16,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_REC709,
+		.pitch_align = 128,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_REC709,
+		.pitch_align = 128,
+	},
+};
+
+static const struct viif_fmt viif_capture_fmt_list_subpath[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.bpp = { 8, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.bpp = { 8, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.bpp = { 8, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.bpp = { 8, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB16,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG16,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG16,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.bpp = { 16, 0, 0 },
+		.num_planes = 1,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.pitch_align = 256,
+	},
+};
+
+static const struct viif_fmt *get_viif_fmt_from_fourcc(struct cap_dev *cap_dev,
+						       unsigned int fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < cap_dev->fmt_size; i++) {
+		const struct viif_fmt *fmt = &cap_dev->fmts[i];
+
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+	return NULL;
+}
+
+static u32 get_pixelformat_from_fourcc(struct cap_dev *cap_dev,
+				       unsigned int fourcc)
+{
+	const struct viif_fmt *fmt = get_viif_fmt_from_fourcc(cap_dev, fourcc);
+
+	return fmt ? fmt->fourcc : cap_dev->fmts[0].fourcc;
+}
+
+static u32 get_pixelformat_from_mbus_code(struct cap_dev *cap_dev,
+					  unsigned int mbus_code)
+{
+	unsigned int fourcc;
+
+	switch (mbus_code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		fourcc = V4L2_PIX_FMT_SRGGB8;
+		break;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		fourcc = V4L2_PIX_FMT_SRGGB16;
+		break;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		fourcc = V4L2_PIX_FMT_SGRBG8;
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+		fourcc = V4L2_PIX_FMT_SGRBG16;
+		break;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+		fourcc = V4L2_PIX_FMT_SGBRG8;
+		break;
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+		fourcc = V4L2_PIX_FMT_SGBRG16;
+		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		fourcc = V4L2_PIX_FMT_SBGGR8;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+		fourcc = V4L2_PIX_FMT_SBGGR16;
+		break;
+	default:
+		return cap_dev->fmts[0].fourcc;
+	}
+
+	return get_pixelformat_from_fourcc(cap_dev, fourcc);
+}
+
+static void viif_calc_plane_sizes(struct cap_dev *cap_dev,
+				  struct v4l2_pix_format_mplane *pix)
+{
+	const struct viif_fmt *viif_fmt =
+		get_viif_fmt_from_fourcc(cap_dev, pix->pixelformat);
+	unsigned int i;
+
+	for (i = 0; i < viif_fmt->num_planes; i++) {
+		struct v4l2_plane_pix_format *plane_i = &pix->plane_fmt[i];
+		unsigned int bpl;
+
+		memset(plane_i, 0, sizeof(*plane_i));
+		bpl = roundup(pix->width * viif_fmt->bpp[i] / 8,
+			      viif_fmt->pitch_align);
+
+		plane_i->bytesperline = bpl;
+		plane_i->sizeimage = pix->height * bpl;
+	}
+	pix->num_planes = viif_fmt->num_planes;
+}
+
+static int viif_querycap(struct file *file, void *priv,
+			 struct v4l2_capability *cap)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	strscpy(cap->driver, VIIF_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, cap_dev->vdev.name, sizeof(cap->card));
+
+	return 0;
+}
+
+static int viif_enum_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_fmtdesc *f)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	if (f->index >= cap_dev->fmt_size)
+		return -EINVAL;
+
+	f->pixelformat = cap_dev->fmts[f->index].fourcc;
+	return 0;
+}
+
+static void viif_try_fmt(struct cap_dev *cap_dev,
+			 struct v4l2_pix_format_mplane *pix)
+{
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *sd;
+	int ret;
+
+	/* check path id */
+	sd = &viif_dev->isp_subdev.sd;
+	if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST0)
+		format.pad = VIIF_ISP_PAD_SRC_PATH0;
+	else if (cap_dev->pathid == CAPTURE_PATH_MAIN_POST1)
+		format.pad = VIIF_ISP_PAD_SRC_PATH1;
+	else
+		format.pad = VIIF_ISP_PAD_SRC_PATH2;
+
+	pix->field = V4L2_FIELD_NONE;
+	pix->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pix->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
+	if (ret) {
+		/* minimal default format */
+		pix->width = VIIF_MIN_OUTPUT_IMG_WIDTH;
+		pix->height = VIIF_MIN_OUTPUT_IMG_HEIGHT;
+		pix->pixelformat = (cap_dev->pathid == CAPTURE_PATH_SUB) ?
+					   V4L2_PIX_FMT_SRGGB8 :
+					   V4L2_PIX_FMT_RGB24;
+		viif_calc_plane_sizes(cap_dev, pix);
+		return;
+	}
+
+	pix->width = format.format.width;
+	pix->height = format.format.height;
+
+	/* check output format */
+	if (cap_dev->pathid == CAPTURE_PATH_SUB)
+		pix->pixelformat = get_pixelformat_from_mbus_code(
+			cap_dev, format.format.code);
+	else
+		pix->pixelformat =
+			get_pixelformat_from_fourcc(cap_dev, pix->pixelformat);
+
+	/* update derived parameters, such as bpp */
+	viif_calc_plane_sizes(cap_dev, pix);
+}
+
+static int viif_try_fmt_vid_cap(struct file *file, void *priv,
+				struct v4l2_format *f)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	viif_try_fmt(cap_dev, &f->fmt.pix_mp);
+	return 0;
+}
+
+static int viif_s_fmt_vid_cap(struct file *file, void *priv,
+			      struct v4l2_format *f)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	if (vb2_is_busy(&cap_dev->vb2_vq))
+		return -EBUSY;
+
+	viif_try_fmt(cap_dev, &f->fmt.pix_mp);
+	cap_dev->v4l2_pix = f->fmt.pix_mp;
+
+	return 0;
+}
+
+static int viif_g_fmt_vid_cap(struct file *file, void *priv,
+			      struct v4l2_format *f)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	f->fmt.pix_mp = cap_dev->v4l2_pix;
+
+	return 0;
+}
+
+static int viif_enum_framesizes(struct file *file, void *fh,
+				struct v4l2_frmsizeenum *fsize)
+{
+	struct cap_dev *cap_dev = video_drvdata_to_capdev(file);
+
+	if (fsize->index)
+		return -EINVAL;
+
+	if (!get_viif_fmt_from_fourcc(cap_dev, fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = VIIF_MIN_OUTPUT_IMG_WIDTH;
+	fsize->stepwise.max_width = VIIF_MAX_OUTPUT_IMG_WIDTH_ISP;
+	fsize->stepwise.min_height = VIIF_MIN_OUTPUT_IMG_HEIGHT;
+	fsize->stepwise.max_height = VIIF_MAX_OUTPUT_IMG_HEIGHT_ISP;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops viif_ioctl_ops = {
+	.vidioc_querycap = viif_querycap,
+
+	.vidioc_enum_fmt_vid_cap = viif_enum_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap_mplane = viif_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap_mplane = viif_s_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap_mplane = viif_g_fmt_vid_cap,
+
+	.vidioc_enum_framesizes = viif_enum_framesizes,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	.vidioc_log_status = v4l2_ctrl_log_status,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+/* --- File Operations --- */
+static const struct v4l2_pix_format_mplane pixm_default[3] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_RGB24,
+		.width = 1920,
+		.height = 1080,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_RGB24,
+		.width = 1920,
+		.height = 1080,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_SRGGB8,
+		.width = 1920,
+		.height = 1080,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+	}
+};
+
+static const struct v4l2_file_operations viif_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+	.poll = vb2_fop_poll,
+};
+
+/* ----- media control callbacks ----- */
+static int viif_capture_link_validate(struct media_link *link)
+{
+	/* link validation at start-stream */
+	return 0;
+}
+
+static const struct media_entity_operations viif_media_ops = {
+	.link_validate = viif_capture_link_validate,
+};
+
+/* ----- register/remove capture device node ----- */
+static int viif_capture_register_node(struct cap_dev *cap_dev)
+{
+	struct viif_device *viif_dev = cap_dev->viif_dev;
+	struct v4l2_device *v4l2_dev = &viif_dev->v4l2_dev;
+	struct video_device *vdev = &cap_dev->vdev;
+	struct vb2_queue *q = &cap_dev->vb2_vq;
+	static const char *const node_name[] = {
+		"viif_capture_post0",
+		"viif_capture_post1",
+		"viif_capture_sub",
+	};
+	struct v4l2_pix_format_mplane pixm;
+	int ret;
+
+	INIT_LIST_HEAD(&cap_dev->buf_queue);
+
+	mutex_init(&cap_dev->vlock);
+	spin_lock_init(&cap_dev->buf_lock);
+
+	/* Initialize image format */
+	pixm = pixm_default[cap_dev->pathid];
+	viif_try_fmt(cap_dev, &pixm);
+	cap_dev->v4l2_pix = pixm;
+
+	/* Initialize vb2 queue. */
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->min_queued_buffers = 3;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->ops = &viif_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->drv_priv = cap_dev;
+	q->buf_struct_size = sizeof(struct viif_buffer);
+	q->lock = &cap_dev->vlock;
+	q->dev = viif_dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		goto error_destroy_mutex;
+
+	/* Register the video device. */
+	strscpy(vdev->name, node_name[cap_dev->pathid], sizeof(vdev->name));
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->lock = &cap_dev->vlock;
+	vdev->queue = &cap_dev->vb2_vq;
+	vdev->fops = &viif_fops;
+	vdev->ioctl_ops = &viif_ioctl_ops;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING;
+	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->entity.ops = &viif_media_ops;
+	vdev->release = video_device_release_empty;
+	video_set_drvdata(vdev, cap_dev);
+	vdev->vfl_dir = VFL_DIR_RX;
+	cap_dev->capture_pad.flags = MEDIA_PAD_FL_SINK;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(v4l2_dev->dev, "failed to register device: %d\n", ret);
+		goto error_destroy_mutex;
+	}
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &cap_dev->capture_pad);
+	if (ret)
+		goto error_video_unregister;
+
+	return 0;
+
+error_video_unregister:
+	vb2_video_unregister_device(vdev);
+error_destroy_mutex:
+	mutex_destroy(&cap_dev->vlock);
+	return ret;
+}
+
+static void viif_capture_unregister_node(struct cap_dev *cap_dev)
+{
+	media_entity_cleanup(&cap_dev->vdev.entity);
+	vb2_video_unregister_device(&cap_dev->vdev);
+	mutex_destroy(&cap_dev->vlock);
+}
+
+int visconti_viif_capture_register(struct viif_device *viif_dev)
+{
+	int ret;
+
+	/* register MAIN POST0 (primary RGB)*/
+	viif_dev->cap_post0.pathid = CAPTURE_PATH_MAIN_POST0;
+	viif_dev->cap_post0.viif_dev = viif_dev;
+	viif_dev->cap_post0.fmts = viif_capture_fmt_list_mainpath;
+	viif_dev->cap_post0.fmt_size =
+		ARRAY_SIZE(viif_capture_fmt_list_mainpath);
+	ret = viif_capture_register_node(&viif_dev->cap_post0);
+	if (ret)
+		return ret;
+
+	/* register MAIN POST1 (additional RGB)*/
+	viif_dev->cap_post1.pathid = CAPTURE_PATH_MAIN_POST1;
+	viif_dev->cap_post1.viif_dev = viif_dev;
+	viif_dev->cap_post1.fmts = viif_capture_fmt_list_mainpath;
+	viif_dev->cap_post1.fmt_size =
+		ARRAY_SIZE(viif_capture_fmt_list_mainpath);
+	ret = viif_capture_register_node(&viif_dev->cap_post1);
+	if (ret)
+		goto error_unregister_post0;
+
+	/* register SUB (RAW) */
+	viif_dev->cap_sub.pathid = CAPTURE_PATH_SUB;
+	viif_dev->cap_sub.viif_dev = viif_dev;
+	viif_dev->cap_sub.fmts = viif_capture_fmt_list_subpath;
+	viif_dev->cap_sub.fmt_size = ARRAY_SIZE(viif_capture_fmt_list_subpath);
+	ret = viif_capture_register_node(&viif_dev->cap_sub);
+	if (ret)
+		goto error_unregister_post1;
+
+	return 0;
+
+error_unregister_post1:
+	viif_capture_unregister_node(&viif_dev->cap_post1);
+error_unregister_post0:
+	viif_capture_unregister_node(&viif_dev->cap_post0);
+
+	return ret;
+}
+
+void visconti_viif_capture_unregister(struct viif_device *viif_dev)
+{
+	viif_capture_unregister_node(&viif_dev->cap_sub);
+	viif_capture_unregister_node(&viif_dev->cap_post1);
+	viif_capture_unregister_node(&viif_dev->cap_post0);
+}
diff --git a/drivers/media/platform/toshiba/visconti/viif_capture.h b/drivers/media/platform/toshiba/visconti/viif_capture.h
new file mode 100644
index 000000000000..6952e59bb874
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_capture.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_CAPTURE_H__
+#define __VIIF_CAPTURE_H__
+
+struct cap_dev;
+struct viif_device;
+
+void visconti_viif_capture_switch_buffer(struct cap_dev *cap_dev,
+					 u32 status_err, u32 l2_transfer_status,
+					 u64 timestamp);
+
+void visconti_viif_l2_set_roi_path(struct viif_device *viif_dev);
+
+int visconti_viif_capture_register(struct viif_device *viif_dev);
+void visconti_viif_capture_unregister(struct viif_device *viif_dev);
+
+#endif /* __VIIF_CAPTURE_H__ */
diff --git a/drivers/media/platform/toshiba/visconti/viif_common.c b/drivers/media/platform/toshiba/visconti/viif_common.c
new file mode 100644
index 000000000000..1d1b65245309
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_common.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+
+#include "viif.h"
+#include "viif_common.h"
+#include "viif_regs.h"
+
+/*----------------------------------------------
+ * Low level guards for registers
+ */
+
+#define VIIF_L1_CRGBF_R_START_ADDR_LIMIT 0x0200U
+#define VIIF_L1_CRGBF_R_END_ADDR_LIMIT	 0x10bfU
+#define VIIF_L2_CRGBF_R_START_ADDR_LIMIT 0x1cU
+#define VIIF_L2_CRGBF_R_END_ADDR_LIMIT	 0x1fU
+
+/**
+ * viif_main_mask_vlatch() - Control Vlatch mask of MAIN unit
+ *
+ * @viif_dev: the VIIF device
+ * @enable: true to enable Vlatch mask of MAIN unit, false to disable
+ */
+static void viif_main_mask_vlatch(struct viif_device *viif_dev, bool enable)
+{
+	u32 val = enable ? MASK_IPORTM_VLATCH : 0;
+
+	viif_capture_write(viif_dev, REG_IPORTM0_LD, val);
+	viif_capture_write(viif_dev, REG_IPORTM1_LD, val);
+}
+
+/**
+ * visconti_viif_isp_set_regbuf_auto_transmission() - Set register buffer auto
+ * transmission
+ *
+ * @viif_dev: the VIIF device
+ */
+void visconti_viif_isp_set_regbuf_auto_transmission(struct viif_device *viif_dev)
+{
+	/* Set parameters for auto read transmission of register buffer */
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_A_CONF, 0);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_A_CONF, 0);
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_RBADDR,
+			   VIIF_L1_CRGBF_R_START_ADDR_LIMIT);
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_READDR,
+			   VIIF_L1_CRGBF_R_END_ADDR_LIMIT);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_RBADDR,
+			   VIIF_L2_CRGBF_R_START_ADDR_LIMIT);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_READDR,
+			   VIIF_L2_CRGBF_R_END_ADDR_LIMIT);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_A_CONF,
+			   VAL_L2_CRGBF_TRN_AUTO_READ_BANK0);
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_A_CONF,
+			   VAL_L1_CRGBF_TRN_AUTO_READ_BANK0);
+}
+
+/**
+ * viif_isp_disable_regbuf_auto_transmission() - Disable register buffer
+ * auto transmission
+ *
+ * @viif_dev: the VIIF device
+ */
+static void
+viif_isp_disable_regbuf_auto_transmission(struct viif_device *viif_dev)
+{
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_A_CONF, 0);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_A_CONF, 0);
+}
+
+/**
+ * visconti_viif_isp_guard_start() - stop register auto update
+ *
+ * @viif_dev: the VIIF device
+ *
+ * This function call stops update of some hardware registers
+ * while the manual setup of VIIF, L1ISP registers is in progress.
+ *
+ * * regbuf control: load/store HW register values to backup SRAM.
+ * * vlatch control: copy timer-counter register value to status register.
+ */
+void visconti_viif_isp_guard_start(struct viif_device *viif_dev)
+{
+	viif_isp_disable_regbuf_auto_transmission(viif_dev);
+	ndelay(500);
+	viif_main_mask_vlatch(viif_dev, true);
+}
+
+/**
+ * visconti_viif_isp_guard_end() - restart register auto update
+ *
+ * @viif_dev: the VIIF device
+ *
+ * see also visconti_viif_isp_guard_start().
+ */
+void visconti_viif_isp_guard_end(struct viif_device *viif_dev)
+{
+	viif_main_mask_vlatch(viif_dev, false);
+	visconti_viif_isp_set_regbuf_auto_transmission(viif_dev);
+}
+
+/*----------------------------------------------
+ * supported Visual formats
+ */
+static const struct viif_mbus_format mbus_formats[] = {
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24,
+	  .bpp = 24,
+	  .is_bayer = false,
+	  .rgb_out = true,
+	  .mipi_dt = MIPI_CSI2_DT_RGB888 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,
+	  .bpp = 16,
+	  .is_bayer = false,
+	  .rgb_out = false,
+	  .mipi_dt = MIPI_CSI2_DT_YUV422_8B },
+	{ .code = MEDIA_BUS_FMT_UYVY10_1X20,
+	  .bpp = 20,
+	  .is_bayer = false,
+	  .rgb_out = false,
+	  .mipi_dt = MIPI_CSI2_DT_YUV422_10B },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X16,
+	  .bpp = 16,
+	  .is_bayer = false,
+	  .rgb_out = true,
+	  .mipi_dt = MIPI_CSI2_DT_RGB565 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8,
+	  .bpp = 8,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_BGGR,
+	  .mipi_dt = MIPI_CSI2_DT_RAW8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8,
+	  .bpp = 8,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GBRG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8,
+	  .bpp = 8,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GRBG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,
+	  .bpp = 8,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_RGGB,
+	  .mipi_dt = MIPI_CSI2_DT_RAW8 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	  .bpp = 10,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_BGGR,
+	  .mipi_dt = MIPI_CSI2_DT_RAW10 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10,
+	  .bpp = 10,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GBRG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW10 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	  .bpp = 10,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GRBG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW10 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	  .bpp = 10,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_RGGB,
+	  .mipi_dt = MIPI_CSI2_DT_RAW10 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12,
+	  .bpp = 12,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_BGGR,
+	  .mipi_dt = MIPI_CSI2_DT_RAW12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12,
+	  .bpp = 12,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GBRG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	  .bpp = 12,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GRBG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12,
+	  .bpp = 12,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_RGGB,
+	  .mipi_dt = MIPI_CSI2_DT_RAW12 },
+
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14,
+	  .bpp = 14,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_BGGR,
+	  .mipi_dt = MIPI_CSI2_DT_RAW14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14,
+	  .bpp = 14,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GBRG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14,
+	  .bpp = 14,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_GRBG,
+	  .mipi_dt = MIPI_CSI2_DT_RAW14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14,
+	  .bpp = 14,
+	  .is_bayer = true,
+	  .rgb_out = false,
+	  .bayer_pattern = VAL_L1_SYSM_START_COLOR_RGGB,
+	  .mipi_dt = MIPI_CSI2_DT_RAW14 },
+};
+
+const struct viif_mbus_format *
+visconti_viif_mbus_format_from_code(unsigned int mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mbus_formats); i++)
+		if (mbus_formats[i].code == mbus_code)
+			return &mbus_formats[i];
+
+	return NULL;
+}
+
+const struct viif_mbus_format *visconti_viif_mbus_format_nth(unsigned int n)
+{
+	return (n < ARRAY_SIZE(mbus_formats)) ? &mbus_formats[n] : NULL;
+}
diff --git a/drivers/media/platform/toshiba/visconti/viif_common.h b/drivers/media/platform/toshiba/visconti/viif_common.h
new file mode 100644
index 000000000000..6ed34794f1ee
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_common.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_COMMON_H__
+#define __VIIF_COMMON_H__
+
+#include "viif.h"
+
+/**
+ * struct viif_mbus_format - description of supported input format
+ *
+ * @code: V4L2 media bus format (coming from image sensor)
+ * @bpp: bits per pixel
+ * @mipi_dt: MIPI Datatype corresponding to code
+ * @bayer_pattern: ordering of bayer color filter
+ * @is_bayer: true when the format is bayer, false otherwise
+ * @rgb_out:
+ * * True: L1ISP output is RGB format
+ * * False: L1ISP output is YUV format
+ */
+struct viif_mbus_format {
+	unsigned int code;
+	unsigned int bpp;
+	unsigned int mipi_dt;
+	unsigned int bayer_pattern;
+	bool is_bayer;
+	bool rgb_out;
+};
+
+void visconti_viif_isp_set_regbuf_auto_transmission(
+	struct viif_device *viif_dev);
+void visconti_viif_isp_guard_start(struct viif_device *viif_dev);
+void visconti_viif_isp_guard_end(struct viif_device *viif_dev);
+
+DEFINE_GUARD(viif_isp, struct viif_device *, visconti_viif_isp_guard_start(_T),
+	     visconti_viif_isp_guard_end(_T))
+
+const struct viif_mbus_format *
+visconti_viif_mbus_format_from_code(unsigned int mbus_code);
+const struct viif_mbus_format *visconti_viif_mbus_format_nth(unsigned int n);
+
+#endif /* __VIIF_COMMON_H__ */
diff --git a/drivers/media/platform/toshiba/visconti/viif_isp.c b/drivers/media/platform/toshiba/visconti/viif_isp.c
new file mode 100644
index 000000000000..6ad4723a37cc
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_isp.c
@@ -0,0 +1,976 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "viif.h"
+#include "viif_common.h"
+#include "viif_isp.h"
+#include "viif_regs.h"
+
+/* Disable CSI2 capture at viif_mux_start() */
+#define VIIF_CSI2_NOT_CAPTURE 0xFFFFFFFF
+
+/* Horizontal back porch size: [unit: system clock ticks] */
+#define VIIF_HBP_SYSCLK 10
+
+/* Active picture size: [unit: pixel] */
+#define VIIF_MIN_HACTIVE_PIXEL_W_L1ISP	640
+#define VIIF_MAX_HACTIVE_PIXEL_W_L1ISP	3840
+#define VIIF_MIN_HACTIVE_PIXEL_WO_L1ISP 128
+#define VIIF_MAX_HACTIVE_PIXEL_WO_L1ISP 4096
+
+/* Picture vertical size: [unit: line] */
+#define VIIF_MIN_VACTIVE_LINE_WO_L1ISP 128
+#define VIIF_MAX_VACTIVE_LINE_WO_L1ISP 2160
+#define VIIF_MIN_VACTIVE_LINE_W_L1ISP  480
+#define VIIF_MAX_VACTIVE_LINE_W_L1ISP  2160
+
+/* Internal operation latencies: [unit: system clock ticks]*/
+#define VIIF_TABLE_LOAD_TIME	24000
+#define VIIF_REGBUF_ACCESS_TIME 15360
+
+/* Offset of Vsync delay: [unit: line] */
+#define VIIF_L1_DELAY_WO_HDRC 11
+
+/* Timeout definitions for viif_stop_mux() */
+/*
+ * wait time for force abort to complete (max 1line time = 1228.8 us)
+ * when width = 4096, RAW24, 80Mbps
+ */
+#define VIIF_WAIT_ABORT_COMPLETE_TIME 1229
+
+/*
+ * Complete time of register buffer transfer.
+ * Actual time is about 30us in case of L1ISP
+ */
+#define VIIF_WAIT_ISP_REGBF_TRNS_COMPLETE_TIME 39
+
+/* Default parameters for V4L2 subdevice node */
+#define VIIF_ISP_DEFAULT_WIDTH	1920
+#define VIIF_ISP_DEFAULT_HEIGHT 1080
+
+/* Maximum dimension of CROP with ISP */
+#define VIIF_CROP_MAX_W_ISP 8190
+#define VIIF_CROP_MAX_H_ISP 4094
+
+/* Minimum horizontal/vertical dimension of CROP */
+#define VIIF_CROP_MIN_W 128
+#define VIIF_CROP_MIN_H 128
+
+/* CSI2RX DPHY settings: registers reside in ISP register region */
+enum viif_csi2rx_dphy_lane {
+	VIIF_CSI2RX_DPHY_L0L1L2L3 = 0U,
+	VIIF_CSI2RX_DPHY_L0L3L1L2 = 1U,
+	VIIF_CSI2RX_DPHY_L0L2L3L1 = 2U,
+	VIIF_CSI2RX_DPHY_L0L1L3L2 = 4U,
+	VIIF_CSI2RX_DPHY_L0L3L2L1 = 5U,
+	VIIF_CSI2RX_DPHY_L0L2L1L3 = 6U
+};
+
+#define VIIF_DPHY_CFG_CLK_25M 32U
+
+/**
+ * struct viif_input_img - input image information
+ *
+ * @pixel_clock: pixel clock [unit: Hz]. Range: [3375000..600000000]
+ * @htotal_size: horizontal total size [unit: pixel]. Range: [143..65535]
+ * @hactive_size: horizontal active size [unit: pixel]
+ * * Range (w/o L1ISP): [128..4096] (multiple of 2)
+ * * Range (with L1ISP): [640..3840] (multiple of 8)
+ * * Range (SUB path): 0
+ * @vtotal_size: vertical total size [unit: line].
+ * * Range: [144..16383]
+ * @vbp_size: vertical back porch size.
+ * * Range: [5..4095]
+ * @vactive_size: vertical active size [unit: line].
+ * * Range (w/o L1ISP) [128..2160] (multiple of 2)
+ * * Range (with L1ISP) [480..2160] (multiple of 2)
+ * @hobc_width: the number of horizontal optical black pixels.
+ * * Range (w/o L1ISP): 0
+ * * Range (with L1ISP):  [0,16,32,64 or 128]
+ *   * should be 0 when hobc_margin = 0
+ * * Range (SUB path): 0
+ * @hobc_margin: the number of horizontal optical black margin.
+ * * Range (w/o L1ISP): 0
+ * * Range (with L1ISP): [0..30] (even number)
+ +   * should be 0 when hobc_width = 0
+ * * Range (SUB path): 0
+ *
+ * Constraints between parameters:
+ *
+ * * (htotal_size > (hactive_size + hobc_width + hobc_margin))
+ * * (vtotal_size > (vbp_size + vactive_size))
+ * * vbp_size >= table_xfer_time * line_frequency + margin
+ *   * w/o L1ISP:
+ *     * table_xfer_time = 39360 / system_clock
+ *     * line_frequency = pixel_clock / htotal_size
+ *     * margin = 16
+ *   * with L1ISP:
+ *     * table_xfer_time = 54720 / system_clock
+ *     * line_frequency = pixel_clock / htotal_size
+ +     * margin = 38
+ *
+ * Note: L1ISP is used when RAW data is input to MAIN unit
+ */
+struct viif_input_img {
+	u32 pixel_clock;
+	u32 htotal_size;
+	u32 hactive_size;
+	u32 vtotal_size;
+	u32 vbp_size;
+	u32 vactive_size;
+	u32 hobc_width;
+	u32 hobc_margin;
+};
+
+/*----------------------------------------------
+ * Low Layer Implementation
+ */
+/* Convert the unit of time-period (from sysclk, to num lines in the image) */
+static u32 sysclk_to_numlines(u32 time_in_sysclk, unsigned long sys_rate,
+			      const struct viif_input_img *img)
+{
+	u64 v1 = (u64)time_in_sysclk * img->pixel_clock;
+	u64 v2 = (u64)img->htotal_size * sys_rate;
+
+	return div64_u64(v1, v2);
+}
+
+static u32 lineperiod_in_sysclk(unsigned long sys_rate,
+				const struct viif_input_img *img)
+{
+	return div64_u64((u64)img->htotal_size * sys_rate, img->pixel_clock);
+}
+
+/**
+ * viif_main_set_unit() - Set static configuration of MAIN unit(CH0 or CH1)
+ *
+ * @viif_dev: the VIIF device
+ * @data_type: DT of image; either of
+ *     YUV422_8B, YUV422_10B, RGB565, RGB888, RAW8, RAW10, RAW12, RAW14
+ * @in_img: Pointer to input image information
+ * @yuv_interp: true to use interpolation for YUV422 to YUV444 conversion.
+ */
+static void viif_main_set_unit(struct viif_device *viif_dev, u32 data_type,
+			       const struct viif_input_img *in_img,
+			       bool yuv_interp)
+{
+	u32 total_hact_size;
+	u32 sw_delay0, sw_delay1, hw_delay;
+	u32 val, color, sysclk_num;
+
+	if (data_type == MIPI_CSI2_DT_RAW8 || data_type == MIPI_CSI2_DT_RAW10 ||
+	    data_type == MIPI_CSI2_DT_RAW12 ||
+	    data_type == MIPI_CSI2_DT_RAW14) {
+		total_hact_size = in_img->hactive_size + in_img->hobc_width +
+				  in_img->hobc_margin;
+	} else {
+		total_hact_size = in_img->hactive_size;
+	}
+
+	/* Set DT and color type of image data */
+	viif_capture_write(viif_dev, REG_IPORTM_MAIN_DT,
+			   (data_type << 8) | data_type);
+	viif_capture_write(viif_dev, REG_IPORTM_OTHER, 0x00);
+
+	/* Set back porch*/
+	viif_capture_write(viif_dev, REG_BACK_PORCH_M,
+			   (in_img->vbp_size << 16) | VIIF_HBP_SYSCLK);
+
+	/* Single pulse of vsync is input to DPGM */
+	viif_capture_write(viif_dev, REG_DPGM_VSYNC_SOURCE,
+			   VAL_DPGM_VSYNC_PULSE);
+
+	/* Set preprocess type before L2ISP based on color_type. */
+	if (data_type == MIPI_CSI2_DT_YUV422_8B ||
+	    data_type == MIPI_CSI2_DT_YUV422_10B) {
+		color = VAL_PREPROCESS_FMT_YUV422;
+	} else if (data_type == MIPI_CSI2_DT_RGB565 ||
+		   data_type == MIPI_CSI2_DT_RGB888) {
+		color = VAL_PREPROCESS_FMT_RGB;
+	} else {
+		/* RGB or YUV444 from L1ISP */
+		color = VAL_PREPROCESS_FMT_YUV444;
+	}
+	viif_capture_write(viif_dev, REG_PREPROCESS_FMTM, color);
+
+	/* Set Total size and valid size information of image data */
+	sysclk_num = lineperiod_in_sysclk(viif_dev->clkrate, in_img);
+	sysclk_num &= GENMASK(15, 0);
+	viif_capture_write(viif_dev, REG_TOTALSIZE_M,
+			   (in_img->vtotal_size << 16) | sysclk_num);
+	viif_capture_write(viif_dev, REG_VALSIZE_M,
+			   (in_img->vactive_size << 16) | total_hact_size);
+
+	/* Set image size information to L2ISP */
+	viif_capture_write(viif_dev, REG_L2_SENSOR_CROP_VSIZE,
+			   in_img->vactive_size);
+	viif_capture_write(viif_dev, REG_L2_SENSOR_CROP_HSIZE,
+			   in_img->hactive_size);
+
+	/* RAW input case */
+	if (data_type >= MIPI_CSI2_DT_RAW8) {
+		/* Interpolation mode = by LINE */
+		viif_capture_write(viif_dev, REG_L1_IBUF_INPUT_ORDER, 1);
+		viif_capture_write(viif_dev, REG_L1_SYSM_HEIGHT,
+				   in_img->vactive_size);
+		viif_capture_write(viif_dev, REG_L1_SYSM_WIDTH,
+				   in_img->hactive_size);
+		val = (in_img->hobc_margin << 8) | in_img->hobc_width;
+		viif_capture_write(viif_dev, REG_L1_HOBC_MARGIN, val);
+	}
+
+	/* Disable rawpack */
+	viif_capture_write(viif_dev, REG_IPORTM_MAIN_RAW, 0);
+
+	/* Set yuv_conv; only for VAL_PREPROCESS_FMT_YUV422 */
+	viif_capture_write(viif_dev, REG_PREPROCESS_C24M, yuv_interp ? 1 : 0);
+
+	/* Set vsync delay */
+	hw_delay = in_img->vbp_size -
+		   sysclk_to_numlines(VIIF_TABLE_LOAD_TIME, viif_dev->clkrate,
+				      in_img) +
+		   4;
+	hw_delay = min(hw_delay, 255);
+
+	sw_delay0 = hw_delay -
+		    sysclk_to_numlines(VIIF_REGBUF_ACCESS_TIME,
+				       viif_dev->clkrate, in_img) +
+		    2;
+
+	if (data_type == MIPI_CSI2_DT_RAW8 || data_type == MIPI_CSI2_DT_RAW10 ||
+	    data_type == MIPI_CSI2_DT_RAW12 ||
+	    data_type == MIPI_CSI2_DT_RAW14) {
+		sw_delay1 = sysclk_to_numlines(VIIF_REGBUF_ACCESS_TIME,
+					       viif_dev->clkrate, in_img) +
+			    VIIF_L1_DELAY_WO_HDRC + 1;
+	} else {
+		sw_delay1 = 10;
+	}
+	viif_capture_write(viif_dev, REG_INT_M0_LINE, sw_delay0 << 16);
+	viif_capture_write(viif_dev, REG_INT_M1_LINE,
+			   (sw_delay1 << 16) | hw_delay);
+
+	/* M2_LINE is the same condition as M1_LINE */
+	viif_capture_write(viif_dev, REG_INT_M2_LINE,
+			   (sw_delay1 << 16) | hw_delay);
+
+	/* Hold pixel_clock, htotal_size for future use */
+	viif_dev->img_clk.pixel_clock = in_img->pixel_clock;
+	viif_dev->img_clk.htotal_size = in_img->htotal_size;
+}
+
+/**
+ * viif_sub_set_unit() - Set static configuration of SUB unit
+ *
+ * @viif_dev: the VIIF device
+ * @dt_image: DT of image. Range: [0x1e, 0x1f, 0x22, 0x24, 0x2a-0x2d]
+ * @in_img: Pointer to input image information
+ */
+static void viif_sub_set_unit(struct viif_device *viif_dev, u32 dt_image,
+			      const struct viif_input_img *in_img)
+{
+	u32 sysclk_num, temp_delay;
+
+	viif_capture_write(viif_dev, REG_IPORTS_MAIN_DT, dt_image);
+	viif_capture_write(viif_dev, REG_IPORTS_OTHER, 0x00);
+
+	/* Set line size and delay value of delayed Vsync */
+	sysclk_num = lineperiod_in_sysclk(viif_dev->clkrate, in_img);
+	viif_capture_write(viif_dev, REG_INT_SA0_LINE,
+			   sysclk_num & GENMASK(15, 0));
+	temp_delay = in_img->vbp_size - 4;
+	if (temp_delay > 255) {
+		/* Replace the value with HW max spec */
+		temp_delay = 255;
+	}
+	viif_capture_write(viif_dev, REG_INT_SA1_LINE, temp_delay);
+}
+
+/**
+ * viif_mux_start() - Setup CSI-2 input path
+ *
+ * @viif_dev: the VIIF device
+ * @vc_main: VCID to capture with Main unit
+ * * Range [0..3]
+ * * VIIF_CSI2_NOT_CAPTURE to disable
+ * @vc_sub:  VCID to capture with Sub unit
+ * * Range [0..3]
+ * * VIIF_CSI2_NOT_CAPTURE to disable
+ */
+static void viif_mux_start(struct viif_device *viif_dev, u32 vc_main,
+			   u32 vc_sub)
+{
+	bool en_vc0 = false, en_vc1 = false;
+
+	viif_capture_write(viif_dev, REG_IPORTM, VAL_IPORTM_INPUT_CSI2);
+
+	if (vc_main != VIIF_CSI2_NOT_CAPTURE) {
+		viif_capture_write(viif_dev, REG_VCID0SELECT, vc_main);
+		en_vc0 = true;
+	}
+	if (vc_sub != VIIF_CSI2_NOT_CAPTURE) {
+		viif_capture_write(viif_dev, REG_VCID1SELECT, vc_sub);
+		en_vc1 = true;
+	}
+
+	/* Control VC port enable */
+	viif_capture_write(viif_dev, REG_VCPORTEN,
+			   (en_vc0 ? MASK_VCPORTEN_EN_VC0 : 0) |
+				   (en_vc1 ? MASK_VCPORTEN_EN_VC1 : 0));
+
+	if (en_vc0) {
+		/* Update flag information for run status of MAIN unit */
+		viif_dev->run_flag_main = true;
+	}
+}
+
+/**
+ * viif_mux_stop() - Teardown CSI-2 input path
+ *
+ * @viif_dev: the VIIF device
+ * Return: 0 for success, -ETIMEDOUT for timeout error
+ */
+static int viif_mux_stop(struct viif_device *viif_dev)
+{
+	u64 timeout_ns, cur_ns;
+
+	/* Disable auto transmission of register buffer */
+	viif_capture_write(viif_dev, REG_L1_CRGBF_TRN_A_CONF, 0);
+	viif_capture_write(viif_dev, REG_L2_CRGBF_TRN_A_CONF, 0);
+
+	/* Wait for completion of register buffer transmission */
+	udelay(VIIF_WAIT_ISP_REGBF_TRNS_COMPLETE_TIME);
+
+	/* Stop all VCs, long packet input and emb data input of MAIN unit */
+	viif_capture_write(viif_dev, REG_VCPORTEN, 0);
+	viif_capture_write(viif_dev, REG_IPORTM_OTHEREN, 0);
+	viif_capture_write(viif_dev, REG_IPORTM_EMBEN, 0);
+
+	/* Stop image data input, long packet input and emb data input of SUB unit */
+	viif_capture_write(viif_dev, REG_IPORTS_OTHEREN, 0);
+	viif_capture_write(viif_dev, REG_IPORTS_EMBEN, 0);
+	viif_capture_write(viif_dev, REG_IPORTS_IMGEN, 0);
+
+	/* Stop VDMAC for all table ports, input ports and write ports */
+	viif_capture_write(viif_dev, REG_VDM_T_ENABLE, 0);
+	viif_capture_write(viif_dev, REG_VDM_R_ENABLE, 0);
+	viif_capture_write(viif_dev, REG_VDM_W_ENABLE, 0);
+
+	/* Stop all groups(g00, g01 and g02) of VDMAC */
+	viif_capture_write(viif_dev, REG_VDM_ABORTSET, 0x7);
+
+	timeout_ns = ktime_get_ns() + VIIF_WAIT_ABORT_COMPLETE_TIME * 1000;
+
+	do {
+		u32 status_r, status_w, status_t, l2_status;
+
+		/* Get VDMAC transfer status  */
+		status_r = viif_capture_read(viif_dev, REG_VDM_R_RUN);
+		status_w = viif_capture_read(viif_dev, REG_VDM_W_RUN);
+		status_t = viif_capture_read(viif_dev, REG_VDM_T_RUN);
+		l2_status = viif_capture_read(viif_dev, REG_L2_BUS_L2_STATUS);
+
+		if (!status_r && !status_w && !status_t && !l2_status) {
+			viif_dev->run_flag_main = false;
+			return 0;
+		}
+
+		cur_ns = ktime_get_ns();
+	} while (timeout_ns > cur_ns);
+
+	return -ETIMEDOUT;
+}
+
+/*----------------------------------------------
+ * handling V4L2 framework
+ */
+/* ----- Supported MBUS formats ----- */
+static bool viif_get_mbus_rgb_out(unsigned int mbus_code)
+{
+	const struct viif_mbus_format *fmt;
+
+	fmt = visconti_viif_mbus_format_from_code(mbus_code);
+
+	return fmt ? fmt->rgb_out : false; /* YUV as default */
+}
+
+/* ----- Handling main processing path ----- */
+/* Find a linked media entity which represents a sensor */
+static struct media_entity *viif_find_sensor(struct media_entity *entity)
+{
+	struct media_pad *pad;
+
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			return NULL;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			return NULL;
+
+		entity = pad->entity;
+		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+			return entity;
+	}
+}
+
+static int viif_get_dv_timings(struct viif_device *viif_dev,
+			       struct v4l2_dv_timings *timings,
+			       unsigned int *mbus_code)
+{
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = 0,
+	};
+	struct media_entity *sensor_entity;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *sensor_sd;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	sensor_entity = viif_find_sensor(&viif_dev->isp_subdev.sd.entity);
+	if (!sensor_entity)
+		return -EINVAL;
+
+	sensor_sd = media_entity_to_v4l2_subdev(sensor_entity);
+	if (!sensor_sd)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sensor_sd);
+	if (state) {
+		ret = v4l2_subdev_call(sensor_sd, pad, get_fmt, state, &format);
+		v4l2_subdev_unlock_state(state);
+	} else {
+		struct v4l2_subdev_pad_config pad_cfg;
+		struct v4l2_subdev_state pad_state = { .pads = &pad_cfg };
+
+		ret = v4l2_subdev_call(sensor_sd, pad, get_fmt, &pad_state,
+				       &format);
+	}
+	if (ret)
+		return ret;
+
+	/* Some video I/F support dv_timings query */
+	ret = v4l2_subdev_call(sensor_sd, pad, g_dv_timings, 0, timings);
+	if (!ret) {
+		*mbus_code = format.format.code;
+		return 0;
+	}
+
+	/* Others: call some discrete APIs */
+	timings->bt.width = format.format.width;
+	timings->bt.height = format.format.height;
+	*mbus_code = format.format.code;
+
+	ctrl = v4l2_ctrl_find(sensor_sd->ctrl_handler, V4L2_CID_HBLANK);
+	if (!ctrl) {
+		dev_err(viif_dev->dev, "subdev: V4L2_CID_HBLANK error.\n");
+		return -EINVAL;
+	}
+	timings->bt.hsync = v4l2_ctrl_g_ctrl(ctrl);
+
+	ctrl = v4l2_ctrl_find(sensor_sd->ctrl_handler, V4L2_CID_VBLANK);
+	if (!ctrl) {
+		dev_err(viif_dev->dev, "subdev: V4L2_CID_VBLANK error.\n");
+		return -EINVAL;
+	}
+	timings->bt.vsync = v4l2_ctrl_g_ctrl(ctrl);
+
+	ctrl = v4l2_ctrl_find(sensor_sd->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		dev_err(viif_dev->dev, "subdev: V4L2_CID_PIXEL_RATE error.\n");
+		return -EINVAL;
+	}
+	timings->bt.pixelclock = v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
+static unsigned int dt_image_from_mbus_code(unsigned int mbus_code)
+{
+	const struct viif_mbus_format *fmt;
+
+	fmt = visconti_viif_mbus_format_from_code(mbus_code);
+
+	return fmt ? fmt->mipi_dt : MIPI_CSI2_DT_RGB888;
+}
+
+static void set_isp_input_depth_and_bayer_pattern(struct viif_device *viif_dev,
+						  unsigned int mbus_code)
+{
+	const struct viif_mbus_format *format;
+
+	format = visconti_viif_mbus_format_from_code(mbus_code);
+	if (format && format->is_bayer) {
+		viif_capture_write(viif_dev, REG_L1_IBUF_DEPTH, format->bpp);
+		viif_capture_write(viif_dev, REG_L1_SYSM_START_COLOR,
+				   format->bayer_pattern);
+	}
+}
+
+int visconti_viif_isp_main_set_unit(struct viif_device *viif_dev)
+{
+	struct viif_input_img in_img_main = {};
+	struct v4l2_dv_timings timings = {};
+	bool yuv_interp = false;
+	unsigned int data_type;
+	unsigned int mbus_code;
+	int ret = 0;
+
+	ret = viif_get_dv_timings(viif_dev, &timings, &mbus_code);
+	if (ret) {
+		dev_err(viif_dev->dev,
+			"could not get timing information of subdev");
+		return -EINVAL;
+	}
+
+	data_type = dt_image_from_mbus_code(mbus_code);
+
+	set_isp_input_depth_and_bayer_pattern(viif_dev, mbus_code);
+
+	yuv_interp = (data_type == MIPI_CSI2_DT_YUV422_8B ||
+		      data_type == MIPI_CSI2_DT_YUV422_10B);
+
+	in_img_main.hactive_size = timings.bt.width;
+	in_img_main.vactive_size = timings.bt.height;
+	in_img_main.htotal_size = timings.bt.width + timings.bt.hsync;
+	in_img_main.vtotal_size = timings.bt.height + timings.bt.vsync;
+	in_img_main.pixel_clock = timings.bt.pixelclock;
+	/* ISP can issue a frame error when too large VBP value is set */
+	in_img_main.vbp_size = min(100, timings.bt.vsync - 5);
+	in_img_main.hobc_width = 0;
+	in_img_main.hobc_margin = 0;
+
+	/* Configuration of MAIN unit */
+	viif_main_set_unit(viif_dev, data_type, &in_img_main, yuv_interp);
+
+	/* Enable regbuf */
+	visconti_viif_isp_set_regbuf_auto_transmission(viif_dev);
+
+	return 0;
+}
+
+int visconti_viif_isp_sub_set_unit(struct viif_device *viif_dev)
+{
+	struct viif_input_img in_img_sub;
+	struct v4l2_dv_timings timings;
+	unsigned int mbus_code;
+	unsigned int dt_image;
+	int ret;
+
+	ret = viif_get_dv_timings(viif_dev, &timings, &mbus_code);
+	if (ret)
+		return -EINVAL;
+
+	dt_image = dt_image_from_mbus_code(mbus_code);
+
+	in_img_sub.hactive_size = 0;
+	in_img_sub.vactive_size = timings.bt.height;
+	in_img_sub.htotal_size = timings.bt.width + timings.bt.hsync;
+	in_img_sub.vtotal_size = timings.bt.height + timings.bt.vsync;
+	in_img_sub.pixel_clock = timings.bt.pixelclock;
+	in_img_sub.vbp_size = timings.bt.vsync - 5;
+	in_img_sub.hobc_width = 0;
+	in_img_sub.hobc_margin = 0;
+
+	viif_sub_set_unit(viif_dev, dt_image, &in_img_sub);
+
+	return 0;
+};
+
+/* ----- Subdevice video operations ----- */
+static int visconti_viif_isp_enable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct viif_device *viif_dev = ((struct isp_subdev *)sd)->viif_dev;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	int ret;
+
+	/* Currently, we assume PATH0 is enabled first */
+	/* Currently, further configuration is only for PATH0 */
+	if (pad != VIIF_ISP_PAD_SRC_PATH0)
+		return 0;
+
+	remote_pad = media_pad_remote_pad_first(
+		&sd->entity.pads[VIIF_ISP_PAD_SINK_VIDEO]);
+	if (!remote_pad)
+		return -ENODEV;
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	/* Enabling: start ISP, MUX -> start CSI2RX, sensor */
+	viif_dev->masked_gamma_path = 0;
+	viif_mux_start(viif_dev, 0, 0);
+
+	/* CSI2RX control registers which reside in the ISP register region */
+	/* FIXED 25MHz clock for CSI2RX DPHY configuration clock */
+	viif_capture_write(viif_dev, REG_DPHY_FREQRANGE, VIIF_DPHY_CFG_CLK_25M);
+	/* CSI2 data lane swapping; controlled by a vendor specific register */
+	viif_capture_write(viif_dev, REG_DPHY_LANE, VIIF_CSI2RX_DPHY_L0L1L2L3);
+
+	/* Currently ISP.sink_video supports only stream0 */
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, BIT(0));
+	if (ret)
+		viif_mux_stop(viif_dev);
+
+	return ret;
+}
+
+static int visconti_viif_isp_disable_streams(struct v4l2_subdev *sd,
+					     struct v4l2_subdev_state *state,
+					     u32 pad, u64 streams_mask)
+{
+	struct viif_device *viif_dev = ((struct isp_subdev *)sd)->viif_dev;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+
+	/* Currently, we assume PATH0 is disabled last */
+	/* Currently, further configuration is only for PATH0 */
+	if (pad != VIIF_ISP_PAD_SRC_PATH0)
+		return 0;
+
+	remote_pad = media_pad_remote_pad_first(
+		&sd->entity.pads[VIIF_ISP_PAD_SINK_VIDEO]);
+	if (!remote_pad)
+		return -ENODEV;
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	/* Disabling: stop sensor, CSI2RX -> stop MUX, ISP */
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT(0));
+	viif_mux_stop(viif_dev);
+
+	return 0;
+}
+
+/* ----- Subdevice pad operations ----- */
+static int
+visconti_viif_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == VIIF_ISP_PAD_SINK_VIDEO) {
+		const struct viif_mbus_format *fmt;
+
+		fmt = visconti_viif_mbus_format_nth(code->index);
+		if (!fmt)
+			return -EINVAL;
+
+		code->code = fmt->code;
+		return 0;
+	} else if (code->pad == VIIF_ISP_PAD_SRC_PATH0 ||
+		   code->pad == VIIF_ISP_PAD_SRC_PATH1) {
+		struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(
+			sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+		if (viif_get_mbus_rgb_out(sink_fmt->code))
+			code->code = MEDIA_BUS_FMT_RGB888_1X24;
+		else
+			code->code = MEDIA_BUS_FMT_YUV8_1X24;
+		return 0;
+	} else if (code->pad == VIIF_ISP_PAD_SRC_PATH2) {
+		struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(
+			sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+		code->code = sink_fmt->code;
+		return 0;
+	} else if (code->pad == VIIF_ISP_PAD_SINK_PARAMS ||
+		   code->pad == VIIF_ISP_PAD_SRC_STATS) {
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static void visconti_viif_isp_set_sink_fmt(struct v4l2_subdev_state *sd_state,
+					   struct v4l2_mbus_framefmt *format)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src0_fmt, *src1_fmt, *src2_fmt;
+	const struct viif_mbus_format *mb_fmt;
+
+	sink_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+	src0_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH0);
+	src1_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH1);
+	src2_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH2);
+
+	/* Sink format */
+	mb_fmt = visconti_viif_mbus_format_from_code(format->code);
+	if (!mb_fmt)
+		mb_fmt = visconti_viif_mbus_format_nth(0);
+
+	sink_fmt->code = mb_fmt->code;
+
+	if (mb_fmt->is_bayer) {
+		u32 tmp_width = round_down(format->width, 8);
+		u32 tmp_height = round_down(format->height, 2);
+
+		sink_fmt->width = clamp(tmp_width,
+					VIIF_MIN_HACTIVE_PIXEL_W_L1ISP,
+					VIIF_MAX_HACTIVE_PIXEL_W_L1ISP);
+		sink_fmt->height = clamp(tmp_height,
+					 VIIF_MIN_VACTIVE_LINE_W_L1ISP,
+					 VIIF_MAX_VACTIVE_LINE_W_L1ISP);
+	} else {
+		u32 tmp_width = round_down(format->width, 2);
+		u32 tmp_height = round_down(format->height, 2);
+
+		sink_fmt->width = clamp(tmp_width,
+					VIIF_MIN_HACTIVE_PIXEL_WO_L1ISP,
+					VIIF_MAX_HACTIVE_PIXEL_WO_L1ISP);
+		sink_fmt->height = clamp(tmp_height,
+					 VIIF_MIN_VACTIVE_LINE_WO_L1ISP,
+					 VIIF_MAX_VACTIVE_LINE_WO_L1ISP);
+	}
+
+	/* Source format */
+	if (viif_get_mbus_rgb_out(sink_fmt->code)) {
+		src0_fmt->code = MEDIA_BUS_FMT_RGB888_1X24;
+		src1_fmt->code = MEDIA_BUS_FMT_RGB888_1X24;
+	} else {
+		src0_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
+		src1_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
+	}
+	src0_fmt->width = sink_fmt->width;
+	src0_fmt->height = sink_fmt->height;
+	src1_fmt->width = sink_fmt->width;
+	src1_fmt->height = sink_fmt->height;
+
+	/* SRC2 (RAW output) follows SINK format */
+	src2_fmt->code = mb_fmt->is_bayer ? sink_fmt->code :
+					    MEDIA_BUS_FMT_SRGGB10_1X10;
+	src2_fmt->width = sink_fmt->width;
+	src2_fmt->height = sink_fmt->height;
+
+	*format = *sink_fmt;
+}
+
+static void visconti_viif_isp_set_src_fmt(struct v4l2_subdev_state *sd_state,
+					  struct v4l2_mbus_framefmt *format,
+					  unsigned int pad)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	u32 tmp_width, tmp_height;
+
+	sink_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, pad);
+
+	if (viif_get_mbus_rgb_out(sink_fmt->code))
+		src_fmt->code = MEDIA_BUS_FMT_RGB888_1X24;
+	else
+		src_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
+
+	tmp_width = round_down(format->width, 2);
+	tmp_height = round_down(format->height, 2);
+	src_fmt->width = clamp(tmp_width, VIIF_CROP_MIN_W, VIIF_CROP_MAX_W_ISP);
+	src_fmt->height =
+		clamp(tmp_height, VIIF_CROP_MIN_H, VIIF_CROP_MAX_H_ISP);
+
+	*format = *src_fmt;
+}
+
+static void
+visconti_viif_isp_set_src_fmt_rawpath(struct v4l2_subdev_state *sd_state,
+				      struct v4l2_mbus_framefmt *format,
+				      unsigned int pad)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	const struct viif_mbus_format *mb_fmt;
+
+	sink_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, pad);
+	mb_fmt = visconti_viif_mbus_format_from_code(sink_fmt->code);
+
+	src_fmt->code = mb_fmt->is_bayer ? sink_fmt->code :
+					   MEDIA_BUS_FMT_SRGGB10_1X10;
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	*format = *src_fmt;
+}
+
+static int visconti_viif_isp_set_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_format *fmt)
+{
+	if (fmt->pad == VIIF_ISP_PAD_SINK_VIDEO)
+		visconti_viif_isp_set_sink_fmt(sd_state, &fmt->format);
+	else if (fmt->pad == VIIF_ISP_PAD_SRC_PATH2)
+		visconti_viif_isp_set_src_fmt_rawpath(sd_state, &fmt->format,
+						      fmt->pad);
+	else if (fmt->pad == VIIF_ISP_PAD_SRC_PATH0 ||
+		 fmt->pad == VIIF_ISP_PAD_SRC_PATH1)
+		visconti_viif_isp_set_src_fmt(sd_state, &fmt->format, fmt->pad);
+	else
+		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+
+	return 0;
+}
+
+static int visconti_viif_isp_init_state(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SINK_VIDEO);
+	sink_fmt->width = VIIF_ISP_DEFAULT_WIDTH;
+	sink_fmt->height = VIIF_ISP_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	src_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH0);
+	src_fmt->width = VIIF_ISP_DEFAULT_WIDTH;
+	src_fmt->height = VIIF_ISP_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
+
+	src_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH1);
+	src_fmt->width = VIIF_ISP_DEFAULT_WIDTH;
+	src_fmt->height = VIIF_ISP_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_YUV8_1X24;
+
+	src_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_PATH2);
+	src_fmt->width = VIIF_ISP_DEFAULT_WIDTH;
+	src_fmt->height = VIIF_ISP_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						VIIF_ISP_PAD_SINK_PARAMS);
+	src_fmt =
+		v4l2_subdev_state_get_format(sd_state, VIIF_ISP_PAD_SRC_STATS);
+	sink_fmt->width = 0;
+	sink_fmt->height = 0;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static int visconti_viif_isp_subdev_link_validate(struct media_link *link)
+{
+	if (link->sink->index == VIIF_ISP_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
+static const struct media_entity_operations visconti_viif_isp_media_ops = {
+	.link_validate = visconti_viif_isp_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_pad_ops visconti_viif_isp_pad_ops = {
+	.disable_streams = visconti_viif_isp_disable_streams,
+	.enable_streams = visconti_viif_isp_enable_streams,
+	.enum_mbus_code = visconti_viif_isp_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = visconti_viif_isp_set_fmt,
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+static const struct v4l2_subdev_video_ops visconti_viif_isp_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops visconti_viif_isp_ops = {
+	.video = &visconti_viif_isp_video_ops,
+	.pad = &visconti_viif_isp_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops visconti_viif_isp_internal_ops = {
+	.init_state = visconti_viif_isp_init_state,
+};
+
+/* ----- Register/remove isp subdevice node ----- */
+int visconti_viif_isp_register(struct viif_device *viif_dev)
+{
+	struct media_pad *pads = viif_dev->isp_subdev.pads;
+	struct v4l2_subdev *sd = &viif_dev->isp_subdev.sd;
+	int ret;
+
+	viif_dev->isp_subdev.viif_dev = viif_dev;
+
+	v4l2_subdev_init(sd, &visconti_viif_isp_ops);
+	sd->internal_ops = &visconti_viif_isp_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.ops = &visconti_viif_isp_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	sd->owner = THIS_MODULE;
+	strscpy(sd->name, "visconti-viif:isp", sizeof(sd->name));
+
+	pads[VIIF_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+					      MEDIA_PAD_FL_MUST_CONNECT;
+	pads[VIIF_ISP_PAD_SRC_PATH0].flags = MEDIA_PAD_FL_SOURCE |
+					     MEDIA_PAD_FL_MUST_CONNECT;
+	pads[VIIF_ISP_PAD_SRC_PATH1].flags = MEDIA_PAD_FL_SOURCE |
+					     MEDIA_PAD_FL_MUST_CONNECT;
+	pads[VIIF_ISP_PAD_SRC_PATH2].flags = MEDIA_PAD_FL_SOURCE |
+					     MEDIA_PAD_FL_MUST_CONNECT;
+	pads[VIIF_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	pads[VIIF_ISP_PAD_SRC_STATS].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, VIIF_ISP_PAD_NUM, pads);
+	if (ret) {
+		dev_err(viif_dev->dev, "Failed on media_entity_pads_init\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_device_register_subdev(&viif_dev->v4l2_dev, sd);
+	if (ret) {
+		dev_err(viif_dev->dev, "Failed to register ISP subdev\n");
+		goto err_cleanup_subdev;
+	}
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+void visconti_viif_isp_unregister(struct viif_device *viif_dev)
+{
+	v4l2_device_unregister_subdev(&viif_dev->isp_subdev.sd);
+	media_entity_cleanup(&viif_dev->isp_subdev.sd.entity);
+}
diff --git a/drivers/media/platform/toshiba/visconti/viif_isp.h b/drivers/media/platform/toshiba/visconti/viif_isp.h
new file mode 100644
index 000000000000..25d709d4d014
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_isp.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_ISP_H__
+#define __VIIF_ISP_H__
+
+struct viif_device;
+
+int visconti_viif_isp_main_set_unit(struct viif_device *viif_dev);
+int visconti_viif_isp_sub_set_unit(struct viif_device *viif_dev);
+
+int visconti_viif_isp_register(struct viif_device *viif_dev);
+void visconti_viif_isp_unregister(struct viif_device *viif_dev);
+
+#endif /* __VIIF_ISP_H__ */
diff --git a/drivers/media/platform/toshiba/visconti/viif_regs.h b/drivers/media/platform/toshiba/visconti/viif_regs.h
new file mode 100644
index 000000000000..bf68f04cbbc3
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/viif_regs.h
@@ -0,0 +1,726 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Toshiba Visconti Video Capture register definitions
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __VIIF_REGS_H__
+#define __VIIF_REGS_H__
+
+#include <linux/bitfield.h>
+
+/*----------------------------------------------
+ * Capture registers
+ */
+#define REG_IPORTM0_LD	   0
+#define REG_IPORTM1_LD	   0x4
+#define MASK_IPORTM_VLATCH 0x3
+
+#define REG_VCID0SELECT	      0x30
+#define REG_VCID1SELECT	      0x34
+#define REG_VCPORTEN	      0x3c
+#define MASK_VCPORTEN_EN_VC0  BIT(0)
+#define MASK_VCPORTEN_EN_VC1  BIT(4)
+#define REG_IPORTM	      0x54
+#define VAL_IPORTM_INPUT_CSI2 0
+
+#define REG_IPORTM_MAIN_DT		 0x58
+#define REG_IPORTM_MAIN_RAW		 0x5c
+#define REG_IPORTM_OTHER		 0x60
+#define REG_IPORTM_OTHEREN		 0x64
+#define REG_IPORTM_EMBEN		 0x68
+#define REG_IPORTS_MAIN_DT		 0x78
+#define REG_IPORTS_OTHER		 0x80
+#define REG_IPORTS_OTHEREN		 0x84
+#define REG_IPORTS_EMBEN		 0x88
+#define REG_IPORTS_IMGEN		 0x8c
+#define REG_TOTALSIZE_M			 0xc0
+#define REG_VALSIZE_M			 0xc4
+#define REG_BACK_PORCH_M		 0xc8
+#define REG_INT_M_SYNC			 0x130
+#define REG_INT_M_SYNC_MASK		 0x134
+#define MASK_INT_M_SYNC_VSYNC_INT	 BIT(0)
+#define MASK_INT_M_SYNC_LINES_DELAY_INT1 BIT(1)
+#define MASK_INT_M_SYNC_LINES_DELAY_INT2 BIT(2)
+#define MASK_INT_M_SYNC_SW_DELAY_INT0	 BIT(16)
+#define MASK_INT_M_SYNC_SW_DELAY_INT1	 BIT(17)
+#define MASK_INT_M_SYNC_SW_DELAY_INT2	 BIT(18)
+/* We only care for LINES_DELAY_INT2, SW_DELAY_INT2 */
+#define MASK_INT_M_SYNC_MASK_SET                                        \
+	(MASK_INT_M_SYNC_VSYNC_INT | MASK_INT_M_SYNC_LINES_DELAY_INT1 | \
+	 MASK_INT_M_SYNC_SW_DELAY_INT0 | MASK_INT_M_SYNC_SW_DELAY_INT1)
+#define MASK_INT_M_SYNC_MASK_ALL 0x00070007
+
+#define REG_INT_S_SYNC			 0x138
+#define REG_INT_S_SYNC_MASK		 0x13c
+#define MASK_INT_S_SYNC_VSYNC_INT	 BIT(0)
+#define MASK_INT_S_SYNC_LINES_DELAY_INT1 BIT(1)
+#define MASK_INT_S_SYNC_SW_DELAY_INT0	 BIT(16)
+#define MASK_INT_S_SYNC_SW_DELAY_INT1	 BIT(17)
+/* We only care for LINES_DELAY_INT1 */
+#define MASK_INT_S_SYNC_MASK_SET                                     \
+	(MASK_INT_S_SYNC_VSYNC_INT | MASK_INT_S_SYNC_SW_DELAY_INT0 | \
+	 MASK_INT_S_SYNC_SW_DELAY_INT1)
+#define MASK_INT_S_SYNC_MASK_ALL 0x03030303
+
+#define REG_INT_M0_LINE			     0x140
+#define REG_INT_M1_LINE			     0x144
+#define REG_INT_M2_LINE			     0x148
+#define REG_INT_SA0_LINE		     0x160
+#define REG_INT_SA1_LINE		     0x164
+#define REG_INT_M_STATUS		     0x180
+#define REG_INT_M_MASK			     0x184
+#define MASK_INT_M_L2ISP_SIZE_ERROR	     BIT(0)
+#define MASK_INT_M_CRGBF_INTCRGERR_WRSTART   BIT(1)
+#define MASK_INT_M_CRGBF_INTCRGERR_RDSTART   BIT(2)
+#define MASK_INT_M_EMBED_ERROR		     BIT(3)
+#define MASK_INT_M_USERDATA_ERROR	     BIT(4)
+#define MASK_INT_M_L2ISP_GAMMA_TABLE_TIMEOUT (BIT(8) | BIT(9) | BIT(10))
+#define MASK_INT_M_L2ISP_GRID_TABLE_TIMEOUT  BIT(11)
+#define MASK_INT_M_L1ISP_SIZE_ERROR0	     BIT(16)
+#define MASK_INT_M_L1ISP_SIZE_ERROR1	     BIT(17)
+#define MASK_INT_M_L1ISP_SIZE_ERROR2	     BIT(18)
+#define MASK_INT_M_L1ISP_SIZE_ERROR3	     BIT(19)
+#define MASK_INT_M_L1ISP_SIZE_ERROR4	     BIT(20)
+#define MASK_INT_M_L1ISP_INT_ERR_CRGWRSTART  BIT(21)
+#define MASK_INT_M_L1ISP_INT_ERR_CRGRDSTART  BIT(22)
+#define MASK_INT_M_DELAY_INT_ERROR	     BIT(24)
+#define MASK_INT_M_MASK_ALL		     0x017F0F1F
+
+#define REG_INT_S_STATUS	   0x188
+#define REG_INT_S_MASK		   0x18c
+#define MASK_INT_S_SIZE_ERROR	   BIT(0)
+#define MASK_INT_S_EMBED_ERROR	   BIT(1)
+#define MASK_INT_S_USERDATA_ERROR  BIT(2)
+#define MASK_INT_S_DELAY_INT_ERROR BIT(24)
+#define MASK_INT_S_RESERVED_SET	   (BIT(16) | BIT(28))
+#define MASK_INT_S_MASK_ALL	   0x11010007
+
+#define REG_PREPROCESS_FMTM	  0x210
+#define VAL_PREPROCESS_FMT_RGB	  (0x0 << 4)
+#define VAL_PREPROCESS_FMT_YUV444 (0x1 << 4)
+#define VAL_PREPROCESS_FMT_YUV422 (0x3 << 4)
+
+#define REG_PREPROCESS_C24M		   0x214
+#define REG_L2ISP_INPUT_CSC_MTB		   0x220
+#define REG_L2ISP_INPUT_CSC_MTB_YG_OFFSETI 0x230
+#define REG_L2ISP_INPUT_CSC_MTB_YG1	   0x234
+#define REG_L2ISP_INPUT_CSC_MTB_YG2	   0x238
+#define REG_L2ISP_INPUT_CSC_MTB_YG_OFFSETO 0x23c
+#define REG_L2ISP_INPUT_CSC_MTB_CB_OFFSETI 0x240
+#define REG_L2ISP_INPUT_CSC_MTB_CB1	   0x244
+#define REG_L2ISP_INPUT_CSC_MTB_CB2	   0x248
+#define REG_L2ISP_INPUT_CSC_MTB_CB_OFFSETO 0x24c
+#define REG_L2ISP_INPUT_CSC_MTB_CR_OFFSETI 0x250
+#define REG_L2ISP_INPUT_CSC_MTB_CR1	   0x254
+#define REG_L2ISP_INPUT_CSC_MTB_CR2	   0x258
+#define REG_L2ISP_INPUT_CSC_MTB_CR_OFFSETO 0x25c
+#define REG_DPHY_FREQRANGE		   0x700
+#define REG_DPHY_LANE			   0x710
+#define REG_DPGM_VSYNC_SOURCE		   0x804
+#define VAL_DPGM_VSYNC_PULSE		   1
+
+#define REG_VDM_R_ENABLE		 0x1030
+#define REG_VDM_W_ENABLE		 0x1034
+#define REG_VDM_T_ENABLE		 0x1038
+#define MASK_VDM_T_ENABLE_L1_DPC_H	 BIT(0)
+#define MASK_VDM_T_ENABLE_L1_DPC_M	 BIT(1)
+#define MASK_VDM_T_ENABLE_L1_DPC_L	 BIT(2)
+#define MASK_VDM_T_ENABLE_L1_DPC	 0x07
+#define MASK_VDM_T_ENABLE_L1_LSSC_GR	 BIT(4)
+#define MASK_VDM_T_ENABLE_L1_LSSC_R	 BIT(5)
+#define MASK_VDM_T_ENABLE_L1_LSSC_B	 BIT(6)
+#define MASK_VDM_T_ENABLE_L1_LSSC_GB	 BIT(7)
+#define MASK_VDM_T_ENABLE_L1_LSSC	 0x00f0
+#define MASK_VDM_T_ENABLE_L2_UNDIST_RD_B BIT(8)
+#define MASK_VDM_T_ENABLE_L2_UNDIST_RD_G BIT(9)
+#define MASK_VDM_T_ENABLE_L2_UNDIST_RD_R BIT(10)
+#define MASK_VDM_T_ENABLE_L2_UNDIST_WR_G BIT(11)
+#define MASK_VDM_T_ENABLE_L2_UNDIST	 0x0f00
+/* val: 12-23; postid: 0-1, ch: 0-5 */
+#define MASK_VDM_T_ENABLE_L2_GAMMA(postid, ch) BIT(12 + ((postid) * 6) + (ch))
+#define MASK_VDM_T_ENABLE_L2_GAMMA_ALL(postid) (0x3fu << (12 + ((postid) * 6)))
+
+#define REG_VDM_ABORTSET 0x103c
+
+/* x: 0-3 */
+#define REG_VDM_TGROUP_X_BASE(x)	 (0x1040 + 16 * (x))
+#define REG_VDM_TGROUP_X_CFG(x)		 (REG_VDM_TGROUP_X_BASE(x) + 0)
+#define REG_VDM_TGROUP_X_SRAM_BASE(x)	 (REG_VDM_TGROUP_X_BASE(x) + 4)
+#define REG_VDM_TGROUP_X_SRAM_SIZE(x)	 (REG_VDM_TGROUP_X_BASE(x) + 8)
+#define IDX_TGROUP_L1_ISP		 0
+#define IDX_TGROUP_L2_UNDIST		 1
+#define IDX_TGROUP_L2_GAMMA_LUT(post_id) (2 + (post_id))
+#define VAL_TGROUP_CFG_64BIT_RD		 0x0310
+#define VAL_TGROUP_CFG_32BIT_RD		 0x0210
+
+/* x: 0-23*/
+#define REG_VDM_TPORT_X_BASE(x)	 (0x1100 + 8 * (x))
+#define REG_VDM_TPORT_X_SIZE(x)	 (REG_VDM_TPORT_X_BASE(x) + 4)
+#define REG_VDM_TPORT_X_STADR(x) (REG_VDM_TPORT_X_BASE(x) + 0)
+/* idx: 0-2; x: 0-2 */
+#define IDX_TPORT_L1_DPC(x)	 (x)
+#define IDX_TPORT_L1_DPC_H	 0
+#define IDX_TPORT_L1_DPC_M	 1
+#define IDX_TPORT_L1_DPC_L	 2
+#define IDX_TPORT_L1_LSSC_GR	 4
+#define IDX_TPORT_L1_LSSC_R	 5
+#define IDX_TPORT_L1_LSSC_B	 6
+#define IDX_TPORT_L1_LSSC_GB	 7
+#define IDX_TPORT_L2_UNDIST_RD_B 8
+#define IDX_TPORT_L2_UNDIST_RD_G 9
+#define IDX_TPORT_L2_UNDIST_RD_R 10
+#define IDX_TPORT_L2_UNDIST_WR_G 11
+/* idx: 12-23; post_id: 0-1, col: 0-5 */
+#define IDX_TPORT_L2_GAMMA_LUT(post_id, col) (12 + (col) + (post_id) * 6)
+
+/* x: 0-5 */
+#define REG_VDM_WPORT_X_BASE(x)	       (0x1300 + 64 * (x))
+#define REG_VDM_WPORT_X_W_CFG0(x)      (REG_VDM_WPORT_X_BASE(x) + 16)
+#define REG_VDM_WPORT_X_W_ENDADR(x)    (REG_VDM_WPORT_X_BASE(x) + 4)
+#define REG_VDM_WPORT_X_W_HEIGHT(x)    (REG_VDM_WPORT_X_BASE(x) + 8)
+#define REG_VDM_WPORT_X_W_PITCH(x)     (REG_VDM_WPORT_X_BASE(x) + 12)
+#define REG_VDM_WPORT_X_W_SRAM_BASE(x) (REG_VDM_WPORT_X_BASE(x) + 24)
+#define REG_VDM_WPORT_X_W_SRAM_SIZE(x) (REG_VDM_WPORT_X_BASE(x) + 28)
+#define REG_VDM_WPORT_X_W_STADR(x)     (REG_VDM_WPORT_X_BASE(x) + 0)
+#define IDX_WPORT_MAIN_LNG	       0
+#define IDX_WPORT_MAIN_EMB	       1
+#define IDX_WPORT_SUB_IMG	       3
+#define IDX_WPORT_SUB_LNG	       4
+#define IDX_WPORT_SUB_EMB	       5
+
+#define REG_VDM_R_RUN		     0x1e18
+#define REG_VDM_W_RUN		     0x1e1c
+#define REG_VDM_T_RUN		     0x1e20
+#define REG_L1_SYSM_WIDTH	     0x2000
+#define REG_L1_SYSM_HEIGHT	     0x2004
+#define REG_L1_SYSM_START_COLOR	     0x2008
+#define VAL_L1_SYSM_START_COLOR_GRBG 0
+#define VAL_L1_SYSM_START_COLOR_RGGB 1
+#define VAL_L1_SYSM_START_COLOR_BGGR 2
+#define VAL_L1_SYSM_START_COLOR_GBRG 3
+
+#define REG_L1_SYSM_INPUT_MODE 0x200c
+#define REG_L1_SYSM_YCOEF_R    0x2014
+#define REG_L1_SYSM_YCOEF_G    0x2018
+#define REG_L1_SYSM_YCOEF_B    0x201c
+#define REG_L1_SYSM_AG_H       0x2040
+#define REG_L1_SYSM_AG_M       0x2044
+#define REG_L1_SYSM_AG_L       0x2048
+#define REG_L1_SYSM_AG_PARAM_A 0x204c
+#define REG_L1_SYSM_AG_PARAM_B 0x2050
+#define REG_L1_SYSM_AG_PARAM_C 0x2054
+#define REG_L1_SYSM_AG_PARAM_D 0x2058
+#define PACK_L1_SYSM_AG_PARAM(grad, ofst) \
+	(FIELD_PREP(0x00ff0000, (grad)) | FIELD_PREP(0x00ffff, (ofst)))
+
+#define REG_L1_SYSM_AG_SEL_HOBC 0x205c
+#define REG_L1_SYSM_AG_SEL_ABPC 0x2060
+#define REG_L1_SYSM_AG_SEL_RCNR 0x2064
+#define PACK_L1_SYSM_AG_SEL_HML(high, mid, low)                   \
+	(FIELD_PREP(0x00c0, (high)) | FIELD_PREP(0x0030, (mid)) | \
+	 FIELD_PREP(0x0c, (low)))
+
+#define REG_L1_SYSM_AG_SEL_LSSC 0x2068
+#define REG_L1_SYSM_AG_SEL_MPRO 0x206c
+#define REG_L1_SYSM_AG_SEL_VPRO 0x2070
+#define PACK_L1_SYSM_AG_SEL_SP(ssel, psel) \
+	(FIELD_PREP(0x00c0, (ssel)) | (FIELD_PREP(0x03, (psel))))
+
+#define REG_L1_SYSM_AG_CONT_HOBC01_EN 0x2074
+#define REG_L1_SYSM_AG_CONT_HOBC2_EN  0x2078
+#define REG_L1_SYSM_AG_CONT_ABPC01_EN 0x207c
+#define REG_L1_SYSM_AG_CONT_ABPC2_EN  0x2080
+#define REG_L1_SYSM_AG_CONT_RCNR01_EN 0x2084
+#define REG_L1_SYSM_AG_CONT_RCNR2_EN  0x2088
+#define MASK_L1_SYSM_AG_CONT_M_EN     BIT(24)
+#define MASK_L1_SYSM_AG_CONT_H_EN     BIT(8)
+#define MASK_L1_SYSM_AG_CONT_M_VAL    0x00ff0000
+#define MASK_L1_SYSM_AG_CONT_H_VAL    0x00ff
+#define MASK_L1_SYSM_AG_CONT_L_EN     BIT(8)
+#define MASK_L1_SYSM_AG_CONT_L_VAL    0x00ff
+
+#define REG_L1_SYSM_AG_CONT_LSSC_EN 0x208c
+#define REG_L1_SYSM_AG_CONT_MPRO_EN 0x2090
+#define REG_L1_SYSM_AG_CONT_VPRO_EN 0x2094
+#define MASK_L1_SYSM_AG_CONT_EN	    BIT(8)
+#define MASK_L1_SYSM_AG_CONT_VAL    0x00ff
+
+#define LEN_L1_HDRE_SRCPOINT	16
+#define REG_L1_HDRE_SRCPOINT(x) (0x20c4 + 4 * (x))
+
+#define LEN_L1_HDRE_SRCBASE    17
+#define REG_L1_HDRE_SRCBASE(x) (0x2104 + 4 * (x))
+
+#define LEN_L1_HDRE_RATIO    17
+#define REG_L1_HDRE_RATIO(x) (0x2148 + 4 * (x))
+
+#define LEN_L1_HDRE_DSTBASE    17
+#define REG_L1_HDRE_DSTBASE(x) (0x218c + 4 * (x))
+
+#define REG_L1_HDRE_DSTMAXVAL	 0x21d0
+#define REG_L1_AEXP_ON		 0x2200
+#define REG_L1_AEXP_RESULT_AVE	 0x2204
+#define REG_L1_AEXP_START_X	 0x2210
+#define REG_L1_AEXP_START_Y	 0x2214
+#define REG_L1_AEXP_BLOCK_WIDTH	 0x2218
+#define REG_L1_AEXP_BLOCK_HEIGHT 0x221c
+#define REG_L1_AEXP_WEIGHT_0	 0x2220
+#define REG_L1_AEXP_WEIGHT_1	 0x2224
+#define REG_L1_AEXP_WEIGHT_2	 0x2228
+#define REG_L1_AEXP_WEIGHT_3	 0x222c
+#define REG_L1_AEXP_WEIGHT_4	 0x2230
+#define REG_L1_AEXP_WEIGHT_5	 0x2234
+#define REG_L1_AEXP_WEIGHT_6	 0x2238
+#define REG_L1_AEXP_WEIGHT_7	 0x223c
+#define REG_L1_AEXP_SATUR_RATIO	 0x2240
+#define REG_L1_AEXP_BLACK_RATIO	 0x2244
+#define REG_L1_AEXP_SATUR_LEVEL	 0x2248
+/* 8 x 8 elements */
+#define REG_L1_AEXP_AVE(y, x)	       (0x2250 + 32 * (y) + 4 * (x))
+#define REG_L1_AEXP_SATUR_BLACK_PIXNUM 0x2350
+#define REG_L1_AEXP_AVE4LINESY0	       0x2354
+#define REG_L1_AEXP_AVE4LINESY1	       0x2358
+#define REG_L1_AEXP_AVE4LINESY2	       0x235c
+#define REG_L1_AEXP_AVE4LINESY3	       0x2360
+#define REG_L1_AEXP_AVE4LINES0	       0x2364
+#define REG_L1_AEXP_AVE4LINES1	       0x2368
+#define REG_L1_AEXP_AVE4LINES2	       0x236c
+#define REG_L1_AEXP_AVE4LINES3	       0x2370
+#define REG_L1_IBUF_DEPTH	       0x2380
+#define REG_L1_IBUF_INPUT_ORDER	       0x2384
+#define REG_L1_SLIC_SRCBLACKLEVEL_GR   0x2390
+#define REG_L1_SLIC_SRCBLACKLEVEL_R    0x2394
+#define REG_L1_SLIC_SRCBLACKLEVEL_B    0x2398
+#define REG_L1_SLIC_SRCBLACKLEVEL_GB   0x239c
+#define REG_L1_ABPC012_STA_EN	       0x240c
+#define REG_L1_ABPC012_DYN_EN	       0x2410
+#define MASK_L1_ABPC_ENABLE_H	       BIT(24)
+#define MASK_L1_ABPC_ENABLE_M	       BIT(16)
+#define MASK_L1_ABPC_ENABLE_L	       BIT(8)
+
+#define REG_L1_ABPC012_DYN_MODE	       0x2414
+#define MASK_L1_ABPC_DYN_MODE_2PIXEL_H BIT(24)
+#define MASK_L1_ABPC_DYN_MODE_2PIXEL_M BIT(16)
+#define MASK_L1_ABPC_DYN_MODE_2PIXEL_L BIT(8)
+
+#define REG_L1_ABPC0_RATIO_LIMIT      0x2424
+#define REG_L1_ABPC0_DARK_LIMIT	      0x242c
+#define REG_L1_ABPC0_SN_COEF_W_AG_MIN 0x2430
+#define REG_L1_ABPC0_SN_COEF_W_AG_MID 0x2434
+#define REG_L1_ABPC0_SN_COEF_W_AG_MAX 0x2438
+#define REG_L1_ABPC0_SN_COEF_W_TH_MIN 0x243c
+#define REG_L1_ABPC0_SN_COEF_W_TH_MAX 0x2440
+#define REG_L1_ABPC0_SN_COEF_B_AG_MIN 0x2444
+#define REG_L1_ABPC0_SN_COEF_B_AG_MID 0x2448
+#define REG_L1_ABPC0_SN_COEF_B_AG_MAX 0x244c
+#define REG_L1_ABPC0_SN_COEF_B_TH_MIN 0x2450
+#define REG_L1_ABPC0_SN_COEF_B_TH_MAX 0x2454
+#define REG_L1_ABPC1_RATIO_LIMIT      0x2460
+#define REG_L1_ABPC1_DARK_LIMIT	      0x2468
+#define REG_L1_ABPC1_SN_COEF_W_AG_MIN 0x246c
+#define REG_L1_ABPC1_SN_COEF_W_AG_MID 0x2470
+#define REG_L1_ABPC1_SN_COEF_W_AG_MAX 0x2474
+#define REG_L1_ABPC1_SN_COEF_W_TH_MIN 0x2478
+#define REG_L1_ABPC1_SN_COEF_W_TH_MAX 0x247c
+#define REG_L1_ABPC1_SN_COEF_B_AG_MIN 0x2480
+#define REG_L1_ABPC1_SN_COEF_B_AG_MID 0x2484
+#define REG_L1_ABPC1_SN_COEF_B_AG_MAX 0x2488
+#define REG_L1_ABPC1_SN_COEF_B_TH_MIN 0x248c
+#define REG_L1_ABPC1_SN_COEF_B_TH_MAX 0x2490
+#define REG_L1_ABPC2_RATIO_LIMIT      0x249c
+#define REG_L1_ABPC2_DARK_LIMIT	      0x24a4
+#define REG_L1_ABPC2_SN_COEF_W_AG_MIN 0x24a8
+#define REG_L1_ABPC2_SN_COEF_W_AG_MID 0x24ac
+#define REG_L1_ABPC2_SN_COEF_W_AG_MAX 0x24b0
+#define REG_L1_ABPC2_SN_COEF_W_TH_MIN 0x24b4
+#define REG_L1_ABPC2_SN_COEF_W_TH_MAX 0x24b8
+#define REG_L1_ABPC2_SN_COEF_B_AG_MIN 0x24bc
+#define REG_L1_ABPC2_SN_COEF_B_AG_MID 0x24c0
+#define REG_L1_ABPC2_SN_COEF_B_AG_MAX 0x24c4
+#define REG_L1_ABPC2_SN_COEF_B_TH_MIN 0x24c8
+#define REG_L1_ABPC2_SN_COEF_B_TH_MAX 0x24cc
+#define REG_L1_PWHB_H_GR	      0x2584
+#define REG_L1_PWHB_HR		      0x2588
+#define REG_L1_PWHB_HB		      0x258c
+#define REG_L1_PWHB_H_GB	      0x2590
+#define REG_L1_PWHB_M_GR	      0x2594
+#define REG_L1_PWHB_MR		      0x2598
+#define REG_L1_PWHB_MB		      0x259c
+#define REG_L1_PWHB_M_GB	      0x25a0
+#define REG_L1_PWHB_L_GR	      0x25a4
+#define REG_L1_PWHB_LR		      0x25a8
+#define REG_L1_PWHB_LB		      0x25ac
+#define REG_L1_PWHB_L_GB	      0x25b0
+#define REG_L1_PWHB_DSTMAXVAL	      0x25b4
+
+/* 0 for high, 1 for middle, 2 for low sensitivity image */
+#define REG_L1_RCNR_X_SW(x)		   (0x2608 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_DARK_AG0(x)	   (0x260c + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_DARK_AG1(x)	   (0x2610 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_DARK_AG2(x)	   (0x2614 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_RATIO_AG0(x)	   (0x2618 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_RATIO_AG1(x)	   (0x261c + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_RATIO_AG2(x)	   (0x2620 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_CLIP_GAIN_R(x)   (0x2624 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_CLIP_GAIN_G(x)   (0x2628 + 0x94 * (x))
+#define REG_L1_RCNR_X_CNF_CLIP_GAIN_B(x)   (0x262c + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_DARK_AG0(x)	   (0x2630 + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_DARK_AG1(x)	   (0x2634 + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_DARK_AG2(x)	   (0x2638 + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_RATIO_AG0(x)	   (0x263c + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_RATIO_AG1(x)	   (0x2640 + 0x94 * (x))
+#define REG_L1_RCNR_X_A1L_RATIO_AG2(x)	   (0x2644 + 0x94 * (x))
+#define REG_L1_RCNR_X_INF_ZERO_CLIP(x)	   (0x2648 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_D2BLEND_AG0(x) (0x2650 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_D2BLEND_AG1(x) (0x2654 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_D2BLEND_AG2(x) (0x2658 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_BLACK(x)	   (0x265c + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_MINDIV(x)	   (0x2660 + 0x94 * (x))
+#define REG_L1_RCNR_X_HRY_TYPE(x)	   (0x2664 + 0x94 * (x))
+#define REG_L1_RCNR_X_ANF_BLEND_AG0(x)	   (0x2668 + 0x94 * (x))
+#define REG_L1_RCNR_X_ANF_BLEND_AG1(x)	   (0x266c + 0x94 * (x))
+#define REG_L1_RCNR_X_ANF_BLEND_AG2(x)	   (0x2670 + 0x94 * (x))
+#define REG_L1_RCNR_X_LPF_THRESHOLD(x)	   (0x2678 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_HLBLEND_AG0(x) (0x267c + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_HLBLEND_AG1(x) (0x2680 + 0x94 * (x))
+#define REG_L1_RCNR_X_MERGE_HLBLEND_AG2(x) (0x2684 + 0x94 * (x))
+#define REG_L1_RCNR_X_GNR_SW(x)		   (0x2688 + 0x94 * (x))
+#define REG_L1_RCNR_X_GNR_RATIO(x)	   (0x268c + 0x94 * (x))
+#define REG_L1_RCNR_X_GNR_WIDE_EN(x)	   (0x2690 + 0x94 * (x))
+
+#define REG_L1_HDRS_HDRRATIO_M	     0x2884
+#define REG_L1_HDRS_HDRRATIO_L	     0x2888
+#define REG_L1_HDRS_HDRRATIO_E	     0x288c
+#define REG_L1_HDRS_BLENDEND_H	     0x2898
+#define REG_L1_HDRS_BLENDEND_M	     0x289c
+#define REG_L1_HDRS_BLENDEND_E	     0x28a0
+#define REG_L1_HDRS_BLENDBEG_H	     0x28a4
+#define REG_L1_HDRS_BLENDBEG_M	     0x28a8
+#define REG_L1_HDRS_BLENDBEG_E	     0x28ac
+#define REG_L1_HDRS_DG_H	     0x28c8
+#define REG_L1_HDRS_DG_M	     0x28cc
+#define REG_L1_HDRS_DG_L	     0x28d0
+#define REG_L1_HDRS_DG_E	     0x28d4
+#define REG_L1_HDRS_LEDMODE_ON	     0x28d8
+#define REG_L1_HDRS_HDRMODE	     0x28dc
+#define REG_L1_HDRS_DSTMAXVAL	     0x28ec
+#define REG_L1_BLVC_SRCBLACKLEVEL_GR 0x2900
+#define REG_L1_BLVC_SRCBLACKLEVEL_R  0x2904
+#define REG_L1_BLVC_SRCBLACKLEVEL_B  0x2908
+#define REG_L1_BLVC_SRCBLACKLEVELGB  0x290c
+#define REG_L1_BLVC_MULTVAL_GR	     0x2910
+#define REG_L1_BLVC_MULTVAL_R	     0x2914
+#define REG_L1_BLVC_MULTVAL_B	     0x2918
+#define REG_L1_BLVC_MULTVAL_GB	     0x291c
+#define REG_L1_BLVC_DSTMAXVAL	     0x2920
+#define REG_L1_LSSC_EN		     0x2980
+#define REG_L1_LSSC_PWHB_R_GAIN	     0x2990
+#define REG_L1_LSSC_PWHB_GR_GAIN     0x2994
+#define REG_L1_LSSC_PWHB_GB_GAIN     0x2998
+#define REG_L1_LSSC_PWHB_B_GAIN	     0x299c
+#define REG_L1_LSSC_PARA_EN	     0x29a0
+#define REG_L1_LSSC_PARA_H_CENTER    0x29a4
+#define REG_L1_LSSC_PARA_V_CENTER    0x29a8
+#define REG_L1_LSSC_PARA_H_GAIN	     0x29ac
+#define REG_L1_LSSC_PARA_V_GAIN	     0x29b0
+#define REG_L1_LSSC_PARA_MGSEL2	     0x29b4
+#define REG_L1_LSSC_PARA_MGSEL4	     0x29b8
+
+/*0: R/2D, 1: R/4D, 2: GR/2D, 3: GR/4D, 4: GB/2D, 5: GB/4D, 6: B/2D, 7: B/4D*/
+#define REG_L1_LSSC_PARA_COEF_X_H_L(x)	 (0x29bc + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_H_R(x)	 (0x29c0 + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_V_U(x)	 (0x29c4 + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_V_D(x)	 (0x29c8 + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_HV_LU(x) (0x29cc + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_HV_RU(x) (0x29d0 + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_HV_LD(x) (0x29d4 + 0x20 * (x))
+#define REG_L1_LSSC_PARA_COEF_X_HV_RD(x) (0x29d8 + 0x20 * (x))
+
+#define REG_L1_LSSC_GRID_EN	   0x2abc
+#define REG_L1_LSSC_GRID_H_CENTER  0x2ac0
+#define REG_L1_LSSC_GRID_V_CENTER  0x2ac4
+#define REG_L1_LSSC_GRID_H_SIZE	   0x2ac8
+#define REG_L1_LSSC_GRID_V_SIZE	   0x2acc
+#define REG_L1_LSSC_GRID_MGSEL	   0x2ad0
+#define REG_L1_MPRO_SW		   0x2b00
+#define REG_L1_MPRO_CONF	   0x2b04
+#define REG_L1_MPRO_DST_MINVAL	   0x2b0c
+#define REG_L1_MPRO_DST_MAXVAL	   0x2b10
+#define REG_L1_MPRO_LM0_RMG_MIN	   0x2b20
+#define REG_L1_MPRO_LM0_RMB_MIN	   0x2b24
+#define REG_L1_MPRO_LM0_GMR_MIN	   0x2b28
+#define REG_L1_MPRO_LM0_GMB_MIN	   0x2b2c
+#define REG_L1_MPRO_LM0_BMR_MIN	   0x2b30
+#define REG_L1_MPRO_LM0_BMG_MIN	   0x2b34
+#define REG_L1_MPRO_LM0_RMG_MAX	   0x2b38
+#define REG_L1_MPRO_LM0_RMB_MAX	   0x2b3c
+#define REG_L1_MPRO_LM0_GMR_MAX	   0x2b40
+#define REG_L1_MPRO_LM0_GMB_MAX	   0x2b44
+#define REG_L1_MPRO_LM0_BMR_MAX	   0x2b48
+#define REG_L1_MPRO_LM0_BMG_MAX	   0x2b4c
+#define REG_L1_MPRO_LCS_MODE	   0x2bf0
+#define REG_L1_VPRO_PGC_SW	   0x2d80
+#define REG_L1_VPRO_YUVC_SW	   0x2d88
+#define REG_L1_VPRO_YNR_SW	   0x2d8c
+#define REG_L1_VPRO_ETE_SW	   0x2d90
+#define REG_L1_VPRO_CSUP_UVSUP_SW  0x2d94
+#define REG_L1_VPRO_CSUP_CORING_SW 0x2d98
+#define REG_L1_VPRO_BRIGHT_SW	   0x2d9c
+#define REG_L1_VPRO_LCNT_SW	   0x2da0
+#define REG_L1_VPRO_NLCNT_SW	   0x2da4
+#define REG_L1_VPRO_EDGE_SUP_SW	   0x2dac
+#define REG_L1_VPRO_CNR_SW	   0x2db0
+#define REG_L1_VPRO_BLKADJ	   0x2db8
+/* (GAM00P is fixed 0) GAM01P-GAM44P: x:0-43 */
+#define REG_L1_VPRO_GAMxP(x)		 (0x2dbc + 4 * (x))
+#define REG_L1_VPRO_CB_MAT		 0x2e6c
+#define REG_L1_VPRO_CR_MAT		 0x2e70
+#define REG_L1_VPRO_BRIGHT		 0x2e74
+#define REG_L1_VPRO_LCONT_LEV		 0x2e78
+#define REG_L1_VPRO_BLK_KNEE		 0x2e7c
+#define REG_L1_VPRO_WHT_KNEE		 0x2e80
+#define REG_L1_VPRO_BLK_CONT0		 0x2e84
+#define REG_L1_VPRO_BLK_CONT1		 0x2e88
+#define REG_L1_VPRO_BLK_CONT2		 0x2e8c
+#define REG_L1_VPRO_WHT_CONT0		 0x2e90
+#define REG_L1_VPRO_WHT_CONT1		 0x2e94
+#define REG_L1_VPRO_WHT_CONT2		 0x2e98
+#define REG_L1_VPRO_YNR_GAIN_MIN	 0x2eb4
+#define REG_L1_VPRO_YNR_GAIN_MAX	 0x2eb8
+#define REG_L1_VPRO_YNR_LIM_MIN		 0x2ebc
+#define REG_L1_VPRO_YNR_LIM_MAX		 0x2ec0
+#define REG_L1_VPRO_ETE_GAIN_MIN	 0x2ec4
+#define REG_L1_VPRO_ETE_GAIN_MAX	 0x2ec8
+#define REG_L1_VPRO_ETE_LIM_MIN		 0x2ecc
+#define REG_L1_VPRO_ETE_LIM_MAX		 0x2ed0
+#define REG_L1_VPRO_ETE_CORING_MIN	 0x2ed4
+#define REG_L1_VPRO_ETE_CORING_MAX	 0x2ed8
+#define REG_L1_VPRO_CB_GAIN		 0x2edc
+#define REG_L1_VPRO_CR_GAIN		 0x2ee0
+#define REG_L1_VPRO_CBR_MGAIN_MIN	 0x2ee4
+#define REG_L1_VPRO_CB_P_GAIN_MAX	 0x2ee8
+#define REG_L1_VPRO_CB_M_GAIN_MAX	 0x2eec
+#define REG_L1_VPRO_CR_P_GAIN_MAX	 0x2ef0
+#define REG_L1_VPRO_CR_M_GAIN_MAX	 0x2ef4
+#define REG_L1_VPRO_CSUP_CORING_LV_MIN	 0x2ef8
+#define REG_L1_VPRO_CSUP_CORING_LV_MAX	 0x2efc
+#define REG_L1_VPRO_CSUP_CORING_GAIN_MIN 0x2f00
+#define REG_L1_VPRO_CSUP_CORING_GAIN_MAX 0x2f04
+#define REG_L1_VPRO_CSUP_BK_SLV		 0x2f08
+#define REG_L1_VPRO_CSUP_BK_MP		 0x2f0c
+#define REG_L1_VPRO_CSUP_BLACK		 0x2f10
+#define REG_L1_VPRO_CSUP_WH_SLV		 0x2f14
+#define REG_L1_VPRO_CSUP_WH_MP		 0x2f18
+#define REG_L1_VPRO_CSUP_WHITE		 0x2f1c
+#define REG_L1_VPRO_EDGE_SUP_GAIN	 0x2f20
+#define REG_L1_VPRO_EDGE_SUP_LIM	 0x2f24
+#define REG_L1_AWHB_SW			 0x2f80
+#define MASK_L1_AWHB_SW_EN		 BIT(7)
+#define MASK_L1_AWHB_SW_LOCK		 BIT(5)
+
+#define REG_L1_AWHB_WBMRG	     0x2f88
+#define REG_L1_AWHB_WBMGG	     0x2f8c
+#define REG_L1_AWHB_WBMBG	     0x2f90
+#define REG_L1_AWHB_GATE_CONF0	     0x2f94
+#define MASK_L1_AWHB_GATE_YGATE_SEL  BIT(7)
+#define MASK_L1_AWHB_GATE_YGATE_DATA 0x0060
+#define MASK_L1_AWHB_GATE_CGRANGE    0x0003
+
+#define REG_L1_AWHB_GATE_CONF1	   0x2f98
+#define MASK_L1_AWHB_GATE_YGATESW  BIT(5)
+#define MASK_L1_AWHB_GATE_HEXSW	   BIT(4)
+#define MASK_L1_AWHB_GATE_AREAMODE 0x0003
+
+#define REG_L1_AWHB_AREA_HSIZE	    0x2f9c
+#define REG_L1_AWHB_AREA_VSIZE	    0x2fa0
+#define REG_L1_AWHB_AREA_HOFS	    0x2fa4
+#define REG_L1_AWHB_AREA_VOFS	    0x2fa8
+#define REG_L1_AWHB_AREA_MASKH	    0x2fac
+#define REG_L1_AWHB_AREA_MASKL	    0x2fb0
+#define REG_L1_AWHB_SQ_CONF	    0x2fb4
+#define MASK_L1_AWHB_SQ_CONF_SQ3POL BIT(2)
+#define MASK_L1_AWHB_SQ_CONF_SQ3SW  BIT(3)
+#define MASK_L1_AWHB_SQ_CONF_SQ2POL BIT(4)
+#define MASK_L1_AWHB_SQ_CONF_SQ2SW  BIT(5)
+#define MASK_L1_AWHB_SQ_CONF_SQ1POL BIT(6)
+#define MASK_L1_AWHB_SQ_CONF_SQ1SW  BIT(7)
+
+#define REG_L1_AWHB_YGATEH	   0x2fb8
+#define REG_L1_AWHB_YGATEL	   0x2fbc
+#define REG_L1_AWHB_BYCUT0P	   0x2fc8
+#define REG_L1_AWHB_BYCUT0N	   0x2fcc
+#define REG_L1_AWHB_RYCUT0P	   0x2fd0
+#define REG_L1_AWHB_RYCUT0N	   0x2fd4
+#define REG_L1_AWHB_RBCUT0H	   0x2fd8
+#define REG_L1_AWHB_RBCUT0L	   0x2fdc
+#define REG_L1_AWHB_BYCUT1H	   0x2ff8
+#define REG_L1_AWHB_BYCUT1L	   0x2ffc
+#define REG_L1_AWHB_RYCUT1H	   0x3000
+#define REG_L1_AWHB_RYCUT1L	   0x3004
+#define REG_L1_AWHB_BYCUT2H	   0x3008
+#define REG_L1_AWHB_BYCUT2L	   0x300c
+#define REG_L1_AWHB_RYCUT2H	   0x3010
+#define REG_L1_AWHB_RYCUT2L	   0x3014
+#define REG_L1_AWHB_BYCUT3H	   0x3018
+#define REG_L1_AWHB_BYCUT3L	   0x301c
+#define REG_L1_AWHB_RYCUT3H	   0x3020
+#define REG_L1_AWHB_RYCUT3L	   0x3024
+#define REG_L1_AWHB_AWBSFTU	   0x3028
+#define REG_L1_AWHB_AWBSFTV	   0x302c
+#define REG_L1_AWHB_AWBSPD	   0x3030
+#define MASK_L1_AWHB_AWBSPD_HUECOR BIT(4)
+#define MASK_L1_AWHB_AWBSPD_SPD	   0x0f
+
+#define REG_L1_AWHB_AWBULV	0x3034
+#define REG_L1_AWHB_AWBVLV	0x3038
+#define REG_L1_AWHB_AWBWAIT	0x303c
+#define REG_L1_AWHB_AWBONDOT	0x3040
+#define REG_L1_AWHB_AWBFZTIM	0x3044
+#define REG_L1_AWHB_WBGRMAX	0x3048
+#define REG_L1_AWHB_WBGRMIN	0x304c
+#define REG_L1_AWHB_WBGBMAX	0x3050
+#define REG_L1_AWHB_WBGBMIN	0x3054
+#define REG_L1_AWHB_AVE_USIG	0x308c
+#define REG_L1_AWHB_AVE_VSIG	0x3090
+#define REG_L1_AWHB_NUM_UVON	0x3094
+#define REG_L1_AWHB_AWBGAINR	0x3098
+#define REG_L1_AWHB_AWBGAING	0x309c
+#define REG_L1_AWHB_AWBGAINB	0x30a0
+#define REG_L1_AWHB_R_CTR_STOP	0x30b0
+#define REG_L1_HOBC_MARGIN	0x30c4
+#define REG_L1_HDRC_EN		0x3200
+#define REG_L1_HDRC_THR_SFT_AMT 0x3204
+#define REG_L1_HDRC_RATIO	0x320c
+#define REG_L1_HDRC_PT_RATIO	0x321c
+#define REG_L1_HDRC_PT_BLEND	0x3220
+#define REG_L1_HDRC_PT_BLEND2	0x3224
+#define REG_L1_HDRC_PT_SAT	0x3228
+#define REG_L1_HDRC_TN_TYPE	0x322c
+#define REG_L1_HDRC_TNP_MAX	0x3230
+#define REG_L1_HDRC_TNP_MAG	0x3234
+
+#define LEN_L1_HDRC_TNP_FIL    5
+#define REG_L1_HDRC_TNP_FIL(x) (0x3248 + 4 * (x))
+
+#define LEN_L1_HDRC_UTN_TBL    20
+#define REG_L1_HDRC_UTN_TBL(x) (0x325c + 4 * (x))
+
+#define REG_L1_HDRC_FLR_VAL		   0x32ac
+#define REG_L1_HDRC_FLR_ADP		   0x32b0
+#define REG_L1_HDRC_YBR_OFF		   0x32ec
+#define REG_L1_HDRC_ORGY_BLEND		   0x32f0
+#define REG_L1_HDRC_MAR_TOP		   0x3300
+#define REG_L1_HDRC_MAR_LEFT		   0x3304
+#define REG_L1_CRGBF_ACC_CONF		   0x3700
+#define VAL_L1_CRGBF_ACC_CONF_MODE_BYPASS  0
+#define VAL_L1_CRGBF_ACC_CONF_MODE_BUFFER0 1
+
+#define REG_L1_CRGBF_TRN_A_CONF		 0x370c
+#define VAL_L1_CRGBF_TRN_AUTO_READ_BANK0 BIT(16)
+
+#define REG_L1_CRGBF_INT_STAT	     0x3718
+#define REG_L1_CRGBF_INT_MASK	     0x371c
+#define REG_L1_CRGBF_INT_MASKED_STAT 0x3720
+#define REG_L1_CRGBF_TRN_RBADDR	     0x372c
+#define REG_L1_CRGBF_TRN_READDR	     0x3730
+#define REG_L1_CRGBF_ISP_INT_MASK    0x3738
+#define REG_L2_SENSOR_CROP_OFS_H     0x5000
+#define REG_L2_SENSOR_CROP_OFS_V     0x5004
+#define REG_L2_SENSOR_CROP_HSIZE     0x5008
+#define REG_L2_SENSOR_CROP_VSIZE     0x500c
+#define REG_L2_BUS_L2_STATUS	     0x5018
+#define REG_L2_ROI_NUM		     0x5040
+/* x: 0-1 */
+#define REG_L2_ROI_TO_POST(x)		(0x5044 + 4 * (x))
+#define REG_L2_ROI_X_BASE(x)		(0x5050 + 32 * (x))
+#define REG_L2_ROI_X_SCALE(x)		(REG_L2_ROI_X_BASE(x) + 0)
+#define REG_L2_ROI_X_SCALE_INV(x)	(REG_L2_ROI_X_BASE(x) + 4)
+#define REG_L2_ROI_X_CORRECTED_HSIZE(x) (REG_L2_ROI_X_BASE(x) + 8)
+#define REG_L2_ROI_X_CORRECTED_VSIZE(x) (REG_L2_ROI_X_BASE(x) + 12)
+#define REG_L2_ROI_X_OUT_OFS_H(x)	(REG_L2_ROI_X_BASE(x) + 16)
+#define REG_L2_ROI_X_OUT_HSIZE(x)	(REG_L2_ROI_X_BASE(x) + 24)
+#define REG_L2_ROI_X_OUT_OFS_V(x)	(REG_L2_ROI_X_BASE(x) + 20)
+#define REG_L2_ROI_X_OUT_VSIZE(x)	(REG_L2_ROI_X_BASE(x) + 28)
+#define REG_L2_VALID_R_NORM2_POLY	0x50b0
+#define REG_L2_VALID_R_NORM2_GRID	0x50b4
+#define REG_L2_MODE			0x5100
+#define REG_L2_NORM_SCALE		0x5104
+#define REG_L2_ROI_WRITE_AREA_DELTA(x)	(0x510c + 4 * (x))
+#define REG_L2_GRID_NODE_NUM_H		0x5118
+#define REG_L2_GRID_NODE_NUM_V		0x511c
+#define REG_L2_GRID_PATCH_HSIZE_INV	0x5120
+#define REG_L2_GRID_PATCH_VSIZE_INV	0x5124
+/* x: 0-10 */
+#define REG_L2_POLY10_WRITE_G_COEF(x) (0x5128 + 4 * (x))
+#define REG_L2_POLY10_READ_B_COEF(x)  (0x5154 + 4 * (x))
+#define REG_L2_POLY10_READ_G_COEF(x)  (0x5180 + 4 * (x))
+#define REG_L2_POLY10_READ_R_COEF(x)  (0x51ac + 4 * (x))
+/* x: 0-1 */
+#define REG_L2_POST_X_BASE(x)		    (0x5200 + 256 * (x))
+#define REG_L2_POST_X_CAP_OFFSET(x)	    (REG_L2_POST_X_BASE(x) + 0)
+#define REG_L2_POST_X_CAP_SIZE(x)	    (REG_L2_POST_X_BASE(x) + 4)
+#define REG_L2_POST_X_CSC_MTB_CB1(x)	    (REG_L2_POST_X_BASE(x) + 148)
+#define REG_L2_POST_X_CSC_MTB_CB2(x)	    (REG_L2_POST_X_BASE(x) + 152)
+#define REG_L2_POST_X_CSC_MTB_CB_OFFSETI(x) (REG_L2_POST_X_BASE(x) + 144)
+#define REG_L2_POST_X_CSC_MTB_CB_OFFSETO(x) (REG_L2_POST_X_BASE(x) + 156)
+#define REG_L2_POST_X_CSC_MTB_CR1(x)	    (REG_L2_POST_X_BASE(x) + 164)
+#define REG_L2_POST_X_CSC_MTB_CR2(x)	    (REG_L2_POST_X_BASE(x) + 168)
+#define REG_L2_POST_X_CSC_MTB_CR_OFFSETI(x) (REG_L2_POST_X_BASE(x) + 160)
+#define REG_L2_POST_X_CSC_MTB_CR_OFFSETO(x) (REG_L2_POST_X_BASE(x) + 172)
+#define REG_L2_POST_X_CSC_MTB(x)	    (REG_L2_POST_X_BASE(x) + 112)
+#define REG_L2_POST_X_CSC_MTB_YG1(x)	    (REG_L2_POST_X_BASE(x) + 132)
+#define REG_L2_POST_X_CSC_MTB_YG2(x)	    (REG_L2_POST_X_BASE(x) + 136)
+#define REG_L2_POST_X_CSC_MTB_YG_OFFSETI(x) (REG_L2_POST_X_BASE(x) + 128)
+#define REG_L2_POST_X_CSC_MTB_YG_OFFSETO(x) (REG_L2_POST_X_BASE(x) + 140)
+#define FIELD_CSC_MTB_UPPER(x)		    (FIELD_PREP(0xffff0000, (x)))
+#define FIELD_CSC_MTB_LOWER(x)		    (FIELD_PREP(0x0000ffff, (x)))
+
+#define REG_L2_POST_X_C_SELECT(x)	 (REG_L2_POST_X_BASE(x) + 96)
+#define REG_L2_POST_X_GAMMA_M(x)	 (REG_L2_POST_X_BASE(x) + 80)
+#define REG_L2_POST_X_HALF_SCALE_EN(x)	 (REG_L2_POST_X_BASE(x) + 8)
+#define REG_L2_POST_X_OPORTALP(x)	 (REG_L2_POST_X_BASE(x) + 176)
+#define REG_L2_POST_X_OPORTFMT(x)	 (REG_L2_POST_X_BASE(x) + 180)
+#define REG_L2_POST_X_OUT_PITCH_B(x)	 (REG_L2_POST_X_BASE(x) + 196)
+#define REG_L2_POST_X_OUT_PITCH_G(x)	 (REG_L2_POST_X_BASE(x) + 200)
+#define REG_L2_POST_X_OUT_PITCH_R(x)	 (REG_L2_POST_X_BASE(x) + 204)
+#define REG_L2_POST_X_OUT_STADR_B(x)	 (REG_L2_POST_X_BASE(x) + 184)
+#define REG_L2_POST_X_OUT_STADR_G(x)	 (REG_L2_POST_X_BASE(x) + 188)
+#define REG_L2_POST_X_OUT_STADR_R(x)	 (REG_L2_POST_X_BASE(x) + 192)
+#define REG_L2_CRGBF_TRN_A_CONF		 0x570c
+#define VAL_L2_CRGBF_TRN_AUTO_READ_BANK0 BIT(16)
+
+#define REG_L2_CRGBF_INT_STAT		  0x5718
+#define REG_L2_CRGBF_INT_MASK		  0x571c
+#define REG_L2_CRGBF_INT_MASKED_STAT	  0x5720
+#define REG_L2_CRGBF_TRN_RBADDR		  0x572c
+#define REG_L2_CRGBF_TRN_READDR		  0x5730
+#define REG_L2_CRGBF_ISP_INT		  0x5734
+#define REG_L2_CRGBF_ISP_INT_MASK	  0x5738
+#define MASK_L2_CRGBF_ISP_INT_DONE	  BIT(0)
+#define MASK_L2_CRGBF_ISP_INT_ABORT_POST0 BIT(1)
+#define MASK_L2_CRGBF_ISP_INT_ABORT_POST1 BIT(2)
+#define MASK_L2_CRGBF_ISP_INT_ABORT_OTHER BIT(4)
+#define MASK_L2_STATUS_ERR_ALL               \
+	(MASK_L2_CRGBF_ISP_INT_ABORT_POST0 | \
+	 MASK_L2_CRGBF_ISP_INT_ABORT_POST1 | \
+	 MASK_L2_CRGBF_ISP_INT_ABORT_OTHER)
+
+/*----------------------------------------------
+ * HWA bus interface registers
+ */
+#define REG_HWAIF_HWAIF_EN	  0
+#define REG_HWAIF_HWAIF_CONF	  0x10
+#define REG_HWAIF_OSTD_RLEN	  0x14
+#define REG_HWAIF_OSTD_WREQ	  0x18
+#define REG_HWAIF_REGION_ENTRY_EN 0xf0
+
+/*----------------------------------------------
+ * Memory Protection Unit registers
+ */
+#define REG_MPU_MP_EN 0
+#define REG_MPU_MF_EN 0x3a4
+
+#endif /* __VIIF_REGS_H__ */
diff --git a/include/uapi/linux/visconti_viif.h b/include/uapi/linux/visconti_viif.h
new file mode 100644
index 000000000000..91785dbb8448
--- /dev/null
+++ b/include/uapi/linux/visconti_viif.h
@@ -0,0 +1,1911 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#ifndef __UAPI_VISCONTI_VIIF_H_
+#define __UAPI_VISCONTI_VIIF_H_
+
+#include <linux/types.h>
+#include <linux/v4l2-controls.h>
+
+/* Enable/Disable flag */
+#define VIIF_DISABLE (0U)
+#define VIIF_ENABLE  (1U)
+
+/**
+ * enum viif_l1_input - L1ISP preprocessing mode,
+ *
+ * @VIIF_L1_INPUT_HDR: accepts HDR input; bypass preprocessing
+ * @VIIF_L1_INPUT_PWL: accepts PWL input; runs HDRE
+ * @VIIF_L1_INPUT_HDR_IMG_CORRECT: accepts HDR input;
+ *                                 runs SLIC, ABPC, PWHB,RCNR, HDRS
+ * @VIIF_L1_INPUT_PWL_IMG_CORRECT: accepts PWR input;
+ *                                 runs HDRE, SLIC, ABPC, PWHB, RCNR, HDRS
+ */
+enum viif_l1_input {
+	VIIF_L1_INPUT_HDR = 0,
+	VIIF_L1_INPUT_PWL = 1,
+	VIIF_L1_INPUT_HDR_IMG_CORRECT = 3,
+	VIIF_L1_INPUT_PWL_IMG_CORRECT = 4,
+};
+
+/**
+ * struct viif_l1_input_mode_config - L1ISP parameter for input mode.
+ *
+ * @mode: &enum viif_l1_input value.
+ */
+struct viif_l1_input_mode_config {
+	__u32 mode;
+};
+
+/**
+ * struct viif_l1_rgb_to_y_coef_config - L1ISP parameter for calculating Y from
+ *                                       RGB
+ *
+ * @coef_r: R co-efficient. Range: [256..65024], Accuracy: 1/65536.
+ * @coef_g: G co-efficient. Range: [256..65024], Accuracy: 1/65536.
+ * @coef_b: B co-efficient. Range: [256..65024], Accuracy: 1/65536.
+ * @reserved: padding field
+ */
+struct viif_l1_rgb_to_y_coef_config {
+	__u16 coef_r;
+	__u16 coef_g;
+	__u16 coef_b;
+	__u16 reserved;
+};
+
+/**
+ * enum viif_l1_img_sensitivity_mode - L1ISP image sensitivity
+ *
+ * @VIIF_L1_IMG_SENSITIVITY_HIGH: high sensitivity
+ * @VIIF_L1_IMG_SENSITIVITY_MIDDLE_LED: middle sensitivity or led
+ * @VIIF_L1_IMG_SENSITIVITY_LOW: low sensitivity
+ */
+enum viif_l1_img_sensitivity_mode {
+	VIIF_L1_IMG_SENSITIVITY_HIGH = 0,
+	VIIF_L1_IMG_SENSITIVITY_MIDDLE_LED = 1,
+	VIIF_L1_IMG_SENSITIVITY_LOW = 2,
+};
+
+/**
+ * struct viif_l1_ag_mode_config - L1ISP parameter for algorithm gain
+ *
+ * @sysm_ag_grad: Algorithm gain slope for psel id. Range: [0..255]
+ * @sysm_ag_ofst: Algorithm gain offset for psel id. Range: [0..65535]
+ * @sysm_ag_cont_hobc_en_high: set 1 to enable generating algorithm gain for
+ *                             high sensitivity image of OBCC
+ * @sysm_ag_psel_hobc_high: parameter selection id for high sensitivity image
+ *                          of OBCC. Range: [0..3]
+ * @sysm_ag_cont_hobc_en_middle_led: set 1 to enable generating algorithm gain
+ *                                   for middle sensitivity or LED image of OBCC
+ * @sysm_ag_psel_hobc_middle_led: parameter selection id for middle sensitivity
+ *                                or LED image of OBCC. Range: [0..3]
+ * @sysm_ag_cont_hobc_en_low: set 1 to enable generating algorithm gain for low
+ *                            sensitivity image of OBCC
+ * @sysm_ag_psel_hobc_low: parameter selection id for low sensitivity image of
+ *                         OBCC. Range:[0..3]
+ * @sysm_ag_cont_abpc_en_high: set 1 to enable generating algorithm gain for
+ *                             high sensitivity image of ABPC
+ * @sysm_ag_psel_abpc_high: parameter selection id for high sensitivity image
+ *                          of ABPC. Range: [0..3]
+ * @sysm_ag_cont_abpc_en_middle_led: set 1 to enable generating algorithm gain
+ *                                   for middle sensitivity or LED image of
+ *                                   ABPC
+ * @sysm_ag_psel_abpc_middle_led: parameter selection id for middle sensitivity
+ *                                or LED image of ABPC. Range: [0..3]
+ * @sysm_ag_cont_abpc_en_low: set 1 to enable generating algorithm gain for low
+ *                            sensitivity image of ABPC
+ * @sysm_ag_psel_abpc_low: parameter selection id for low sensitivity image of
+ *                         ABPC. Range: [0..3]
+ * @sysm_ag_cont_rcnr_en_high: set 1 to enable generating algorithm gain for
+ *                             high sensitivity image of RCNR
+ * @sysm_ag_psel_rcnr_high: parameter selection id for high sensitivity image
+ *                          of RCNR. Range: [0..3]
+ * @sysm_ag_cont_rcnr_en_middle_led: set 1 to enable generating algorithm gain
+ *                                   for middle sensitivity or LED image of RCNR
+ * @sysm_ag_psel_rcnr_middle_led: parameter selection id for middle sensitivity
+ *                                or LED image of RCNR. Range: [0..3]
+ * @sysm_ag_cont_rcnr_en_low: set 1 to enable generating algorithm gain for low
+ *                            sensitivity image of RCNR
+ * @sysm_ag_psel_rcnr_low: parameter selection id for low sensitivity image of
+ *                         RCNR. Range: [0..3]
+ * @sysm_ag_cont_lssc_en: set 1 to enable generating algorithm gain for LSC
+ * @sysm_ag_ssel_lssc: &enum viif_l1_img_sensitivity_mode value. Sensitive
+ *                     image used for LSC.
+ * @sysm_ag_psel_lssc: parameter selection id for LSC. Range: [0..3]
+ * @sysm_ag_cont_mpro_en: set 1 to enable generating algorithm gain for color
+ *                        matrix
+ * @sysm_ag_ssel_mpro: &enum viif_l1_img_sensitivity_mode value. Sensitive
+ *                     image used for color matrix.
+ * @sysm_ag_psel_mpro: parameter selection id for color matrix. Range: [0..3]
+ * @sysm_ag_cont_vpro_en: set 1 to enable generating algorithm gain for image
+ *                        quality adjustment
+ * @sysm_ag_ssel_vpro: &enum viif_l1_img_sensitivity_mode value. Sensitive
+ *                     image used for image quality adjustment.
+ * @sysm_ag_psel_vpro: parameter selection id for image quality adjustment.
+ *                     Range: [0..3]
+ * @sysm_ag_cont_hobc_test_high: Manually specified algorithm gain for high
+ *                               sensitivity image of OBCC. Range: [0..255]
+ * @sysm_ag_cont_hobc_test_middle_led: Manually specified algorithm gain for
+ *                                     middle sensitivity or led image of OBCC.
+ *                                     Range: [0..255]
+ * @sysm_ag_cont_hobc_test_low: Manually specified algorithm gain for low
+ *                              sensitivity image of OBCC. Range: [0..255]
+ * @sysm_ag_cont_abpc_test_high: Manually specified algorithm gain for high
+ *                               sensitivity image of ABPC. Range: [0..255]
+ * @sysm_ag_cont_abpc_test_middle_led: Manually specified algorithm gain for
+ *                                     middle sensitivity or led image of ABPC.
+ *                                     Range: [0..255]
+ * @sysm_ag_cont_abpc_test_low: Manually specified algorithm gain for low
+ *                              sensitivity image of ABPC. Range: [0..255]
+ * @sysm_ag_cont_rcnr_test_high: Manually specified algorithm gain for high
+ *                               sensitivity image of RCNR. Range: [0..255]
+ * @sysm_ag_cont_rcnr_test_middle_led: Manually specified algorithm gain for
+ *                                     middle sensitivity or led image of RCNR.
+ *                                     Range: [0..255]
+ * @sysm_ag_cont_rcnr_test_low: Manually specified algorithm gain for low
+ *                              sensitivity image of RCNR. Range:  [0..255]
+ * @sysm_ag_cont_lssc_test: Manually specified algorithm gain for LSSC.
+ *                          Range: [0..255]
+ * @sysm_ag_cont_mpro_test: Manually specified algorithm gain for color matrix.
+ *                          Range: [0..255]
+ * @sysm_ag_cont_vpro_test: Manually specified algorithm gain for image quality
+ *                          adjustment. Range: [0..255]
+ *
+ * This parameter sets rules of generating algorithm gains for each feature in
+ * L1ISP. Related features are:
+ *
+ * - Optical Black Clamp Correction (OBCC)
+ * - Defect Pixel Correction (DPC)
+ * - RAW Color Noise Reduction (RCNR)
+ * - Lens Shading Correction (LSC)
+ * - Color matrix correction (MPRO)
+ * - Image quality adjustment (VPRO)
+ *
+ * The base gain is set with  &struct viif_l1_ag_config.
+ *
+ * If sysm_ag_cont_xxxx_en = 1, algorithm gain for each module is generated from
+ * sysm_ag_grad, sysm_ag_ofst and the value specified with
+ * &struct viif_l1_ag_config.
+ *
+ * If sysm_ag_cont_xxxx_en = 0, the value of sysm_ag_cont_xxxx_test is used for
+ * algorithm gain for each module.
+ *
+ * Up to 4 sets of parameters (sysm_ag_grad[4] and sysm_ag_ofst[4]) can be used
+ * to generate algorithm gain.
+ * The parameter sysm_ag_psel_xxxx specifies the set to be used for module xxxx.
+ * For example, if sysm_ag_psel_hobc_high is set to 2,
+ * values in sysm_ag_grad[2] and sysm_ag_ofst[2] are used
+ * to generate algorithm gain for high sensitivity images in OBCC processing.
+ *
+ * Algorithm gain generation for each L1ISP module is disabled when
+ * "sysm_ag_cont_xxxx_en=0" and "sysm_ag_cont_xxxx_test=0".
+ * Be sure to disable the algorithm gain generation
+ * if VIIF_L1_INPUT_HDR or VIIF_L1_INPUT_PWL is set to
+ * &struct viif_l1_input_mode_config
+ *
+ */
+struct viif_l1_ag_mode_config {
+	__u8 sysm_ag_grad[4];
+	__u16 sysm_ag_ofst[4];
+	__u32 sysm_ag_cont_hobc_en_high;
+	__u32 sysm_ag_psel_hobc_high;
+	__u32 sysm_ag_cont_hobc_en_middle_led;
+	__u32 sysm_ag_psel_hobc_middle_led;
+	__u32 sysm_ag_cont_hobc_en_low;
+	__u32 sysm_ag_psel_hobc_low;
+	__u32 sysm_ag_cont_abpc_en_high;
+	__u32 sysm_ag_psel_abpc_high;
+	__u32 sysm_ag_cont_abpc_en_middle_led;
+	__u32 sysm_ag_psel_abpc_middle_led;
+	__u32 sysm_ag_cont_abpc_en_low;
+	__u32 sysm_ag_psel_abpc_low;
+	__u32 sysm_ag_cont_rcnr_en_high;
+	__u32 sysm_ag_psel_rcnr_high;
+	__u32 sysm_ag_cont_rcnr_en_middle_led;
+	__u32 sysm_ag_psel_rcnr_middle_led;
+	__u32 sysm_ag_cont_rcnr_en_low;
+	__u32 sysm_ag_psel_rcnr_low;
+	__u32 sysm_ag_cont_lssc_en;
+	__u32 sysm_ag_ssel_lssc;
+	__u32 sysm_ag_psel_lssc;
+	__u32 sysm_ag_cont_mpro_en;
+	__u32 sysm_ag_ssel_mpro;
+	__u32 sysm_ag_psel_mpro;
+	__u32 sysm_ag_cont_vpro_en;
+	__u32 sysm_ag_ssel_vpro;
+	__u32 sysm_ag_psel_vpro;
+	__u8 sysm_ag_cont_hobc_test_high;
+	__u8 sysm_ag_cont_hobc_test_middle_led;
+	__u8 sysm_ag_cont_hobc_test_low;
+	__u8 sysm_ag_cont_abpc_test_high;
+	__u8 sysm_ag_cont_abpc_test_middle_led;
+	__u8 sysm_ag_cont_abpc_test_low;
+	__u8 sysm_ag_cont_rcnr_test_high;
+	__u8 sysm_ag_cont_rcnr_test_middle_led;
+	__u8 sysm_ag_cont_rcnr_test_low;
+	__u8 sysm_ag_cont_lssc_test;
+	__u8 sysm_ag_cont_mpro_test;
+	__u8 sysm_ag_cont_vpro_test;
+};
+
+/**
+ * struct viif_l1_ag_config - L1ISP parameter for algorithm gain
+ *
+ * @gain_h: Algorithm gain for high sensitive image. Range: [0..65535].
+ * @gain_m: Algorithm gain for middle sensitive image or LED image.
+ *          Range: [0..65535].
+ * @gain_l: Algorithm gain for low sensitive image. Range:  [0..65535].
+ * @reserved: padding field
+ *
+ * This parameter provides base algorithm gain commonly used in L1ISP features.
+ * Algorithm gain for each L1ISP feature is generated from this base algorithm gain
+ * and a configuration via &struct viif_l1_ag_mode_config.
+ */
+struct viif_l1_ag_config {
+	__u16 gain_h;
+	__u16 gain_m;
+	__u16 gain_l;
+	__u16 reserved;
+};
+
+/**
+ * struct viif_l1_hdre_config - L1ISP parameter for HDR expansion at
+ *                              preprocessing
+ *
+ * @hdre_src_point: Knee point N value of PWL compressed signal.
+ *                  Range: [0..0x3fff].
+ * @hdre_dst_base: Offset value of HDR signal in Knee area M.
+ *                 Range: [0..0xffffff].
+ * @hdre_ratio: Slope of output pixel value in Knee area M.
+ *              Range: [0..0x3fffff], Accuracy: 1/64.
+ * @hdre_dst_max_val: Maximum value of output pixel. Range: [0..0xffffff].
+ */
+struct viif_l1_hdre_config {
+	__u32 hdre_src_point[16];
+	__u32 hdre_dst_base[17];
+	__u32 hdre_ratio[17];
+	__u32 hdre_dst_max_val;
+};
+
+/**
+ * struct viif_l1_img_extraction_config -  L1ISP parameter for black level of
+ *                                         input image
+ *
+ * @input_black_gr: Black level of input pixel (Gr). Range: [0..0xffffff].
+ * @input_black_r: Black level of input pixel (R). Range: [0..0xffffff].
+ * @input_black_b: Black level of input pixel (B). Range: [0..0xffffff].
+ * @input_black_gb: Black level of input pixel (Gb). Range: [0..0xffffff].
+ */
+struct viif_l1_img_extraction_config {
+	__u32 input_black_gr;
+	__u32 input_black_r;
+	__u32 input_black_b;
+	__u32 input_black_gb;
+};
+
+/**
+ * enum viif_l1_dpc_mode - L1ISP defect pixel correction mode
+ *
+ * @VIIF_L1_DPC_1PIXEL: 1 pixel correction mode
+ * @VIIF_L1_DPC_2PIXEL: 2 pixel correction mode
+ */
+enum viif_l1_dpc_mode {
+	VIIF_L1_DPC_1PIXEL = 0,
+	VIIF_L1_DPC_2PIXEL = 1,
+};
+
+/**
+ * struct viif_l1_dpc - L1ISP defect pixel correction parameters for
+ *                      &struct viif_l1_dpc_config
+ *
+ * @abpc_sta_en: 1:enable/0:disable setting of Static DPC
+ * @abpc_dyn_en: 1:enable/0:disable setting of Dynamic DPC
+ * @abpc_dyn_mode: &enum viif_l1_dpc_mode value. Sets dynamic DPC mode.
+ * @abpc_ratio_limit: Variation adjustment of dynamic DPC. Range: [0..1023].
+ * @abpc_dark_limit: White defect judgment limit of dark area. Range: [0..1023].
+ * @abpc_sn_coef_w_ag_min: Luminance difference adjustment of white DPC
+ *                         (under lower threshold).
+ * @abpc_sn_coef_w_ag_mid: Luminance difference adjustment of white DPC
+ *                         (between lower and upper threshold).
+ * @abpc_sn_coef_w_ag_max: Luminance difference adjustment of white DPC
+ *                         (over upper threshold).
+ * @abpc_sn_coef_b_ag_min: Luminance difference adjustment of black DPC
+ *                         (under lower threshold).
+ * @abpc_sn_coef_b_ag_mid: Luminance difference adjustment of black DPC
+ *                         (between lower and upper threshold).
+ * @abpc_sn_coef_b_ag_max: Luminance difference adjustment of black DPC
+ *                         (over upper threshold).
+ * @abpc_sn_coef_w_th_min: Luminance difference adjustment of white DPC
+ *                         algorithm gain lower threshold.
+ * @abpc_sn_coef_w_th_max: Luminance difference adjustment of white DPC
+ *                         algorithm gain upper threshold.
+ * @abpc_sn_coef_b_th_min: Luminance difference adjustment of black DPC
+ *                         algorithm gain lower threshold.
+ * @abpc_sn_coef_b_th_max: Luminance difference adjustment of black DPC
+ *                         algorithm gain upper threshold.
+ *
+ * Range of abpc_sn_coef_{w,b}_ag_{min,mid,max} is:
+ *
+ * - Range: [1..31]
+ *
+ * Range and constraints of sn_coef_{w,b}_th_{min,max} are:
+ *
+ * - Range: [0..255]
+ * - Constraint: abpc_sn_coef_w_th_min < abpc_sn_coef_w_th_max
+ * - Constraint: abpc_sn_coef_b_th_min < abpc_sn_coef_b_th_max
+ */
+struct viif_l1_dpc {
+	__u32 abpc_sta_en;
+	__u32 abpc_dyn_en;
+	__u32 abpc_dyn_mode;
+	__u32 abpc_ratio_limit;
+	__u32 abpc_dark_limit;
+	__u32 abpc_sn_coef_w_ag_min;
+	__u32 abpc_sn_coef_w_ag_mid;
+	__u32 abpc_sn_coef_w_ag_max;
+	__u32 abpc_sn_coef_b_ag_min;
+	__u32 abpc_sn_coef_b_ag_mid;
+	__u32 abpc_sn_coef_b_ag_max;
+	__u8 abpc_sn_coef_w_th_min;
+	__u8 abpc_sn_coef_w_th_max;
+	__u8 abpc_sn_coef_b_th_min;
+	__u8 abpc_sn_coef_b_th_max;
+};
+
+/**
+ * struct viif_l1_dpc_config - L1ISP parameter for defect pixel correction
+ *
+ * @param_h: DPC parameter for high sensitive image.
+ *           Refer to &struct viif_l1_dpc
+ * @param_m: DPC parameter for middle sensitive image.
+ *           Refer to &struct viif_l1_dpc
+ * @param_l: DPC parameter for low sensitive image.
+ *           Refer to &struct viif_l1_dpc
+ * @table_h: DPC table for high sensitive image.
+ *           The table is referred only when param_h.abpc_sta_en =1
+ * @table_m: DPC table for middle sensitive image or LED image.
+ *           The table is referred only when param_m.abpc_sta_en =1
+ * @table_l: DPC table for low sensitive image.
+ *           The table is referred only when param_l.abpc_sta_en =1
+ *
+ * The size of each table is 8192 Bytes (u32 * 2048)
+ * Application should make sure that the table data is based on HW specification
+ * since this driver does not check the DPC table.
+ */
+struct viif_l1_dpc_config {
+	struct viif_l1_dpc param_h;
+	struct viif_l1_dpc param_m;
+	struct viif_l1_dpc param_l;
+	__u32 table_h[2048];
+	__u32 table_m[2048];
+	__u32 table_l[2048];
+};
+
+/**
+ * struct viif_l1_preset_wb - L1ISP  preset white balance parameters
+ * for &struct viif_l1_preset_white_balance_config
+ * @gain_gr: Gr gain. Range: [0..524287], Accuracy 1/16384
+ * @gain_r: R gain. Range: [0..524287], Accuracy 1/16384
+ * @gain_b: B gain. Range: [0..524287], Accuracy 1/16384
+ * @gain_gb: Gb gain. Range: [0..524287], Accuracy 1/16384
+ */
+struct viif_l1_preset_wb {
+	__u32 gain_gr;
+	__u32 gain_r;
+	__u32 gain_b;
+	__u32 gain_gb;
+};
+
+/**
+ * struct viif_l1_preset_white_balance_config - L1ISP parameter for preset
+ *                                              white balance
+ *
+ * @dstmaxval: Maximum value of output pixel. Range: [0..4095]
+ * @param_h: Preset white balance parameters for high sensitive image. Refer to
+ *           &struct viif_l1_preset_wb
+ * @param_m: Preset white balance parameters for middle sensitive image or LED
+ *           image. Refer to &struct viif_l1_preset_wb
+ * @param_l: Preset white balance parameters for low sensitive image. Refer to
+ *           &struct viif_l1_preset_wb
+ */
+struct viif_l1_preset_white_balance_config {
+	__u32 dstmaxval;
+	struct viif_l1_preset_wb param_h;
+	struct viif_l1_preset_wb param_m;
+	struct viif_l1_preset_wb param_l;
+};
+
+/**
+ * enum viif_l1_rcnr_type - L1ISP high resolution luminance filter type
+ *
+ * @VIIF_L1_RCNR_LOW_RESOLUTION: low resolution
+ * @VIIF_L1_RCNR_MIDDLE_RESOLUTION: middle resolution
+ * @VIIF_L1_RCNR_HIGH_RESOLUTION: high resolution
+ * @VIIF_L1_RCNR_ULTRA_HIGH_RESOLUTION: ultra high resolution
+ */
+enum viif_l1_rcnr_type {
+	VIIF_L1_RCNR_LOW_RESOLUTION = 0,
+	VIIF_L1_RCNR_MIDDLE_RESOLUTION = 1,
+	VIIF_L1_RCNR_HIGH_RESOLUTION = 2,
+	VIIF_L1_RCNR_ULTRA_HIGH_RESOLUTION = 3,
+};
+
+/**
+ * enum viif_l1_msf_blend_ratio - L1ISP MSF blend ratio
+ *
+ * @VIIF_L1_MSF_BLEND_RATIO_0_DIV_64: 0/64
+ * @VIIF_L1_MSF_BLEND_RATIO_1_DIV_64: 1/64
+ * @VIIF_L1_MSF_BLEND_RATIO_2_DIV_64: 2/64
+ */
+enum viif_l1_msf_blend_ratio {
+	VIIF_L1_MSF_BLEND_RATIO_0_DIV_64 = 0,
+	VIIF_L1_MSF_BLEND_RATIO_1_DIV_64 = 1,
+	VIIF_L1_MSF_BLEND_RATIO_2_DIV_64 = 2,
+};
+
+/**
+ * struct viif_l1_raw_color_noise_reduction - L1ISP RCNR parameters for
+ * &struct viif_l1_raw_color_noise_reduction_config
+ *
+ * @rcnr_sw: set 1 to enable RAW color noise reduction, 0 to disable.
+ * @rcnr_cnf_dark_ag0: Maximum value of LSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_cnf_dark_ag1: Middle value of LSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_cnf_dark_ag2: Minimum value of LSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_cnf_ratio_ag0: Maximum value of LSF luminance interlocking noise
+ *                      adjustment. Range: [0..31].
+ * @rcnr_cnf_ratio_ag1: Middle value of LSF luminance interlocking noise
+ *                      adjustment. Range: [0..31].
+ * @rcnr_cnf_ratio_ag2: Minimum value of LSF luminance interlocking noise
+ *                      adjustment: Range: [0..31].
+ * @rcnr_cnf_clip_gain_r: LSF color correction limit adjustment gain R.
+ *                        Range: [0..3].
+ * @rcnr_cnf_clip_gain_g: LSF color correction limit adjustment gain G.
+ *                        Range: [0..3].
+ * @rcnr_cnf_clip_gain_b: LSF color correction limit adjustment gain B.
+ *                        Range: [0..3].
+ * @rcnr_a1l_dark_ag0: Maximum value of MSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_a1l_dark_ag1: Middle value of MSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_a1l_dark_ag2: Minimum value of MSF dark noise adjustment.
+ *                     Range: [0..63].
+ * @rcnr_a1l_ratio_ag0: Maximum value of MSF luminance interlocking noise
+ *                      adjustment. Range: [0..31].
+ * @rcnr_a1l_ratio_ag1: Middle value of MSF luminance interlocking noise
+ *                      adjustment. Range: [0..31].
+ * @rcnr_a1l_ratio_ag2: Minimum value of MSF luminance interlocking noise
+ *                      adjustment. Range: [0..31].
+ * @rcnr_inf_zero_clip: Input stage zero clip setting. Range: [0..256].
+ * @rcnr_merge_d2blend_ag0: Maximum value of filter results and input blend
+ *                          ratio. Range: [0..16].
+ * @rcnr_merge_d2blend_ag1: Middle value of filter results and input blend
+ *                          ratio. Range: [0..16].
+ * @rcnr_merge_d2blend_ag2: Minimum value of filter results and input blend
+ *                          ratio. Range: [0..16].
+ * @rcnr_merge_black: Black level minimum value. Range: [0..64].
+ * @rcnr_merge_mindiv: 0 div guard value of inverse arithmetic unit.
+ *                     Range: [4..16].
+ * @rcnr_hry_type: &enum viif_l1_rcnr_type value. Filter type for HSF filter
+ *                 process.
+ * @rcnr_anf_blend_ag0: &enum viif_l1_msf_blend_ratio value. Maximum value of
+ *                      MSF result blend ratio in write back data to line
+ *                      memory.
+ * @rcnr_anf_blend_ag1: &enum viif_l1_msf_blend_ratio value. Middle value of
+ *                      MSF result blend ratio in write back data to line
+ *                      memory.
+ * @rcnr_anf_blend_ag2: &enum viif_l1_msf_blend_ratio value. Minimum value of
+ *                      MSF result blend ratio in write back data to line
+ *                      memory.
+ * @rcnr_lpf_threshold: Multiplier value for calculating dark noise / luminance
+ *                      interlock noise of MSF. Range: [0..31], Accuracy: 1/8.
+ * @rcnr_merge_hlblend_ag0: Maximum value of luminance signal generation blend.
+ *                          Range: [0..2].
+ * @rcnr_merge_hlblend_ag1: Middle value of luminance signal generation blend.
+ *                          Range: [0..2].
+ * @rcnr_merge_hlblend_ag2: Minimum value of luminance signal generation blend.
+ *                          Range: [0..2].
+ * @rcnr_gnr_sw: set 1 to enable Gr/Gb sensitivity ratio correction function
+ *               switching, 0 to disable.
+ * @rcnr_gnr_ratio: Upper limit of Gr/Gb sensitivity ratio correction factor.
+ *                  Range: [0..15].
+ * @rcnr_gnr_wide_en: set 1 to double correction upper limit ratio of
+ *                    rcnr_gnr_ratio, 0 to just use the specified ratio.
+ */
+struct viif_l1_raw_color_noise_reduction {
+	__u32 rcnr_sw;
+	__u32 rcnr_cnf_dark_ag0;
+	__u32 rcnr_cnf_dark_ag1;
+	__u32 rcnr_cnf_dark_ag2;
+	__u32 rcnr_cnf_ratio_ag0;
+	__u32 rcnr_cnf_ratio_ag1;
+	__u32 rcnr_cnf_ratio_ag2;
+	__u32 rcnr_cnf_clip_gain_r;
+	__u32 rcnr_cnf_clip_gain_g;
+	__u32 rcnr_cnf_clip_gain_b;
+	__u32 rcnr_a1l_dark_ag0;
+	__u32 rcnr_a1l_dark_ag1;
+	__u32 rcnr_a1l_dark_ag2;
+	__u32 rcnr_a1l_ratio_ag0;
+	__u32 rcnr_a1l_ratio_ag1;
+	__u32 rcnr_a1l_ratio_ag2;
+	__u32 rcnr_inf_zero_clip;
+	__u32 rcnr_merge_d2blend_ag0;
+	__u32 rcnr_merge_d2blend_ag1;
+	__u32 rcnr_merge_d2blend_ag2;
+	__u32 rcnr_merge_black;
+	__u32 rcnr_merge_mindiv;
+	__u32 rcnr_hry_type;
+	__u32 rcnr_anf_blend_ag0;
+	__u32 rcnr_anf_blend_ag1;
+	__u32 rcnr_anf_blend_ag2;
+	__u32 rcnr_lpf_threshold;
+	__u32 rcnr_merge_hlblend_ag0;
+	__u32 rcnr_merge_hlblend_ag1;
+	__u32 rcnr_merge_hlblend_ag2;
+	__u32 rcnr_gnr_sw;
+	__u32 rcnr_gnr_ratio;
+	__u32 rcnr_gnr_wide_en;
+};
+
+/**
+ * struct viif_l1_raw_color_noise_reduction_config - L1ISP parameter for raw
+ *                                                   color noise reduction.
+ *
+ * @param_h: RAW color noise reduction parameter for high sensitive image.
+ *           Refer to &struct viif_l1_raw_color_noise_reduction
+ * @param_m: RAW color noise reduction parameter for middle sensitive image or
+ *           LED image. Refer to &struct viif_l1_raw_color_noise_reduction
+ * @param_l: RAW color noise reduction parameter for low sensitive image.
+ *           Refer to &struct viif_l1_raw_color_noise_reduction
+ */
+struct viif_l1_raw_color_noise_reduction_config {
+	struct viif_l1_raw_color_noise_reduction param_h;
+	struct viif_l1_raw_color_noise_reduction param_m;
+	struct viif_l1_raw_color_noise_reduction param_l;
+};
+
+/**
+ * enum viif_l1_hdrs_middle_img_mode - L1ISP HDR setting
+ *
+ * @VIIF_L1_HDRS_NOT_USE_MIDDLE_SENS_IMAGE: not use middle image
+ * @VIIF_L1_HDRS_USE_MIDDLE_SENS_IMAGE: use middle image
+ */
+enum viif_l1_hdrs_middle_img_mode {
+	VIIF_L1_HDRS_NOT_USE_MIDDLE_SENS_IMAGE = 0,
+	VIIF_L1_HDRS_USE_MIDDLE_SENS_IMAGE = 1,
+};
+
+/**
+ * struct viif_l1_hdrs_config - L1ISP parameter for HDR synthesis
+ *
+ * @hdrs_hdr_mode: &enum viif_l1_hdrs_middle_img_mode value.
+ *                 Switch for use of middle sensitivity image in HDRS.
+ * @hdrs_hdr_ratio_m: Magnification ratio of middle sensitivity image for high
+ *                    sensitivity image.
+ * @hdrs_hdr_ratio_l: Magnification ratio of low sensitivity image for high
+ *                    sensitivity image.
+ * @hdrs_hdr_ratio_e: Magnification ratio of LED image for high sensitivity
+ *                    image.
+ * @hdrs_dg_h: High sensitivity image digital gain.
+ * @hdrs_dg_m: Middle sensitivity image digital gain.
+ * @hdrs_dg_l: Low sensitivity image digital gain.
+ * @hdrs_dg_e: LED image digital gain.
+ * @hdrs_blendend_h: Maximum luminance used for blend high sensitivity image.
+ * @hdrs_blendend_m: Maximum luminance used for blend middle sensitivity image.
+ * @hdrs_blendend_e: Maximum luminance used for blend LED image.
+ * @hdrs_blendbeg_h: Minimum luminance used for blend high sensitivity image.
+ * @hdrs_blendbeg_m: Minimum luminance used for blend middle sensitivity image.
+ * @hdrs_blendbeg_e: Minimum luminance used for blend LED image.
+ * @hdrs_led_mode_on: set 1 to enable LED mode, 0 to disable
+ * @hdrs_dst_max_val: Maximum value of output pixel. Range: [0..0xffffff].
+ *
+ * Range and Accuracy of parameters are:
+ *
+ * - hdrs_hdr_ratio_{m,l,e}
+ *
+ *   - Range: [0x400..0x400000]
+ *   - Accuracy: 1/1024
+ *
+ * - hdrs_dg_{h,m,l,e}
+ *
+ *   - Range: [0..0x3fffff]
+ *   - Accuracy: 1/1024
+ *
+ * - hdrs_blend{end,beg}_{h,m,e}
+ *
+ *   - Range [0..4095]
+ *
+ * Parameter error will be returned when:
+ * (hdrs_hdr_mode == VIIF_L1_HDRS_USE_MIDDLE_SENS_IMAGE) && (hdrs_led_mode_on == 1)
+ */
+struct viif_l1_hdrs_config {
+	__u32 hdrs_hdr_mode;
+	__u32 hdrs_hdr_ratio_m;
+	__u32 hdrs_hdr_ratio_l;
+	__u32 hdrs_hdr_ratio_e;
+	__u32 hdrs_dg_h;
+	__u32 hdrs_dg_m;
+	__u32 hdrs_dg_l;
+	__u32 hdrs_dg_e;
+	__u32 hdrs_blendend_h;
+	__u32 hdrs_blendend_m;
+	__u32 hdrs_blendend_e;
+	__u32 hdrs_blendbeg_h;
+	__u32 hdrs_blendbeg_m;
+	__u32 hdrs_blendbeg_e;
+	__u32 hdrs_led_mode_on;
+	__u32 hdrs_dst_max_val;
+};
+
+/**
+ * struct viif_l1_black_level_correction_config -  L1ISP parameter for black
+ *                                                 level correction.
+ *
+ * @srcblacklevel_gr: Black level of Gr input pixel. Range: [0..0xffffff].
+ * @srcblacklevel_r: Black level of R input pixel. Range: [0..0xffffff].
+ * @srcblacklevel_b: Black level of B input pixel. Range: [0..0xffffff].
+ * @srcblacklevel_gb: Black level of Gb input pixel. Range: [0..0xffffff].
+ * @mulval_gr: Gr gain. Range: [0..0xfffff], Accuracy: 1/256.
+ * @mulval_r: R gain. Range: [0..0xfffff], Accuracy: 1/256.
+ * @mulval_b: B gain. Range: [0..0xfffff], Accuracy: 1/256.
+ * @mulval_gb: Gb gain. Range: [0..0xfffff], Accuracy: 1/256.
+ * @dstmaxval: Maximum value of output pixel. Range: [0..0xffffff].
+ */
+struct viif_l1_black_level_correction_config {
+	__u32 srcblacklevel_gr;
+	__u32 srcblacklevel_r;
+	__u32 srcblacklevel_b;
+	__u32 srcblacklevel_gb;
+	__u32 mulval_gr;
+	__u32 mulval_r;
+	__u32 mulval_b;
+	__u32 mulval_gb;
+	__u32 dstmaxval;
+};
+
+/**
+ * enum viif_l1_para_coef_gain - L1ISP parabola shading correction coefficient
+ *                               ratio
+ *
+ * @VIIF_L1_PARA_COEF_GAIN_ONE_EIGHTH: 1/8
+ * @VIIF_L1_PARA_COEF_GAIN_ONE_FOURTH: 1/4
+ * @VIIF_L1_PARA_COEF_GAIN_ONE_SECOND: 1/2
+ * @VIIF_L1_PARA_COEF_GAIN_ONE_FIRST: 1/1
+ */
+enum viif_l1_para_coef_gain {
+	VIIF_L1_PARA_COEF_GAIN_ONE_EIGHTH = 0, /* 1/8 */
+	VIIF_L1_PARA_COEF_GAIN_ONE_FOURTH = 1, /* 1/4 */
+	VIIF_L1_PARA_COEF_GAIN_ONE_SECOND = 2, /* 1/2 */
+	VIIF_L1_PARA_COEF_GAIN_ONE_FIRST = 3, /* 1/1 */
+};
+
+/**
+ * enum viif_l1_grid_coef_gain - L1ISP grid shading correction coefficient ratio
+ *
+ * @VIIF_L1_GRID_COEF_GAIN_X1: x1
+ * @VIIF_L1_GRID_COEF_GAIN_X2: x2
+ */
+enum viif_l1_grid_coef_gain {
+	VIIF_L1_GRID_COEF_GAIN_X1 = 0,
+	VIIF_L1_GRID_COEF_GAIN_X2 = 1,
+};
+
+/**
+ * struct viif_l1_lsc_parabola_ag_param - L2ISP parabola shading parameters for
+ *                                        &struct viif_l1_lsc_parabola_param
+ *
+ * @lssc_paracoef_h_l_max: Parabola coefficient left maximum gain value
+ * @lssc_paracoef_h_l_min: Parabola coefficient left minimum gain value
+ * @lssc_paracoef_h_r_max: Parabola coefficient right maximum gain value
+ * @lssc_paracoef_h_r_min: Parabola coefficient right minimum gain value
+ * @lssc_paracoef_v_u_max: Parabola coefficient upper maximum gain value
+ * @lssc_paracoef_v_u_min: Parabola coefficient upper minimum gain value
+ * @lssc_paracoef_v_d_max: Parabola coefficient lower maximum gain value
+ * @lssc_paracoef_v_d_min: Parabola coefficient lower minimum gain value
+ * @lssc_paracoef_hv_lu_max: Parabola coefficient upper left gain maximum value
+ * @lssc_paracoef_hv_lu_min: Parabola coefficient upper left gain minimum value
+ * @lssc_paracoef_hv_ru_max: Parabola coefficient upper right gain maximum value
+ * @lssc_paracoef_hv_ru_min: Parabola coefficient upper right minimum gain value
+ * @lssc_paracoef_hv_ld_max: Parabola coefficient lower left gain maximum value
+ * @lssc_paracoef_hv_ld_min: Parabola coefficient lower left gain minimum value
+ * @lssc_paracoef_hv_rd_max: Parabola coefficient lower right gain maximum value
+ * @lssc_paracoef_hv_rd_min: Parabola coefficient lower right minimum gain value
+ *
+ * The Range, Accuracy and Constraint of each coefficient are:
+ *
+ * - Range: [-4096..4095]
+ * - Accuracy: accuracy: 1/256
+ * - Constraint: lssc_paracoef_xx_xx_min <= lssc_paracoef_xx_xx_max
+ */
+struct viif_l1_lsc_parabola_ag_param {
+	__s16 lssc_paracoef_h_l_max;
+	__s16 lssc_paracoef_h_l_min;
+	__s16 lssc_paracoef_h_r_max;
+	__s16 lssc_paracoef_h_r_min;
+	__s16 lssc_paracoef_v_u_max;
+	__s16 lssc_paracoef_v_u_min;
+	__s16 lssc_paracoef_v_d_max;
+	__s16 lssc_paracoef_v_d_min;
+	__s16 lssc_paracoef_hv_lu_max;
+	__s16 lssc_paracoef_hv_lu_min;
+	__s16 lssc_paracoef_hv_ru_max;
+	__s16 lssc_paracoef_hv_ru_min;
+	__s16 lssc_paracoef_hv_ld_max;
+	__s16 lssc_paracoef_hv_ld_min;
+	__s16 lssc_paracoef_hv_rd_max;
+	__s16 lssc_paracoef_hv_rd_min;
+};
+
+/**
+ * struct viif_l1_lsc_parabola_param - L2ISP parabola shading parameters for
+ *                                     &struct viif_l1_lsc
+ *
+ * @lssc_para_h_center: Horizontal coordinate of central optical axis.
+ *                      Range: [0..(Input image width - 1)].
+ * @lssc_para_v_center: Vertical coordinate of central optical axis.
+ *                      Range: [0..(Input image height - 1)].
+ * @lssc_para_h_gain: Horizontal distance gain with the optical axis.
+ *                    Range: [0..4095], Accuracy: 1/256.
+ * @lssc_para_v_gain: Vertical distance gain with the optical axis.
+ *                    Range: [0..4095], Accuracy: 1/256.
+ * @lssc_para_mgsel2: &enum viif_l1_para_coef_gain value.
+ *                    Parabola 2D correction coefficient gain magnification
+ *                    ratio.
+ * @lssc_para_mgsel4: &enum viif_l1_para_coef_gain value.
+ *                    Parabola 4D correction coefficient gain magnification
+ *                    ratio.
+ * @r_2d: 2D parabola coefficient for R.
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @r_4d: 4D parabola coefficient for R.
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @gr_2d: 2D parabola coefficient for Gr
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @gr_4d: 4D parabola coefficient for Gr
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @gb_2d: 2D parabola coefficient for Gb
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @gb_4d: 4D parabola coefficient for Gb
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @b_2d: 2D parabola coefficient for B
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ * @b_4d: 4D parabola coefficient for B
+ *        Refer to &struct viif_l1_lsc_parabola_ag_param
+ */
+struct viif_l1_lsc_parabola_param {
+	__u32 lssc_para_h_center;
+	__u32 lssc_para_v_center;
+	__u32 lssc_para_h_gain;
+	__u32 lssc_para_v_gain;
+	__u32 lssc_para_mgsel2;
+	__u32 lssc_para_mgsel4;
+	struct viif_l1_lsc_parabola_ag_param r_2d;
+	struct viif_l1_lsc_parabola_ag_param r_4d;
+	struct viif_l1_lsc_parabola_ag_param gr_2d;
+	struct viif_l1_lsc_parabola_ag_param gr_4d;
+	struct viif_l1_lsc_parabola_ag_param gb_2d;
+	struct viif_l1_lsc_parabola_ag_param gb_4d;
+	struct viif_l1_lsc_parabola_ag_param b_2d;
+	struct viif_l1_lsc_parabola_ag_param b_4d;
+};
+
+/**
+ * struct viif_l1_lsc_grid_param - L2ISP grid shading parameters for
+ *                                 &struct viif_l1_lsc
+ *
+ * @lssc_grid_h_size:  Grid horizontal direction pixel count.
+ *                     Range: [32, 64, 128, 256, 512]
+ * @lssc_grid_v_size:  Grid vertical direction pixel count.
+ *                     Range: [32, 64, 128, 256, 512]
+ * @lssc_grid_h_center: Horizontal coordinates of grid (1, 1)
+ * @lssc_grid_v_center: Vertical coordinates of grid (1, 1)
+ * @lssc_grid_mgsel: &enum viif_l1_grid_coef_gain value.
+ *                   Grid correction coefficient gain value magnification ratio.
+ *
+ * Range and constraint of parameters are:
+ *
+ * - lssc_grid_h_center:
+ *
+ *    - Range: [1..lssc_grid_h_size]
+ *    - Constraint: "Input image width <= lssc_grid_h_center + lssc_grid_h_size * 31"
+ *
+ * - lssc_grid_v_center:
+ *
+ *    - Range: [1..lssc_grid_v_size]
+ *    - Constraint: "Input image height <= lssc_grid_v_center + lssc_grid_v_size * 23"
+ */
+struct viif_l1_lsc_grid_param {
+	__u32 lssc_grid_h_size;
+	__u32 lssc_grid_v_size;
+	__u32 lssc_grid_h_center;
+	__u32 lssc_grid_v_center;
+	__u32 lssc_grid_mgsel;
+};
+
+/**
+ * struct viif_l1_lsc - L2ISP LSC parameters for &struct viif_l1_lsc_config
+ *
+ * @lssc_parabola_param: see &struct viif_l1_lsc_parabola_param
+ * @lssc_grid_param: see &struct viif_l1_lsc_grid_param
+ * @lssc_pwhb_r_gain_max: PWB R correction coefficient maximum value
+ * @lssc_pwhb_r_gain_min: PWB R correction coefficient minimum value
+ * @lssc_pwhb_gr_gain_max: PWB Gr correction coefficient maximum value
+ * @lssc_pwhb_gr_gain_min: PWB Gr correction coefficient minimum value
+ * @lssc_pwhb_gb_gain_max: PWB Gb correction coefficient maximum value
+ * @lssc_pwhb_gb_gain_min: PWB Gb correction coefficient minimum value
+ * @lssc_pwhb_b_gain_max: PWB B correction coefficient maximum value
+ * @lssc_pwhb_b_gain_min: PWB B correction coefficient minimum value
+ *
+ * The range, accuracy and restriction of lssc_pwhb_{r,gr,gb,b}_gain_{max,min}
+ * are:
+ *
+ * - Range: [0..2047]
+ * - Accuracy: 1/256
+ * - Restriction: xxxx_gain_min <= xxxx_gain_max
+ */
+struct viif_l1_lsc {
+	struct viif_l1_lsc_parabola_param lssc_parabola_param;
+	struct viif_l1_lsc_grid_param lssc_grid_param;
+	__u32 lssc_pwhb_r_gain_max;
+	__u32 lssc_pwhb_r_gain_min;
+	__u32 lssc_pwhb_gr_gain_max;
+	__u32 lssc_pwhb_gr_gain_min;
+	__u32 lssc_pwhb_gb_gain_max;
+	__u32 lssc_pwhb_gb_gain_min;
+	__u32 lssc_pwhb_b_gain_max;
+	__u32 lssc_pwhb_b_gain_min;
+};
+
+/* MASKs for viif_l1_lsc_config::enable */
+#define VIIF_L1_LSC_PARABOLA_EN_MASK BIT(0)
+#define VIIF_L1_LSC_GRID_EN_MASK     BIT(1)
+
+/**
+ * struct viif_l1_lsc_config - L1ISP parameter for lens shading correction.
+ *
+ * @enable: set 0 to disable LSC operation,
+ *          1 to enable parabola shading,
+ *          2 to enable grid shading,
+ *          3 to enable both parabola and grid shadings.
+ * @param: see &struct viif_l1_lsc
+ * @table_gr: Grid table for LSC of Gr component.
+ *            This table is referred only when grid shading is used
+ * @table_r:  Grid table for LSC of R component.
+ *            This table is referred only when grid shading is used
+ * @table_b:  Grid table for LSC of B component.
+ *            This table is referred only when grid shading is used
+ * @table_gb: Grid table for LSC of Gb component.
+ *            This table is referred only when grid shading is used
+ *
+ * The size of each table is 1536 Bytes (u16 * 768).
+ * Application should make sure that the table data is based on HW specification
+ * since this driver does not check the grid table.
+ */
+struct viif_l1_lsc_config {
+	__u32 enable;
+	struct viif_l1_lsc param;
+	__u16 table_gr[768];
+	__u16 table_r[768];
+	__u16 table_b[768];
+	__u16 table_gb[768];
+};
+
+/**
+ * enum viif_l1_demosaic_mode - L1ISP demosaic modeenum viif_l1_demosaic_mode
+ *
+ * @VIIF_L1_DEMOSAIC_ACPI: Toshiba ACPI algorithm
+ * @VIIF_L1_DEMOSAIC_DMG: DMG algorithm
+ */
+enum viif_l1_demosaic_mode {
+	VIIF_L1_DEMOSAIC_ACPI = 0,
+	VIIF_L1_DEMOSAIC_DMG = 1,
+};
+
+/**
+ * struct viif_l1_color_matrix_correction - L1ISP color matrix correction
+ * parameters for &struct viif_l1_main_process_config
+ *
+ * @coef_rmg_min: (R-G) Minimum coefficient
+ * @coef_rmg_max: (R-G) Maximum coefficient
+ * @coef_rmb_min: (R-B) Minimum coefficient
+ * @coef_rmb_max: (R-B) Maximum coefficient
+ * @coef_gmr_min: (G-R) Minimum coefficient
+ * @coef_gmr_max: (G-R) Maximum coefficient
+ * @coef_gmb_min: (G-B) Minimum coefficient
+ * @coef_gmb_max: (G-B) Maximum coefficient
+ * @coef_bmr_min: (B-R) Minimum coefficient
+ * @coef_bmr_max: (B-R) Maximum coefficient
+ * @coef_bmg_min: (B-G) Minimum coefficient
+ * @coef_bmg_max: (B-G) Maximum coefficient
+ * @dst_minval: Minimum value of output pixel. Range: [0..0xffff].
+ * @reserved: padding field
+ *
+ * The range, accuracy and restriction of each coefficient are:
+ *
+ * - Range: [-32768..32767]
+ * - Accuracy: 1/4096
+ * - Restriction: coef_xxx_min <= coef_xxx_max
+ */
+struct viif_l1_color_matrix_correction {
+	__s16 coef_rmg_min;
+	__s16 coef_rmg_max;
+	__s16 coef_rmb_min;
+	__s16 coef_rmb_max;
+	__s16 coef_gmr_min;
+	__s16 coef_gmr_max;
+	__s16 coef_gmb_min;
+	__s16 coef_gmb_max;
+	__s16 coef_bmr_min;
+	__s16 coef_bmr_max;
+	__s16 coef_bmg_min;
+	__s16 coef_bmg_max;
+	__u16 dst_minval;
+	__u16 reserved;
+};
+
+/**
+ * struct viif_l1_main_process_config - L1ISP parameter for main process
+ *
+ * @demosaic_mode: &enum viif_l1_demosaic_mode value. Sets demosaic mode.
+ * @damp_lsbsel: Clipping range of output pixel value to AWB adjustment
+ *               function. Range: [0..15].
+ * @colormat_enable: set 1 to enable color matrix correction, 0 to disable.
+ * @dst_maxval: Maximum value of output pixel. Range: [0..0xffffff].
+ *              Applicable to output of each process (digital amplifier,
+ *              demosaicing and color matrix correction) in L1ISP Main process.
+ * @colormat_param: see &struct viif_l1_color_matrix_correction
+ *
+ * L1ISP main process is composed of:
+ *  - demosaicing
+ *  - color matrix correction
+ */
+struct viif_l1_main_process_config {
+	__u32 demosaic_mode;
+	__u32 damp_lsbsel;
+	__u32 colormat_enable;
+	__u32 dst_maxval;
+	struct viif_l1_color_matrix_correction colormat_param;
+};
+
+/**
+ * enum viif_l1_awb_mag - L1ISP signal magnification before AWB adjustment
+ *
+ * @VIIF_L1_AWB_ONE_SECOND: x 1/2
+ * @VIIF_L1_AWB_X1: 1 times
+ * @VIIF_L1_AWB_X2: 2 times
+ * @VIIF_L1_AWB_X4: 4 times
+ */
+enum viif_l1_awb_mag {
+	VIIF_L1_AWB_ONE_SECOND = 0,
+	VIIF_L1_AWB_X1 = 1,
+	VIIF_L1_AWB_X2 = 2,
+	VIIF_L1_AWB_X4 = 3,
+};
+
+/**
+ * enum viif_l1_awb_area_mode - L1ISP AWB detection target area
+ *
+ * @VIIF_L1_AWB_AREA_MODE0: only center area
+ * @VIIF_L1_AWB_AREA_MODE1: center area when uv is in square gate
+ * @VIIF_L1_AWB_AREA_MODE2: all area except center area
+ * @VIIF_L1_AWB_AREA_MODE3: all area
+ */
+enum viif_l1_awb_area_mode {
+	VIIF_L1_AWB_AREA_MODE0 = 0,
+	VIIF_L1_AWB_AREA_MODE1 = 1,
+	VIIF_L1_AWB_AREA_MODE2 = 2,
+	VIIF_L1_AWB_AREA_MODE3 = 3,
+};
+
+/**
+ * enum viif_l1_awb_restart_cond - L1ISP AWB adjustment restart conditions
+ *
+ * @VIIF_L1_AWB_RESTART_NO: no restart
+ * @VIIF_L1_AWB_RESTART_128FRAME: restart after 128 frame
+ * @VIIF_L1_AWB_RESTART_64FRAME: restart after 64 frame
+ * @VIIF_L1_AWB_RESTART_32FRAME: restart after 32 frame
+ * @VIIF_L1_AWB_RESTART_16FRAME: restart after 16 frame
+ * @VIIF_L1_AWB_RESTART_8FRAME: restart after 8 frame
+ * @VIIF_L1_AWB_RESTART_4FRAME: restart after 4 frame
+ * @VIIF_L1_AWB_RESTART_2FRAME: restart after 2 frame
+ */
+enum viif_l1_awb_restart_cond {
+	VIIF_L1_AWB_RESTART_NO = 0,
+	VIIF_L1_AWB_RESTART_128FRAME = 1,
+	VIIF_L1_AWB_RESTART_64FRAME = 2,
+	VIIF_L1_AWB_RESTART_32FRAME = 3,
+	VIIF_L1_AWB_RESTART_16FRAME = 4,
+	VIIF_L1_AWB_RESTART_8FRAME = 5,
+	VIIF_L1_AWB_RESTART_4FRAME = 6,
+	VIIF_L1_AWB_RESTART_2FRAME = 7,
+};
+
+/**
+ * struct viif_l1_awb - L1ISP AWB adjustment parameters for
+ *                      &struct viif_l1_awb_config
+ *
+ * @awhb_ygate_sel: 1:Enable/0:Disable to fix Y value at YUV conversion
+ * @awhb_ygate_data: Y value when Y value is fixed. Range: [64, 128, 256, 512].
+ * @awhb_cgrange: &enum viif_l1_awb_mag value.
+ *                Signal output magnification ratio before AWB adjustment.
+ * @awhb_ygatesw: 1:Enable/0:Disable settings of luminance gate
+ * @awhb_hexsw: 1:Enable/0:Disable settings of hexa-gate
+ * @awhb_areamode: &enum viif_l1_awb_area_mode value.
+ *                 Final selection of accumulation area for detection target
+ *                 area.
+ * @awhb_area_hsize: Horizontal size per block in central area.
+ *                   Range: [1..(Input image width -8)/8].
+ * @awhb_area_vsize: Vertical size per block in central area.
+ *                   Range: [1..(Input image height -4)/8].
+ * @awhb_area_hofs: Horizontal offset of block [0] in central area.
+ *                  Range: [0..(Input image width -9)].
+ * @awhb_area_vofs: Vertical offset of block [0] in central area.
+ *                  Range: [0..(Input image height -5)].
+ * @awhb_area_maskh: Setting 1:Enable/0:Disable of accumulated selection.
+ *                   Each bit corresponds to the following:
+ *                   [31:0] = {
+ *                   (7, 3),(6, 3),(5, 3),(4, 3),(3, 3),(2, 3),(1, 3),(0, 3),
+ *                   (7, 2),(6, 2),(5, 2),(4, 2),(3, 2),(2, 2),(1, 2),(0, 2),
+ *                   (7, 1),(6, 1),(5, 1),(4, 1),(3, 1),(2, 1),(1, 1),(0, 1),
+ *                   (7, 0),(6, 0),(5, 0),(4, 0),(3, 0),(2, 0),(1, 0),(0, 0)}
+ * @awhb_area_maskl: Setting 1:Enable/0:Disable of accumulated selection.
+ *                   Each bit corresponds to the following:
+ *                   [31:0] = {
+ *                   (7, 7),(6, 7),(5, 7),(4, 7),(3, 7),(2, 7),(1, 7),(0, 7),
+ *                   (7, 6),(6, 6),(5, 6),(4, 6),(3, 6),(2, 6),(1, 6),(0, 6),
+ *                   (7, 5),(6, 5),(5, 5),(4, 5),(3, 5),(2, 5),(1, 5),(0, 5),
+ *                   (7, 4),(6, 4),(5, 4),(4, 4),(3, 4),(2, 4),(1, 4),(0, 4)}
+ * @awhb_sq_sw: 1:Enable/0:Disable each square gate
+ * @awhb_sq_pol: 1:Enable/0:Disable to add accumulated gate for each square gate
+ * @awhb_bycut0p: U upper end value. Range: [0..127].
+ * @awhb_bycut0n: U lower end value. Range: [0..127].
+ * @awhb_rycut0p: V upper end value. Range: [0..127].
+ * @awhb_rycut0n: V lower end value. Range: [0..127].
+ * @awhb_rbcut0h: V-axis intercept upper end. Range: [-127..127].
+ * @awhb_rbcut0l: V-axis intercept lower end. Range: [-127..127].
+ * @awhb_bycut_h: U direction center value of each square gate.
+ *                Range: [-127..127].
+ * @awhb_bycut_l: U direction width of each square gate. Range: [0..127].
+ * @awhb_rycut_h: V direction center value of each square gate.
+ *                Range: [-127..127].
+ * @awhb_rycut_l: V direction width of each square gate. Range: [0..127].
+ * @awhb_awbsftu: U gain offset. Range: [-127..127].
+ * @awhb_awbsftv: V gain offset. Range: [-127..127].
+ * @awhb_awbhuecor: 1:Enable/0:Disable setting of color correlation retention
+ *                  function
+ * @awhb_awbspd: UV convergence speed multiplier. Range: [0..15].
+ *               Set 0 to stop convergence process.
+ * @awhb_awbulv: U convergence point level. Range: [0..31].
+ * @awhb_awbvlv: V convergence point level. Range: [0..31].
+ * @awhb_awbondot: Accumulation operation stop pixel count threshold.
+ *                 Range: [0..1023].
+ * @awhb_awbfztim: &enum viif_l1_awb_restart_cond value. Condition to restart
+ *                 AWB process.
+ * @awhb_wbgrmax: B gain adjustment range (Width from center to upper limit).
+ *                Range: [0..255], Accuracy: 1/64.
+ * @awhb_wbgbmax: R gain adjustment range (Width from center to upper limit).
+ *                Range: [0..255], Accuracy: 1/64.
+ * @awhb_wbgrmin: B gain adjustment range (Width from center to lower limit).
+ *                Range: [0..255], Accuracy: 1/64.
+ * @awhb_wbgbmin: R gain adjustment range (Width from center to lower limit).
+ *                Range: [0..255], Accuracy: 1/64.
+ * @awhb_ygateh: Luminance gate maximum value. Range: [0..255].
+ * @awhb_ygatel: Luminance gate minimum value. Range: [0..255].
+ * @awhb_awbwait: Number of restart frames after UV convergence freeze.
+ *                Range: [0..255].
+ * @reserved: padding field
+ */
+struct viif_l1_awb {
+	__u32 awhb_ygate_sel;
+	__u32 awhb_ygate_data;
+	__u32 awhb_cgrange;
+	__u32 awhb_ygatesw;
+	__u32 awhb_hexsw;
+	__u32 awhb_areamode;
+	__u32 awhb_area_hsize;
+	__u32 awhb_area_vsize;
+	__u32 awhb_area_hofs;
+	__u32 awhb_area_vofs;
+	__u32 awhb_area_maskh;
+	__u32 awhb_area_maskl;
+	__u32 awhb_sq_sw[3];
+	__u32 awhb_sq_pol[3];
+	__u32 awhb_bycut0p;
+	__u32 awhb_bycut0n;
+	__u32 awhb_rycut0p;
+	__u32 awhb_rycut0n;
+	__s32 awhb_rbcut0h;
+	__s32 awhb_rbcut0l;
+	__s32 awhb_bycut_h[3];
+	__u32 awhb_bycut_l[3];
+	__s32 awhb_rycut_h[3];
+	__u32 awhb_rycut_l[3];
+	__s32 awhb_awbsftu;
+	__s32 awhb_awbsftv;
+	__u32 awhb_awbhuecor;
+	__u32 awhb_awbspd;
+	__u32 awhb_awbulv;
+	__u32 awhb_awbvlv;
+	__u32 awhb_awbondot;
+	__u32 awhb_awbfztim;
+	__u8 awhb_wbgrmax;
+	__u8 awhb_wbgbmax;
+	__u8 awhb_wbgrmin;
+	__u8 awhb_wbgbmin;
+	__u8 awhb_ygateh;
+	__u8 awhb_ygatel;
+	__u8 awhb_awbwait;
+	__u8 reserved;
+};
+
+/**
+ * struct viif_l1_awb_config - L1ISP parameter for automatic white balance
+ *
+ * @enable: set 1 to enable AWB , 0 to disable
+ * @awhb_wbmrg: White balance adjustment R gain. Range: [64..1023],
+ *              Accuracy: 1/256.
+ * @awhb_wbmgg: White balance adjustment G gain. Range: [64..1023],
+ *              Accuracy: 1/256.
+ * @awhb_wbmbg: White balance adjustment B gain. Range: [64..1023],
+ *              Accuracy: 1/256.
+ * @param: a &struct viif_l1_awb instance
+ */
+struct viif_l1_awb_config {
+	__u32 enable;
+	__u32 awhb_wbmrg;
+	__u32 awhb_wbmgg;
+	__u32 awhb_wbmbg;
+	struct viif_l1_awb param;
+};
+
+/**
+ * enum viif_l1_hdrc_tone_type - L1ISP HDRC tone type
+ *
+ * @VIIF_L1_HDRC_TONE_USER: User Tone
+ * @VIIF_L1_HDRC_TONE_PRESET: Preset Tone
+ */
+enum viif_l1_hdrc_tone_type {
+	VIIF_L1_HDRC_TONE_USER = 0,
+	VIIF_L1_HDRC_TONE_PRESET = 1,
+};
+
+/**
+ * struct viif_l1_hdrc - L1ISP HDRC parameters for &struct viif_l1_hdrc_config
+ *
+ * @hdrc_ratio: Data width of input image. Range: [10..24] bits.
+ * @hdrc_pt_ratio: Preset Tone curve slope. Range: [0..13].
+ * @hdrc_pt_blend: Preset Tone0 curve blend ratio. Range: [0..256],
+ *                 Accuracy: 1/256.
+ * @hdrc_pt_blend2: Preset Tone2 curve blend ratio. Range: [0..256],
+ *                  Accuracy: 1/256.
+ * @hdrc_tn_type: &enum viif_l1_hdrc_tone_type value. L1ISP HDRC tone type.
+ * @hdrc_utn_tbl: HDRC value of User Tone curve. Range: [0..0xffff].
+ * @hdrc_flr_val: Constant flare value. Range: [0..0xffffff].
+ * @hdrc_flr_adp: set 1 to enable dynamic flare measurement, 0 to disable.
+ * @hdrc_ybr_off: set 1 to turn OFF bilateral luminance filter, 0 to turn ON.
+ * @hdrc_orgy_blend: Blend settings of luminance correction data after HDRC and
+ *                   data before luminance correction. Range: [0..16]
+ *                   (0:Luminance correction 100%, 8:Luminance correction 50%,
+ *                   16:Luminance correction 0%).
+ * @hdrc_pt_sat: Preset Tone saturation value. Range: [0..0xffff].
+ * @reserved: padding field
+ *
+ * Restrictions for parameters
+ *
+ * - hdrc_pt_blend + hdrc_pt_blend2 <= 256
+ * - input_image_height % 64 != {18, 20, 22, 24, 26}
+ *
+ *   - only when dynamic flare control is enabled
+ *   - note that the driver will not return error if this condition is not
+ *     satisfied.
+ *
+ * - hdrc_utn_tbl[N] <= hdrc_utn_tbl[N+1]
+ *
+ *   - note that the driver will not return error if this condition is not
+ *     satisfied.
+ */
+struct viif_l1_hdrc {
+	__u32 hdrc_ratio;
+	__u32 hdrc_pt_ratio;
+	__u32 hdrc_pt_blend;
+	__u32 hdrc_pt_blend2;
+	__u32 hdrc_tn_type;
+	__u16 hdrc_utn_tbl[20];
+	__u32 hdrc_flr_val;
+	__u32 hdrc_flr_adp;
+	__u32 hdrc_ybr_off;
+	__u32 hdrc_orgy_blend;
+	__u16 hdrc_pt_sat;
+	__u16 reserved;
+};
+
+/**
+ * struct viif_l1_hdrc_config - L1ISP parameter for HDR compression
+ *
+ * @enable: set 1 to enable HDR compression, 0 to disable
+ * @hdrc_thr_sft_amt: Amount of right shift in through mode (HDRC disabled).
+ *                    Range: [0..8]. This should be 0 if HDRC is enabled
+ * @param: HDR compression parameter; see &struct viif_l1_hdrc
+ */
+struct viif_l1_hdrc_config {
+	__u32 enable;
+	__u32 hdrc_thr_sft_amt;
+	struct viif_l1_hdrc param;
+};
+
+/**
+ * struct viif_l1_hdrc_ltm_config - L1ISP parameter for HDR compression local
+ *                                  tone mapping
+ *
+ * @tnp_max: Tone blend rate maximum value of LTM function. Range: [0..4194303],
+ *           Accuracy: 1/64. Set 0 to turn off LTM function.
+ * @tnp_mag: Intensity adjustment of LTM function. Range: [0..16383],
+ *           Accuracy: 1/64.
+ * @tnp_fil: Smoothing filter coefficient. Range: [0..255].
+ * @reserved: padding field
+ *
+ * Restriction: (tmp_fil[1] + tnp_fil[2] + tnp_fil[3] + tnp_fil[4]) * 2 + tnp_fil[0] = 1024
+ */
+struct viif_l1_hdrc_ltm_config {
+	__u32 tnp_max;
+	__u32 tnp_mag;
+	__u8 tnp_fil[5];
+	__u8 reserved[3];
+};
+
+/**
+ * struct viif_l1_gamma - L1ISP gamma correction parameters for
+ *                        &struct viif_l1_gamma_config
+ *
+ * @gam_p: Luminance value after gamma correction. Range: [0..8191].
+ * @blkadj: Black level adjustment value after gamma correction.
+ *          Range: [0..65535].
+ * @reserved: padding field
+ */
+struct viif_l1_gamma {
+	__u16 gam_p[44];
+	__u16 blkadj;
+	__u16 reserved;
+};
+
+/**
+ * struct viif_l1_gamma_config - L1ISP parameter for gamma correction
+ *
+ * @enable: set 1 to enable gamma correction at L1ISP, 0 to disable.
+ * @param: see &struct viif_l1_gamma.
+ */
+struct viif_l1_gamma_config {
+	__u32 enable;
+	struct viif_l1_gamma param;
+};
+
+/**
+ * struct viif_l1_nonlinear_contrast -  L1ISP VPRO non-linear contrast
+ * parameters for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @blk_knee: Black side peak luminance value. Range: [0..0xffff].
+ * @wht_knee: White side peak luminance value. Range: [0..0xffff].
+ * @blk_cont: Black side slope
+ * @wht_cont: White side slope
+ * @reserved: padding field
+ *
+ * Range, Accuracy and Index for {blk,wht}_cont is:
+ *
+ * - Range: [0..255]
+ * - Accuracy: 1/256
+ *
+ * - Index
+ *
+ *   - 0: the value at AG minimum
+ *   - 1: the value at AG less than 128
+ *   - 2: the value at AG equal to or more than 128
+ */
+struct viif_l1_nonlinear_contrast {
+	__u16 blk_knee;
+	__u16 wht_knee;
+	__u8 blk_cont[3];
+	__u8 wht_cont[3];
+	__u8 reserved[2];
+};
+
+/**
+ * struct viif_l1_lum_noise_reduction -  L1ISP VPRO luminance noise reduction
+ * parameters for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @gain_min: Minimum value of extracted noise gain. Range: [0..0xffff],
+ *            Accuracy: 1/256
+ * @gain_max: Maximum value of extracted noise gain. Range: [0..0xffff],
+ *            Accuracy: 1/256
+ * @lim_min: Minimum value of extracted noise limit. Range: [0..0xffff]
+ * @lim_max: Maximum value of extracted noise limit. Range: [0..0xffff]
+ *
+ * Constraint: "gain_min <= gain_max" and "lim_min <= lim_max"
+ *
+ */
+struct viif_l1_lum_noise_reduction {
+	__u16 gain_min;
+	__u16 gain_max;
+	__u16 lim_min;
+	__u16 lim_max;
+};
+
+/**
+ * struct viif_l1_edge_enhancement -  L1ISP VPRO edge enhancement parameters
+ * for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @gain_min: Extracted edge gain minimum value. Range: [0..0xffff],
+ *            Accuracy: 1/256
+ * @gain_max: Extracted edge gain maximum value. Range: [0..0xffff],
+ *            Accuracy: 1/256
+ * @lim_min: Extracted edge limit minimum value. Range: [0..0xffff]
+ * @lim_max: Extracted edge limit maximum value. Range: [0..0xffff]
+ * @coring_min: Extracted edge coring threshold minimum value.
+ *              Range: [0..0xffff]
+ * @coring_max: Extracted edge coring threshold maximum value.
+ *              Range: [0..0xffff]
+ *
+ * Constraint: "gain_min <= gain_max" and "lim_min <= lim_max" and
+ * "coring_min <= coring_max"
+ */
+struct viif_l1_edge_enhancement {
+	__u16 gain_min;
+	__u16 gain_max;
+	__u16 lim_min;
+	__u16 lim_max;
+	__u16 coring_min;
+	__u16 coring_max;
+};
+
+/**
+ * struct viif_l1_uv_suppression -  L1ISP VPRO UV suppression parameters
+ * for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @bk_mp: Black side slope. Range: [0..0x3fff], Accuracy: 1/16384
+ * @black: Minimum black side gain. Range: [0..0x3fff], Accuracy: 1/16384
+ * @wh_mp: White side slope. Range: [0..0x3fff], Accuracy: 1/16384
+ * @white: Minimum white side gain. Range: [0..0x3fff], Accuracy: 1/16384
+ * @bk_slv: Black side intercept. Range: [0..0xffff]
+ * @wh_slv: White side intercept. Range: [0..0xffff]
+ *
+ * Constraint: bk_slb < wh_slv
+ */
+struct viif_l1_uv_suppression {
+	__u32 bk_mp;
+	__u32 black;
+	__u32 wh_mp;
+	__u32 white;
+	__u16 bk_slv;
+	__u16 wh_slv;
+};
+
+/**
+ * struct viif_l1_coring_suppression -  L1ISP VPRO coring suppression parameters
+ * for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @lv_min: Minimum coring threshold. Range: [0..0xffff]
+ * @lv_max: Maximum coring threshold. Range: [0..0xffff]
+ * @gain_min: Minimum gain. Range: [0..0xffff], Accuracy: 1/65536
+ * @gain_max: Maximum gain. Range: [0..0xffff], Accuracy: 1/65536
+ *
+ * Constraint: "lv_min <= lv_max" and "gain_min <= gain_max"
+ */
+struct viif_l1_coring_suppression {
+	__u16 lv_min;
+	__u16 lv_max;
+	__u16 gain_min;
+	__u16 gain_max;
+};
+
+/**
+ * struct viif_l1_edge_suppression -  L1ISP VPRO edge suppression parameters
+ * for &struct viif_l1_img_quality_adjustment_config
+ *
+ * @gain: Gain of edge color suppression. Range: [0..0xffff], Accuracy: 1/256
+ * @lim: Limiter threshold of edge color suppression. Range: [0..15]
+ */
+struct viif_l1_edge_suppression {
+	__u16 gain;
+	__u16 lim;
+};
+
+/**
+ * struct viif_l1_color_level -  L1ISP VPRO color level parameters for
+ * &struct viif_l1_img_quality_adjustment_config
+ *
+ * @cb_gain: U component gain
+ * @cr_gain: V component gain
+ * @cbr_mgain_min: UV component gain
+ * @cbp_gain_max: Positive U component gain
+ * @cbm_gain_max: Negative V component gain
+ * @crp_gain_max: Positive U component gain
+ * @crm_gain_max: Negative V component gain
+ *
+ * Range and Accuracy of parameters are:
+ *
+ * - Range: [0..0xfff]
+ * - Accuracy: 1/2048
+ */
+struct viif_l1_color_level {
+	__u32 cb_gain;
+	__u32 cr_gain;
+	__u32 cbr_mgain_min;
+	__u32 cbp_gain_max;
+	__u32 cbm_gain_max;
+	__u32 crp_gain_max;
+	__u32 crm_gain_max;
+};
+
+/* MASKs for viif_l1_img_quality_adjustment_config::enable */
+#define VIIF_L1_IQA_NONLINEAR_CONTRAST_EN_MASK	  BIT(0)
+#define VIIF_L1_IQA_LUM_NOISE_REDUCTION_EN_MASK	  BIT(1)
+#define VIIF_L1_IQA_EDGE_ENHANCEMENT_EN_MASK	  BIT(2)
+#define VIIF_L1_IQA_UV_SUPPRESSION_EN_MASK	  BIT(3)
+#define VIIF_L1_IQA_CORING_SUPPRESSION_EN_MASK	  BIT(4)
+#define VIIF_L1_IQA_EDGE_SUPPRESSION_EN_MASK	  BIT(5)
+#define VIIF_L1_IQA_COLOR_LEVEL_EN_MASK		  BIT(6)
+#define VIIF_L1_IQA_COLOR_NOISE_REDUCTION_EN_MASK BIT(7)
+
+/**
+ * struct viif_l1_img_quality_adjustment_config -  L1ISP parameter
+ * for image quality adjustment (VPRO)
+ *
+ * @enable: bit vector; set 1 to enable each function, 0 to disable.
+ *
+ *  - bit[0]: nonlinear contrast
+ *  - bit[1]: luminance noise reduction
+ *  - bit[2]: edge enhancement
+ *  - bit[3]: uv suppression
+ *  - bit[4]: coring suppression
+ *  - bit[5]: edge suppression
+ *  - bit[6]: color level
+ *  - bit[7]: color noise reduction
+ *
+ * @nonlinear_contrast: controlled by bit0 of enable. see
+ *                      &struct viif_l1_nonlinear_contrast
+ * @lum_noise_reduction: controlled by bit1 of enable. see
+ *                       &struct viif_l1_lum_noise_reduction
+ * @edge_enhancement: controlled by bit2 of enable. see
+ *                    &struct viif_l1_edge_enhancement
+ * @uv_suppression: controlled by bit3 of enable. see
+ *                  &struct viif_l1_uv_suppression
+ * @coring_suppression: controlled by bit4 of enable. see
+ *                      &struct viif_l1_coring_suppression
+ * @edge_suppression: controlled by bit5 of enable. see
+ *                    &struct viif_l1_edge_suppression
+ * @color_level: controlled by bit6 of enable. see
+ *               &struct viif_l1_color_level
+ * @coef_cb: Cb coefficient used in RGB to YUV conversion. Range: [0..0xffff],
+ *           Accuracy: 1/65536
+ * @coef_cr: Cr coefficient used in RGB to YUV conversion. Range: [0..0xffff],
+ *           Accuracy: 1/65536
+ * @brightness: Brightness adjustment value. Range: [-32768..32767]. Set 0 to
+ *              turn off
+ * @linear_contrast: Linear contrast adjustment value. Range: [0..0xff],
+ *                   Accuracy: 1/128. Set 128 to turn off
+ * @reserved: padding field
+ *
+ * The VPRO feature provides following functions:
+ *  - luminance adjustment:
+ *     - brightness adjustment
+ *     - linear contrast adjustment
+ *     - nonlinear contrast adjustment
+ *     - luminance noise reduction
+ *     - edge enhancement
+ *  - chroma adjustment:
+ *     - chroma suppression
+ *     - color level adjustment
+ *     - chroma noise reduction
+ *     - coring suppression
+ *     - edge chroma suppression
+ *     - color noise reduction
+ */
+struct viif_l1_img_quality_adjustment_config {
+	__u32 enable;
+	struct viif_l1_nonlinear_contrast nonlinear_contrast;
+	struct viif_l1_lum_noise_reduction lum_noise_reduction;
+	struct viif_l1_edge_enhancement edge_enhancement;
+	struct viif_l1_uv_suppression uv_suppression;
+	struct viif_l1_coring_suppression coring_suppression;
+	struct viif_l1_edge_suppression edge_suppression;
+	struct viif_l1_color_level color_level;
+	__u16 coef_cb;
+	__u16 coef_cr;
+	__s16 brightness;
+	__u8 linear_contrast;
+	__u8 reserved;
+};
+
+/**
+ * struct viif_l1_avg_lum_generation_config - L1ISP parameter for calculating
+ *                                            average luminance
+ *
+ * @enable: set 1 to enable aggregation of AVG LUM, 0 to disable
+ * @aexp_start_x: horizontal position of block 0.
+ *                Range: [0.."width of input image - 1"]
+ * @aexp_start_y: vertical position of block 0.
+ *                Range: [0.."height of input image - 1"]
+ * @aexp_block_width: width of one block. Range: [64.."width of input image"].
+ *                    Value should be multiple of 64
+ * @aexp_block_height: height of one block. Range: [64.."height of input image"]
+ *                     Value should be multiple of 64
+ * @aexp_weight: weight of each block. Range: [0..3].
+ *               Nested indices are: [y position][x position].
+ * @aexp_satur_ratio: threshold to judge whether saturated block or not.
+ *                    Range: [0..256]
+ * @aexp_black_ratio: threshold to judge whether black block or not.
+ *                    Range: [0..256]
+ * @aexp_satur_level: threshold to judge whether saturated pixel or not.
+ *                    Range: [0x0..0xffffff]
+ * @aexp_ave4linesy: vertical position of the initial line for 4-lines average
+ *                   luminance. Range: [0.."height of input image - 4"]
+ */
+struct viif_l1_avg_lum_generation_config {
+	__u32 enable;
+	__u32 aexp_start_x;
+	__u32 aexp_start_y;
+	__u32 aexp_block_width;
+	__u32 aexp_block_height;
+	__u32 aexp_weight[8][8];
+	__u32 aexp_satur_ratio;
+	__u32 aexp_black_ratio;
+	__u32 aexp_satur_level;
+	__u32 aexp_ave4linesy[4];
+};
+
+/**
+ * enum viif_l2_undist_mode - L2ISP undistortion mode
+ *
+ * @VIIF_L2_UNDIST_POLY: polynomial mode
+ * @VIIF_L2_UNDIST_GRID: grid table mode
+ * @VIIF_L2_UNDIST_POLY_TO_GRID: polynomial, then grid table mode
+ * @VIIF_L2_UNDIST_GRID_TO_POLY: grid table, then polynomial mode
+ */
+enum viif_l2_undist_mode {
+	VIIF_L2_UNDIST_POLY = 0,
+	VIIF_L2_UNDIST_GRID = 1,
+	VIIF_L2_UNDIST_POLY_TO_GRID = 2,
+	VIIF_L2_UNDIST_GRID_TO_POLY = 3,
+};
+
+/**
+ * struct viif_l2_undist - L2ISP UNDIST parameters for
+ *                         &struct viif_l2_undist_config
+ *
+ * @through_mode: 1:enable or 0:disable through mode of undistortion
+ * @roi_mode: &enum viif_l2_undist_mode value. Sets L2ISP undistortion mode.
+ * @sensor_crop_ofs_h: Horizontal start position of sensor crop area.
+ * @sensor_crop_ofs_v: Vertical start position of sensor crop area.
+ * @norm_scale: Normalization coefficient for distance from center
+ * @valid_r_norm2_poly: Setting target area for polynomial correction
+ * @valid_r_norm2_grid: Setting target area for grid table correction
+ * @roi_write_area_delta: Error adjustment value of forward function and
+ *                        inverse function for pixel position calculation
+ * @poly_write_g_coef: 10th-order polynomial coefficient for G write pixel
+ *                     position calculation
+ * @poly_read_b_coef: 10th-order polynomial coefficient for B read pixel
+ *                    position calculation
+ * @poly_read_g_coef: 10th-order polynomial coefficient for G read pixel
+ *                    position calculation
+ * @poly_read_r_coef: 10th-order polynomial coefficient for R read pixel
+ *                    position calculation
+ * @grid_node_num_h: Number of horizontal grids
+ * @grid_node_num_v: Number of vertical grids
+ * @grid_patch_hsize_inv: Inverse pixel size between horizontal grids
+ * @grid_patch_vsize_inv: Inverse pixel size between vertical grids
+ *
+ * Range and Accuracy of parameters are:
+ *
+ * - sensor_crop_ofs_{h,v}
+ *
+ *   - Range: [-4296..4296]
+ *   - Accuracy: 1/2
+ *
+ * - norm_scale
+ *
+ *   - Range: [0..1677721]
+ *   - Accuracy: 1/33554432
+ *
+ * - valid_r_norm2_{poly,grid}
+ *
+ *   - Range: [0..0x3ffffff]
+ *   - Accuracy: 1/33554432
+ *
+ * - roi_write_area_delta
+ *
+ *   - Range: [0..0x7ff]
+ *   - Accuracy: 1/1024
+ *
+ * - poly_write_g_coef, poly_read_{b,g,r}_coef
+ *
+ *   - Range: [-2147352576..2147352576]
+ *   - Accuracy: 1/131072
+ *
+ * - grid_node_num_{v.h}
+ *
+ *   - Range: [16..64]
+ *
+ * - grid_patch_{hsize,vsize}_inv
+ *
+ *   - Range: [0..0x7fffff]
+ *   - Accuracy: 1/8388608
+ */
+struct viif_l2_undist {
+	__u32 through_mode;
+	__u32 roi_mode[2];
+	__s32 sensor_crop_ofs_h;
+	__s32 sensor_crop_ofs_v;
+	__u32 norm_scale;
+	__u32 valid_r_norm2_poly;
+	__u32 valid_r_norm2_grid;
+	__u32 roi_write_area_delta[2];
+	__s32 poly_write_g_coef[11];
+	__s32 poly_read_b_coef[11];
+	__s32 poly_read_g_coef[11];
+	__s32 poly_read_r_coef[11];
+	__u32 grid_node_num_h;
+	__u32 grid_node_num_v;
+	__u32 grid_patch_hsize_inv;
+	__u32 grid_patch_vsize_inv;
+};
+
+/**
+ * struct viif_l2_undist_config - L2ISP parameter for undistortion
+ *
+ * @param: &struct viif_l2_undist
+ * @write_g: write-G grid table.
+ * @read_b: read-B grid table.
+ * @read_g: read-G grid table.
+ * @read_r: read-R grid table.
+ * @size: Table size in bytes. Range: [1024..8192] or 0.
+ *        The value should be "grid_node_num_h * grid_node_num_v * 4".
+ *        See also &struct viif_l2_undist.
+ *
+ * The tables are referred when param.roi_mode[] is either of
+ * VIIF_L2_UNDIST_GRID, VIIF_L2_UNDIST_POLY_TO_GRID or
+ * VIIF_L2_UNDIST_GRID_TO_POLY.
+ * Application should make sure that the table data is based on HW specification
+ * since this driver does not check the contents of specified grid table.
+ */
+struct viif_l2_undist_config {
+	struct viif_l2_undist param;
+	__u8 write_g[8192];
+	__u8 read_b[8192];
+	__u8 read_g[8192];
+	__u8 read_r[8192];
+	__u32 size;
+};
+
+/**
+ * struct viif_l2_roi_config - L2ISP parameter for specifying ROI
+ *
+ * @roi_num: 1 when only capture path0 is activated,
+ *           2 when both capture path 0 and path 1 are activated.
+ * @roi_scale: Scale value for each ROI. Range: [32768..131072],
+ *             Accuracy: 1/65536
+ * @roi_scale_inv: Inverse scale value for each ROI. Range: [32768..131072],
+ *                 Accuracy: 1/65536
+ * @corrected_wo_scale_hsize: Corrected image width for each ROI.
+ *                            Range: [128..8190]
+ * @corrected_wo_scale_vsize: Corrected image height for each ROI.
+ *                            Range: [128..4094]
+ * @corrected_hsize: Corrected and scaled image width for each ROI.
+ *                   Range: [128..8190]
+ * @corrected_vsize: Corrected and scaled image height for each ROI.
+ *                   Range: [128..4094]
+ */
+struct viif_l2_roi_config {
+	__u32 roi_num;
+	__u32 roi_scale[2];
+	__u32 roi_scale_inv[2];
+	__u32 corrected_wo_scale_hsize[2];
+	__u32 corrected_wo_scale_vsize[2];
+	__u32 corrected_hsize[2];
+	__u32 corrected_vsize[2];
+};
+
+/**
+ * struct viif_l2_crop_config - L2ISP parameter for specifying crop rectangle
+ *
+ * @left: the left coordinate of the crop rectangle
+ * @top: the top coordinate of the crop rectangle
+ */
+struct viif_l2_crop_config {
+	__u32 left;
+	__u32 top;
+};
+
+/** enum viif_gamma_mode - Gamma correction mode
+ *
+ * @VIIF_GAMMA_COMPRESSED: compressed table mode
+ * @VIIF_GAMMA_LINEAR: linear table mode
+ */
+enum viif_gamma_mode {
+	VIIF_GAMMA_COMPRESSED = 0,
+	VIIF_GAMMA_LINEAR = 1,
+};
+
+/**
+ * struct viif_l2_gamma_config - L2ISP parameter for gamma correction
+ *
+ * @table_en: 6bit vector to enable gamma table; all 0 to disable gamma
+ *            correction
+ * @vsplit: Line switching position of first table and second table.
+ *          Range: [0..4094]. The value should be 0 on disable.
+ * @mode: &enum viif_gamma_mode value. The value should be
+ *        VIIF_GAMMA_COMPRESSED on disable.
+ * @table:
+ *   gamma table for L2ISP gamma; 6 channels, each has __u16 typed 512 bytes.
+ *   [0]: G/Y(1st table), [1]: G/Y(2nd table), [2]: B/U(1st table)
+ *   [3]: B/U(2nd table), [4]: R/V(1st table), [5]: R/V(2nd table)
+ */
+struct viif_l2_gamma_config {
+	__u32 table_en;
+	__u32 vsplit;
+	__u32 mode;
+	__u16 table[6][256];
+};
+
+/**
+ * struct viif_l1_info - L1ISP status of automatic white balance and average
+ *                       luminance
+ *
+ * @avg_lum_weight: weighted average luminance value at average luminance
+ *                  generation
+ * @avg_lum_block: average luminance of each block.
+ *                 Nested indices are: [y position][x position].
+ * @avg_lum_four_line_lum: 4-lines average luminance. avg_lum_four_line_lum[n]
+ *                         corresponds to aexp_ave4linesy[n]
+ * @avg_satur_pixnum: the number of saturated pixel at average luminance
+ *                    generation
+ * @avg_black_pixnum: the number of black pixel at average luminance generation
+ * @awb_ave_u: U average value of AWB adjustment
+ * @awb_ave_v: V average value of AWB adjustment
+ * @awb_accumulated_pixel: Accumulated pixel count of AWB adjustment
+ * @awb_gain_r: R gain used in the next frame of AWB adjustment
+ * @awb_gain_g: G gain used in the next frame of AWB adjustment
+ * @awb_gain_b: B gain used in the next frame of AWB adjustment
+ * @awb_status_u: boolean value of U convergence state of AWB adjustment
+ *                (0: not-converged, 1: converged)
+ * @awb_status_v: boolean value of V convergence state of AWB adjustment
+ *                (0: not-converged, 1: converged)
+ * @reserved: padding field
+ */
+struct viif_l1_info {
+	__u32 avg_lum_weight;
+	__u32 avg_lum_block[8][8];
+	__u32 avg_lum_four_line_lum[4];
+	__u32 avg_satur_pixnum;
+	__u32 avg_black_pixnum;
+	__u32 awb_ave_u;
+	__u32 awb_ave_v;
+	__u32 awb_accumulated_pixel;
+	__u32 awb_gain_r;
+	__u32 awb_gain_g;
+	__u32 awb_gain_b;
+	__u8 awb_status_u;
+	__u8 awb_status_v;
+	__u8 reserved[2];
+};
+
+/**
+ * struct viif_isp_capture_status - L1ISP status of automatic white balance and
+ *                                  average luminance
+ *
+ * @l1_info: L1ISP AWB information. Refer to &struct viif_l1_info
+ */
+struct viif_isp_capture_status {
+	struct viif_l1_info l1_info;
+};
+
+/*==========Definitions for Param-buffer based I/F ============*/
+#define VISCONTI_VIIF_CFG_ISP_L1_INPUT_MODE		   (1U << 0)
+#define VISCONTI_VIIF_CFG_ISP_L1_RGB_TO_Y_COEF		   (1U << 1)
+#define VISCONTI_VIIF_CFG_ISP_L1_AG_MODE		   (1U << 2)
+#define VISCONTI_VIIF_CFG_ISP_L1_AG			   (1U << 3)
+#define VISCONTI_VIIF_CFG_ISP_L1_HDRE			   (1U << 4)
+#define VISCONTI_VIIF_CFG_ISP_L1_IMG_EXTRACTION		   (1U << 5)
+#define VISCONTI_VIIF_CFG_ISP_L1_DPC			   (1U << 6)
+#define VISCONTI_VIIF_CFG_ISP_L1_PRESET_WHITE_BALANCE	   (1U << 7)
+#define VISCONTI_VIIF_CFG_ISP_L1_RAW_COLOR_NOISE_REDUCTION (1U << 8)
+#define VISCONTI_VIIF_CFG_ISP_L1_HDRS			   (1U << 9)
+#define VISCONTI_VIIF_CFG_ISP_L1_BLACK_LEVEL_CORRECTION	   (1U << 10)
+#define VISCONTI_VIIF_CFG_ISP_L1_LSC			   (1U << 11)
+#define VISCONTI_VIIF_CFG_ISP_L1_MAIN_PROCESS		   (1U << 12)
+#define VISCONTI_VIIF_CFG_ISP_L1_AWB			   (1U << 13)
+#define VISCONTI_VIIF_CFG_ISP_L1_LOCK_AWB_GAIN		   (1U << 14)
+#define VISCONTI_VIIF_CFG_ISP_L1_HDRC			   (1U << 15)
+#define VISCONTI_VIIF_CFG_ISP_L1_HDRC_LTM		   (1U << 16)
+#define VISCONTI_VIIF_CFG_ISP_L1_GAMMA			   (1U << 17)
+#define VISCONTI_VIIF_CFG_ISP_L1_IMG_QUALITY_ADJUSTMENT	   (1U << 18)
+#define VISCONTI_VIIF_CFG_ISP_L1_AVG_LUM_GENERATION	   (1U << 19)
+#define VISCONTI_VIIF_CFG_ISP_L2_UNDIST			   (1U << 20)
+#define VISCONTI_VIIF_CFG_ISP_L2_ROI			   (1U << 21)
+#define VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST0		   (1U << 22)
+#define VISCONTI_VIIF_CFG_ISP_L2_GAMMA_POST1		   (1U << 23)
+#define VISCONTI_VIIF_CFG_ISP_L2_CROP_POST0		   (1U << 24)
+#define VISCONTI_VIIF_CFG_ISP_L2_CROP_POST1		   (1U << 25)
+
+#define VISCONTI_VIIF_STAT_L1_INFO (1U << 0)
+
+/**
+ * struct visconti_viif_isp_config - Visconti VIIF ISP parameters metadata
+ *
+ * @update_cfg: each bit specifies whether a feature should be updated
+ * @l1_input_mode: input format and preprocessing mode
+ * @l1_rgb_to_y_coef: coefficient to yield Y from RGB
+ * @l1_ag_mode: rules to derive algorithm gains for each feature
+ * @l1_ag: base algorithm gain
+ * @l1_hdre: parameter for HDR expansion
+ * @l1_img_extraction: parameter for image extraction
+ * @l1_dpc: parameter for defect pixel correction
+ * @l1_preset_white_balance: parameter for preset white balance
+ * @l1_raw_color_noise_reduction: parameter for raw color noise reduction
+ * @l1_hdrs: parameter for HDR synthesis
+ * @l1_black_level_correction: parameter for black level correction
+ * @l1_lsc: parameter for lens shading correction
+ * @l1_main_process: parameter for demosaicing and color matrix
+ * @l1_awb: parameter for automatic white balance
+ * @lock_awb_gain: 0 to run AWB, 1 to lock AWB gain
+ * @l1_hdrc: parameter for HDR compression
+ * @l1_hdrc_ltm: parameter for HDR compression local tone mapping
+ * @l1_gamma: parameter for L1ISP gamma correction
+ * @l1_img_quality_adjustment: parameter for image quality adjustment (VPRO)
+ * @l1_avg_lum_generation: parameter for calculating average luminance
+ * @l2_undist: parameter for undistortion
+ * @l2_roi: parameter for l2 ROI and scaling
+ * @l2_gamma_post0: parameter for L2ISP POST0 gamma correction
+ * @l2_gamma_post1: parameter for L2ISP POST1 gamma correction
+ * @l2_crop_post0: left and top coordinates for the POST0 cropping
+ * @l2_crop_post1: left and top coordinates for the POST1 cropping
+ */
+struct visconti_viif_isp_config {
+	__u32 update_cfg;
+
+	struct viif_l1_input_mode_config l1_input_mode;
+	struct viif_l1_rgb_to_y_coef_config l1_rgb_to_y_coef;
+	struct viif_l1_ag_mode_config l1_ag_mode;
+	struct viif_l1_ag_config l1_ag;
+	struct viif_l1_hdre_config l1_hdre;
+	struct viif_l1_img_extraction_config l1_img_extraction;
+	struct viif_l1_dpc_config l1_dpc;
+	struct viif_l1_preset_white_balance_config l1_preset_white_balance;
+	struct viif_l1_raw_color_noise_reduction_config
+		l1_raw_color_noise_reduction;
+	struct viif_l1_hdrs_config l1_hdrs;
+	struct viif_l1_black_level_correction_config l1_black_level_correction;
+	struct viif_l1_lsc_config l1_lsc;
+	struct viif_l1_main_process_config l1_main_process;
+	struct viif_l1_awb_config l1_awb;
+	__u32 lock_awb_gain;
+	struct viif_l1_hdrc_config l1_hdrc;
+	struct viif_l1_hdrc_ltm_config l1_hdrc_ltm;
+	struct viif_l1_gamma_config l1_gamma;
+	struct viif_l1_img_quality_adjustment_config l1_img_quality_adjustment;
+	struct viif_l1_avg_lum_generation_config l1_avg_lum_generation;
+	struct viif_l2_undist_config l2_undist;
+	struct viif_l2_roi_config l2_roi;
+	struct viif_l2_gamma_config l2_gamma_post0;
+	struct viif_l2_gamma_config l2_gamma_post1;
+	struct viif_l2_crop_config l2_crop_post0;
+	struct viif_l2_crop_config l2_crop_post1;
+};
+
+/**
+ * struct visconti_viif_isp_stat - Visconti VIIF ISP status metadata
+ *
+ * @stat_type: each bit specifies whether information is available
+ * @isp_capture: L1ISP status of whitebalance and average luminance
+ */
+struct visconti_viif_isp_stat {
+	__u32 stat_type;
+
+	struct viif_isp_capture_status isp_capture;
+};
+
+#endif /* __UAPI_VISCONTI_VIIF_H_ */

-- 
2.34.1



