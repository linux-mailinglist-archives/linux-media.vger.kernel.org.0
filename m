Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B05123D5D8
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 05:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbgHFDpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 23:45:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48070 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgHFDpW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Aug 2020 23:45:22 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Aug 2020 20:45:22 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Aug 2020 20:45:20 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 06 Aug 2020 09:15:08 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 090D921C5C; Thu,  6 Aug 2020 09:15:06 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH V2] venus: core: add shutdown callback for venus
Date:   Thu,  6 Aug 2020 09:15:01 +0530
Message-Id: <1596685501-4392-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the SMMU translation is disabled in the
arm-smmu shutdown callback during reboot, if
any subsystem are still alive then IOVAs they
are using will become PAs on bus, which may
lead to crash.

Below are the consumers of smmu from venus
arm-smmu: consumer: aa00000.video-codec supplier=15000000.iommu
arm-smmu: consumer: video-firmware.0 supplier=15000000.iommu

So implemented shutdown callback, which detach iommu maps.

Change-Id: I0f0f331056e0b84b92f1d86f66618d4b1caaa24a
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c653..92aac06 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -341,6 +341,16 @@ static int venus_remove(struct platform_device *pdev)
 	return ret;
 }
 
+static void venus_core_shutdown(struct platform_device *pdev)
+{
+	struct venus_core *core = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = venus_remove(pdev);
+	if(ret)
+		dev_warn(core->dev, "shutdown failed \n", ret);
+}
+
 static __maybe_unused int venus_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -592,6 +602,7 @@ static struct platform_driver qcom_venus_driver = {
 		.of_match_table = venus_dt_match,
 		.pm = &venus_pm_ops,
 	},
+	.shutdown = venus_core_shutdown,
 };
 module_platform_driver(qcom_venus_driver);
 
-- 
2.7.4

