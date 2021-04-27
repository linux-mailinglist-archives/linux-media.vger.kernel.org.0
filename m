Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA6336C395
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbhD0K24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:48270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235804AbhD0K2N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7694661410;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=DzFwWWrx/K8GcHK3QK7SiLSCre5vWmnzlplRbKVIaVw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GgBONKa6p/I1DeV6DrdT75QQGY5WBAGnzAKp35ybnJUFqoehBmAXoSYjNmGEEGA/9
         QB7SR2N17xCHH0hJs1QIeebKGEqR/Qvu/b0LDbw+4mq8glVdePVWjbKvgD7oIyvRVK
         DU69zKoixkrtwlnNLXIQ/8ZUOWwWjrRjiz9AdH3JIrf3t3qDgFeQelb6nmHRin4IB7
         gVFzDj16QuJoRpuFnVrWvnJ+w6bXVb/wH3fDBEsAFuRg/jbjL/+entqkTIcFYkeFYh
         lrpgPbYAVSv9Ad0ix4Ca9rrOqUhaju/8KFRyfvJIjc7bmCiFSnOmF350OpELErO7MD
         oCSw6I0Q1H7Aw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2t-MZ; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 76/79] media: ti-vpe: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:06 +0200
Message-Id: <163e79c9b888f5677fc30150918abdbdc9085b65.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/ti-vpe/vpe.c       | 4 +---
 3 files changed, 9 insertions(+), 7 deletions(-)

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
index 10251b787674..07cb2c140295 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2471,10 +2471,8 @@ static int vpe_runtime_get(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "vpe_runtime_get\n");
 
-	r = pm_runtime_get_sync(&pdev->dev);
+	r = pm_runtime_resume_and_get(&pdev->dev);
 	WARN_ON(r < 0);
-	if (r)
-		pm_runtime_put_noidle(&pdev->dev);
 	return r < 0 ? r : 0;
 }
 
-- 
2.30.2

