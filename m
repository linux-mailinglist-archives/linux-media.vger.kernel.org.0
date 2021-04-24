Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6830F369F73
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242459AbhDXGrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233451AbhDXGqS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1B69616EC;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=jhFOuNkS8GXbkVzxvUoQK+5PtoGb2Bw8SlIbqUkTFTg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f0e1rGgjIIBj1g4o3qoPMHGh38ogpUaaRRj7LnyzkinsjZXhfgcyiyxpv3kt76jx8
         c1D3lIFzvZ+KmClGOg+gG/lhoHi3TZoaSs8rPoY5aGXMEpXnktqKIPs1SdKkzsV79J
         LyPl8TLyMAEkfHMLJm58Zagyr/NT0o8aZtLrNURNa6mC7UQEt+a6GQABrUJaBMKg3y
         +/alcuHQ+0bf8Pv2F5WI+bncbc+hL2uxfadRkEDDett0iXhnGBoNVa7SP5+jayKVdC
         Hn1Plrz7oFSUdaa1y10nGv+x02uzPDI4udauwEgVjlGjW4KATJjhBwuG3qtY0U3L2Y
         yXHJpTOdX2/Aw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgo-OS; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 64/78] media: core: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:14 +0200
Message-Id: <1fb9919b1cb83dd6db934dab74442c981eeda7f0.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/venus/core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 54bac7ec14c5..c156320fa256 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -84,7 +84,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 			container_of(work, struct venus_core, work.work);
 	int ret = 0;
 
-	pm_runtime_get_sync(core->dev);
+	pm_runtime_resume_and_get(core->dev);
 
 	hfi_core_deinit(core, true);
 
@@ -106,7 +106,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	hfi_reinit(core);
 
-	pm_runtime_get_sync(core->dev);
+	pm_runtime_resume_and_get(core->dev);
 
 	ret |= venus_boot(core);
 	ret |= hfi_core_resume(core, true);
@@ -305,21 +305,21 @@ static int venus_probe(struct platform_device *pdev)
 
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
@@ -351,8 +351,9 @@ static int venus_probe(struct platform_device *pdev)
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
@@ -371,7 +372,7 @@ static int venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	WARN_ON(ret < 0);
 
 	ret = hfi_core_deinit(core, true);
@@ -403,7 +404,7 @@ static void venus_core_shutdown(struct platform_device *pdev)
 {
 	struct venus_core *core = platform_get_drvdata(pdev);
 
-	pm_runtime_get_sync(core->dev);
+	pm_runtime_resume_and_get(core->dev);
 	venus_shutdown(core);
 	venus_firmware_deinit(core);
 	pm_runtime_put_sync(core->dev);
-- 
2.30.2

