Return-Path: <linux-media+bounces-32059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBFAB051F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 23:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455A29E52EF
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 21:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1706221285;
	Thu,  8 May 2025 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L0UFw/an"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4ED20E01B;
	Thu,  8 May 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738037; cv=none; b=R5/WtKWTyAFYBrwbpU7DtxNGgbDCr5NNxgIboePsXt4JhgQBE13/UVp30D8LXPNCivjliMxZoVk74qwFl1Ok45qdcZqp8KBQulUg6cNGpoEUUImfq3qUie7uvsxiXaAfVm4FmIRZ/DHi4zH8K/rIM21NkkO4ToV8Ejb7MQH88H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738037; c=relaxed/simple;
	bh=fRvyqkKKyg7hRmshz5UB6TzRvXuXYDOyDjxC4PJ64uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PHC5ieHwJRJogMj1OII0N96ZuNhmdx4iCxsMKSZKvarH1/kkyPzGVmNpR6Nq0of7L+ozn1VBMxxJ5JAxEqEuw11mvEsZkNlXBDkYc1y72IxUDugm9OseuxKNwl1qWdPBF+CohxpB32fPfuPdrMwg0NHxkTihp83G05m5F4P9Wcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L0UFw/an; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746738033;
	bh=fRvyqkKKyg7hRmshz5UB6TzRvXuXYDOyDjxC4PJ64uI=;
	h=From:Date:Subject:To:Cc:From;
	b=L0UFw/an9E94NuPivotcoiUTQlTk6wFHqpOEp/9p9buT9MPxM0ytB9sLGUR9uLGdK
	 BsFOfKnFPzYx8J6ZE4abM9nlENISb70VeAmJCk1QseFkyUGlJ28LM3ItYloDplZZOR
	 QkLjjPwOZIvL3hTwRHD54WE7Q+/IHUWthCEFvBtdw3yJeb3cTlRyf54iB9TtX6TTIR
	 lfdXlyNt2q0ewXYjiarsIecUfu584cgahtqf+SKBfVTAAljj+iaZF4NISm254pykW7
	 FVFroxFMJAtU5P1hKoPxPA0IpmI+d7q7ZPoW3cDQwYqIyCbt3FR0BIkrbq1Gbo3tJL
	 serpr6HJ/9JRw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:15:ec4::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207F417E078A;
	Thu,  8 May 2025 23:00:32 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 08 May 2025 17:00:15 -0400
Subject: [PATCH] media: rkvdec: Restore iommu addresses on errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAF8bHWgC/x3MSQqAMAxA0atI1gbqVKpXERfaRg3iQKoiFO9uc
 fkW/wfwJEwemiSA0M2e9y0iSxOwc79NhOyiIVd5pSplUJbbkUXe1/VCIU8nOtPXejBloa2CGB5
 CIz//tO3e9wOpzlkwZAAAAA==
X-Change-ID: 20250508-rkvdec-iommu-reset-d8a96b8436c0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

On errors, the rkvdec chip self resets. This can clear the addresses
programmed in the iommu. This case is signaled by the
RKVDEC_SOFTRESET_RDY status bit.

Since the iommu framework does not have a restore functionality, and
as recommended by the iommu subsystem maintainers, this patch
restores the iommu programming by attaching and detaching an empty
domain, which will clear and restore the default domain.

Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 43 +++++++++++++++++++++++++++++------
 drivers/staging/media/rkvdec/rkvdec.h |  1 +
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index dd7e57a902640d363d26be887cb535c2668d5b15..38043b1877e221db58f5834ba51e085cf9127e73 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -1000,24 +1001,42 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
 	v4l2_device_unregister(&rkvdec->v4l2_dev);
 }
 
+static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
+{
+	if (rkvdec->empty_domain) {
+		/*
+		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
+		 * will program an empty table, then detach it to restore the default domain and
+		 * all cached mappings.
+		 * This is safely done in this interrupt handler to make sure no memory get mapped
+		 * through the IOMMU while the empty domain is attached.
+		 */
+		iommu_attach_device(rkvdec->empty_domain, rkvdec->dev);
+		iommu_detach_device(rkvdec->empty_domain, rkvdec->dev);
+	}
+}
+
 static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 {
 	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
 	enum vb2_buffer_state state;
 	u32 status;
 
 	status = readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
-	state = (status & RKVDEC_RDY_STA) ?
-		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
 	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
-	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
-		struct rkvdec_ctx *ctx;
 
-		ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
-		rkvdec_job_finish(ctx, state);
+	if (status & RKVDEC_RDY_STA) {
+		state = VB2_BUF_STATE_DONE;
+	} else {
+		state = VB2_BUF_STATE_ERROR;
+		if (status & RKVDEC_SOFTRESET_RDY)
+			rkvdec_iommu_restore(rkvdec);
 	}
 
+	if (cancel_delayed_work(&rkvdec->watchdog_work))
+		rkvdec_job_finish(ctx, state);
+
 	return IRQ_HANDLED;
 }
 
@@ -1085,6 +1104,13 @@ static int rkvdec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (iommu_get_domain_for_dev(&pdev->dev)) {
+		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
+
+		if (!rkvdec->empty_domain)
+			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+	}
+
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
@@ -1124,6 +1150,9 @@ static void rkvdec_remove(struct platform_device *pdev)
 	rkvdec_v4l2_cleanup(rkvdec);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	if (rkvdec->empty_domain)
+		iommu_domain_free(rkvdec->empty_domain);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..0eb3fd598664bc5af19de120ff6efac13417541f 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -105,6 +105,7 @@ struct rkvdec_dev {
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
+	struct iommu_domain *empty_domain;
 };
 
 struct rkvdec_ctx {

---
base-commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd
change-id: 20250508-rkvdec-iommu-reset-d8a96b8436c0

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


