Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F8E36C2C9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237773AbhD0KQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:34882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235433AbhD0KOr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 204026191D;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=AWaRUuBTKGjvblFCBeNGn4e+vA3INJOtepNAWbdP4RE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pIL8J7ESwDAxEOHib1rV5UFJGRJqdLRj1K+N2Lohfb4bRQGvZz3bvmc1IlpEQehLp
         mOXU4rc4bvesf6NJJ0m+8rWfDSE9qfz9zXEXWPZ9ZsFQxHQrwXvuo1k8sKVH3/t1XH
         oE3IjdKCtYke8Taz8qFIm271jPq+6XmUfKSf3ngDF7UsvMszRWSBVXUqcubAB0e/Wr
         BKgp0u1LaMNFwjZwDyB4qUKZftnlEHluPyoAoPkFL1qSPxRYjgg171mIoe5BidWq4v
         sbgj+L8oKpbrK/T3G7seE69Zt9PUr42v/kwtcnAjq+IqJQwa8EQtx6zeih8iYuMUVT
         Lf1pWMl7ybyuw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7R-9N; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 59/79] media: sti/hva: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:26 +0200
Message-Id: <612ae30867078d2d42e23fdd2b551c37246080ab.1619518193.git.mchehab+huawei@kernel.org>
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

While the hva driver does it right, there are lots of errors
on other drivers due to its misusage. So, let's change
this driver to also use pm_runtime_resume_and_get(), as we're
doing similar changes all over the media subsystem.

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

