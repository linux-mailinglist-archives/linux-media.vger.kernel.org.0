Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634533737D8
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhEEJn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232441AbhEEJnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F5F06142C;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=nQwSJPLaVBdYjIemEjVYgYFNl6DQmZf6LrKXcLdjxJM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F9WUUhkgAtjIMrRyssd4lqvAgaNoCpjaPTh7w7MGeWRglTuwvS98rekMY6tjnCFfU
         qN1nJqOXFDSgxykV8A1UP4emDRvb/rsb3LW6ZZhBi5Ucb7BFnz4lMW1ZIpuZosoIDS
         nQKYca3xqqSVSwNF9R5+gYdxDpyQJz+oBXc0yadciXJRqjDBS4uCl77uXuSRTFGhta
         kXZxGGiZxKoCrim6BkWlJtAWscRtJXcd8Jrv5qtr7ZLOa2m5+PGFvksDUVVxC96Rru
         xwL3j/PqrCyZpMKnz23T+WtGdFASUpZxmpX/TewQDPeA56fy040o3GUQv351bIF/IT
         UXqf5fbLWQNpw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwR-5F; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 13/25] media: rcar_fdp1: fix pm_runtime_get_sync() usage count
Date:   Wed,  5 May 2021 11:42:03 +0200
Message-Id: <372d88637707ececab77fffaae49d455d90cf24f.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

Also, right now, the driver is ignoring any troubles when
trying to do PM resume. So, add the proper error handling
for the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar_fdp1.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index d26413fa5205..89aac60066d9 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2135,7 +2135,9 @@ static int fdp1_open(struct file *file)
 	}
 
 	/* Perform any power management required */
-	pm_runtime_get_sync(fdp1->dev);
+	ret = pm_runtime_resume_and_get(fdp1->dev);
+	if (ret < 0)
+		goto error_pm;
 
 	v4l2_fh_add(&ctx->fh);
 
@@ -2145,6 +2147,8 @@ static int fdp1_open(struct file *file)
 	mutex_unlock(&fdp1->dev_mutex);
 	return 0;
 
+error_pm:
+       v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 error_ctx:
 	v4l2_ctrl_handler_free(&ctx->hdl);
 	kfree(ctx);
@@ -2352,7 +2356,9 @@ static int fdp1_probe(struct platform_device *pdev)
 
 	/* Power up the cells to read HW */
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(fdp1->dev);
+	ret = pm_runtime_resume_and_get(fdp1->dev);
+	if (ret < 0)
+		goto disable_pm;
 
 	hw_version = fdp1_read(fdp1, FD1_IP_INTDATA);
 	switch (hw_version) {
@@ -2381,6 +2387,9 @@ static int fdp1_probe(struct platform_device *pdev)
 
 	return 0;
 
+disable_pm:
+	pm_runtime_disable(fdp1->dev);
+
 release_m2m:
 	v4l2_m2m_release(fdp1->m2m_dev);
 
-- 
2.30.2

