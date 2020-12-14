Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468262D9882
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 14:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407571AbgLNNFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 08:05:04 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:53731 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404621AbgLNNFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 08:05:04 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Dec 2020 05:04:23 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 14 Dec 2020 05:04:21 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Dec 2020 18:34:07 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 99FA4212FF; Mon, 14 Dec 2020 18:34:06 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4] venus: core: add support to dump FW region
Date:   Mon, 14 Dec 2020 18:33:51 +0530
Message-Id: <1607951031-12980-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to dump video FW region during FW crash
using devcoredump helpers.

Major changes since v1:
- update the name of function (Stephen)
- store start address and size in resource structure during
  probe and reuse while dumping (Stephen, Stanimir)

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/media/platform/qcom/venus/core.c     | 31 ++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293f..2ddbd36 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -7,8 +7,10 @@
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
 #include <linux/delay.h>
+#include <linux/devcoredump.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -22,6 +24,33 @@
 #include "firmware.h"
 #include "pm_helpers.h"
 
+static void venus_coredump(struct venus_core *core)
+{
+	struct device *dev;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *mem_va;
+	void *data;
+
+	dev = core->dev;
+	mem_phys = core->fw.mem_phys;
+	mem_size = core->fw.mem_size;
+
+	mem_va = memremap(mem_phys, mem_size, MEMREMAP_WC);
+	if (!mem_va)
+		return;
+
+	data = vmalloc(mem_size);
+	if (!data) {
+		memunmap(mem_va);
+		return;
+	}
+
+	memcpy(data, mem_va, mem_size);
+	memunmap(mem_va);
+	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
+}
+
 static void venus_event_notify(struct venus_core *core, u32 event)
 {
 	struct venus_inst *inst;
@@ -67,6 +96,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	venus_shutdown(core);
 
+	venus_coredump(core);
+
 	pm_runtime_put_sync(core->dev);
 
 	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3a477fc..b37de95 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -178,6 +178,8 @@ struct venus_core {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
 		size_t mapped_mem_size;
+		phys_addr_t mem_phys;
+		size_t mem_size;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index d03e2dd..89defc2 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -201,6 +201,9 @@ int venus_boot(struct venus_core *core)
 		return -EINVAL;
 	}
 
+	core->fw.mem_size = mem_size;
+	core->fw.mem_phys = mem_phys;
+
 	if (core->use_tz)
 		ret = qcom_scm_pas_auth_and_reset(VENUS_PAS_ID);
 	else
-- 
2.7.4

