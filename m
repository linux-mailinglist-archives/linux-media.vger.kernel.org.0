Return-Path: <linux-media+bounces-12445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E378D7E93
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 513431C21522
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F20484A46;
	Mon,  3 Jun 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ui6X3A16"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B68287E
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406936; cv=none; b=iWOIe9Yp/bamUCoZbPKbjEaSKBuPHzQ5G+gvVjB5S2IhA0/IlWcpicr+jZBSMZQhMy6SZ00XP33eZrcARIygWOagWORk08vpYr9W1gct6zzTC9rAYnjULijb70kGivpsk2g8oEO1lT9G4R1Mf7vY08GN4h/XTeQyHxbbm3oVSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406936; c=relaxed/simple;
	bh=cXNr8lvilFqgnUnNUc6PKltH1qdIyJCwlrLCI0cyV1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qadr+BWE2JOk3bvFmNvIduZzI+BZkkT5aC5kgVxArBFCS6iZXcgVaAn7Uc1s3x+ksL5rxho4rf+NYpR7e4zreshWuahFDMvbFpsENUSlKWK5hVoHpcPToz3F/lpDLOITQzKRei9u+sgTMPC69wQbSF4+aX78sXz9Kfe2gIZBCrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ui6X3A16; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zB4c4eCfnz+o1bXx+7F5PGzh74D33KxHOsl6JG4Vi7Q=; b=Ui6X3A
	16IW+rxfswIUoOxPQdNpXJb1qt3Ej/swGYi6cEelNUy/BktzD+4Tpu7wJwctJTNZ
	ItJTxPDmyhlfxRD4fstRaD5jZooxNJcLWCqTNaSTX4PBsYJCqZlV1AqXbAD3icee
	lsCQyGA3knPCwkO75kFOVX0+UIPFAhzwOa9pz/zG9KmMuRzxI2TWUHE6X1nKzONJ
	uv5pxs7ovC83bXEGAdmEomI5n5gYKO9VpyifUCNlqOVoLa9N6AFM+/fn2Htl4lxU
	xwRnPPwCRdoOum2yV5w7b/k7ODs2L8BgriX+kYIyCS1uxEtR3Z+kLN9CrsV0Yn5A
	nhe8Xl1j2VQdAtDA==
Received: (qmail 1903230 invoked from network); 3 Jun 2024 11:28:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:50 +0200
X-UD-Smtp-Session: l3s3148p1@LNQF9vgZPJEgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/8] media: platform: exynos-gsc: use 'time_left' variable with wait_event_timeout()
Date: Mon,  3 Jun 2024 11:28:36 +0200
Message-ID: <20240603092841.9500-6-wsa+renesas@sang-engineering.com>
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

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/samsung/exynos-gsc/gsc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
index 618ae55fe396..f45f5c8612a6 100644
--- a/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
+++ b/drivers/media/platform/samsung/exynos-gsc/gsc-core.c
@@ -1225,7 +1225,7 @@ static void gsc_remove(struct platform_device *pdev)
 static int gsc_m2m_suspend(struct gsc_dev *gsc)
 {
 	unsigned long flags;
-	int timeout;
+	long time_left;
 
 	spin_lock_irqsave(&gsc->slock, flags);
 	if (!gsc_m2m_pending(gsc)) {
@@ -1236,12 +1236,12 @@ static int gsc_m2m_suspend(struct gsc_dev *gsc)
 	set_bit(ST_M2M_SUSPENDING, &gsc->state);
 	spin_unlock_irqrestore(&gsc->slock, flags);
 
-	timeout = wait_event_timeout(gsc->irq_queue,
-			     test_bit(ST_M2M_SUSPENDED, &gsc->state),
-			     GSC_SHUTDOWN_TIMEOUT);
+	time_left = wait_event_timeout(gsc->irq_queue,
+				       test_bit(ST_M2M_SUSPENDED, &gsc->state),
+				       GSC_SHUTDOWN_TIMEOUT);
 
 	clear_bit(ST_M2M_SUSPENDING, &gsc->state);
-	return timeout == 0 ? -EAGAIN : 0;
+	return time_left == 0 ? -EAGAIN : 0;
 }
 
 static void gsc_m2m_resume(struct gsc_dev *gsc)
-- 
2.43.0


