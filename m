Return-Path: <linux-media+bounces-9608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F28A7547
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B817B22DDA
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A538B13A253;
	Tue, 16 Apr 2024 20:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtaYEJGN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D39139CEF
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298296; cv=none; b=FUABOWbQK4fValuPiv2Lu8g6j4yO7ZMFx9zu5ZTlIK2DWfKCNaEcxeV/NK7NarInNiL62EsTHGMSPhmKSvpBqH6EX45U9Gs0td1BNRdM4ywcZyqqRTrqQFanoX8qCH6pCD+Z44kcDWNNgNwg465t/vQLyqqQw63bPKkQ8QryWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298296; c=relaxed/simple;
	bh=/8xoGY5ZFXgsv3taHu/6H4g6Te9F77G4cqP7MVqLQnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dVM+6b8eS4a+WSdL1EhlR3YD/MJlQFp/xosbEvqD6Ch3ZRlCIpKk2CiVSGZxJZad4zXsX/Li0EukLfwHPL3DVFiHzj3c+TTfHKTJbSxnE/HCCOMhTowZv7hCVdxNmBpOoXLDzFjmAoCWxEbYzRq9RaT1Va4LUtyhxhHzJCQDuSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtaYEJGN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298295; x=1744834295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/8xoGY5ZFXgsv3taHu/6H4g6Te9F77G4cqP7MVqLQnM=;
  b=TtaYEJGNda/C1NIGxyZTFXd9hEHiEu/iZqZkeqyDfC/6GPDD6CrEvcFV
   f/GdzI4fxoqO7WY5dFfIilL4z7PDOGIG8wwj1dwYgqyO+rak6w31/hF5z
   +heom2vcvCZtGUC2V0vcWyzMHvukl97sS2hN3lAaXjYes+z3kKimjy9ls
   bnu/1IqG56I0tcg+4lFcwaxHZddWjfmIAHm8R+NADfv/sCAmCPWcdrZhq
   mzozE3ViLktBQ2fyHuZM+D8B5PvLDCpzwcxDCSdn5LziReoH1syNENT1C
   Cdb0CVKzyEdfkmhbuiOiIjzuOd1ND1OCaZwBT/ClcwPpO0H8NW5xg/M0C
   w==;
X-CSE-ConnectionGUID: +nMP26C+QJyZko2PG7xBXw==
X-CSE-MsgGUID: fT5NZMvSQUCGTnH6I3+LQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8626705"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8626705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:34 -0700
X-CSE-ConnectionGUID: dohhi88ISDyV9BTaSObU3Q==
X-CSE-MsgGUID: RgxIU+pgRPO0Y4TLByHKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27172353"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C84A11F879;
	Tue, 16 Apr 2024 23:11:25 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 09/19] media: intel/ipu6: input system ABI between firmware and driver
Date: Tue, 16 Apr 2024 23:10:55 +0300
Message-Id: <20240416201105.781496-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Implement the input system firmware ABIs in the ISYS driver, including
stream configuration, control command, capture request and response.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 487 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h | 568 ++++++++++++++++++++
 2 files changed, 1055 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
