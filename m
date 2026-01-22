Return-Path: <linux-media+bounces-51358-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkbBGg9cmnpfAAAu9opvQ
	(envelope-from <linux-media+bounces-51358-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:08:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B651E68658
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 16:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1A1566AAAC
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A655435A956;
	Thu, 22 Jan 2026 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BgmzWz4u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E2D357A38;
	Thu, 22 Jan 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093112; cv=none; b=ezWNqZiDcER+/BCuB5qorM21jDFikfuEHBW+oAbU//r5m+QcG14+N8dzjjdYI0iAinCf6r18bte/gxWe7+lnDfXAJclKWS3pOsIfdO04ozqnaqSwDbgVxF9lxLfKJ1YmS20Ckf1Spngg6Zm2O4on6WQnYmmO2yM5in6IM5Kd/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093112; c=relaxed/simple;
	bh=y6/khB2UNCiHfdNdPN2LvHiuyaNgpFQi7MthW3acgkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Um8INPgXXy51LxCpKD5QtMX96q8OxwQ/51PM5ZIqFK+CxjJBUcqaUzwi1d+mAPCR/Juk2oIe7Fk6pJeVGxmoclKPemlooQegu5fYk3/6gkfbAtgS2WFkyExM9zug1CBgmcvgPYnBeORCzafevdlJujy0kaK8k4vg7aIQG0ZiB3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BgmzWz4u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:bc8e:214:d514:699a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4D3101AEE;
	Thu, 22 Jan 2026 15:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769093075;
	bh=y6/khB2UNCiHfdNdPN2LvHiuyaNgpFQi7MthW3acgkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BgmzWz4uJiV3DgO0OheZ8oZR2tZQIhPOQYcFgvFElJ9vg6/rMxRousG89pqrn1x0d
	 0DFiMTUf4o+XnN7hk0OQpEmwmr8E2IsfX8+6AJe9lUGeEIG8hegNPD/jhZMeKucg54
	 g3h9wHfRelC/yao9aw7MFxSubq0eHgnlXcnD2LqY=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Thu, 22 Jan 2026 15:44:58 +0100
Subject: [PATCH v2 3/3] media: dw100: Fix kernel oops with PREEMPT_RT
 enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-3-ea1e29f18cf1@ideasonboard.com>
References: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-0-ea1e29f18cf1@ideasonboard.com>
In-Reply-To: <20260122-sklug-v6-16-topic-dw100-v3-1-dev-v2-0-ea1e29f18cf1@ideasonboard.com>
To: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Stefan Klug <stefan.klug@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_FROM(0.00)[bounces-51358-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.klug@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: B651E68658
X-Rspamd-Action: no action

On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
because vb2_buffer_done takes a spinlock which is not allowed within
interrupt context on PREEMPT_RT.

Fix that by dropping the IRQF_ONESHOT flag. There was only a hard
interrupt handler specified anyways, so IRQF_ONESHOT didn't have any
effect on non PREEMPT_RT systems. On PREEMPT_RT systems the interrupt
handler is automatically changed to threaded and the IRQF_ONESHOT flag
get's set internally.

There is one caveat though: During development regular "dw100
32e30000.dwe: Interrupt error: 0x1" errors occurred due to
DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being set. This only happened on
non PREEMPT_RT setups when the interrupt handler was manually forced to
be threaded. On PREEMPT_RT systems (where the interrupt handler is now
implicitly threaded) this error was never seen.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---

Changes in v2:
- Dropped the IRQF_ONESHOT instead of making the interrupt handler
  threaded to fix the issue.
- I didn't keep the r-by tag from Nicolas as the solution is now a
  different one.
---
 drivers/media/platform/nxp/dw100/dw100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index d2b1c62b52db47ea1d2242caaf334fff30c6f366..4c8be66f87519b36b2273ecf3f34eab03c5e6738 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1593,7 +1593,7 @@ static int dw100_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
+	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, 0,
 			       dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);

-- 
2.51.0


