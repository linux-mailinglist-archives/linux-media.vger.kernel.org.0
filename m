Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F91307F98
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 21:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhA1UY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 15:24:27 -0500
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:37233 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231131AbhA1UYX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 15:24:23 -0500
Received: from localhost.localdomain ([92.131.99.25])
        by mwinf5d73 with ME
        id NLNc2400S0Ys01Y03LNdAh; Thu, 28 Jan 2021 21:22:40 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 28 Jan 2021 21:22:40 +0100
X-ME-IP: 92.131.99.25
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        georgi.djakov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] media: venus: core: Fix some resource leaks in the error path of 'venus_probe()'
Date:   Thu, 28 Jan 2021 21:22:34 +0100
Message-Id: <20210128202234.747048-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an error occurs after a successful 'of_icc_get()' call, it must be
undone.

Use 'devm_of_icc_get()' instead of 'of_icc_get()' to avoid the leak.
Update the remove function accordingly and axe the now unneeded
'icc_put()' calls.

Fixes: 32f0a6ddc8c9 ("media: venus: Use on-chip interconnect API")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1->v2: use managed resources instead of expanding the error handling path.
---
 drivers/media/platform/qcom/venus/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 0bde19edac86..c2458dee794b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -195,11 +195,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
-	core->video_path = of_icc_get(dev, "video-mem");
+	core->video_path = devm_of_icc_get(dev, "video-mem");
 	if (IS_ERR(core->video_path))
 		return PTR_ERR(core->video_path);
 
-	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
+	core->cpucfg_path = devm_of_icc_get(dev, "cpu-cfg");
 	if (IS_ERR(core->cpucfg_path))
 		return PTR_ERR(core->cpucfg_path);
 
@@ -334,9 +334,6 @@ static int venus_remove(struct platform_device *pdev)
 
 	hfi_destroy(core);
 
-	icc_put(core->video_path);
-	icc_put(core->cpucfg_path);
-
 	v4l2_device_unregister(&core->v4l2_dev);
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
-- 
2.27.0

