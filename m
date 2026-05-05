Return-Path: <linux-media+bounces-60494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDmwN6dw+mngOwMAu9opvQ
	(envelope-from <linux-media+bounces-60494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:35:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 332684D4646
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DD7A307CDE0
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 22:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AAB2EB856;
	Tue,  5 May 2026 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XN/hdxfc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBCE199931
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020436; cv=none; b=NIFL04LMo01DWyyZ2VB6rkpFklKDYO75S9M69GQ4hbVF8Spw57azsTIQDbId2lro78TZYHrRSE8ZygT+tH1r5Ze6hyZhVWlpPpCu4RWztZKcRZqurxX+llTJJz4Tpj14T+2+5/oZZLlULREmtxarc0/Ke712J5q0hjUMh2EBSD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020436; c=relaxed/simple;
	bh=0ebdUVW8fqsP5/dbztgNMfsHC24ZvBGgyKo+0ZAlfkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZAdWRyraXuNCfvZOS2NTD5eOhOA2JhUOj1yIKSMCUjtY0+2uxzmVYuvU4sAz/AkSA3Gw4DMvdSJPp52uHxYlrKD2OCn2oTmGzpVLwU6mAHFO+AzMWJocbwvO2WGw+6a1uT0FL1XpvZnbycNXKU9IV5FA8r2JkpLDB2yNw3IjgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XN/hdxfc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778020433; x=1809556433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ebdUVW8fqsP5/dbztgNMfsHC24ZvBGgyKo+0ZAlfkg=;
  b=XN/hdxfc+41rXUkWn2W8zpfNoARAxLyBbglIKif6EbDT8YCW0RFRewIB
   C0qNVgHh0s2aGRMS8yHG/eLNtZ0B7qh1y2zE8jSS42QO0fXJcNZ5zBvrS
   37yyK3y/r+vvz+VH5G62QYOesAGTy7SY3JYbyy5GcLimlFuQlHeLN3JQb
   /o/iOYiuiT5aVhoXOBq8nU7LDwPdtRZUqV9Aed1Yucb3BJCLi4BYk2wEN
   tfteL0P4psAKM4AedLQLe5fTEORYiMGxRFWDLecMKhihMNFiT+7GRYF4E
   iIcP+w2OOr9LN+FRG0QmAjzPuorTdWaVqc8D//LLcdCguqXbbrxytfvS4
   A==;
X-CSE-ConnectionGUID: rQFfS7CVSEmXM0jAbjqDRQ==
X-CSE-MsgGUID: wT3zL6BuST6fzXI34gwO6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78843611"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78843611"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 15:33:50 -0700
X-CSE-ConnectionGUID: HrcBXc6OTZiv0OjTBr4cLw==
X-CSE-MsgGUID: qqC0x3r/TI6QhUtrxvyhIw==
X-ExtLoop1: 1
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 15:33:49 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH 1/2] media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS)
Date: Tue,  5 May 2026 15:30:04 -0700
Message-ID: <20260505223005.84162-2-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505223005.84162-1-miguel.vadillo@intel.com>
References: <20260505223005.84162-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 332684D4646
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60494-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,work.work:url]

Add driver for Intel Computer Vision Sensing (CVS) devices found on
Intel Luna Lake (LNL), Panther Lake (PTL), and Arrow Lake (ARL)
platforms.

The CVS device acts as a V4L2 sub-device bridge that manages CSI-2
link ownership between the host (Linux) and firmware for camera
sensors. It provides:

- Query the device status via sysfs interface
- CSI-2 link ownership arbitration between host and CVS firmware
- MIPI CSI-2 configuration management
- Privacy LED control coordination
- Power management integration with runtime PM

The driver consists of two main components:
  core.c: Core driver with probe, command transport, and power management
  v4l2.c: V4L2 sub-device and media framework integration

Hardware Interface:
- I2C for command/control communication with device firmware
- GPIO signals for ownership handshaking (request/response)
- Optional reset and wake interrupt for full-capability variants
- Integration with Intel IPU via ipu_bridge

The driver supports two hardware capability levels:
- Light capability: Basic GPIO-based ownership (2 GPIOs)
- Full capability: Enhanced with reset control and wake IRQ (4 GPIOs)

Device-specific quirks are handled via a quirk table to accommodate
variations across different CVS implementations (Lattice, Synaptics).

In addition to I2C-based operation, the driver supports platform
device instantiation for systems where CVS is exposed without I2C
transport, falling back to GPIO-only ownership control.

The CVS driver integrates with the IPU bridge for automatic device
discovery via ACPI on supported platforms.

PCI device IDs for Intel IPU7 (0x645d, shared by MTL and LNL) and
IPU7.5 (0xb05d, shared by ARL and PTL) are included in the
driver-local icvs_pci_tbl lookup table, enabling CVS to locate these
IPU variants without modifying the shared ipu6-pci-table header.

