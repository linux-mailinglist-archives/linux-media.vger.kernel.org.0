Return-Path: <linux-media+bounces-31538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B88AA6480
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8AE1883D21
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7D923BF83;
	Thu,  1 May 2025 19:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oDBFpjb2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9BE2367B3;
	Thu,  1 May 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129375; cv=none; b=ss6cDCeKEA4rSwdjrqVPE0sdDJyywvqHCclm4ceScdHVT8UTv/psq7+Lq+b6XDwMQWw5Kl9zuDq3hh/BdCnNLR46E+tO4HY1xXUvY5EnfAMMx+iCt8aJiDzirl/Dcy2Dp2px6Y3nUcZG7Sgl3XjJoE1Pv3NgEixIVRNovbr9tRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129375; c=relaxed/simple;
	bh=aeUagMt9j8V0x7zgrJ7xP0jWmkoNz11VjTWuvk0eDDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isd6y6OAbJ/+YaGMoXWsfsD37mK40fGuIprMrnqAAwc1PR6wsCpjunsDt+2dEObzzPJ0mEeM68zd5tSfywtlvi2jVKXJRMjFA32DS+pMdY6cvVuKxvIB8J9nx8716f7t2w7ivxd9GHL27xDP9VevIivhHrpypgcySSfFgl5wOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oDBFpjb2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746129371;
	bh=aeUagMt9j8V0x7zgrJ7xP0jWmkoNz11VjTWuvk0eDDc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oDBFpjb2/InFEqWx+LkSnpjseD+S8IIZPtE+mz+w7c/xo2E/9yo4ggRHdeAzb8vwL
	 Q71ClFeVpUT1cQB4LMjd3bc5weEbzKo3ql01LCYNWeb7KqvwHcNm9un7IWJ4+P+WzO
	 b/MKlczz1KHEpcYA2YSmIAlwQiLbBznfRPWwLm0Bg9h+/GqefRfcpmu8K9HfgLJTKZ
	 nQ0wbHVg4rlIvTxEUb84IXUmnXmqUosxaLMjYCgNoiGH6sOuoI/ANuSMQhljdgJofk
	 YFtAvpp3E8/Bx1IpBgcj5mclMqSaf1U8b66/dk/W3JodchOle1nl1zSTLDptZFDAJ1
	 UO7PpLKJ/QumQ==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:8242::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7134317E0C8C;
	Thu,  1 May 2025 21:56:10 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 01 May 2025 15:55:48 -0400
Subject: [PATCH v10 2/4] media: rkvdec: Initialize the m2m context before
 the controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-2-c380ba452108@collabora.com>
References: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
In-Reply-To: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, kernel@collabora.com
X-Mailer: b4 0.14.2

Setting up the control handler calls into .s_ctrl ops. While validating
the controls the ops may need to access some of the context state, which
could lead to a crash if not properly initialized.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 65c6f1d07a493e017ae941780b823d41314a49b8..7b780392bb6a63cc954655ef940e87146d2b852f 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -871,24 +871,24 @@ static int rkvdec_open(struct file *filp)
 	rkvdec_reset_decoded_fmt(ctx);
 	v4l2_fh_init(&ctx->fh, video_devdata(filp));
 
-	ret = rkvdec_init_ctrls(ctx);
-	if (ret)
-		goto err_free_ctx;
-
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
 					    rkvdec_queue_init);
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-		goto err_cleanup_ctrls;
+		goto err_free_ctx;
 	}
 
+	ret = rkvdec_init_ctrls(ctx);
+	if (ret)
+		goto err_cleanup_m2m_ctx;
+
 	filp->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
 
 	return 0;
 
-err_cleanup_ctrls:
-	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
+err_cleanup_m2m_ctx:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
 err_free_ctx:
 	kfree(ctx);

-- 
2.49.0


