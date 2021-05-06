Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260403756E1
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhEFP2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235402AbhEFP1n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBB646194D;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=RAO7dmVKLQDcH6CylVWp9ikY4d/9xR0RnopNUcB5ryI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gDxRrtQ90nN3tyyyAw1+n/qyklcK+N18nA2ub2ElEnoEKKYe47m1XebwIoqeyrwOH
         E1I39n2UtxUvdqCbNQCncGSNXqSNdsemO1dGTM5IXnvVpo9m+9asVGGCaovxtyn0Mx
         OrfqrsvocpVdDjq3wMQGnqq44hLYFxdEGxxvVKFT1LXYpny+QBtNZSfAfR/+jbLJw+
         NInGIBtAk94f4ZHicGV+1a4CvFqmvO+zeS0KC9+7rUeR2M3NODJLSc6uFPEk9u7hRt
         ne6bMxW/yEC0pzYMhtEartKRGZEJb+SWuwS0+49CxQHIlGOIO50yZFs0CURaTrPAsb
         nBHsa5X04GSLQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBX-TN; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 08/25] media: sti/hva: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:46 +0200
Message-Id: <dea27c7d3df661302e08c1749d95dd9df01e71d2.1620314616.git.mchehab+huawei@kernel.org>
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

While the hva driver does it right, there are lots of errors
on other drivers due to its misusage. So, let's change
this driver to also use pm_runtime_resume_and_get(), as we're
doing similar changes all over the media subsystem.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/hva/hva-hw.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index f59811e27f51..77b8bfa5e0c5 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -270,9 +270,8 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
 	struct device *dev = hva_to_dev(hva);
 	unsigned long int version;
 
-	if (pm_runtime_get_sync(dev) < 0) {
+	if (pm_runtime_resume_and_get(dev) < 0) {
 		dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
-		pm_runtime_put_noidle(dev);
 		mutex_unlock(&hva->protect_mutex);
 		return -EFAULT;
 	}
@@ -386,10 +385,10 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "%s     failed to set PM\n", HVA_PREFIX);
-		goto err_pm;
+		goto err_clk;
 	}
 
 	/* check IP hardware version */
@@ -462,6 +461,7 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
 	u8 client_id = ctx->id;
 	int ret;
 	u32 reg = 0;
+	bool got_pm = false;
 
 	mutex_lock(&hva->protect_mutex);
 
@@ -469,12 +469,13 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
 	enable_irq(hva->irq_its);
 	enable_irq(hva->irq_err);
 
-	if (pm_runtime_get_sync(dev) < 0) {
+	if (pm_runtime_resume_and_get(dev) < 0) {
 		dev_err(dev, "%s     failed to get pm_runtime\n", ctx->name);
 		ctx->sys_errors++;
 		ret = -EFAULT;
 		goto out;
 	}
+	got_pm = true;
 
 	reg = readl_relaxed(hva->regs + HVA_HIF_REG_CLK_GATING);
 	switch (cmd) {
@@ -537,7 +538,8 @@ int hva_hw_execute_task(struct hva_ctx *ctx, enum hva_hw_cmd_type cmd,
 		dev_dbg(dev, "%s     unknown command 0x%x\n", ctx->name, cmd);
 	}
 
-	pm_runtime_put_autosuspend(dev);
+	if (got_pm)
+		pm_runtime_put_autosuspend(dev);
 	mutex_unlock(&hva->protect_mutex);
 
 	return ret;
@@ -553,9 +555,8 @@ void hva_hw_dump_regs(struct hva_dev *hva, struct seq_file *s)
 
 	mutex_lock(&hva->protect_mutex);
 
-	if (pm_runtime_get_sync(dev) < 0) {
+	if (pm_runtime_resume_and_get(dev) < 0) {
 		seq_puts(s, "Cannot wake up IP\n");
-		pm_runtime_put_noidle(dev);
 		mutex_unlock(&hva->protect_mutex);
 		return;
 	}
-- 
2.30.2

