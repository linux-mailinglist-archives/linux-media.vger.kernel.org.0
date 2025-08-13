Return-Path: <linux-media+bounces-39826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB6B24F77
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 18:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711A98825E1
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 16:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB6128C2D3;
	Wed, 13 Aug 2025 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DS09/O0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEDE28936D
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101788; cv=none; b=C2c7dApOjuJKfmOOzBACuTPxjLb6F+cOrk73S3XLtgZJu7Cv8NZRk1IaZeStaihOitRUllexspWcFAeFsi/H6OHRostz6SJv0VWZcVzvWbwLuizFYHyne1xNcGKRhbbManU+kS/1+MJofkd4GaK6n5RYA1qn3UJYmx6i0pHleBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101788; c=relaxed/simple;
	bh=pHjMSgOtsh/nbyLaYJp+6TvxIZDDcCOz/DAYRFoS+Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pt1lAm71PJZiQK5WGb3zBx2sS7hN1V5FbfSgxeGMIhu92VUl3r+8eqrQ94r0K9ri08Z8a8xvOfTxAU4IAANBKGcwC6nUeO0ulbGhBrSthGmXoKwuCYnwzWI+BMN+zcKmd36lhKEi+wNv9XAZfGt344pO3Tm1X2Q5In5fU85hDTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DS09/O0K; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=p6ifxHkAY/tZiF4oxsD8xCvN6uBTURhwZ8wJ5XnK2n8=; b=DS09/O
	0K686u8BmHmwZpkwG52hEbHrnRQR1VlNss8o/Kvt3SNn0m/QeA3gozRxZD6x9Dks
	EywVc2cwPG9nxSiAdv4sAL60NuHiNuaBEOCDKMh+enjxa8djmb1dt5l/6oaDW1i9
	RA9GFHQA49sFMpk4eeG03IiUZrzqPiojyT905bwXrVC0Gvp8n/iaIx0y03HpZZbZ
	bYZb3BgMj5bDTQaS+lN1JH+LDnpW+FhGI8Dud9HtTdCoP7/VyHjKy1LrYkiYAzk3
	RclIPGqY+XhDG26y+Vi/YG1AvrDAr7EWo46yl9G/SEeoDD3tiep+SU8noFhW2nPH
	/XmMNH9PQthPBV4w==
Received: (qmail 694902 invoked from network); 13 Aug 2025 18:16:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:11 +0200
X-UD-Smtp-Session: l3s3148p1@eqOaeUE8FtttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/21] media: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:54 +0200
Message-ID: <20250813161517.4746-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/media/cec/platform/stm32/stm32-cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index fea2d65acffc..1ec0cece0a5b 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -248,7 +248,6 @@ static const struct regmap_config stm32_cec_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = 0x14,
-	.fast_io = true,
 };
 
 static int stm32_cec_probe(struct platform_device *pdev)
-- 
2.47.2


