Return-Path: <linux-media+bounces-45288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FFBFD623
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 18:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFC7B5667DF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD1E3587A0;
	Wed, 22 Oct 2025 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lpVGl9kx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD782357A32;
	Wed, 22 Oct 2025 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150361; cv=none; b=rBAV+uMgWgdtqXNr1W4G4ffC+O5wN9OzCDba7mkcdQ95q+JfhgoVXEHCPWiJm2HOdllcAb4JeqwRqY348aD6XOAyK5AKc+j4raSDCywDYus84y3Y6K3OKwGByzvs+G1pr3Pjc8gpFOe9dPwQLs46lXIUEiDr//Y1joU3DtMRNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150361; c=relaxed/simple;
	bh=dAFQDps3eAP+w+7ZBAZcwTH8VtKHFGKFfeZJsJy7sx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWuM66mlx8uBd4wqx3d9ZusiGctfoDlTVZ/odJuONbkmICd+2in0bb8gWFA0by63zm7wn9/WZ+wrh+zkyBtUKcSlV/ClHq1of7jZMpAOMAVPB8QJBOBqhxQdj2OR3+vLrVWajSmFAmI6Ufq7B1N3sjtbSLIdcwS1atd6d993P2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lpVGl9kx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761150358;
	bh=dAFQDps3eAP+w+7ZBAZcwTH8VtKHFGKFfeZJsJy7sx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lpVGl9kx/30E9ellazr/4+Sc+PKcpbRIBmSqb/WJXovq8sHym+ht6G3Rc5gje7rtt
	 cEJwqOkZepVREbBztWFTu8Cvgf+aJJLx5bW48mSZ+/J8yZt+CepAScyJswLGqVkNLW
	 hv3wAsrPsK5CL1CI3Q1hGnO99snrHe8pmO+MHkoOt1eNMLSX8lgIthNK1SIPvu4Rod
	 qiKWE4b5gpA4Wf5Ypx180nS4Jbg00TNm8aT7ebty0FWJ6UpSllxKY9U+rWOPEXtwP9
	 tz9iJ9DTC9GFv+jmmTkWgFE/0VFJ5UN6XP0T/GogDsJUCwpCUvvcwEOwoH4D6oEp54
	 r0+lGezxyLQ5g==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 999BD17E1407;
	Wed, 22 Oct 2025 18:25:55 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v3 10/15] media: rkvdec: Support per-variant interrupt handler
Date: Wed, 22 Oct 2025 12:22:09 -0400
Message-ID: <20251022162459.271603-11-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022162459.271603-1-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preparation commit for supporting different variants with different
interrupt management.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++---
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5dd486edd64d..b0e90c9b826e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1218,10 +1218,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
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
 
@@ -1242,6 +1241,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	const struct rkvdec_config *cfg = rkvdec->variant->config;
+
+	return cfg->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1260,6 +1268,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 static const struct rkvdec_config config_rkvdec = {
 	.coded_fmts = rkvdec_coded_fmts,
 	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 };
 
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 74f71542e031..dfafb2c2cbc1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -121,6 +121,7 @@ struct rkvdec_config {
 	size_t coded_fmts_num;
 	const struct rcb_size_info *rcb_size_info;
 	size_t rcb_num;
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 };
 
 struct rkvdec_dev {
-- 
2.51.1.dirty