new file mode 100644
index 000000000000..62ed92ff1d30
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -0,0 +1,487 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013--2024 Intel Corporation
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "ipu6-bus.h"
+#include "ipu6-fw-com.h"
+#include "ipu6-isys.h"
+#include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu6-platform-regs.h"
+
+static const char send_msg_types[N_IPU6_FW_ISYS_SEND_TYPE][32] = {
+	"STREAM_OPEN",
+	"STREAM_START",
+	"STREAM_START_AND_CAPTURE",
+	"STREAM_CAPTURE",
+	"STREAM_STOP",
+	"STREAM_FLUSH",
+	"STREAM_CLOSE"
+};
+
+static int handle_proxy_response(struct ipu6_isys *isys, unsigned int req_id)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_fw_isys_proxy_resp_info_abi *resp;
+	int ret;
+
+	resp = ipu6_recv_get_token(isys->fwcom, IPU6_BASE_PROXY_RECV_QUEUES);
+	if (!resp)
+		return 1;
+
+	dev_dbg(dev, "Proxy response: id %u, error %u, details %u\n",
+		resp->request_id, resp->error_info.error,
+		resp->error_info.error_details);
+
+	ret = req_id == resp->request_id ? 0 : -EIO;
+
+	ipu6_recv_put_token(isys->fwcom, IPU6_BASE_PROXY_RECV_QUEUES);
+
+	return ret;
+}
+
+int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
+				  unsigned int req_id,
+				  unsigned int index,
+				  unsigned int offset, u32 value)
+{
+	struct ipu6_fw_com_context *ctx = isys->fwcom;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_fw_proxy_send_queue_token *token;
+	unsigned int timeout = 1000;
+	int ret;
+
+	dev_dbg(dev,
+		"proxy send: req_id 0x%x, index %d, offset 0x%x, value 0x%x\n",
+		req_id, index, offset, value);
+
+	token = ipu6_send_get_token(ctx, IPU6_BASE_PROXY_SEND_QUEUES);
+	if (!token)
+		return -EBUSY;
+
+	token->request_id = req_id;
+	token->region_index = index;
+	token->offset = offset;
+	token->value = value;
+	ipu6_send_put_token(ctx, IPU6_BASE_PROXY_SEND_QUEUES);
+
+	do {
+		usleep_range(100, 110);
+		ret = handle_proxy_response(isys, req_id);
+		if (!ret)
+			break;
+		if (ret == -EIO) {
+			dev_err(dev, "Proxy respond with unexpected id\n");
+			break;
+		}
+		timeout--;
+	} while (ret && timeout);
+
+	if (!timeout)
+		dev_err(dev, "Proxy response timed out\n");
+
+	return ret;
+}
+
+int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
+			     const unsigned int stream_handle,
+			     void *cpu_mapped_buf,
+			     dma_addr_t dma_mapped_buf,
+			     size_t size, u16 send_type)
+{
+	struct ipu6_fw_com_context *ctx = isys->fwcom;
+	struct device *dev = &isys->adev->auxdev.dev;
+	struct ipu6_fw_send_queue_token *token;
+
+	if (send_type >= N_IPU6_FW_ISYS_SEND_TYPE)
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
+	token = ipu6_send_get_token(ctx,
+				    stream_handle + IPU6_BASE_MSG_SEND_QUEUES);
+	if (!token)
+		return -EBUSY;
+
+	token->payload = dma_mapped_buf;
+	token->buf_handle = (unsigned long)cpu_mapped_buf;
+	token->send_type = send_type;
+
+	ipu6_send_put_token(ctx, stream_handle + IPU6_BASE_MSG_SEND_QUEUES);
+
+	return 0;
+}
+
+int ipu6_fw_isys_simple_cmd(struct ipu6_isys *isys,
+			    const unsigned int stream_handle, u16 send_type)
+{
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
+					send_type);
+}
+
+int ipu6_fw_isys_close(struct ipu6_isys *isys)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	int retry = IPU6_ISYS_CLOSE_RETRY;
+	unsigned long flags;
+	void *fwcom;
+	int ret;
+
+	/*
+	 * Stop the isys fw. Actual close takes
+	 * some time as the FW must stop its actions including code fetch
+	 * to SP icache.
+	 * spinlock to wait the interrupt handler to be finished
+	 */
+	spin_lock_irqsave(&isys->power_lock, flags);
+	ret = ipu6_fw_com_close(isys->fwcom);
+	fwcom = isys->fwcom;
+	isys->fwcom = NULL;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+	if (ret)
+		dev_err(dev, "Device close failure: %d\n", ret);
+
+	/* release probably fails if the close failed. Let's try still */
+	do {
+		usleep_range(400, 500);
+		ret = ipu6_fw_com_release(fwcom, 0);
+		retry--;
+	} while (ret && retry);
+
+	if (ret) {
+		dev_err(dev, "Device release time out %d\n", ret);
+		spin_lock_irqsave(&isys->power_lock, flags);
+		isys->fwcom = fwcom;
+		spin_unlock_irqrestore(&isys->power_lock, flags);
+	}
+
+	return ret;
+}
+
+void ipu6_fw_isys_cleanup(struct ipu6_isys *isys)
+{
+	int ret;
+
+	ret = ipu6_fw_com_release(isys->fwcom, 1);
+	if (ret < 0)
+		dev_warn(&isys->adev->auxdev.dev,
+			 "Device busy, fw_com release failed.");
+	isys->fwcom = NULL;
+}
+
+static void start_sp(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *spc_regs_base = isys->pdata->base +
+		isys->pdata->ipdata->hw_variant.spc_offset;
+	u32 val = IPU6_ISYS_SPC_STATUS_START |
+		IPU6_ISYS_SPC_STATUS_RUN |
+		IPU6_ISYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE;
+
+	val |= isys->icache_prefetch ? IPU6_ISYS_SPC_STATUS_ICACHE_PREFETCH : 0;
+
+	writel(val, spc_regs_base + IPU6_ISYS_REG_SPC_STATUS_CTRL);
+}
+
+static int query_sp(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *spc_regs_base = isys->pdata->base +
+		isys->pdata->ipdata->hw_variant.spc_offset;
+	u32 val;
+
+	val = readl(spc_regs_base + IPU6_ISYS_REG_SPC_STATUS_CTRL);
+	/* return true when READY == 1, START == 0 */
+	val &= IPU6_ISYS_SPC_STATUS_READY | IPU6_ISYS_SPC_STATUS_START;
+
+	return val == IPU6_ISYS_SPC_STATUS_READY;
+}
+
+static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
+				    struct ipu6_fw_com_cfg *fwcom,
+				    unsigned int num_streams)
+{
+	unsigned int max_send_queues, max_sram_blocks, max_devq_size;
+	struct ipu6_fw_syscom_queue_config *input_queue_cfg;
+	struct ipu6_fw_syscom_queue_config *output_queue_cfg;
+	struct device *dev = &isys->adev->auxdev.dev;
+	int type_proxy = IPU6_FW_ISYS_QUEUE_TYPE_PROXY;
+	int type_dev = IPU6_FW_ISYS_QUEUE_TYPE_DEV;
+	int type_msg = IPU6_FW_ISYS_QUEUE_TYPE_MSG;
+	int base_dev_send = IPU6_BASE_DEV_SEND_QUEUES;
+	int base_msg_send = IPU6_BASE_MSG_SEND_QUEUES;
+	int base_msg_recv = IPU6_BASE_MSG_RECV_QUEUES;
+	struct ipu6_fw_isys_fw_config *isys_fw_cfg;
+	u32 num_in_message_queues;
+	unsigned int max_streams;
+	unsigned int size;
+	unsigned int i;
+
+	max_streams = isys->pdata->ipdata->max_streams;
+	max_send_queues = isys->pdata->ipdata->max_send_queues;
+	max_sram_blocks = isys->pdata->ipdata->max_sram_blocks;
+	max_devq_size = isys->pdata->ipdata->max_devq_size;
+	num_in_message_queues = clamp(num_streams, 1U, max_streams);
+	isys_fw_cfg = devm_kzalloc(dev, sizeof(*isys_fw_cfg), GFP_KERNEL);
+	if (!isys_fw_cfg)
+		return -ENOMEM;
+
+	isys_fw_cfg->num_send_queues[type_proxy] = IPU6_N_MAX_PROXY_SEND_QUEUES;
+	isys_fw_cfg->num_send_queues[type_dev] = IPU6_N_MAX_DEV_SEND_QUEUES;
+	isys_fw_cfg->num_send_queues[type_msg] = num_in_message_queues;
+	isys_fw_cfg->num_recv_queues[type_proxy] = IPU6_N_MAX_PROXY_RECV_QUEUES;
+	/* Common msg/dev return queue */
+	isys_fw_cfg->num_recv_queues[type_dev] = 0;
+	isys_fw_cfg->num_recv_queues[type_msg] = 1;
+
+	size = sizeof(*input_queue_cfg) * max_send_queues;
+	input_queue_cfg = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!input_queue_cfg)
+		return -ENOMEM;
+
+	size = sizeof(*output_queue_cfg) * IPU6_N_MAX_RECV_QUEUES;
+	output_queue_cfg = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!output_queue_cfg)
+		return -ENOMEM;
+
+	fwcom->input = input_queue_cfg;
+	fwcom->output = output_queue_cfg;
+
+	fwcom->num_input_queues = isys_fw_cfg->num_send_queues[type_proxy] +
+		isys_fw_cfg->num_send_queues[type_dev] +
+		isys_fw_cfg->num_send_queues[type_msg];
+
+	fwcom->num_output_queues = isys_fw_cfg->num_recv_queues[type_proxy] +
+		isys_fw_cfg->num_recv_queues[type_dev] +
+		isys_fw_cfg->num_recv_queues[type_msg];
+
+	/* SRAM partitioning. Equal partitioning is set. */
+	for (i = 0; i < max_sram_blocks; i++) {
+		if (i < num_in_message_queues)
+			isys_fw_cfg->buffer_partition.num_gda_pages[i] =
+				(IPU6_DEVICE_GDA_NR_PAGES *
+				 IPU6_DEVICE_GDA_VIRT_FACTOR) /
+				num_in_message_queues;
+		else
+			isys_fw_cfg->buffer_partition.num_gda_pages[i] = 0;
+	}
+
+	/* FW assumes proxy interface at fwcom queue 0 */
+	for (i = 0; i < isys_fw_cfg->num_send_queues[type_proxy]; i++) {
+		input_queue_cfg[i].token_size =
+			sizeof(struct ipu6_fw_proxy_send_queue_token);
+		input_queue_cfg[i].queue_size = IPU6_ISYS_SIZE_PROXY_SEND_QUEUE;
+	}
+
+	for (i = 0; i < isys_fw_cfg->num_send_queues[type_dev]; i++) {
+		input_queue_cfg[base_dev_send + i].token_size =
+			sizeof(struct ipu6_fw_send_queue_token);
+		input_queue_cfg[base_dev_send + i].queue_size = max_devq_size;
+	}
+
+	for (i = 0; i < isys_fw_cfg->num_send_queues[type_msg]; i++) {
+		input_queue_cfg[base_msg_send + i].token_size =
+			sizeof(struct ipu6_fw_send_queue_token);
+		input_queue_cfg[base_msg_send + i].queue_size =
+			IPU6_ISYS_SIZE_SEND_QUEUE;
+	}
+
+	for (i = 0; i < isys_fw_cfg->num_recv_queues[type_proxy]; i++) {
+		output_queue_cfg[i].token_size =
+			sizeof(struct ipu6_fw_proxy_resp_queue_token);
+		output_queue_cfg[i].queue_size =
+			IPU6_ISYS_SIZE_PROXY_RECV_QUEUE;
+	}
+	/* There is no recv DEV queue */
+	for (i = 0; i < isys_fw_cfg->num_recv_queues[type_msg]; i++) {
+		output_queue_cfg[base_msg_recv + i].token_size =
+			sizeof(struct ipu6_fw_resp_queue_token);
+		output_queue_cfg[base_msg_recv + i].queue_size =
+			IPU6_ISYS_SIZE_RECV_QUEUE;
+	}
+
+	fwcom->dmem_addr = isys->pdata->ipdata->hw_variant.dmem_offset;
+	fwcom->specific_addr = isys_fw_cfg;
+	fwcom->specific_size = sizeof(*isys_fw_cfg);
+
+	return 0;
+}
+
+int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
+{
+	struct device *dev = &isys->adev->auxdev.dev;
+	int retry = IPU6_ISYS_OPEN_RETRY;
+	struct ipu6_fw_com_cfg fwcom = {
+		.cell_start = start_sp,
+		.cell_ready = query_sp,
+		.buttress_boot_offset = SYSCOM_BUTTRESS_FW_PARAMS_ISYS_OFFSET,
+	};
+	int ret;
+
+	ipu6_isys_fwcom_cfg_init(isys, &fwcom, num_streams);
+
+	isys->fwcom = ipu6_fw_com_prepare(&fwcom, isys->adev,
+					  isys->pdata->base);
+	if (!isys->fwcom) {
+		dev_err(dev, "isys fw com prepare failed\n");
+		return -EIO;
+	}
+
+	ret = ipu6_fw_com_open(isys->fwcom);
+	if (ret) {
+		dev_err(dev, "isys fw com open failed %d\n", ret);
+		return ret;
+	}
+
+	do {
+		usleep_range(400, 500);
+		if (ipu6_fw_com_ready(isys->fwcom))
+			break;
+		retry--;
+	} while (retry > 0);
+
+	if (!retry) {
+		dev_err(dev, "isys port open ready failed %d\n", ret);
+		ipu6_fw_isys_close(isys);
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+struct ipu6_fw_isys_resp_info_abi *
+ipu6_fw_isys_get_resp(void *context, unsigned int queue)
+{
+	return ipu6_recv_get_token(context, queue);
+}
+
+void ipu6_fw_isys_put_resp(void *context, unsigned int queue)
+{
+	ipu6_recv_put_token(context, queue);
+}
+
+void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
+				  struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
+{
+	unsigned int i;
+
+	dev_dbg(dev, "-----------------------------------------------------\n");
+	dev_dbg(dev, "IPU6_FW_ISYS_STREAM_CFG_DATA\n");
+
+	dev_dbg(dev, "compfmt = %d\n", cfg->vc);
+	dev_dbg(dev, "src = %d\n", cfg->src);
+	dev_dbg(dev, "vc = %d\n", cfg->vc);
+	dev_dbg(dev, "isl_use = %d\n", cfg->isl_use);
+	dev_dbg(dev, "sensor_type = %d\n", cfg->sensor_type);
+
+	dev_dbg(dev, "send_irq_sof_discarded = %d\n",
+		cfg->send_irq_sof_discarded);
+	dev_dbg(dev, "send_irq_eof_discarded = %d\n",
+		cfg->send_irq_eof_discarded);
+	dev_dbg(dev, "send_resp_sof_discarded = %d\n",
+		cfg->send_resp_sof_discarded);
+	dev_dbg(dev, "send_resp_eof_discarded = %d\n",
+		cfg->send_resp_eof_discarded);
+
+	dev_dbg(dev, "crop:\n");
+	dev_dbg(dev, "\t.left_top = [%d, %d]\n", cfg->crop.left_offset,
+		cfg->crop.top_offset);
+	dev_dbg(dev, "\t.right_bottom = [%d, %d]\n", cfg->crop.right_offset,
+		cfg->crop.bottom_offset);
+
+	dev_dbg(dev, "nof_input_pins = %d\n", cfg->nof_input_pins);
+	for (i = 0; i < cfg->nof_input_pins; i++) {
+		dev_dbg(dev, "input pin[%d]:\n", i);
+		dev_dbg(dev, "\t.dt = 0x%0x\n", cfg->input_pins[i].dt);
+		dev_dbg(dev, "\t.mipi_store_mode = %d\n",
+			cfg->input_pins[i].mipi_store_mode);
+		dev_dbg(dev, "\t.bits_per_pix = %d\n",
+			cfg->input_pins[i].bits_per_pix);
+		dev_dbg(dev, "\t.mapped_dt = 0x%0x\n",
+			cfg->input_pins[i].mapped_dt);
+		dev_dbg(dev, "\t.input_res = %dx%d\n",
+			cfg->input_pins[i].input_res.width,
+			cfg->input_pins[i].input_res.height);
+		dev_dbg(dev, "\t.mipi_decompression = %d\n",
+			cfg->input_pins[i].mipi_decompression);
+		dev_dbg(dev, "\t.capture_mode = %d\n",
+			cfg->input_pins[i].capture_mode);
+	}
+
+	dev_dbg(dev, "nof_output_pins = %d\n", cfg->nof_output_pins);
+	for (i = 0; i < cfg->nof_output_pins; i++) {
+		dev_dbg(dev, "output_pin[%d]:\n", i);
+		dev_dbg(dev, "\t.input_pin_id = %d\n",
+			cfg->output_pins[i].input_pin_id);
+		dev_dbg(dev, "\t.output_res = %dx%d\n",
+			cfg->output_pins[i].output_res.width,
+			cfg->output_pins[i].output_res.height);
+		dev_dbg(dev, "\t.stride = %d\n", cfg->output_pins[i].stride);
+		dev_dbg(dev, "\t.pt = %d\n", cfg->output_pins[i].pt);
+		dev_dbg(dev, "\t.payload_buf_size = %d\n",
+			cfg->output_pins[i].payload_buf_size);
+		dev_dbg(dev, "\t.ft = %d\n", cfg->output_pins[i].ft);
+		dev_dbg(dev, "\t.watermark_in_lines = %d\n",
+			cfg->output_pins[i].watermark_in_lines);
+		dev_dbg(dev, "\t.send_irq = %d\n",
+			cfg->output_pins[i].send_irq);
+		dev_dbg(dev, "\t.reserve_compression = %d\n",
+			cfg->output_pins[i].reserve_compression);
+		dev_dbg(dev, "\t.snoopable = %d\n",
+			cfg->output_pins[i].snoopable);
+		dev_dbg(dev, "\t.error_handling_enable = %d\n",
+			cfg->output_pins[i].error_handling_enable);
+		dev_dbg(dev, "\t.sensor_type = %d\n",
+			cfg->output_pins[i].sensor_type);
+	}
+	dev_dbg(dev, "-----------------------------------------------------\n");
+}
+
+void
+ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
+				 struct ipu6_fw_isys_frame_buff_set_abi *buf,
+				 unsigned int outputs)
+{
+	unsigned int i;
+
+	dev_dbg(dev, "-----------------------------------------------------\n");
+	dev_dbg(dev, "IPU6_FW_ISYS_FRAME_BUFF_SET\n");
+
+	for (i = 0; i < outputs; i++) {
+		dev_dbg(dev, "output_pin[%d]:\n", i);
+		dev_dbg(dev, "\t.out_buf_id = %llu\n",
+			buf->output_pins[i].out_buf_id);
+		dev_dbg(dev, "\t.addr = 0x%x\n", buf->output_pins[i].addr);
+		dev_dbg(dev, "\t.compress = %d\n",
+			buf->output_pins[i].compress);
+	}
+
+	dev_dbg(dev, "send_irq_sof = 0x%x\n", buf->send_irq_sof);
+	dev_dbg(dev, "send_irq_eof = 0x%x\n", buf->send_irq_eof);
+	dev_dbg(dev, "send_resp_sof = 0x%x\n", buf->send_resp_sof);
+	dev_dbg(dev, "send_resp_eof = 0x%x\n", buf->send_resp_eof);
+	dev_dbg(dev, "send_irq_capture_ack = 0x%x\n",
+		buf->send_irq_capture_ack);
+	dev_dbg(dev, "send_irq_capture_done = 0x%x\n",
+		buf->send_irq_capture_done);
+	dev_dbg(dev, "send_resp_capture_ack = 0x%x\n",
+		buf->send_resp_capture_ack);
+	dev_dbg(dev, "send_resp_capture_done = 0x%x\n",
+		buf->send_resp_capture_done);
+
+	dev_dbg(dev, "-----------------------------------------------------\n");
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
new file mode 100644
index 000000000000..3ed698c44976
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -0,0 +1,568 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2013--2024 Intel Corporation */
+
+#ifndef IPU6_FW_ISYS_H
+#define IPU6_FW_ISYS_H
+
+#include <linux/types.h>
+
+struct device;
+struct ipu6_isys;
+
+/* Max number of Input/Output Pins */
+#define IPU6_MAX_IPINS 4
+
+#define IPU6_MAX_OPINS ((IPU6_MAX_IPINS) + 1)
+
+#define IPU6_STREAM_ID_MAX 16
+#define IPU6_NONSECURE_STREAM_ID_MAX 12
+#define IPU6_DEV_SEND_QUEUE_SIZE (IPU6_STREAM_ID_MAX)
+#define IPU6_NOF_SRAM_BLOCKS_MAX (IPU6_STREAM_ID_MAX)
+#define IPU6_N_MAX_MSG_SEND_QUEUES (IPU6_STREAM_ID_MAX)
+#define IPU6SE_STREAM_ID_MAX 8
+#define IPU6SE_NONSECURE_STREAM_ID_MAX 4
+#define IPU6SE_DEV_SEND_QUEUE_SIZE (IPU6SE_STREAM_ID_MAX)
+#define IPU6SE_NOF_SRAM_BLOCKS_MAX (IPU6SE_STREAM_ID_MAX)
+#define IPU6SE_N_MAX_MSG_SEND_QUEUES (IPU6SE_STREAM_ID_MAX)
+
+/* Single return queue for all streams/commands type */
+#define IPU6_N_MAX_MSG_RECV_QUEUES 1
+/* Single device queue for high priority commands (bypass in-order queue) */
+#define IPU6_N_MAX_DEV_SEND_QUEUES 1
+/* Single dedicated send queue for proxy interface */
+#define IPU6_N_MAX_PROXY_SEND_QUEUES 1
+/* Single dedicated recv queue for proxy interface */
+#define IPU6_N_MAX_PROXY_RECV_QUEUES 1
+/* Send queues layout */
+#define IPU6_BASE_PROXY_SEND_QUEUES 0
+#define IPU6_BASE_DEV_SEND_QUEUES \
+	(IPU6_BASE_PROXY_SEND_QUEUES + IPU6_N_MAX_PROXY_SEND_QUEUES)
+#define IPU6_BASE_MSG_SEND_QUEUES \
+	(IPU6_BASE_DEV_SEND_QUEUES + IPU6_N_MAX_DEV_SEND_QUEUES)
+/* Recv queues layout */
+#define IPU6_BASE_PROXY_RECV_QUEUES 0
+#define IPU6_BASE_MSG_RECV_QUEUES \
+	(IPU6_BASE_PROXY_RECV_QUEUES + IPU6_N_MAX_PROXY_RECV_QUEUES)
+#define IPU6_N_MAX_RECV_QUEUES \
+	(IPU6_BASE_MSG_RECV_QUEUES + IPU6_N_MAX_MSG_RECV_QUEUES)
+
+#define IPU6_N_MAX_SEND_QUEUES \
+	(IPU6_BASE_MSG_SEND_QUEUES + IPU6_N_MAX_MSG_SEND_QUEUES)
+#define IPU6SE_N_MAX_SEND_QUEUES \
+	(IPU6_BASE_MSG_SEND_QUEUES + IPU6SE_N_MAX_MSG_SEND_QUEUES)
+
+/* Max number of planes for frame formats supported by the FW */
+#define IPU6_PIN_PLANES_MAX 4
+
+#define IPU6_FW_ISYS_SENSOR_TYPE_START 14
+#define IPU6_FW_ISYS_SENSOR_TYPE_END 19
+#define IPU6SE_FW_ISYS_SENSOR_TYPE_START 6
+#define IPU6SE_FW_ISYS_SENSOR_TYPE_END 11
+/*
+ * Device close takes some time from last ack message to actual stopping
+ * of the SP processor. As long as the SP processor runs we can't proceed with
+ * clean up of resources.
+ */
+#define IPU6_ISYS_OPEN_RETRY			2000
+#define IPU6_ISYS_CLOSE_RETRY			2000
+#define IPU6_FW_CALL_TIMEOUT_JIFFIES		msecs_to_jiffies(2000)
+
+enum ipu6_fw_isys_resp_type {
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE = 0,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK,
+	IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY,
+	IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK,
+	IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF,
+	IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE,
+	IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED,
+	IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED,
+	IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED,
+	IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED,
+	IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY,
+	N_IPU6_FW_ISYS_RESP_TYPE
+};
+
+enum ipu6_fw_isys_send_type {
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN = 0,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_START,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_STOP,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH,
+	IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE,
+	N_IPU6_FW_ISYS_SEND_TYPE
+};
+
+enum ipu6_fw_isys_queue_type {
+	IPU6_FW_ISYS_QUEUE_TYPE_PROXY = 0,
+	IPU6_FW_ISYS_QUEUE_TYPE_DEV,
+	IPU6_FW_ISYS_QUEUE_TYPE_MSG,
+	N_IPU6_FW_ISYS_QUEUE_TYPE
+};
+
+enum ipu6_fw_isys_stream_source {
+	IPU6_FW_ISYS_STREAM_SRC_PORT_0 = 0,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_1,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_2,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_3,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_4,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_5,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_6,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_7,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_8,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_9,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_10,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_11,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_12,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_13,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_14,
+	IPU6_FW_ISYS_STREAM_SRC_PORT_15,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_0,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_1,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_2,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_3,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_4,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_5,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_6,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_7,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_8,
+	IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_9,
+	N_IPU6_FW_ISYS_STREAM_SRC
+};
+
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 IPU6_FW_ISYS_STREAM_SRC_PORT_0
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT1 IPU6_FW_ISYS_STREAM_SRC_PORT_1
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT2 IPU6_FW_ISYS_STREAM_SRC_PORT_2
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT3 IPU6_FW_ISYS_STREAM_SRC_PORT_3
+
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_PORTA IPU6_FW_ISYS_STREAM_SRC_PORT_4
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_PORTB IPU6_FW_ISYS_STREAM_SRC_PORT_5
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_CPHY_PORT0 \
+	IPU6_FW_ISYS_STREAM_SRC_PORT_6
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_CPHY_PORT1 \
+	IPU6_FW_ISYS_STREAM_SRC_PORT_7
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_CPHY_PORT2 \
+	IPU6_FW_ISYS_STREAM_SRC_PORT_8
+#define IPU6_FW_ISYS_STREAM_SRC_CSI2_3PH_CPHY_PORT3 \
+	IPU6_FW_ISYS_STREAM_SRC_PORT_9
+
+#define IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_PORT0 IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_0
+#define IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_PORT1 IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_1
+
+/**
+ * enum ipu6_fw_isys_mipi_vc: MIPI csi2 spec
+ * supports up to 4 virtual per physical channel
+ */
+enum ipu6_fw_isys_mipi_vc {
+	IPU6_FW_ISYS_MIPI_VC_0 = 0,
+	IPU6_FW_ISYS_MIPI_VC_1,
+	IPU6_FW_ISYS_MIPI_VC_2,
+	IPU6_FW_ISYS_MIPI_VC_3,
+	N_IPU6_FW_ISYS_MIPI_VC
+};
+
+enum ipu6_fw_isys_frame_format_type {
+	IPU6_FW_ISYS_FRAME_FORMAT_NV11 = 0, /* 12 bit YUV 411, Y, UV plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_NV12,	/* 12 bit YUV 420, Y, UV plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_NV12_16, /* 16 bit YUV 420, Y, UV plane */
+	/* 12 bit YUV 420, Intel proprietary tiled format */
+	IPU6_FW_ISYS_FRAME_FORMAT_NV12_TILEY,
+
+	IPU6_FW_ISYS_FRAME_FORMAT_NV16,	/* 16 bit YUV 422, Y, UV plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_NV21,	/* 12 bit YUV 420, Y, VU plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_NV61,	/* 16 bit YUV 422, Y, VU plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_YV12,	/* 12 bit YUV 420, Y, V, U plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_YV16,	/* 16 bit YUV 422, Y, V, U plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV420, /* 12 bit YUV 420, Y, U, V plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV420_10, /* yuv420, 10 bits per subpixel */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV420_12, /* yuv420, 12 bits per subpixel */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV420_14, /* yuv420, 14 bits per subpixel */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV420_16, /* yuv420, 16 bits per subpixel */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV422, /* 16 bit YUV 422, Y, U, V plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV422_16, /* yuv422, 16 bits per subpixel */
+	IPU6_FW_ISYS_FRAME_FORMAT_UYVY,	/* 16 bit YUV 422, UYVY interleaved */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUYV,	/* 16 bit YUV 422, YUYV interleaved */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV444, /* 24 bit YUV 444, Y, U, V plane */
+	/* Internal format, 2 y lines followed by a uvinterleaved line */
+	IPU6_FW_ISYS_FRAME_FORMAT_YUV_LINE,
+	IPU6_FW_ISYS_FRAME_FORMAT_RAW8,	/* RAW8, 1 plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_RAW10, /* RAW10, 1 plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_RAW12, /* RAW12, 1 plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_RAW14, /* RAW14, 1 plane */
+	IPU6_FW_ISYS_FRAME_FORMAT_RAW16, /* RAW16, 1 plane */
+	/**
+	 * 16 bit RGB, 1 plane. Each 3 sub pixels are packed into one 16 bit
+	 * value, 5 bits for R, 6 bits for G and 5 bits for B.
+	 */
+	IPU6_FW_ISYS_FRAME_FORMAT_RGB565,
+	IPU6_FW_ISYS_FRAME_FORMAT_PLANAR_RGB888, /* 24 bit RGB, 3 planes */
+	IPU6_FW_ISYS_FRAME_FORMAT_RGBA888, /* 32 bit RGBA, 1 plane, A=Alpha */
+	IPU6_FW_ISYS_FRAME_FORMAT_QPLANE6, /* Internal, for advanced ISP */
+	IPU6_FW_ISYS_FRAME_FORMAT_BINARY_8, /* byte stream, used for jpeg. */
+	N_IPU6_FW_ISYS_FRAME_FORMAT
+};
+
+enum ipu6_fw_isys_pin_type {
+	/* captured as MIPI packets */
+	IPU6_FW_ISYS_PIN_TYPE_MIPI = 0,
+	/* captured through the SoC path */
+	IPU6_FW_ISYS_PIN_TYPE_RAW_SOC = 3,
+};
+
+/**
+ * enum ipu6_fw_isys_mipi_store_mode. Describes if long MIPI packets reach
+ * MIPI SRAM with the long packet header or
+ * if not, then only option is to capture it with pin type MIPI.
+ */
+enum ipu6_fw_isys_mipi_store_mode {
+	IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL = 0,
+	IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER,
+	N_IPU6_FW_ISYS_MIPI_STORE_MODE
+};
+
+enum ipu6_fw_isys_capture_mode {
+	IPU6_FW_ISYS_CAPTURE_MODE_REGULAR = 0,
+	IPU6_FW_ISYS_CAPTURE_MODE_BURST,
+	N_IPU6_FW_ISYS_CAPTURE_MODE,
+};
+
+enum ipu6_fw_isys_sensor_mode {
+	IPU6_FW_ISYS_SENSOR_MODE_NORMAL = 0,
+	IPU6_FW_ISYS_SENSOR_MODE_TOBII,
+	N_IPU6_FW_ISYS_SENSOR_MODE,
+};
+
+enum ipu6_fw_isys_error {
+	IPU6_FW_ISYS_ERROR_NONE = 0,
+	IPU6_FW_ISYS_ERROR_FW_INTERNAL_CONSISTENCY,
+	IPU6_FW_ISYS_ERROR_HW_CONSISTENCY,
+	IPU6_FW_ISYS_ERROR_DRIVER_INVALID_COMMAND_SEQUENCE,
+	IPU6_FW_ISYS_ERROR_DRIVER_INVALID_DEVICE_CONFIGURATION,
+	IPU6_FW_ISYS_ERROR_DRIVER_INVALID_STREAM_CONFIGURATION,
+	IPU6_FW_ISYS_ERROR_DRIVER_INVALID_FRAME_CONFIGURATION,
+	IPU6_FW_ISYS_ERROR_INSUFFICIENT_RESOURCES,
+	IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO,
+	IPU6_FW_ISYS_ERROR_HW_REPORTED_SIG2CIO,
+	IPU6_FW_ISYS_ERROR_SENSOR_FW_SYNC,
+	IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION,
+	IPU6_FW_ISYS_ERROR_RESPONSE_QUEUE_FULL,
+	N_IPU6_FW_ISYS_ERROR
+};
+
+enum ipu6_fw_proxy_error {
+	IPU6_FW_PROXY_ERROR_NONE = 0,
+	IPU6_FW_PROXY_ERROR_INVALID_WRITE_REGION,
+	IPU6_FW_PROXY_ERROR_INVALID_WRITE_OFFSET,
+	N_IPU6_FW_PROXY_ERROR
+};
+
+/* firmware ABI structure below are aligned in firmware, no need pack */
+struct ipu6_fw_isys_buffer_partition_abi {
+	u32 num_gda_pages[IPU6_STREAM_ID_MAX];
+};
+
+struct ipu6_fw_isys_fw_config {
+	struct ipu6_fw_isys_buffer_partition_abi buffer_partition;
+	u32 num_send_queues[N_IPU6_FW_ISYS_QUEUE_TYPE];
+	u32 num_recv_queues[N_IPU6_FW_ISYS_QUEUE_TYPE];
+};
+
+/**
+ * struct ipu6_fw_isys_resolution_abi: Generic resolution structure.
+ */
+struct ipu6_fw_isys_resolution_abi {
+	u32 width;
+	u32 height;
+};
+
+/**
+ * struct ipu6_fw_isys_output_pin_payload_abi
+ * @out_buf_id: Points to output pin buffer - buffer identifier
+ * @addr: Points to output pin buffer - CSS Virtual Address
+ * @compress: Request frame compression (1), or  not (0)
+ */
+struct ipu6_fw_isys_output_pin_payload_abi {
+	u64 out_buf_id;
+	u32 addr;
+	u32 compress;
+};
+
+/**
+ * struct ipu6_fw_isys_output_pin_info_abi
+ * @output_res: output pin resolution
+ * @stride: output stride in Bytes (not valid for statistics)
+ * @watermark_in_lines: pin watermark level in lines
+ * @payload_buf_size: minimum size in Bytes of all buffers that will be
+ *			supplied for capture on this pin
+ * @send_irq: assert if pin event should trigger irq
+ * @pt: pin type -real format "enum ipu6_fw_isys_pin_type"
+ * @ft: frame format type -real format "enum ipu6_fw_isys_frame_format_type"
+ * @input_pin_id: related input pin id
+ * @reserve_compression: reserve compression resources for pin
+ */
+struct ipu6_fw_isys_output_pin_info_abi {
+	struct ipu6_fw_isys_resolution_abi output_res;
+	u32 stride;
+	u32 watermark_in_lines;
+	u32 payload_buf_size;
+	u32 ts_offsets[IPU6_PIN_PLANES_MAX];
+	u32 s2m_pixel_soc_pixel_remapping;
+	u32 csi_be_soc_pixel_remapping;
+	u8 send_irq;
+	u8 input_pin_id;
+	u8 pt;
+	u8 ft;
+	u8 reserved;
+	u8 reserve_compression;
+	u8 snoopable;
+	u8 error_handling_enable;
+	u32 sensor_type;
+};
+
+/**
+ * struct ipu6_fw_isys_input_pin_info_abi
+ * @input_res: input resolution
+ * @dt: mipi data type ((enum ipu6_fw_isys_mipi_data_type)
+ * @mipi_store_mode: defines if legacy long packet header will be stored or
+ *		     discarded if discarded, output pin type for this
+ *		     input pin can only be MIPI
+ *		     (enum ipu6_fw_isys_mipi_store_mode)
+ * @bits_per_pix: native bits per pixel
+ * @mapped_dt: actual data type from sensor
+ * @mipi_decompression: defines which compression will be in mipi backend
+ * @crop_first_and_last_lines    Control whether to crop the
+ *                              first and last line of the
+ *                              input image. Crop done by HW
+ *                              device.
+ * @capture_mode: mode of capture, regular or burst, default value is regular
+ */
+struct ipu6_fw_isys_input_pin_info_abi {
+	struct ipu6_fw_isys_resolution_abi input_res;
+	u8 dt;
+	u8 mipi_store_mode;
+	u8 bits_per_pix;
+	u8 mapped_dt;
+	u8 mipi_decompression;
+	u8 crop_first_and_last_lines;
+	u8 capture_mode;
+	u8 reserved;
+};
+
+/**
+ * struct ipu6_fw_isys_cropping_abi - cropping coordinates
+ */
+struct ipu6_fw_isys_cropping_abi {
+	s32 top_offset;
+	s32 left_offset;
+	s32 bottom_offset;
+	s32 right_offset;
+};
+
+/**
+ * struct ipu6_fw_isys_stream_cfg_data_abi
+ * ISYS stream configuration data structure
+ * @crop: for extended use and is not used in FW currently
+ * @input_pins: input pin descriptors
+ * @output_pins: output pin descriptors
+ * @compfmt: de-compression setting for User Defined Data
+ * @nof_input_pins: number of input pins
+ * @nof_output_pins: number of output pins
+ * @send_irq_sof_discarded: send irq on discarded frame sof response
+ *		- if '1' it will override the send_resp_sof_discarded
+ *		  and send the response
+ *		- if '0' the send_resp_sof_discarded will determine
+ *		  whether to send the response
+ * @send_irq_eof_discarded: send irq on discarded frame eof response
+ *		- if '1' it will override the send_resp_eof_discarded
+ *		  and send the response
+ *		- if '0' the send_resp_eof_discarded will determine
+ *		  whether to send the response
+ * @send_resp_sof_discarded: send response for discarded frame sof detected,
+ *			     used only when send_irq_sof_discarded is '0'
+ * @send_resp_eof_discarded: send response for discarded frame eof detected,
+ *			     used only when send_irq_eof_discarded is '0'
+ * @src: Stream source index e.g. MIPI_generator_0, CSI2-rx_1
+ * @vc: MIPI Virtual Channel (up to 4 virtual per physical channel)
+ * @isl_use: indicates whether stream requires ISL and how
+ * @sensor_type: type of connected sensor, tobii or others, default is 0
+ */
+struct ipu6_fw_isys_stream_cfg_data_abi {
+	struct ipu6_fw_isys_cropping_abi crop;
+	struct ipu6_fw_isys_input_pin_info_abi input_pins[IPU6_MAX_IPINS];
+	struct ipu6_fw_isys_output_pin_info_abi output_pins[IPU6_MAX_OPINS];
+	u32 compfmt;
+	u8 nof_input_pins;
+	u8 nof_output_pins;
+	u8 send_irq_sof_discarded;
+	u8 send_irq_eof_discarded;
+	u8 send_resp_sof_discarded;
+	u8 send_resp_eof_discarded;
+	u8 src;
+	u8 vc;
+	u8 isl_use;
+	u8 sensor_type;
+	u8 reserved;
+	u8 reserved2;
+};
+
+/**
+ * struct ipu6_fw_isys_frame_buff_set - frame buffer set
+ * @output_pins: output pin addresses
+ * @send_irq_sof: send irq on frame sof response
+ *		- if '1' it will override the send_resp_sof and
+ *		  send the response
+ *		- if '0' the send_resp_sof will determine whether to
+ *		  send the response
+ * @send_irq_eof: send irq on frame eof response
+ *		- if '1' it will override the send_resp_eof and
+ *		  send the response
+ *		- if '0' the send_resp_eof will determine whether to
+ *		  send the response
+ * @send_resp_sof: send response for frame sof detected,
+ *		   used only when send_irq_sof is '0'
+ * @send_resp_eof: send response for frame eof detected,
+ *		   used only when send_irq_eof is '0'
+ * @send_resp_capture_ack: send response for capture ack event
+ * @send_resp_capture_done: send response for capture done event
+ */
+struct ipu6_fw_isys_frame_buff_set_abi {
+	struct ipu6_fw_isys_output_pin_payload_abi output_pins[IPU6_MAX_OPINS];
+	u8 send_irq_sof;
+	u8 send_irq_eof;
+	u8 send_irq_capture_ack;
+	u8 send_irq_capture_done;
+	u8 send_resp_sof;
+	u8 send_resp_eof;
+	u8 send_resp_capture_ack;
+	u8 send_resp_capture_done;
+	u8 reserved[8];
+};
+
+/**
+ * struct ipu6_fw_isys_error_info_abi
+ * @error: error code if something went wrong
+ * @error_details: depending on error code, it may contain additional error info
+ */
+struct ipu6_fw_isys_error_info_abi {
+	u32 error;
+	u32 error_details;
+};
+
+/**
+ * struct ipu6_fw_isys_resp_info_comm
+ * @pin: this var is only valid for pin event related responses,
+ *     contains pin addresses
+ * @error_info: error information from the FW
+ * @timestamp: Time information for event if available
+ * @stream_handle: stream id the response corresponds to
+ * @type: response type (enum ipu6_fw_isys_resp_type)
+ * @pin_id: pin id that the pin payload corresponds to
+ */
+struct ipu6_fw_isys_resp_info_abi {
+	u64 buf_id;
+	struct ipu6_fw_isys_output_pin_payload_abi pin;
+	struct ipu6_fw_isys_error_info_abi error_info;
+	u32 timestamp[2];
+	u8 stream_handle;
+	u8 type;
+	u8 pin_id;
+	u8 reserved;
+	u32 reserved2;
+};
+
+/**
+ * struct ipu6_fw_isys_proxy_error_info_comm
+ * @proxy_error: error code if something went wrong
+ * @proxy_error_details: depending on error code, it may contain additional
+ *			error info
+ */
+struct ipu6_fw_isys_proxy_error_info_abi {
+	u32 error;
+	u32 error_details;
+};
+
+struct ipu6_fw_isys_proxy_resp_info_abi {
+	u32 request_id;
+	struct ipu6_fw_isys_proxy_error_info_abi error_info;
+};
+
+/**
+ * struct ipu6_fw_proxy_write_queue_token
+ * @request_id: update id for the specific proxy write request
+ * @region_index: Region id for the proxy write request
+ * @offset: Offset of the write request according to the base address
+ *	    of the region
+ * @value: Value that is requested to be written with the proxy write request
+ */
+struct ipu6_fw_proxy_write_queue_token {
+	u32 request_id;
+	u32 region_index;
+	u32 offset;
+	u32 value;
+};
+
+/**
+ * struct ipu6_fw_resp_queue_token
+ */
+struct ipu6_fw_resp_queue_token {
+	struct ipu6_fw_isys_resp_info_abi resp_info;
+};
+
+/**
+ * struct ipu6_fw_send_queue_token
+ */
+struct ipu6_fw_send_queue_token {
+	u64 buf_handle;
+	u32 payload;
+	u16 send_type;
+	u16 stream_id;
+};
+
+/**
+ * struct ipu6_fw_proxy_resp_queue_token
+ */
+struct ipu6_fw_proxy_resp_queue_token {
+	struct ipu6_fw_isys_proxy_resp_info_abi proxy_resp_info;
+};
+
+/**
+ * struct ipu6_fw_proxy_send_queue_token
+ */
+struct ipu6_fw_proxy_send_queue_token {
+	u32 request_id;
+	u32 region_index;
+	u32 offset;
+	u32 value;
+};
+
+void
+ipu6_fw_isys_dump_stream_cfg(struct device *dev,
+			     struct ipu6_fw_isys_stream_cfg_data_abi *cfg);
+void
+ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
+				 struct ipu6_fw_isys_frame_buff_set_abi *buf,
+				 unsigned int outputs);
+int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams);
+int ipu6_fw_isys_close(struct ipu6_isys *isys);
+int ipu6_fw_isys_simple_cmd(struct ipu6_isys *isys,
+			    const unsigned int stream_handle, u16 send_type);
+int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
+			     const unsigned int stream_handle,
+			     void *cpu_mapped_buf, dma_addr_t dma_mapped_buf,
+			     size_t size, u16 send_type);
+int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
+				  unsigned int req_id,
+				  unsigned int index,
+				  unsigned int offset, u32 value);
+void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
+struct ipu6_fw_isys_resp_info_abi *
+ipu6_fw_isys_get_resp(void *context, unsigned int queue);
+void ipu6_fw_isys_put_resp(void *context, unsigned int queue);
+#endif
-- 
2.39.2


