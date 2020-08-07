Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F7923E740
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 08:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgHGGZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 02:25:04 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45239 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgHGGZE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 02:25:04 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 23:25:04 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 23:25:01 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Aug 2020 11:54:56 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id DAEFA21C70; Fri,  7 Aug 2020 11:54:55 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND  3/3] venus: handle use after free for iommu_map/iommu_unmap
Date:   Fri,  7 Aug 2020 11:54:38 +0530
Message-Id: <1596781478-12216-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In concurrency usecase and reboot scenario we are trying
to map fw.iommu_domain which is already unmapped during
shutdown. This is causing NULL pointer dereference crash.

This case is handled by adding necessary checks.

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

