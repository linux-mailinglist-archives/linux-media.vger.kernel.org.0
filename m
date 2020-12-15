Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F161D2DB354
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 19:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbgLOSJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 13:09:46 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:44072 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbgLOSJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 13:09:35 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Dec 2020 10:08:54 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Dec 2020 10:08:52 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Dec 2020 23:38:39 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 10A7421427; Tue, 15 Dec 2020 23:38:37 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v5] venus: core: add support to dump FW region
Date:   Tue, 15 Dec 2020 23:38:36 +0530
Message-Id: <1608055716-14796-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to dump video FW region during FW crash
using devcoredump helpers.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Major changes since v1:
- update the name of function (Stephen)
- store start address and size in resource structure during
  probe and reuse while dumping (Stephen, Stanimir)
---
 drivers/media/platform/qcom/venus/core.c     | 30 ++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293f..1cc57ee 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -7,6 +7,7 @@
 #include <linux/interconnect.h>
 #include <linux/ioctl.h>
 #include <linux/delay.h>
+#include <linux/devcoredump.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -22,6 +23,33 @@
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
@@ -67,6 +95,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 
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

