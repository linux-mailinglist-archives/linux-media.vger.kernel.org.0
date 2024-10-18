Return-Path: <linux-media+bounces-19834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC29A34BF
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9771C232C8
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140C618CBF9;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuxLdK4g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A3187FE0;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=F7BLBQzumm5YDvwWoQV2D28mpqOS8b3UQ43mxx5wXPns2QzrlU2Hy9whed1brHjKO4D9JMvY9VmQsYKBZO607G7rA5AnHctptWYfOCb+0gRvRcaj4DyjYTOsJOpRYctkSq9UR43Zev+mhGSpSTVVOoLQvEVyhEq+IAqjWzMV7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=O3hpbSeOL0uAXgzCljfnSBcEgFxc7j1/lfQWoHbchgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckx6xNybMmsWtyAAeOALr9av6WKuD/Okg17OpJMnQGeA66xP3IWnQ/BmdEQQQVTTNvefzzA1HYYYbbpNgJswZ8c7/amQDIcU04XhyOPP/RuAXMmGxAf3tnRCc4hTbdmtf0aV4ACSCQ660d71oFCJlZh7wuk8ORjzUgSJ1Rh544Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuxLdK4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7034C4CED9;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=O3hpbSeOL0uAXgzCljfnSBcEgFxc7j1/lfQWoHbchgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cuxLdK4gBqS2R0swC80bPRnaFtVyfJxdsfDtSfTKX+y6+suQ6QP83aHyUQMfMmrMm
	 2xcCh/m61LZydV47EM0tej5yVlJY1xx+UfW10I2dvTZ6bg9SfUafUkWVNdoKtHqmoU
	 2u9Da5GzfToHh0c6E+NQeT6F1AB8YTilpx78F91EmWCpWZ6/C0fXhOMM2ZNMc/NFg2
	 q3QczZuUuZfNeNoAD1KpQqWE1cdhAF7TZ8JUMpRjkpJ4tTWnavEhgdQ5LEKuWoK7kW
	 upy1qWsY8aCS4kWDMmL1AVUfK2Ko53Y0aFdHYJXwK1wyxNQt9ZTryW3YCxiWGbw+UV
	 OWGDADwHx50Dw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005MeP-21Cp;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 08/13] media: ar0521: don't overflow when checking PLL values
Date: Fri, 18 Oct 2024 07:53:10 +0200
Message-ID: <384bc1320658b93b43838a337b37d52dc8485df2.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The PLL checks are comparing 64 bit integers with 32 bit
ones, as reported by Coverity. Depending on the values of
the variables, this may underflow.

Fix it ensuring that both sides of the expression are u64.

Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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


