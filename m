Return-Path: <linux-media+bounces-31746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F376AAA36B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5975A7B440C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0306D2F0B92;
	Mon,  5 May 2025 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyFhZJcH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7132F1559;
	Mon,  5 May 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483824; cv=none; b=mFYDfLxouAPak8LDxrQ1dMYlF+G/tG4DV1p5N4xRdZw6nYs9uQVuYy6XPwgHyJq29tG6S4oDM0GMiefa3hq2Zr9uyEkDnKAY4Bp/74kn4c0S71/eZmkfzUgxLrtzgZ4CsT9A0Qdw4XcsrhtAXQWrj9i4key86lL1P+pOwKfejcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483824; c=relaxed/simple;
	bh=qH/4V8g1hOBeR0gSsV5ofqM5SOOS8OTnIZ+lszszT/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvCqSWRvTKGXm/ZHuoVkWcI8nuRNniGNFrQR6hWco50rQF8WAcJGREy7tm6R44eck4zamKuQ5OiGSr/Oz8Rdm4Dvs3nBr7VuYai2rPkbbijdRztUt8fMEiTMzls45cQw80XvG2boU192mq/sqdzi+jb/RrgiE/5dByA7zHUQCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyFhZJcH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA57C4CEF2;
	Mon,  5 May 2025 22:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483822;
	bh=qH/4V8g1hOBeR0gSsV5ofqM5SOOS8OTnIZ+lszszT/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyFhZJcHKi4Rzq0SqOnyhx3K91mFnhI2TNrWQXp92NdtonoK6X1fDaMSGVPn3SSGg
	 NxGFZa86FdW9iE5K2BPTrgeO0Dc9r/k6YBUdTS20KfPCDATJb8jZq/cCsmVSSLiEAh
	 /GPDDgp0t2zxkKDsCvCfdI0Osi8VkdFG1yPiKsFdcAbdsGw406+z/2mc9GK8FrmKbF
	 +R8c7rbAS0eKSUsJajfxwd95nMiYha588MQtKYkaUInrpPJnNpygTlHFLjD0Ak7UEG
	 0NQ51wVu0NSxxjpfPGjtcEjStSO4CJYKIdYQi1UyUL4D1/S1pxrYG1E9EcISWVuWED
	 +pVonX0FuMt/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	patrice.chotard@foss.st.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 235/642] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 18:07:31 -0400
Message-Id: <20250505221419.2672473-235-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Markus Elfring <elfring@users.sourceforge.net>

[ Upstream commit b773530a34df0687020520015057075f8b7b4ac4 ]

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 7b3a37957e3ae..d151d2ed1f64b 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -797,13 +797,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_node_put;
 		}
-		of_node_put(i2c_bus);
 
 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio = devm_fwnode_gpiod_get(dev,
-- 
2.39.5