A PM runtime device link is established between IPU (consumer) and CVS
(supplier) so that the PM framework automatically resumes CVS before
IPU begins streaming, triggering cvs_runtime_resume() to claim CSI-2
link ownership. Ownership is released via cvs_runtime_suspend() after
the autosuspend delay.

Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>
---
 drivers/media/i2c/Kconfig      |   1 +
 drivers/media/i2c/Makefile     |   1 +
 drivers/media/i2c/cvs/Kconfig  |  21 +
 drivers/media/i2c/cvs/Makefile |   4 +
 drivers/media/i2c/cvs/core.c   | 984 +++++++++++++++++++++++++++++++++
 drivers/media/i2c/cvs/icvs.h   | 515 +++++++++++++++++
 drivers/media/i2c/cvs/v4l2.c   | 618 +++++++++++++++++++++
 7 files changed, 2144 insertions(+)
 create mode 100644 drivers/media/i2c/cvs/Kconfig
 create mode 100644 drivers/media/i2c/cvs/Makefile
 create mode 100644 drivers/media/i2c/cvs/core.c
 create mode 100644 drivers/media/i2c/cvs/icvs.h
 create mode 100644 drivers/media/i2c/cvs/v4l2.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87a..9f75b8d9584c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -820,6 +820,7 @@ config VIDEO_VGXY61
 
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
+source "drivers/media/i2c/cvs/Kconfig"
 
 endif
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index a3a6396df3c4..b4ca066db1dc 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -169,3 +169,4 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
diff --git a/drivers/media/i2c/cvs/Kconfig b/drivers/media/i2c/cvs/Kconfig
new file mode 100644
index 000000000000..5b71474aa136
--- /dev/null
+++ b/drivers/media/i2c/cvs/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_INTEL_CVS
+	tristate "Intel CVS CSI-2 bridge support"
+	depends on I2C && ACPI && VIDEO_DEV
+	depends on IPU_BRIDGE || !IPU_BRIDGE
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This adds support for the Intel Computer Vision Sensing (CVS).
+
+	  The driver registers a V4L2 sub-device to arbitrate sensor ownership,
+	  performs firmware download, applies per-VID/PID quirks, and configures
+	  the device and CSI-2 link.
+
+	  The driver can operate with full I2C transport or in a reduced
+	  platform (GPIO-only) mode when I2C is unavailable.
+
+	  Say Y to build into the kernel, or M to build as a module.
+	  The module will be named intel_cvs. If unsure, say N.
diff --git a/drivers/media/i2c/cvs/Makefile b/drivers/media/i2c/cvs/Makefile
new file mode 100644
index 000000000000..0aeb2c2e3100
--- /dev/null
+++ b/drivers/media/i2c/cvs/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+intel_cvs-y := core.o v4l2.o
+
+obj-$(CONFIG_VIDEO_INTEL_CVS) += intel_cvs.o
diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
new file mode 100644
index 000000000000..1b40683c994f
--- /dev/null
+++ b/drivers/media/i2c/cvs/core.c
@@ -0,0 +1,984 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/time64.h>
+#include <linux/workqueue.h>
+
+#include <media/ipu-bridge.h>
+
+#include "icvs.h"
+
+/* Command timeouts determined experimentally */
+#define CMD_TIMEOUT (5 * HZ)
+#define FW_READY_DELAY_MS 100
+
+static const struct acpi_gpio_params gpio_wake = { 0, 0, false };
+static const struct acpi_gpio_params gpio_rst  = { 1, 0, false };
+static const struct acpi_gpio_params gpio_req  = { 2, 0, false };
+static const struct acpi_gpio_params gpio_resp = { 3, 0, false };
+static const struct acpi_gpio_mapping icvs_acpi_gpios[] = {
+	{ "wake-gpio", &gpio_wake, 1 },
+	{ "rst-gpio",  &gpio_rst,  1 },
+	{ "req-gpio",  &gpio_req,  1 },
+	{ "resp-gpio", &gpio_resp, 1 },
+	{ }
+};
+
+static const struct acpi_gpio_params lgpio_req  = { 0, 0, false };
+static const struct acpi_gpio_params lgpio_resp = { 1, 0, false };
+static const struct acpi_gpio_mapping icvs_acpi_lgpios[] = {
+	{ "req-gpio",  &lgpio_req,  1 },
+	{ "resp-gpio", &lgpio_resp, 1 },
+	{ }
+};
+
+/* Device quirk table */
+static const struct icvs_device_quirk cvs_quirk_table[] = {
+	{ 0x2ac1, 0x20d0, ICVS_NO_MIPI_CONFIG |
+			  ICVS_NO_CAPS |
+			  ICVS_NO_FW_UPDATE
+	},	/* Lattice NX33 */
+	{ 0x06CB, 0x0701, ICVS_SKIP_FW_RESET |
+			  ICVS_HOST_SENSOR_PWR_CTRL |
+			  ICVS_HOST_PRIV_CTRL |
+			  ICVS_FW_BUF_SIZE_256 |
+			  ICVS_FW_HEADER_SIZE_256
+	},	/* Synaptics SVP7xxx */
+	{ }
+};
+
+/**
+ * cvs_set_quirks - Match device VID/PID and set quirks
+ * @ctx: CVS device context
+ * @vid: Vendor ID
+ * @pid: Product ID
+ *
+ * Searches the quirk table for a matching VID/PID and populates ctx->quirks
+ * with the corresponding quirk flags.
+ * If no match is found, quirks is set to 0.
+ */
+static void cvs_set_quirks(struct icvs *ctx, u16 vid, u16 pid)
+{
+	ctx->quirks = 0;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(cvs_quirk_table); i++) {
+		if (cvs_quirk_table[i].vid == vid &&
+		    cvs_quirk_table[i].pid == pid) {
+			ctx->quirks = cvs_quirk_table[i].quirks;
+			dev_info(cvs_dev(ctx),
+				"Quirks: 0x%lx (VID:0x%04x PID:0x%04x)\n",
+				ctx->quirks, vid, pid);
+			return;
+		}
+	}
+
+	dev_info(cvs_dev(ctx),
+		"No quirks for device (VID:0x%04x PID:0x%04x)\n", vid, pid);
+}
+
+/* I2C transport helpers */
+
+/**
+ * cvs_read_i2c - Issue a read-type command and fetch device response
+ * @ctx: CVS device context
+ * @cmd_id: Command identifier (big endian)
+ * @resp: Destination buffer for response payload
+ * @size: Size of payload to read into @resp (without prefix)
+ *
+ * Sends @cmd_id and reads back the response in a single I2C transaction.
+ * When the device prepends a 4-byte protocol prefix, the combined
+ * prefix+payload is read into a temporary buffer and only the payload is
+ * copied to @resp, avoiding any dependency on the layout of the caller's
+ * buffer.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_read_i2c(struct icvs *ctx, __be16 cmd_id, void *resp,
+			size_t size)
+{
+	size_t prefix_size = ctx->prefix ? sizeof(u32) : 0;
+	size_t read_size = size + prefix_size;
+	struct i2c_client *i2c = ctx->i2c_client;
+	u8 *buf;
+	int cnt;
+
+	if (!resp || !size)
+		return -EINVAL;
+
+	cnt = i2c_master_send(i2c, (const char *)&cmd_id, sizeof(cmd_id));
+	if (cnt != sizeof(cmd_id))
+		return cnt < 0 ? cnt : -EIO;
+
+	buf = kmalloc(read_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	cnt = i2c_master_recv(i2c, buf, read_size);
+	if (cnt != read_size) {
+		dev_dbg(cvs_dev(ctx), "recv cmd 0x%04x short read (%d/%zu)\n",
+			be16_to_cpu(cmd_id), cnt, read_size);
+		kfree(buf);
+		return cnt < 0 ? cnt : -EIO;
+	}
+
+	memcpy(resp, buf + prefix_size, size);
+	kfree(buf);
+
+	return 0;
+}
+
+/**
+ * cvs_write_i2c - Write a raw command buffer to the device over I2C
+ * @ctx: CVS device context
+ * @data: Buffer containing command + payload
+ * @size: Total bytes to write
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_write_i2c(struct icvs *ctx, const void *data, int size)
+{
+	struct i2c_client *i2c = ctx->i2c_client;
+	int cnt;
+
+	if (size < 0 || !data)
+		return -EINVAL;
+
+	cnt = i2c_master_send(i2c, data, size);
+	if (cnt != size) {
+		dev_dbg(cvs_dev(ctx), "send short (%d/%d)\n", cnt, size);
+		return cnt < 0 ? cnt : -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * cvs_checksum - Simple additive checksum helper
+ * @data: 32-bit aligned data buffer
+ * @len: Length in bytes (multiple of 4)
+ *
+ * Return: 32-bit additive checksum of the dwords in @data.
+ */
+static u32 cvs_checksum(const void *data, size_t len)
+{
+	const u32 *words = data;
+	u32 csum = 0;
+
+	if (WARN_ON_ONCE(len % sizeof(u32)))
+		return 0;
+
+	for (unsigned int i = 0; i < len / sizeof(u32); i++)
+		csum += words[i];
+
+	return csum;
+}
+
+/**
+ * cvs_schedule_and_wait - Schedule polling work then wait for completion
+ * @ctx: CVS device context
+ * @work_delay_ms: Delay in milliseconds before polling work executes
+ * @wait_jiffies: Timeout (jiffies) to wait for cmd completion
+ *
+ * Queues ctx->work to run after @work_delay_ms and then waits up to
+ * @wait_jiffies for ctx->cmd_completion.
+ *
+ * Return: 0 on success, -ETIMEDOUT on timeout, negative errno on error.
+ */
+static int cvs_schedule_and_wait(struct icvs *ctx, unsigned int work_delay_ms,
+				 unsigned long wait_jiffies)
+{
+	int ret;
+
+	schedule_delayed_work(&ctx->work, msecs_to_jiffies(work_delay_ms));
+	ret = wait_for_completion_killable_timeout(&ctx->cmd_completion,
+						   wait_jiffies);
+	if (ret < 0)
+		return ret;
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+/**
+ * cvs_wait_wake_or_sleep - Wait for wake IRQ or sleep fallback
+ * @ctx: CVS device context
+ * @timeout_jiffies: Timeout (jiffies) for wake event on full-cap devices
+ * @sleep_ms: Milliseconds to sleep on light-cap devices
+ *
+ * For full capability devices (ICVS_FULLCAP) waits interruptibly on
+ * ctx->hostwake_event until ctx->hostwake_event_arg becomes true or
+ * @timeout_jiffies elapses. The flag is cleared after the wait.
+ * For light capability devices performs a blocking msleep(@sleep_ms).
+ *
+ * Return codes normalized for caller switch handling:
+ *	<0		: error / interrupted
+ *	-ETIMEDOUT	: timeout (wake event not observed)
+ *	0		: success (wake observed OR light-cap sleep elapsed)
+ *
+ * Return: negative errno, -ETIMEDOUT on timeout, 0 on success.
+ */
+static int cvs_wait_wake_or_sleep(struct icvs *ctx,
+				  unsigned long timeout_jiffies,
+				  unsigned int sleep_ms)
+{
+	int ret;
+
+	if (ctx->res == ICVS_FULLCAP) {
+		ret = wait_event_interruptible_timeout(ctx->hostwake_event,
+						       ctx->hostwake_event_arg,
+						       timeout_jiffies);
+		ctx->hostwake_event_arg = false;
+		if (ret < 0)
+			return ret;
+		if (!ret)
+			return -ETIMEDOUT;
+		return 0;
+	}
+
+	msleep(sleep_ms);
+
+	return 0; /* treat sleep path as success */
+}
+
+/**
+ * cvs_config_mipi - Send a HOST_SET_MIPI_CONFIG command
+ * @ctx: CVS device context
+ * @c: Command container with conf field populated
+ * @len: Length of original command structure (unused except for symmetry)
+ *
+ * Packages @c->param.conf into a cvs_mipi_data_packet including size and
+ * checksum, then writes it to the device.
+ *
+ * Firmware note: the CVS firmware expects the MIPI configuration to be
+ * sent as a single transaction, including all relevant parameters and checksum.
+ *
+ * Return: 0 on success, NO_MIPI_CONFIG or negative errno from I2C write.
+ */
+static int cvs_config_mipi(struct icvs *ctx, struct icvs_cmd *c, size_t len)
+{
+	struct icvs_mipi_data_packet pkt = {
+		.cmd_id = c->cmd_id,
+		.size = sizeof(c->param.conf),
+		.crc = cvs_checksum(&c->param.conf, sizeof(c->param.conf)),
+		.conf = c->param.conf,
+	};
+
+	if (ctx->quirks & ICVS_NO_MIPI_CONFIG)
+		return 0;
+
+	return cvs_write_i2c(ctx, &pkt, sizeof(pkt));
+}
+
+/**
+ * cvs_get_device_state - Query current device state bitfield
+ * @ctx: CVS device context
+ * @state: Returned state value
+ *
+ * Issues GET_DEV_STATE and fills @state.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_get_device_state(struct icvs *ctx, u8 *state)
+{
+	struct icvs_resp n = {
+		.cmd_id = cpu_to_be16(ICVS_GET_DEV_STATE),
+	};
+	int ret;
+
+	ret = cvs_read_i2c(ctx, n.cmd_id, &n.resp.state, sizeof(n.resp.state));
+	if (ret)
+		return ret;
+
+	*state = n.resp.state;
+
+	return 0;
+}
+
+/**
+ * cvs_get_device_caps - Read protocol capabilities
+ * @ctx: CVS device context
+ * @caps: Capability structure to populate
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_get_device_caps(struct icvs *ctx,
+			       struct icvs_dev_capabilities *caps)
+{
+	struct icvs_resp n = {
+		.cmd_id = cpu_to_be16(ICVS_GET_DEV_CAPABILITY),
+	};
+	int ret;
+
+	if (ctx->quirks & ICVS_NO_CAPS)
+		return 0;
+
+	ret = cvs_read_i2c(ctx, n.cmd_id, &n.resp.cap, sizeof(n.resp.cap));
+	if (ret)
+		return ret;
+
+	*caps = n.resp.cap;
+
+	return 0;
+}
+
+/**
+ * cvs_hw_init - Probe device for prefix support and apply quirks
+ * @ctx: CVS device context
+ *
+ * Sends GET_DEV_VID_PID and probes for a 32-bit prefix.
+ * If it matches ICVS_PREFIX_VAL, sets ctx->prefix for subsequent reads.
+ * Then reads VID/PID and applies matching quirks.
+ * GET_DEV_VID_PID is supported by all protocol versions.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_hw_init(struct icvs *ctx)
+{
+	struct i2c_client *i2c = ctx->i2c_client;
+	struct icvs_resp n = { };
+	u16 cmd = cpu_to_be16(ICVS_GET_DEV_VID_PID);
+	int cnt, resp;
+	int ret;
+
+	cnt = i2c_master_send(i2c, (const char *)&cmd, sizeof(cmd));
+	if (cnt != sizeof(cmd))
+		return -EIO;
+
+	cnt = i2c_master_recv(i2c, (char *)&resp, sizeof(u32));
+	if (cnt != sizeof(u32))
+		return -EIO;
+
+	ctx->prefix = resp == ICVS_PREFIX_VAL;
+
+	/* Now read VID/PID to apply quirks */
+	n.cmd_id = cpu_to_be16(ICVS_GET_DEV_VID_PID);
+	ret = cvs_read_i2c(ctx, n.cmd_id,
+			   &n.resp.vid_pid, sizeof(n.resp.vid_pid));
+	if (ret)
+		return ret;
+
+	cvs_set_quirks(ctx, n.resp.vid_pid.v_id, n.resp.vid_pid.p_id);
+
+	return 0;
+}
+
+/**
+ * cvs_irq_handler - Wake IRQ handler (full capability devices)
+ * @irq: IRQ number
+ * @dev_id: Device context pointer
+ *
+ * Sets a waitqueue flag and wakes up sleeping waiters.
+ *
+ * Return: IRQ_HANDLED always.
+ */
+static irqreturn_t cvs_irq_handler(int irq, void *dev_id)
+{
+	struct icvs *ctx = dev_id;
+
+	ctx->hostwake_event_arg = true;
+	wake_up_interruptible(&ctx->hostwake_event);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * cvs_reset - Toggle reset GPIO for full capability devices
+ * @ctx: CVS device context
+ *
+ * Drives reset low briefly then high if device resources indicate full
+ * capability. Light devices have no reset line.
+ */
+static void cvs_reset(struct icvs *ctx)
+{
+	if (ctx->quirks & ICVS_SKIP_FW_RESET)
+		return;
+
+	if (ctx->res == ICVS_FULLCAP) {
+		gpiod_set_value(ctx->rst, 0);
+		fsleep(2000);
+		gpiod_set_value(ctx->rst, 1);
+	}
+}
+
+/**
+ * cvs_recv - Delayed work handler polling for command completion
+ * @work: Embedded delayed_work member
+ *
+ * Re-reads device state; if device_busy remains set, re-schedules itself.
+ * Otherwise stores state into wq_resp and completes the command.
+ */
+static void cvs_recv(struct work_struct *work)
+{
+	struct icvs *ctx = container_of(work, struct icvs, work.work);
+	u8 state = 0;
+	int ret;
+
+	ret = cvs_get_device_state(ctx, &state);
+	if (ret < 0) {
+		dev_dbg(cvs_dev(ctx), "state read failed: %d\n", ret);
+		return;
+	}
+
+	if (state & ICVS_DEV_STATE_BUSY) {
+		dev_dbg(cvs_dev(ctx), "device busy, reschedule\n");
+		schedule_delayed_work(&ctx->work,
+				      msecs_to_jiffies(FW_READY_DELAY_MS));
+		return;
+	}
+
+	ctx->wq_resp.resp.state = state;
+	complete(&ctx->cmd_completion);
+}
+
+/**
+ * cvs_send - Common command submission path
+ * @ctx: CVS device context
+ * @cmd_buf: Command buffer (icvs_cmd or raw cmd id + data)
+ * @len: Buffer length
+ *
+ * Dispatches a set of supported commands:
+ * - ICVS_SET_DEV_HOST_ID,
+ * - ICVS_HOST_SENSOR_OWNER,
+ * - ICVS_HOST_SET_MIPI_CONFIG
+ * - ICVS_FW_LOADER_*
+ *
+ * For I2C based commands it sets big-endian cmd ids, writes to the device
+ * and waits (via delayed work) for completion or timeout.
+ * GPIO based ownership toggles are handled locally.
+ *
+ * Caller must hold ctx->lock when invoking this function and check for i2c
+ * bus availability.
+ *
+ * Return: 0 on success, negative errno, -EINVAL for unsupported command
+ * or status from device in ctx->wq_resp.
+ */
+int cvs_send(struct icvs *ctx, struct icvs_cmd *cmd, size_t len)
+{
+	int ret, status;
+
+	dev_dbg(cvs_dev(ctx), "send cmd = 0x%04x", cmd->cmd_id);
+
+	reinit_completion(&ctx->cmd_completion);
+
+	switch (cmd->cmd_id) {
+	case ICVS_SET_DEV_HOST_ID:
+		cmd->cmd_id = cpu_to_be16(ICVS_SET_DEV_HOST_ID);
+		ret = cvs_write_i2c(ctx, cmd, len);
+		if (ret < 0)
+			break;
+
+		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
+					    CMD_TIMEOUT);
+		if (ret < 0)
+			break;
+
+		status = ctx->wq_resp.resp.state &
+			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
+		break;
+	case ICVS_HOST_SENSOR_OWNER:
+		gpiod_set_value_cansleep(ctx->req, cmd->param.param);
+		fsleep(FW_READY_DELAY_MS * USEC_PER_MSEC);
+		ret = gpiod_get_value_cansleep(ctx->resp);
+		status = cmd->param.param == ret ? 0 : -EINVAL;
+		ret = 0; /* success */
+		break;
+	case ICVS_HOST_SET_MIPI_CONFIG:
+		cmd->cmd_id = cpu_to_be16(ICVS_HOST_SET_MIPI_CONFIG);
+		ret = cvs_config_mipi(ctx, cmd, len);
+		if (ret < 0)
+			break;
+
+		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
+					    CMD_TIMEOUT);
+		status = (ctx->wq_resp.resp.state &
+			  ICVS_DEV_STATE_ERROR) ? -EINVAL : 0;
+		break;
+	case ICVS_FW_LOADER_START:
+		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_START);
+		ret = cvs_write_i2c(ctx, cmd, len);
+		if (ret < 0)
+			break;
+
+		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
+					     FW_READY_DELAY_MS);
+		if (ret)
+			break;
+
+		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
+					    CMD_TIMEOUT);
+		status = (ctx->wq_resp.resp.state &
+			  ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
+		break;
+	case ICVS_FW_LOADER_DATA:
+		/* Quirk for older protocols */
+		if (ctx->caps.protocol_version_major >= 2 &&
+		    ctx->caps.protocol_version_minor >= 2) {
+			cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_DATA);
+			ret = cvs_write_i2c(ctx, cmd, len);
+		} else {
+			ret = cvs_write_i2c(ctx, &cmd->param,
+					    len - sizeof(cmd->cmd_id));
+		}
+
+		if (ret < 0)
+			return ret;
+
+		ret = cvs_wait_wake_or_sleep(ctx, FW_READY_DELAY_MS,
+					     FW_READY_DELAY_MS);
+		if (ret)
+			break;
+
+		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
+					    CMD_TIMEOUT);
+		status = ctx->wq_resp.resp.state &
+			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
+		break;
+	case ICVS_FW_LOADER_END:
+		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_END);
+		ret = cvs_write_i2c(ctx, cmd, len);
+		if (ret < 0)
+			break;
+
+		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
+					     FW_READY_DELAY_MS);
+		if (ret)
+			break;
+
+		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
+					    CMD_TIMEOUT);
+		status = !(ctx->wq_resp.resp.state &
+			   ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return ctx->wq_resp.status = status;
+}
+
+/**
+ * cvs_set_link_owner - Switch CSI-2 link ownership between host and device
+ * @ctx: CVS device context
+ * @owner: Desired owner (ICVS_CSI_LINK_HOST or ICVS_CSI_LINK_CVS)
+ *
+ * Called from runtime PM callbacks to claim or release the CSI-2 link.
+ * Also callable directly for error recovery paths.
+ *
+ * Return: 0 on success or negative errno.
+ */
+int cvs_set_link_owner(struct icvs *ctx, enum icvs_csi_link_owner owner)
+{
+	struct icvs_cmd cmd = {
+		.cmd_id = ICVS_HOST_SENSOR_OWNER,
+		.param.param = owner,
+	};
+	size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
+
+	guard(mutex)(&ctx->lock);
+	return cvs_send(ctx, &cmd, cmd_size);
+}
+
+/**
+ * cvs_configure_dev_caps - Configure device capability ownership bits
+ * @ctx: CVS device context
+ *
+ * Tells the CVS device which of its features (privacy LED, RGB camera
+ * power-up, vision sensing) are controlled by the host, then sends
+ * SET_DEV_HOST_ID.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_configure_dev_caps(struct icvs *ctx)
+{
+	struct icvs_cmd cmd = { .cmd_id = ICVS_SET_DEV_HOST_ID };
+	size_t sz = sizeof(cmd.cmd_id) + sizeof(cmd.param.host_id);
+
+	if (ctx->quirks & ICVS_HOST_VISION_SENSING)
+		cmd.param.host_id |= ICVS_HOST_ID_VISION_SENSING;
+	if (ctx->quirks & ICVS_HOST_PRIV_CTRL)
+		cmd.param.host_id |= ICVS_HOST_ID_PRIVACY_LED;
+	if (ctx->quirks & ICVS_HOST_SENSOR_PWR_CTRL)
+		cmd.param.host_id |= ICVS_HOST_ID_RGBCAMERA_PWRUP;
+
+	guard(mutex)(&ctx->lock);
+	return cvs_send(ctx, &cmd, sz);
+}
+
+/**
+ * cvs_core_probe - Shared probe path for I2C & platform instantiation
+ * @dev: Parent device
+ * @i2c: I2C client (NULL for platform devices)
+ *
+ * Discovers IPU, parses ACPI resources, sets up GPIOs/IRQs, initializes
+ * sub-device (CSI) and host identifier, and exposes sysfs firmware interface.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
+{
+	struct pci_dev *ipu = NULL;
+	struct icvs *ctx;
+	int ret;
+
+	/* Locate IPU device */
+	for (unsigned int i = 0; !ipu && icvs_pci_tbl[i].vendor; i++)
+		ipu = pci_get_device(icvs_pci_tbl[i].vendor,
+				     icvs_pci_tbl[i].device, NULL);
+	if (!ipu)
+		return -ENODEV;
+
+	ret = ipu_bridge_init(&ipu->dev, ipu_bridge_parse_ssdb);
+	if (ret < 0) {
+		put_device(&ipu->dev);
+		return ret;
+	}
+
+	if (!dev_fwnode(dev))
+		return -ENXIO;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->i2c_client = i2c;
+
+	ret = gpiod_count(dev, NULL);
+	switch (ret) {
+	case ICVS_GPIO_SYNC:
+		ctx->res = ICVS_LIGHTCAP;
+		break;
+	case ICVS_GPIO_ASYNC:
+		ctx->res = ICVS_FULLCAP;
+		break;
+	default:
+		dev_err(dev, "unexpected GPIO count %d\n", ret);
+		return -EINVAL;
+	}
+
+	ret = devm_acpi_dev_add_driver_gpios(dev,
+					     ctx->res == ICVS_FULLCAP ?
+					     icvs_acpi_gpios :
+					     icvs_acpi_lgpios);
+	if (ret) {
+		dev_err(dev, "failed to add ACPI GPIOs (%d)\n", ret);
+		return -EINVAL;
+	}
+
+	ctx->req = devm_gpiod_get(dev, "req", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->req))
+		return PTR_ERR(ctx->req);
+
+	ctx->resp = devm_gpiod_get(dev, "resp", GPIOD_IN);
+	if (IS_ERR(ctx->resp))
+		return PTR_ERR(ctx->resp);
+
+	if (ctx->res == ICVS_FULLCAP) {
+		struct gpio_desc *wake;
+
+		ctx->rst = devm_gpiod_get(dev, "rst", GPIOD_OUT_HIGH);
+		if (IS_ERR(ctx->rst))
+			return PTR_ERR(ctx->rst);
+
+		wake = devm_gpiod_get(dev, "wake", GPIOD_IN);
+		if (IS_ERR(wake))
+			return PTR_ERR(wake);
+
+		ctx->irq = gpiod_to_irq(wake);
+		if (ctx->irq < 0)
+			return ctx->irq;
+
+		ret = devm_request_threaded_irq(dev, ctx->irq, NULL,
+						cvs_irq_handler,
+						IRQF_ONESHOT | IRQF_NO_SUSPEND,
+						"cvs_wake", ctx);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_mutex_init(dev, &ctx->lock);
+	if (ret)
+		return ret;
+
+	init_completion(&ctx->cmd_completion);
+	init_waitqueue_head(&ctx->hostwake_event);
+	INIT_DELAYED_WORK(&ctx->work, cvs_recv);
+
+	if (i2c) {
+		ret = cvs_hw_init(ctx);
+		if (ret) {
+			dev_err(dev, "HW init failed (%d)\n", ret);
+			/*
+			 * Fallback to GPIO-only mode.
+			 * Some BIOS show the device on the I2C bus, however,
+			 * the device is not accessible via I2C.
+			 */
+			ctx->i2c_client = NULL;
+			goto fail_i2c;
+		}
+
+		ret = cvs_get_device_caps(ctx, &ctx->caps);
+		if (ret) {
+			dev_err(dev, "get caps failed (%d)\n", ret);
+			return ret;
+		}
+
+		ret = cvs_configure_dev_caps(ctx);
+		if (ret) {
+			dev_err(dev, "configure dev caps failed (%d)\n", ret);
+			return ret;
+		}
+	}
+
+fail_i2c:
+	ret = cvs_csi_init(ctx, dev, i2c);
+	if (ret) {
+		dev_err(dev, "CSI init failed (%d)\n", ret);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, ctx);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	/*
+	 * Create a PM runtime device link with IPU as consumer and CVS as
+	 * supplier. When the IPU runtime-resumes to start streaming, the PM
+	 * framework automatically resumes CVS first, triggering
+	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
+	 */
+	ctx->ipu_link = device_link_add(&ipu->dev, dev,
+					DL_FLAG_PM_RUNTIME |
+					DL_FLAG_RPM_ACTIVE |
+					DL_FLAG_STATELESS);
+	if (!ctx->ipu_link)
+		dev_warn(dev, "IPU device link failed\n");
+	put_device(&ipu->dev);
+
+	if (has_acpi_companion(dev))
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+
+	return 0;
+}
+
+/**
+ * cvs_probe - I2C driver probe entry
+ * @i2c: I2C client
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_probe(struct i2c_client *i2c)
+{
+	return cvs_core_probe(&i2c->dev, i2c);
+}
+
+/**
+ * cvs_core_remove - Shared remove logic
+ * @dev: Device
+ */
+static void cvs_core_remove(struct device *dev)
+{
+	struct icvs *ctx = dev_get_drvdata(dev);
+
+	cvs_csi_remove(ctx);
+	cancel_delayed_work_sync(&ctx->work);
+
+	if (ctx->ipu_link)
+		device_link_del(ctx->ipu_link);
+
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+
+	cvs_reset(ctx);
+}
+
+/**
+ * cvs_remove - I2C driver remove
+ * @client: I2C client
+ */
+static void cvs_remove(struct i2c_client *client)
+{
+	cvs_core_remove(&client->dev);
+}
+
+/**
+ * cvs_suspend - System suspend callback
+ * @dev: Device
+ *
+ * Return: 0.
+ */
+static int cvs_suspend(struct device *dev)
+{
+	struct icvs *ctx = dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&ctx->work);
+
+	return 0;
+}
+
+/**
+ * cvs_resume - System resume callback
+ * @dev: Device
+ *
+ * Re-validates I2C link prefix and re-sends host id if transport available.
+ *
+ * Return: 0 on success or negative errno if I2C check fails.
+ */
+static int cvs_resume(struct device *dev)
+{
+	struct icvs *ctx = dev_get_drvdata(dev);
+	int ret;
+
+	if (ctx->i2c_client) {
+		ret = cvs_hw_init(ctx);
+		if (ret)
+			return ret;
+		return cvs_configure_dev_caps(ctx);
+	}
+
+	return 0;
+}
+
+/**
+ * cvs_runtime_resume - Runtime PM resume: claim CSI-2 link ownership
+ * @dev: Device
+ *
+ * Triggered automatically when the IPU (consumer) runtime-resumes, because
+ * a DL_FLAG_PM_RUNTIME device link makes CVS the supplier. Transfers CSI-2
+ * link ownership to the host so the IPU can start receiving sensor frames.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_runtime_resume(struct device *dev)
+{
+	struct icvs *ctx = dev_get_drvdata(dev);
+
+	return cvs_set_link_owner(ctx, ICVS_CSI_LINK_HOST);
+}
+
+/**
+ * cvs_runtime_suspend - Runtime PM suspend: release CSI-2 link ownership
+ * @dev: Device
+ *
+ * Called after the streaming reference is dropped (via pm_runtime_put_autosuspend
+ * in cvs_csi_disable_streams). Returns CSI-2 link ownership to CVS firmware.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_runtime_suspend(struct device *dev)
+{
+	struct icvs *ctx = dev_get_drvdata(dev);
+
+	return cvs_set_link_owner(ctx, ICVS_CSI_LINK_CVS);
+}
+
+static const struct dev_pm_ops cvs_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cvs_suspend, cvs_resume)
+	SET_RUNTIME_PM_OPS(cvs_runtime_suspend, cvs_runtime_resume, NULL)
+};
+
+static const struct acpi_device_id intel_cvs_acpi_match[] = {
+	{ "INTC10DE" }, /* LNL */
+	{ "INTC10E0" }, /* ARL */
+	{ "INTC10E1" }, /* PTL */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, intel_cvs_acpi_match);
+
+static struct i2c_driver cvs_driver = {
+	.driver = {
+		.name = "intel_cvs",
+		.acpi_match_table = intel_cvs_acpi_match,
+		.pm = &cvs_pm_ops,
+	},
+	.probe = cvs_probe,
+	.remove = cvs_remove,
+};
+
+static int cvs_platform_probe(struct platform_device *pdev)
+{
+	return cvs_core_probe(&pdev->dev, NULL);
+}
+
+static void cvs_platform_remove(struct platform_device *pdev)
+{
+	cvs_core_remove(&pdev->dev);
+}
+
+/*
+ * Platform driver structure.
+ *
+ * Some platforms may instantiate the CVS device as a platform device
+ * without I2C support. This driver binding allows such platforms to use the
+ * CVS core functionality (GPIOs, CSI sub-device) without I2C.
+ */
+static struct platform_driver cvs_platform_driver = {
+	.driver = {
+		.name = "cvs_platform",
+		.acpi_match_table = intel_cvs_acpi_match,
+		.pm = &cvs_pm_ops,
+	},
+	.probe = cvs_platform_probe,
+	.remove = cvs_platform_remove,
+};
+
+/**
+ * cvs_init - Module init registering I2C and platform drivers
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int __init cvs_init(void)
+{
+	int ret;
+
+	ret = i2c_add_driver(&cvs_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&cvs_platform_driver);
+	if (ret) {
+		i2c_del_driver(&cvs_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * cvs_exit - Module exit unregistering drivers
+ */
+static void __exit cvs_exit(void)
+{
+	platform_driver_unregister(&cvs_platform_driver);
+	i2c_del_driver(&cvs_driver);
+}
+module_init(cvs_init);
+module_exit(cvs_exit);
+
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
+MODULE_AUTHOR("Miguel Vadillo <miguel.vadillo@intel.com>");
+MODULE_DESCRIPTION("Intel Vision Sensing Controller driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/cvs/icvs.h b/drivers/media/i2c/cvs/icvs.h
new file mode 100644
index 000000000000..bfba941182b5
--- /dev/null
+++ b/drivers/media/i2c/cvs/icvs.h
@@ -0,0 +1,515 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2026 Intel Corporation
+ */
+
+#ifndef _ICVS_H
+#define _ICVS_H
+
+#include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/types.h>
+#include <linux/wait.h>
+
+#include <linux/pci.h>
+
+#include <media/ipu6-pci-table.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+/*
+ * PCI device IDs for all IPU generations that co-exist with the CVS bridge.
+ * IPU7 (0x645d) is shared by MTL and LNL; IPU7P5 (0xb05d) is shared by
+ * ARL and PTL. These are not yet in the shared ipu6-pci-table so they are
+ * listed here alongside the IPU6 family for probe-time IPU discovery.
+ */
+#define PCI_DEVICE_ID_INTEL_IPU7		0x645d	/* MTL / LNL */
+#define PCI_DEVICE_ID_INTEL_IPU7P5		0xb05d	/* ARL / PTL */
+
+static const struct pci_device_id icvs_pci_tbl[] = {
+	/* IPU6 family (from ipu6-pci-table.h) */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	/* IPU7 / IPU7.5 */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
+	{ }
+};
+
+struct gpio_desc;
+struct i2c_client;
+
+/*
+ * GPIO resource counts (ACPI enumerated).
+ *
+ * 4-GPIO configuration has a wake IRQ and supports asynchronous messaging.
+ * 2-GPIO configuration has no IRQ, so communication is synchronous only.
+ */
+#define ICVS_GPIO_ASYNC	4
+#define ICVS_GPIO_SYNC	2
+
+/* Firmware response prefix (optional, for protocol revision 2.x or newer) */
+#define ICVS_PREFIX_VAL	0xCAFEB0BA
+
+/*
+ * CSI bridge sub-device definitions
+ */
+/**
+ * enum icvs_csi_cmd_id - Low-level CSI bridge command identifiers
+ *
+ * These numeric IDs are part of the legacy CSI-side protocol not mapped
+ * directly to the higher level firmware opcodes in enum icvs_command. Only
+ * a minimal subset is presently issued/handled by the driver. Others are
+ * reserved for future expansion of the CSI bridge feature set.
+ *
+ * @ICVS_CSI_SET_OWNER:     Set CSI sensor ownership between host and CVS
+ * @ICVS_CSI_SET_CONF:      Apply CSI link configuration parameters
+ * @ICVS_CSI_PRIVACY_NOTIF: Notify host of a privacy state transition
+ */
+enum icvs_csi_cmd_id {
+	ICVS_CSI_SET_OWNER = 0,
+	ICVS_CSI_SET_CONF = 2,
+	ICVS_CSI_PRIVACY_NOTIF = 6,
+};
+
+/**
+ * enum icvs_csi_link_owner - CSI-2 link / sensor ownership
+ *
+ * Ownership reflects which endpoint currently controls the attached image
+ * sensor over the CSI-2 link. Transitions may gate streaming or reconfigure
+ * link parameters. The host requests ownership changes via protocol opcodes
+ * and may need to assert GPIO signals on platforms without full capability.
+ *
+ * @ICVS_CSI_LINK_HOST: Host (Linux) owns the sensor and may start streaming
+ * @ICVS_CSI_LINK_CVS:  CVS firmware owns the sensor (host must not stream)
+ */
+enum icvs_csi_link_owner {
+	ICVS_CSI_LINK_HOST,
+	ICVS_CSI_LINK_CVS,
+};
+
+/**
+ * enum icvs_csi_privacy_status - Reported privacy state
+ *
+ * Reflects user privacy (e.g. camera LED assertion and stream gating). The
+ * MAX value is a sentinel used for bounds checking and is not a real state.
+ *
+ * @ICVS_CSI_PRIVACY_OFF: Privacy not asserted (LED off, streaming permitted)
+ * @ICVS_CSI_PRIVACY_ON:  Privacy asserted (LED on and/or stream gated)
+ * @ICVS_CSI_PRIVACY_MAX: Sentinel; not a valid operational value
+ */
+enum icvs_csi_privacy_status {
+	ICVS_CSI_PRIVACY_OFF,
+	ICVS_CSI_PRIVACY_ON,
+	ICVS_CSI_PRIVACY_MAX
+};
+
+/**
+ * enum icvs_csi_pads - Media pads exposed by the CVS sub-device
+ *
+ * The bridge presents a single sink (from the remote sensor) and a single
+ * source (toward the rest of the media graph / consumers). NUM_PADS is used
+ * for sizing arrays and iteration; it is not a real pad index.
+ *
+ * @ICVS_CSI_PAD_SINK:   Sink pad receiving frames from remote sensor
+ * @ICVS_CSI_PAD_SOURCE: Source pad emitting frames to downstream entities
+ * @ICVS_CSI_NUM_PADS:   Count sentinel (array size / iteration bound)
+ */
+enum icvs_csi_pads {
+	ICVS_CSI_PAD_SINK,
+	ICVS_CSI_PAD_SOURCE,
+	ICVS_CSI_NUM_PADS
+};
+
+/**
+ * Core driver structures and functions used by both I2C and platform modes
+ */
+
+/**
+ * DOC: CVS device quirk flags
+ *
+ * These bit flag macros describe per-device behavioral adjustments applied
+ * after VID/PID matching (see cvs_i2c_check() and cvs_apply_quirks()). They
+ * allow the driver to selectively alter logic paths for firmware / hardware
+ * variants without introducing hard-coded conditionals at each call site.
+ *
+ * @ICVS_NO_MIPI_CONFIG: Device firmware performs its own MIPI link setup;
+ *                       skip sending HOST_SET_MIPI_CONFIG.
+ * @ICVS_SKIP_FW_RESET:  Skip issuing a post firmware-update reset sequence.
+ * @ICVS_NO_CAPS:        Device firmware does not support GET_DEV_CAPABILITY;
+ *                       skip capability query and treat caps as unsupported.
+ * @ICVS_FW_BUF_SIZE_256: Firmware expects chunk transfer buffer size of 256
+ *                        bytes (override defaults if they differ).
+ * @ICVS_FW_HEADER_SIZE_256: Firmware header size fixed at 256 bytes offset
+ *                           for start of payload data.
+ * @ICVS_HOST_SENSOR_PWR_CTRL: Host must control sensor power sequencing.
+ * @ICVS_HOST_PRIV_CTRL: Host owns privacy LED gating.
+ * @ICVS_HOST_VISION_SENSING: Host enables vision sensing capability bit
+ * @ICVS_NO_FW_UPDATE:   Device does not support firmware update.
+ */
+#define ICVS_NO_MIPI_CONFIG		BIT(0)
+#define ICVS_SKIP_FW_RESET		BIT(1)
+#define ICVS_NO_CAPS			BIT(2)
+#define ICVS_FW_BUF_SIZE_256		BIT(3)
+#define ICVS_FW_HEADER_SIZE_256		BIT(4)
+#define ICVS_HOST_SENSOR_PWR_CTRL	BIT(5)
+#define ICVS_HOST_PRIV_CTRL		BIT(6)
+#define ICVS_HOST_VISION_SENSING	BIT(7)
+#define ICVS_NO_FW_UPDATE		BIT(8)
+
+/**
+ * struct icvs_device_quirk - Device-specific quirk entry
+ * @vid: Vendor ID
+ * @pid: Product ID
+ * @quirks: Quirk flags for this device
+ */
+struct icvs_device_quirk {
+	u16 vid;
+	u16 pid;
+	unsigned long quirks;
+};
+
+/**
+ * struct icvs_dt_config - Data type configuration for a virtual channel
+ * @pixel_width: Pixel width in pixels
+ * @pixel_height: Pixel height in pixels
+ * @data_type: MIPI CSI-2 data type (RAW10, RAW12, etc.)
+ * @reserved: Reserved for future use
+ */
+struct icvs_dt_config {
+	u16	pixel_width;
+	u16	pixel_height;
+	u8	data_type;
+	u8	reserved[3];
+};
+
+/**
+ * struct icvs_vc_config - Virtual channel configuration
+ * @vc: Virtual channel index (0-31)
+ * @dt_count: Number of data types configured
+ * @dt_configs: Array of data type configurations (up to 4)
+ * @reserved: Reserved for future use
+ */
+struct icvs_vc_config {
+	u8	vc;
+	u8	dt_count;
+	struct icvs_dt_config dt_configs[4];
+	u8	reserved[6];
+};
+
+/**
+ * struct icvs_link_cfg - Host to CVS CSI link configuration
+ * @fps: Frames per second
+ * @nr_of_lanes: Number of CSI-2 data lanes used
+ * @phy_mode: 0 = DPHY, 1 = CPHY
+ * @vc_count: Number of virtual channels enabled
+ * @vc_configs: Per-VC configuration
+ * @link_freq: Link frequency in Hz
+ * @reserved: Reserved for future use
+ */
+struct icvs_link_cfg {
+	u8	fps;
+	u8	nr_of_lanes;
+	u8	phy_mode;
+	u8	vc_count;
+	struct icvs_vc_config vc_configs[4];
+	u32	link_freq;
+	u8	reserved[8];
+};
+
+/**
+ * struct icvs_fw_version - Firmware version tuple
+ * @major: Major version
+ * @minor: Minor version
+ * @hotfix: Hotfix/patch level
+ * @build: Build number
+ */
+struct icvs_fw_version {
+	u32	major;
+	u32	minor;
+	u32	hotfix;
+	u32	build;
+};
+
+/**
+ * struct icvs_vid_pid - Device vendor/product IDs
+ * @v_id: Vendor ID
+ * @p_id: Product ID
+ */
+struct icvs_vid_pid {
+	u16	v_id;
+	u16	p_id;
+};
+
+/**
+ * struct icvs_mipi_data_packet - Encapsulated MIPI link configuration packet
+ * @cmd_id: Command identifier
+ * @size: Payload size (bytes)
+ * @crc: Checksum over payload
+ * @conf: CSI link configuration
+ * @reserved: Reserved for future use
+ */
+struct icvs_mipi_data_packet {
+	u16	cmd_id;
+	u32	size;
+	u32	crc;
+	struct icvs_link_cfg conf;
+	u8	reserved[70];
+} __packed;
+
+/**
+ * struct icvs_mipi_read_packet - Read-back MIPI configuration
+ * @size: Payload size
+ * @crc: Payload checksum
+ * @conf: CSI link configuration
+ */
+struct icvs_mipi_read_packet {
+	u32	size;
+	u32	crc;
+	struct icvs_link_cfg conf;
+};
+
+/* Host identifier bitfield masks */
+#define ICVS_HOST_ID_RGBCAMERA_PWRUP	BIT(31)
+#define ICVS_HOST_ID_PRIVACY_LED	BIT(30)
+#define ICVS_HOST_ID_DEVICE_POWER	GENMASK(29, 28)
+#define ICVS_HOST_ID_VISION_SENSING	BIT(27)
+
+/* Device state bitfield masks (u8) */
+#define ICVS_DEV_STATE_PRIVACY		BIT(0)
+#define ICVS_DEV_STATE_ON		BIT(1)
+#define ICVS_DEV_STATE_SENSOR_OWNER	BIT(2)
+#define ICVS_DEV_STATE_DOWNLOAD		BIT(4)
+#define ICVS_DEV_STATE_ERROR		BIT(6)
+#define ICVS_DEV_STATE_BUSY		BIT(7)
+
+/* Device capability bitfield masks (u16) */
+#define ICVS_CAP_HOST_MIPI_REQUIRED	BIT(15)
+#define ICVS_CAP_FW_ANTIROLLBACK	BIT(14)
+#define ICVS_CAP_PRIVACY2VISIONDRIVER	BIT(13)
+#define ICVS_CAP_FWUPDATE_RESET_HOST	BIT(12)
+#define ICVS_CAP_NO_CAMERA_FWUPDATE	BIT(11)
+#define ICVS_CAP_POWER_DOMAIN_SUPPORT	BIT(10)
+#define ICVS_CAP_FW_FLASHED_IN_PLACE	BIT(9)
+#define ICVS_CAP_IO_CONTEXT_HOT		BIT(8)
+
+/**
+ * struct icvs_dev_capabilities - Protocol capabilities reported by device
+ * @protocol_version_major: Major protocol version
+ * @protocol_version_minor: Minor protocol version
+ * @capability: Capability bitfield - use ICVS_CAP_* masks
+ * @max_packet_time: Max packet processing time (ms)
+ * @max_post_dl_time: Max post-download time (s)
+ */
+struct icvs_dev_capabilities {
+	u8 protocol_version_major;
+	u8 protocol_version_minor;
+	u16 capability;
+	u16 max_packet_time;
+	u16 max_post_dl_time;
+};
+
+/**
+ * struct icvs_cmd - Generic command container
+ * @cmd_id: Command identifier
+ * @param: Parameter union providing multiple variants
+ * @param.param: Raw parameter
+ * @param.host_id: Host identifier (ICVS_SET_DEV_HOST_ID) - use
+ *		   ICVS_HOST_ID_* masks
+ * @param.conf: CSI link configuration (ICVS_HOST_SET_MIPI_CONFIG)
+ */
+struct icvs_cmd {
+	u16 cmd_id;
+	union {
+		u32 param;
+		u32 host_id;
+		struct icvs_link_cfg conf;
+	} param;
+} __packed;
+
+/**
+ * struct icvs_resp - Firmware response container
+ * @status: Internal status code
+ * @cmd_id: Original command identifier
+ * @resp: Response union containing variant payload
+ * @resp.state: Device state response (u8, use ICVS_DEV_STATE_* masks)
+ * @resp.cap: Capability response
+ * @resp.conf: Link configuration response
+ * @resp.mipi_read: Raw link config read-back
+ * @resp.vid_pid: Vendor/product identifiers
+ * @resp.fw_version: Firmware version tuple
+ */
+struct icvs_resp {
+	u32 status;
+	u16 cmd_id;
+	union {
+		u8 state;
+		struct icvs_dev_capabilities cap;
+		struct icvs_link_cfg conf;
+		struct icvs_mipi_read_packet mipi_read;
+		struct icvs_vid_pid vid_pid;
+		struct icvs_fw_version fw_version;
+	} resp;
+};
+
+/**
+ * enum icvs_resources - Device capability / resource category
+ *
+ * Categorizes hardware resource availability which influences protocol
+ * features (e.g. reset control, wake IRQ, GPIO mediated ownership). Light
+ * capability devices expose a reduced set of control GPIOs; full capability
+ * devices provide all optional signals and features. NOTSUP represents an
+ * unsupported or uninitialized state.
+ *
+ * @ICVS_NOTSUP:   Capability not supported / not yet determined
+ * @ICVS_LIGHTCAP: Light capability (limited GPIO / no dedicated wake IRQ)
+ * @ICVS_FULLCAP:  Full capability (reset GPIO, wake IRQ, extended protocol)
+ */
+enum icvs_resources {
+	ICVS_NOTSUP,
+	ICVS_LIGHTCAP,
+	ICVS_FULLCAP,
+};
+
+/**
+ * enum icvs_command - Protocol command opcodes (firmware space 0x0800+)
+ * @ICVS_GET_DEV_STATE:        Query current device state bitfield
+ * @ICVS_GET_DEV_FW_VERSION:   Retrieve firmware version tuple
+ * @ICVS_GET_DEV_VID_PID:      Read vendor / product identifiers
+ * @ICVS_GET_DEV_ERR_CODE:     Fetch last error code (if any)
+ * @ICVS_GET_DEV_CAPABILITY:   Read protocol capability structure
+ * @ICVS_SET_DEV_HOST_ID:      Set host identity / ownership bits
+ * @ICVS_GET_DEV_HOST_ID:      Read back host identity
+ * @ICVS_FW_LOADER_START:      Begin firmware download sequence
+ * @ICVS_FW_LOADER_DATA:       Stream a chunk of firmware payload
+ * @ICVS_FW_LOADER_END:        End firmware download / trigger flash
+ * @ICVS_HOST_GET_MIPI_CONFIG: Request current MIPI CSI link configuration
+ * @ICVS_HOST_SET_MIPI_CONFIG: Apply new MIPI CSI link configuration
+ * @ICVS_HOST_SENSOR_OWNER:    Toggle CSI sensor ownership (GPIO assist)
+ */
+enum icvs_command {
+	ICVS_GET_DEV_STATE		= 0x0800,
+	ICVS_GET_DEV_FW_VERSION		= 0x0801,
+	ICVS_GET_DEV_VID_PID		= 0x0802,
+	ICVS_GET_DEV_ERR_CODE		= 0x0803,
+	ICVS_GET_DEV_CAPABILITY		= 0x0804,
+	ICVS_SET_DEV_HOST_ID		= 0x0805,
+	ICVS_GET_DEV_HOST_ID		= 0x0806,
+	ICVS_FW_LOADER_START		= 0x0820,
+	ICVS_FW_LOADER_DATA		= 0x0821,
+	ICVS_FW_LOADER_END		= 0x0822,
+	ICVS_HOST_GET_MIPI_CONFIG	= 0x082F,
+	ICVS_HOST_SET_MIPI_CONFIG	= 0x0830,
+	ICVS_HOST_SENSOR_OWNER		= 0x0831,
+};
+
+/**
+ * enum icvs_state - Device state bitfield flags
+ *
+ * These flags correspond to bits in the device state byte returned via
+ * GET_DEV_STATE and decoded in union icvs_dev_state. Multiple bits may be
+ * asserted simultaneously. Reserved bits are omitted.
+ *
+ * @ICVS_DEVICE_OFF_STATE: Raw zero value; device is powered off or
+ *			   not yet ready
+ * @ICVS_DEVICE_PRIVACY_ON: Privacy mode active (LED asserted and/or
+ *			    stream gated)
+ * @ICVS_DEVICE_ON_STATE: Device powered and responsive to protocol commands
+ * @ICVS_DEVICE_SENSOR_OWNER: CVS currently owns the attached CSI sensor
+ * @ICVS_DEVICE_DWNLD_STATE: Firmware download / flash operation in progress
+ * @ICVS_DEVICE_ERROR_STATE: Device has reported an error (query
+ *			     ICVS_GET_DEV_ERR_CODE)
+ * @ICVS_DEVICE_BUSY_STATE: Device is busy processing a prior command
+ */
+enum icvs_state {
+	ICVS_DEVICE_OFF_STATE		= 0x00,
+	ICVS_DEVICE_PRIVACY_ON		= BIT(0),
+	ICVS_DEVICE_ON_STATE		= BIT(1),
+	ICVS_DEVICE_SENSOR_OWNER	= BIT(2),
+	ICVS_DEVICE_DWNLD_STATE		= BIT(4),
+	ICVS_DEVICE_ERROR_STATE		= BIT(6),
+	ICVS_DEVICE_BUSY_STATE		= BIT(7),
+};
+
+/**
+ * struct icvs - Core CVS device context
+ * @i2c_client: I2C client (NULL in platform-only mode)
+ * @work: Delayed work for polling device state / completion
+ * @wq_resp: Last response container populated by workqueue
+ * @cmd_completion: Completion for command waiters
+ * @lock: Mutex protecting command submission & shared state
+ * @subdev: V4L2 sub-device representing the CSI bridge entity
+ * @remote: Remote media pad connected to upstream camera sensor
+ * @notifier: Async notifier for remote sensor discovery
+ * @ctrl_handler: V4L2 control handler
+ * @freq_ctrl: (future) frequency control pointer
+ * @pads: Local media pads (sink/source)
+ * @nr_of_lanes: Active CSI-2 lane count
+ * @link_freq: Current link frequency (Hz)
+ * @ipu_link: PM runtime device link (IPU consumer, CVS supplier)
+ * @res: Resource capability (light/full)
+ * @caps: Reported device protocol capabilities
+ * @prefix: Firmware response prefix present
+ * @quirks: Device-specific quirk flags
+ * @rst: Reset GPIO (full capability only)
+ * @req: Request GPIO (ownership signaling)
+ * @resp: Response GPIO (ownership signaling)
+ * @irq: Wake IRQ (full capability)
+ * @hostwake_event: Waitqueue for wake events
+ * @hostwake_event_arg: Wake event flag
+ */
+struct icvs {
+	struct i2c_client *i2c_client;
+	struct delayed_work work;
+	struct icvs_resp wq_resp;
+	struct completion cmd_completion;
+	struct mutex lock; /* Protects command execution and device state */
+	struct v4l2_subdev subdev;
+	struct media_pad *remote;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *freq_ctrl;
+	struct media_pad pads[ICVS_CSI_NUM_PADS];
+	u32 nr_of_lanes;
+	u64 link_freq;
+	struct device_link *ipu_link;
+	enum icvs_resources res;
+	struct icvs_dev_capabilities caps;
+	bool prefix;
+	unsigned long quirks;
+	struct gpio_desc *rst;
+	struct gpio_desc *req;
+	struct gpio_desc *resp;
+	int irq;
+	wait_queue_head_t hostwake_event;
+	bool hostwake_event_arg;
+};
+
+/**
+ * cvs_dev - Helper returning the struct device for a CVS context
+ * @ctx: CVS context
+ *
+ * Avoids repeating transport conditional logic at each call site when
+ * acquiring the device pointer for logging or PM operations.
+ *
+ * Return: Device pointer (never NULL if @ctx is valid).
+ */
+static inline struct device *cvs_dev(struct icvs *ctx)
+{
+	return ctx->i2c_client ? &ctx->i2c_client->dev : ctx->subdev.dev;
+}
+
+/* Cross-unit interfaces */
+int cvs_send(struct icvs *ctx, struct icvs_cmd *cmd, size_t len);
+int cvs_set_link_owner(struct icvs *ctx, enum icvs_csi_link_owner owner);
+int cvs_csi_init(struct icvs *ctx, struct device *dev, struct i2c_client *i2c);
+void cvs_csi_remove(struct icvs *ctx);
+
+#endif /* _ICVS_H */
diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
new file mode 100644
index 000000000000..951ae0f5f4fb
--- /dev/null
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -0,0 +1,618 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ * CVS driver - CSI/V4L2 subdev support
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "icvs.h"
+
+/*
+ * Helpers
+ */
+static inline struct icvs *notifier_to_csi(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct icvs, notifier);
+}
+
+static inline struct icvs *sd_to_csi(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct icvs, subdev);
+}
+
+/*
+ * Default formats
+ */
+static const struct v4l2_mbus_framefmt cvs_csi_format_mbus_default = {
+	.width = 1,
+	.height = 1,
+	.code = MEDIA_BUS_FMT_Y8_1X8,
+	.field = V4L2_FIELD_NONE,
+};
+
+/**
+ * csi_set_link_cfg - Program default CSI-2 link parameters
+ * @ctx: CVS device context
+ *
+ * Populates a HOST_SET_MIPI_CONFIG command using current lane count and
+ * link frequency, then submits it to the device.
+ * Rest of the link parameters are left at firmware defaults.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int csi_set_link_cfg(struct icvs *ctx)
+{
+	struct icvs_cmd cmd = {
+		.cmd_id = ICVS_HOST_SET_MIPI_CONFIG,
+		.param.conf.nr_of_lanes = ctx->nr_of_lanes,
+		.param.conf.link_freq = ctx->link_freq,
+	};
+	size_t cmd_size = sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
+
+	guard(mutex)(&ctx->lock);
+	return cvs_send(ctx, &cmd, cmd_size);
+}
+
+/*
+ * Streaming
+ */
+
+/**
+ * cvs_csi_enable_streams - Start streaming through the bridge
+ * @sd: Sub-device pointer
+ * @state: Active state
+ * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
+ * @streams_mask: Streams to enable (bit 0 supported)
+ *
+ * Runtime-resumes the bridge (triggering cvs_runtime_resume() to claim CSI-2
+ * link ownership), fetches the link frequency, programs the MIPI configuration,
+ * and forwards the enable request downstream.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct icvs *ctx = sd_to_csi(sd);
+	struct v4l2_subdev *remote_sd =
+			    media_entity_to_v4l2_subdev(ctx->remote->entity);
+	struct device *dev = cvs_dev(ctx);
+	s64 freq;
+	int ret;
+
+	/* cvs_set_link_owner(ICVS_CSI_LINK_HOST) */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
+
+	freq = v4l2_get_link_freq(ctx->remote, 0, 0);
+	if (freq < 0) {
+		ret = freq;
+		goto err_rpm_put;
+	}
+	ctx->link_freq = freq;
+
+	if (ctx->i2c_client) {
+		ret = csi_set_link_cfg(ctx);
+		if (ret < 0)
+			goto err_rpm_put_sync;
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd,
+					 ctx->remote->index,
+					 streams_mask);
+	if (ret)
+		goto err_rpm_put_sync;
+
+	return 0;
+
+err_rpm_put_sync:
+	/* Bypass autosuspend to immediately release ownership on error */
+	pm_runtime_put_sync(dev);
+	return ret;
+err_rpm_put:
+	pm_runtime_put_autosuspend(dev);
+	return ret;
+}
+
+/**
+ * cvs_csi_disable_streams - Stop streaming through the bridge
+ * @sd: Sub-device pointer
+ * @state: Active state
+ * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
+ * @streams_mask: Streams to disable (bit 0 supported)
+ *
+ * Disables the remote sensor stream then drops the PM reference acquired
+ * during enable. After the autosuspend delay, cvs_runtime_suspend() will
+ * return CSI-2 link ownership to CVS firmware.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct icvs *ctx = sd_to_csi(sd);
+	struct v4l2_subdev *remote_sd =
+			    media_entity_to_v4l2_subdev(ctx->remote->entity);
+	struct device *dev = cvs_dev(ctx);
+	int ret;
+
+	ret = v4l2_subdev_disable_streams(remote_sd,
+					  ctx->remote->index,
+					  streams_mask);
+	if (ret)
+		dev_err(dev, "disable streams failed: %d\n", ret);
+
+	/* cvs_set_link_owner(ICVS_CSI_LINK_CVS) */
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+/*
+ * Pad operations / formats
+ */
+/**
+ * cvs_csi_init_state - Initialize pad formats in subdev state
+ * @sd: Sub-device
+ * @state: State container
+ *
+ * Sets all pad formats to a minimal 1x1 default.
+ *
+ * Return: 0.
+ */
+static int cvs_csi_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	for (unsigned int i = 0; i < sd->entity.num_pads; i++)
+		*v4l2_subdev_state_get_format(state, i) =
+			cvs_csi_format_mbus_default;
+
+	return 0;
+}
+
+/**
+ * cvs_csi_set_fmt - Negotiate pad format
+ * @sd: Sub-device
+ * @state: State
+ * @format: Desired / returned format
+ *
+ * Mirrors sink format onto source pad. Accepts many media bus codes, falling
+ * back to Y8 if unsupported. Normalizes field setting.
+ *
+ * Return: 0.
+ */
+static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *src =
+		v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SOURCE);
+	struct v4l2_mbus_framefmt *sink =
+		v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SINK);
+
+	if (format->pad == ICVS_CSI_PAD_SOURCE) { /* source pad mirrors sink */
+		*src = *sink;
+		return 0;
+	}
+
+	v4l_bound_align_image(&format->format.width, 1, 65536, 0,
+			      &format->format.height, 1, 65536, 0, 0);
+
+	switch (format->format.code) {
+	/* Accept a large list; default fallback to Y8 */
+	case MEDIA_BUS_FMT_RGB444_1X12:
+	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
+	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
+	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_BGR565_2X8_BE:
+	case MEDIA_BUS_FMT_BGR565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_2X8_BE:
+	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RBG888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+	case MEDIA_BUS_FMT_BGR888_1X24:
+	case MEDIA_BUS_FMT_GBR888_1X24:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB888_2X12_BE:
+	case MEDIA_BUS_FMT_RGB888_2X12_LE:
+	case MEDIA_BUS_FMT_ARGB8888_1X32:
+	case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_UV8_1X8:
+	case MEDIA_BUS_FMT_UYVY8_1_5X8:
+	case MEDIA_BUS_FMT_VYUY8_1_5X8:
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+	case MEDIA_BUS_FMT_YVYU8_1_5X8:
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_UYVY10_2X10:
+	case MEDIA_BUS_FMT_VYUY10_2X10:
+	case MEDIA_BUS_FMT_YUYV10_2X10:
+	case MEDIA_BUS_FMT_YVYU10_2X10:
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_UYVY12_2X12:
+	case MEDIA_BUS_FMT_VYUY12_2X12:
+	case MEDIA_BUS_FMT_YUYV12_2X12:
+	case MEDIA_BUS_FMT_YVYU12_2X12:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_VYUY10_1X20:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YVYU10_1X20:
+	case MEDIA_BUS_FMT_VUY8_1X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_VYUY12_1X24:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+	case MEDIA_BUS_FMT_YVYU12_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_AYUV8_1X32:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+	case MEDIA_BUS_FMT_JPEG_1X8:
+	case MEDIA_BUS_FMT_AHSV8888_1X32:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+		break;
+	default:
+		format->format.code = MEDIA_BUS_FMT_Y8_1X8;
+		break;
+	}
+
+	if (format->format.field == V4L2_FIELD_ANY)
+		format->format.field = V4L2_FIELD_NONE;
+
+	*sink = format->format;
+	*src = *sink;
+
+	return 0;
+}
+
+/**
+ * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
+ * @sd: Sub-device
+ * @pad: Pad index
+ * @cfg: Returned bus config
+ *
+ * Fills lane ordering and number of lanes; retrieves link frequency from
+ * remote entity.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
+{
+	struct icvs *ctx = sd_to_csi(sd);
+	s64 freq;
+
+	cfg->type = V4L2_MBUS_CSI2_DPHY;
+	for (unsigned int i = 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
+		cfg->bus.mipi_csi2.data_lanes[i] = i + 1;
+	cfg->bus.mipi_csi2.num_data_lanes = ctx->nr_of_lanes;
+
+	freq = v4l2_get_link_freq(ctx->remote, 0, 0);
+	if (freq < 0)
+		return -EINVAL;
+
+	ctx->link_freq = freq;
+	cfg->link_freq = freq;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops cvs_csi_subdev_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops cvs_csi_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops cvs_csi_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = cvs_csi_set_fmt,
+	.get_mbus_config = cvs_csi_get_mbus_config,
+	.enable_streams = cvs_csi_enable_streams,
+	.disable_streams = cvs_csi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops cvs_csi_subdev_ops = {
+	.core = &cvs_csi_subdev_core_ops,
+	.video = &cvs_csi_video_ops,
+	.pad = &cvs_csi_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops cvs_csi_internal_ops = {
+	.init_state = cvs_csi_init_state,
+};
+
+static const struct media_entity_operations cvs_csi_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+/*
+ * Async notifier
+ */
+/**
+ * cvs_csi_notify_bound - Remote sensor bound callback
+ * @notifier: Async notifier
+ * @sd: Remote subdev
+ * @asc: Async match connection
+ *
+ * Locates the source pad of the remote sensor and creates a media link to
+ * the CVS bridge sink pad enabling it by default.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_connection *asc)
+{
+	struct icvs *ctx = notifier_to_csi(notifier);
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&sd->entity, asc->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0)
+		return pad;
+
+	ctx->remote = &sd->entity.pads[pad];
+
+	return media_create_pad_link(&sd->entity, pad, &ctx->subdev.entity,
+				     ICVS_CSI_PAD_SINK, MEDIA_LNK_FL_ENABLED |
+				     MEDIA_LNK_FL_IMMUTABLE);
+}
+
+/**
+ * cvs_csi_notify_unbind - Remote sensor unbind callback
+ * @notifier: Notifier
+ * @sd: Remote subdev
+ * @asc: Connection
+ */
+static void cvs_csi_notify_unbind(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_connection *asc)
+{
+	struct icvs *ctx = notifier_to_csi(notifier);
+
+	ctx->remote = NULL;
+}
+
+static const struct v4l2_async_notifier_operations cvs_csi_notify_ops = {
+	.bound = cvs_csi_notify_bound,
+	.unbind = cvs_csi_notify_unbind,
+};
+
+/*
+ * Controls
+ */
+/**
+ * cvs_csi_init_controls - Initialize V4L2 controls
+ * @ctx: CVS context
+ *
+ * Currently sets up a read-only privacy control placeholder.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_init_controls(struct icvs *ctx)
+{
+	struct v4l2_ctrl *privacy_ctrl;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 1);
+
+	privacy_ctrl = v4l2_ctrl_new_std(&ctx->ctrl_handler, NULL,
+					 V4L2_CID_PRIVACY, 0, 1, 1, 0);
+	if (privacy_ctrl)
+		privacy_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (ctx->ctrl_handler.error) {
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+		return ctx->ctrl_handler.error;
+	}
+
+	ctx->subdev.ctrl_handler = &ctx->ctrl_handler;
+
+	return 0;
+}
+
+/*
+ * Firmware (graph) parsing
+ */
+/**
+ * cvs_csi_parse_firmware - Parse firmware (ACPI graph) endpoints
+ * @ctx: CVS context
+ *
+ * Discovers sink and remote source endpoints, validates lane counts and
+ * registers an async notifier for the remote sensor.
+ *
+ * Return: 0 on success or negative errno.
+ */
+static int cvs_csi_parse_firmware(struct icvs *ctx)
+{
+	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
+	struct device *dev = cvs_dev(ctx);
+	struct fwnode_handle *sink_ep, *source_ep;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	sink_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	v4l2_async_subdev_nf_init(&ctx->notifier, &ctx->subdev);
+	ctx->notifier.ops = &cvs_csi_notify_ops;
+
+	ret = v4l2_fwnode_endpoint_parse(sink_ep, &ep);
+	if (ret)
+		goto err_nf_cleanup;
+
+	ctx->nr_of_lanes = ep.bus.mipi_csi2.num_data_lanes;
+	source_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0, 0);
+	ret = v4l2_fwnode_endpoint_parse(source_ep, &ep);
+	fwnode_handle_put(source_ep);
+	if (ret)
+		goto err_nf_cleanup;
+
+	if (ctx->nr_of_lanes != ep.bus.mipi_csi2.num_data_lanes) {
+		ret = -EINVAL;
+		goto err_nf_cleanup;
+	}
+
+	asc = v4l2_async_nf_add_fwnode_remote(&ctx->notifier, sink_ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto err_nf_cleanup;
+	}
+
+	ret = v4l2_async_nf_register(&ctx->notifier);
+	if (ret)
+		goto err_nf_cleanup;
+
+	fwnode_handle_put(sink_ep);
+
+	return 0;
+
+err_nf_cleanup:
+	v4l2_async_nf_cleanup(&ctx->notifier);
+	fwnode_handle_put(sink_ep);
+
+	return ret;
+}
+
+/*
+ * Public CSI init/cleanup used by core probe/remove
+ */
+/**
+ * cvs_csi_init - Initialize CSI/V4L2 sub-device side of bridge
+ * @ctx: CVS context
+ * @dev: Parent device
+ * @i2c: I2C client (may be NULL for platform mode)
+ *
+ * Sets up sub-device, media entity pads, async notifier, controls and
+ * registers with the V4L2 framework.
+ *
+ * Return: 0 on success or negative errno.
+ */
+int cvs_csi_init(struct icvs *ctx, struct device *dev, struct i2c_client *i2c)
+{
+	int ret;
+
+	if (i2c) {
+		v4l2_i2c_subdev_init(&ctx->subdev, i2c, &cvs_csi_subdev_ops);
+	} else {
+		v4l2_subdev_init(&ctx->subdev, &cvs_csi_subdev_ops);
+		ctx->subdev.dev = dev;
+	}
+
+	ctx->subdev.internal_ops = &cvs_csi_internal_ops;
+	v4l2_set_subdevdata(&ctx->subdev, ctx);
+	ctx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ctx->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	ctx->subdev.entity.ops = &cvs_csi_entity_ops;
+	snprintf(ctx->subdev.name, sizeof(ctx->subdev.name), "Intel CVS");
+
+	ret = cvs_csi_parse_firmware(ctx);
+	if (ret)
+		return ret;
+
+	ret = cvs_csi_init_controls(ctx);
+	if (ret)
+		goto err_nf_unreg;
+
+	ctx->pads[ICVS_CSI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ctx->pads[ICVS_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&ctx->subdev.entity, ICVS_CSI_NUM_PADS,
+				     ctx->pads);
+	if (ret)
+		goto err_ctrl_cleanup;
+
+	ctx->subdev.state_lock = ctx->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ctx->subdev);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_async_register_subdev(&ctx->subdev);
+	if (ret)
+		goto err_entity_cleanup;
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&ctx->subdev.entity);
+
+err_ctrl_cleanup:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+err_nf_unreg:
+	v4l2_async_nf_unregister(&ctx->notifier);
+	v4l2_async_nf_cleanup(&ctx->notifier);
+
+	return ret;
+}
+
+/**
+ * cvs_csi_remove - Cleanup CSI/V4L2 sub-device
+ * @ctx: CVS context
+ */
+void cvs_csi_remove(struct icvs *ctx)
+{
+	v4l2_async_nf_unregister(&ctx->notifier);
+	v4l2_async_nf_cleanup(&ctx->notifier);
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_async_unregister_subdev(&ctx->subdev);
+	v4l2_subdev_cleanup(&ctx->subdev);
+	media_entity_cleanup(&ctx->subdev.entity);
+}
+
+MODULE_AUTHOR("Miguel Vadillo <miguel.vadillo@intel.com>");
+MODULE_DESCRIPTION("CSI/V4L2 support for Intel Vision Sensing Controller");
+MODULE_LICENSE("GPL");
-- 
2.43.0


