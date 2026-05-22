Return-Path: <linux-media+bounces-62586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO78DfcwEGoaUwYAu9opvQ
	(envelope-from <linux-media+bounces-62586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:33:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 361585B22B2
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FB7B302D31E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947603CE0B4;
	Fri, 22 May 2026 10:18:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EC3CC333;
	Fri, 22 May 2026 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445100; cv=none; b=A4NUkk1EA7FHqD6ZZaOxNQ29zAiESaJCn556lxRA5rNovGQRhfVQ81V5s/O28tZTkF77bHsMVy6jkso52/+D/w0NxIErDbqx7pCDtYKM7fD3f0Kz1m3X34o/0HM4aSlFCVMK/Sm2r5tp1tV8Srq6ng71rN1qRJ3Euq1gqqqgzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445100; c=relaxed/simple;
	bh=H4ahuP7qK6F1laIsAeO9Wq5rgaRo+/IalAB1WKxGgjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBEpijPS8VlQRoYWPkNnPJI335/fj1wh2514AHl1/i+sAqSK066u+HA1s3Rd/R+wsgoYDoiA3oUdTCuMTLYTKigHmBCNbRvq2Q2zLeB3swbZMnVScmGlTHogmLbRWTVaJDtX3wZGwQHAetlZk5tmwZQqYPWnvdEgv4lfAhVsBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5659837002A3;
	Fri, 22 May 2026 10:17:55 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C4CB3B408D7; Fri, 22 May 2026 10:17:54 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id A4C02B408C9;
	Fri, 22 May 2026 10:17:08 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 09/14] media: verisilicon: Cancel job with runtime pm put/clk disable on failure
Date: Fri, 22 May 2026 12:16:48 +0200
Message-ID: <20260522101653.2565125-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62586-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.504];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 361585B22B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The no-pm variant of hantro_job_finish is only good to use directly if
runtime pm get failed. In other cases, we need to do a runtime pm put
and bulk clk disable to correctly undo what was set up.

Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/hantro_drv.c   | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e0c11fe8b55c..e21306f2bf2e 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -169,29 +169,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_cancel_job_no_pm;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_cancel_job_pm;
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_cancel_job_clk;
 
 	return;
 
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+err_cancel_job_clk:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_cancel_job_pm:
+	pm_runtime_put_autosuspend(vpu->dev);
+err_cancel_job_no_pm:
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.53.0


