Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3512DD16A
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 13:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgLQMTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 07:19:52 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:53306 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgLQMTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 07:19:46 -0500
Received: from localhost.localdomain ([92.131.12.169])
        by mwinf5d48 with ME
        id 5QHz2400L3eqQsk03QJ0QR; Thu, 17 Dec 2020 13:18:01 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 17 Dec 2020 13:18:01 +0100
X-ME-IP: 92.131.12.169
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        georgi.djakov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: venus: core: Fix a resource leak in error handling paths of the probe function
Date:   Thu, 17 Dec 2020 13:17:25 +0100
Message-Id: <20201217121725.156649-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add 2 missing 'icc_put()' calls in the error handling path of the probe
function, as already done in the remove function.

Fixes: 32f0a6ddc8c9 ("media: venus: Use on-chip interconnect API")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/qcom/venus/core.c | 31 +++++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bdd293faaad0..2e6ce215740b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -200,27 +200,35 @@ static int venus_probe(struct platform_device *pdev)
 		return PTR_ERR(core->video_path);
 
 	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
-	if (IS_ERR(core->cpucfg_path))
-		return PTR_ERR(core->cpucfg_path);
+	if (IS_ERR(core->cpucfg_path)) {
+		ret = PTR_ERR(core->cpucfg_path);
+		goto err_video_path_put;
+	}
 
 	core->irq = platform_get_irq(pdev, 0);
-	if (core->irq < 0)
-		return core->irq;
+	if (core->irq < 0) {
+		ret = core->irq;
+		goto err_cpucfg_path_put;
+	}
 
 	core->res = of_device_get_match_data(dev);
-	if (!core->res)
-		return -ENODEV;
+	if (!core->res) {
+		ret = -ENODEV;
+		goto err_cpucfg_path_put;
+	}
 
 	mutex_init(&core->pm_lock);
 
 	core->pm_ops = venus_pm_get(core->res->hfi_version);
-	if (!core->pm_ops)
-		return -ENODEV;
+	if (!core->pm_ops) {
+		ret = -ENODEV;
+		goto err_cpucfg_path_put;
+	}
 
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(dev);
 		if (ret)
-			return ret;
+			goto err_cpucfg_path_put;
 	}
 
 	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
@@ -305,6 +313,11 @@ static int venus_probe(struct platform_device *pdev)
 err_core_put:
 	if (core->pm_ops->core_put)
 		core->pm_ops->core_put(dev);
+err_cpucfg_path_put:
+	icc_put(core->cpucfg_path);
+err_video_path_put:
+	icc_put(core->video_path);
+
 	return ret;
 }
 
-- 
2.27.0

