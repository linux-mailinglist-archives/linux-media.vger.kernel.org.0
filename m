Return-Path: <linux-media+bounces-19744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D0A9A072A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C661F2828B
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C23208D64;
	Wed, 16 Oct 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tqetwn/j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D612071F6;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=MZk0g0gm4zoAJGSk9YyNrG5Q/x1AJCEU1TZ09XcQLiSkWHL/bv9ixJ2aYDO3iAiLEfRQKJrzagAaHErMOuXyVPgkZwjnkF6SY2PgGpyLLUMXRImig0rbTep5aXYybkcq01UkrlATFaVX0X26CvFTi9qG3ceaS8Lu8typnjyTNpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=vq7QJpYiMutw0B1hm8O24dEVpiMZEcoq2f2zZUsJPKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogPno82wIrTFns9B7mE0AWGU4JbsiH4Z6roIVESAnTu4ZoKyxVnBDfYLFQv9o1eCN7S51KCzxsZ4xpkiDVVj8FOrXZQEkv0Dd/0KX3cJM1W0S8x/34SmfU+KXogTIxhiqozq6pUT8QOD0z6h0fFfjsgs15rWUA+NM2IwTfhT79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tqetwn/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFBAC4CED8;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=vq7QJpYiMutw0B1hm8O24dEVpiMZEcoq2f2zZUsJPKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tqetwn/juQJdGucRqIq2PBHKkF6EhDe0jorxR1wAuGRT8x4mtvPN7XbotVG9V6Zas
	 SDr1HPBnZtzyBTAfPvF6dzNlnlOUQeNR0QY7eTVU9dX6B6bxJL/o/QNNofN5shoixS
	 NuD1fCyAGjZqaeaabqW7arDwj2rDYrF+cRr26k6aa4oWL/SYAgYwyR3HqSNPH9T+Z/
	 4ERp9I5ylUvFxFLLXi0yR0nqLIIk6xGOv8zeW0mdcTd3/46kyg8jMvVduR4jbDYU7J
	 rucX1GHCD7hafdpkKQFfigEkirt+8Z3apXboak1SqQJfOh18mvxcWcDRtqC0K3JPmb
	 q8Z1SBAdukJMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Ymt-2ZRN;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 08/13] media: ar0521: don't overflow when checking PLL values
Date: Wed, 16 Oct 2024 12:22:24 +0200
Message-ID: <39b23d468eea2714a24a94cb6c20aef5aff492e6.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The PLL checks are comparing 64 bit integers with 32 bit
ones. Depending on the values of the variables, this may
underflow.

Fix it ensuring that both sides of the expression are u64.

Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ar0521.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index fc27238dd4d3..24873149096c 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -255,10 +255,10 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 freq, u16 *pre_ptr, u16 *mult
 			continue; /* Minimum value */
 		if (new_mult > 254)
 			break; /* Maximum, larger pre won't work either */
-		if (sensor->extclk_freq * (u64)new_mult < AR0521_PLL_MIN *
+		if (sensor->extclk_freq * (u64)new_mult < (u64)AR0521_PLL_MIN *
 		    new_pre)
 			continue;
-		if (sensor->extclk_freq * (u64)new_mult > AR0521_PLL_MAX *
+		if (sensor->extclk_freq * (u64)new_mult > (u64)AR0521_PLL_MAX *
 		    new_pre)
 			break; /* Larger pre won't work either */
 		new_pll = div64_round_up(sensor->extclk_freq * (u64)new_mult,
-- 
2.47.0


