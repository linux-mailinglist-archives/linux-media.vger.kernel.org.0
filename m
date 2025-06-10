Return-Path: <linux-media+bounces-34404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB79AD3217
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352B716EDE0
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19A128A708;
	Tue, 10 Jun 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODPsLHWn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5D27FD56;
	Tue, 10 Jun 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547926; cv=none; b=e/UNGl0JbiKuizNPzeqtDvjpWLOm26lFnBZK8WgRLRSy6ALjXpr5Ptf6yg159CnRzZbgPMM5hcSQHcZTEYnbRlI9qlICKdcMsaAZIYVbEkB0b+fhyI349Hq/ay02IYahodN9wNyG8mfTF800KmiEHqyjWiW2cJFt6lsLsVAiu74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547926; c=relaxed/simple;
	bh=UIVDYVCfkXYdQKg+JzIWbx5aKZWOpeiPIbE1ZtnzTh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=haqe/7ANCY/4hH7y+O9+2SqL4VCMdnJDwwyPqqrvarCo/XlP2TeChfchoi+/ksUz3v6cavheO3Ze1IqWYbNlCC4xVMzKT1pwMOZn4t7H1uCIhNF0krR6k6b0/FyoavlIRCAtHOWMR4GDJM20dPsydF8fBX7Rmgtj2pQDdXl+rag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODPsLHWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A2DC4CEEF;
	Tue, 10 Jun 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547925;
	bh=UIVDYVCfkXYdQKg+JzIWbx5aKZWOpeiPIbE1ZtnzTh0=;
	h=From:To:Cc:Subject:Date:From;
	b=ODPsLHWnEGPj51M8X+WShetoHBGztO9IuHayMjIiqnA2/05Y8GZJrHm0J5htsVVgC
	 rZ6kBVNz7NqYeHiZog9F5RZ2G56mKvM1Ey49nDO8+/x1Zq1PjeiXR6MSL6YzoYCRRF
	 gqTs6W14flVOWO2prg69erRMmNajgMvxAL4W1vmNk0fm+0uN+BsNS+RowBG+4KGA7P
	 aVYIsgIIgkZUCJr5dvK+afWgAnO8cBsiZkSDKHEMksAYCKaxuRQRxoDkQ4okrqewnk
	 yhBEqy8WTy7C4nhpUHGNunRYxaqITPhl6kwYFsOACInMuRGYGdK/gr+SAeTl7bOZcI
	 0PSrHLmoRTluw==
From: Arnd Bergmann <arnd@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] st-delta: avoid excessive stack usage
Date: Tue, 10 Jun 2025 11:31:56 +0200
Message-Id: <20250610093201.2645325-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with a reduced stack warning limit shows that delta_mjpeg_decode()
copies a giant structure to the stack each time but only uses three of
its members:

drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c: In function 'delta_mjpeg_decode':
drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c:427:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Open-code the passing of the structure members that are actually used here.

Fixes: 433ff5b4a29b ("[media] st-delta: add mjpeg support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../platform/st/sti/delta/delta-mjpeg-dec.c   | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c b/drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c
index 0533d4a083d2..a078f1107300 100644
--- a/drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c
+++ b/drivers/media/platform/st/sti/delta/delta-mjpeg-dec.c
@@ -239,7 +239,7 @@ static int delta_mjpeg_ipc_open(struct delta_ctx *pctx)
 	return 0;
 }
 
-static int delta_mjpeg_ipc_decode(struct delta_ctx *pctx, struct delta_au *au)
+static int delta_mjpeg_ipc_decode(struct delta_ctx *pctx, dma_addr_t pstart, dma_addr_t pend)
 {
 	struct delta_dev *delta = pctx->dev;
 	struct delta_mjpeg_ctx *ctx = to_ctx(pctx);
@@ -256,8 +256,8 @@ static int delta_mjpeg_ipc_decode(struct delta_ctx *pctx, struct delta_au *au)
 
 	memset(params, 0, sizeof(*params));
 
-	params->picture_start_addr_p = (u32)(au->paddr);
-	params->picture_end_addr_p = (u32)(au->paddr + au->size - 1);
+	params->picture_start_addr_p = pstart;
+	params->picture_end_addr_p = pend;
 
 	/*
 	 * !WARNING!
@@ -374,12 +374,14 @@ static int delta_mjpeg_decode(struct delta_ctx *pctx, struct delta_au *pau)
 	struct delta_dev *delta = pctx->dev;
 	struct delta_mjpeg_ctx *ctx = to_ctx(pctx);
 	int ret;
-	struct delta_au au = *pau;
+	void *au_vaddr = pau->vaddr;
+	dma_addr_t au_dma = pau->paddr;
+	size_t au_size = pau->size;
 	unsigned int data_offset = 0;
 	struct mjpeg_header *header = &ctx->header_struct;
 
 	if (!ctx->header) {
-		ret = delta_mjpeg_read_header(pctx, au.vaddr, au.size,
+		ret = delta_mjpeg_read_header(pctx, au_vaddr, au_size,
 					      header, &data_offset);
 		if (ret) {
 			pctx->stream_errors++;
@@ -405,17 +407,17 @@ static int delta_mjpeg_decode(struct delta_ctx *pctx, struct delta_au *pau)
 			goto err;
 	}
 
-	ret = delta_mjpeg_read_header(pctx, au.vaddr, au.size,
+	ret = delta_mjpeg_read_header(pctx, au_vaddr, au_size,
 				      ctx->header, &data_offset);
 	if (ret) {
 		pctx->stream_errors++;
 		goto err;
 	}
 
-	au.paddr += data_offset;
-	au.vaddr += data_offset;
+	au_dma += data_offset;
+	au_vaddr += data_offset;
 
-	ret = delta_mjpeg_ipc_decode(pctx, &au);
+	ret = delta_mjpeg_ipc_decode(pctx, au_dma, au_dma + au_size - 1);
 	if (ret)
 		goto err;
 
-- 
2.39.5


