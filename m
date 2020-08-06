Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0870323E01F
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 20:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgHFSHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 14:07:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31669 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgHFSFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 14:05:51 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 06:17:52 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 06:17:50 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 Aug 2020 18:47:45 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 288A921C62; Thu,  6 Aug 2020 18:47:44 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH 3/3] venus: handle use after free for iommu_map/iommu_unmap
Date:   Thu,  6 Aug 2020 18:47:35 +0530
Message-Id: <1596719855-1725-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596719855-1725-1-git-send-email-mansur@codeaurora.org>
References: <1596719855-1725-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In concurrency usecase and reboot scenario we are trying
to map fw.iommu_domain which is already unmapped during
shutdown. This is causing NULL pointer dereference crash.

This case is handled by necesassary check before unmappin.

Call trace:
 __iommu_map+0x4c/0x348
 iommu_map+0x5c/0x70
 venus_boot+0x184/0x230 [venus_core]
 venus_sys_error_handler+0xa0/0x14c [venus_core]
 process_one_work+0x210/0x3d0
 worker_thread+0x248/0x3f4
 kthread+0x11c/0x12c
 ret_from_fork+0x10/0x18

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 8801a6a..d8cfa16 100644
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

