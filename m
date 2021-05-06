Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D793756DF
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhEFP17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235396AbhEFP1n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B045C6194A;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=VccqcJ215VR7UKWGbWUF3AZ/5qIK/dKNloYRA4F/kE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uSusGkQLOU6HgwA9pFBT5EWjRxWsReP8IXtdb/JqiVOx3MSOX0fnVIMiViZyiiSEX
         0pEYDBhXdWYXRc9jgjfhbs80fwOZoVUhJSecULPm8Vq7bHbOEQ3QPMuGOXIJ2I6CRQ
         9sgsKTarwzkSAFyCQjxEY8ryzBZ2SzhnK6i9aQLzCGNwflI6scRGk0dK+/zj+nV9RQ
         w6SfMaiitudYEZtG3xpVvftfdi4oM9MYS0W2B9R1gUPyT10FPHhn/DXYv9u5llfHp2
         LcfM7FLzP/fm8jNgwUCMBooMRp+5KqoPF/L5Ei5Ed1W4NEXYpO85EfouROtrZ26SFs
         amilumy8ZFQjw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBf-VU; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 10/25] media: coda: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:48 +0200
Message-Id: <6b1404005196a38948fb4f6c30715bc6bedafef2.1620314616.git.mchehab+huawei@kernel.org>
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

While here, as noted by Phillip, the labels at the coda_open()
function are currently named after what operation failed,
instead of what they do in response. So, change the name of
the error label that it is called when clk_enable fails,
in order to be consistent.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/coda/coda-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index bd666c858fa1..2017de85713e 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2660,7 +2660,7 @@ static int coda_open(struct file *file)
 	ctx->use_vdoa = false;
 
 	/* Power up and upload firmware if necessary */
-	ret = pm_runtime_get_sync(dev->dev);
+	ret = pm_runtime_resume_and_get(dev->dev);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
 		goto err_pm_get;
@@ -2668,7 +2668,7 @@ static int coda_open(struct file *file)
 
 	ret = clk_prepare_enable(dev->clk_per);
 	if (ret)
-		goto err_pm_get;
+		goto err_clk_enable;
 
 	ret = clk_prepare_enable(dev->clk_ahb);
 	if (ret)
@@ -2707,8 +2707,9 @@ static int coda_open(struct file *file)
 	clk_disable_unprepare(dev->clk_ahb);
 err_clk_ahb:
 	clk_disable_unprepare(dev->clk_per);
+err_clk_enable:
+	pm_runtime_put_sync(dev->dev);
 err_pm_get:
-	pm_runtime_put_sync(dev->dev);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:
-- 
2.30.2

