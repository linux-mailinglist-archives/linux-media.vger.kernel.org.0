Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5F826464C
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730869AbgIJMqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 08:46:45 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45050 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730684AbgIJMo7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 08:44:59 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 Sep 2020 05:44:39 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Sep 2020 05:44:37 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Sep 2020 18:14:26 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 4B51221D23; Thu, 10 Sep 2020 18:14:25 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 3/3] venus: handle use after free for iommu_map/iommu_unmap
Date:   Thu, 10 Sep 2020 18:14:16 +0530
Message-Id: <1599741856-16239-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In concurrency usecase and reboot scenario we are seeing muliple
crashes related to iommu_map/iommu_unamp of core->fw.iommu_domain.

In one case we are seeing "Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000008" crash, this is 
because of core->fw.iommu_domain in venus_firmware_deinit() and 
trying to map in venus_boot() during venus_sys_error_handler()

Call trace:
 __iommu_map+0x4c/0x348
 iommu_map+0x5c/0x70
 venus_boot+0x184/0x230 [venus_core]
 venus_sys_error_handler+0xa0/0x14c [venus_core]
 process_one_work+0x210/0x3d0
 worker_thread+0x248/0x3f4
 kthread+0x11c/0x12c
 ret_from_fork+0x10/0x18

In second case we are seeing "Unable to handle kernel paging request
at virtual address 006b6b6b6b6b6b9b" crash, this is because of
unmappin iommu domain which is already unmapped.

Call trace:
 venus_remove+0xf8/0x108 [venus_core]
 venus_core_shutdown+0x1c/0x34 [venus_core]
 platform_drv_shutdown+0x28/0x34
 device_shutdown+0x154/0x1fc
 kernel_restart_prepare+0x40/0x4c
 kernel_restart+0x1c/0x64
 __arm64_sys_reboot+0x190/0x238
 el0_svc_common+0xa4/0x154
 el0_svc_compat_handler+0x2c/0x38
 el0_svc_compat+0x8/0x10


Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in V2:
- Addressed review comments by stan
- Elaborated commit message

 drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 8801a6a..c427e88 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -171,9 +171,14 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 
 	iommu = core->fw.iommu_domain;
 
-	unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
-	if (unmapped != mapped)
-		dev_err(dev, "failed to unmap firmware\n");
+	if (core->fw.mapped_mem_size && iommu) {
+		unmapped = iommu_unmap(iommu, VENUS_FW_START_ADDR, mapped);
+
+		if (unmapped != mapped)
+			dev_err(dev, "failed to unmap firmware\n");
+		else
+			core->fw.mapped_mem_size = 0;
+	}
 
 	return 0;
 }
@@ -288,7 +293,11 @@ void venus_firmware_deinit(struct venus_core *core)
 	iommu = core->fw.iommu_domain;
 
 	iommu_detach_device(iommu, core->fw.dev);
-	iommu_domain_free(iommu);
+
+	if (core->fw.iommu_domain) {
+		iommu_domain_free(iommu);
+		core->fw.iommu_domain = NULL;
+	}
 
 	platform_device_unregister(to_platform_device(core->fw.dev));
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

