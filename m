Return-Path: <linux-media+bounces-54498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBYbJGVWqGlutQAAu9opvQ
	(envelope-from <linux-media+bounces-54498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 16:57:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B9203750
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 16:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 921BD304F01B
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 15:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0939D35C1BD;
	Wed,  4 Mar 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RhcRTdRp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219FF35BDAC;
	Wed,  4 Mar 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639441; cv=none; b=JN+HwCVPnswOMzVtzlM9KgmS3ujg5fXsAVcKNnLwXaBHrpwySpljYsWmIzyTIN2A9NqPJHuoYZbGs+eT7NQYv7Rtq9dXqDY9pZwGOVchaxioQyfynX4FzgtBtXgOa125WJMf5Jq4cbF9JgGvITOYE9Lc74rV5vGRweARnCU9oqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639441; c=relaxed/simple;
	bh=/lNmnBJL/ScfCOaTNA8yDImhHy8UeD5PEVD6242bhzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1F47dd2jeg1YyjQclJ6tFacRZqBW+AxzE/VfdP67ohUFz4U9+JfIKQuVT9WIjthQlkwuBpqRMHe85n7e/sToAh+6/f27iaD8cfjwu6fURKAwE7yqEqD2ueNPw/LUDMhG3LUax49B5hcg7GUB1Wv9v3N1yYNYnX+zRgsZEUaPik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RhcRTdRp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:404d:d4e8:ffdc:3995])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 144F7105C;
	Wed,  4 Mar 2026 16:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772639373;
	bh=/lNmnBJL/ScfCOaTNA8yDImhHy8UeD5PEVD6242bhzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RhcRTdRpHL38hu9ZWFQe1953rsqbtXnMqcXwqc4kB1xs/lyy2uCTgVYCkc2QusISu
	 CJhw21ZVzHd5gpESxQoFc4aLcvzW+SiXOKGFoPBb1xThf5XEaueHtyNuoX5XyITnCR
	 msGn9NM3tLRSex3IFXf8jFTlH7zdSyIK7WmNDhGk=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Wed, 04 Mar 2026 16:50:24 +0100
Subject: [PATCH v5 3/4] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-3-1a7e1f721b50@ideasonboard.com>
References: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-0-1a7e1f721b50@ideasonboard.com>
In-Reply-To: <20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-0-1a7e1f721b50@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 8A0B9203750
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54498-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,nxp.com:email]
X-Rspamd-Action: no action

On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
because vb2_buffer_done takes a spinlock which is not allowed within
interrupt context on PREEMPT_RT.

The first attempt to fix this was to just drop the IRQF_ONESHOT so that
the interrupt is handled threaded on PREEMPT_RT systems. This introduced
a new issue. The dw100 has an internal timeout counter that is gated by
the DW100_BUS_CTRL_AXI_MASTER_ENABLE bit. Depending on the time it takes
for the threaded handler to run and the geometry of the data being
processed it is possible to reach the timeout resulting in
DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being set and "dw100
32e30000.dwe: Interrupt error: 0x1" errors in dmesg.

To properly fix that, split the interrupt into two halves, reset the
DW100_BUS_CTRL_AXI_MASTER_ENABLE bit in the hard interrupt handler and
do the v4l2 buffer handling in the threaded half. The IRQF_ONESHOT can
still be dropped as the interrupt gets disabled in the hard handler and
will only be reenabled on the next dw100_device_run which will not be
called before the current job has finished.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Thank you Xavier for the technical support and further details on the
interrupt bit.

Changes in v4:
- Collected tags
- Fixed include order

Changes in v3:
- Split interrupt in two halves to prevent timeout error
- Dropped rby tags, as the patch changed substantially

Changes in v2:
- Dropped the IRQF_ONESHOT instead of making the interrupt handler
  threaded to fix the issue.
- I didn't keep the r-by tag from Nicolas as the solution is now a
  different one.
---
 drivers/media/platform/nxp/dw100/dw100.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 69d469944536f62af22d6fc532afdcf669afe4be..43c218fa31b47402120de3e74959d2d38a6c3453 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irqreturn.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -74,6 +75,7 @@ struct dw100_device {
 	struct clk_bulk_data		*clks;
 	int				num_clks;
 	struct dentry			*debugfs_root;
+	bool				frame_failed;
 };
 
 struct dw100_q_data {
@@ -1404,7 +1406,8 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 {
 	struct dw100_device *dw_dev = dev_id;
 	u32 pending_irqs, err_irqs, frame_done_irq;
-	bool with_error = true;
+
+	dw_dev->frame_failed = true;
 
 	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
 	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
@@ -1412,7 +1415,7 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 
 	if (frame_done_irq) {
 		dev_dbg(&dw_dev->pdev->dev, "Frame done interrupt\n");
-		with_error = false;
+		dw_dev->frame_failed = false;
 		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
 			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
 	}
@@ -1425,7 +1428,14 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
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
@@ -1594,8 +1604,9 @@ static int dw100_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
-			       dev_name(&pdev->dev), dw_dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, dw100_irq_handler,
+					dw100_irq_thread_fn, 0,
+					dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
 		goto err_pm;

-- 
2.51.0


