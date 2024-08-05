Return-Path: <linux-media+bounces-15806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E594850B
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625C71C21DEF
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCB516EBF4;
	Mon,  5 Aug 2024 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h4t1huwM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD07165F1B
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894698; cv=none; b=CnLbcXEv274DDO1ZubffrQel4BjEIeDpwIqCjc1uQo9mX21AAVUOP7Ll2APO7Fc/MNl9EI6yh4hoe8X0O2+UCI+pctLmdbjA3ZYvzKvYR3CSY+1wG1w8yE3DZHxR5/xXmNlOBbOSKi6fz1oLlAgFna+GR9gLki1JrpplbI8xOhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894698; c=relaxed/simple;
	bh=nJ1vUo2Ufp68zcuf1iqmoZKx5P1bR6GonT+G1DeZl7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xw8ykEux5cw4OQ+EVhAnW5gaXthvBLgmOPA20FG/ANVoUkwHCXf0go7zY+aUVoZbgfyyYCLMXEU2I6kHEMb56SjY6FDKJvkm9mDD5N2AIa1bnsgcM5fvwMMqt1+3VFF3jDNOe168gsPYr9H3hrpgd2e09VMxOU7KmapFYUEpSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h4t1huwM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LKaIkakCgP1OJn4iZqkkYHeziSGxZPmIwKaM52VVkTg=; b=h4t1hu
	wMTsC9qc3C62TVIeqEMaY8+r5sMMSzM6uVLCks/6/s2gcfVmHLWFGslDo+/DL5ZX
	8fQBRD0bx/TH7ibjtPGxRsYfZFSRsbyQR5PD5PEK2krIinLg/vyrTuPycKaSe6nQ
	0antjRyQ4njYi/5T+hdQDPFZWzPuE87Kgnmsb58fZ15aO71Vou28g//dj601/bwU
	xkpQIKrIGdXN5JXM38nsQAtDDU2UPkJ0yZpP4RC1U1nwoUOMT9QJw1Lc2d33cEg7
	/dt36q75UQRBiji0CXiYWR6L1sFUXgpufLNgTpLiVoWUA8bJ3/rOiz/cIMJRRvQ5
	st/Pj9rKvSyyXneQ==
Received: (qmail 18193 invoked from network); 5 Aug 2024 23:51:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:29 +0200
X-UD-Smtp-Session: l3s3148p1@e37srfYe5JpehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/8] media: fimc-is: use 'time_left' variable with wait_event_timeout()
Date: Mon,  5 Aug 2024 23:51:17 +0200
Message-ID: <20240805215123.3528-5-wsa+renesas@sang-engineering.com>
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

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index aae74b501a42..adfc2d73d04b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -822,7 +822,7 @@ static int fimc_clk_get(struct fimc_dev *fimc)
 static int fimc_m2m_suspend(struct fimc_dev *fimc)
 {
 	unsigned long flags;
-	int timeout;
+	long time_left;
 
 	spin_lock_irqsave(&fimc->slock, flags);
 	if (!fimc_m2m_pending(fimc)) {
@@ -833,12 +833,12 @@ static int fimc_m2m_suspend(struct fimc_dev *fimc)
 	set_bit(ST_M2M_SUSPENDING, &fimc->state);
 	spin_unlock_irqrestore(&fimc->slock, flags);
 
-	timeout = wait_event_timeout(fimc->irq_queue,
-			     test_bit(ST_M2M_SUSPENDED, &fimc->state),
-			     FIMC_SHUTDOWN_TIMEOUT);
+	time_left = wait_event_timeout(fimc->irq_queue,
+				       test_bit(ST_M2M_SUSPENDED, &fimc->state),
+				       FIMC_SHUTDOWN_TIMEOUT);
 
 	clear_bit(ST_M2M_SUSPENDING, &fimc->state);
-	return timeout == 0 ? -EAGAIN : 0;
+	return time_left == 0 ? -EAGAIN : 0;
 }
 
 static int fimc_m2m_resume(struct fimc_dev *fimc)
-- 
2.43.0


