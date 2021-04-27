Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6B936C2D3
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235921AbhD0KQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235644AbhD0KO4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7270461938;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=yFrbiuMzKmSO2EB59CqfXqOC55Rsmsoj/bKyqfWPoH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M6FF5nC+bkkrAbystgc6xb3f1/hUtUmxxHMXYOfIJJVgBktpkIRnnedcMu4/kPpGE
         f88qodmBkmiDfCCTjFK+Bv42nGV3tbXucCfSS9aSnDjyJVY/r4gTlU0gzvxFPYK702
         IKtIkGyJ9CFM8VYiJt6VXNhGdPbwm+SHCzloEO+SgyIuxPNxP5U6swIfO3jvtmbylt
         jnCiWQDoQ+ENNIp+PpWap4i126F549gc0Y6WA2zlPZ58Vnp/ci6Pu2diU6jp4m2bN4
         U4FKkUMcUwvVTwrbXP3KpiWnlZ5iZZS/JwF77v1gaO4xt6+heMOm9hlfGt5JC0JwCJ
         aap35BmXi0Xlg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7m-Le; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 66/79] media: venus: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:33 +0200
Message-Id: <c5742759046a9c3148cc4cc61c6d1dce9556807f.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/core.c      | 30 +++++++++----------
 .../media/platform/qcom/venus/pm_helpers.c    | 10 +++----
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index fe63b9ab5b20..52760f045e1c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -84,11 +84,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 			container_of(work, struct venus_core, work.work);
 	int ret = 0;
 
-	ret = pm_runtime_get_sync(core->dev);
-	if (WARN_ON(ret < 0)) {
-		pm_runtime_put_noidle(core->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (WARN_ON(ret < 0))
 		return ret;
-	}
 
 	hfi_core_deinit(core, true);
 
@@ -110,11 +108,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	hfi_reinit(core);
 
-	ret = pm_runtime_get_sync(core->dev);
-	if (WARN_ON(ret < 0)) {
-		pm_runtime_put_noidle(core->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (WARN_ON(ret < 0))
 		return ret;
-	}
 
 	ret = venus_boot(core);
 	ret |= hfi_core_resume(core, true);
@@ -313,21 +309,21 @@ static int venus_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		goto err_runtime_disable;
 
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_pm;
 
 	ret = venus_firmware_init(core);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_pm;
 
 	ret = venus_boot(core);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_pm;
 
 	ret = hfi_core_resume(core, true);
 	if (ret)
@@ -359,8 +355,9 @@ static int venus_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_venus_shutdown:
 	venus_shutdown(core);
-err_runtime_disable:
+err_pm:
 	pm_runtime_put_noidle(dev);
+err_runtime_disable:
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
 	hfi_destroy(core);
@@ -379,7 +376,7 @@ static int venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
 
 	ret = hfi_core_deinit(core, true);
@@ -390,7 +387,8 @@ static int venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
-	pm_runtime_put_sync(dev);
+	if (ret >= 0)
+		pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
 	if (pm_ops->core_put)
@@ -411,7 +409,7 @@ static void venus_core_shutdown(struct platform_device *pdev)
 {
 	struct venus_core *core = platform_get_drvdata(pdev);
 
-	pm_runtime_get_sync(core->dev);
+	pm_runtime_resume_and_get(core->dev);
 	venus_shutdown(core);
 	venus_firmware_deinit(core);
 	pm_runtime_put_sync(core->dev);
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index c7e1ebec47ee..9e32ec866af7 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -486,7 +486,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	int ret;
 
 	if (coreid_mask & VIDC_CORE_ID_1) {
-		ret = pm_runtime_get_sync(core->pmdomains[1]);
+		ret = pm_runtime_resume_and_get(core->pmdomains[1]);
 		if (ret < 0)
 			return ret;
 
@@ -504,7 +504,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	}
 
 	if (coreid_mask & VIDC_CORE_ID_2) {
-		ret = pm_runtime_get_sync(core->pmdomains[2]);
+		ret = pm_runtime_resume_and_get(core->pmdomains[2]);
 		if (ret < 0)
 			return ret;
 
@@ -990,11 +990,9 @@ static int core_power_v4(struct venus_core *core, int on)
 
 	if (on == POWER_ON) {
 		if (pmctrl) {
-			ret = pm_runtime_get_sync(pmctrl);
-			if (ret < 0) {
-				pm_runtime_put_noidle(pmctrl);
+			ret = pm_runtime_resume_and_get(pmctrl);
+			if (ret < 0)
 				return ret;
-			}
 		}
 
 		ret = core_resets_reset(core);
-- 
2.30.2

