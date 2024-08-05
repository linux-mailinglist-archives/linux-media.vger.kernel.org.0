Return-Path: <linux-media+bounces-15811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D061E948511
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3C42818A4
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA6616F288;
	Mon,  5 Aug 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RdK28723"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458D116F27E
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894702; cv=none; b=LdTyVD2R0oZb26JF3OGGTMWAPnJZgzaT21/bknQkIP6IHhWc0n1RE75NPheEjcjnX1OFJMUSrJAReWBFYoGeAB3CWZ6OmzzT4dnlV26g+3bjnWfF8xeiSHWWBaaljb5LRl65gTeny0qsJeLp9iusmetOifXnr6slEfM+oeBUZ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894702; c=relaxed/simple;
	bh=OgVdtJIy89i09AfBu0oT3OGiDSUpwPVcQctDGe9eoiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwNyRlQOUWgpReuL/pG2qef9WcYyDEBDpTO4qSL2+FS5pj29QDF9hy7AjMuD93lDtg97RONrZIJP+8iY94R9ZK0+AmXmVvKTofgms6NL0RFHfCjkO+Qiu8Js2AE0FfGqIG/nVCCaO75qHXGBIrphXfpUm/1ddq8cUUDxVaBvSmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RdK28723; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=n5XKfO5AKcXYHFTAGtk9SFZLBpLN76v4Q2a785qnEaA=; b=RdK287
	23dQ1h0tCygqPs03cHKXCZPuaRaDztXbMqKOB5XHtI5+pPGNgedWUJOlwVQjI0GD
	B4A9oo0vW4E/XBvtwUuXHLLq31WM1ra0L3gbJdARkXHKMxBeE6OmcM0ItbdDZ/7Y
	J2RLTyPnYMBOlv9FDdesh2FSjr1X+4oktn4ZzFWqunu9ysK+9tHxzCWidVRX1mPj
	/iJZ/5nJyc8zTid/s9gGZHGKVTT1zQf63a48g2TWm65vEqAd9o4cZwN5JaWk9ACc
	lZ78eIwjnQlHp91gJvkYSMwdfEpVu9p04PGcHNzZPjlF315imwV7ldyLXXS6NmPF
	jVkW3aM+Zy+P/RiQ==
Received: (qmail 18294 invoked from network); 5 Aug 2024 23:51:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:33 +0200
X-UD-Smtp-Session: l3s3148p1@SgMrrvYeCJtehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 8/8] media: ti: cal: use 'time_left' variable with wait_event_timeout()
Date: Mon,  5 Aug 2024 23:51:21 +0200
Message-ID: <20240805215123.3528-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of wait_event_timeout() causing
patterns like:

        timeout = wait_event_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/ti/cal/cal.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 528909ae4bd6..5c2c04142aee 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -549,7 +549,7 @@ void cal_ctx_start(struct cal_ctx *ctx)
 void cal_ctx_stop(struct cal_ctx *ctx)
 {
 	struct cal_camerarx *phy = ctx->phy;
-	long timeout;
+	long time_left;
 
 	WARN_ON(phy->vc_enable_count[ctx->vc] == 0);
 
@@ -565,9 +565,9 @@ void cal_ctx_stop(struct cal_ctx *ctx)
 	ctx->dma.state = CAL_DMA_STOP_REQUESTED;
 	spin_unlock_irq(&ctx->dma.lock);
 
-	timeout = wait_event_timeout(ctx->dma.wait, cal_ctx_wr_dma_stopped(ctx),
-				     msecs_to_jiffies(500));
-	if (!timeout) {
+	time_left = wait_event_timeout(ctx->dma.wait, cal_ctx_wr_dma_stopped(ctx),
+				       msecs_to_jiffies(500));
+	if (!time_left) {
 		ctx_err(ctx, "failed to disable dma cleanly\n");
 		cal_ctx_wr_dma_disable(ctx);
 	}
-- 
2.43.0


