Return-Path: <linux-media+bounces-49902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B9CF3505
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 12:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D4630BD0DC
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972AD329C69;
	Mon,  5 Jan 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nNf2gfQf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5262131960E;
	Mon,  5 Jan 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767612997; cv=none; b=ZJrqKhoBBKt17qE2AzK1O3hvRKN9JM96H45oQT9TA60O4s53JWB7U852eUJe+e8Pp8nPOi9IgHJsSCP96mv6GOqbuQN6BUZAInLgJWvwr9uQOAu/k+uz6zNvgaLXnePgOjpE0X8zZs7pK2zAZEWWwVDf2ITzQm0nsmixNfn9Uhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767612997; c=relaxed/simple;
	bh=YSjJ1cuIpMddaWeRdW3FNnaussg9qgd0RdT5kpyzKMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvaHTBRMz8UwPoYjf+Hsnn/4GzPActS9/mTzu7/6jkaQB9YJr2oXqHio7cft06sJu8Sqv+tyR6+IeW4e1irGf44/h/QRYolKPVI0PfpViUonEVjAisKItBUZKAgDJOc31pNCCSv5W3/h7Q8SOG14pDXhJJWN4f7z4pFn0EbPRhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nNf2gfQf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:c12b:c5c7:ad08:9cf2])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A3B3134C;
	Mon,  5 Jan 2026 12:36:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767612974;
	bh=YSjJ1cuIpMddaWeRdW3FNnaussg9qgd0RdT5kpyzKMs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nNf2gfQfd3I5E/HFUtI1hpplXIUhWL+IQLfZvsmsErE8M0afntffLJCmCPSMyoFke
	 rbVAHXBtierqmhLjCA3Gi6JbcGINvZP7yszubQeJtBmFZFxkTRdCYDuKJitYW1ZLl7
	 2IwITeCmHFo9T18L4n7NsWsfLVB9sMx/r/Nb1SEM=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Mon, 05 Jan 2026 12:35:55 +0100
Subject: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
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

On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
because vb2_buffer_done takes a spinlock which is not allowed within
interrupt context on PREEMPT_RT.

Fix that by making the irq handler threaded. The threaded interrupt
handling might cause the interrupt line to be disabled a little longer
than before. As the line is not shared, this has no negative side
effects.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 8a421059a1c9b55f514a29d3c2c5a6ffb76e0a64..4f5ef70e5f4a052fb5f208e35f8785f9d30dc54e 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1600,8 +1600,9 @@ static int dw100_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
-			       dev_name(&pdev->dev), dw_dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
+					dw100_irq_handler, IRQF_ONESHOT,
+					dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
 		goto err_pm;

-- 
2.51.0


