Return-Path: <linux-media+bounces-37127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD0AFCEFE
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480611BC3E47
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A212E4276;
	Tue,  8 Jul 2025 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tg+zZpT8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218B62E2663;
	Tue,  8 Jul 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988011; cv=none; b=JMk5WYeAlS9fEDkJ8P+tZaXyvWaG0umYYnDE9PEJ+efBhaQjBVu9JJLaC7iObYKK4io90mAM/+NGtVkF4GW1rsrcT+lRwDrHxSr2K+iU2pVQyHkhHBzNnXdrYpiVlQ/MKGOP0UNPl/3CxoQDihL77ZtbjLB7zvd/HFdEsGSaxy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988011; c=relaxed/simple;
	bh=ZBR6TyvvAIxLQbGrdQjFdRd1cDVGsmsUKeXvIrF7mQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DE++5uBFs+Pt6aJAI3qBFlqyDbLrNqXqY0pM43L+clfEFKE8gsho4ca9P0PSBQs1GEQEn2zdHxmbPsm1XK67RfZXq0XIkF5awG1KFcm25M2Wogb0IoTSVesFjbskeqYgKQtTkTcGcF6gLRvrUVqTFLOdmRC/qkI5z0EtMkbvkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tg+zZpT8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751988007;
	bh=ZBR6TyvvAIxLQbGrdQjFdRd1cDVGsmsUKeXvIrF7mQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tg+zZpT8Gwrv8zcakaFyqpOH9bykOWM4LkU6f9mZoExepg6eLP8dLo/ICc+H7RHEZ
	 v1XS1+bAQovye+HkLTeVgnCVoyYHTzjxd0z0wJlFXJeSd9uM+23qOONl4o7/Z/dsQk
	 tawqp+CwZsO46T7xJh527Qf+7WafQf1QdNUi1y4EM88M/gtjZPLxZQlryayOJwEqhd
	 Ewly4qGzlZ/sHC1zpkNE2N9J7DRbuOl8JQw26w5LrZGVwqVWEFEg36go0nw9pSlaBH
	 Ew2Rmpjq2pX32HvxfM08gU/izrcJawMFhOHp2ToMfI9Y7qseSaRpgT9eXh+el3m2QQ
	 2IrMleRLtiZNQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECE3417E0456;
	Tue,  8 Jul 2025 17:20:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 07/12] media: rkvdec: Support per-variant interrupt handler
Date: Tue,  8 Jul 2025 11:19:40 -0400
Message-ID: <20250708151946.374349-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preparation commit for supporting different variants with different
interrupt management.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++---
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 3285dd910c327..d5d69ee56cb62 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1102,10 +1102,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1126,6 +1125,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_config *cfg = rkvdec->config;
+
+	return cfg->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1144,6 +1152,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 const struct rkvdec_config config_rkvdec = {
 	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
 	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3a073883d21eb..679de66df2479 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -107,6 +107,7 @@ struct rkvdec_config {
 	size_t coded_fmts_num;
 	struct rcb_size_info *rcb_size_info;
 	size_t rcb_num;
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 };
 
 struct rkvdec_dev {
-- 
2.50.0


