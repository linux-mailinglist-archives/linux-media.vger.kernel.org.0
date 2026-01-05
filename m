Return-Path: <linux-media+bounces-49903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 902BBCF3511
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8C673064D7F
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D734330653;
	Mon,  5 Jan 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uqoUT3t9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E9332B99C;
	Mon,  5 Jan 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612999; cv=none; b=fhAn3rbaxA5ljqEjkT8/cFBtTtah4slMy3GS58wfUsgWhEQ6IXTdJux54pTAlbDQRM8ZwNNww50yHfVErXkUlv68CzeFcqpbqA5uuCnSTrfQ0eyYEtqwrFd8r1Ykx/tbuzhO/mcz5dYRrgCfhXW8UWwJqZqV6mOyl8UwIlUCBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612999; c=relaxed/simple;
	bh=m4SsVkhGfBpQnEXQ4x2bVODp2G73bAqAfTJqh+1eCiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfdM+X8TeiVHhFx2OVk54NojE736jjP8k1R4a3xQCWeIBWXxEgw2Ec1N59flUs0mmR489S1MU2DmKN8UvZ5LShfIgW9ikox7HKyhM43GB9/zC3WFKl9naD+QKlULToSL9eoqvQXOwWDhUlMdp7c3Ar4GHQwFzr4cn8zGgLnPdF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uqoUT3t9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c12b:c5c7:ad08:9cf2])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 743F614C7;
	Mon,  5 Jan 2026 12:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612976;
	bh=m4SsVkhGfBpQnEXQ4x2bVODp2G73bAqAfTJqh+1eCiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uqoUT3t9XGsqpvVEc0sYj7qiHpMMowFH/YZkLjT/XhptpuJvCDsy4Q12xbzrW4BC4
	 LviNAnj2tiZ5CYuFXEeqk5F+3dbWkKWMLucmd+aKISjJYt7ujXW4rDrbWTwy8de1/V
	 G6tvb9xnk33xRmXrqLqFNi5ar78PIDl7270nxVKg=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Mon, 05 Jan 2026 12:35:56 +0100
Subject: [PATCH 4/4] media: dw100: Split interrupt handler to fix timeout
 error
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-4-65af34d04fd8@ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
In-Reply-To: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2

In the previous commit, the interrupt handler was changed to threaded.
This sometimes leads to DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being
set after changing the vertex map. This can be seen by repeated error
outputs in dmesg:

dw100 32e30000.dwe: Interrupt error: 0x1

As there is no documentation available, it is unclear why that happens
and if this condition can simply be ignored. By splitting the interrupt
handling into two parts and only handling the dw100_job_finish() within
the threaded part, the error does not occur anymore.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

---

As noted on the cover letter, this patch still is intended to start the
discussion for a proper fix.

While writing this I noted that when
DW100_INTERRUPT_STATUS_INT_FRAME_DONE is set, the job gets finished
without error even when err_irqs != 0. Is that on purpose?
---
 drivers/media/platform/nxp/dw100/dw100.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 4f5ef70e5f4a052fb5f208e35f8785f9d30dc54e..67d941bdf768398edc611c94896cc42a70b88225 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
+#include <linux/irqreturn.h>
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -74,6 +75,7 @@ struct dw100_device {
 	struct clk_bulk_data		*clks;
 	int				num_clks;
 	struct dentry			*debugfs_root;
+	bool				frame_failed;
 };
 
 struct dw100_q_data {
@@ -1411,7 +1413,8 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 {
 	struct dw100_device *dw_dev = dev_id;
 	u32 pending_irqs, err_irqs, frame_done_irq;
-	bool with_error = true;
+
+	dw_dev->frame_failed = true;
 
 	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
 	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
@@ -1419,7 +1422,7 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 
 	if (frame_done_irq) {
 		dev_dbg(&dw_dev->pdev->dev, "Frame done interrupt\n");
-		with_error = false;
+		dw_dev->frame_failed = false;
 		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
 			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
 	}
@@ -1432,7 +1435,14 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 	dw100_hw_clear_irq(dw_dev, pending_irqs |
 			   DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
 
-	dw100_job_finish(dw_dev, with_error);
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
+{
+	struct dw100_device *dw_dev = dev_id;
+
+	dw100_job_finish(dw_dev, dw_dev->frame_failed);
 
 	return IRQ_HANDLED;
 }
@@ -1600,8 +1610,8 @@ static int dw100_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-					dw100_irq_handler, IRQF_ONESHOT,
+	ret = devm_request_threaded_irq(&pdev->dev, irq, dw100_irq_handler,
+					dw100_irq_thread_fn, IRQF_ONESHOT,
 					dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);

-- 
2.51.0


