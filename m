Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AA636DA87
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbhD1O41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240442AbhD1Ox4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA0676193A;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=iGZe8aaDJjF2bkRR0aV7yAcLZay9Jx4R6lGwINryHgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r7Zsn7ZfibgO5NJ4O8W7hayhDjJqzikad8KZcJEMy4lO6Tn7c1Z9mq4POy6ubsaNP
         EevLODRnXfD9y4mg3Jb8InxQUOfR89aCWmOcVk67go3jfWYt8Z2ua1Vol8/5h9J+y+
         HUs3ADhigpOxMlJwTfi3kVMCPSg/qr1HNKwKzct5J59tQ3+Tza/AYLeBbf9Eki6GXM
         wadAqpYw59ZjJ17iQcLkDHfLelN7Yiq9xGn8U4ueZeZ0yE2LxmnQbEulEHX+WqXLEh
         oe0VvCNPYVjwSktLb+OGh+KHNrDm9IlHHRVsaGZ4l1K/hk/tCFoEf4NAQC2epp4MuH
         IUpDoVR0Gc6Lg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYS-001Dtv-AF; Wed, 28 Apr 2021 16:52:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v4 78/79] media: hantro: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:39 +0200
Message-Id: <803c39fafdd62efc6f9e4d99a372af2c6955143b.1619621413.git.mchehab+huawei@kernel.org>
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

While there's nothing wrong with the current usage on this driver,
as we're getting rid of the pm_runtime_get_sync() call all over
the media subsystem, let's remove the last occurrence on this
driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/hantro/hantro_drv.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 595e82a82728..25fa36e7e773 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -56,14 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
-static void hantro_job_finish(struct hantro_dev *vpu,
-			      struct hantro_ctx *ctx,
-			      enum vb2_buffer_state result)
+static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
+				    struct hantro_ctx *ctx,
+				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
 
-	pm_runtime_mark_last_busy(vpu->dev);
-	pm_runtime_put_autosuspend(vpu->dev);
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
@@ -81,6 +79,16 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 					 result);
 }
 
+static void hantro_job_finish(struct hantro_dev *vpu,
+			      struct hantro_ctx *ctx,
+			      enum vb2_buffer_state result)
+{
+	pm_runtime_mark_last_busy(vpu->dev);
+	pm_runtime_put_autosuspend(vpu->dev);
+
+	hantro_job_finish_no_pm(vpu, ctx, result);
+}
+
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result)
 {
@@ -155,7 +163,8 @@ static void device_run(void *priv)
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
 		goto err_cancel_job;
-	ret = pm_runtime_get_sync(ctx->dev->dev);
+
+	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0)
 		goto err_cancel_job;
 
@@ -165,7 +174,7 @@ static void device_run(void *priv)
 	return;
 
 err_cancel_job:
-	hantro_job_finish(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.30.2

