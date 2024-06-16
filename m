Return-Path: <linux-media+bounces-13315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2E909BE7
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 08:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4449A1C2192B
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 06:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559BF16EBEB;
	Sun, 16 Jun 2024 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="rg2EbreW"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-213.smtpout.orange.fr [193.252.23.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D04964B;
	Sun, 16 Jun 2024 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718519413; cv=none; b=BuS8cXVRR1L3ie69x5QdbbprLqyJiHZ6ANgol7FPjUmn1/r0iLy7cAiADwTsghA348GHqapj/5eXOgNHO1+QJoBhA/0Z3Xd8GaNz78xoCFp+VXLEjTYiOW6NLVreIyWROOQL09y0e0UNftEwxkFxzb46JuU/rTxMUGVTLsoAQ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718519413; c=relaxed/simple;
	bh=pxJeMPW3g8ImkUOaHZgYePOc+3YDEu47VuMV7SEKRd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYLnQ8COKydQQCm/6L/o00ldI7sCBgpWdm7PD8CWkaoigrIdZz5/ODTqxIgLqTLjV4qxdkpJpsX2PN5q5UCj16OLC4vHXOtNWCpwM4qQu1thYKDfi90239b0kn7aYO0a7og2H6bC9s/TRfE+uU39LEwVCFxKMFMih4zFOSf0eMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=rg2EbreW; arc=none smtp.client-ip=193.252.23.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IjOnslpBNuDOGIjOosKnZ7; Sun, 16 Jun 2024 08:30:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718519401;
	bh=BZdNCJale1sAYar/lNgv7jhcbE0JwVL5zwO6Cn6gmyw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=rg2EbreWAr3rwLbSKWM2aGPQ27F5BU/0+zACNx0m/u13ozGipFNEyUPcfuWV3L4he
	 Pls145IPvwru3XhizaxUCF6g5yFSPHHQG30mmSLo1goKcyoV4e+Iy9stoHkWEOZLS1
	 nCdJuZWWH4xF1mOxIutvve7MVUKuFiy4cxamXz3x3yqmm0M28Pru6qIPUG4DItIBlc
	 TJfC+E/OFDVWOVJEiMVhTMrz+WYSOE9B5K6q/+sF5U/EnYkbLmqdZizL+kyh9GL2p/
	 QGyakLA48LlJdSXyopgKfcMG+CMT0ZRpKRN/ZwOxHOlgdHCDp4HcLxOjayYE0n7N0d
	 +qreeYd83Xo/w==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 08:30:01 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Constify struct vb2_ops
Date: Sun, 16 Jun 2024 08:29:53 +0200
Message-ID: <fc20e4271a4c98c6106d01eb1ada3f4da217e56b.1718519365.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"struct vb2_ops" are not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  18059	   3096	     16	  21171	   52b3	drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  18171	   2968	     16	  21155	   52a3	drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c  | 2 +-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index 11ca2c2fbaad..e62c1c18758b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -595,7 +595,7 @@ static void mtk_init_vdec_params(struct mtk_vcodec_dec_ctx *ctx)
 	}
 }
 
-static struct vb2_ops mtk_vdec_frame_vb2_ops = {
+static const struct vb2_ops mtk_vdec_frame_vb2_ops = {
 	.queue_setup = vb2ops_vdec_queue_setup,
 	.buf_prepare = vb2ops_vdec_buf_prepare,
 	.wait_prepare = vb2_ops_wait_prepare,
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index b903e39fee89..3307dc15fc1d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -854,7 +854,7 @@ static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
 	return 0;
 }
 
-static struct vb2_ops mtk_vdec_request_vb2_ops = {
+static const struct vb2_ops mtk_vdec_request_vb2_ops = {
 	.queue_setup	= vb2ops_vdec_queue_setup,
 	.wait_prepare	= vb2_ops_wait_prepare,
 	.wait_finish	= vb2_ops_wait_finish,
-- 
2.45.2


