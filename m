Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E7D2CD4AF
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgLCLiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:38:10 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:9671 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgLCLiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:38:10 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 Dec 2020 03:37:29 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Dec 2020 03:37:27 -0800
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Dec 2020 17:07:14 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 9B4C51FE2D; Thu,  3 Dec 2020 17:07:13 +0530 (IST)
From:   dikshita@codeaurora.org
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RESEND v2] venus: core: add support to dump FW region
Date:   Thu,  3 Dec 2020 17:06:54 +0530
Message-Id: <1606995414-4565-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Add support to dump video FW region during FW crash
using devcoredump helpers.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c     | 30 ++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5102403..dd8d35a 100644
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
@@ -22,6 +24,32 @@
 #include "firmware.h"
 #include "pm_helpers.h"
 
+static void subsystem_dump(struct venus_core *core)
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
+	if (!data)
+		goto err_unmap;
+
+	memcpy(data, mem_va, mem_size);
+	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
+err_unmap:
+	memunmap(mem_va);
+}
+
 static void venus_event_notify(struct venus_core *core, u32 event)
 {
 	struct venus_inst *inst;
@@ -67,6 +95,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	venus_shutdown(core);
 
+	subsystem_dump(core);
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

