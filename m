Return-Path: <linux-media+bounces-12447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88B8D7E9E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5C81C211FF
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BE784D09;
	Mon,  3 Jun 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ikqnVyD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46181730
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406939; cv=none; b=qP5pxxHECGzBSFU3s9UuRonqYtrW43Fqw4TyeWZWIydpF5sfwdAjp1MwNl8zmLQTyEDZ33h6+dDqR/tSE2BRX355G/9DRcaLq5JUnaWDH3n74NtK5/qJd5ewf2Y0sgd4I8uNERt3LJWWP60+9Frdo4JakGLOprW9kbZL4+462ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406939; c=relaxed/simple;
	bh=Mnmt1ogL9b7vULUwW/DFVNwc/+O/QYY2bGNMf1Qj9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOHc1mTro0TSz2TKymnYMF7s5hCrHoVRV2NfF/8gU/heF90OPshfZSHnWTET27cA58F2HCc8xzqJvzK/2ziYbTk+2ofnFZxIIvjY+juZri6EgOe+jP3TpIe7f87U5n+scBWBpMcye9jaUoV6/CCbxyaJ+JGWTH1E49a3ZHQ57AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ikqnVyD0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=A8oaKiWsS3ONtbUCaXMsPkJITTTFUHiuQzwOzERPisU=; b=ikqnVy
	D0A3MUpqKSyfow3btR4Hat4yA9Ct8sqzLtY7C4EtypSFiV4mhzzQwdPl6XuHMc3j
	+6IW793Kbud9/v+HoiZSdbn0nf51seTj6ACROWLEx4BMFo6g+cBcljouIe2ACkRu
	Ju7k1xeK8ZQe4XUdLc1wK3R1FcTWLjbQdzioXYlYaqndd0gP+EHONgNqX3qFvxDD
	58kWi5A1QUR2KE5gP02NrH9TPKqjrBWk4l9h9/gLr0/kqwkGvgP/CI//J/x89gg+
	auRMZsQJ76BUwJv2ic0P/h9ig7d4EA4/OD66XlePb5BjkkHdublFgcXpRk9o0cFW
	Me/tDDPJ3bZ8NuyA==
Received: (qmail 1903325 invoked from network); 3 Jun 2024 11:28:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:53 +0200
X-UD-Smtp-Session: l3s3148p1@v/sr9vgZUNcgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Benoit Parrot <bparrot@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 8/8] media: ti: cal: use 'time_left' variable with wait_event_timeout()
Date: Mon,  3 Jun 2024 11:28:39 +0200
Message-ID: <20240603092841.9500-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_event_timeout() causing patterns like:

	timeout = wait_event_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

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


