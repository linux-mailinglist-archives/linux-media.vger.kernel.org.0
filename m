Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C8F2D0A8F
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 07:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgLGGOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 01:14:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38827 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 01:14:32 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 06 Dec 2020 22:13:51 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Dec 2020 22:13:49 -0800
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Dec 2020 11:43:35 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B4BC2210BA; Mon,  7 Dec 2020 11:43:34 +0530 (IST)
From:   dikshita@codeaurora.org
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] venus: core: add support to dump FW region
Date:   Mon,  7 Dec 2020 11:43:30 +0530
Message-Id: <1607321610-25052-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Add support to dump video FW region during FW crash
using devcoredump helpers.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c     | 31 ++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5102403..f23923d 100644
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
+	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
+	memunmap(mem_va);
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
index 842a294..8122f23 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -171,6 +171,8 @@ struct venus_core {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;
 		size_t mapped_mem_size;
+		phys_addr_t mem_phys;
+		size_t mem_size;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 9a9c097..f3d91d23 100644
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
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

