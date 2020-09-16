Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F9E26BFD0
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 10:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgIPIuY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 04:50:24 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46257 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPIt6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 04:49:58 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 01:49:58 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 01:49:55 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 14:19:43 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B030121D3B; Wed, 16 Sep 2020 14:19:42 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v4 3/3] venus: core: add shutdown callback for venus
Date:   Wed, 16 Sep 2020 14:19:34 +0530
Message-Id: <1600246174-31802-4-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600246174-31802-1-git-send-email-mansur@codeaurora.org>
References: <1600246174-31802-1-git-send-email-mansur@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the SMMU translation is disabled in the
arm-smmu shutdown callback during reboot, if
any subsystem are still alive then IOVAs they
are using will become PAs on bus, which may
lead to crash.

So implemented shutdown callback, which detach iommu maps.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
Changes in V4:
- In venus_core_shutdown(), instead of venurs_remove() calling 
  venus_shutdown() and venus_firmware_deinit().
- With venus_remove() call during shutdown we are facing few issue 
  like ui freez this is because in venus_remove, hfi_core_deinit()
  will wait until all core instances count become zero dudring 
  wait_var_event().

Changes in V3:
- Fix build errors

 drivers/media/platform/qcom/venus/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6103aaf..65b71ac 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -345,6 +345,14 @@ static int venus_remove(struct platform_device *pdev)
 	return ret;
 }
 
+static void venus_core_shutdown(struct platform_device *pdev)
+{
+	struct venus_core *core = platform_get_drvdata(pdev);
+
+	venus_shutdown(core);
+	venus_firmware_deinit(core);
+}
+
 static __maybe_unused int venus_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -602,6 +610,7 @@ static struct platform_driver qcom_venus_driver = {
 		.of_match_table = venus_dt_match,
 		.pm = &venus_pm_ops,
 	},
+	.shutdown = venus_core_shutdown,
 };
 module_platform_driver(qcom_venus_driver);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

