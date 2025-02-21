Return-Path: <linux-media+bounces-26547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1DA3EDAF
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D264206DC
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C7D1FFC57;
	Fri, 21 Feb 2025 07:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEEy4eqE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126891FF7D6
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124407; cv=none; b=NCfgD9ZPzvAyGsBuup8sHZL2iI2Kif6LXYNtdQ0cL3sdPIUsjTCX3/KtOa1OOA45Po4pNiVkGiueTS7y+ikyXIMRwwb0PP7VNXla8/0sGupbE8IcGeDUMQ53o+MoSQd39k3Q/PU9M0bAypKbblyBQKIdZ9yZSdhCnjw2sTAR5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124407; c=relaxed/simple;
	bh=/7KKjRUKbSxQXPASxzBFSNcu34EUY/EBwTRwjkFdsWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFWyStbNihxwvM2kZuUOXj8tDWidF/WEcePn0hcw7IQPYm7XMl8moIka+psbgj8T6BmGi0rxDSdDTBTlZsxdE7oez/F+14GmDdsCIbO5vY2KwL3IOeIf97vdTu89ebPsT/Df15acfHJuT8yek+qmSp5o2k+bcaQQQY55fM8azHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEEy4eqE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124398; x=1771660398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/7KKjRUKbSxQXPASxzBFSNcu34EUY/EBwTRwjkFdsWE=;
  b=YEEy4eqECnay4mym+BOH8yEcrlEj16QJnm4jUUHFDC9+EQmCFSPt1Duh
   a7XPl5PualZxS31SowCpx5WKRFxDyXLIcARNv8zzDhIVd/2cQRoFzYlFa
   3m57kchdYTjGQ2YsoLtN7SoNRgmd+QaanetYQYGVQHmado+OASBN5KzOc
   25Avv4WW47N+kQUTn9p+vXUca4KTifqkIyA8mic3KVHvxVDFwBdyuNZF7
   +D2ldx/3U8eXFiSzvQT79Gq70DP36ltsfY+vJ32WcOWu40J0WBPUHdF6d
   NzwRQwE+i9sMvtVh1so/wZoPQgTAT4oTjZJzn4TcYmEqrw5697A+6GuQf
   A==;
X-CSE-ConnectionGUID: MknDtXmzSN69fMSsHom92w==
X-CSE-MsgGUID: yUj+pMIlQ9af34rr2GOnXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552557"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:53:17 -0800
X-CSE-ConnectionGUID: pzuA54bfTl+HZv5zFVpYVg==
X-CSE-MsgGUID: tVXajQdwTTOpFoAV+OpWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829653"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:53:13 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Cc: hans@hansg.org,
	stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [RFC PATCH 6/7] media: ipu7: add IPU7 input system device driver
Date: Fri, 21 Feb 2025 15:52:51 +0800
Message-Id: <20250221075252.3347582-7-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The main input system driver mainly cover the basic hardware setup, v4l2
devices registration, firmware stream interfaces and interrupt handling.

Input system CSI2 receiver is exposed as a v4l2 sub-device. Each CSI2
sub-device represent one single CSI2 hardware port which be linked with
external sub-device such camera sensor by linked with ISYS CSI2's sink
pad. The CSI2 source pad is linked to the sink pad of video capture device.

Register V4L2 video device and setup the VB2 queues to support video
capture. Video streaming callback will trigger the input system driver to
construct a input system stream configuration for firmware based on data
type and stream ID and then queue buffers to firmware to do capture.

IPU7 CSI-2 D-PHY hardware is a Synopsys DWC MIPI CSI2 Rx IP, the driver
program the DPHY to receive MIPI data from camera sensors.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c   |  300 +++++
 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h   |   39 +
 .../media/pci/intel/ipu7/ipu7-isys-csi-phy.c  | 1051 +++++++++++++++
 .../media/pci/intel/ipu7/ipu7-isys-csi-phy.h  |   16 +
 .../pci/intel/ipu7/ipu7-isys-csi2-regs.h      | 1197 +++++++++++++++++
 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c |  565 ++++++++
 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h |   73 +
 .../media/pci/intel/ipu7/ipu7-isys-queue.c    |  836 ++++++++++++
 .../media/pci/intel/ipu7/ipu7-isys-queue.h    |   79 ++
 .../media/pci/intel/ipu7/ipu7-isys-subdev.c   |  381 ++++++
 .../media/pci/intel/ipu7/ipu7-isys-subdev.h   |   55 +
 .../media/pci/intel/ipu7/ipu7-isys-video.c    | 1130 ++++++++++++++++
 .../media/pci/intel/ipu7/ipu7-isys-video.h    |  117 ++
 drivers/media/pci/intel/ipu7/ipu7-isys.c      | 1170 ++++++++++++++++
 drivers/media/pci/intel/ipu7/ipu7-isys.h      |  150 +++
 15 files changed, 7159 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.h

