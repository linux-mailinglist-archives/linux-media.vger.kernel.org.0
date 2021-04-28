Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA536DA7A
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240830AbhD1O4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:36784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240350AbhD1Oxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 751FC61883;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=8E/41fS9i4G6Idc8E3ODBm45B0Q7is3E1XHHj0lw4IM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b8OxqQi8Gg8ywRDCZQ5PazgM0+mAHb/Rk1NXUFai6+AYyGQieVVSGyLmmTsMjh1ML
         4+DurHLxwdvdDj6ohGKaZAd5Bi/zjJ5jD172KNQoCY3Mx1muo+2uZQGeIoAQCDTHu4
         8KaJGpNPBnCoUeOHwkG6RXdowy58xIwq/nQpIthEKKXB6PxZxgImPVMAWRSKQ3zwVF
         uQgEdNhJxw9dU0Bp0ZJyVAzfj5fR3RMFJlXRntoPIjqxEZ0r1SOT+9BfMpyjC63ZR8
         7dwR7Q7JJHJ4nKDaGvfvrjfjLHue3yjigk62gF1o7YuAZX5MzfF6VkQsepHxlwCNOI
         g6UBYWksn1u+Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsm-G8; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 66/79] media: venus: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:27 +0200
Message-Id: <1daefd9339fd957a0199e0fe18033014945239a1.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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
index c80c27c87ccc..aa359f8e82c5 100644
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
 		return;
-	}
 
 	hfi_core_deinit(core, true);
 
@@ -110,11 +108,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	hfi_reinit(core);
 
-	ret = pm_runtime_get_sync(core->dev);
-	if (WARN_ON(ret < 0)) {
-		pm_runtime_put_noidle(core->dev);
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (WARN_ON(ret < 0))
 		return;
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

