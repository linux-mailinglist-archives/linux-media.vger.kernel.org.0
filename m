Return-Path: <linux-media+bounces-39142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF437B1EF32
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C54568471
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 20:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEE4288C34;
	Fri,  8 Aug 2025 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WEb1nipY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63BB2512FF;
	Fri,  8 Aug 2025 20:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754683441; cv=none; b=gxWnxDpNUZFHFs0q3ynqM726IZr10HSTdCbDfs4oqqGJ1LfgJJEdGZ/1hSaqR/DF/AIZqn4imABGp6ue9QuqvzlaoMXY61zsdYKRP8zdlMTBhRk9cJNoVD1y6KXFJKQfqOSmHCjqMGdCifInKlQkOpnjG+JrGu0mh2rCvfhwfzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754683441; c=relaxed/simple;
	bh=cbLO7Ma+EdkDC2QdAiRI6lSh1FAiq/Nz4F7fvMKPYho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUobnBRztO5Ue8s2k96MsAJ8CnNIgRp8xTrQkABjZ5KY1YN1SuDvLkMMd56i1Y8gvNn8ere5DnpU8AkWVwJlkqOlolWbgXzbRIEvwGbwcHh0696exjxbmvb9m2J5s6SbcYSuK4Dp7Ct6CTYwy0E/Z7zbSRHd9xbMXtQIy1tNUNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WEb1nipY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754683437;
	bh=cbLO7Ma+EdkDC2QdAiRI6lSh1FAiq/Nz4F7fvMKPYho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEb1nipYM+UwqlmseEJla8tXRFuua05YVCYDZGOC1k9lihyuALgTkn47kwCEfMpto
	 23aXy/ev0zNixZL7JbVReNkKVWwPCFNWV+qIszgEI84wK6DQwmxJEEcrxed51qPI/n
	 Ne6IY8u0O3Z38v+o+xruyOIkOLeUPOszu60l990UVdgnrzNHyhoQ7RIrPK2oQzfJR6
	 aZIV8C4zM6juBor2OB48Dx4tSpFAkea4+fEGHjov/4Raixb19IyeFihzBNMkw6K/bv
	 FD05THxM/oO80JtOZi5HNFS/dHPJwBHih+hKKIo2k9sH5Xe+b5eeKm6T5puf08I5DB
	 EshYA/f8K5FBA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95EC417E132A;
	Fri,  8 Aug 2025 22:03:56 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 07/12] media: rkvdec: Support per-variant interrupt handler
Date: Fri,  8 Aug 2025 16:03:29 -0400
Message-ID: <20250808200340.156393-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
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
index 2602676a047a1..5f3057e8136b5 100644
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
2.50.1