diff --git a/drivers/media/pci/intel/ipu7/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
new file mode 100644
index 000000000000..075d5b4104c7
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "abi/ipu7_fw_insys_config_abi.h"
+#include "abi/ipu7_fw_isys_abi.h"
+
+#include "ipu7.h"
+#include "ipu7-boot.h"
+#include "ipu7-bus.h"
+#include "ipu7-dma.h"
+#include "ipu7-fw-isys.h"
+#include "ipu7-isys.h"
+#include "ipu7-platform-regs.h"
+#include "ipu7-syscom.h"
+
+static const char send_msg_types[N_IPU_INSYS_SEND_TYPE][32] = {
+	"STREAM_OPEN",
+	"STREAM_START_AND_CAPTURE",
+	"STREAM_CAPTURE",
+	"STREAM_ABORT",
+	"STREAM_FLUSH",
+	"STREAM_CLOSE"
+};
+
+int ipu7_fw_isys_complex_cmd(struct ipu7_isys *isys,
+			     const unsigned int stream_handle,
+			     void *cpu_mapped_buf,
+			     dma_addr_t dma_mapped_buf,
+			     size_t size, u16 send_type)
+{
+	struct ipu7_syscom_context *ctx = isys->adev->syscom;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu7_insys_send_queue_token *token;
+
+	if (send_type >= N_IPU_INSYS_SEND_TYPE)
+		return -EINVAL;
+
+	dev_dbg(dev, "send_token: %s\n", send_msg_types[send_type]);
+
+	/*
+	 * Time to flush cache in case we have some payload. Not all messages
+	 * have that
+	 */
+	if (cpu_mapped_buf)
+		clflush_cache_range(cpu_mapped_buf, size);
+
+	token = ipu7_syscom_get_token(ctx, stream_handle +
+				      IPU_INSYS_INPUT_MSG_QUEUE);
+	if (!token)
+		return -EBUSY;
+
+	token->addr = dma_mapped_buf;
+	token->buf_handle = (unsigned long)cpu_mapped_buf;
+	token->send_type = send_type;
+	token->stream_id = stream_handle;
+	token->flag = IPU_INSYS_SEND_QUEUE_TOKEN_FLAG_NONE;
+
+	ipu7_syscom_put_token(ctx, stream_handle + IPU_INSYS_INPUT_MSG_QUEUE);
+	/* now wakeup FW */
+	ipu_buttress_wakeup_is_uc(isys->adev->isp);
+
+	return 0;
+}
+
+int ipu7_fw_isys_simple_cmd(struct ipu7_isys *isys,
+			    const unsigned int stream_handle, u16 send_type)
+{
+	return ipu7_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
+					send_type);
+}
+
+int ipu7_fw_isys_init(struct ipu7_isys *isys)
+{
+	struct syscom_queue_config *queue_configs;
+	struct ipu7_bus_device *adev = isys->adev;
+	struct device *dev = &adev->auxdev.dev;
+	struct ipu7_insys_config *isys_config;
+	struct ipu7_syscom_context *syscom;
+	dma_addr_t isys_config_dma_addr;
+	unsigned int i, num_queues;
+	u32 freq;
+	u8 major;
+	int ret;
+
+	/* Allocate and init syscom context. */
+	syscom = devm_kzalloc(dev, sizeof(struct ipu7_syscom_context),
+			      GFP_KERNEL);
+	if (!syscom)
+		return -ENOMEM;
+
+	adev->syscom = syscom;
+	syscom->num_input_queues = IPU_INSYS_MAX_INPUT_QUEUES;
+	syscom->num_output_queues = IPU_INSYS_MAX_OUTPUT_QUEUES;
+	num_queues = syscom->num_input_queues + syscom->num_output_queues;
+	queue_configs = devm_kzalloc(dev, FW_QUEUE_CONFIG_SIZE(num_queues),
+				     GFP_KERNEL);
+	if (!queue_configs) {
+		ipu7_fw_isys_release(isys);
+		return -ENOMEM;
+	}
+	syscom->queue_configs = queue_configs;
+	queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].max_capacity =
+		IPU_ISYS_SIZE_RECV_QUEUE;
+	queue_configs[IPU_INSYS_OUTPUT_MSG_QUEUE].token_size_in_bytes =
+		sizeof(struct ipu7_insys_resp);
+	queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].max_capacity =
+		IPU_ISYS_SIZE_LOG_QUEUE;
+	queue_configs[IPU_INSYS_OUTPUT_LOG_QUEUE].token_size_in_bytes =
+		sizeof(struct ipu7_insys_resp);
+	queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].max_capacity = 0;
+	queue_configs[IPU_INSYS_OUTPUT_RESERVED_QUEUE].token_size_in_bytes = 0;
+
+	queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].max_capacity =
+		IPU_ISYS_MAX_STREAMS;
+	queue_configs[IPU_INSYS_INPUT_DEV_QUEUE].token_size_in_bytes =
+		sizeof(struct ipu7_insys_send_queue_token);
+
+	for (i = IPU_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
+		queue_configs[i].max_capacity = IPU_ISYS_SIZE_SEND_QUEUE;
+		queue_configs[i].token_size_in_bytes =
+			sizeof(struct ipu7_insys_send_queue_token);
+	}
+
+	/* Allocate ISYS subsys config. */
+	isys_config = ipu7_dma_alloc(adev, sizeof(struct ipu7_insys_config),
+				     &isys_config_dma_addr, GFP_KERNEL, 0);
+	if (!isys_config) {
+		dev_err(dev, "Failed to allocate isys subsys config.\n");
+		ipu7_fw_isys_release(isys);
+		return -ENOMEM;
+	}
+	isys->subsys_config = isys_config;
+	isys->subsys_config_dma_addr = isys_config_dma_addr;
+	memset(isys_config, 0, sizeof(struct ipu7_insys_config));
+	isys_config->logger_config.use_source_severity = 0;
+	isys_config->logger_config.use_channels_enable_bitmask = 1;
+	isys_config->logger_config.channels_enable_bitmask =
+		LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK;
+	isys_config->logger_config.hw_printf_buffer_base_addr = 0U;
+	isys_config->logger_config.hw_printf_buffer_size_bytes = 0U;
+	isys_config->wdt_config.wdt_timer1_us = 0;
+	isys_config->wdt_config.wdt_timer2_us = 0;
+	ret = ipu_buttress_get_isys_freq(adev->isp, &freq);
+	if (ret) {
+		dev_err(dev, "Failed to get ISYS frequency.\n");
+		ipu7_fw_isys_release(isys);
+		return ret;
+	}
+
+	ipu7_dma_sync_single(adev, isys_config_dma_addr,
+			     sizeof(struct ipu7_insys_config));
+
+	major = is_ipu8(adev->isp->hw_ver) ? 2U : 1U;
+	ret = ipu7_boot_init_boot_config(adev, queue_configs, num_queues,
+					 freq, isys_config_dma_addr, major);
+	if (ret)
+		ipu7_fw_isys_release(isys);
+
+	return ret;
+}
+
+void ipu7_fw_isys_release(struct ipu7_isys *isys)
+{
+	struct ipu7_bus_device *adev = isys->adev;
+
+	ipu7_boot_release_boot_config(adev);
+	if (isys->subsys_config) {
+		ipu7_dma_free(adev,
+			      sizeof(struct ipu7_insys_config),
+			      isys->subsys_config,
+			      isys->subsys_config_dma_addr, 0);
+		isys->subsys_config = NULL;
+		isys->subsys_config_dma_addr = 0;
+	}
+}
+
+int ipu7_fw_isys_open(struct ipu7_isys *isys)
+{
+	return ipu7_boot_start_fw(isys->adev);
+}
+
+int ipu7_fw_isys_close(struct ipu7_isys *isys)
+{
+	return ipu7_boot_stop_fw(isys->adev);
+}
+
+struct ipu7_insys_resp *ipu7_fw_isys_get_resp(struct ipu7_isys *isys)
+{
+	return ipu7_syscom_get_token(isys->adev->syscom,
+				     IPU_INSYS_OUTPUT_MSG_QUEUE);
+}
+
+void ipu7_fw_isys_put_resp(struct ipu7_isys *isys)
+{
+	ipu7_syscom_put_token(isys->adev->syscom, IPU_INSYS_OUTPUT_MSG_QUEUE);
+}
+
+void ipu7_fw_isys_dump_stream_cfg(struct device *dev,
+				  struct ipu7_insys_stream_cfg *cfg)
+{
+	unsigned int i;
+
+	dev_dbg(dev, "---------------------------\n");
+	dev_dbg(dev, "IPU_FW_ISYS_STREAM_CFG_DATA\n");
+
+	dev_dbg(dev, ".port id %d\n", cfg->port_id);
+	dev_dbg(dev, ".vc %d\n", cfg->vc);
+	dev_dbg(dev, ".nof_input_pins = %d\n", cfg->nof_input_pins);
+	dev_dbg(dev, ".nof_output_pins = %d\n", cfg->nof_output_pins);
+	dev_dbg(dev, ".stream_msg_map = 0x%x\n", cfg->stream_msg_map);
+
+	for (i = 0; i < cfg->nof_input_pins; i++) {
+		dev_dbg(dev, ".input_pin[%d]:\n", i);
+		dev_dbg(dev, "\t.dt = 0x%0x\n",
+			cfg->input_pins[i].dt);
+		dev_dbg(dev, "\t.disable_mipi_unpacking = %d\n",
+			cfg->input_pins[i].disable_mipi_unpacking);
+		dev_dbg(dev, "\t.dt_rename_mode = %d\n",
+			cfg->input_pins[i].dt_rename_mode);
+		dev_dbg(dev, "\t.mapped_dt = 0x%0x\n",
+			cfg->input_pins[i].mapped_dt);
+		dev_dbg(dev, "\t.input_res = %d x %d\n",
+			cfg->input_pins[i].input_res.width,
+			cfg->input_pins[i].input_res.height);
+		dev_dbg(dev, "\t.sync_msg_map = 0x%x\n",
+			cfg->input_pins[i].sync_msg_map);
+	}
+
+	for (i = 0; i < cfg->nof_output_pins; i++) {
+		dev_dbg(dev, ".output_pin[%d]:\n", i);
+		dev_dbg(dev, "\t.input_pin_id = %d\n",
+			cfg->output_pins[i].input_pin_id);
+		dev_dbg(dev, "\t.stride = %d\n", cfg->output_pins[i].stride);
+		dev_dbg(dev, "\t.send_irq = %d\n",
+			cfg->output_pins[i].send_irq);
+		dev_dbg(dev, "\t.ft = %d\n", cfg->output_pins[i].ft);
+
+		dev_dbg(dev, "\t.link.buffer_lines = %d\n",
+			cfg->output_pins[i].link.buffer_lines);
+		dev_dbg(dev, "\t.link.foreign_key = %d\n",
+			cfg->output_pins[i].link.foreign_key);
+		dev_dbg(dev, "\t.link.granularity_pointer_update = %d\n",
+			cfg->output_pins[i].link.granularity_pointer_update);
+		dev_dbg(dev, "\t.link.msg_link_streaming_mode = %d\n",
+			cfg->output_pins[i].link.msg_link_streaming_mode);
+		dev_dbg(dev, "\t.link.pbk_id = %d\n",
+			cfg->output_pins[i].link.pbk_id);
+		dev_dbg(dev, "\t.link.pbk_slot_id = %d\n",
+			cfg->output_pins[i].link.pbk_slot_id);
+		dev_dbg(dev, "\t.link.dest = %d\n",
+			cfg->output_pins[i].link.dest);
+		dev_dbg(dev, "\t.link.use_sw_managed = %d\n",
+			cfg->output_pins[i].link.use_sw_managed);
+		dev_dbg(dev, "\t.link.is_snoop = %d\n",
+			cfg->output_pins[i].link.is_snoop);
+
+		dev_dbg(dev, "\t.crop.line_top = %d\n",
+			cfg->output_pins[i].crop.line_top);
+		dev_dbg(dev, "\t.crop.line_bottom = %d\n",
+			cfg->output_pins[i].crop.line_bottom);
+
+		dev_dbg(dev, "\t.dpcm_enable = %d\n",
+			cfg->output_pins[i].dpcm.enable);
+		dev_dbg(dev, "\t.dpcm.type = %d\n",
+			cfg->output_pins[i].dpcm.type);
+		dev_dbg(dev, "\t.dpcm.predictor = %d\n",
+			cfg->output_pins[i].dpcm.predictor);
+	}
+	dev_dbg(dev, "---------------------------\n");
+}
+
+void ipu7_fw_isys_dump_frame_buff_set(struct device *dev,
+				      struct ipu7_insys_buffset *buf,
+				      unsigned int outputs)
+{
+	unsigned int i;
+
+	dev_dbg(dev, "--------------------------\n");
+	dev_dbg(dev, "IPU_ISYS_BUFF_SET\n");
+	dev_dbg(dev, ".capture_msg_map = %d\n", buf->capture_msg_map);
+	dev_dbg(dev, ".frame_id = %d\n", buf->frame_id);
+	dev_dbg(dev, ".skip_frame = %d\n", buf->skip_frame);
+
+	for (i = 0; i < outputs; i++) {
+		dev_dbg(dev, ".output_pin[%d]:\n", i);
+		dev_dbg(dev, "\t.user_token = %llx\n",
+			buf->output_pins[i].user_token);
+		dev_dbg(dev, "\t.addr = 0x%x\n", buf->output_pins[i].addr);
+	}
+	dev_dbg(dev, "---------------------------\n");
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
new file mode 100644
index 000000000000..3721aeaaef87
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_FW_ISYS_H
+#define IPU7_FW_ISYS_H
+
+#include <linux/types.h>
+
+#include "abi/ipu7_fw_isys_abi.h"
+
+struct device;
+struct ipu7_insys_buffset;
+struct ipu7_insys_stream_cfg;
+struct ipu7_isys;
+
+/* From here on type defines not coming from the ISYSAPI interface */
+
+int ipu7_fw_isys_init(struct ipu7_isys *isys);
+void ipu7_fw_isys_release(struct ipu7_isys *isys);
+int ipu7_fw_isys_open(struct ipu7_isys *isys);
+int ipu7_fw_isys_close(struct ipu7_isys *isys);
+
+void ipu7_fw_isys_dump_stream_cfg(struct device *dev,
+				  struct ipu7_insys_stream_cfg *cfg);
+void ipu7_fw_isys_dump_frame_buff_set(struct device *dev,
+				      struct ipu7_insys_buffset *buf,
+				      unsigned int outputs);
+int ipu7_fw_isys_simple_cmd(struct ipu7_isys *isys,
+			    const unsigned int stream_handle, u16 send_type);
+int ipu7_fw_isys_complex_cmd(struct ipu7_isys *isys,
+			     const unsigned int stream_handle,
+			     void *cpu_mapped_buf,
+			     dma_addr_t dma_mapped_buf,
+			     size_t size, u16 send_type);
+struct ipu7_insys_resp *ipu7_fw_isys_get_resp(struct ipu7_isys *isys);
+void ipu7_fw_isys_put_resp(struct ipu7_isys *isys);
+#endif
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c b/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
new file mode 100644
index 000000000000..19fcce7c9d1c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
@@ -0,0 +1,1051 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-device.h>
+
+#include "ipu7.h"
+#include "ipu7-bus.h"
+#include "ipu7-buttress.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-csi2.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-platform-regs.h"
+#include "ipu7-isys-csi-phy.h"
+
+#define PORT_A	0
+#define PORT_B	1
+#define PORT_C	2
+#define PORT_D	3
+
+struct ddlcal_counter_ref_s {
+	u16 min_mbps;
+	u16 max_mbps;
+
+	u16 ddlcal_counter_ref;
+};
+
+struct ddlcal_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 oa_lanex_hsrx_cdphy_sel_fast;
+	u16 ddlcal_max_phase;
+	u16 phase_bound;
+	u16 ddlcal_dll_fbk;
+	u16 ddlcal_ddl_coarse_bank;
+	u16 fjump_deskew;
+	u16 min_eye_opening_deskew;
+};
+
+struct i_thssettle_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 i_thssettle;
+};
+
+struct i_coarse_target_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 i_coarse_target;
+};
+
+struct post_thres_params {
+	u16 min_mbps;
+	u16 max_mbps;
+
+	u16 post_received_reset_thresh;
+	u16 post_det_delay_thresh;
+};
+
+ /* lane2 for 4l3t, lane1 for 2l2t */
+struct oa_lane_clk_div_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 oa_lane_hsrx_hs_clk_div;
+};
+
+struct des_delay_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 deserializer_en_delay_deass_thresh;
+};
+
+struct cdr_fbk_cap_prog_params {
+	u16 min_mbps;
+	u16 max_mbps;
+	u16 val;
+};
+
+static const struct ddlcal_counter_ref_s table0[] = {
+	{1500, 1999, 118},
+	{2000, 2499, 157},
+	{2500, 3499, 196},
+	{3500, 4499, 274},
+	{4500, 4500, 352},
+	{}
+};
+
+static const struct ddlcal_params table1[] = {
+	{1500, 1587, 0, 143, 167, 17, 3, 4, 29},
+	{1588, 1687, 0, 135, 167, 15, 3, 4, 27},
+	{1688, 1799, 0, 127, 135, 15, 2, 4, 26},
+	{1800, 1928, 0, 119, 135, 13, 2, 3, 24},
+	{1929, 2076, 0, 111, 135, 13, 2, 3, 23},
+	{2077, 2249, 0, 103, 135, 11, 2, 3, 21},
+	{2250, 2454, 0, 95, 103, 11, 1, 3, 19},
+	{2455, 2699, 0, 87, 103, 9, 1, 3, 18},
+	{2700, 2999, 0, 79, 103, 9, 1, 2, 16},
+	{3000, 3229, 0, 71, 71, 7, 1, 2, 15},
+	{3230, 3599, 1, 87, 103, 9, 1, 3, 18},
+	{3600, 3999, 1, 79, 103, 9, 1, 2, 16},
+	{4000, 4499, 1, 71, 103, 7, 1, 2, 15},
+	{4500, 4500, 1, 63, 71, 7, 0, 2, 13},
+	{}
+};
+
+static const struct i_thssettle_params table2[] = {
+	{80, 124, 24},
+	{125, 249, 20},
+	{250, 499, 16},
+	{500, 749, 14},
+	{750, 1499, 13},
+	{1500, 4500, 12},
+	{}
+};
+
+static const struct oa_lane_clk_div_params table6[] = {
+	{80, 159, 0x1},
+	{160, 319, 0x2},
+	{320, 639, 0x3},
+	{640, 1279, 0x4},
+	{1280, 2560, 0x5},
+	{2561, 4500, 0x6},
+	{}
+};
+
+static const struct cdr_fbk_cap_prog_params table7[] = {
+	{80, 919, 0},
+	{920, 1029, 1},
+	{1030, 1169, 2},
+	{1170, 1349, 3},
+	{1350, 1589, 4},
+	{1590, 1949, 5},
+	{1950, 2499, 6},
+	{}
+};
+
+enum ppi_datawidth {
+	PPI_DATAWIDTH_8BIT = 0,
+	PPI_DATAWIDTH_16BIT = 1,
+};
+
+static void dwc_phy_write(struct ipu7_isys *isys, u32 id, u32 addr, u16 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IS_IO_CDPHY_BASE(id);
+
+	dev_dbg(&isys->adev->auxdev.dev, "phy write: reg 0x%zx = data 0x%04x",
+		base + addr - isys_base, data);
+	writew(data, base + addr);
+}
+
+static u16 dwc_phy_read(struct ipu7_isys *isys, u32 id, u32 addr)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IS_IO_CDPHY_BASE(id);
+	u16 data;
+
+	data = readw(base + addr);
+	dev_dbg(&isys->adev->auxdev.dev, "phy read: reg 0x%zx = data 0x%04x",
+		base + addr - isys_base, data);
+
+	return data;
+}
+
+static void dwc_csi_write(struct ipu7_isys *isys, u32 id, u32 addr, u32 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IS_IO_CSI2_HOST_BASE(id);
+	struct device *dev = &isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "csi write: reg 0x%zx = data 0x%08x",
+		base + addr - isys_base, data);
+	writel(data, base + addr);
+	dev_dbg(dev, "csi read: reg 0x%zx = data 0x%08x",
+		base + addr - isys_base, readl(base + addr));
+}
+
+static void gpreg_write(struct ipu7_isys *isys, u32 id, u32 addr, u32 data)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	u32 gpreg = isys->pdata->ipdata->csi2.gpreg;
+	void __iomem *base = isys_base + gpreg + 0x1000 * id;
+	struct device *dev = &isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "gpreg write: reg 0x%zx = data 0x%08x",
+		base + addr - isys_base, data);
+	writel(data, base + addr);
+	dev_dbg(dev, "gpreg read: reg 0x%zx = data 0x%08x",
+		base + addr - isys_base, readl(base + addr));
+}
+
+static u32 dwc_csi_read(struct ipu7_isys *isys, u32 id, u32 addr)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	void __iomem *base = isys_base + IS_IO_CSI2_HOST_BASE(id);
+	u32 data;
+
+	data = readl(base + addr);
+	dev_dbg(&isys->adev->auxdev.dev, "csi read: reg 0x%zx = data 0x%x",
+		base + addr - isys_base, data);
+
+	return data;
+}
+
+static void dwc_phy_write_mask(struct ipu7_isys *isys, u32 id, u32 addr,
+			       u16 val, u8 lo, u8 hi)
+{
+	u32 temp, mask;
+
+	WARN_ON(lo > hi);
+	WARN_ON(hi > 15);
+
+	mask = ((~0U - (1 << lo) + 1)) & (~0U >> (31 - hi));
+	temp = dwc_phy_read(isys, id, addr);
+	temp &= ~mask;
+	temp |= (val << lo) & mask;
+	dwc_phy_write(isys, id, addr, temp);
+}
+
+static void dwc_csi_write_mask(struct ipu7_isys *isys, u32 id, u32 addr,
+			       u32 val, u8 hi, u8 lo)
+{
+	u32 temp, mask;
+
+	WARN_ON(lo > hi);
+
+	mask = ((~0U - (1 << lo) + 1)) & (~0U >> (31 - hi));
+	temp = dwc_csi_read(isys, id, addr);
+	temp &= ~mask;
+	temp |= (val << lo) & mask;
+	dwc_csi_write(isys, id, addr, temp);
+}
+
+static void ipu7_isys_csi_ctrl_cfg(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_isys *isys = csi2->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 id, lanes, phy_mode;
+	u32 val;
+
+	id = csi2->port;
+	lanes = csi2->nlanes;
+	phy_mode = csi2->phy_mode;
+	dev_dbg(dev, "csi-%d controller init with %u lanes, phy mode %u",
+		id, lanes, phy_mode);
+
+	val = dwc_csi_read(isys, id, VERSION);
+	dev_dbg(dev, "csi-%d controller version = 0x%x", id, val);
+
+	/* num of active data lanes */
+	dwc_csi_write(isys, id, N_LANES, lanes - 1);
+	dwc_csi_write(isys, id, CDPHY_MODE, phy_mode);
+	dwc_csi_write(isys, id, VC_EXTENSION, 0);
+
+	/* only mask PHY_FATAL and PKT_FATAL interrupts */
+	dwc_csi_write(isys, id, INT_MSK_PHY_FATAL, 0xff);
+	dwc_csi_write(isys, id, INT_MSK_PKT_FATAL, 0x3);
+	dwc_csi_write(isys, id, INT_MSK_PHY, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_LINE, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_BNDRY_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_SEQ_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_CRC_FRAME_FATAL, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_PLD_CRC_FATAL, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_DATA_ID, 0x0);
+	dwc_csi_write(isys, id, INT_MSK_ECC_CORRECTED, 0x0);
+}
+
+static void ipu7_isys_csi_phy_reset(struct ipu7_isys *isys, u32 id)
+{
+	dwc_csi_write(isys, id, PHY_SHUTDOWNZ, 0);
+	dwc_csi_write(isys, id, DPHY_RSTZ, 0);
+	dwc_csi_write(isys, id, CSI2_RESETN, 0);
+	gpreg_write(isys, id, PHY_RESET, 0);
+	gpreg_write(isys, id, PHY_SHUTDOWN, 0);
+}
+
+#define N_DATA_IDS		8
+static DECLARE_BITMAP(data_ids, N_DATA_IDS);
+/* 8 Data ID monitors, each Data ID is composed by pair of VC and data type */
+static int __dids_config(struct ipu7_isys_csi2 *csi2, u32 id, u8 vc, u8 dt)
+{
+	struct ipu7_isys *isys = csi2->isys;
+	u32 reg, n;
+	u8 lo, hi;
+	int ret;
+
+	dev_dbg(&isys->adev->auxdev.dev, "config CSI-%u with vc:%u dt:0x%02x\n",
+		id, vc, dt);
+
+	dwc_csi_write(isys, id, VC_EXTENSION, 0x0);
+	n = find_first_zero_bit(data_ids, N_DATA_IDS);
+	if (n == N_DATA_IDS)
+		return -ENOSPC;
+
+	ret = test_and_set_bit(n, data_ids);
+	if (ret)
+		return -EBUSY;
+
+	reg = n < 4 ? DATA_IDS_VC_1 : DATA_IDS_VC_2;
+	lo = (n % 4) * 8;
+	hi = lo + 4;
+	dwc_csi_write_mask(isys, id, reg, vc & GENMASK(4, 0), hi, lo);
+
+	reg = n < 4 ? DATA_IDS_1 : DATA_IDS_2;
+	lo = (n % 4) * 8;
+	hi = lo + 5;
+	dwc_csi_write_mask(isys, id, reg, dt & GENMASK(5, 0), hi, lo);
+
+	return 0;
+}
+
+static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
+{
+	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_subdev *ext_sd;
+	struct media_pad *pad;
+	unsigned int i;
+	int ret;
+
+	pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	if (IS_ERR(pad)) {
+		dev_warn(dev, "can't get remote source pad of %s (%ld)\n",
+			 csi2->asd.sd.name, PTR_ERR(pad));
+		return PTR_ERR(pad);
+	}
+
+	ext_sd = media_entity_to_v4l2_subdev(pad->entity);
+	if (WARN(!ext_sd, "Failed to get subdev for entity %s\n",
+		 pad->entity->name))
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(ext_sd, pad, get_frame_desc, pad->index, &desc);
+	if (ret)
+		return ret;
+
+	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_warn(dev, "Unsupported frame descriptor type\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < desc.num_entries; i++) {
+		desc_entry = &desc.entry[i];
+		if (desc_entry->bus.csi2.vc < NR_OF_CSI2_VC) {
+			ret = __dids_config(csi2, id, desc_entry->bus.csi2.vc,
+					    desc_entry->bus.csi2.dt);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+#define CDPHY_TIMEOUT (5000000)
+static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
+{
+	void __iomem *isys_base = isys->pdata->base;
+	u32 gpreg_offset = isys->pdata->ipdata->csi2.gpreg;
+	void __iomem *gpreg = isys_base + gpreg_offset + 0x1000 * id;
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i;
+	u32 phy_ready;
+	u32 reg, rext;
+	int ret;
+
+	dev_dbg(dev, "waiting phy ready...\n");
+	ret = readl_poll_timeout(gpreg + PHY_READY, phy_ready,
+				 phy_ready & BIT(0) && phy_ready != ~0U,
+				 100, CDPHY_TIMEOUT);
+	dev_dbg(dev, "phy %u ready = 0x%08x\n", id, readl(gpreg + PHY_READY));
+	dev_dbg(dev, "csi %u PHY_RX = 0x%08x\n", id,
+		dwc_csi_read(isys, id, PHY_RX));
+	dev_dbg(dev, "csi %u PHY_STOPSTATE = 0x%08x\n", id,
+		dwc_csi_read(isys, id, PHY_STOPSTATE));
+	dev_dbg(dev, "csi %u PHY_CAL = 0x%08x\n", id,
+		dwc_csi_read(isys, id, PHY_CAL));
+	for (i = 0; i < 4; i++) {
+		reg = CORE_DIG_DLANE_0_R_HS_RX_0 + (i * 0x400);
+		dev_dbg(dev, "phy %u DLANE%u skewcal = 0x%04x\n",
+			id, i, dwc_phy_read(isys, id, reg));
+	}
+	dev_dbg(dev, "phy %u DDLCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_5));
+	dev_dbg(dev, "phy %u TERMCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, PPI_R_TERMCAL_DEBUG_0));
+	dev_dbg(dev, "phy %u LPDCOCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, PPI_R_LPDCOCAL_DEBUG_RB));
+	dev_dbg(dev, "phy %u HSDCOCAL = 0x%04x\n", id,
+		dwc_phy_read(isys, id, PPI_R_HSDCOCAL_DEBUG_RB));
+	dev_dbg(dev, "phy %u LPDCOCAL_VT = 0x%04x\n", id,
+		dwc_phy_read(isys, id, PPI_R_LPDCOCAL_DEBUG_VT));
+
+	if (!ret) {
+		if (id) {
+			dev_dbg(dev, "ignore phy %u rext\n", id);
+			return 0;
+		}
+
+		rext = dwc_phy_read(isys, id,
+				    CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15) & 0xf;
+		dev_dbg(dev, "phy %u rext value = %u\n", id, rext);
+		isys->phy_rext_cal = rext;
+
+		if (!isys->phy_rext_cal)
+			isys->phy_rext_cal = 5;
+
+		return 0;
+	}
+
+	dev_err(dev, "wait phy ready timeout!\n");
+
+	return ret;
+}
+
+#define lookup(table, mbps)				\
+({							\
+	unsigned int i_;				\
+	u16 mbps_ = (u16)(mbps);			\
+	for (i_ = 0; i_ < ARRAY_SIZE((table)); i_++) {	\
+		if (mbps_ >= (table)[i_].min_mbps &&	\
+		    mbps_ <= (table)[i_].max_mbps)	\
+			break;				\
+	}						\
+	(i_ == ARRAY_SIZE((table))) ? -ENXIO : i_;	\
+})
+
+static const u16 deskew_fine_mem[] = {
+	0x0404, 0x040c, 0x0414, 0x041c,
+	0x0423, 0x0429, 0x0430, 0x043a,
+	0x0445, 0x044a, 0x0450, 0x045a,
+	0x0465, 0x0469, 0x0472, 0x047a,
+	0x0485, 0x0489, 0x0490, 0x049a,
+	0x04a4, 0x04ac, 0x04b4, 0x04bc,
+	0x04c4, 0x04cc, 0x04d4, 0x04dc,
+	0x04e4, 0x04ec, 0x04f4, 0x04fc,
+	0x0504, 0x050c, 0x0514, 0x051c,
+	0x0523, 0x0529, 0x0530, 0x053a,
+	0x0545, 0x054a, 0x0550, 0x055a,
+	0x0565, 0x0569, 0x0572, 0x057a,
+	0x0585, 0x0589, 0x0590, 0x059a,
+	0x05a4, 0x05ac, 0x05b4, 0x05bc,
+	0x05c4, 0x05cc, 0x05d4, 0x05dc,
+	0x05e4, 0x05ec, 0x05f4, 0x05fc,
+	0x0604, 0x060c, 0x0614, 0x061c,
+	0x0623, 0x0629, 0x0632, 0x063a,
+	0x0645, 0x064a, 0x0650, 0x065a,
+	0x0665, 0x0669, 0x0672, 0x067a,
+	0x0685, 0x0689, 0x0690, 0x069a,
+	0x06a4, 0x06ac, 0x06b4, 0x06bc,
+	0x06c4, 0x06cc, 0x06d4, 0x06dc,
+	0x06e4, 0x06ec, 0x06f4, 0x06fc,
+	0x0704, 0x070c, 0x0714, 0x071c,
+	0x0723, 0x072a, 0x0730, 0x073a,
+	0x0745, 0x074a, 0x0750, 0x075a,
+	0x0765, 0x0769, 0x0772, 0x077a,
+	0x0785, 0x0789, 0x0790, 0x079a,
+	0x07a4, 0x07ac, 0x07b4, 0x07bc,
+	0x07c4, 0x07cc, 0x07d4, 0x07dc,
+	0x07e4, 0x07ec, 0x07f4, 0x07fc,
+};
+
+static void ipu7_isys_dphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
+				  bool aggregation, u64 mbps)
+{
+	u16 hsrxval0, hsrxval1, hsrxval2;
+	int index;
+	u16 reg;
+	u16 val;
+	u32 i;
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_7, 0, 0, 9);
+	if (mbps > 1500)
+		dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_7,
+				   40, 0, 7);
+	else
+		dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_7,
+				   104, 0, 7);
+
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_8, 80, 0, 7);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_0, 191, 0, 9);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_7, 34, 7, 12);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_1, 38, 8, 15);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_2, 4, 12, 15);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_2, 2, 10, 11);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_2, 1, 8, 8);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_2, 38, 0, 7);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_2, 1, 9, 9);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_4, 10, 0, 9);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_6, 20, 0, 9);
+	dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_7, 19, 0, 6);
+
+	index = lookup(table0, mbps);
+	if (index >= 0)
+		dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_3,
+				   table0[index].ddlcal_counter_ref, 0, 9);
+
+	index = lookup(table1, mbps);
+	if (index >= 0) {
+		dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_1,
+				   table1[index].phase_bound, 0, 7);
+		dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_5,
+				   table1[index].ddlcal_dll_fbk, 4, 9);
+		dwc_phy_write_mask(isys, id, PPI_RW_DDLCAL_CFG_5,
+				   table1[index].ddlcal_ddl_coarse_bank, 0, 3);
+
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_8;
+		val = table1[index].oa_lanex_hsrx_cdphy_sel_fast;
+		for (i = 0; i < lanes + 1; i++)
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   12, 12);
+	}
+
+	reg = CORE_DIG_DLANE_0_RW_LP_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2,
+			   0, 0, 0);
+	if (!is_ipu7(isys->adev->isp->hw_ver) ||
+	    id == PORT_B || id == PORT_C) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2,
+				   1, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2,
+				   0, 0, 0);
+	} else {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2,
+				   0, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2,
+				   1, 0, 0);
+	}
+
+	if (lanes == 4 && is_ipu7(isys->adev->isp->hw_ver)) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2,
+				   0, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2,
+				   0, 0, 0);
+	}
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_6, 1, 0, 2);
+	dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_6, 1, 3, 5);
+
+	reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_12;
+	val = (mbps > 1500) ? 0 : 1;
+	for (i = 0; i < lanes + 1; i++) {
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), !val, 3, 3);
+	}
+
+	reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_13;
+	val = (mbps > 1500) ? 0 : 1;
+	for (i = 0; i < lanes + 1; i++) {
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 3, 3);
+	}
+
+	index = lookup(table6, mbps);
+	if (index >= 0) {
+		val = table6[index].oa_lane_hsrx_hs_clk_div;
+		if (!is_ipu7(isys->adev->isp->hw_ver) ||
+		    id == PORT_B || id == PORT_C)
+			reg = CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9;
+		else
+			reg = CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9;
+
+		dwc_phy_write_mask(isys, id, reg, val, 5, 7);
+	}
+
+	if (aggregation) {
+		dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_0, 1,
+				   1, 1);
+
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, 3, 3, 4);
+
+		val = (id == PORT_A) ? 3 : 0;
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, val, 3, 4);
+
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15;
+		dwc_phy_write_mask(isys, id, reg, 3, 3, 4);
+	}
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_DLANE_CLK_RW_HS_RX_0, 28, 0, 7);
+	dwc_phy_write_mask(isys, id, CORE_DIG_DLANE_CLK_RW_HS_RX_7, 6, 0, 7);
+
+	index = lookup(table2, mbps);
+	if (index >= 0) {
+		val = table2[index].i_thssettle;
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_0;
+		for (i = 0; i < lanes; i++)
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   8, 15);
+	}
+
+	/* deskew */
+	for (i = 0; i < lanes; i++) {
+		reg = CORE_DIG_DLANE_0_RW_CFG_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+				   ((mbps > 1500) ? 0x1 : 0x2), 2, 3);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_2;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+				   ((mbps > 2500) ? 0 : 1), 15, 15);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 13, 13);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 7, 9, 12);
+
+		reg = CORE_DIG_DLANE_0_RW_LP_0;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 12, 15);
+
+		reg = CORE_DIG_DLANE_0_RW_LP_2;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 0, 0);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 16, 0, 7);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_3;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 2, 0, 2);
+		index = lookup(table1, mbps);
+		if (index >= 0) {
+			val = table1[index].fjump_deskew;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   3, 8);
+		}
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_4;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 150, 0, 15);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_5;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 0, 7);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 8, 15);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_6;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 2, 0, 7);
+		index = lookup(table1, mbps);
+		if (index >= 0) {
+			val = table1[index].min_eye_opening_deskew;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400), val,
+					   8, 15);
+		}
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_7;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 13, 13);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 0, 15, 15);
+
+		reg = CORE_DIG_DLANE_0_RW_HS_RX_9;
+		index = lookup(table1, mbps);
+		if (index >= 0) {
+			val = table1[index].ddlcal_max_phase;
+			dwc_phy_write_mask(isys, id, reg + (i * 0x400),
+					   val, 0, 7);
+		}
+	}
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_DLANE_CLK_RW_LP_0, 1, 12, 15);
+	dwc_phy_write_mask(isys, id, CORE_DIG_DLANE_CLK_RW_LP_2, 0, 0, 0);
+
+	for (i = 0; i < ARRAY_SIZE(deskew_fine_mem); i++)
+		dwc_phy_write_mask(isys, id, CORE_DIG_COMMON_RW_DESKEW_FINE_MEM,
+				   deskew_fine_mem[i], 0, 15);
+
+	if (mbps <= 1500) {
+		hsrxval0 = 0;
+		hsrxval1 = 0;
+		hsrxval2 = 0;
+	}
+
+	if (mbps > 1500) {
+		hsrxval0 = 4;
+		hsrxval1 = 0;
+		hsrxval2 = 3;
+	}
+
+	if (mbps > 2500)
+		hsrxval1 = 2;
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9,
+			   hsrxval0, 0, 2);
+	if (lanes == 4 && is_ipu7(isys->adev->isp->hw_ver)) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9,
+				   hsrxval0, 0, 2);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9,
+				   hsrxval0, 0, 2);
+	}
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9,
+			   hsrxval1, 3, 4);
+	if (lanes == 4 && is_ipu7(isys->adev->isp->hw_ver)) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9,
+				   hsrxval1, 3, 4);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9,
+				   hsrxval1, 3, 4);
+	}
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15,
+			   hsrxval2, 0, 2);
+	if (lanes == 4 && is_ipu7(isys->adev->isp->hw_ver)) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_15,
+				   hsrxval2, 0, 2);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_15,
+				   hsrxval2, 0, 2);
+	}
+
+	/* force and override rext */
+	if (isys->phy_rext_cal && id) {
+		dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_8,
+				   isys->phy_rext_cal, 0, 3);
+		dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
+				   1, 11, 11);
+	}
+}
+
+static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
+				  bool aggregation, u64 mbps)
+{
+	u16 coarse_target;
+	u16 deass_thresh;
+	u16 delay_thresh;
+	u16 reset_thresh;
+	u16 equalizer;
+	u16 cap_prog;
+	u16 gmode;
+	u16 reg;
+	u16 val;
+	u32 i;
+	u32 r;
+	int index;
+
+	if (is_ipu7p5(isys->adev->isp->hw_ver))
+		val = 0x15;
+	else
+		val = 0x155;
+
+	dwc_phy_write_mask(isys, id, CORE_DIG_RW_COMMON_7, val, 0, 9);
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_7, 104, 0, 7);
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_8, 16, 0, 7);
+
+	reg = CORE_DIG_CLANE_0_RW_LP_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
+
+	val = (mbps > 900U) ? 1U : 0U;
+	for (i = 0; i < lanes; i++) {
+		reg = CORE_DIG_CLANE_0_RW_HS_RX_0;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 0, 0);
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), val, 1, 1);
+
+		reg = CORE_DIG_CLANE_0_RW_HS_RX_1;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
+
+		reg = CORE_DIG_CLANE_0_RW_HS_RX_5;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 38, 0, 15);
+
+		reg = CORE_DIG_CLANE_0_RW_HS_RX_6;
+		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 10, 0, 15);
+	}
+
+	/*
+	 * Below 900Msps, always use the same value.
+	 * The formula is suitable for data rate 80-3500Msps.
+	 * Timebase (us) = 1, DIV = 32, TDDL (UI) = 0.5
+	 */
+	if (mbps >= 80U) {
+		coarse_target = (u16)div_u64_rem(mbps, 16, &r);
+		if (!r)
+			coarse_target--;
+	} else {
+		coarse_target = 56;
+	}
+
+	for (i = 0; i < lanes; i++) {
+		reg = CORE_DIG_CLANE_0_RW_HS_RX_2 + i * 0x400;
+		dwc_phy_write_mask(isys, id, reg, coarse_target, 0, 15);
+	}
+
+	dwc_phy_write_mask(isys, id,
+			   CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2, 1, 0, 0);
+	dwc_phy_write_mask(isys, id,
+			   CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2, 0, 0, 0);
+	dwc_phy_write_mask(isys, id,
+			   CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2, 1, 0, 0);
+
+	if (!is_ipu7p5(isys->adev->isp->hw_ver) && lanes == 4) {
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2,
+				   1, 0, 0);
+		dwc_phy_write_mask(isys, id,
+				   CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2,
+				   0, 0, 0);
+	}
+
+	for (i = 0; i < lanes; i++) {
+		reg = CORE_DIG_RW_TRIO0_0 + i * 0x400;
+		dwc_phy_write_mask(isys, id, reg, 1, 6, 8);
+		dwc_phy_write_mask(isys, id, reg, 1, 3, 5);
+		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
+	}
+
+	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
+	if (r != 0)
+		deass_thresh++;
+
+	reg = CORE_DIG_RW_TRIO0_2;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   deass_thresh, 0, 7);
+
+	delay_thresh =
+		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
+
+	if (delay_thresh < 1)
+		delay_thresh = 1;
+
+	reg = CORE_DIG_RW_TRIO0_1;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   delay_thresh, 0, 15);
+
+	reset_thresh = (u16)div_u64_rem(2U * 5U * mbps, 7U * 1000U, &r);
+	if (!r)
+		reset_thresh--;
+
+	if (reset_thresh < 1)
+		reset_thresh = 1;
+
+	reg = CORE_DIG_RW_TRIO0_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
+				   reset_thresh, 9, 11);
+
+	reg = CORE_DIG_CLANE_0_RW_LP_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 1, 12, 15);
+
+	reg = CORE_DIG_CLANE_0_RW_LP_2;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 0, 0, 0);
+
+	reg = CORE_DIG_CLANE_0_RW_HS_RX_0;
+	for (i = 0; i < lanes; i++)
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 12, 2, 6);
+
+	equalizer = 4U;
+	gmode = 0U;
+	cap_prog = 6U;
+
+	index = lookup(table7, mbps);
+	if (index >= 0)
+		cap_prog = table7[index].val;
+
+	for (i = 0; i < lanes; i++) {
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9 + 0x400 * i;
+		dwc_phy_write_mask(isys, id, reg, equalizer, 0, 2);
+		dwc_phy_write_mask(isys, id, reg, gmode, 3, 4);
+
+		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7 + 0x400 * i;
+		dwc_phy_write_mask(isys, id, reg, cap_prog, 10, 12);
+	}
+}
+
+static void ipu7_isys_phy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
+				 bool aggregation)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	u32 phy_mode;
+	s64 link_freq;
+	u64 mbps;
+
+	if (aggregation)
+		link_freq = ipu7_isys_csi2_get_link_freq(&isys->csi2[0]);
+	else
+		link_freq = ipu7_isys_csi2_get_link_freq(&isys->csi2[id]);
+
+	if (link_freq < 0) {
+		dev_warn(dev, "get link freq failed, use default mbps\n");
+		link_freq = 560000000;
+	}
+
+	mbps = div_u64(link_freq, 500000);
+	dev_dbg(dev, "config phy %u with lanes %u aggregation %d mbps %lld\n",
+		id, lanes, aggregation, mbps);
+
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_10, 48, 0, 7);
+	dwc_phy_write_mask(isys, id, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
+			   1, 12, 13);
+	dwc_phy_write_mask(isys, id, CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
+			   63, 2, 7);
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_STARTUP_1_1,
+			   563, 0, 11);
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 5, 0, 7);
+	/* bypass the RCAL state (bit6) */
+	if (aggregation && id != PORT_A)
+		dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_2, 0x45,
+				   0, 7);
+
+	dwc_phy_write_mask(isys, id, PPI_STARTUP_RW_COMMON_DPHY_6, 39, 0, 7);
+	dwc_phy_write_mask(isys, id, PPI_CALIBCTRL_RW_COMMON_BG_0, 500, 0, 8);
+	dwc_phy_write_mask(isys, id, PPI_RW_TERMCAL_CFG_0, 38, 0, 6);
+	dwc_phy_write_mask(isys, id, PPI_RW_OFFSETCAL_CFG_0, 7, 0, 4);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TIMEBASE, 153, 0, 9);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_NREF, 800, 0, 10);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_NREF_RANGE, 27, 0, 4);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TWAIT_CONFIG, 47, 0, 8);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_TWAIT_CONFIG, 127, 9, 15);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 47, 7, 15);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 27, 2, 6);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_VT_CONFIG, 3, 0, 1);
+	dwc_phy_write_mask(isys, id, PPI_RW_LPDCOCAL_COARSE_CFG, 1, 0, 1);
+	dwc_phy_write_mask(isys, id, PPI_RW_COMMON_CFG, 3, 0, 1);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
+			   0, 10, 10);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
+			   1, 10, 10);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1,
+			   0, 15, 15);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_3,
+			   3, 8, 9);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0,
+			   0, 15, 15);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_6,
+			   7, 12, 14);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
+			   0, 8, 10);
+	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5,
+			   0, 8, 8);
+
+	if (aggregation)
+		phy_mode = isys->csi2[0].phy_mode;
+	else
+		phy_mode = isys->csi2[id].phy_mode;
+
+	if (phy_mode == PHY_MODE_DPHY) {
+		ipu7_isys_dphy_config(isys, id, lanes, aggregation, mbps);
+	} else if (phy_mode == PHY_MODE_CPHY) {
+		ipu7_isys_cphy_config(isys, id, lanes, aggregation, mbps);
+	} else {
+		dev_err(dev, "unsupported phy mode %d!\n",
+			isys->csi2[id].phy_mode);
+	}
+}
+
+int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_isys *isys = csi2->isys;
+	u32 lanes = csi2->nlanes;
+	bool aggregation = false;
+	u32 id = csi2->port;
+	int ret;
+
+	/* lanes remapping for aggregation (port AB) mode */
+	if (!is_ipu7(isys->adev->isp->hw_ver) && lanes > 2 && id == PORT_A) {
+		aggregation = true;
+		lanes = 2;
+	}
+
+	ipu7_isys_csi_phy_reset(isys, id);
+	gpreg_write(isys, id, PHY_CLK_LANE_CONTROL, 0x1);
+	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
+	gpreg_write(isys, id, PHY_LANE_CONTROL_EN, (1 << lanes) - 1);
+	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0xf);
+	gpreg_write(isys, id, PHY_MODE, csi2->phy_mode);
+
+	/* config PORT_B if aggregation mode */
+	if (aggregation) {
+		ipu7_isys_csi_phy_reset(isys, PORT_B);
+		gpreg_write(isys, PORT_B, PHY_CLK_LANE_CONTROL, 0x0);
+		gpreg_write(isys, PORT_B, PHY_LANE_CONTROL_EN, 0x3);
+		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
+		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0xf);
+		gpreg_write(isys, PORT_B, PHY_MODE, csi2->phy_mode);
+	}
+
+	ipu7_isys_csi_ctrl_cfg(csi2);
+	ipu7_isys_csi_ctrl_dids_config(csi2, id);
+
+	ipu7_isys_phy_config(isys, id, lanes, aggregation);
+	gpreg_write(isys, id, PHY_RESET, 1);
+	gpreg_write(isys, id, PHY_SHUTDOWN, 1);
+	dwc_csi_write(isys, id, DPHY_RSTZ, 1);
+	dwc_csi_write(isys, id, PHY_SHUTDOWNZ, 1);
+	dwc_csi_write(isys, id, CSI2_RESETN, 1);
+
+	ret = ipu7_isys_phy_ready(isys, id);
+	if (ret < 0)
+		return ret;
+
+	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0);
+	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0);
+
+	/* config PORT_B if aggregation mode */
+	if (aggregation) {
+		ipu7_isys_phy_config(isys, PORT_B, 2, aggregation);
+		gpreg_write(isys, PORT_B, PHY_RESET, 1);
+		gpreg_write(isys, PORT_B, PHY_SHUTDOWN, 1);
+		dwc_csi_write(isys, PORT_B, DPHY_RSTZ, 1);
+		dwc_csi_write(isys, PORT_B, PHY_SHUTDOWNZ, 1);
+		dwc_csi_write(isys, PORT_B, CSI2_RESETN, 1);
+		ret = ipu7_isys_phy_ready(isys, PORT_B);
+		if (ret < 0)
+			return ret;
+
+		gpreg_write(isys, PORT_B, PHY_LANE_FORCE_CONTROL, 0);
+		gpreg_write(isys, PORT_B, PHY_CLK_LANE_FORCE_CONTROL, 0);
+	}
+
+	return 0;
+}
+
+void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_isys *isys = csi2->isys;
+
+	ipu7_isys_csi_phy_reset(isys, csi2->port);
+	if (!is_ipu7(isys->adev->isp->hw_ver) &&
+	    csi2->nlanes > 2 && csi2->port == PORT_A)
+		ipu7_isys_csi_phy_reset(isys, PORT_B);
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h b/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
new file mode 100644
index 000000000000..b1dc8689aba5
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_CSI_PHY_H
+#define IPU7_ISYS_CSI_PHY_H
+
+struct ipu7_isys;
+
+#define PHY_MODE_DPHY		0U
+#define PHY_MODE_CPHY		1U
+
+int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2);
+void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2);
+#endif
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
new file mode 100644
index 000000000000..93caf22fc42f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
@@ -0,0 +1,1197 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_CSI2_REG_H
+#define IPU7_ISYS_CSI2_REG_H
+
+/* IS main regs base */
+#define IS_MAIN_BASE				(0x240000)
+#define IS_MAIN_S2B_BASE			(IS_MAIN_BASE + 0x22000)
+#define IS_MAIN_B2O_BASE			(IS_MAIN_BASE + 0x26000)
+#define IS_MAIN_ISD_M0_BASE			(IS_MAIN_BASE + 0x2b000)
+#define IS_MAIN_ISD_M1_BASE			(IS_MAIN_BASE + 0x2b100)
+#define IS_MAIN_ISD_INT_BASE			(IS_MAIN_BASE + 0x2b200)
+#define IS_MAIN_GDA_BASE			(IS_MAIN_BASE + 0x32000)
+#define IS_MAIN_GPREGS_MAIN_BASE		(IS_MAIN_BASE + 0x32500)
+#define IS_MAIN_IRQ_CTRL_BASE			(IS_MAIN_BASE + 0x32700)
+#define IS_MAIN_PWM_CTRL_BASE			(IS_MAIN_BASE + 0x32b00)
+
+#define S2B_IRQ_COMMON_0_CTL_STATUS		(IS_MAIN_S2B_BASE + 0x1c)
+#define S2B_IRQ_COMMON_0_CTL_CLEAR		(IS_MAIN_S2B_BASE + 0x20)
+#define S2B_IRQ_COMMON_0_CTL_ENABLE		(IS_MAIN_S2B_BASE + 0x24)
+#define S2B_IID_IRQ_CTL_STATUS(iid)		(IS_MAIN_S2B_BASE + 0x94 + \
+						 0x100 * (iid))
+
+#define B2O_IRQ_COMMON_0_CTL_STATUS		(IS_MAIN_B2O_BASE + 0x30)
+#define B2O_IRQ_COMMON_0_CTL_CLEAR		(IS_MAIN_B2O_BASE + 0x34)
+#define B2O_IRQ_COMMON_0_CTL_ENABLE		(IS_MAIN_B2O_BASE + 0x38)
+#define B2O_IID_IRQ_CTL_STATUS(oid)		(IS_MAIN_B2O_BASE + 0x3dc + \
+						 0x200 * (oid))
+
+#define ISD_M0_IRQ_CTL_STATUS			(IS_MAIN_ISD_M0_BASE + 0x1c)
+#define ISD_M0_IRQ_CTL_CLEAR			(IS_MAIN_ISD_M0_BASE + 0x20)
+#define ISD_M0_IRQ_CTL_ENABLE			(IS_MAIN_ISD_M0_BASE + 0x24)
+
+#define ISD_M1_IRQ_CTL_STATUS			(IS_MAIN_ISD_M1_BASE + 0x1c)
+#define ISD_M1_IRQ_CTL_CLEAR			(IS_MAIN_ISD_M1_BASE + 0x20)
+#define ISD_M1_IRQ_CTL_ENABLE			(IS_MAIN_ISD_M1_BASE + 0x24)
+
+#define ISD_INT_IRQ_CTL_STATUS			(IS_MAIN_ISD_INT_BASE + 0x1c)
+#define ISD_INT_IRQ_CTL_CLEAR			(IS_MAIN_ISD_INT_BASE + 0x20)
+#define ISD_INT_IRQ_CTL_ENABLE			(IS_MAIN_ISD_INT_BASE + 0x24)
+
+#define GDA_IRQ_CTL_STATUS			(IS_MAIN_GDA_BASE + 0x1c)
+#define GDA_IRQ_CTL_CLEAR			(IS_MAIN_GDA_BASE + 0x20)
+#define GDA_IRQ_CTL_ENABLE			(IS_MAIN_GDA_BASE + 0x24)
+
+#define IS_MAIN_IRQ_CTL_EDGE			(IS_MAIN_IRQ_CTRL_BASE + 0x0)
+#define IS_MAIN_IRQ_CTL_MASK			(IS_MAIN_IRQ_CTRL_BASE + 0x4)
+#define IS_MAIN_IRQ_CTL_STATUS			(IS_MAIN_IRQ_CTRL_BASE + 0x8)
+#define IS_MAIN_IRQ_CTL_CLEAR			(IS_MAIN_IRQ_CTRL_BASE + 0xc)
+#define IS_MAIN_IRQ_CTL_ENABLE			(IS_MAIN_IRQ_CTRL_BASE + 0x10)
+#define IS_MAIN_IRQ_CTL_LEVEL_NOT_PULSE		(IS_MAIN_IRQ_CTRL_BASE + 0x14)
+
+/* IS IO regs base */
+#define IS_PHY_NUM				(4)
+#define IS_IO_BASE				(0x280000)
+
+/* dwc csi cdphy registers */
+#define IS_IO_CDPHY_BASE(i)			(IS_IO_BASE + 0x10000 * (i))
+#define PPI_STARTUP_RW_COMMON_DPHY_0			0x1800
+#define PPI_STARTUP_RW_COMMON_DPHY_1			0x1802
+#define PPI_STARTUP_RW_COMMON_DPHY_2			0x1804
+#define PPI_STARTUP_RW_COMMON_DPHY_3			0x1806
+#define PPI_STARTUP_RW_COMMON_DPHY_4			0x1808
+#define PPI_STARTUP_RW_COMMON_DPHY_5			0x180a
+#define PPI_STARTUP_RW_COMMON_DPHY_6			0x180c
+#define PPI_STARTUP_RW_COMMON_DPHY_7			0x180e
+#define PPI_STARTUP_RW_COMMON_DPHY_8			0x1810
+#define PPI_STARTUP_RW_COMMON_DPHY_9			0x1812
+#define PPI_STARTUP_RW_COMMON_DPHY_A			0x1814
+#define PPI_STARTUP_RW_COMMON_DPHY_10			0x1820
+#define PPI_STARTUP_RW_COMMON_STARTUP_1_1		0x1822
+#define PPI_STARTUP_RW_COMMON_STARTUP_1_2		0x1824
+#define PPI_CALIBCTRL_RW_COMMON_CALIBCTRL_2_0		0x1840
+#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_1		0x1842
+#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_2		0x1844
+#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_3		0x1846
+#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_4		0x1848
+#define PPI_CALIBCTRL_R_COMMON_CALIBCTRL_2_5		0x184a
+#define PPI_CALIBCTRL_RW_COMMON_BG_0			0x184c
+#define PPI_CALIBCTRL_RW_COMMON_CALIBCTRL_2_7		0x184e
+#define PPI_CALIBCTRL_RW_ADC_CFG_0			0x1850
+#define PPI_CALIBCTRL_RW_ADC_CFG_1			0x1852
+#define PPI_CALIBCTRL_R_ADC_DEBUG			0x1854
+#define PPI_RW_LPDCOCAL_TOP_OVERRIDE			0x1c00
+#define PPI_RW_LPDCOCAL_TIMEBASE			0x1c02
+#define PPI_RW_LPDCOCAL_NREF				0x1c04
+#define PPI_RW_LPDCOCAL_NREF_RANGE			0x1c06
+#define PPI_RW_LPDCOCAL_NREF_TRIGGER_MAN		0x1c08
+#define PPI_RW_LPDCOCAL_TWAIT_CONFIG			0x1c0a
+#define PPI_RW_LPDCOCAL_VT_CONFIG			0x1c0c
+#define PPI_R_LPDCOCAL_DEBUG_RB				0x1c0e
+#define PPI_RW_LPDCOCAL_COARSE_CFG			0x1c10
+#define PPI_R_LPDCOCAL_DEBUG_COARSE_RB			0x1c12
+#define PPI_R_LPDCOCAL_DEBUG_COARSE_MEAS_0_RB		0x1c14
+#define PPI_R_LPDCOCAL_DEBUG_COARSE_MEAS_1_RB		0x1c16
+#define PPI_R_LPDCOCAL_DEBUG_COARSE_FWORD_RB		0x1c18
+#define PPI_R_LPDCOCAL_DEBUG_MEASURE_CURR_ERROR		0x1c1a
+#define PPI_R_LPDCOCAL_DEBUG_MEASURE_LAST_ERROR		0x1c1c
+#define PPI_R_LPDCOCAL_DEBUG_VT				0x1c1e
+#define PPI_RW_LB_TIMEBASE_CONFIG			0x1c20
+#define PPI_RW_LB_STARTCMU_CONFIG			0x1c22
+#define PPI_R_LBPULSE_COUNTER_RB			0x1c24
+#define PPI_R_LB_START_CMU_RB				0x1c26
+#define PPI_RW_LB_DPHY_BURST_START			0x1c28
+#define PPI_RW_LB_CPHY_BURST_START			0x1c2a
+#define PPI_RW_DDLCAL_CFG_0				0x1c40
+#define PPI_RW_DDLCAL_CFG_1				0x1c42
+#define PPI_RW_DDLCAL_CFG_2				0x1c44
+#define PPI_RW_DDLCAL_CFG_3				0x1c46
+#define PPI_RW_DDLCAL_CFG_4				0x1c48
+#define PPI_RW_DDLCAL_CFG_5				0x1c4a
+#define PPI_RW_DDLCAL_CFG_6				0x1c4c
+#define PPI_RW_DDLCAL_CFG_7				0x1c4e
+#define PPI_R_DDLCAL_DEBUG_0				0x1c50
+#define PPI_R_DDLCAL_DEBUG_1				0x1c52
+#define PPI_RW_PARITY_TEST				0x1c60
+#define PPI_RW_STARTUP_OVR_0				0x1c62
+#define PPI_RW_STARTUP_STATE_OVR_1			0x1c64
+#define PPI_RW_DTB_SELECTOR				0x1c66
+#define PPI_RW_DPHY_CLK_SPARE				0x1c6a
+#define PPI_RW_COMMON_CFG				0x1c6c
+#define PPI_RW_TERMCAL_CFG_0				0x1c80
+#define PPI_R_TERMCAL_DEBUG_0				0x1c82
+#define PPI_RW_TERMCAL_CTRL_0				0x1c84
+#define PPI_RW_OFFSETCAL_CFG_0				0x1ca0
+#define PPI_R_OFFSETCAL_DEBUG_LANE0			0x1ca2
+#define PPI_R_OFFSETCAL_DEBUG_LANE1			0x1ca4
+#define PPI_R_OFFSETCAL_DEBUG_LANE2			0x1ca6
+#define PPI_R_OFFSETCAL_DEBUG_LANE3			0x1ca8
+#define PPI_R_OFFSETCAL_DEBUG_LANE4			0x1caa
+#define PPI_RW_HSDCOCAL_CFG_O				0x1d00
+#define PPI_RW_HSDCOCAL_CFG_1				0x1d02
+#define PPI_RW_HSDCOCAL_CFG_2				0x1d04
+#define PPI_RW_HSDCOCAL_CFG_3				0x1d06
+#define PPI_RW_HSDCOCAL_CFG_4				0x1d08
+#define PPI_RW_HSDCOCAL_CFG_5				0x1d0a
+#define PPI_RW_HSDCOCAL_CFG_6				0x1d0c
+#define PPI_RW_HSDCOCAL_CFG_7				0x1d0e
+#define PPI_RW_HSDCOCAL_CFG_8				0x1d10
+#define PPI_R_HSDCOCAL_DEBUG_RB				0x1d12
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_0	0x2000
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_1	0x2002
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_2	0x2004
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_3	0x2006
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_4	0x2008
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_5	0x200a
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_6	0x200c
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_7	0x200e
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE0_OVR_0_8	0x2010
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_9	0x2012
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_10	0x2014
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_11	0x2016
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_12	0x2018
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_13	0x201a
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_14	0x201c
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE0_OVR_0_15	0x201e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_0	0x2020
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_1	0x2022
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_2	0x2024
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_3	0x2026
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_4	0x2028
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_5	0x202a
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_6	0x202c
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_7	0x202e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_8	0x2030
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_1_9	0x2032
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_10	0x2034
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_11	0x2036
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_12	0x2038
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_13	0x203a
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_14	0x203c
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_1_15	0x203e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_0		0x2040
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_1		0x2042
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_2		0x2044
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_3		0x2046
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_4		0x2048
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_5		0x204a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_6		0x204c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7		0x204e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_8		0x2050
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9		0x2052
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_10		0x2054
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_11		0x2056
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_12		0x2058
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_13		0x205a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_14		0x205c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_15		0x205e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_0		0x2060
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_1		0x2062
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_2		0x2064
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_3		0x2066
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_4		0x2068
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_5		0x206a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_6		0x206c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_3_7		0x206e
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_8		0x2070
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_9		0x2072
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_10		0x2074
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_11		0x2076
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_12		0x2078
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_13		0x207a
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_14		0x207c
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_3_15		0x207e
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_0		0x2080
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_1		0x2082
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_2		0x2084
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_3		0x2086
+#define CORE_DIG_IOCTRL_R_AFE_LANE0_CTRL_4_4		0x2088
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_0	0x20a0
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_1	0x20a2
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_5_2	0x20a4
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE0_OVR_5_3	0x20a6
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE0_OVR_5_4	0x20a8
+#define CORE_DIG_RW_TRIO0_0				0x2100
+#define CORE_DIG_RW_TRIO0_1				0x2102
+#define CORE_DIG_RW_TRIO0_2				0x2104
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_0	0x2400
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_1	0x2402
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_2	0x2404
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_3	0x2406
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_4	0x2408
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_5	0x240a
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_6	0x240c
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_7	0x240e
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE1_OVR_0_8	0x2410
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_9	0x2412
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_10	0x2414
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_11	0x2416
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_12	0x2418
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_13	0x241a
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_14	0x241c
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE1_OVR_0_15	0x241e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_0	0x2420
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_1	0x2422
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_2	0x2424
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_3	0x2426
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_4	0x2428
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_5	0x242a
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_6	0x242c
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_7	0x242e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_8	0x2430
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_1_9	0x2432
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_10	0x2434
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_11	0x2436
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_12	0x2438
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_13	0x243a
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_14	0x243c
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_1_15	0x243e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_0		0x2440
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_1		0x2442
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_2		0x2444
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_3		0x2446
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_4		0x2448
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_5		0x244a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_6		0x244c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_7		0x244e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_8		0x2450
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_9		0x2452
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_10		0x2454
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_11		0x2456
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_12		0x2458
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_13		0x245a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_14		0x245c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_15		0x245e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_0		0x2460
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_1		0x2462
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_2		0x2464
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_3		0x2466
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_4		0x2468
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_5		0x246a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_6		0x246c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_3_7		0x246e
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_8		0x2470
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_9		0x2472
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_10		0x2474
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_11		0x2476
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_12		0x2478
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_13		0x247a
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_14		0x247c
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_3_15		0x247e
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_0		0x2480
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_1		0x2482
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_2		0x2484
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_3		0x2486
+#define CORE_DIG_IOCTRL_R_AFE_LANE1_CTRL_4_4		0x2488
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_0	0x24a0
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_1	0x24a2
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_5_2	0x24a4
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE1_OVR_5_3	0x24a6
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE1_OVR_5_4	0x24a8
+#define CORE_DIG_RW_TRIO1_0				0x2500
+#define CORE_DIG_RW_TRIO1_1				0x2502
+#define CORE_DIG_RW_TRIO1_2				0x2504
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_0	0x2800
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_1	0x2802
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_2	0x2804
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_3	0x2806
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_4	0x2808
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_5	0x280a
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_6	0x280c
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_7	0x280e
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE2_OVR_0_8	0x2810
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_9	0x2812
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_10	0x2814
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_11	0x2816
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_12	0x2818
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_13	0x281a
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_14	0x281c
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE2_OVR_0_15	0x281e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_0	0x2820
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_1	0x2822
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_2	0x2824
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_3	0x2826
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_4	0x2828
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_5	0x282a
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_6	0x282c
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_7	0x282e
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_8	0x2830
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_1_9	0x2832
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_10	0x2834
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_11	0x2836
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_12	0x2838
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_13	0x283a
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_14	0x283c
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_1_15	0x283e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_0		0x2840
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_1		0x2842
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_2		0x2844
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_3		0x2846
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_4		0x2848
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_5		0x284a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_6		0x284c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_7		0x284e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_8		0x2850
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_9		0x2852
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_10		0x2854
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_11		0x2856
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_12		0x2858
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_13		0x285a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_14		0x285c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_15		0x285e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_0		0x2860
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_1		0x2862
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_2		0x2864
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_3		0x2866
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_4		0x2868
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_5		0x286a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_6		0x286c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_3_7		0x286e
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_8		0x2870
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_9		0x2872
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_10		0x2874
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_11		0x2876
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_12		0x2878
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_13		0x287a
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_14		0x287c
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_3_15		0x287e
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_0		0x2880
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_1		0x2882
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_2		0x2884
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_3		0x2886
+#define CORE_DIG_IOCTRL_R_AFE_LANE2_CTRL_4_4		0x2888
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_0	0x28a0
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_1	0x28a2
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_5_2	0x28a4
+#define CORE_DIG_IOCTRL_RW_CPHY_PPI_LANE2_OVR_5_3	0x28a6
+#define CORE_DIG_IOCTRL_R_CPHY_PPI_LANE2_OVR_5_4	0x28a8
+#define CORE_DIG_RW_TRIO2_0				0x2900
+#define CORE_DIG_RW_TRIO2_1				0x2902
+#define CORE_DIG_RW_TRIO2_2				0x2904
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_0	0x2c00
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_1	0x2c02
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_2	0x2c04
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_3	0x2c06
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_4	0x2c08
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_5	0x2c0a
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_6	0x2c0c
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_7	0x2c0e
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_LANE3_OVR_0_8	0x2c10
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_9	0x2c12
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_10	0x2c14
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_11	0x2c16
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_12	0x2c18
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_13	0x2c1a
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_14	0x2c1c
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_LANE3_OVR_0_15	0x2c1e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_0		0x2c40
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_1		0x2c42
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_2		0x2c44
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_3		0x2c46
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_4		0x2c48
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_5		0x2c4a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_6		0x2c4c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_7		0x2c4e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_8		0x2c50
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_9		0x2c52
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_10		0x2c54
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_11		0x2c56
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_12		0x2c58
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_13		0x2c5a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_14		0x2c5c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_15		0x2c5e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_0		0x2c60
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_1		0x2c62
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_2		0x2c64
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_3		0x2c66
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_4		0x2c68
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_5		0x2c6a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_6		0x2c6c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_3_7		0x2c6e
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_8		0x2c70
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_9		0x2c72
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_10		0x2c74
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_11		0x2c76
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_12		0x2c78
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_13		0x2c7a
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_14		0x2c7c
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_3_15		0x2c7e
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_0		0x2c80
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_1		0x2c82
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_2		0x2c84
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_3		0x2c86
+#define CORE_DIG_IOCTRL_R_AFE_LANE3_CTRL_4_4		0x2c88
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_0		0x3040
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_1		0x3042
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_2		0x3044
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_3		0x3046
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_4		0x3048
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_5		0x304a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_6		0x304c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_7		0x304e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_8		0x3050
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_9		0x3052
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_10		0x3054
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_11		0x3056
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_12		0x3058
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_13		0x305a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_14		0x305c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_15		0x305e
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_0		0x3060
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_1		0x3062
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_2		0x3064
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_3		0x3066
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_4		0x3068
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_5		0x306a
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_6		0x306c
+#define CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_3_7		0x306e
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_8		0x3070
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_9		0x3072
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_10		0x3074
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_11		0x3076
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_12		0x3078
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_13		0x307a
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_14		0x307c
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_3_15		0x307e
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_0		0x3080
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_1		0x3082
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_2		0x3084
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_3		0x3086
+#define CORE_DIG_IOCTRL_R_AFE_LANE4_CTRL_4_4		0x3088
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_CLK_OVR_0_0		0x3400
+#define CORE_DIG_IOCTRL_RW_DPHY_PPI_CLK_OVR_0_1		0x3402
+#define CORE_DIG_IOCTRL_R_DPHY_PPI_CLK_OVR_0_2		0x3404
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_0		0x3800
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_1		0x3802
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_2		0x3804
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_3		0x3806
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_4		0x3808
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_5		0x380a
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_6		0x380c
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_7		0x380e
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_8		0x3810
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_9		0x3812
+#define CORE_DIG_IOCTRL_RW_COMMON_PPI_OVR_0_10		0x3814
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_11		0x3816
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_12		0x3818
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_13		0x381a
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_14		0x381c
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_0_15		0x381e
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_0		0x3820
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_1		0x3822
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_2		0x3824
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_3		0x3826
+#define CORE_DIG_IOCTRL_R_COMMON_PPI_OVR_1_4		0x3828
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_0		0x3840
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_1		0x3842
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_2		0x3844
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_3		0x3846
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_4		0x3848
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5		0x384a
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_6		0x384c
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7		0x384e
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_8		0x3850
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_9		0x3852
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_10		0x3854
+#define CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_11		0x3856
+#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_12		0x3858
+#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_13		0x385a
+#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_14		0x385c
+#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15		0x385e
+#define CORE_DIG_IOCTRL_R_AFE_CB_CTRL_3_0		0x3860
+#define CORE_DIG_RW_COMMON_0				0x3880
+#define CORE_DIG_RW_COMMON_1				0x3882
+#define CORE_DIG_RW_COMMON_2				0x3884
+#define CORE_DIG_RW_COMMON_3				0x3886
+#define CORE_DIG_RW_COMMON_4				0x3888
+#define CORE_DIG_RW_COMMON_5				0x388a
+#define CORE_DIG_RW_COMMON_6				0x388c
+#define CORE_DIG_RW_COMMON_7				0x388e
+#define CORE_DIG_RW_COMMON_8				0x3890
+#define CORE_DIG_RW_COMMON_9				0x3892
+#define CORE_DIG_RW_COMMON_10				0x3894
+#define CORE_DIG_RW_COMMON_11				0x3896
+#define CORE_DIG_RW_COMMON_12				0x3898
+#define CORE_DIG_RW_COMMON_13				0x389a
+#define CORE_DIG_RW_COMMON_14				0x389c
+#define CORE_DIG_RW_COMMON_15				0x389e
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0		0x39e0
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_1		0x39e2
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2		0x39e4
+#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_3		0x39e6
+#define CORE_DIG_COMMON_RW_DESKEW_FINE_MEM		0x3fe0
+#define CORE_DIG_COMMON_R_DESKEW_FINE_MEM		0x3fe2
+#define PPI_RW_DPHY_LANE0_LBERT_0			0x4000
+#define PPI_RW_DPHY_LANE0_LBERT_1			0x4002
+#define PPI_R_DPHY_LANE0_LBERT_0			0x4004
+#define PPI_R_DPHY_LANE0_LBERT_1			0x4006
+#define PPI_RW_DPHY_LANE0_SPARE				0x4008
+#define PPI_RW_DPHY_LANE1_LBERT_0			0x4400
+#define PPI_RW_DPHY_LANE1_LBERT_1			0x4402
+#define PPI_R_DPHY_LANE1_LBERT_0			0x4404
+#define PPI_R_DPHY_LANE1_LBERT_1			0x4406
+#define PPI_RW_DPHY_LANE1_SPARE				0x4408
+#define PPI_RW_DPHY_LANE2_LBERT_0			0x4800
+#define PPI_RW_DPHY_LANE2_LBERT_1			0x4802
+#define PPI_R_DPHY_LANE2_LBERT_0			0x4804
+#define PPI_R_DPHY_LANE2_LBERT_1			0x4806
+#define PPI_RW_DPHY_LANE2_SPARE				0x4808
+#define PPI_RW_DPHY_LANE3_LBERT_0			0x4c00
+#define PPI_RW_DPHY_LANE3_LBERT_1			0x4c02
+#define PPI_R_DPHY_LANE3_LBERT_0			0x4c04
+#define PPI_R_DPHY_LANE3_LBERT_1			0x4c06
+#define PPI_RW_DPHY_LANE3_SPARE				0x4c08
+#define CORE_DIG_DLANE_0_RW_CFG_0			0x6000
+#define CORE_DIG_DLANE_0_RW_CFG_1			0x6002
+#define CORE_DIG_DLANE_0_RW_CFG_2			0x6004
+#define CORE_DIG_DLANE_0_RW_LP_0			0x6080
+#define CORE_DIG_DLANE_0_RW_LP_1			0x6082
+#define CORE_DIG_DLANE_0_RW_LP_2			0x6084
+#define CORE_DIG_DLANE_0_R_LP_0				0x60a0
+#define CORE_DIG_DLANE_0_R_LP_1				0x60a2
+#define CORE_DIG_DLANE_0_R_HS_TX_0			0x60e0
+#define CORE_DIG_DLANE_0_RW_HS_RX_0			0x6100
+#define CORE_DIG_DLANE_0_RW_HS_RX_1			0x6102
+#define CORE_DIG_DLANE_0_RW_HS_RX_2			0x6104
+#define CORE_DIG_DLANE_0_RW_HS_RX_3			0x6106
+#define CORE_DIG_DLANE_0_RW_HS_RX_4			0x6108
+#define CORE_DIG_DLANE_0_RW_HS_RX_5			0x610a
+#define CORE_DIG_DLANE_0_RW_HS_RX_6			0x610c
+#define CORE_DIG_DLANE_0_RW_HS_RX_7			0x610e
+#define CORE_DIG_DLANE_0_RW_HS_RX_8			0x6110
+#define CORE_DIG_DLANE_0_RW_HS_RX_9			0x6112
+#define CORE_DIG_DLANE_0_R_HS_RX_0			0x6120
+#define CORE_DIG_DLANE_0_R_HS_RX_1			0x6122
+#define CORE_DIG_DLANE_0_R_HS_RX_2			0x6124
+#define CORE_DIG_DLANE_0_R_HS_RX_3			0x6126
+#define CORE_DIG_DLANE_0_R_HS_RX_4			0x6128
+#define CORE_DIG_DLANE_0_RW_HS_TX_0			0x6200
+#define CORE_DIG_DLANE_0_RW_HS_TX_1			0x6202
+#define CORE_DIG_DLANE_0_RW_HS_TX_2			0x6204
+#define CORE_DIG_DLANE_0_RW_HS_TX_3			0x6206
+#define CORE_DIG_DLANE_0_RW_HS_TX_4			0x6208
+#define CORE_DIG_DLANE_0_RW_HS_TX_5			0x620a
+#define CORE_DIG_DLANE_0_RW_HS_TX_6			0x620c
+#define CORE_DIG_DLANE_0_RW_HS_TX_7			0x620e
+#define CORE_DIG_DLANE_0_RW_HS_TX_8			0x6210
+#define CORE_DIG_DLANE_0_RW_HS_TX_9			0x6212
+#define CORE_DIG_DLANE_0_RW_HS_TX_10			0x6214
+#define CORE_DIG_DLANE_0_RW_HS_TX_11			0x6216
+#define CORE_DIG_DLANE_0_RW_HS_TX_12			0x6218
+#define CORE_DIG_DLANE_1_RW_CFG_0			0x6400
+#define CORE_DIG_DLANE_1_RW_CFG_1			0x6402
+#define CORE_DIG_DLANE_1_RW_CFG_2			0x6404
+#define CORE_DIG_DLANE_1_RW_LP_0			0x6480
+#define CORE_DIG_DLANE_1_RW_LP_1			0x6482
+#define CORE_DIG_DLANE_1_RW_LP_2			0x6484
+#define CORE_DIG_DLANE_1_R_LP_0				0x64a0
+#define CORE_DIG_DLANE_1_R_LP_1				0x64a2
+#define CORE_DIG_DLANE_1_R_HS_TX_0			0x64e0
+#define CORE_DIG_DLANE_1_RW_HS_RX_0			0x6500
+#define CORE_DIG_DLANE_1_RW_HS_RX_1			0x6502
+#define CORE_DIG_DLANE_1_RW_HS_RX_2			0x6504
+#define CORE_DIG_DLANE_1_RW_HS_RX_3			0x6506
+#define CORE_DIG_DLANE_1_RW_HS_RX_4			0x6508
+#define CORE_DIG_DLANE_1_RW_HS_RX_5			0x650a
+#define CORE_DIG_DLANE_1_RW_HS_RX_6			0x650c
+#define CORE_DIG_DLANE_1_RW_HS_RX_7			0x650e
+#define CORE_DIG_DLANE_1_RW_HS_RX_8			0x6510
+#define CORE_DIG_DLANE_1_RW_HS_RX_9			0x6512
+#define CORE_DIG_DLANE_1_R_HS_RX_0			0x6520
+#define CORE_DIG_DLANE_1_R_HS_RX_1			0x6522
+#define CORE_DIG_DLANE_1_R_HS_RX_2			0x6524
+#define CORE_DIG_DLANE_1_R_HS_RX_3			0x6526
+#define CORE_DIG_DLANE_1_R_HS_RX_4			0x6528
+#define CORE_DIG_DLANE_1_RW_HS_TX_0			0x6600
+#define CORE_DIG_DLANE_1_RW_HS_TX_1			0x6602
+#define CORE_DIG_DLANE_1_RW_HS_TX_2			0x6604
+#define CORE_DIG_DLANE_1_RW_HS_TX_3			0x6606
+#define CORE_DIG_DLANE_1_RW_HS_TX_4			0x6608
+#define CORE_DIG_DLANE_1_RW_HS_TX_5			0x660a
+#define CORE_DIG_DLANE_1_RW_HS_TX_6			0x660c
+#define CORE_DIG_DLANE_1_RW_HS_TX_7			0x660e
+#define CORE_DIG_DLANE_1_RW_HS_TX_8			0x6610
+#define CORE_DIG_DLANE_1_RW_HS_TX_9			0x6612
+#define CORE_DIG_DLANE_1_RW_HS_TX_10			0x6614
+#define CORE_DIG_DLANE_1_RW_HS_TX_11			0x6616
+#define CORE_DIG_DLANE_1_RW_HS_TX_12			0x6618
+#define CORE_DIG_DLANE_2_RW_CFG_0			0x6800
+#define CORE_DIG_DLANE_2_RW_CFG_1			0x6802
+#define CORE_DIG_DLANE_2_RW_CFG_2			0x6804
+#define CORE_DIG_DLANE_2_RW_LP_0			0x6880
+#define CORE_DIG_DLANE_2_RW_LP_1			0x6882
+#define CORE_DIG_DLANE_2_RW_LP_2			0x6884
+#define CORE_DIG_DLANE_2_R_LP_0				0x68a0
+#define CORE_DIG_DLANE_2_R_LP_1				0x68a2
+#define CORE_DIG_DLANE_2_R_HS_TX_0			0x68e0
+#define CORE_DIG_DLANE_2_RW_HS_RX_0			0x6900
+#define CORE_DIG_DLANE_2_RW_HS_RX_1			0x6902
+#define CORE_DIG_DLANE_2_RW_HS_RX_2			0x6904
+#define CORE_DIG_DLANE_2_RW_HS_RX_3			0x6906
+#define CORE_DIG_DLANE_2_RW_HS_RX_4			0x6908
+#define CORE_DIG_DLANE_2_RW_HS_RX_5			0x690a
+#define CORE_DIG_DLANE_2_RW_HS_RX_6			0x690c
+#define CORE_DIG_DLANE_2_RW_HS_RX_7			0x690e
+#define CORE_DIG_DLANE_2_RW_HS_RX_8			0x6910
+#define CORE_DIG_DLANE_2_RW_HS_RX_9			0x6912
+#define CORE_DIG_DLANE_2_R_HS_RX_0			0x6920
+#define CORE_DIG_DLANE_2_R_HS_RX_1			0x6922
+#define CORE_DIG_DLANE_2_R_HS_RX_2			0x6924
+#define CORE_DIG_DLANE_2_R_HS_RX_3			0x6926
+#define CORE_DIG_DLANE_2_R_HS_RX_4			0x6928
+#define CORE_DIG_DLANE_2_RW_HS_TX_0			0x6a00
+#define CORE_DIG_DLANE_2_RW_HS_TX_1			0x6a02
+#define CORE_DIG_DLANE_2_RW_HS_TX_2			0x6a04
+#define CORE_DIG_DLANE_2_RW_HS_TX_3			0x6a06
+#define CORE_DIG_DLANE_2_RW_HS_TX_4			0x6a08
+#define CORE_DIG_DLANE_2_RW_HS_TX_5			0x6a0a
+#define CORE_DIG_DLANE_2_RW_HS_TX_6			0x6a0c
+#define CORE_DIG_DLANE_2_RW_HS_TX_7			0x6a0e
+#define CORE_DIG_DLANE_2_RW_HS_TX_8			0x6a10
+#define CORE_DIG_DLANE_2_RW_HS_TX_9			0x6a12
+#define CORE_DIG_DLANE_2_RW_HS_TX_10			0x6a14
+#define CORE_DIG_DLANE_2_RW_HS_TX_11			0x6a16
+#define CORE_DIG_DLANE_2_RW_HS_TX_12			0x6a18
+#define CORE_DIG_DLANE_3_RW_CFG_0			0x6c00
+#define CORE_DIG_DLANE_3_RW_CFG_1			0x6c02
+#define CORE_DIG_DLANE_3_RW_CFG_2			0x6c04
+#define CORE_DIG_DLANE_3_RW_LP_0			0x6c80
+#define CORE_DIG_DLANE_3_RW_LP_1			0x6c82
+#define CORE_DIG_DLANE_3_RW_LP_2			0x6c84
+#define CORE_DIG_DLANE_3_R_LP_0				0x6ca0
+#define CORE_DIG_DLANE_3_R_LP_1				0x6ca2
+#define CORE_DIG_DLANE_3_R_HS_TX_0			0x6ce0
+#define CORE_DIG_DLANE_3_RW_HS_RX_0			0x6d00
+#define CORE_DIG_DLANE_3_RW_HS_RX_1			0x6d02
+#define CORE_DIG_DLANE_3_RW_HS_RX_2			0x6d04
+#define CORE_DIG_DLANE_3_RW_HS_RX_3			0x6d06
+#define CORE_DIG_DLANE_3_RW_HS_RX_4			0x6d08
+#define CORE_DIG_DLANE_3_RW_HS_RX_5			0x6d0a
+#define CORE_DIG_DLANE_3_RW_HS_RX_6			0x6d0c
+#define CORE_DIG_DLANE_3_RW_HS_RX_7			0x6d0e
+#define CORE_DIG_DLANE_3_RW_HS_RX_8			0x6d10
+#define CORE_DIG_DLANE_3_RW_HS_RX_9			0x6d12
+#define CORE_DIG_DLANE_3_R_HS_RX_0			0x6d20
+#define CORE_DIG_DLANE_3_R_HS_RX_1			0x6d22
+#define CORE_DIG_DLANE_3_R_HS_RX_2			0x6d24
+#define CORE_DIG_DLANE_3_R_HS_RX_3			0x6d26
+#define CORE_DIG_DLANE_3_R_HS_RX_4			0x6d28
+#define CORE_DIG_DLANE_3_RW_HS_TX_0			0x6e00
+#define CORE_DIG_DLANE_3_RW_HS_TX_1			0x6e02
+#define CORE_DIG_DLANE_3_RW_HS_TX_2			0x6e04
+#define CORE_DIG_DLANE_3_RW_HS_TX_3			0x6e06
+#define CORE_DIG_DLANE_3_RW_HS_TX_4			0x6e08
+#define CORE_DIG_DLANE_3_RW_HS_TX_5			0x6e0a
+#define CORE_DIG_DLANE_3_RW_HS_TX_6			0x6e0c
+#define CORE_DIG_DLANE_3_RW_HS_TX_7			0x6e0e
+#define CORE_DIG_DLANE_3_RW_HS_TX_8			0x6e10
+#define CORE_DIG_DLANE_3_RW_HS_TX_9			0x6e12
+#define CORE_DIG_DLANE_3_RW_HS_TX_10			0x6e14
+#define CORE_DIG_DLANE_3_RW_HS_TX_11			0x6e16
+#define CORE_DIG_DLANE_3_RW_HS_TX_12			0x6e18
+#define CORE_DIG_DLANE_CLK_RW_CFG_0			0x7000
+#define CORE_DIG_DLANE_CLK_RW_CFG_1			0x7002
+#define CORE_DIG_DLANE_CLK_RW_CFG_2			0x7004
+#define CORE_DIG_DLANE_CLK_RW_LP_0			0x7080
+#define CORE_DIG_DLANE_CLK_RW_LP_1			0x7082
+#define CORE_DIG_DLANE_CLK_RW_LP_2			0x7084
+#define CORE_DIG_DLANE_CLK_R_LP_0			0x70a0
+#define CORE_DIG_DLANE_CLK_R_LP_1			0x70a2
+#define CORE_DIG_DLANE_CLK_R_HS_TX_0			0x70e0
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_0			0x7100
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_1			0x7102
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_2			0x7104
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_3			0x7106
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_4			0x7108
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_5			0x710a
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_6			0x710c
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_7			0x710e
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_8			0x7110
+#define CORE_DIG_DLANE_CLK_RW_HS_RX_9			0x7112
+#define CORE_DIG_DLANE_CLK_R_HS_RX_0			0x7120
+#define CORE_DIG_DLANE_CLK_R_HS_RX_1			0x7122
+#define CORE_DIG_DLANE_CLK_R_HS_RX_2			0x7124
+#define CORE_DIG_DLANE_CLK_R_HS_RX_3			0x7126
+#define CORE_DIG_DLANE_CLK_R_HS_RX_4			0x7128
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_0			0x7200
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_1			0x7202
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_2			0x7204
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_3			0x7206
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_4			0x7208
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_5			0x720a
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_6			0x720c
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_7			0x720e
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_8			0x7210
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_9			0x7212
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_10			0x7214
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_11			0x7216
+#define CORE_DIG_DLANE_CLK_RW_HS_TX_12			0x7218
+#define PPI_RW_CPHY_TRIO0_LBERT_0			0x8000
+#define PPI_RW_CPHY_TRIO0_LBERT_1			0x8002
+#define PPI_R_CPHY_TRIO0_LBERT_0			0x8004
+#define PPI_R_CPHY_TRIO0_LBERT_1			0x8006
+#define PPI_RW_CPHY_TRIO0_SPARE				0x8008
+#define PPI_RW_CPHY_TRIO1_LBERT_0			0x8400
+#define PPI_RW_CPHY_TRIO1_LBERT_1			0x8402
+#define PPI_R_CPHY_TRIO1_LBERT_0			0x8404
+#define PPI_R_CPHY_TRIO1_LBERT_1			0x8406
+#define PPI_RW_CPHY_TRIO1_SPARE				0x8408
+#define PPI_RW_CPHY_TRIO2_LBERT_0			0x8800
+#define PPI_RW_CPHY_TRIO2_LBERT_1			0x8802
+#define PPI_R_CPHY_TRIO2_LBERT_0			0x8804
+#define PPI_R_CPHY_TRIO2_LBERT_1			0x8806
+#define PPI_RW_CPHY_TRIO2_SPARE				0x8808
+#define CORE_DIG_CLANE_0_RW_CFG_0			0xa000
+#define CORE_DIG_CLANE_0_RW_CFG_2			0xa004
+#define CORE_DIG_CLANE_0_RW_LP_0			0xa080
+#define CORE_DIG_CLANE_0_RW_LP_1			0xa082
+#define CORE_DIG_CLANE_0_RW_LP_2			0xa084
+#define CORE_DIG_CLANE_0_R_LP_0				0xa0a0
+#define CORE_DIG_CLANE_0_R_LP_1				0xa0a2
+#define CORE_DIG_CLANE_0_RW_HS_RX_0			0xa100
+#define CORE_DIG_CLANE_0_RW_HS_RX_1			0xa102
+#define CORE_DIG_CLANE_0_RW_HS_RX_2			0xa104
+#define CORE_DIG_CLANE_0_RW_HS_RX_3			0xa106
+#define CORE_DIG_CLANE_0_RW_HS_RX_4			0xa108
+#define CORE_DIG_CLANE_0_RW_HS_RX_5			0xa10a
+#define CORE_DIG_CLANE_0_RW_HS_RX_6			0xa10c
+#define CORE_DIG_CLANE_0_R_RX_0				0xa120
+#define CORE_DIG_CLANE_0_R_RX_1				0xa122
+#define CORE_DIG_CLANE_0_R_TX_0				0xa124
+#define CORE_DIG_CLANE_0_R_RX_2				0xa126
+#define CORE_DIG_CLANE_0_R_RX_3				0xa128
+#define CORE_DIG_CLANE_0_RW_HS_TX_0			0xa200
+#define CORE_DIG_CLANE_0_RW_HS_TX_1			0xa202
+#define CORE_DIG_CLANE_0_RW_HS_TX_2			0xa204
+#define CORE_DIG_CLANE_0_RW_HS_TX_3			0xa206
+#define CORE_DIG_CLANE_0_RW_HS_TX_4			0xa208
+#define CORE_DIG_CLANE_0_RW_HS_TX_5			0xa20a
+#define CORE_DIG_CLANE_0_RW_HS_TX_6			0xa20c
+#define CORE_DIG_CLANE_0_RW_HS_TX_7			0xa20e
+#define CORE_DIG_CLANE_0_RW_HS_TX_8			0xa210
+#define CORE_DIG_CLANE_0_RW_HS_TX_9			0xa212
+#define CORE_DIG_CLANE_0_RW_HS_TX_10			0xa214
+#define CORE_DIG_CLANE_0_RW_HS_TX_11			0xa216
+#define CORE_DIG_CLANE_0_RW_HS_TX_12			0xa218
+#define CORE_DIG_CLANE_0_RW_HS_TX_13			0xa21a
+#define CORE_DIG_CLANE_1_RW_CFG_0			0xa400
+#define CORE_DIG_CLANE_1_RW_CFG_2			0xa404
+#define CORE_DIG_CLANE_1_RW_LP_0			0xa480
+#define CORE_DIG_CLANE_1_RW_LP_1			0xa482
+#define CORE_DIG_CLANE_1_RW_LP_2			0xa484
+#define CORE_DIG_CLANE_1_R_LP_0				0xa4a0
+#define CORE_DIG_CLANE_1_R_LP_1				0xa4a2
+#define CORE_DIG_CLANE_1_RW_HS_RX_0			0xa500
+#define CORE_DIG_CLANE_1_RW_HS_RX_1			0xa502
+#define CORE_DIG_CLANE_1_RW_HS_RX_2			0xa504
+#define CORE_DIG_CLANE_1_RW_HS_RX_3			0xa506
+#define CORE_DIG_CLANE_1_RW_HS_RX_4			0xa508
+#define CORE_DIG_CLANE_1_RW_HS_RX_5			0xa50a
+#define CORE_DIG_CLANE_1_RW_HS_RX_6			0xa50c
+#define CORE_DIG_CLANE_1_R_RX_0				0xa520
+#define CORE_DIG_CLANE_1_R_RX_1				0xa522
+#define CORE_DIG_CLANE_1_R_TX_0				0xa524
+#define CORE_DIG_CLANE_1_R_RX_2				0xa526
+#define CORE_DIG_CLANE_1_R_RX_3				0xa528
+#define CORE_DIG_CLANE_1_RW_HS_TX_0			0xa600
+#define CORE_DIG_CLANE_1_RW_HS_TX_1			0xa602
+#define CORE_DIG_CLANE_1_RW_HS_TX_2			0xa604
+#define CORE_DIG_CLANE_1_RW_HS_TX_3			0xa606
+#define CORE_DIG_CLANE_1_RW_HS_TX_4			0xa608
+#define CORE_DIG_CLANE_1_RW_HS_TX_5			0xa60a
+#define CORE_DIG_CLANE_1_RW_HS_TX_6			0xa60c
+#define CORE_DIG_CLANE_1_RW_HS_TX_7			0xa60e
+#define CORE_DIG_CLANE_1_RW_HS_TX_8			0xa610
+#define CORE_DIG_CLANE_1_RW_HS_TX_9			0xa612
+#define CORE_DIG_CLANE_1_RW_HS_TX_10			0xa614
+#define CORE_DIG_CLANE_1_RW_HS_TX_11			0xa616
+#define CORE_DIG_CLANE_1_RW_HS_TX_12			0xa618
+#define CORE_DIG_CLANE_1_RW_HS_TX_13			0xa61a
+#define CORE_DIG_CLANE_2_RW_CFG_0			0xa800
+#define CORE_DIG_CLANE_2_RW_CFG_2			0xa804
+#define CORE_DIG_CLANE_2_RW_LP_0			0xa880
+#define CORE_DIG_CLANE_2_RW_LP_1			0xa882
+#define CORE_DIG_CLANE_2_RW_LP_2			0xa884
+#define CORE_DIG_CLANE_2_R_LP_0				0xa8a0
+#define CORE_DIG_CLANE_2_R_LP_1				0xa8a2
+#define CORE_DIG_CLANE_2_RW_HS_RX_0			0xa900
+#define CORE_DIG_CLANE_2_RW_HS_RX_1			0xa902
+#define CORE_DIG_CLANE_2_RW_HS_RX_2			0xa904
+#define CORE_DIG_CLANE_2_RW_HS_RX_3			0xa906
+#define CORE_DIG_CLANE_2_RW_HS_RX_4			0xa908
+#define CORE_DIG_CLANE_2_RW_HS_RX_5			0xa90a
+#define CORE_DIG_CLANE_2_RW_HS_RX_6			0xa90c
+#define CORE_DIG_CLANE_2_R_RX_0				0xa920
+#define CORE_DIG_CLANE_2_R_RX_1				0xa922
+#define CORE_DIG_CLANE_2_R_TX_0				0xa924
+#define CORE_DIG_CLANE_2_R_RX_2				0xa926
+#define CORE_DIG_CLANE_2_R_RX_3				0xa928
+#define CORE_DIG_CLANE_2_RW_HS_TX_0			0xaa00
+#define CORE_DIG_CLANE_2_RW_HS_TX_1			0xaa02
+#define CORE_DIG_CLANE_2_RW_HS_TX_2			0xaa04
+#define CORE_DIG_CLANE_2_RW_HS_TX_3			0xaa06
+#define CORE_DIG_CLANE_2_RW_HS_TX_4			0xaa08
+#define CORE_DIG_CLANE_2_RW_HS_TX_5			0xaa0a
+#define CORE_DIG_CLANE_2_RW_HS_TX_6			0xaa0c
+#define CORE_DIG_CLANE_2_RW_HS_TX_7			0xaa0e
+#define CORE_DIG_CLANE_2_RW_HS_TX_8			0xaa10
+#define CORE_DIG_CLANE_2_RW_HS_TX_9			0xaa12
+#define CORE_DIG_CLANE_2_RW_HS_TX_10			0xaa14
+#define CORE_DIG_CLANE_2_RW_HS_TX_11			0xaa16
+#define CORE_DIG_CLANE_2_RW_HS_TX_12			0xaa18
+#define CORE_DIG_CLANE_2_RW_HS_TX_13			0xaa1a
+
+/* dwc csi host controller registers */
+#define IS_IO_CSI2_HOST_BASE(i)			(IS_IO_BASE + 0x40000 + \
+						 0x2000 * (i))
+#define VERSION					0x0
+#define N_LANES					0x4
+#define CSI2_RESETN				0x8
+#define INT_ST_MAIN				0xc
+#define DATA_IDS_1				0x10
+#define DATA_IDS_2				0x14
+#define CDPHY_MODE				0x1c
+#define DATA_IDS_VC_1				0x30
+#define DATA_IDS_VC_2				0x34
+#define PHY_SHUTDOWNZ				0x40
+#define DPHY_RSTZ				0x44
+#define PHY_RX					0x48
+#define PHY_STOPSTATE				0x4c
+#define PHY_TEST_CTRL0				0x50
+#define PHY_TEST_CTRL1				0x54
+#define PPI_PG_PATTERN_VRES			0x60
+#define PPI_PG_PATTERN_HRES			0x64
+#define PPI_PG_CONFIG				0x68
+#define PPI_PG_ENABLE				0x6c
+#define PPI_PG_STATUS				0x70
+#define VC_EXTENSION				0xc8
+#define PHY_CAL					0xcc
+#define INT_ST_PHY_FATAL			0xe0
+#define INT_MSK_PHY_FATAL			0xe4
+#define INT_FORCE_PHY_FATAL			0xe8
+#define INT_ST_PKT_FATAL			0xf0
+#define INT_MSK_PKT_FATAL			0xf4
+#define INT_FORCE_PKT_FATAL			0xf8
+#define INT_ST_PHY				0x110
+#define INT_MSK_PHY				0x114
+#define INT_FORCE_PHY				0x118
+#define INT_ST_LINE				0x130
+#define INT_MSK_LINE				0x134
+#define INT_FORCE_LINE				0x138
+#define INT_ST_BNDRY_FRAME_FATAL		0x280
+#define INT_MSK_BNDRY_FRAME_FATAL		0x284
+#define INT_FORCE_BNDRY_FRAME_FATAL		0x288
+#define INT_ST_SEQ_FRAME_FATAL			0x290
+#define INT_MSK_SEQ_FRAME_FATAL			0x294
+#define INT_FORCE_SEQ_FRAME_FATAL		0x298
+#define INT_ST_CRC_FRAME_FATAL			0x2a0
+#define INT_MSK_CRC_FRAME_FATAL			0x2a4
+#define INT_FORCE_CRC_FRAME_FATAL		0x2a8
+#define INT_ST_PLD_CRC_FATAL			0x2b0
+#define INT_MSK_PLD_CRC_FATAL			0x2b4
+#define INT_FORCE_PLD_CRC_FATAL			0x2b8
+#define INT_ST_DATA_ID				0x2c0
+#define INT_MSK_DATA_ID				0x2c4
+#define INT_FORCE_DATA_ID			0x2c8
+#define INT_ST_ECC_CORRECTED			0x2d0
+#define INT_MSK_ECC_CORRECTED			0x2d4
+#define INT_FORCE_ECC_CORRECTED			0x2d8
+#define SCRAMBLING				0x300
+#define SCRAMBLING_SEED1			0x304
+#define SCRAMBLING_SEED2			0x308
+#define SCRAMBLING_SEED3			0x30c
+#define SCRAMBLING_SEED4			0x310
+#define SCRAMBLING				0x300
+
+#define IS_IO_CSI2_ADPL_PORT_BASE(i)		(IS_IO_BASE + 0x40800 + \
+						 0x2000 * (i))
+#define CSI2_ADPL_INPUT_MODE			0x0
+#define CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_EN	0x4
+#define CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_ADDR	0x8
+#define CSI2_ADPL_CSI_RX_ERR_IRQ_STATUS		0xc
+#define CSI2_ADPL_IRQ_CTL_COMMON_STATUS		0xa4
+#define CSI2_ADPL_IRQ_CTL_COMMON_CLEAR		0xa8
+#define CSI2_ADPL_IRQ_CTL_COMMON_ENABLE		0xac
+#define CSI2_ADPL_IRQ_CTL_FS_STATUS		0xbc
+#define CSI2_ADPL_IRQ_CTL_FS_CLEAR		0xc0
+#define CSI2_ADPL_IRQ_CTL_FS_ENABLE		0xc4
+#define CSI2_ADPL_IRQ_CTL_FE_STATUS		0xc8
+#define CSI2_ADPL_IRQ_CTL_FE_CLEAR		0xcc
+#define CSI2_ADPL_IRQ_CTL_FE_ENABLE		0xd0
+
+/* software control the legacy csi irq */
+#define IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(i)	(IS_IO_BASE + 0x40c00 + \
+						 0x2000 * (i))
+#define IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(i)	(IS_IO_BASE + 0x40d00 + \
+						 0x2000 * (i))
+#define IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE		(IS_IO_BASE + 0x49000)
+#define IS_IO_CSI2_IRQ_CTRL_BASE		(IS_IO_BASE + 0x4e100)
+
+#define IRQ_CTL_EDGE				0x0
+#define IRQ_CTL_MASK				0x4
+#define IRQ_CTL_STATUS				0x8
+#define IRQ_CTL_CLEAR				0xc
+#define IRQ_CTL_ENABLE				0x10
+/* FE irq for PTL */
+#define IRQ1_CTL_MASK				0x14
+#define IRQ1_CTL_STATUS				0x18
+#define IRQ1_CTL_CLEAR				0x1c
+#define IRQ1_CTL_ENABLE				0x20
+
+/* software to set the clock gate to use the port or mgc */
+#define IS_IO_GPREGS_BASE			(IS_IO_BASE + 0x49200)
+#define SRST_PORT_ARB				0x0
+#define SRST_MGC				0x4
+#define SRST_WIDTH_CONV				0x8
+#define SRST_CSI_IRQ				0xc
+#define SRST_CSI_LEGACY_IRQ			0x10
+#define CLK_EN_TXCLKESC				0x14
+#define CLK_DIV_FACTOR_IS_CLK			0x18
+#define CLK_DIV_FACTOR_APB_CLK			0x1c
+#define CSI_PORT_CLK_GATE			0x20
+#define CSI_PORTAB_AGGREGATION			0x24
+#define MGC_CLK_GATE				0x2c
+#define CG_CTRL_BITS				0x3c
+#define SPARE_RW				0xf8
+#define SPARE_RO				0xfc
+
+#define IS_IO_CSI2_MPF_PORT_BASE(i)		(IS_IO_BASE + 0x53000 + \
+						 0x1000 * (i))
+#define MPF_16_IRQ_CNTRL_STATUS			0x238
+#define MPF_16_IRQ_CNTRL_CLEAR			0x23c
+#define MPF_16_IRQ_CNTRL_ENABLE			0x240
+
+/* software config the phy */
+#define IS_IO_CSI2_GPREGS_BASE		(IS_IO_BASE + 0x53400)
+#define IPU8_IS_IO_CSI2_GPREGS_BASE	(IS_IO_BASE + 0x40e00)
+#define CSI_ADAPT_LAYER_SRST		0x0
+#define MPF_SRST_RST			0x4
+#define CSI_ERR_IRQ_CTRL_SRST		0x8
+#define CSI_SYNC_RC_SRST		0xc
+#define CSI_CG_CTRL_BITS		0x10
+#define SOC_CSI2HOST_SELECT		0x14
+#define PHY_RESET			0x18
+#define PHY_SHUTDOWN			0x1c
+#define PHY_MODE			0x20
+#define PHY_READY			0x24
+#define PHY_CLK_LANE_FORCE_CONTROL	0x28
+#define PHY_CLK_LANE_CONTROL		0x2c
+#define PHY_CLK_LANE_STATUS		0x30
+#define PHY_LANE_RX_ESC_REQ		0x34
+#define PHY_LANE_RX_ESC_DATA		0x38
+#define PHY_LANE_TURNDISABLE		0x3c
+#define PHY_LANE_DIRECTION		0x40
+#define PHY_LANE_FORCE_CONTROL		0x44
+#define PHY_LANE_CONTROL_EN		0x48
+#define PHY_LANE_CONTROL_DATAWIDTH	0x4c
+#define PHY_LANE_STATUS			0x50
+#define PHY_LANE_ERR			0x54
+#define PHY_LANE_RXALP			0x58
+#define PHY_LANE_RXALP_NIBBLE		0x5c
+#define PHY_PARITY_ERROR		0x60
+#define PHY_DEBUG_REGS_CLK_GATE_EN	0x64
+#define SPARE_RW			0xf8
+#define SPARE_RO			0xfc
+
+/* software not touch */
+#define PORT_ARB_BASE				(IS_IO_BASE + 0x4e000)
+#define PORT_ARB_IRQ_CTL_STATUS			0x4
+#define PORT_ARB_IRQ_CTL_CLEAR			0x8
+#define PORT_ARB_IRQ_CTL_ENABLE			0xc
+
+#define MGC_PPC					4
+#define MGC_DTYPE_RAW(i)			(((i) - 8) / 2)
+#define IS_IO_MGC_BASE				(IS_IO_BASE + 0x48000)
+#define MGC_KICK				0x0
+#define MGC_ASYNC_STOP				0x4
+#define MGC_PORT_OFFSET				0x100
+#define MGC_CSI_PORT_MAP(i)			(0x8 + (i) * 0x4)
+#define MGC_MG_PORT(i)				(IS_IO_MGC_BASE +	\
+						 (i) * MGC_PORT_OFFSET)
+/* per mgc instance */
+#define MGC_MG_CSI_ADAPT_LAYER_TYPE		0x28
+#define MGC_MG_MODE				0x2c
+#define MGC_MG_INIT_COUNTER			0x30
+#define MGC_MG_MIPI_VC				0x34
+#define MGC_MG_MIPI_DTYPES			0x38
+#define MGC_MG_MULTI_DTYPES_MODE		0x3c
+#define MGC_MG_NOF_FRAMES			0x40
+#define MGC_MG_FRAME_DIM			0x44
+#define MGC_MG_HBLANK				0x48
+#define MGC_MG_VBLANK				0x4c
+#define MGC_MG_TPG_MODE				0x50
+#define MGC_MG_TPG_R0				0x54
+#define MGC_MG_TPG_G0				0x58
+#define MGC_MG_TPG_B0				0x5c
+#define MGC_MG_TPG_R1				0x60
+#define MGC_MG_TPG_G1				0x64
+#define MGC_MG_TPG_B1				0x68
+#define MGC_MG_TPG_FACTORS			0x6c
+#define MGC_MG_TPG_MASKS			0x70
+#define MGC_MG_TPG_XY_MASK			0x74
+#define MGC_MG_TPG_TILE_DIM			0x78
+#define MGC_MG_PRBS_LFSR_INIT_0			0x7c
+#define MGC_MG_PRBS_LFSR_INIT_1			0x80
+#define MGC_MG_SYNC_STOP_POINT			0x84
+#define MGC_MG_SYNC_STOP_POINT_LOC		0x88
+#define MGC_MG_ERR_INJECT			0x8c
+#define MGC_MG_ERR_LOCATION			0x90
+#define MGC_MG_DTO_SPEED_CTRL_EN		0x94
+#define MGC_MG_DTO_SPEED_CTRL_INCR_VAL		0x98
+#define MGC_MG_HOR_LOC_STTS			0x9c
+#define MGC_MG_VER_LOC_STTS			0xa0
+#define MGC_MG_FRAME_NUM_STTS			0xa4
+#define MGC_MG_BUSY_STTS			0xa8
+#define MGC_MG_STOPPED_STTS			0xac
+/* tile width and height in pixels for Chess board and Color palette */
+#define MGC_TPG_TILE_WIDTH			64
+#define MGC_TPG_TILE_HEIGHT			64
+
+#define IPU_CSI_PORT_A_ADDR_OFFSET		0x0
+#define IPU_CSI_PORT_B_ADDR_OFFSET		0x0
+#define IPU_CSI_PORT_C_ADDR_OFFSET		0x0
+#define IPU_CSI_PORT_D_ADDR_OFFSET		0x0
+
+/*
+ * 0 - CSI RX Port 0 interrupt;
+ * 1 - MPF Port 0 interrupt;
+ * 2 - CSI RX Port 1 interrupt;
+ * 3 - MPF Port 1 interrupt;
+ * 4 - CSI RX Port 2 interrupt;
+ * 5 - MPF Port 2 interrupt;
+ * 6 - CSI RX Port 3 interrupt;
+ * 7 - MPF Port 3 interrupt;
+ * 8 - Port ARB FIFO 0 overflow;
+ * 9 - Port ARB FIFO 1 overflow;
+ * 10 - Port ARB FIFO 2 overflow;
+ * 11 - Port ARB FIFO 3 overflow;
+ * 12 - isys_cfgnoc_err_probe_intl;
+ * 13-15 - reserved
+ */
+#define IPU7_CSI_IS_IO_IRQ_MASK		0xffff
+
+/* Adapter layer irq */
+#define IPU7_CSI_ADPL_IRQ_MASK		0xffff
+
+/* sw irq from legacy irq control
+ * legacy irq status
+ * IPU7
+ * 0 - CSI Port 0 error interrupt
+ * 1 - CSI Port 0 sync interrupt
+ * 2 - CSI Port 1 error interrupt
+ * 3 - CSI Port 1 sync interrupt
+ * 4 - CSI Port 2 error interrupt
+ * 5 - CSI Port 2 sync interrupt
+ * 6 - CSI Port 3 error interrupt
+ * 7 - CSI Port 3 sync interrupt
+ * IPU7P5
+ * 0 - CSI Port 0 error interrupt
+ * 1 - CSI Port 0 fs interrupt
+ * 2 - CSI Port 0 fe interrupt
+ * 3 - CSI Port 1 error interrupt
+ * 4 - CSI Port 1 fs interrupt
+ * 5 - CSI Port 1 fe interrupt
+ * 6 - CSI Port 2 error interrupt
+ * 7 - CSI Port 2 fs interrupt
+ * 8 - CSI Port 2 fe interrupt
+ */
+#define IPU7_CSI_RX_LEGACY_IRQ_MASK		0x1ff
+
+/* legacy error status per port
+ * 0 - Error handler FIFO full;
+ * 1 - Reserved Short Packet encoding detected;
+ * 2 - Reserved Long Packet encoding detected;
+ * 3 - Received packet is too short (fewer data words than specified in header);
+ * 4 - Received packet is too long (more data words than specified in header);
+ * 5 - Short packet discarded due to errors;
+ * 6 - Long packet discarded due to errors;
+ * 7 - CSI Combo Rx interrupt;
+ * 8 - IDI CDC FIFO overflow; remaining bits are reserved and tied to 0;
+ */
+#define IPU7_CSI_RX_ERROR_IRQ_MASK		0xfff
+
+/*
+ * 0 - VC0 frame start received
+ * 1 - VC0 frame end received
+ * 2 - VC1 frame start received
+ * 3 - VC1 frame end received
+ * 4 - VC2 frame start received
+ * 5 - VC2 frame end received
+ * 6 - VC3 frame start received
+ * 7 - VC3 frame end received
+ * 8 - VC4 frame start received
+ * 9 - VC4 frame end received
+ * 10 - VC5 frame start received
+ * 11 - VC5 frame end received
+ * 12 - VC6 frame start received
+ * 13 - VC6 frame end received
+ * 14 - VC7 frame start received
+ * 15 - VC7 frame end received
+ * 16 - VC8 frame start received
+ * 17 - VC8 frame end received
+ * 18 - VC9 frame start received
+ * 19 - VC9 frame end received
+ * 20 - VC10 frame start received
+ * 21 - VC10 frame end received
+ * 22 - VC11 frame start received
+ * 23 - VC11 frame end received
+ * 24 - VC12 frame start received
+ * 25 - VC12 frame end received
+ * 26 - VC13 frame start received
+ * 27 - VC13 frame end received
+ * 28 - VC14 frame start received
+ * 29 - VC14 frame end received
+ * 30 - VC15 frame start received
+ * 31 - VC15 frame end received
+ */
+
+#define IPU7_CSI_RX_SYNC_IRQ_MASK		0 /* 0xffffffff */
+#define IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK		0 /* 0xffffffff */
+
+#define CSI_RX_NUM_ERRORS_IN_IRQ		12
+#define CSI_RX_NUM_SYNC_IN_IRQ			32
+
+enum CSI_FE_MODE_TYPE {
+	CSI_FE_DPHY_MODE = 0,
+	CSI_FE_CPHY_MODE = 1,
+};
+
+enum CSI_FE_INPUT_MODE {
+	CSI_SENSOR_INPUT = 0,
+	CSI_MIPIGEN_INPUT = 1,
+};
+
+enum MGC_CSI_ADPL_TYPE {
+	MGC_MAPPED_2_LANES = 0,
+	MGC_MAPPED_4_LANES = 1,
+};
+
+enum CSI2HOST_SELECTION {
+	CSI2HOST_SEL_SOC = 0,
+	CSI2HOST_SEL_CSI2HOST = 1,
+};
+
+#define IPU7_ISYS_LEGACY_IRQ_CSI2(port)		(0x3 << (port))
+#define IPU7P5_ISYS_LEGACY_IRQ_CSI2(port)	(0x7 << (port))
+
+/* ---------------------------------------------------------------- */
+#define CSI_REG_BASE				0x220000
+#define CSI_REG_BASE_PORT(id)			((id) * 0x1000)
+
+/* CSI Port General Purpose Registers */
+#define CSI_REG_PORT_GPREG_SRST			0x0
+#define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST	0x4
+#define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL	0x8
+
+#define CSI_RX_NUM_IRQ				32
+
+#define IPU7_CSI_RX_SYNC_FS_VC			0x55555555
+#define IPU7_CSI_RX_SYNC_FE_VC			0xaaaaaaaa
+#define IPU7P5_CSI_RX_SYNC_FS_VC		0xffff
+#define IPU7P5_CSI_RX_SYNC_FE_VC		0xffff
+
+#endif /* IPU7_ISYS_CSI2_REG_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
new file mode 100644
index 000000000000..32124b3d6bb7
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
@@ -0,0 +1,565 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/atomic.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "ipu7.h"
+#include "ipu7-bus.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-csi2.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-isys-csi-phy.h"
+
+static const u32 csi2_supported_codes[] = {
+	MEDIA_BUS_FMT_Y10_1X10,
+	MEDIA_BUS_FMT_RGB565_1X16,
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_YUYV8_1X16,
+	MEDIA_BUS_FMT_YUYV10_1X20,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	0,
+};
+
+s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2)
+{
+	struct media_pad *src_pad;
+	struct v4l2_subdev *ext_sd;
+	struct device *dev;
+
+	if (!csi2)
+		return -EINVAL;
+
+	dev = &csi2->isys->adev->auxdev.dev;
+	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
+	if (IS_ERR(src_pad)) {
+		dev_err(dev, "can't get source pad of %s (%ld)\n",
+			csi2->asd.sd.name, PTR_ERR(src_pad));
+		return PTR_ERR(src_pad);
+	}
+
+	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
+		return -ENODEV;
+
+	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
+}
+
+static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				struct v4l2_event_subscription *sub)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+
+	dev_dbg(dev, "csi2 subscribe event(type %u id %u)\n",
+		sub->type, sub->id);
+
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 10, NULL);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_core_ops csi2_sd_core_ops = {
+	.subscribe_event = csi2_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static void csi2_irq_en(struct ipu7_isys_csi2 *csi2, bool enable)
+{
+	struct ipu7_device *isp = csi2->isys->adev->isp;
+	unsigned int offset, mask;
+
+	if (!enable) {
+		/* disable CSI2 legacy error irq */
+		offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+		mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+		writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
+		writel(0, csi2->base + offset + IRQ_CTL_MASK);
+		writel(0, csi2->base + offset + IRQ_CTL_ENABLE);
+
+		/* disable CSI2 legacy sync irq */
+		offset = IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+		mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
+		writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
+		writel(0, csi2->base + offset + IRQ_CTL_MASK);
+		writel(0, csi2->base + offset + IRQ_CTL_ENABLE);
+
+		if (!is_ipu7(isp->hw_ver)) {
+			writel(mask, csi2->base + offset + IRQ1_CTL_CLEAR);
+			writel(0, csi2->base + offset + IRQ1_CTL_MASK);
+			writel(0, csi2->base + offset + IRQ1_CTL_ENABLE);
+		}
+
+		return;
+	}
+
+	/* enable CSI2 legacy error irq */
+	offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+	writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
+	writel(mask, csi2->base + offset + IRQ_CTL_MASK);
+	writel(mask, csi2->base + offset + IRQ_CTL_ENABLE);
+
+	/* enable CSI2 legacy sync irq */
+	offset = IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
+	writel(mask, csi2->base + offset + IRQ_CTL_CLEAR);
+	writel(mask, csi2->base + offset + IRQ_CTL_MASK);
+	writel(mask, csi2->base + offset + IRQ_CTL_ENABLE);
+
+	mask = IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK;
+	if (!is_ipu7(isp->hw_ver)) {
+		writel(mask, csi2->base + offset + IRQ1_CTL_CLEAR);
+		writel(mask, csi2->base + offset + IRQ1_CTL_MASK);
+		writel(mask, csi2->base + offset + IRQ1_CTL_ENABLE);
+	}
+}
+
+static void ipu7_isys_csi2_disable_stream(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_isys *isys = csi2->isys;
+	void __iomem *isys_base = isys->pdata->base;
+	unsigned int port, nlanes, offset, val;
+
+	port = csi2->port;
+	nlanes = csi2->nlanes;
+
+	csi2_irq_en(csi2, 0);
+
+	offset = IS_IO_GPREGS_BASE;
+	val = readl(isys_base + offset + CSI_PORT_CLK_GATE);
+	val &= ~(1 << port);
+	if (port == 0 && nlanes == 4 && !is_ipu7(isys->adev->isp->hw_ver))
+		val &= ~BIT(1);
+	writel(val, isys_base + offset + CSI_PORT_CLK_GATE);
+
+	/* power down */
+	ipu7_isys_csi_phy_powerdown(csi2);
+	writel(0x4, isys_base + offset + CLK_DIV_FACTOR_APB_CLK);
+}
+
+static int ipu7_isys_csi2_enable_stream(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_isys *isys = csi2->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *isys_base = isys->pdata->base;
+	unsigned int port, nlanes, offset, val;
+	int ret;
+
+	port = csi2->port;
+	nlanes = csi2->nlanes;
+
+	offset = IS_IO_GPREGS_BASE;
+	/* port AB support aggregation, configure 2 ports */
+	val = readl(isys_base + offset + CSI_PORT_CLK_GATE);
+	writel(val | (0x3 << (port & 0x2)),
+	       isys_base + offset + CSI_PORT_CLK_GATE);
+	writel(0x2, isys_base + offset + CLK_DIV_FACTOR_APB_CLK);
+	dev_dbg(dev, "port %u CLK_GATE = 0x%04x DIV_FACTOR_APB_CLK=0x%04x\n",
+		port, readl(isys_base + offset + CSI_PORT_CLK_GATE),
+		readl(isys_base + offset + CLK_DIV_FACTOR_APB_CLK));
+	if (port == 0 && nlanes == 4 && !is_ipu7(isys->adev->isp->hw_ver)) {
+		dev_info(dev, "CSI port %u in aggregation mode\n", port);
+		writel(0x1, isys_base + offset + CSI_PORTAB_AGGREGATION);
+	}
+
+	/* input is coming from CSI receiver (sensor) */
+	offset = IS_IO_CSI2_ADPL_PORT_BASE(port);
+	writel(CSI_SENSOR_INPUT, isys_base + offset + CSI2_ADPL_INPUT_MODE);
+	writel(1, isys_base + offset + CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_EN);
+
+	/* Enable DPHY power */
+	ret = ipu7_isys_csi_phy_powerup(csi2);
+	if (ret) {
+		dev_err(dev, "CSI-%d PHY power up failed %d\n", port, ret);
+		return ret;
+	}
+	csi2_irq_en(csi2, 1);
+
+	return 0;
+}
+
+static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	struct device *dev = &asd->isys->adev->auxdev.dev;
+	struct v4l2_mbus_framefmt *sink_ffmt;
+	struct v4l2_mbus_framefmt *src_ffmt;
+	struct v4l2_rect *crop;
+
+	if (sel->pad == CSI2_PAD_SINK || sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								 sel->pad,
+								 sel->stream);
+	if (!sink_ffmt)
+		return -EINVAL;
+
+	src_ffmt = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
+	if (!src_ffmt)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	/* Only vertical cropping is supported */
+	sel->r.left = 0;
+	sel->r.width = sink_ffmt->width;
+	/* Non-bayer formats can't be single line cropped */
+	if (!ipu7_isys_is_bayer_format(sink_ffmt->code))
+		sel->r.top &= ~1;
+	sel->r.height = clamp(sel->r.height & ~1, IPU_ISYS_MIN_HEIGHT,
+			      sink_ffmt->height - sel->r.top);
+	*crop = sel->r;
+
+	/* update source pad format */
+	src_ffmt->width = sel->r.width;
+	src_ffmt->height = sel->r.height;
+	if (ipu7_isys_is_bayer_format(sink_ffmt->code))
+		src_ffmt->code = ipu7_isys_convert_bayer_order(sink_ffmt->code,
+							       sel->r.left,
+							       sel->r.top);
+	dev_dbg(dev, "set crop for %s sel: %d,%d,%d,%d code: 0x%x\n",
+		sd->name, sel->r.left, sel->r.top, sel->r.width, sel->r.height,
+		src_ffmt->code);
+
+	return 0;
+}
+
+static int ipu7_isys_csi2_get_sel(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *sink_ffmt;
+	struct v4l2_rect *crop;
+	int ret = 0;
+
+	if (sd->entity.pads[sel->pad].flags & MEDIA_PAD_FL_SINK)
+		return -EINVAL;
+
+	sink_ffmt = v4l2_subdev_state_get_opposite_stream_format(state,
+								 sel->pad,
+								 sel->stream);
+	if (!sink_ffmt)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
+	if (!crop)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = sink_ffmt->width;
+		sel->r.height = sink_ffmt->height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *crop;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+/*
+ * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
+ * of streams.
+ */
+#define CSI2_SUBDEV_MAX_STREAM_ID 63
+
+static int ipu7_isys_csi2_enable_streams(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 u32 pad, u64 streams_mask)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
+	struct v4l2_subdev *r_sd;
+	struct media_pad *r_pad;
+	u32 sink_pad, sink_stream;
+	int ret, i;
+
+	if (!csi2->stream_count) {
+		dev_dbg(&csi2->isys->adev->auxdev.dev,
+			"stream on CSI2-%u with %u lanes\n", csi2->port,
+			csi2->nlanes);
+		ret = ipu7_isys_csi2_enable_stream(csi2);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i <= CSI2_SUBDEV_MAX_STREAM_ID; i++) {
+		if (streams_mask & BIT_ULL(i))
+			break;
+	}
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, i,
+						    &sink_pad, &sink_stream);
+	if (ret)
+		return ret;
+
+	r_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	r_sd = media_entity_to_v4l2_subdev(r_pad->entity);
+
+	ret = v4l2_subdev_enable_streams(r_sd, r_pad->index,
+					 BIT_ULL(sink_stream));
+	if (!ret) {
+		csi2->stream_count++;
+		return 0;
+	}
+
+	if (!csi2->stream_count)
+		ipu7_isys_csi2_disable_stream(csi2);
+
+	return ret;
+}
+
+static int ipu7_isys_csi2_disable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	struct ipu7_isys_csi2 *csi2 = to_ipu7_isys_csi2(asd);
+	struct v4l2_subdev *r_sd;
+	struct media_pad *r_pad;
+	u32 sink_pad, sink_stream;
+	int ret, i;
+
+	for (i = 0; i <= CSI2_SUBDEV_MAX_STREAM_ID; i++) {
+		if (streams_mask & BIT_ULL(i))
+			break;
+	}
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, i,
+						    &sink_pad, &sink_stream);
+	if (ret)
+		return ret;
+
+	r_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	r_sd = media_entity_to_v4l2_subdev(r_pad->entity);
+
+	v4l2_subdev_disable_streams(r_sd, r_pad->index, BIT_ULL(sink_stream));
+
+	if (--csi2->stream_count)
+		return 0;
+
+	dev_dbg(&csi2->isys->adev->auxdev.dev,
+		"stream off CSI2-%u with %u lanes\n", csi2->port, csi2->nlanes);
+
+	ipu7_isys_csi2_disable_stream(csi2);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ipu7_isys_subdev_set_fmt,
+	.get_selection = ipu7_isys_csi2_get_sel,
+	.set_selection = ipu7_isys_csi2_set_sel,
+	.enum_mbus_code = ipu7_isys_subdev_enum_mbus_code,
+	.enable_streams = ipu7_isys_csi2_enable_streams,
+	.disable_streams = ipu7_isys_csi2_disable_streams,
+	.set_routing = ipu7_isys_subdev_set_routing,
+};
+
+static const struct v4l2_subdev_ops csi2_sd_ops = {
+	.core = &csi2_sd_core_ops,
+	.pad = &csi2_sd_pad_ops,
+};
+
+static const struct media_entity_operations csi2_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
+void ipu7_isys_csi2_cleanup(struct ipu7_isys_csi2 *csi2)
+{
+	if (!csi2->isys)
+		return;
+
+	v4l2_device_unregister_subdev(&csi2->asd.sd);
+	v4l2_subdev_cleanup(&csi2->asd.sd);
+	ipu7_isys_subdev_cleanup(&csi2->asd);
+	csi2->isys = NULL;
+}
+
+int ipu7_isys_csi2_init(struct ipu7_isys_csi2 *csi2,
+			struct ipu7_isys *isys,
+			void __iomem *base, unsigned int index)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	int ret;
+
+	csi2->isys = isys;
+	csi2->base = base;
+	csi2->port = index;
+
+	if (!is_ipu7(isys->adev->isp->hw_ver))
+		csi2->legacy_irq_mask = 0x7 << (index * 3);
+	else
+		csi2->legacy_irq_mask = 0x3 << (index * 2);
+
+	dev_dbg(dev, "csi-%d legacy irq mask = 0x%x\n", index,
+		csi2->legacy_irq_mask);
+
+	csi2->asd.sd.entity.ops = &csi2_entity_ops;
+	csi2->asd.isys = isys;
+
+	ret = ipu7_isys_subdev_init(&csi2->asd, &csi2_sd_ops, 0,
+				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
+	if (ret)
+		return ret;
+
+	csi2->asd.source = IPU_INSYS_MIPI_PORT_0 + index;
+	csi2->asd.supported_codes = csi2_supported_codes;
+	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
+		 IPU_ISYS_ENTITY_PREFIX " CSI2 %u", index);
+	v4l2_set_subdevdata(&csi2->asd.sd, &csi2->asd);
+
+	ret = v4l2_subdev_init_finalize(&csi2->asd.sd);
+	if (ret) {
+		dev_err(dev, "failed to init v4l2 subdev (%d)\n", ret);
+		goto isys_subdev_cleanup;
+	}
+
+	ret = v4l2_device_register_subdev(&isys->v4l2_dev, &csi2->asd.sd);
+	if (ret) {
+		dev_err(dev, "failed to register v4l2 subdev (%d)\n", ret);
+		goto v4l2_subdev_cleanup;
+	}
+
+	return 0;
+
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(&csi2->asd.sd);
+isys_subdev_cleanup:
+	ipu7_isys_subdev_cleanup(&csi2->asd);
+
+	return ret;
+}
+
+void ipu7_isys_csi2_sof_event_by_stream(struct ipu7_isys_stream *stream)
+{
+	struct ipu7_isys_csi2 *csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct video_device *vdev = csi2->asd.sd.devnode;
+	struct v4l2_event ev = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	ev.id = stream->vc;
+	ev.u.frame_sync.frame_sequence = atomic_fetch_inc(&stream->sequence);
+	v4l2_event_queue(vdev, &ev);
+
+	dev_dbg(dev, "sof_event::csi2-%i sequence: %i, vc: %d\n",
+		csi2->port, ev.u.frame_sync.frame_sequence, stream->vc);
+}
+
+void ipu7_isys_csi2_eof_event_by_stream(struct ipu7_isys_stream *stream)
+{
+	struct ipu7_isys_csi2 *csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	u32 frame_sequence = atomic_read(&stream->sequence);
+
+	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
+		csi2->port, frame_sequence);
+}
+
+int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
+				   struct ipu7_isys_csi2 *csi2,
+				   struct media_entity *source_entity,
+				   struct v4l2_mbus_frame_desc_entry *entry,
+				   int *nr_queues)
+{
+	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_mbus_frame_desc desc;
+	struct v4l2_subdev *source;
+	struct media_pad *pad;
+	unsigned int i;
+	int ret;
+
+	source = media_entity_to_v4l2_subdev(source_entity);
+	if (!source)
+		return -EPIPE;
+
+	pad = media_pad_remote_pad_first(&csi2->asd.pad[CSI2_PAD_SINK]);
+	if (!pad)
+		return -EPIPE;
+
+	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
+	if (ret)
+		return ret;
+
+	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(dev, "Unsupported frame descriptor type\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < desc.num_entries; i++) {
+		if (source_stream == desc.entry[i].stream) {
+			desc_entry = &desc.entry[i];
+			break;
+		}
+	}
+
+	if (!desc_entry) {
+		dev_err(dev, "Failed to find stream %u from remote subdev\n",
+			source_stream);
+		return -EINVAL;
+	}
+
+	if (desc_entry->bus.csi2.vc >= NR_OF_CSI2_VC) {
+		dev_err(dev, "invalid vc %d\n", desc_entry->bus.csi2.vc);
+		return -EINVAL;
+	}
+
+	*entry = *desc_entry;
+
+	for (i = 0; i < desc.num_entries; i++) {
+		if (desc_entry->bus.csi2.vc == desc.entry[i].bus.csi2.vc)
+			(*nr_queues)++;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
new file mode 100644
index 000000000000..a07088a6495e
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_CSI2_H
+#define IPU7_ISYS_CSI2_H
+
+#include <linux/container_of.h>
+#include <linux/types.h>
+
+#include "ipu7-isys-subdev.h"
+#include "ipu7-isys-video.h"
+
+struct ipu7_isys;
+struct ipu7_isys_csi2_pdata;
+struct ipu7_isys_stream;
+
+#define NR_OF_CSI2_VC		16
+#define INVALID_VC_ID		-1
+#define NR_OF_CSI2_SINK_PADS	1
+#define CSI2_PAD_SINK		0
+#define NR_OF_CSI2_SRC_PADS	8
+#define CSI2_PAD_SRC		1
+#define NR_OF_CSI2_PADS		(NR_OF_CSI2_SINK_PADS + NR_OF_CSI2_SRC_PADS)
+
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_A		0
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_CLANE_B		0
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_A		95
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_CLANE_B		-8
+
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_A		0
+#define CSI2_CSI_RX_DLY_CNT_TERMEN_DLANE_B		0
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_A		85
+#define CSI2_CSI_RX_DLY_CNT_SETTLE_DLANE_B		-2
+
+/*
+ * struct ipu7_isys_csi2
+ *
+ * @nlanes: number of lanes in the receiver
+ */
+struct ipu7_isys_csi2 {
+	struct ipu7_isys_subdev asd;
+	struct ipu7_isys_csi2_pdata *pdata;
+	struct ipu7_isys *isys;
+	struct ipu7_isys_video av[NR_OF_CSI2_SRC_PADS];
+
+	void __iomem *base;
+	u32 receiver_errors;
+	u32 legacy_irq_mask;
+	unsigned int nlanes;
+	unsigned int port;
+	unsigned int phy_mode;
+	unsigned int stream_count;
+};
+
+#define ipu7_isys_subdev_to_csi2(__sd)			\
+	container_of(__sd, struct ipu7_isys_csi2, asd)
+
+#define to_ipu7_isys_csi2(__asd) container_of(__asd, struct ipu7_isys_csi2, asd)
+
+s64 ipu7_isys_csi2_get_link_freq(struct ipu7_isys_csi2 *csi2);
+int ipu7_isys_csi2_init(struct ipu7_isys_csi2 *csi2, struct ipu7_isys *isys,
+			void __iomem *base, unsigned int index);
+void ipu7_isys_csi2_cleanup(struct ipu7_isys_csi2 *csi2);
+void ipu7_isys_csi2_sof_event_by_stream(struct ipu7_isys_stream *stream);
+void ipu7_isys_csi2_eof_event_by_stream(struct ipu7_isys_stream *stream);
+int ipu7_isys_csi2_get_remote_desc(u32 source_stream,
+				   struct ipu7_isys_csi2 *csi2,
+				   struct media_entity *source_entity,
+				   struct v4l2_mbus_frame_desc_entry *entry,
+				   int *nr_queues);
+#endif /* IPU7_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-queue.c b/drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
new file mode 100644
index 000000000000..180cc368f19b
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
@@ -0,0 +1,836 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/atomic.h>
+#include <linux/bug.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "abi/ipu7_fw_isys_abi.h"
+
+#include "ipu7-bus.h"
+#include "ipu7-dma.h"
+#include "ipu7-fw-isys.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-video.h"
+
+#define IPU_MAX_FRAME_COUNTER	(U8_MAX + 1)
+
+static int ipu7_isys_buf_init(struct vb2_buffer *vb)
+{
+	struct ipu7_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
+	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu7_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu7_isys_video_buffer(vvb);
+	int ret;
+
+	ret = ipu7_dma_map_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
+	if (ret)
+		return ret;
+
+	ivb->dma_addr = sg_dma_address(sg->sgl);
+
+	return 0;
+}
+
+static void ipu7_isys_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct ipu7_isys *isys = vb2_get_drv_priv(vb->vb2_queue);
+	struct sg_table *sg = vb2_dma_sg_plane_desc(vb, 0);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu7_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu7_isys_video_buffer(vvb);
+
+	ivb->dma_addr = 0;
+	ipu7_dma_unmap_sgtable(isys->adev, sg, DMA_TO_DEVICE, 0);
+}
+
+static int ipu7_isys_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				 unsigned int *num_planes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	u32 size = av->pix_fmt.sizeimage;
+
+	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
+	if (!*num_planes) {
+		sizes[0] = size;
+	} else if (sizes[0] < size) {
+		dev_dbg(dev, "%s: queue setup: size %u < %u\n",
+			av->vdev.name, sizes[0], size);
+		return -EINVAL;
+	}
+
+	*num_planes = 1;
+
+	return 0;
+}
+
+static int ipu7_isys_buf_prepare(struct vb2_buffer *vb)
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	u32 bytesperline = av->pix_fmt.bytesperline;
+	u32 height = av->pix_fmt.height;
+
+	dev_dbg(dev, "buffer: %s: configured size %u, buffer size %lu\n",
+		av->vdev.name, av->pix_fmt.sizeimage, vb2_plane_size(vb, 0));
+
+	if (av->pix_fmt.sizeimage > vb2_plane_size(vb, 0))
+		return -EINVAL;
+
+	dev_dbg(dev, "buffer: %s: bytesperline %u, height %u\n",
+		av->vdev.name, bytesperline, height);
+	vb2_set_plane_payload(vb, 0, bytesperline * height);
+
+	return 0;
+}
+
+/*
+ * Queue a buffer list back to incoming or active queues. The buffers
+ * are removed from the buffer list.
+ */
+void ipu7_isys_buffer_list_queue(struct ipu7_isys_buffer_list *bl,
+				 unsigned long op_flags,
+				 enum vb2_buffer_state state)
+{
+	struct ipu7_isys_buffer *ib, *ib_safe;
+	unsigned long flags;
+	bool first = true;
+
+	if (!bl)
+		return;
+
+	WARN_ON_ONCE(!bl->nbufs);
+	WARN_ON_ONCE(op_flags & IPU_ISYS_BUFFER_LIST_FL_ACTIVE &&
+		     op_flags & IPU_ISYS_BUFFER_LIST_FL_INCOMING);
+
+	list_for_each_entry_safe(ib, ib_safe, &bl->head, head) {
+		struct ipu7_isys_video *av;
+
+		struct vb2_buffer *vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+		struct ipu7_isys_queue *aq =
+			vb2_queue_to_isys_queue(vb->vb2_queue);
+
+		av = ipu7_isys_queue_to_video(aq);
+		spin_lock_irqsave(&aq->lock, flags);
+		list_del(&ib->head);
+		if (op_flags & IPU_ISYS_BUFFER_LIST_FL_ACTIVE)
+			list_add(&ib->head, &aq->active);
+		else if (op_flags & IPU_ISYS_BUFFER_LIST_FL_INCOMING)
+			list_add_tail(&ib->head, &aq->incoming);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		if (op_flags & IPU_ISYS_BUFFER_LIST_FL_SET_STATE)
+			vb2_buffer_done(vb, state);
+
+		if (first) {
+			dev_dbg(&av->isys->adev->auxdev.dev,
+				"queue buf list %p flags %lx, s %d, %d bufs\n",
+				bl, op_flags, state, bl->nbufs);
+			first = false;
+		}
+
+		bl->nbufs--;
+	}
+
+	WARN_ON(bl->nbufs);
+}
+
+/*
+ * flush_firmware_streamon_fail() - Flush in cases where requests may
+ * have been queued to firmware and the *firmware streamon fails for a
+ * reason or another.
+ */
+static void flush_firmware_streamon_fail(struct ipu7_isys_stream *stream)
+{
+	struct ipu7_isys_queue *aq;
+	unsigned long flags;
+
+	lockdep_assert_held(&stream->mutex);
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+		struct device *dev = &av->isys->adev->auxdev.dev;
+		struct ipu7_isys_buffer *ib, *ib_safe;
+
+		spin_lock_irqsave(&aq->lock, flags);
+		list_for_each_entry_safe(ib, ib_safe, &aq->active, head) {
+			struct vb2_buffer *vb =
+				ipu7_isys_buffer_to_vb2_buffer(ib);
+
+			list_del(&ib->head);
+			if (av->streaming) {
+				dev_dbg(dev,
+					"%s: queue buffer %u back to incoming\n",
+					av->vdev.name, vb->index);
+				/* Queue already streaming, return to driver. */
+				list_add(&ib->head, &aq->incoming);
+				continue;
+			}
+			/* Queue not yet streaming, return to user. */
+			dev_dbg(dev, "%s: return %u back to videobuf2\n",
+				av->vdev.name, vb->index);
+			vb2_buffer_done(ipu7_isys_buffer_to_vb2_buffer(ib),
+					VB2_BUF_STATE_QUEUED);
+		}
+		spin_unlock_irqrestore(&aq->lock, flags);
+	}
+}
+
+/*
+ * Attempt obtaining a buffer list from the incoming queues, a list of buffers
+ * that contains one entry from each video buffer queue. If a buffer can't be
+ * obtained from every queue, the buffers are returned back to the queue.
+ */
+static int buffer_list_get(struct ipu7_isys_stream *stream,
+			   struct ipu7_isys_buffer_list *bl)
+{
+	unsigned long buf_flag = IPU_ISYS_BUFFER_LIST_FL_INCOMING;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu7_isys_queue *aq;
+	unsigned long flags;
+
+	bl->nbufs = 0;
+	INIT_LIST_HEAD(&bl->head);
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu7_isys_buffer *ib;
+
+		spin_lock_irqsave(&aq->lock, flags);
+		if (list_empty(&aq->incoming)) {
+			spin_unlock_irqrestore(&aq->lock, flags);
+			if (!list_empty(&bl->head))
+				ipu7_isys_buffer_list_queue(bl, buf_flag, 0);
+			return -ENODATA;
+		}
+
+		ib = list_last_entry(&aq->incoming,
+				     struct ipu7_isys_buffer, head);
+
+		dev_dbg(dev, "buffer: %s: buffer %u\n",
+			ipu7_isys_queue_to_video(aq)->vdev.name,
+			ipu7_isys_buffer_to_vb2_buffer(ib)->index);
+		list_del(&ib->head);
+		list_add(&ib->head, &bl->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		bl->nbufs++;
+	}
+
+	dev_dbg(dev, "get buffer list %p, %u buffers\n", bl, bl->nbufs);
+
+	return 0;
+}
+
+static void ipu7_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
+					      struct ipu7_insys_buffset *set)
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu7_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu7_isys_video_buffer(vvb);
+
+	set->output_pins[aq->fw_output].addr = ivb->dma_addr;
+	set->output_pins[aq->fw_output].user_token = (uintptr_t)set;
+}
+
+/*
+ * Convert a buffer list to a isys fw ABI framebuffer set. The
+ * buffer list is not modified.
+ */
+#define IPU_ISYS_FRAME_NUM_THRESHOLD	(30)
+void ipu7_isys_buffer_to_fw_frame_buff(struct ipu7_insys_buffset *set,
+				       struct ipu7_isys_stream *stream,
+				       struct ipu7_isys_buffer_list *bl)
+{
+	struct ipu7_isys_buffer *ib;
+	u32 buf_id;
+
+	WARN_ON(!bl->nbufs);
+
+	set->skip_frame = 0;
+	set->capture_msg_map = IPU_INSYS_FRAME_ENABLE_MSG_SEND_RESP |
+			       IPU_INSYS_FRAME_ENABLE_MSG_SEND_IRQ;
+
+	buf_id = atomic_fetch_inc(&stream->buf_id);
+	set->frame_id = buf_id % IPU_MAX_FRAME_COUNTER;
+
+	list_for_each_entry(ib, &bl->head, head) {
+		struct vb2_buffer *vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+
+		ipu7_isys_buf_to_fw_frame_buf_pin(vb, set);
+	}
+}
+
+/* Start streaming for real. The buffer list must be available. */
+static int ipu7_isys_stream_start(struct ipu7_isys_video *av,
+				  struct ipu7_isys_buffer_list *bl, bool error)
+{
+	struct ipu7_isys_stream *stream = av->stream;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu7_isys_buffer_list __bl;
+	int ret;
+
+	mutex_lock(&stream->isys->stream_mutex);
+
+	ret = ipu7_isys_video_set_streaming(av, 1, bl);
+	mutex_unlock(&stream->isys->stream_mutex);
+	if (ret)
+		goto out_requeue;
+
+	stream->streaming = 1;
+
+	bl = &__bl;
+
+	do {
+		struct ipu7_insys_buffset *buf = NULL;
+		struct isys_fw_msgs *msg;
+		enum ipu7_insys_send_type send_type =
+			IPU_INSYS_SEND_TYPE_STREAM_CAPTURE;
+
+		ret = buffer_list_get(stream, bl);
+		if (ret < 0)
+			break;
+
+		msg = ipu7_get_fw_msg_buf(stream);
+		if (!msg)
+			return -ENOMEM;
+
+		buf = &msg->fw_msg.frame;
+
+		ipu7_isys_buffer_to_fw_frame_buff(buf, stream, bl);
+
+		ipu7_fw_isys_dump_frame_buff_set(dev, buf,
+						 stream->nr_output_pins);
+
+		ipu7_isys_buffer_list_queue(bl, IPU_ISYS_BUFFER_LIST_FL_ACTIVE,
+					    0);
+
+		ret = ipu7_fw_isys_complex_cmd(stream->isys,
+					       stream->stream_handle, buf,
+					       msg->dma_addr, sizeof(*buf),
+					       send_type);
+	} while (!WARN_ON(ret));
+
+	return 0;
+
+out_requeue:
+	if (bl && bl->nbufs)
+		ipu7_isys_buffer_list_queue(bl,
+					    IPU_ISYS_BUFFER_LIST_FL_INCOMING |
+					    (error ?
+					     IPU_ISYS_BUFFER_LIST_FL_SET_STATE :
+					     0), error ? VB2_BUF_STATE_ERROR :
+					    VB2_BUF_STATE_QUEUED);
+	flush_firmware_streamon_fail(stream);
+
+	return ret;
+}
+
+static void buf_queue(struct vb2_buffer *vb)
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu7_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu7_isys_video_buffer(vvb);
+	struct media_pipeline *media_pipe =
+		media_entity_pipeline(&av->vdev.entity);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu7_isys_stream *stream = av->stream;
+	struct ipu7_isys_buffer *ib = &ivb->ib;
+	struct ipu7_insys_buffset *buf = NULL;
+	struct ipu7_isys_buffer_list bl;
+	struct isys_fw_msgs *msg;
+	unsigned long flags;
+	dma_addr_t dma;
+	int ret;
+
+	dev_dbg(dev, "queue buffer %u for %s\n", vb->index, av->vdev.name);
+
+	dma = ivb->dma_addr;
+	dev_dbg(dev, "iova: iova %pad\n", &dma);
+
+	spin_lock_irqsave(&aq->lock, flags);
+	list_add(&ib->head, &aq->incoming);
+	spin_unlock_irqrestore(&aq->lock, flags);
+
+	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
+		dev_dbg(dev, "media pipeline is not ready for %s\n",
+			av->vdev.name);
+		return;
+	}
+
+	mutex_lock(&stream->mutex);
+
+	if (stream->nr_streaming != stream->nr_queues) {
+		dev_dbg(dev, "not streaming yet, adding to incoming\n");
+		goto out;
+	}
+
+	/*
+	 * We just put one buffer to the incoming list of this queue
+	 * (above). Let's see whether all queues in the pipeline would
+	 * have a buffer.
+	 */
+	ret = buffer_list_get(stream, &bl);
+	if (ret < 0) {
+		dev_dbg(dev, "No buffers available\n");
+		goto out;
+	}
+
+	msg = ipu7_get_fw_msg_buf(stream);
+	if (!msg) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	buf = &msg->fw_msg.frame;
+
+	ipu7_isys_buffer_to_fw_frame_buff(buf, stream, &bl);
+
+	ipu7_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
+
+	if (!stream->streaming) {
+		ret = ipu7_isys_stream_start(av, &bl, true);
+		if (ret)
+			dev_err(dev, "stream start failed.\n");
+		goto out;
+	}
+
+	/*
+	 * We must queue the buffers in the buffer list to the
+	 * appropriate video buffer queues BEFORE passing them to the
+	 * firmware since we could get a buffer event back before we
+	 * have queued them ourselves to the active queue.
+	 */
+	ipu7_isys_buffer_list_queue(&bl, IPU_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+
+	ret = ipu7_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
+				       buf, msg->dma_addr, sizeof(*buf),
+				       IPU_INSYS_SEND_TYPE_STREAM_CAPTURE);
+	if (ret < 0)
+		dev_err(dev, "send stream capture failed\n");
+
+out:
+	mutex_unlock(&stream->mutex);
+}
+
+static int ipu7_isys_link_fmt_validate(struct ipu7_isys_queue *aq)
+{
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(av->vdev.entity.pads);
+	struct v4l2_mbus_framefmt format;
+	struct v4l2_subdev *sd;
+	u32 r_stream, code;
+	int ret;
+
+	if (!remote_pad)
+		return -ENOTCONN;
+
+	sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	r_stream = ipu7_isys_get_src_stream_by_src_pad(sd, remote_pad->index);
+
+	ret = ipu7_isys_get_stream_pad_fmt(sd, remote_pad->index, r_stream,
+					   &format);
+	if (ret) {
+		dev_dbg(dev, "failed to get %s: pad %d, stream:%d format\n",
+			sd->entity.name, remote_pad->index, r_stream);
+		return ret;
+	}
+
+	if (format.width != av->pix_fmt.width ||
+	    format.height != av->pix_fmt.height) {
+		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
+			av->pix_fmt.width, av->pix_fmt.height, format.width,
+			format.height);
+		return -EINVAL;
+	}
+
+	code = ipu7_isys_get_isys_format(av->pix_fmt.pixelformat)->code;
+	if (format.code != code) {
+		dev_dbg(dev, "wrong mbus code 0x%8.8x (0x%8.8x expected)\n",
+			code, format.code);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void return_buffers(struct ipu7_isys_queue *aq,
+			   enum vb2_buffer_state state)
+{
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct ipu7_isys_buffer *ib;
+	bool need_reset = false;
+	struct vb2_buffer *vb;
+	unsigned long flags;
+
+	spin_lock_irqsave(&aq->lock, flags);
+	while (!list_empty(&aq->incoming)) {
+		ib = list_first_entry(&aq->incoming, struct ipu7_isys_buffer,
+				      head);
+		vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		vb2_buffer_done(vb, state);
+
+		spin_lock_irqsave(&aq->lock, flags);
+	}
+
+	/*
+	 * Something went wrong (FW crash / HW hang / not all buffers
+	 * returned from isys) if there are still buffers queued in active
+	 * queue. We have to clean up places a bit.
+	 */
+	while (!list_empty(&aq->active)) {
+		ib = list_first_entry(&aq->active, struct ipu7_isys_buffer,
+				      head);
+		vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		vb2_buffer_done(vb, state);
+
+		spin_lock_irqsave(&aq->lock, flags);
+		need_reset = true;
+	}
+
+	spin_unlock_irqrestore(&aq->lock, flags);
+
+	if (need_reset) {
+		mutex_lock(&av->isys->mutex);
+		av->isys->need_reset = true;
+		mutex_unlock(&av->isys->mutex);
+	}
+}
+
+static void ipu7_isys_stream_cleanup(struct ipu7_isys_video *av)
+{
+	video_device_pipeline_stop(&av->vdev);
+	ipu7_isys_put_stream(av->stream);
+	av->stream = NULL;
+}
+
+static int start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	const struct ipu7_isys_pixelformat *pfmt =
+		ipu7_isys_get_isys_format(av->pix_fmt.pixelformat);
+	struct ipu7_isys_buffer_list __bl, *bl = NULL;
+	struct ipu7_isys_stream *stream;
+	struct media_entity *source_entity = NULL;
+	int nr_queues, ret;
+
+	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
+		av->vdev.name, av->pix_fmt.width, av->pix_fmt.height,
+		pfmt->css_pixelformat);
+
+	ret = ipu7_isys_setup_video(av, &source_entity, &nr_queues);
+	if (ret < 0) {
+		dev_dbg(dev, "failed to setup video\n");
+		goto out_return_buffers;
+	}
+
+	ret = ipu7_isys_link_fmt_validate(aq);
+	if (ret) {
+		dev_dbg(dev,
+			"%s: link format validation failed (%d)\n",
+			av->vdev.name, ret);
+		goto out_pipeline_stop;
+	}
+
+	stream = av->stream;
+	mutex_lock(&stream->mutex);
+	if (!stream->nr_streaming) {
+		ret = ipu7_isys_video_prepare_stream(av, source_entity,
+						     nr_queues);
+		if (ret) {
+			mutex_unlock(&stream->mutex);
+			goto out_pipeline_stop;
+		}
+	}
+
+	stream->nr_streaming++;
+	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
+		stream->nr_queues);
+
+	list_add(&aq->node, &stream->queues);
+
+	if (stream->nr_streaming != stream->nr_queues)
+		goto out;
+
+	bl = &__bl;
+	ret = buffer_list_get(stream, bl);
+	if (ret < 0) {
+		dev_warn(dev, "no buffer available, DRIVER BUG?\n");
+		goto out;
+	}
+
+	ret = ipu7_isys_fw_open(av->isys);
+	if (ret)
+		goto out_stream_start;
+
+	ret = ipu7_isys_stream_start(av, bl, false);
+	if (ret)
+		goto out_isys_fw_close;
+
+out:
+	mutex_unlock(&stream->mutex);
+
+	return 0;
+
+out_isys_fw_close:
+	ipu7_isys_fw_close(av->isys);
+
+out_stream_start:
+	list_del(&aq->node);
+	stream->nr_streaming--;
+	mutex_unlock(&stream->mutex);
+
+out_pipeline_stop:
+	ipu7_isys_stream_cleanup(av);
+
+out_return_buffers:
+	return_buffers(aq, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void stop_streaming(struct vb2_queue *q)
+{
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(q);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct ipu7_isys_stream *stream = av->stream;
+
+	mutex_lock(&stream->mutex);
+	mutex_lock(&av->isys->stream_mutex);
+	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
+		ipu7_isys_video_set_streaming(av, 0, NULL);
+	mutex_unlock(&av->isys->stream_mutex);
+
+	stream->nr_streaming--;
+	list_del(&aq->node);
+	stream->streaming = 0;
+
+	mutex_unlock(&stream->mutex);
+
+	ipu7_isys_stream_cleanup(av);
+
+	return_buffers(aq, VB2_BUF_STATE_ERROR);
+
+	ipu7_isys_fw_close(av->isys);
+}
+
+static unsigned int
+get_sof_sequence_by_timestamp(struct ipu7_isys_stream *stream,
+			      struct ipu7_insys_resp *info)
+{
+	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
+	struct ipu7_isys *isys = stream->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i;
+
+	/*
+	 * The timestamp is invalid as no TSC in some FPGA platform,
+	 * so get the sequence from pipeline directly in this case.
+	 */
+	if (time == 0)
+		return atomic_read(&stream->sequence) - 1;
+
+	for (i = 0; i < IPU_ISYS_MAX_PARALLEL_SOF; i++)
+		if (time == stream->seq[i].timestamp) {
+			dev_dbg(dev, "SOF: using seq nr %u for ts %llu\n",
+				stream->seq[i].sequence, time);
+			return stream->seq[i].sequence;
+		}
+
+	dev_dbg(dev, "SOF: looking for %llu\n", time);
+	for (i = 0; i < IPU_ISYS_MAX_PARALLEL_SOF; i++)
+		dev_dbg(dev, "SOF: sequence %u, timestamp value %llu\n",
+			stream->seq[i].sequence, stream->seq[i].timestamp);
+	dev_dbg(dev, "SOF sequence number not found\n");
+
+	return 0;
+}
+
+static u64 get_sof_ns_delta(struct ipu7_isys_video *av,
+			    struct ipu7_insys_resp *info)
+{
+	struct ipu7_bus_device *adev = av->isys->adev;
+	struct ipu7_device *isp = adev->isp;
+	u64 delta, tsc_now;
+
+	ipu_buttress_tsc_read(isp, &tsc_now);
+	if (!tsc_now)
+		return 0;
+
+	delta = tsc_now - ((u64)info->timestamp[1] << 32 | info->timestamp[0]);
+
+	return ipu_buttress_tsc_ticks_to_ns(delta, isp);
+}
+
+void ipu7_isys_buf_calc_sequence_time(struct ipu7_isys_buffer *ib,
+				      struct ipu7_insys_resp *info)
+{
+	struct vb2_buffer *vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ipu7_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu7_isys_stream *stream = av->stream;
+	u64 ns;
+	u32 sequence;
+
+	ns = ktime_get_ns() - get_sof_ns_delta(av, info);
+	sequence = get_sof_sequence_by_timestamp(stream, info);
+
+	vbuf->vb2_buf.timestamp = ns;
+	vbuf->sequence = sequence;
+
+	dev_dbg(dev, "buf: %s: buffer done, CPU-timestamp:%lld, sequence:%d\n",
+		av->vdev.name, ktime_get_ns(), sequence);
+	dev_dbg(dev, "index:%d, vbuf timestamp:%lld\n", vb->index,
+		vbuf->vb2_buf.timestamp);
+}
+
+void ipu7_isys_queue_buf_done(struct ipu7_isys_buffer *ib)
+{
+	struct vb2_buffer *vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+
+	if (atomic_read(&ib->str2mmio_flag)) {
+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		/*
+		 * Operation on buffer is ended with error and will be reported
+		 * to the userspace when it is de-queued
+		 */
+		atomic_set(&ib->str2mmio_flag, 0);
+	} else {
+		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+	}
+}
+
+void ipu7_isys_queue_buf_ready(struct ipu7_isys_stream *stream,
+			       struct ipu7_insys_resp *info)
+{
+	struct ipu7_isys_queue *aq = stream->output_pins[info->pin_id].aq;
+	struct ipu7_isys *isys = stream->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu7_isys_buffer *ib;
+	struct vb2_buffer *vb;
+	unsigned long flags;
+	bool first = true;
+	struct vb2_v4l2_buffer *buf;
+
+	dev_dbg(dev, "buffer: %s: received buffer %8.8x %d\n",
+		ipu7_isys_queue_to_video(aq)->vdev.name, info->pin.addr,
+		info->frame_id);
+
+	spin_lock_irqsave(&aq->lock, flags);
+	if (list_empty(&aq->active)) {
+		spin_unlock_irqrestore(&aq->lock, flags);
+		dev_err(dev, "active queue empty\n");
+		return;
+	}
+
+	list_for_each_entry_reverse(ib, &aq->active, head) {
+		struct ipu7_isys_video_buffer *ivb;
+		struct vb2_v4l2_buffer *vvb;
+		dma_addr_t addr;
+
+		vb = ipu7_isys_buffer_to_vb2_buffer(ib);
+		vvb = to_vb2_v4l2_buffer(vb);
+		ivb = vb2_buffer_to_ipu7_isys_video_buffer(vvb);
+		addr = ivb->dma_addr;
+
+		if (info->pin.addr != addr) {
+			if (first)
+				dev_err(dev, "Unexpected buffer address %pad\n",
+					&addr);
+
+			first = false;
+			continue;
+		}
+
+		dev_dbg(dev, "buffer: found buffer %pad\n", &addr);
+
+		buf = to_vb2_v4l2_buffer(vb);
+		buf->field = V4L2_FIELD_NONE;
+
+		list_del(&ib->head);
+		spin_unlock_irqrestore(&aq->lock, flags);
+
+		ipu7_isys_buf_calc_sequence_time(ib, info);
+
+		ipu7_isys_queue_buf_done(ib);
+
+		return;
+	}
+
+	dev_err(dev, "Failed to find a matching video buffer\n");
+
+	spin_unlock_irqrestore(&aq->lock, flags);
+}
+
+static const struct vb2_ops ipu7_isys_queue_ops = {
+	.queue_setup = ipu7_isys_queue_setup,
+	.buf_init = ipu7_isys_buf_init,
+	.buf_prepare = ipu7_isys_buf_prepare,
+	.buf_cleanup = ipu7_isys_buf_cleanup,
+	.start_streaming = start_streaming,
+	.stop_streaming = stop_streaming,
+	.buf_queue = buf_queue,
+};
+
+int ipu7_isys_queue_init(struct ipu7_isys_queue *aq)
+{
+	struct ipu7_isys *isys = ipu7_isys_queue_to_video(aq)->isys;
+	struct ipu7_isys_video *av = ipu7_isys_queue_to_video(aq);
+	struct ipu7_bus_device *adev = isys->adev;
+	int ret;
+
+	if (!aq->vbq.io_modes)
+		aq->vbq.io_modes = VB2_MMAP | VB2_DMABUF;
+
+	aq->vbq.drv_priv = isys;
+	aq->vbq.ops = &ipu7_isys_queue_ops;
+	aq->vbq.lock = &av->mutex;
+	aq->vbq.mem_ops = &vb2_dma_sg_memops;
+	aq->vbq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	aq->vbq.min_queued_buffers = 1;
+	aq->vbq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+
+	ret = vb2_queue_init(&aq->vbq);
+	if (ret)
+		return ret;
+
+	aq->dev = &adev->auxdev.dev;
+	aq->vbq.dev = &adev->isp->pdev->dev;
+	spin_lock_init(&aq->lock);
+	INIT_LIST_HEAD(&aq->active);
+	INIT_LIST_HEAD(&aq->incoming);
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-queue.h b/drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
new file mode 100644
index 000000000000..0f35e5878c96
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_QUEUE_H
+#define IPU7_ISYS_QUEUE_H
+
+#include <linux/atomic.h>
+#include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/spinlock_types.h>
+
+#include <media/videobuf2-v4l2.h>
+
+struct device;
+struct ipu7_isys_stream;
+struct ipu7_insys_resp;
+struct ipu7_insys_buffset;
+
+struct ipu7_isys_queue {
+	struct vb2_queue vbq;
+	struct list_head node;
+	struct device *dev;
+	/*
+	 * @lock: serialise access to queued and pre_streamon_queued
+	 */
+	spinlock_t lock;
+	struct list_head active;
+	struct list_head incoming;
+	unsigned int fw_output;
+};
+
+struct ipu7_isys_buffer {
+	struct list_head head;
+	atomic_t str2mmio_flag;
+};
+
+struct ipu7_isys_video_buffer {
+	struct vb2_v4l2_buffer vb_v4l2;
+	struct ipu7_isys_buffer ib;
+	dma_addr_t dma_addr;
+};
+
+#define IPU_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
+#define IPU_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
+#define IPU_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
+
+struct ipu7_isys_buffer_list {
+	struct list_head head;
+	unsigned int nbufs;
+};
+
+#define vb2_queue_to_isys_queue(__vb2)				\
+	container_of(__vb2, struct ipu7_isys_queue, vbq)
+
+#define ipu7_isys_to_isys_video_buffer(__ib)			\
+	container_of(__ib, struct ipu7_isys_video_buffer, ib)
+
+#define vb2_buffer_to_ipu7_isys_video_buffer(__vvb)			\
+	container_of(__vvb, struct ipu7_isys_video_buffer, vb_v4l2)
+
+#define ipu7_isys_buffer_to_vb2_buffer(__ib)				\
+	(&ipu7_isys_to_isys_video_buffer(__ib)->vb_v4l2.vb2_buf)
+
+void ipu7_isys_buffer_list_queue(struct ipu7_isys_buffer_list *bl,
+				 unsigned long op_flags,
+				 enum vb2_buffer_state state);
+void ipu7_isys_buffer_to_fw_frame_buff(struct ipu7_insys_buffset *set,
+				       struct ipu7_isys_stream *stream,
+				       struct ipu7_isys_buffer_list *bl);
+
+void ipu7_isys_buf_calc_sequence_time(struct ipu7_isys_buffer *ib,
+				      struct ipu7_insys_resp *info);
+void ipu7_isys_queue_buf_done(struct ipu7_isys_buffer *ib);
+void ipu7_isys_queue_buf_ready(struct ipu7_isys_stream *stream,
+			       struct ipu7_insys_resp *info);
+int ipu7_isys_queue_init(struct ipu7_isys_queue *aq);
+#endif /* IPU7_ISYS_QUEUE_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c b/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
new file mode 100644
index 000000000000..1f3dab8e62ff
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/bug.h>
+#include <linux/device.h>
+#include <linux/minmax.h>
+#include <linux/types.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "ipu7-bus.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-subdev.h"
+
+unsigned int ipu7_isys_mbus_code_to_bpp(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return 24;
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+		return 20;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return 16;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return 12;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return 10;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return 8;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+}
+
+unsigned int ipu7_isys_mbus_code_to_mipi(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		return MIPI_CSI2_DT_RGB565;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+		return MIPI_CSI2_DT_YUV422_10B;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		return MIPI_CSI2_DT_YUV422_8B;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MIPI_CSI2_DT_RAW12;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+}
+
+bool ipu7_isys_is_bayer_format(u32 code)
+{
+	switch (ipu7_isys_mbus_code_to_mipi(code)) {
+	case MIPI_CSI2_DT_RAW8:
+	case MIPI_CSI2_DT_RAW10:
+	case MIPI_CSI2_DT_RAW12:
+	case MIPI_CSI2_DT_RAW14:
+	case MIPI_CSI2_DT_RAW16:
+	case MIPI_CSI2_DT_RAW20:
+	case MIPI_CSI2_DT_RAW24:
+	case MIPI_CSI2_DT_RAW28:
+		return true;
+	default:
+		return false;
+	}
+}
+
+u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
+{
+	static const u32 code_map[] = {
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(code_map); i++)
+		if (code_map[i] == code)
+			break;
+
+	if (WARN_ON(i == ARRAY_SIZE(code_map)))
+		return code;
+
+	return code_map[i ^ (((y & 1) << 1) | (x & 1))];
+}
+
+int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	u32 code = asd->supported_codes[0];
+	struct v4l2_mbus_framefmt *fmt;
+	u32 other_pad, other_stream;
+	struct v4l2_rect *crop;
+	unsigned int i;
+	int ret;
+
+	/* No transcoding, source and sink formats must match. */
+	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
+	    sd->entity.num_pads > 1)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	format->format.width = clamp(format->format.width, IPU_ISYS_MIN_WIDTH,
+				     IPU_ISYS_MAX_WIDTH);
+	format->format.height = clamp(format->format.height,
+				      IPU_ISYS_MIN_HEIGHT,
+				      IPU_ISYS_MAX_HEIGHT);
+
+	for (i = 0; asd->supported_codes[i]; i++) {
+		if (asd->supported_codes[i] == format->format.code) {
+			code = asd->supported_codes[i];
+			break;
+		}
+	}
+	format->format.code = code;
+	format->format.field = V4L2_FIELD_NONE;
+
+	/* Store the format and propagate it to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
+		return 0;
+
+	/* propagate format to following source pad */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    format->pad,
+						    format->stream,
+						    &other_pad,
+						    &other_stream);
+	if (ret)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
+	/* reset crop */
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = fmt->width;
+	crop->height = fmt->height;
+
+	return 0;
+}
+
+int ipu7_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ipu7_isys_subdev *asd = to_ipu7_isys_subdev(sd);
+	const u32 *supported_codes = asd->supported_codes;
+	u32 index;
+
+	for (index = 0; supported_codes[index]; index++) {
+		if (index == code->index) {
+			code->code = supported_codes[index];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int subdev_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 4096,
+		.height = 3072,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.field = V4L2_FIELD_NONE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+}
+
+int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_mbus_framefmt *format)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (!sd || !format)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, pad, stream);
+	if (fmt)
+		*format = *fmt;
+	v4l2_subdev_unlock_state(state);
+
+	return fmt ? 0 : -EINVAL;
+}
+
+u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *routes;
+	u32 source_stream = 0;
+	unsigned int i;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	routes = state->routing.routes;
+	for (i = 0; i < state->routing.num_routes; i++) {
+		if (routes[i].source_pad == pad) {
+			source_stream = routes[i].source_stream;
+			break;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return source_stream;
+}
+
+static int ipu7_isys_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route route = {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = &route,
+	};
+
+	return subdev_set_routing(sd, state, &routing);
+}
+
+int ipu7_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing)
+{
+	return subdev_set_routing(sd, state, routing);
+}
+
+static const struct v4l2_subdev_internal_ops ipu7_isys_subdev_internal_ops = {
+	.init_state = ipu7_isys_subdev_init_state,
+};
+
+int ipu7_isys_subdev_init(struct ipu7_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_sink_pads,
+			  unsigned int num_source_pads)
+{
+	unsigned int num_pads = num_sink_pads + num_source_pads;
+	unsigned int i;
+	int ret;
+
+	v4l2_subdev_init(&asd->sd, ops);
+
+	asd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			 V4L2_SUBDEV_FL_HAS_EVENTS |
+			 V4L2_SUBDEV_FL_STREAMS;
+	asd->sd.owner = THIS_MODULE;
+	asd->sd.dev = &asd->isys->adev->auxdev.dev;
+	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	asd->sd.internal_ops = &ipu7_isys_subdev_internal_ops;
+
+	asd->pad = devm_kcalloc(&asd->isys->adev->auxdev.dev, num_pads,
+				sizeof(*asd->pad), GFP_KERNEL);
+	if (!asd->pad)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sink_pads; i++)
+		asd->pad[i].flags = MEDIA_PAD_FL_SINK |
+			MEDIA_PAD_FL_MUST_CONNECT;
+
+	for (i = num_sink_pads; i < num_pads; i++)
+		asd->pad[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
+	if (ret) {
+		pr_err("isys subdev init failed %d.\n", ret);
+		return ret;
+	}
+
+	if (asd->ctrl_init) {
+		ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, nr_ctrls);
+		if (ret)
+			goto out_media_entity_cleanup;
+
+		asd->ctrl_init(&asd->sd);
+		if (asd->ctrl_handler.error) {
+			ret = asd->ctrl_handler.error;
+			goto out_v4l2_ctrl_handler_free;
+		}
+
+		asd->sd.ctrl_handler = &asd->ctrl_handler;
+	}
+
+	asd->source = -1;
+
+	return 0;
+
+out_v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+
+out_media_entity_cleanup:
+	media_entity_cleanup(&asd->sd.entity);
+
+	return ret;
+}
+
+void ipu7_isys_subdev_cleanup(struct ipu7_isys_subdev *asd)
+{
+	media_entity_cleanup(&asd->sd.entity);
+	v4l2_ctrl_handler_free(&asd->ctrl_handler);
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h b/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
new file mode 100644
index 000000000000..39b43dce9656
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_SUBDEV_H
+#define IPU7_ISYS_SUBDEV_H
+
+#include <linux/container_of.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+struct ipu7_isys;
+
+struct ipu7_isys_subdev {
+	struct v4l2_subdev sd;
+	struct ipu7_isys *isys;
+	u32 const *supported_codes;
+	struct media_pad *pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	void (*ctrl_init)(struct v4l2_subdev *sd);
+	int source;	/* SSI stream source; -1 if unset */
+};
+
+#define to_ipu7_isys_subdev(__sd)			\
+	container_of(__sd, struct ipu7_isys_subdev, sd)
+
+unsigned int ipu7_isys_mbus_code_to_bpp(u32 code);
+unsigned int ipu7_isys_mbus_code_to_mipi(u32 code);
+bool ipu7_isys_is_bayer_format(u32 code);
+u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y);
+
+int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *fmt);
+int ipu7_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum
+				    *code);
+u32 ipu7_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
+int ipu7_isys_get_stream_pad_fmt(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				 struct v4l2_mbus_framefmt *format);
+int ipu7_isys_subdev_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing);
+int ipu7_isys_subdev_init(struct ipu7_isys_subdev *asd,
+			  const struct v4l2_subdev_ops *ops,
+			  unsigned int nr_ctrls,
+			  unsigned int num_sink_pads,
+			  unsigned int num_source_pads);
+void ipu7_isys_subdev_cleanup(struct ipu7_isys_subdev *asd);
+#endif /* IPU7_ISYS_SUBDEV_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-video.c b/drivers/media/pci/intel/ipu7/ipu7-isys-video.c
new file mode 100644
index 000000000000..dd8d921be80b
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-video.c
@@ -0,0 +1,1130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/align.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/compat.h>
+#include <linux/device.h>
+#include <linux/iopoll.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "abi/ipu7_fw_isys_abi.h"
+
+#include "ipu7.h"
+#include "ipu7-bus.h"
+#include "ipu7-buttress-regs.h"
+#include "ipu7-fw-isys.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-video.h"
+#include "ipu7-platform-regs.h"
+
+const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
+	{V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SBGGR10, 16, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGBRG10, 16, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SGRBG10, 16, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SRGGB10, 16, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW16},
+	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SGRBG8, 8, 8, MEDIA_BUS_FMT_SGRBG8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
+	 IPU_INSYS_FRAME_FORMAT_RAW8},
+	{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SGRBG12P, 12, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SRGGB12P, 12, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
+	 IPU_INSYS_FRAME_FORMAT_RAW12},
+	{V4L2_PIX_FMT_SBGGR10P, 10, 10, MEDIA_BUS_FMT_SBGGR10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SGBRG10P, 10, 10, MEDIA_BUS_FMT_SGBRG10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SGRBG10P, 10, 10, MEDIA_BUS_FMT_SGRBG10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
+	 IPU_INSYS_FRAME_FORMAT_RAW10},
+	{V4L2_PIX_FMT_UYVY, 16, 16, MEDIA_BUS_FMT_UYVY8_1X16,
+	 IPU_INSYS_FRAME_FORMAT_UYVY},
+	{V4L2_PIX_FMT_YUYV, 16, 16, MEDIA_BUS_FMT_YUYV8_1X16,
+	 IPU_INSYS_FRAME_FORMAT_YUYV},
+	{V4L2_PIX_FMT_RGB565, 16, 16, MEDIA_BUS_FMT_RGB565_1X16,
+	 IPU_INSYS_FRAME_FORMAT_RGB565},
+	{V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
+	 IPU_INSYS_FRAME_FORMAT_RGBA888},
+};
+
+static int video_open(struct file *file)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+	struct ipu7_isys *isys = av->isys;
+	struct ipu7_bus_device *adev = isys->adev;
+
+	mutex_lock(&isys->mutex);
+	if (isys->need_reset) {
+		mutex_unlock(&isys->mutex);
+		dev_warn(&adev->auxdev.dev, "isys power cycle required\n");
+		return -EIO;
+	}
+	mutex_unlock(&isys->mutex);
+
+	return v4l2_fh_open(file);
+}
+
+const struct ipu7_isys_pixelformat *ipu7_isys_get_isys_format(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu7_isys_pfmts); i++) {
+		const struct ipu7_isys_pixelformat *pfmt = &ipu7_isys_pfmts[i];
+
+		if (pfmt->pixelformat == pixelformat)
+			return pfmt;
+	}
+
+	return &ipu7_isys_pfmts[0];
+}
+
+static int ipu7_isys_vidioc_querycap(struct file *file, void *fh,
+				     struct v4l2_capability *cap)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+
+	strscpy(cap->driver, IPU_ISYS_NAME, sizeof(cap->driver));
+	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "%s",
+		 av->isys->media_dev.bus_info);
+
+	return 0;
+}
+
+static int ipu7_isys_vidioc_enum_fmt(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	unsigned int i, num_found;
+
+	for (i = 0, num_found = 0; i < ARRAY_SIZE(ipu7_isys_pfmts); i++) {
+		if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+			continue;
+
+		if (f->mbus_code && f->mbus_code != ipu7_isys_pfmts[i].code)
+			continue;
+
+		if (num_found < f->index) {
+			num_found++;
+			continue;
+		}
+
+		f->flags = 0;
+		f->pixelformat = ipu7_isys_pfmts[i].pixelformat;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ipu7_isys_vidioc_enum_framesizes(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	unsigned int i;
+
+	if (fsize->index > 0)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ipu7_isys_pfmts); i++) {
+		if (fsize->pixel_format != ipu7_isys_pfmts[i].pixelformat)
+			continue;
+
+		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+		fsize->stepwise.min_width = IPU_ISYS_MIN_WIDTH;
+		fsize->stepwise.max_width = IPU_ISYS_MAX_WIDTH;
+		fsize->stepwise.min_height = IPU_ISYS_MIN_HEIGHT;
+		fsize->stepwise.max_height = IPU_ISYS_MAX_HEIGHT;
+		fsize->stepwise.step_width = 2;
+		fsize->stepwise.step_height = 2;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ipu7_isys_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
+					  struct v4l2_format *f)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+
+	f->fmt.pix = av->pix_fmt;
+
+	return 0;
+}
+
+static void ipu7_isys_try_fmt_cap(struct ipu7_isys_video *av, u32 type,
+				  u32 *format, u32 *width, u32 *height,
+				  u32 *bytesperline, u32 *sizeimage)
+{
+	const struct ipu7_isys_pixelformat *pfmt =
+		ipu7_isys_get_isys_format(*format);
+
+	*format = pfmt->pixelformat;
+	*width = clamp(*width, IPU_ISYS_MIN_WIDTH, IPU_ISYS_MAX_WIDTH);
+	*height = clamp(*height, IPU_ISYS_MIN_HEIGHT, IPU_ISYS_MAX_HEIGHT);
+
+	if (pfmt->bpp != pfmt->bpp_packed)
+		*bytesperline = *width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
+	else
+		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
+
+	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
+
+	/*
+	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
+	 * is a power of two, and a line should be transferred as few units
+	 * as possible. The result is that up to line length more data than
+	 * the image size may be transferred to memory after the image.
+	 * Another limitation is the GDA allocation unit size. For low
+	 * resolution it gives a bigger number. Use larger one to avoid
+	 * memory corruption.
+	 */
+	*sizeimage = *bytesperline * *height +
+		max(*bytesperline,
+		    av->isys->pdata->ipdata->isys_dma_overshoot);
+}
+
+static void __ipu_isys_vidioc_try_fmt_vid_cap(struct ipu7_isys_video *av,
+					      struct v4l2_format *f)
+{
+	ipu7_isys_try_fmt_cap(av, f->type, &f->fmt.pix.pixelformat,
+			      &f->fmt.pix.width, &f->fmt.pix.height,
+			      &f->fmt.pix.bytesperline, &f->fmt.pix.sizeimage);
+
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+	f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int ipu7_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
+					    struct v4l2_format *f)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+
+	if (vb2_is_busy(&av->aq.vbq))
+		return -EBUSY;
+
+	__ipu_isys_vidioc_try_fmt_vid_cap(av, f);
+
+	return 0;
+}
+
+static int ipu7_isys_vidioc_s_fmt_vid_cap(struct file *file, void *fh,
+					  struct v4l2_format *f)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+
+	ipu7_isys_vidioc_try_fmt_vid_cap(file, fh, f);
+	av->pix_fmt = f->fmt.pix;
+
+	return 0;
+}
+
+static int ipu7_isys_vidioc_reqbufs(struct file *file, void *priv,
+				    struct v4l2_requestbuffers *p)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+	int ret;
+
+	av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->type);
+	av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->type);
+
+	ret = vb2_queue_change_type(&av->aq.vbq, p->type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_reqbufs(file, priv, p);
+}
+
+static int ipu7_isys_vidioc_create_bufs(struct file *file, void *priv,
+					struct v4l2_create_buffers *p)
+{
+	struct ipu7_isys_video *av = video_drvdata(file);
+	int ret;
+
+	av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->format.type);
+	av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->format.type);
+
+	ret = vb2_queue_change_type(&av->aq.vbq, p->format.type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_create_bufs(file, priv, p);
+}
+
+static int link_validate(struct media_link *link)
+{
+	struct ipu7_isys_video *av =
+		container_of(link->sink, struct ipu7_isys_video, pad);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct v4l2_subdev_state *s_state;
+	struct v4l2_mbus_framefmt *s_fmt;
+	struct v4l2_subdev *s_sd;
+	struct media_pad *s_pad;
+	u32 s_stream, code;
+	int ret = -EPIPE;
+
+	if (!link->source->entity)
+		return ret;
+
+	s_sd = media_entity_to_v4l2_subdev(link->source->entity);
+	s_state = v4l2_subdev_get_unlocked_active_state(s_sd);
+	if (!s_state)
+		return ret;
+
+	dev_dbg(dev, "validating link \"%s\":%u -> \"%s\"\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name);
+
+	s_pad = media_pad_remote_pad_first(&av->pad);
+	s_stream = ipu7_isys_get_src_stream_by_src_pad(s_sd, s_pad->index);
+
+	v4l2_subdev_lock_state(s_state);
+
+	s_fmt = v4l2_subdev_state_get_format(s_state, s_pad->index, s_stream);
+	if (!s_fmt) {
+		dev_err(dev, "failed to get source pad format\n");
+		goto unlock;
+	}
+
+	code = ipu7_isys_get_isys_format(av->pix_fmt.pixelformat)->code;
+
+	if (s_fmt->width != av->pix_fmt.width ||
+	    s_fmt->height != av->pix_fmt.height || s_fmt->code != code) {
+		dev_dbg(dev, "format mismatch %dx%d,%x != %dx%d,%x\n",
+			s_fmt->width, s_fmt->height, s_fmt->code,
+			av->pix_fmt.width, av->pix_fmt.height, code);
+		goto unlock;
+	}
+
+	v4l2_subdev_unlock_state(s_state);
+
+	return 0;
+unlock:
+	v4l2_subdev_unlock_state(s_state);
+
+	return ret;
+}
+
+static void get_stream_opened(struct ipu7_isys_video *av)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&av->isys->streams_lock, flags);
+	av->isys->stream_opened++;
+	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+}
+
+static void put_stream_opened(struct ipu7_isys_video *av)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&av->isys->streams_lock, flags);
+	av->isys->stream_opened--;
+	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+}
+
+static int ipu7_isys_fw_pin_cfg(struct ipu7_isys_video *av,
+				struct ipu7_insys_stream_cfg *cfg)
+{
+	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	struct ipu7_isys_stream *stream = av->stream;
+	const struct ipu7_isys_pixelformat *pfmt =
+		ipu7_isys_get_isys_format(av->pix_fmt.pixelformat);
+	struct ipu7_insys_output_pin *output_pin;
+	struct ipu7_insys_input_pin *input_pin;
+	int input_pins = cfg->nof_input_pins++;
+	struct ipu7_isys_queue *aq = &av->aq;
+	struct ipu7_isys *isys = av->isys;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct v4l2_mbus_framefmt fmt;
+	int output_pins;
+	u32 src_stream;
+	int ret;
+
+	src_stream = ipu7_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	ret = ipu7_isys_get_stream_pad_fmt(sd, src_pad->index, src_stream,
+					   &fmt);
+	if (ret < 0) {
+		dev_err(dev, "can't get stream format (%d)\n", ret);
+		return ret;
+	}
+
+	input_pin = &cfg->input_pins[input_pins];
+	input_pin->input_res.width = fmt.width;
+	input_pin->input_res.height = fmt.height;
+	input_pin->dt = av->dt;
+	input_pin->disable_mipi_unpacking = 0;
+	pfmt = ipu7_isys_get_isys_format(av->pix_fmt.pixelformat);
+	if (pfmt->bpp == pfmt->bpp_packed && pfmt->bpp % BITS_PER_BYTE)
+		input_pin->disable_mipi_unpacking = 1;
+	input_pin->mapped_dt = N_IPU_INSYS_MIPI_DATA_TYPE;
+	input_pin->dt_rename_mode = IPU_INSYS_MIPI_DT_NO_RENAME;
+	/* if enable polling isys interrupt, the follow values maybe set */
+	input_pin->sync_msg_map = IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF |
+		IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF_DISCARDED |
+		IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF |
+		IPU_INSYS_STREAM_SYNC_MSG_SEND_IRQ_SOF_DISCARDED;
+
+	output_pins = cfg->nof_output_pins++;
+	aq->fw_output = output_pins;
+	stream->output_pins[output_pins].pin_ready = ipu7_isys_queue_buf_ready;
+	stream->output_pins[output_pins].aq = aq;
+
+	output_pin = &cfg->output_pins[output_pins];
+	/* output pin msg link */
+	output_pin->link.buffer_lines = 0;
+	output_pin->link.foreign_key = IPU_MSG_LINK_FOREIGN_KEY_NONE;
+	output_pin->link.granularity_pointer_update = 0;
+	output_pin->link.msg_link_streaming_mode =
+		IA_GOFO_MSG_LINK_STREAMING_MODE_SOFF;
+
+	output_pin->link.pbk_id = IPU_MSG_LINK_PBK_ID_DONT_CARE;
+	output_pin->link.pbk_slot_id = IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE;
+	output_pin->link.dest = IPU_INSYS_OUTPUT_LINK_DEST_MEM;
+	output_pin->link.use_sw_managed = 1;
+	/* TODO: set the snoop bit for metadata capture */
+	output_pin->link.is_snoop = 0;
+
+	/* output pin crop */
+	output_pin->crop.line_top = 0;
+	output_pin->crop.line_bottom = 0;
+
+	/* output de-compression */
+	output_pin->dpcm.enable = 0;
+
+	/* frame format type */
+	pfmt = ipu7_isys_get_isys_format(av->pix_fmt.pixelformat);
+	output_pin->ft = (u16)pfmt->css_pixelformat;
+
+	/* stride in bytes */
+	output_pin->stride = av->pix_fmt.bytesperline;
+	output_pin->send_irq = 1;
+	output_pin->early_ack_en = 0;
+
+	/* input pin id */
+	output_pin->input_pin_id = input_pins;
+
+	return 0;
+}
+
+/* Create stream and start it using the CSS FW ABI. */
+static int start_stream_firmware(struct ipu7_isys_video *av,
+				 struct ipu7_isys_buffer_list *bl)
+{
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu7_isys_stream *stream = av->stream;
+	struct ipu7_insys_stream_cfg *stream_cfg;
+	struct ipu7_insys_buffset *buf = NULL;
+	struct isys_fw_msgs *msg = NULL;
+	struct ipu7_isys_queue *aq;
+	int ret, retout, tout;
+	u16 send_type;
+
+	if (WARN_ON(!bl))
+		return -EIO;
+
+	msg = ipu7_get_fw_msg_buf(stream);
+	if (!msg)
+		return -ENOMEM;
+
+	stream_cfg = &msg->fw_msg.stream;
+	stream_cfg->port_id = stream->stream_source;
+	stream_cfg->vc = stream->vc;
+	stream_cfg->stream_msg_map = IPU_INSYS_STREAM_ENABLE_MSG_SEND_RESP |
+				     IPU_INSYS_STREAM_ENABLE_MSG_SEND_IRQ;
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu7_isys_video *__av = ipu7_isys_queue_to_video(aq);
+
+		ret = ipu7_isys_fw_pin_cfg(__av, stream_cfg);
+		if (ret < 0) {
+			ipu7_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+			return ret;
+		}
+	}
+
+	ipu7_fw_isys_dump_stream_cfg(dev, stream_cfg);
+
+	stream->nr_output_pins = stream_cfg->nof_output_pins;
+
+	reinit_completion(&stream->stream_open_completion);
+
+	ret = ipu7_fw_isys_complex_cmd(av->isys, stream->stream_handle,
+				       stream_cfg, msg->dma_addr,
+				       sizeof(*stream_cfg),
+				       IPU_INSYS_SEND_TYPE_STREAM_OPEN);
+	if (ret < 0) {
+		dev_err(dev, "can't open stream (%d)\n", ret);
+		ipu7_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+		return ret;
+	}
+
+	get_stream_opened(av);
+
+	tout = wait_for_completion_timeout(&stream->stream_open_completion,
+					   FW_CALL_TIMEOUT_JIFFIES);
+
+	ipu7_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+
+	if (!tout) {
+		dev_err(dev, "stream open time out\n");
+		ret = -ETIMEDOUT;
+		goto out_put_stream_opened;
+	}
+	if (stream->error) {
+		dev_err(dev, "stream open error: %d\n", stream->error);
+		ret = -EIO;
+		goto out_put_stream_opened;
+	}
+	dev_dbg(dev, "start stream: open complete\n");
+
+	msg = ipu7_get_fw_msg_buf(stream);
+	if (!msg) {
+		ret = -ENOMEM;
+		goto out_put_stream_opened;
+	}
+	buf = &msg->fw_msg.frame;
+
+	ipu7_isys_buffer_to_fw_frame_buff(buf, stream, bl);
+	ipu7_isys_buffer_list_queue(bl, IPU_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+
+	reinit_completion(&stream->stream_start_completion);
+
+	send_type = IPU_INSYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
+	ipu7_fw_isys_dump_frame_buff_set(dev, buf,
+					 stream_cfg->nof_output_pins);
+	ret = ipu7_fw_isys_complex_cmd(av->isys, stream->stream_handle, buf,
+				       msg->dma_addr, sizeof(*buf),
+				       send_type);
+	if (ret < 0) {
+		dev_err(dev, "can't start streaming (%d)\n", ret);
+		goto out_stream_close;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_start_completion,
+					   FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout) {
+		dev_err(dev, "stream start time out\n");
+		ret = -ETIMEDOUT;
+		goto out_stream_close;
+	}
+	if (stream->error) {
+		dev_err(dev, "stream start error: %d\n", stream->error);
+		ret = -EIO;
+		goto out_stream_close;
+	}
+	dev_dbg(dev, "start stream: complete\n");
+
+	return 0;
+
+out_stream_close:
+	reinit_completion(&stream->stream_close_completion);
+
+	retout = ipu7_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+					 IPU_INSYS_SEND_TYPE_STREAM_CLOSE);
+	if (retout < 0) {
+		dev_dbg(dev, "can't close stream (%d)\n", retout);
+		goto out_put_stream_opened;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_close_completion,
+					   FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_err(dev, "stream close time out\n");
+	else if (stream->error)
+		dev_err(dev, "stream close error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "stream close complete\n");
+
+out_put_stream_opened:
+	put_stream_opened(av);
+
+	return ret;
+}
+
+static void stop_streaming_firmware(struct ipu7_isys_video *av)
+{
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu7_isys_stream *stream = av->stream;
+	int ret, tout;
+
+	reinit_completion(&stream->stream_stop_completion);
+
+	ret = ipu7_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+				      IPU_INSYS_SEND_TYPE_STREAM_FLUSH);
+	if (ret < 0) {
+		dev_err(dev, "can't stop stream (%d)\n", ret);
+		return;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_stop_completion,
+					   FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_warn(dev, "stream stop time out\n");
+	else if (stream->error)
+		dev_warn(dev, "stream stop error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "stop stream: complete\n");
+}
+
+static void close_streaming_firmware(struct ipu7_isys_video *av)
+{
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu7_isys_stream *stream =  av->stream;
+	int ret, tout;
+
+	reinit_completion(&stream->stream_close_completion);
+
+	ret = ipu7_fw_isys_simple_cmd(av->isys, stream->stream_handle,
+				      IPU_INSYS_SEND_TYPE_STREAM_CLOSE);
+	if (ret < 0) {
+		dev_err(dev, "can't close stream (%d)\n", ret);
+		return;
+	}
+
+	tout = wait_for_completion_timeout(&stream->stream_close_completion,
+					   FW_CALL_TIMEOUT_JIFFIES);
+	if (!tout)
+		dev_warn(dev, "stream close time out\n");
+	else if (stream->error)
+		dev_warn(dev, "stream close error: %d\n", stream->error);
+	else
+		dev_dbg(dev, "close stream: complete\n");
+
+	put_stream_opened(av);
+}
+
+int ipu7_isys_video_prepare_stream(struct ipu7_isys_video *av,
+				   struct media_entity *source_entity,
+				   int nr_queues)
+{
+	struct ipu7_isys_stream *stream = av->stream;
+	struct ipu7_isys_csi2 *csi2;
+
+	if (WARN_ON(stream->nr_streaming))
+		return -EINVAL;
+
+	stream->nr_queues = nr_queues;
+	atomic_set(&stream->sequence, 0);
+	atomic_set(&stream->buf_id, 0);
+
+	stream->seq_index = 0;
+	memset(stream->seq, 0, sizeof(stream->seq));
+
+	if (WARN_ON(!list_empty(&stream->queues)))
+		return -EINVAL;
+
+	stream->stream_source = stream->asd->source;
+
+	csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
+	csi2->receiver_errors = 0;
+	stream->source_entity = source_entity;
+
+	dev_dbg(&av->isys->adev->auxdev.dev,
+		"prepare stream: external entity %s\n",
+		stream->source_entity->name);
+
+	return 0;
+}
+
+void ipu7_isys_put_stream(struct ipu7_isys_stream *stream)
+{
+	unsigned long flags;
+	struct device *dev;
+	unsigned int i;
+
+	if (!stream) {
+		pr_err("ipu7-isys: no available stream\n");
+		return;
+	}
+
+	dev = &stream->isys->adev->auxdev.dev;
+
+	spin_lock_irqsave(&stream->isys->streams_lock, flags);
+	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+		if (&stream->isys->streams[i] == stream) {
+			if (stream->isys->streams_ref_count[i] > 0)
+				stream->isys->streams_ref_count[i]--;
+			else
+				dev_warn(dev, "invalid stream %d\n", i);
+
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
+}
+
+static struct ipu7_isys_stream *
+ipu7_isys_get_stream(struct ipu7_isys_video *av, struct ipu7_isys_subdev *asd)
+{
+	struct ipu7_isys_stream *stream = NULL;
+	struct ipu7_isys *isys = av->isys;
+	unsigned long flags;
+	unsigned int i;
+	u8 vc = av->vc;
+
+	if (!isys)
+		return NULL;
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+		if (isys->streams_ref_count[i] && isys->streams[i].vc == vc &&
+		    isys->streams[i].asd == asd) {
+			isys->streams_ref_count[i]++;
+			stream = &isys->streams[i];
+			break;
+		}
+	}
+
+	if (!stream) {
+		for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+			if (!isys->streams_ref_count[i]) {
+				isys->streams_ref_count[i]++;
+				stream = &isys->streams[i];
+				stream->vc = vc;
+				stream->asd = asd;
+				break;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+struct ipu7_isys_stream *
+ipu7_isys_query_stream_by_handle(struct ipu7_isys *isys, u8 stream_handle)
+{
+	unsigned long flags;
+	struct ipu7_isys_stream *stream = NULL;
+
+	if (!isys)
+		return NULL;
+
+	if (stream_handle >= IPU_ISYS_MAX_STREAMS) {
+		dev_err(&isys->adev->auxdev.dev,
+			"stream_handle %d is invalid\n", stream_handle);
+		return NULL;
+	}
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	if (isys->streams_ref_count[stream_handle] > 0) {
+		isys->streams_ref_count[stream_handle]++;
+		stream = &isys->streams[stream_handle];
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+struct ipu7_isys_stream *
+ipu7_isys_query_stream_by_source(struct ipu7_isys *isys, int source, u8 vc)
+{
+	struct ipu7_isys_stream *stream = NULL;
+	unsigned long flags;
+	unsigned int i;
+
+	if (!isys)
+		return NULL;
+
+	if (source < 0) {
+		dev_err(&isys->adev->auxdev.dev,
+			"query stream with invalid port number\n");
+		return NULL;
+	}
+
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+		if (!isys->streams_ref_count[i])
+			continue;
+
+		if (isys->streams[i].stream_source == source &&
+		    isys->streams[i].vc == vc) {
+			stream = &isys->streams[i];
+			isys->streams_ref_count[i]++;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
+
+	return stream;
+}
+
+static u32 get_remote_pad_stream(struct media_pad *r_pad)
+{
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *sd;
+	u32 stream_id = 0;
+	unsigned int i;
+
+	sd = media_entity_to_v4l2_subdev(r_pad->entity);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	for (i = 0; i < state->stream_configs.num_configs; i++) {
+		struct v4l2_subdev_stream_config *cfg =
+			&state->stream_configs.configs[i];
+		if (cfg->pad == r_pad->index) {
+			stream_id = cfg->stream;
+			break;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return stream_id;
+}
+
+int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
+				  struct ipu7_isys_buffer_list *bl)
+{
+	struct ipu7_isys_stream *stream = av->stream;
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct media_pad *r_pad;
+	struct v4l2_subdev *sd;
+	u32 r_stream;
+	int ret = 0;
+
+	dev_dbg(dev, "set stream: %d\n", state);
+
+	if (WARN(!stream->source_entity, "No source entity for stream\n"))
+		return -ENODEV;
+
+	sd = &stream->asd->sd;
+	r_pad = media_pad_remote_pad_first(&av->pad);
+	r_stream = get_remote_pad_stream(r_pad);
+	if (!state) {
+		stop_streaming_firmware(av);
+
+		/* stop sub-device which connects with video */
+		dev_dbg(dev, "disable streams %s pad:%d mask:0x%llx\n",
+			sd->name, r_pad->index, BIT_ULL(r_stream));
+		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
+						  BIT_ULL(r_stream));
+		if (ret) {
+			dev_err(dev, "disable streams %s failed with %d\n",
+				sd->name, ret);
+			return ret;
+		}
+
+		close_streaming_firmware(av);
+	} else {
+		ret = start_stream_firmware(av, bl);
+		if (ret) {
+			dev_err(dev, "start stream of firmware failed\n");
+			return ret;
+		}
+
+		/* start sub-device which connects with video */
+		dev_dbg(dev, "enable streams %s pad: %d mask:0x%llx\n",
+			sd->name, r_pad->index, BIT_ULL(r_stream));
+		ret = v4l2_subdev_enable_streams(sd, r_pad->index,
+						 BIT_ULL(r_stream));
+		if (ret) {
+			dev_err(dev, "enable streams %s failed with %d\n",
+				sd->name, ret);
+			goto out_media_entity_stop_streaming_firmware;
+		}
+	}
+
+	av->streaming = state;
+
+	return 0;
+
+out_media_entity_stop_streaming_firmware:
+	stop_streaming_firmware(av);
+
+	return ret;
+}
+
+static const struct v4l2_ioctl_ops ipu7_v4l2_ioctl_ops = {
+	.vidioc_querycap = ipu7_isys_vidioc_querycap,
+	.vidioc_enum_fmt_vid_cap = ipu7_isys_vidioc_enum_fmt,
+	.vidioc_enum_framesizes = ipu7_isys_vidioc_enum_framesizes,
+	.vidioc_g_fmt_vid_cap = ipu7_isys_vidioc_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = ipu7_isys_vidioc_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = ipu7_isys_vidioc_try_fmt_vid_cap,
+	.vidioc_reqbufs = ipu7_isys_vidioc_reqbufs,
+	.vidioc_create_bufs = ipu7_isys_vidioc_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static const struct media_entity_operations entity_ops = {
+	.link_validate = link_validate,
+};
+
+static const struct v4l2_file_operations isys_fops = {
+	.owner = THIS_MODULE,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+	.open = video_open,
+	.release = vb2_fop_release,
+};
+
+int ipu7_isys_fw_open(struct ipu7_isys *isys)
+{
+	struct ipu7_bus_device *adev = isys->adev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&adev->auxdev.dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&isys->mutex);
+
+	if (isys->ref_count++)
+		goto unlock;
+
+	/*
+	 * Buffers could have been left to wrong queue at last closure.
+	 * Move them now back to empty buffer queue.
+	 */
+	ipu7_cleanup_fw_msg_bufs(isys);
+
+	ret = ipu7_fw_isys_open(isys);
+	if (ret < 0)
+		goto out;
+
+unlock:
+	mutex_unlock(&isys->mutex);
+
+	return 0;
+out:
+	isys->ref_count--;
+	mutex_unlock(&isys->mutex);
+	pm_runtime_put(&adev->auxdev.dev);
+
+	return ret;
+}
+
+void ipu7_isys_fw_close(struct ipu7_isys *isys)
+{
+	mutex_lock(&isys->mutex);
+
+	isys->ref_count--;
+
+	if (!isys->ref_count)
+		ipu7_fw_isys_close(isys);
+
+	mutex_unlock(&isys->mutex);
+
+	if (isys->need_reset)
+		pm_runtime_put_sync(&isys->adev->auxdev.dev);
+	else
+		pm_runtime_put(&isys->adev->auxdev.dev);
+}
+
+int ipu7_isys_setup_video(struct ipu7_isys_video *av,
+			  struct media_entity **source_entity, int *nr_queues)
+{
+	const struct ipu7_isys_pixelformat *pfmt =
+		ipu7_isys_get_isys_format(av->pix_fmt.pixelformat);
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct media_pad *source_pad, *remote_pad;
+	struct v4l2_mbus_frame_desc_entry entry;
+	struct v4l2_subdev_route *route = NULL;
+	struct v4l2_subdev_route *r;
+	struct v4l2_subdev_state *state;
+	struct ipu7_isys_subdev *asd;
+	struct v4l2_subdev *remote_sd;
+	struct media_pipeline *pipeline;
+	int ret = -EINVAL;
+
+	*nr_queues = 0;
+
+	remote_pad = media_pad_remote_pad_unique(&av->pad);
+	if (IS_ERR(remote_pad)) {
+		dev_dbg(dev, "failed to get remote pad\n");
+		return PTR_ERR(remote_pad);
+	}
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	asd = to_ipu7_isys_subdev(remote_sd);
+
+	source_pad = media_pad_remote_pad_first(&remote_pad->entity->pads[0]);
+	if (!source_pad) {
+		dev_dbg(dev, "No external source entity\n");
+		return -ENODEV;
+	}
+
+	*source_entity = source_pad->entity;
+
+	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
+	for_each_active_route(&state->routing, r) {
+		if (r->source_pad == remote_pad->index)
+			route = r;
+	}
+
+	if (!route) {
+		v4l2_subdev_unlock_state(state);
+		dev_dbg(dev, "Failed to find route\n");
+		return -ENODEV;
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	ret = ipu7_isys_csi2_get_remote_desc(route->sink_stream,
+					     to_ipu7_isys_csi2(asd),
+					     *source_entity, &entry,
+					     nr_queues);
+	if (ret == -ENOIOCTLCMD) {
+		av->vc = 0;
+		av->dt = ipu7_isys_mbus_code_to_mipi(pfmt->code);
+		*nr_queues = 1;
+	} else if (*nr_queues && !ret) {
+		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
+			entry.stream, entry.length, entry.bus.csi2.vc,
+			entry.bus.csi2.dt);
+
+		av->vc = entry.bus.csi2.vc;
+		av->dt = entry.bus.csi2.dt;
+	} else {
+		dev_err(dev, "failed to get remote frame desc\n");
+		return ret;
+	}
+
+	pipeline = media_entity_pipeline(&av->vdev.entity);
+	if (!pipeline)
+		ret = video_device_pipeline_alloc_start(&av->vdev);
+	else
+		ret = video_device_pipeline_start(&av->vdev, pipeline);
+	if (ret < 0) {
+		dev_dbg(dev, "media pipeline start failed\n");
+		return ret;
+	}
+
+	av->stream = ipu7_isys_get_stream(av, asd);
+	if (!av->stream) {
+		video_device_pipeline_stop(&av->vdev);
+		dev_err(dev, "no available stream for firmware\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * Do everything that's needed to initialise things related to video
+ * buffer queue, video node, and the related media entity. The caller
+ * is expected to assign isys field and set the name of the video
+ * device.
+ */
+int ipu7_isys_video_init(struct ipu7_isys_video *av)
+{
+	struct v4l2_format format = {
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+		.fmt.pix = {
+			.width = 1920,
+			.height = 1080,
+		},
+	};
+	int ret;
+
+	mutex_init(&av->mutex);
+	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
+		V4L2_CAP_VIDEO_CAPTURE;
+	av->vdev.vfl_dir = VFL_DIR_RX;
+
+	ret = ipu7_isys_queue_init(&av->aq);
+	if (ret)
+		goto out_mutex_destroy;
+
+	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
+	if (ret)
+		goto out_vb2_queue_cleanup;
+
+	av->vdev.entity.ops = &entity_ops;
+	av->vdev.release = video_device_release_empty;
+	av->vdev.fops = &isys_fops;
+	av->vdev.v4l2_dev = &av->isys->v4l2_dev;
+	av->vdev.dev_parent = &av->isys->adev->isp->pdev->dev;
+	av->vdev.ioctl_ops = &ipu7_v4l2_ioctl_ops;
+	av->vdev.queue = &av->aq.vbq;
+	av->vdev.lock = &av->mutex;
+
+	__ipu_isys_vidioc_try_fmt_vid_cap(av, &format);
+	av->pix_fmt = format.fmt.pix;
+
+	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
+	video_set_drvdata(&av->vdev, av);
+
+	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto out_media_entity_cleanup;
+
+	return ret;
+
+out_media_entity_cleanup:
+	vb2_video_unregister_device(&av->vdev);
+	media_entity_cleanup(&av->vdev.entity);
+
+out_vb2_queue_cleanup:
+	vb2_queue_release(&av->aq.vbq);
+
+out_mutex_destroy:
+	mutex_destroy(&av->mutex);
+
+	return ret;
+}
+
+void ipu7_isys_video_cleanup(struct ipu7_isys_video *av)
+{
+	vb2_video_unregister_device(&av->vdev);
+	media_entity_cleanup(&av->vdev.entity);
+	mutex_destroy(&av->mutex);
+}
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys-video.h b/drivers/media/pci/intel/ipu7/ipu7-isys-video.h
new file mode 100644
index 000000000000..6e740dc7f701
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys-video.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_VIDEO_H
+#define IPU7_ISYS_VIDEO_H
+
+#include <linux/atomic.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+
+#include "ipu7-isys-queue.h"
+
+#define IPU_INSYS_OUTPUT_PINS		11
+#define IPU_ISYS_MAX_PARALLEL_SOF	2
+
+struct file;
+struct ipu7_isys;
+struct ipu7_isys_csi2;
+struct ipu7_insys_stream_cfg;
+struct ipu7_isys_subdev;
+
+struct ipu7_isys_pixelformat {
+	u32 pixelformat;
+	u32 bpp;
+	u32 bpp_packed;
+	u32 code;
+	u32 css_pixelformat;
+};
+
+struct sequence_info {
+	unsigned int sequence;
+	u64 timestamp;
+};
+
+struct output_pin_data {
+	void (*pin_ready)(struct ipu7_isys_stream *stream,
+			  struct ipu7_insys_resp *info);
+	struct ipu7_isys_queue *aq;
+};
+
+/*
+ * Align with firmware stream. Each stream represents a CSI virtual channel.
+ * May map to multiple video devices
+ */
+struct ipu7_isys_stream {
+	struct mutex mutex;
+	struct media_entity *source_entity;
+	atomic_t sequence;
+	atomic_t buf_id;
+	unsigned int seq_index;
+	struct sequence_info seq[IPU_ISYS_MAX_PARALLEL_SOF];
+	int stream_source;
+	int stream_handle;
+	unsigned int nr_output_pins;
+	struct ipu7_isys_subdev *asd;
+
+	int nr_queues;  /* Number of capture queues */
+	int nr_streaming;
+	int streaming;
+	struct list_head queues;
+	struct completion stream_open_completion;
+	struct completion stream_close_completion;
+	struct completion stream_start_completion;
+	struct completion stream_stop_completion;
+	struct ipu7_isys *isys;
+
+	struct output_pin_data output_pins[IPU_INSYS_OUTPUT_PINS];
+	int error;
+	u8 vc;
+};
+
+struct ipu7_isys_video {
+	struct ipu7_isys_queue aq;
+	/* Serialise access to other fields in the struct. */
+	struct mutex mutex;
+	struct media_pad pad;
+	struct video_device vdev;
+	struct v4l2_pix_format pix_fmt;
+	struct ipu7_isys *isys;
+	struct ipu7_isys_csi2 *csi2;
+	struct ipu7_isys_stream *stream;
+	unsigned int streaming;
+	u8 vc;
+	u8 dt;
+};
+
+#define ipu7_isys_queue_to_video(__aq)			\
+	container_of(__aq, struct ipu7_isys_video, aq)
+
+extern const struct ipu7_isys_pixelformat ipu7_isys_pfmts[];
+
+const struct ipu7_isys_pixelformat *ipu7_isys_get_isys_format(u32 pixelformat);
+int ipu7_isys_video_prepare_stream(struct ipu7_isys_video *av,
+				   struct media_entity *source_entity,
+				   int nr_queues);
+int ipu7_isys_video_set_streaming(struct ipu7_isys_video *av, int state,
+				  struct ipu7_isys_buffer_list *bl);
+int ipu7_isys_fw_open(struct ipu7_isys *isys);
+void ipu7_isys_fw_close(struct ipu7_isys *isys);
+int ipu7_isys_setup_video(struct ipu7_isys_video *av,
+			  struct media_entity **source_entity, int *nr_queues);
+int ipu7_isys_video_init(struct ipu7_isys_video *av);
+void ipu7_isys_video_cleanup(struct ipu7_isys_video *av);
+void ipu7_isys_put_stream(struct ipu7_isys_stream *stream);
+struct ipu7_isys_stream *
+ipu7_isys_query_stream_by_handle(struct ipu7_isys *isys,
+				 u8 stream_handle);
+struct ipu7_isys_stream *
+ipu7_isys_query_stream_by_source(struct ipu7_isys *isys, int source, u8 vc);
+#endif /* IPU7_ISYS_VIDEO_H */
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys.c b/drivers/media/pci/intel/ipu7/ipu7-isys.c
new file mode 100644
index 000000000000..6d9c7bcd218c
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys.c
@@ -0,0 +1,1170 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/firmware.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_qos.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <media/ipu-bridge.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#include "abi/ipu7_fw_isys_abi.h"
+
+#include "ipu7-bus.h"
+#include "ipu7-buttress-regs.h"
+#include "ipu7-cpd.h"
+#include "ipu7-dma.h"
+#include "ipu7-fw-isys.h"
+#include "ipu7-mmu.h"
+#include "ipu7-isys.h"
+#include "ipu7-isys-csi2.h"
+#include "ipu7-isys-csi-phy.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-isys-video.h"
+#include "ipu7-platform-regs.h"
+
+#define ISYS_PM_QOS_VALUE	300
+
+static int
+isys_complete_ext_device_registration(struct ipu7_isys *isys,
+				      struct v4l2_subdev *sd,
+				      struct ipu7_isys_csi2_config *csi2)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	unsigned int i;
+	int ret;
+
+	v4l2_set_subdev_hostdata(sd, csi2);
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		if (sd->entity.pads[i].flags & MEDIA_PAD_FL_SOURCE)
+			break;
+	}
+
+	if (i == sd->entity.num_pads) {
+		dev_warn(dev, "no source pad in external entity\n");
+		ret = -ENOENT;
+		goto skip_unregister_subdev;
+	}
+
+	ret = media_create_pad_link(&sd->entity, i,
+				    &isys->csi2[csi2->port].asd.sd.entity,
+				    0, MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_warn(dev, "can't create link\n");
+		goto skip_unregister_subdev;
+	}
+
+	isys->csi2[csi2->port].nlanes = csi2->nlanes;
+	if (csi2->bus_type == V4L2_MBUS_CSI2_DPHY)
+		isys->csi2[csi2->port].phy_mode = PHY_MODE_DPHY;
+	else
+		isys->csi2[csi2->port].phy_mode = PHY_MODE_CPHY;
+
+	return 0;
+
+skip_unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+	return ret;
+}
+
+static void isys_stream_init(struct ipu7_isys *isys)
+{
+	unsigned int i;
+
+	for (i = 0; i < IPU_ISYS_MAX_STREAMS; i++) {
+		mutex_init(&isys->streams[i].mutex);
+		init_completion(&isys->streams[i].stream_open_completion);
+		init_completion(&isys->streams[i].stream_close_completion);
+		init_completion(&isys->streams[i].stream_start_completion);
+		init_completion(&isys->streams[i].stream_stop_completion);
+		INIT_LIST_HEAD(&isys->streams[i].queues);
+		isys->streams[i].isys = isys;
+		isys->streams[i].stream_handle = i;
+		isys->streams[i].vc = INVALID_VC_ID;
+	}
+}
+
+static int isys_fw_log_init(struct ipu7_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct isys_fw_log *fw_log;
+	void *log_buf;
+
+	if (isys->fw_log)
+		return 0;
+
+	fw_log = devm_kzalloc(dev, sizeof(*fw_log), GFP_KERNEL);
+	if (!fw_log)
+		return -ENOMEM;
+
+	mutex_init(&fw_log->mutex);
+
+	log_buf = devm_kzalloc(dev, FW_LOG_BUF_SIZE, GFP_KERNEL);
+	if (!log_buf)
+		return -ENOMEM;
+
+	fw_log->head = log_buf;
+	fw_log->addr = log_buf;
+	fw_log->count = 0;
+	fw_log->size = 0;
+
+	isys->fw_log = fw_log;
+
+	return 0;
+}
+
+/* The .bound() notifier callback when a match is found */
+static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *sd,
+			       struct v4l2_async_connection *asc)
+{
+	struct ipu7_isys *isys = container_of(notifier,
+					      struct ipu7_isys, notifier);
+	struct sensor_async_sd *s_asd =
+		container_of(asc, struct sensor_async_sd, asc);
+	struct device *dev = &isys->adev->auxdev.dev;
+	int ret;
+
+	ret = ipu_bridge_instantiate_vcm(sd->dev);
+	if (ret) {
+		dev_err(dev, "instantiate vcm failed\n");
+		return ret;
+	}
+
+	dev_info(dev, "bind %s nlanes is %d port is %d\n",
+		 sd->name, s_asd->csi2.nlanes, s_asd->csi2.port);
+	isys_complete_ext_device_registration(isys, sd, &s_asd->csi2);
+
+	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
+}
+
+static int isys_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct ipu7_isys *isys = container_of(notifier,
+					      struct ipu7_isys, notifier);
+
+	dev_info(&isys->adev->auxdev.dev,
+		 "All sensor registration completed.\n");
+
+	return v4l2_device_register_subdev_nodes(&isys->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations isys_async_ops = {
+	.bound = isys_notifier_bound,
+	.complete = isys_notifier_complete,
+};
+
+static int isys_notifier_init(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2 =
+		&isys->pdata->ipdata->csi2;
+	struct ipu7_device *isp = isys->adev->isp;
+	struct device *dev = &isp->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	v4l2_async_nf_init(&isys->notifier, &isys->v4l2_dev);
+
+	for (i = 0; i < csi2->nports; i++) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_UNKNOWN
+		};
+		struct sensor_async_sd *s_asd;
+		struct fwnode_handle *ep;
+
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), i, 0,
+						     FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!ep)
+			continue;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret)
+			goto err_parse;
+
+		if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
+			ret = -EINVAL;
+			dev_err(dev, "unsupported bus type %d!\n",
+				vep.bus_type);
+			goto err_parse;
+		}
+
+		s_asd = v4l2_async_nf_add_fwnode_remote(&isys->notifier, ep,
+							struct
+							sensor_async_sd);
+		if (IS_ERR(s_asd)) {
+			ret = PTR_ERR(s_asd);
+			goto err_parse;
+		}
+
+		s_asd->csi2.port = vep.base.port;
+		s_asd->csi2.nlanes = vep.bus.mipi_csi2.num_data_lanes;
+		s_asd->csi2.bus_type = vep.bus_type;
+
+		fwnode_handle_put(ep);
+
+		continue;
+
+err_parse:
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	if (list_empty(&isys->notifier.waiting_list)) {
+		/* isys probe could continue with async subdevs missing */
+		dev_warn(dev, "no subdev found in graph\n");
+		return 0;
+	}
+
+	isys->notifier.ops = &isys_async_ops;
+	ret = v4l2_async_nf_register(&isys->notifier);
+	if (ret) {
+		dev_err(dev, "failed to register async notifier(%d)\n", ret);
+		v4l2_async_nf_cleanup(&isys->notifier);
+	}
+
+	return ret;
+}
+
+static void isys_notifier_cleanup(struct ipu7_isys *isys)
+{
+	v4l2_async_nf_unregister(&isys->notifier);
+	v4l2_async_nf_cleanup(&isys->notifier);
+}
+
+static void isys_unregister_video_devices(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	unsigned int i, j;
+
+	for (i = 0; i < csi2_pdata->nports; i++)
+		for (j = 0; j < NR_OF_CSI2_SRC_PADS; j++)
+			ipu7_isys_video_cleanup(&isys->csi2[i].av[j]);
+}
+
+static int isys_register_video_devices(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < csi2_pdata->nports; i++) {
+		for (j = 0; j < NR_OF_CSI2_SRC_PADS; j++) {
+			struct ipu7_isys_video *av = &isys->csi2[i].av[j];
+
+			snprintf(av->vdev.name, sizeof(av->vdev.name),
+				 IPU_ISYS_ENTITY_PREFIX " ISYS Capture %u",
+				 i * NR_OF_CSI2_SRC_PADS + j);
+			av->isys = isys;
+			av->aq.vbq.buf_struct_size =
+				sizeof(struct ipu7_isys_video_buffer);
+
+			ret = ipu7_isys_video_init(av);
+			if (ret)
+				goto fail;
+		}
+	}
+
+	return 0;
+
+fail:
+	i = i + 1;
+	while (i--) {
+		while (j--)
+			ipu7_isys_video_cleanup(&isys->csi2[i].av[j]);
+		j = NR_OF_CSI2_SRC_PADS;
+	}
+
+	return ret;
+}
+
+static void isys_csi2_unregister_subdevices(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2 =
+		&isys->pdata->ipdata->csi2;
+	unsigned int i;
+
+	for (i = 0; i < csi2->nports; i++)
+		ipu7_isys_csi2_cleanup(&isys->csi2[i]);
+}
+
+static int isys_csi2_register_subdevices(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < csi2_pdata->nports; i++) {
+		ret = ipu7_isys_csi2_init(&isys->csi2[i], isys,
+					  isys->pdata->base +
+					  csi2_pdata->offsets[i], i);
+		if (ret)
+			goto fail;
+	}
+
+	isys->isr_csi2_mask = IPU7_CSI_RX_LEGACY_IRQ_MASK;
+
+	return 0;
+
+fail:
+	while (i--)
+		ipu7_isys_csi2_cleanup(&isys->csi2[i]);
+
+	return ret;
+}
+
+static int isys_csi2_create_media_links(struct ipu7_isys *isys)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata =
+		&isys->pdata->ipdata->csi2;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct media_entity *sd;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < csi2_pdata->nports; i++) {
+		sd = &isys->csi2[i].asd.sd.entity;
+
+		for (j = 0; j < NR_OF_CSI2_SRC_PADS; j++) {
+			struct ipu7_isys_video *av = &isys->csi2[i].av[j];
+
+			ret = media_create_pad_link(sd, CSI2_PAD_SRC + j,
+						    &av->vdev.entity, 0, 0);
+			if (ret) {
+				dev_err(dev, "CSI2 can't create link\n");
+				return ret;
+			}
+
+			av->csi2 = &isys->csi2[i];
+		}
+	}
+
+	return 0;
+}
+
+static int isys_register_devices(struct ipu7_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct pci_dev *pdev = isys->adev->isp->pdev;
+	int ret;
+
+	media_device_pci_init(&isys->media_dev,
+			      pdev, IPU_MEDIA_DEV_MODEL_NAME);
+
+	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
+		sizeof(isys->v4l2_dev.name));
+
+	ret = media_device_register(&isys->media_dev);
+	if (ret < 0)
+		goto out_media_device_unregister;
+
+	isys->v4l2_dev.mdev = &isys->media_dev;
+	isys->v4l2_dev.ctrl_handler = NULL;
+
+	ret = v4l2_device_register(dev, &isys->v4l2_dev);
+	if (ret < 0)
+		goto out_media_device_unregister;
+
+	ret = isys_register_video_devices(isys);
+	if (ret)
+		goto out_v4l2_device_unregister;
+
+	ret = isys_csi2_register_subdevices(isys);
+	if (ret)
+		goto out_video_unregister_device;
+
+	ret = isys_csi2_create_media_links(isys);
+	if (ret)
+		goto out_csi2_unregister_subdevices;
+
+	ret = isys_notifier_init(isys);
+	if (ret)
+		goto out_csi2_unregister_subdevices;
+
+	return 0;
+
+out_csi2_unregister_subdevices:
+	isys_csi2_unregister_subdevices(isys);
+
+out_video_unregister_device:
+	isys_unregister_video_devices(isys);
+
+out_v4l2_device_unregister:
+	v4l2_device_unregister(&isys->v4l2_dev);
+
+out_media_device_unregister:
+	media_device_unregister(&isys->media_dev);
+	media_device_cleanup(&isys->media_dev);
+
+	dev_err(dev, "failed to register isys devices\n");
+
+	return ret;
+}
+
+static void isys_unregister_devices(struct ipu7_isys *isys)
+{
+	isys_unregister_video_devices(isys);
+	isys_csi2_unregister_subdevices(isys);
+	v4l2_device_unregister(&isys->v4l2_dev);
+	media_device_unregister(&isys->media_dev);
+	media_device_cleanup(&isys->media_dev);
+}
+
+static void enable_csi2_legacy_irq(struct ipu7_isys *isys, bool enable)
+{
+	u32 offset = IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
+	void __iomem *base = isys->pdata->base;
+	u32 mask = isys->isr_csi2_mask;
+
+	if (!enable) {
+		writel(mask, base + offset + IRQ_CTL_CLEAR);
+		writel(0, base + offset + IRQ_CTL_ENABLE);
+		return;
+	}
+
+	writel(mask, base + offset + IRQ_CTL_EDGE);
+	writel(mask, base + offset + IRQ_CTL_CLEAR);
+	writel(mask, base + offset + IRQ_CTL_MASK);
+	writel(mask, base + offset + IRQ_CTL_ENABLE);
+}
+
+static void enable_to_sw_irq(struct ipu7_isys *isys, bool enable)
+{
+	void __iomem *base = isys->pdata->base;
+	u32 mask = IS_UC_TO_SW_IRQ_MASK;
+	u32 offset = IS_UC_CTRL_BASE;
+
+	if (!enable) {
+		writel(0, base + offset + TO_SW_IRQ_CNTL_ENABLE);
+		return;
+	}
+
+	writel(mask, base + offset + TO_SW_IRQ_CNTL_CLEAR);
+	writel(mask, base + offset + TO_SW_IRQ_CNTL_MASK_N);
+	writel(mask, base + offset + TO_SW_IRQ_CNTL_ENABLE);
+}
+
+static void isys_setup_hw(struct ipu7_isys *isys)
+{
+	u32 offset;
+	void __iomem *base = isys->pdata->base;
+
+	/* soft reset */
+	offset = IS_IO_GPREGS_BASE;
+
+	writel(0x0, base + offset + CLK_EN_TXCLKESC);
+	/* Update if ISYS freq updated (0: 400/1, 1:400/2, 63:400/64) */
+	writel(0x0, base + offset + CLK_DIV_FACTOR_IS_CLK);
+	/* correct the initial printf configuration */
+	writel(0x200, base + IS_UC_CTRL_BASE + PRINTF_AXI_CNTL);
+
+	enable_to_sw_irq(isys, 1);
+	enable_csi2_legacy_irq(isys, 1);
+}
+
+static void isys_cleanup_hw(struct ipu7_isys *isys)
+{
+	enable_csi2_legacy_irq(isys, 0);
+	enable_to_sw_irq(isys, 0);
+}
+
+static int isys_runtime_pm_resume(struct device *dev)
+{
+	struct ipu7_bus_device *adev = to_ipu7_bus_device(dev);
+	struct ipu7_isys *isys = ipu7_bus_get_drvdata(adev);
+	struct ipu7_device *isp = adev->isp;
+	unsigned long flags;
+	int ret;
+
+	if (!isys)
+		return 0;
+
+	ret = ipu7_mmu_hw_init(adev->mmu);
+	if (ret)
+		return ret;
+
+	cpu_latency_qos_update_request(&isys->pm_qos, ISYS_PM_QOS_VALUE);
+
+	ret = ipu_buttress_start_tsc_sync(isp);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 1;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	isys_setup_hw(isys);
+
+	return 0;
+}
+
+static int isys_runtime_pm_suspend(struct device *dev)
+{
+	struct ipu7_bus_device *adev = to_ipu7_bus_device(dev);
+	struct ipu7_isys *isys = ipu7_bus_get_drvdata(adev);
+	unsigned long flags;
+
+	if (!isys)
+		return 0;
+
+	isys_cleanup_hw(isys);
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 0;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	mutex_lock(&isys->mutex);
+	isys->need_reset = false;
+	mutex_unlock(&isys->mutex);
+
+	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	ipu7_mmu_hw_cleanup(adev->mmu);
+
+	return 0;
+}
+
+static int isys_suspend(struct device *dev)
+{
+	struct ipu7_isys *isys = dev_get_drvdata(dev);
+
+	/* If stream is open, refuse to suspend */
+	if (isys->stream_opened)
+		return -EBUSY;
+
+	return 0;
+}
+
+static int isys_resume(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops isys_pm_ops = {
+	.runtime_suspend = isys_runtime_pm_suspend,
+	.runtime_resume = isys_runtime_pm_resume,
+	.suspend = isys_suspend,
+	.resume = isys_resume,
+};
+
+static void isys_remove(struct auxiliary_device *auxdev)
+{
+	struct ipu7_isys *isys = dev_get_drvdata(&auxdev->dev);
+	struct isys_fw_msgs *fwmsg, *safe;
+	struct ipu7_bus_device *adev = auxdev_to_adev(auxdev);
+
+	for (int i = 0; i < IPU_ISYS_MAX_STREAMS; i++)
+		mutex_destroy(&isys->streams[i].mutex);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
+		ipu7_dma_free(adev, sizeof(struct isys_fw_msgs),
+			      fwmsg, fwmsg->dma_addr, 0);
+
+	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
+		ipu7_dma_free(adev, sizeof(struct isys_fw_msgs),
+			      fwmsg, fwmsg->dma_addr, 0);
+
+	isys_notifier_cleanup(isys);
+	isys_unregister_devices(isys);
+
+	cpu_latency_qos_remove_request(&isys->pm_qos);
+
+	mutex_destroy(&isys->stream_mutex);
+	mutex_destroy(&isys->mutex);
+}
+
+static int alloc_fw_msg_bufs(struct ipu7_isys *isys, int amount)
+{
+	struct ipu7_bus_device *adev = isys->adev;
+	struct isys_fw_msgs *addr;
+	dma_addr_t dma_addr;
+	unsigned long flags;
+	unsigned int i;
+
+	for (i = 0; i < amount; i++) {
+		addr = ipu7_dma_alloc(adev, sizeof(struct isys_fw_msgs),
+				      &dma_addr, GFP_KERNEL, 0);
+		if (!addr)
+			break;
+		addr->dma_addr = dma_addr;
+
+		spin_lock_irqsave(&isys->listlock, flags);
+		list_add(&addr->head, &isys->framebuflist);
+		spin_unlock_irqrestore(&isys->listlock, flags);
+	}
+
+	if (i == amount)
+		return 0;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	while (!list_empty(&isys->framebuflist)) {
+		addr = list_first_entry(&isys->framebuflist,
+					struct isys_fw_msgs, head);
+		list_del(&addr->head);
+		spin_unlock_irqrestore(&isys->listlock, flags);
+		ipu7_dma_free(adev, sizeof(struct isys_fw_msgs),
+			      addr, addr->dma_addr, 0);
+		spin_lock_irqsave(&isys->listlock, flags);
+	}
+	spin_unlock_irqrestore(&isys->listlock, flags);
+
+	return -ENOMEM;
+}
+
+struct isys_fw_msgs *ipu7_get_fw_msg_buf(struct ipu7_isys_stream *stream)
+{
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu7_isys *isys = stream->isys;
+	struct isys_fw_msgs *msg;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	if (list_empty(&isys->framebuflist)) {
+		spin_unlock_irqrestore(&isys->listlock, flags);
+		dev_dbg(dev, "Frame buffer list empty\n");
+
+		ret = alloc_fw_msg_bufs(isys, 5);
+		if (ret < 0)
+			return NULL;
+
+		spin_lock_irqsave(&isys->listlock, flags);
+		if (list_empty(&isys->framebuflist)) {
+			spin_unlock_irqrestore(&isys->listlock, flags);
+			dev_err(dev, "Frame list empty\n");
+			return NULL;
+		}
+	}
+	msg = list_last_entry(&isys->framebuflist, struct isys_fw_msgs, head);
+	list_move(&msg->head, &isys->framebuflist_fw);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+	memset(&msg->fw_msg, 0, sizeof(msg->fw_msg));
+
+	return msg;
+}
+
+void ipu7_cleanup_fw_msg_bufs(struct ipu7_isys *isys)
+{
+	struct isys_fw_msgs *fwmsg, *fwmsg0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	list_for_each_entry_safe(fwmsg, fwmsg0, &isys->framebuflist_fw, head)
+		list_move(&fwmsg->head, &isys->framebuflist);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+}
+
+void ipu7_put_fw_msg_buf(struct ipu7_isys *isys, uintptr_t data)
+{
+	struct isys_fw_msgs *msg;
+	void *ptr = (void *)data;
+	unsigned long flags;
+
+	if (WARN_ON_ONCE(!ptr))
+		return;
+
+	spin_lock_irqsave(&isys->listlock, flags);
+	msg = container_of(ptr, struct isys_fw_msgs, fw_msg.dummy);
+	list_move(&msg->head, &isys->framebuflist);
+	spin_unlock_irqrestore(&isys->listlock, flags);
+}
+
+static int isys_probe(struct auxiliary_device *auxdev,
+		      const struct auxiliary_device_id *auxdev_id)
+{
+	const struct ipu7_isys_internal_csi2_pdata *csi2_pdata;
+	struct ipu7_bus_device *adev = auxdev_to_adev(auxdev);
+	struct ipu7_device *isp = adev->isp;
+	struct ipu7_isys *isys;
+	int ret = 0;
+
+	if (!isp->ipu7_bus_ready_to_probe)
+		return -EPROBE_DEFER;
+
+	isys = devm_kzalloc(&auxdev->dev, sizeof(*isys), GFP_KERNEL);
+	if (!isys)
+		return -ENOMEM;
+
+	ret = pm_runtime_resume_and_get(&auxdev->dev);
+	if (ret < 0)
+		return ret;
+
+	adev->auxdrv_data =
+		(const struct ipu7_auxdrv_data *)auxdev_id->driver_data;
+	adev->auxdrv = to_auxiliary_drv(auxdev->dev.driver);
+	isys->adev = adev;
+	isys->pdata = adev->pdata;
+
+	INIT_LIST_HEAD(&isys->requests);
+	csi2_pdata = &isys->pdata->ipdata->csi2;
+
+	isys->csi2 = devm_kcalloc(&auxdev->dev, csi2_pdata->nports,
+				  sizeof(*isys->csi2), GFP_KERNEL);
+	if (!isys->csi2) {
+		ret = -ENOMEM;
+		goto out_runtime_put;
+	}
+
+	ret = ipu7_mmu_hw_init(adev->mmu);
+	if (ret)
+		goto out_runtime_put;
+
+	spin_lock_init(&isys->streams_lock);
+	spin_lock_init(&isys->power_lock);
+	isys->power = 0;
+
+	mutex_init(&isys->mutex);
+	mutex_init(&isys->stream_mutex);
+
+	spin_lock_init(&isys->listlock);
+	INIT_LIST_HEAD(&isys->framebuflist);
+	INIT_LIST_HEAD(&isys->framebuflist_fw);
+
+	dev_set_drvdata(&auxdev->dev, isys);
+
+	isys->line_align = IPU_ISYS_2600_MEM_LINE_ALIGN;
+	isys->icache_prefetch = 0;
+	isys->phy_rext_cal = 0;
+
+	isys_stream_init(isys);
+
+	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+	alloc_fw_msg_bufs(isys, 20);
+
+	ret = ipu7_fw_isys_init(isys);
+	if (ret)
+		goto out_cleanup_mmu;
+
+	ret = isys_register_devices(isys);
+	if (ret)
+		goto out_cleanup_fw;
+
+	ret = isys_fw_log_init(isys);
+	if (ret)
+		goto out_cleanup;
+
+	ipu7_mmu_hw_cleanup(adev->mmu);
+	pm_runtime_put(&auxdev->dev);
+
+	return 0;
+
+out_cleanup:
+	isys_unregister_devices(isys);
+out_cleanup_fw:
+	ipu7_fw_isys_release(isys);
+
+out_cleanup_mmu:
+	for (unsigned int i = 0; i < IPU_ISYS_MAX_STREAMS; i++)
+		mutex_destroy(&isys->streams[i].mutex);
+
+	mutex_destroy(&isys->mutex);
+	mutex_destroy(&isys->stream_mutex);
+
+	ipu7_mmu_hw_cleanup(adev->mmu);
+
+out_runtime_put:
+	pm_runtime_put(&auxdev->dev);
+
+	return ret;
+}
+
+struct ipu7_csi2_error {
+	const char *error_string;
+	bool is_info_only;
+};
+
+/*
+ * Strings corresponding to CSI-2 receiver errors are here.
+ * Corresponding macros are defined in the header file.
+ */
+static const struct ipu7_csi2_error dphy_rx_errors[] = {
+	{ "Error handler FIFO full", false },
+	{ "Reserved Short Packet encoding detected", true },
+	{ "Reserved Long Packet encoding detected", true },
+	{ "Received packet is too short", false},
+	{ "Received packet is too long", false},
+	{ "Short packet discarded due to errors", false },
+	{ "Long packet discarded due to errors", false },
+	{ "CSI Combo Rx interrupt", false },
+	{ "IDI CDC FIFO overflow(remaining bits are reserved as 0)", false },
+	{ "Received NULL packet", true },
+	{ "Received blanking packet", true },
+	{ "Tie to 0", true },
+	{ }
+};
+
+static void ipu7_isys_register_errors(struct ipu7_isys_csi2 *csi2)
+{
+	u32 offset = IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+	u32 status = readl(csi2->base + offset + IRQ_CTL_STATUS);
+	int mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+
+	if (!status)
+		return;
+
+	dev_dbg(&csi2->isys->adev->auxdev.dev, "csi2-%u error status 0x%08x\n",
+		csi2->port, status);
+
+	writel(status & mask, csi2->base + offset + IRQ_CTL_CLEAR);
+	csi2->receiver_errors |= status & mask;
+}
+
+static void ipu7_isys_csi2_error(struct ipu7_isys_csi2 *csi2)
+{
+	struct ipu7_csi2_error const *errors;
+	unsigned int i;
+	u32 status;
+
+	/* Register errors once more in case of error interrupts are disabled */
+	ipu7_isys_register_errors(csi2);
+	status = csi2->receiver_errors;
+	csi2->receiver_errors = 0;
+	errors = dphy_rx_errors;
+
+	for (i = 0; i < CSI_RX_NUM_ERRORS_IN_IRQ; i++) {
+		if (status & BIT(i))
+			dev_err_ratelimited(&csi2->isys->adev->auxdev.dev,
+					    "csi2-%i error: %s\n",
+					    csi2->port,
+					    errors[i].error_string);
+	}
+}
+
+struct resp_to_msg {
+	enum ipu7_insys_resp_type type;
+	const char *msg;
+};
+
+static const struct resp_to_msg is_fw_msg[] = {
+	{IPU_INSYS_RESP_TYPE_STREAM_OPEN_DONE,
+	 "IPU_INSYS_RESP_TYPE_STREAM_OPEN_DONE"},
+	{IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	 "IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK"},
+	{IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK,
+	 "IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK"},
+	{IPU_INSYS_RESP_TYPE_STREAM_ABORT_ACK,
+	 "IPU_INSYS_RESP_TYPE_STREAM_ABORT_ACK"},
+	{IPU_INSYS_RESP_TYPE_STREAM_FLUSH_ACK,
+	 "IPU_INSYS_RESP_TYPE_STREAM_FLUSH_ACK"},
+	{IPU_INSYS_RESP_TYPE_STREAM_CLOSE_ACK,
+	 "IPU_INSYS_RESP_TYPE_STREAM_CLOSE_ACK"},
+	{IPU_INSYS_RESP_TYPE_PIN_DATA_READY,
+	 "IPU_INSYS_RESP_TYPE_PIN_DATA_READY"},
+	{IPU_INSYS_RESP_TYPE_FRAME_SOF, "IPU_INSYS_RESP_TYPE_FRAME_SOF"},
+	{IPU_INSYS_RESP_TYPE_FRAME_EOF, "IPU_INSYS_RESP_TYPE_FRAME_EOF"},
+	{IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	 "IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE"},
+	{IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE,
+	 "IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE"},
+	{N_IPU_INSYS_RESP_TYPE, "N_IPU_INSYS_RESP_TYPE"},
+};
+
+int isys_isr_one(struct ipu7_bus_device *adev)
+{
+	struct ipu7_isys *isys = ipu7_bus_get_drvdata(adev);
+	struct ipu7_isys_stream *stream = NULL;
+	struct device *dev = &adev->auxdev.dev;
+	struct ipu7_isys_csi2 *csi2 = NULL;
+	struct ia_gofo_msg_err err_info;
+	struct ipu7_insys_resp *resp;
+	u64 ts;
+
+	if (!isys->adev->syscom)
+		return 1;
+
+	resp = ipu7_fw_isys_get_resp(isys);
+	if (!resp)
+		return 1;
+	if (resp->type >= N_IPU_INSYS_RESP_TYPE) {
+		dev_err(dev, "Unknown response type %u stream %u\n",
+			resp->type, resp->stream_id);
+		ipu7_fw_isys_put_resp(isys);
+		return 1;
+	}
+
+	err_info = resp->error_info;
+	ts = ((u64)resp->timestamp[1] << 32) | resp->timestamp[0];
+	if (err_info.err_group == INSYS_MSG_ERR_GROUP_CAPTURE &&
+	    err_info.err_code == INSYS_MSG_ERR_CAPTURE_SYNC_FRAME_DROP) {
+		/* receive a sp w/o command, firmware drop it */
+		dev_dbg(dev, "FRAME DROP: %02u %s stream %u\n",
+			resp->type, is_fw_msg[resp->type].msg,
+			resp->stream_id);
+		dev_dbg(dev, "\tpin %u buf_id %llx frame %u\n",
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_dbg(dev, "\terror group %u code %u details [%u %u]\n",
+			err_info.err_group, err_info.err_code,
+			err_info.err_detail[0], err_info.err_detail[1]);
+	} else if (!IA_GOFO_MSG_ERR_IS_OK(err_info)) {
+		dev_err(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
+			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_err(dev, "\terror group %u code %u details [%u %u]\n",
+			err_info.err_group, err_info.err_code,
+			err_info.err_detail[0], err_info.err_detail[1]);
+	} else {
+		dev_dbg(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
+			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_dbg(dev, "\tts %llu\n", ts);
+	}
+
+	if (resp->stream_id >= IPU_ISYS_MAX_STREAMS) {
+		dev_err(dev, "bad stream handle %u\n",
+			resp->stream_id);
+		goto leave;
+	}
+
+	stream = ipu7_isys_query_stream_by_handle(isys, resp->stream_id);
+	if (!stream) {
+		dev_err(dev, "stream of stream_handle %u is unused\n",
+			resp->stream_id);
+		goto leave;
+	}
+
+	stream->error = err_info.err_code;
+
+	if (stream->asd)
+		csi2 = ipu7_isys_subdev_to_csi2(stream->asd);
+
+	switch (resp->type) {
+	case IPU_INSYS_RESP_TYPE_STREAM_OPEN_DONE:
+		complete(&stream->stream_open_completion);
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_CLOSE_ACK:
+		complete(&stream->stream_close_completion);
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_ABORT_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_FLUSH_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU_INSYS_RESP_TYPE_PIN_DATA_READY:
+		/*
+		 * firmware only release the capture msg until software
+		 * get pin_data_ready event
+		 */
+		ipu7_put_fw_msg_buf(ipu7_bus_get_drvdata(adev), resp->buf_id);
+		if (resp->pin_id < IPU_INSYS_OUTPUT_PINS &&
+		    stream->output_pins[resp->pin_id].pin_ready)
+			stream->output_pins[resp->pin_id].pin_ready(stream,
+								    resp);
+		else
+			dev_err(dev, "No handler for pin %u ready\n",
+				resp->pin_id);
+		if (csi2)
+			ipu7_isys_csi2_error(csi2);
+
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+		break;
+	case IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+	case IPU_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+		break;
+	case IPU_INSYS_RESP_TYPE_FRAME_SOF:
+		if (csi2)
+			ipu7_isys_csi2_sof_event_by_stream(stream);
+
+		stream->seq[stream->seq_index].sequence =
+			atomic_read(&stream->sequence) - 1;
+		stream->seq[stream->seq_index].timestamp = ts;
+		dev_dbg(dev,
+			"SOF: stream %u frame %u (index %u), ts 0x%16.16llx\n",
+			resp->stream_id, resp->frame_id,
+			stream->seq[stream->seq_index].sequence, ts);
+		stream->seq_index = (stream->seq_index + 1)
+			% IPU_ISYS_MAX_PARALLEL_SOF;
+		break;
+	case IPU_INSYS_RESP_TYPE_FRAME_EOF:
+		if (csi2)
+			ipu7_isys_csi2_eof_event_by_stream(stream);
+
+		dev_dbg(dev, "eof: stream %d(index %u) ts 0x%16.16llx\n",
+			resp->stream_id,
+			stream->seq[stream->seq_index].sequence, ts);
+		break;
+	default:
+		dev_err(dev, "Unknown response type %u stream %u\n",
+			resp->type, resp->stream_id);
+		break;
+	}
+
+	ipu7_isys_put_stream(stream);
+leave:
+	ipu7_fw_isys_put_resp(isys);
+
+	return 0;
+}
+
+static void ipu7_isys_csi2_isr(struct ipu7_isys_csi2 *csi2)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct ipu7_device *isp = csi2->isys->adev->isp;
+	struct ipu7_isys_stream *s;
+	u32 sync, offset;
+	u32 fe = 0;
+	u8 vc;
+
+	ipu7_isys_register_errors(csi2);
+
+	offset = IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+	sync = readl(csi2->base + offset + IRQ_CTL_STATUS);
+	writel(sync, csi2->base + offset + IRQ_CTL_CLEAR);
+	dev_dbg(dev, "csi2-%u sync status 0x%08x\n", csi2->port, sync);
+
+	if (!is_ipu7(isp->hw_ver)) {
+		fe = readl(csi2->base + offset + IRQ1_CTL_STATUS);
+		writel(fe, csi2->base + offset + IRQ1_CTL_CLEAR);
+		dev_dbg(dev, "csi2-%u FE status 0x%08x\n", csi2->port, fe);
+	}
+
+	for (vc = 0; vc < NR_OF_CSI2_VC && (sync || fe); vc++) {
+		s = ipu7_isys_query_stream_by_source(csi2->isys,
+						     csi2->asd.source, vc);
+		if (!s)
+			continue;
+
+		if (!is_ipu7(isp->hw_ver)) {
+			if (sync & IPU7P5_CSI_RX_SYNC_FS_VC & (1 << vc))
+				ipu7_isys_csi2_sof_event_by_stream(s);
+
+			if (fe & IPU7P5_CSI_RX_SYNC_FE_VC & (1 << vc))
+				ipu7_isys_csi2_eof_event_by_stream(s);
+		} else {
+			if (sync & IPU7_CSI_RX_SYNC_FS_VC & (1 << (vc * 2)))
+				ipu7_isys_csi2_sof_event_by_stream(s);
+
+			if (sync & IPU7_CSI_RX_SYNC_FE_VC & (2 << (vc * 2)))
+				ipu7_isys_csi2_eof_event_by_stream(s);
+		}
+	}
+}
+
+irqreturn_t isys_isr(struct ipu7_bus_device *adev)
+{
+	struct ipu7_isys *isys = ipu7_bus_get_drvdata(adev);
+	u32 status_csi, status_sw, csi_offset, sw_offset;
+	struct device *dev = &isys->adev->auxdev.dev;
+	void __iomem *base = isys->pdata->base;
+
+	spin_lock(&isys->power_lock);
+	if (!isys->power) {
+		spin_unlock(&isys->power_lock);
+		return IRQ_NONE;
+	}
+
+	csi_offset = IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
+	sw_offset = IS_BASE;
+
+	status_csi = readl(base + csi_offset + IRQ_CTL_STATUS);
+	status_sw = readl(base + sw_offset + TO_SW_IRQ_CNTL_STATUS);
+	if (!status_csi && !status_sw) {
+		spin_unlock(&isys->power_lock);
+		return IRQ_NONE;
+	}
+
+	if (status_csi)
+		dev_dbg(dev, "status csi 0x%08x\n", status_csi);
+	if (status_sw)
+		dev_dbg(dev, "status to_sw 0x%08x\n", status_sw);
+
+	do {
+		writel(status_sw, base + sw_offset + TO_SW_IRQ_CNTL_CLEAR);
+		writel(status_csi, base + csi_offset + IRQ_CTL_CLEAR);
+
+		if (isys->isr_csi2_mask & status_csi) {
+			unsigned int i;
+
+			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+				/* irq from not enabled port */
+				if (!isys->csi2[i].base)
+					continue;
+				if (status_csi & isys->csi2[i].legacy_irq_mask)
+					ipu7_isys_csi2_isr(&isys->csi2[i]);
+			}
+		}
+
+		if (!isys_isr_one(adev))
+			status_sw = TO_SW_IRQ_FW;
+		else
+			status_sw = 0;
+
+		status_csi = readl(base + csi_offset + IRQ_CTL_STATUS);
+		status_sw |= readl(base + sw_offset + TO_SW_IRQ_CNTL_STATUS);
+	} while ((status_csi & isys->isr_csi2_mask) ||
+		 (status_sw & TO_SW_IRQ_FW));
+
+	writel(TO_SW_IRQ_MASK, base + sw_offset + TO_SW_IRQ_CNTL_MASK_N);
+
+	spin_unlock(&isys->power_lock);
+
+	return IRQ_HANDLED;
+}
+
+static const struct ipu7_auxdrv_data ipu7_isys_auxdrv_data = {
+	.isr = isys_isr,
+	.isr_threaded = NULL,
+	.wake_isr_thread = false,
+};
+
+static const struct auxiliary_device_id ipu7_isys_id_table[] = {
+	{
+		.name = "intel_ipu7.isys",
+		.driver_data = (kernel_ulong_t)&ipu7_isys_auxdrv_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, ipu7_isys_id_table);
+
+static struct auxiliary_driver isys_driver = {
+	.name = IPU_ISYS_NAME,
+	.probe = isys_probe,
+	.remove = isys_remove,
+	.id_table = ipu7_isys_id_table,
+	.driver = {
+		.pm = &isys_pm_ops,
+	},
+};
+
+module_auxiliary_driver(isys_driver);
+
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
+MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Intel ipu7 input system driver");
+MODULE_IMPORT_NS("INTEL_IPU7");
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
diff --git a/drivers/media/pci/intel/ipu7/ipu7-isys.h b/drivers/media/pci/intel/ipu7/ipu7-isys.h
new file mode 100644
index 000000000000..5b868130677a
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/ipu7-isys.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2013 - 2024 Intel Corporation
+ */
+
+#ifndef IPU7_ISYS_H
+#define IPU7_ISYS_H
+
+#include <linux/irqreturn.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/pm_qos.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mediabus.h>
+
+#include "abi/ipu7_fw_msg_abi.h"
+#include "abi/ipu7_fw_isys_abi.h"
+
+#include "ipu7.h"
+#include "ipu7-isys-csi2.h"
+#include "ipu7-isys-video.h"
+
+#define IPU_ISYS_ENTITY_PREFIX		"Intel IPU7"
+
+/* FW support max 16 streams */
+#define IPU_ISYS_MAX_STREAMS		16
+
+#define IPU_ISYS_2600_MEM_LINE_ALIGN	64
+
+/*
+ * Current message queue configuration. These must be big enough
+ * so that they never gets full. Queues are located in system memory
+ */
+#define IPU_ISYS_SIZE_RECV_QUEUE	40
+#define IPU_ISYS_SIZE_LOG_QUEUE		256
+#define IPU_ISYS_SIZE_SEND_QUEUE	40
+#define IPU_ISYS_NUM_RECV_QUEUE		1
+
+#define IPU_ISYS_MIN_WIDTH		2U
+#define IPU_ISYS_MIN_HEIGHT		2U
+#define IPU_ISYS_MAX_WIDTH		8160U
+#define IPU_ISYS_MAX_HEIGHT		8190U
+
+#define FW_CALL_TIMEOUT_JIFFIES		\
+	msecs_to_jiffies(IPU_LIB_CALL_TIMEOUT_MS)
+
+struct isys_fw_log {
+	struct mutex mutex; /* protect whole struct */
+	void *head;
+	void *addr;
+	u32 count; /* running counter of log */
+	u32 size; /* actual size of log content, in bits */
+};
+
+/*
+ * struct ipu7_isys
+ *
+ * @media_dev: Media device
+ * @v4l2_dev: V4L2 device
+ * @adev: ISYS bus device
+ * @power: Is ISYS powered on or not?
+ * @isr_bits: Which bits does the ISR handle?
+ * @power_lock: Serialise access to power (power state in general)
+ * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
+ * @streams_lock: serialise access to streams
+ * @streams: streams per firmware stream ID
+ * @syscom: fw communication layer context
+ * @line_align: line alignment in memory
+ * @need_reset: Isys requires d0i0->i3 transition
+ * @ref_count: total number of callers fw open
+ * @mutex: serialise access isys video open/release related operations
+ * @stream_mutex: serialise stream start and stop, queueing requests
+ * @pdata: platform data pointer
+ * @csi2: CSI-2 receivers
+ */
+struct ipu7_isys {
+	struct media_device media_dev;
+	struct v4l2_device v4l2_dev;
+	struct ipu7_bus_device *adev;
+
+	int power;
+	spinlock_t power_lock;	/* Serialise access to power */
+	u32 isr_csi2_mask;
+	u32 csi2_rx_ctrl_cached;
+	spinlock_t streams_lock;
+	struct ipu7_isys_stream streams[IPU_ISYS_MAX_STREAMS];
+	int streams_ref_count[IPU_ISYS_MAX_STREAMS];
+	unsigned int line_align;
+	u32 phy_rext_cal;
+	bool need_reset;
+	bool icache_prefetch;
+	bool csi2_cse_ipc_not_supported;
+	unsigned int ref_count;
+	unsigned int stream_opened;
+
+	struct mutex mutex;	/* Serialise isys video open/release related */
+	struct mutex stream_mutex;	/* Stream start, stop, queueing reqs */
+
+	struct ipu7_isys_pdata *pdata;
+
+	struct ipu7_isys_csi2 *csi2;
+	struct isys_fw_log *fw_log;
+
+	struct list_head requests;
+	struct pm_qos_request pm_qos;
+	spinlock_t listlock;	/* Protect framebuflist */
+	struct list_head framebuflist;
+	struct list_head framebuflist_fw;
+	struct v4l2_async_notifier notifier;
+
+	struct ipu7_insys_config *subsys_config;
+	dma_addr_t subsys_config_dma_addr;
+};
+
+struct isys_fw_msgs {
+	union {
+		u64 dummy;
+		struct ipu7_insys_buffset frame;
+		struct ipu7_insys_stream_cfg stream;
+	} fw_msg;
+	struct list_head head;
+	dma_addr_t dma_addr;
+};
+
+struct ipu7_isys_csi2_config {
+	unsigned int nlanes;
+	unsigned int port;
+	enum v4l2_mbus_type bus_type;
+};
+
+struct sensor_async_sd {
+	struct v4l2_async_connection asc;
+	struct ipu7_isys_csi2_config csi2;
+};
+
+struct isys_fw_msgs *ipu7_get_fw_msg_buf(struct ipu7_isys_stream *stream);
+void ipu7_put_fw_msg_buf(struct ipu7_isys *isys, uintptr_t data);
+void ipu7_cleanup_fw_msg_bufs(struct ipu7_isys *isys);
+
+extern const struct v4l2_ioctl_ops ipu7_isys_ioctl_ops;
+
+int isys_isr_one(struct ipu7_bus_device *adev);
+irqreturn_t isys_isr(struct ipu7_bus_device *adev);
+
+#endif /* IPU7_ISYS_H */
-- 
2.34.1


