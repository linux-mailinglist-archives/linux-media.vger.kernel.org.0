Return-Path: <linux-media+bounces-24925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B710A167F8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 09:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE60F188172E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793E0193425;
	Mon, 20 Jan 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FUKDh3J/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD51192B8F;
	Mon, 20 Jan 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360827; cv=none; b=ecovhmbaUwBjvqnktEFZxNBXhlUriKGd6KDipLUYNl0og/i4zCpUG/J2IzLglDJWbvAigLWh4aEOsfezi0PZ6KsiNf4bDOf9Wko4DFDieVqbOdpuBKX/ZalYNGeO2qMTAc5RNWOujTfuS9HxXQvMlPd+znOkC+R/0R8uphWLZ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360827; c=relaxed/simple;
	bh=qXCeVQ5H7LQ7GV9ZiOCU7aRKOsXYeiDIV9jkxvusI90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvdG/w0A6wScGKRhR83PhAYyeY3JVB5RcpQPDycSLVVmSQKJ+0rvAl2J2qfAQa/2xcnf0N5eOVUXvoteE+KfkJ4HFDWPdNwOJlzG/DiWkp801mgO3er1AI6uLh8HCjUWjmOxZ2Gh1mLCwKIuh5797AMG0OH87kGmRWjsPM/SJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FUKDh3J/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737360824;
	bh=qXCeVQ5H7LQ7GV9ZiOCU7aRKOsXYeiDIV9jkxvusI90=;
	h=From:To:Cc:Subject:Date:From;
	b=FUKDh3J/liYtduke1N2SldZiXwfCzD33utuST0ElE6EwV1JYf1iR07MRM/TtsZG30
	 HiIBDxPkSm2skdCSOCTl1WPHxoL5VJSKkEljiaXWOUyV3D0x0HaOQawybCMV3m59PD
	 M0drqpxLcUS5neYZ/gjA6EZJ05B4phBxWGh7uZFWAtohkaHzhQiixU7OOSfLLWrAsG
	 rHhBlANqItIlB6+nglP9X0cFt/9cmtlfy85Ixu2ZEOZTZygsqNTgeALFI/w0ar1j19
	 rk84cdlnl2wlbJjSaPxIWn0gpXlMtk5D8Mej8e8unOxwmGVxpWwe0ZPI524GuiKrig
	 yKhFJopcI3+MA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:fb75:b420:7f1c:508])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C52CD17E09AF;
	Mon, 20 Jan 2025 09:13:43 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: VP9: Fix typo
Date: Mon, 20 Jan 2025 09:13:42 +0100
Message-ID: <20250120081342.66853-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change headres_size to headers_size.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 342e543dee4c..82a478ac645e 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -776,15 +776,15 @@ config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_para
 	      struct vb2_v4l2_buffer *vb2_src)
 {
 	dma_addr_t stream_base, tmp_addr;
-	unsigned int headres_size;
+	unsigned int headers_size;
 	u32 src_len, start_bit, src_buf_len;
 
-	headres_size = dec_params->uncompressed_header_size
+	headers_size = dec_params->uncompressed_header_size
 		     + dec_params->compressed_header_size;
 
 	stream_base = vb2_dma_contig_plane_dma_addr(&vb2_src->vb2_buf, 0);
 
-	tmp_addr = stream_base + headres_size;
+	tmp_addr = stream_base + headers_size;
 	if (ctx->dev->variant->legacy_regs)
 		hantro_write_addr(ctx->dev, G2_STREAM_ADDR, (tmp_addr & ~0xf));
 	else
@@ -794,7 +794,7 @@ config_source(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_para
 	hantro_reg_write(ctx->dev, &g2_start_bit, start_bit);
 
 	src_len = vb2_get_plane_payload(&vb2_src->vb2_buf, 0);
-	src_len += start_bit / 8 - headres_size;
+	src_len += start_bit / 8 - headers_size;
 	hantro_reg_write(ctx->dev, &g2_stream_len, src_len);
 
 	if (!ctx->dev->variant->legacy_regs) {
-- 
2.43.0


