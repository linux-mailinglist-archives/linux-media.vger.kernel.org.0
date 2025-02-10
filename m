Return-Path: <linux-media+bounces-25907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F860A2EBBE
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CBCF188615C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52291F7575;
	Mon, 10 Feb 2025 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2vtlw12"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA41F7060;
	Mon, 10 Feb 2025 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188002; cv=none; b=FtO6iV5kRRi3zyPE6STmeaFcVGaIXLDfxj+do986mKTgRdamEzhkKwfnQ6qENSyQ/lIRolUACAav+fjxqU75IeFn79rICWDkfBDx9fpEuaZeXDSVYd3b/z0k8OHr48dnlBHpKE83qwBHgyBQCmg2ycwl1OO8qcuDpWY58znt50w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188002; c=relaxed/simple;
	bh=IkMF0n7MKdUNN8xQh6JlNCT4oSGo+0zV2gkJGAExEgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N6K814zTIp7BU7LXMim7dBies8ZpNYHc1py1TnJ383NjJOZShdscDBOJ//sLVfirc4FhiqzOOr6SoPwOND5vr2G0gLj8sZ/WG1GLui+x1B322sz8Mlg3moV2jnLTgO9inp7/20WWia+k0GRAfmg6yX4ooPnZRXsRTgPhkC/t4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2vtlw12; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so113071266b.2;
        Mon, 10 Feb 2025 03:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739187998; x=1739792798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rF22zAvBGpv5Tb+cbF1nWCHUWRiZC8kh/HmTUzcCedM=;
        b=f2vtlw123OM0NVFG8DIjbP18u3e95ywYqCxx6OKUaxAXm5wSs19qfvxUq3/Jodhi2/
         014thwAMLdWFl2wdZybNIU6lLqjrdc2rPx10Kp98a7cj90GHGOu653fDqmDJqgODnvhX
         QmhiMLIeYzg67Qos+eN4DyqIGYx5aJTa/5t2v4y4O2/kS4a4yWQKzcXKluox4nBwJDTY
         2E11QlTZywvD1GokMxOT8oplYVP8LpUHC04S0AdCexyAWcaDL5Uzon64DvYX1y4a+mN1
         H3F3lBAf+j3x4wHkYVbDMrEuF6bNWiwjKZeqFAJ06nzieJ8oVuHyEtROs01+ITqUwSvQ
         47aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187998; x=1739792798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF22zAvBGpv5Tb+cbF1nWCHUWRiZC8kh/HmTUzcCedM=;
        b=EP6DtJXPs2R7X36D83/dDN4vVSWE91ZJTdRD8lThoEAtG5TnQuvXB2YkVymKnlH5UJ
         JFVnLLYYR6mPaVXyc/sAD/BlYeO9Uoic4mOAXKLREHgY1nmXinUBLbnT4iX6epUJKKJK
         TX9LsrzTHsol5tgLyPYsBxuLverVJ9s5ddC+e1ZcElWZsWRtQkUkrQ2qzp5jR2rTVpwN
         Q8r19fKm3jb65EwcHCwjJW9v+sEwa8UHLpL/O6ZaePWzgPx6njmeORpRNXkbJ5XCWHEY
         7kMlmYo6D6lEIpk2WLvyp9cvWeUQ/9m4Rl8bO8/7w+gfQnpp5l18fHz0XWl6mSVGZKUE
         aoWg==
X-Forwarded-Encrypted: i=1; AJvYcCUsmi2LtQwF4deHcsK/EWwyHlFL0llH8c0FruWdA2YjSBzB+fPyX+uG09TXYHDUOXhLToEPQGDhThcGM37r@vger.kernel.org, AJvYcCVLQowdPBRQEke8fUJC0nFsunBKTLlbku0JoufjLz27B91UE1n4dE5Jwt4fHy4248pLNhI9vmiSGo9SwWs=@vger.kernel.org, AJvYcCXeSt9zxBLPsmDUSAewb3BPIem7dhcyivp+lADci4mrHiocnUokeifI99V9SYdMnIciKxg96WGdGq3P@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPOAgNh4Ur42QzkoZ6NrSGCOAfQNYsoMjPV7sfDOago745TTj
	mPsR8fZ0TMcQvznh1gRevsAM1i0lvPfFF0YF7CK2U7P9HyGk1s2s
X-Gm-Gg: ASbGncvL/ltq0SiQfyAOxCH8ZkGKn39ZJv8sbeebsCRgIxKDVa+RFOFD6LhSktId+YO
	BlFC6W3+8zIpnWvUNyOS56EB3IjQ7ozHwm29WZDnjYirAQ94myhycZyHkDtuNLT3o/NEnRQAzz1
	1wgMVfDBd8pPLdeb3aivTgliAFRVCKIX/Uc28DO+eL0LDaEJg8et+spTx4S0wVLcDVQ9GR6RYRV
	OgSmRguNunPSO/OCnSTGJNh/z59IbMUlyVOd/10KeHnTW0l0++tCeczYCsRsMcLDQ04wq2fDBKS
	BZ7ZZTV26+dgR9Tqxs45IZ+FGpB/idPJYCQJSZVJSHqpniQwS2KnSVgX9GD0LoT2RK+zoSDLTty
	kP/MpNAw7yqJNPXphbG3WgKzcvIw=
X-Google-Smtp-Source: AGHT+IFuaL5cqIGTztKLZF6XwPMKmANIqJLVQA65gpv+Xf96dIfnOl/54T8TfjWrTFO2vP1a8RLITQ==
X-Received: by 2002:a17:907:d204:b0:ab7:b589:4f9e with SMTP id a640c23a62f3a-ab7b5894fe3mr517154066b.39.1739187998399;
        Mon, 10 Feb 2025 03:46:38 -0800 (PST)
Received: from tom-desktop.example.org (net-188-217-54-237.cust.vodafonedsl.it. [188.217.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a9e6e06fsm428948566b.80.2025.02.10.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:46:37 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
X-Google-Original-From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable for struct device in rzg2l_cru_probe()
Date: Mon, 10 Feb 2025 12:45:39 +0100
Message-Id: <20250210114540.524790-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a4988..70fed0ce45ea 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.34.1


