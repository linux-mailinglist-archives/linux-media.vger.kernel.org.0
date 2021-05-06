Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BAB3756E9
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbhEFP2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235452AbhEFP1n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA4C66194C;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=xG6JnysSxfWd3aUelNVSSL+9ckiOYfdOZj8pIwxAXDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LY480GhqfCXusMjUoczZcVXeOz/0xYAX/WTSEmnRnVBR/t347ct7ahedVlVqRo+aE
         TblPTYe+laOCe0eSFPTkG2xMjc56zPa5FtQLit4pMgtUbyKoLNHRvAhOGkifCtcrYa
         1MuynXQRuGCb/MOxw5iWNYote7Z1wqecDpi7MgX2jpHHnWDjmO8jqZicGTGfSw6CW6
         1H/k2tLO/GeohygkO+kUnbYwWoBi5HlVrftF3khUU2j6iwUcNEuvFpmv+TDp6le3NR
         hvgO+Y/oeWfjRLG6ORxU1RtpO7/nEl5422kisMDetbQPoSepFaSmH2LU+F9RbkR8EB
         XEdMlKKvS/PzA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCR-C7; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 22/25] media: ti-vpe: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:26:00 +0200
Message-Id: <d84de29109f097f13b624b3343a77a5b10847d6f.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/ti-vpe/cal-video.c | 4 +++-
 drivers/media/platform/ti-vpe/cal.c       | 8 +++++---
 drivers/media/platform/ti-vpe/vpe.c       | 8 +++-----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 7b7436a355ee..15fb5360cf13 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -700,7 +700,9 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 
-	pm_runtime_get_sync(ctx->cal->dev);
+	ret = pm_runtime_resume_and_get(ctx->cal->dev);
+	if (ret < 0)
+		goto error_pipeline;
 
 	cal_ctx_set_dma_addr(ctx, addr);
 	cal_ctx_start(ctx);
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 2e2bef91b2b0..76fe7a8b33f6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1024,7 +1024,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Read the revision and hardware info to verify hardware access. */
 	pm_runtime_enable(&pdev->dev);
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		goto error_pm_runtime;
 
@@ -1098,10 +1098,11 @@ static int cal_remove(struct platform_device *pdev)
 {
 	struct cal_dev *cal = platform_get_drvdata(pdev);
 	unsigned int i;
+	int ret;
 
 	cal_dbg(1, cal, "Removing %s\n", CAL_MODULE_NAME);
 
-	pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 
 	cal_media_unregister(cal);
 
@@ -1115,7 +1116,8 @@ static int cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_destroy(cal->phy[i]);
 
-	pm_runtime_put_sync(&pdev->dev);
+	if (ret >= 0)
+		pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return 0;
diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index 10251b787674..5b1c5d96a407 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2471,11 +2471,9 @@ static int vpe_runtime_get(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "vpe_runtime_get\n");
 
-	r = pm_runtime_get_sync(&pdev->dev);
+	r = pm_runtime_resume_and_get(&pdev->dev);
 	WARN_ON(r < 0);
-	if (r)
-		pm_runtime_put_noidle(&pdev->dev);
-	return r < 0 ? r : 0;
+	return r;
 }
 
 static void vpe_runtime_put(struct platform_device *pdev)
@@ -2580,7 +2578,7 @@ static int vpe_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = vpe_runtime_get(pdev);
-	if (ret)
+	if (ret < 0)
 		goto rel_m2m;
 
 	/* Perform clk enable followed by reset */
-- 
2.30.2

