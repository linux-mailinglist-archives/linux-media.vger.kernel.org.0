Return-Path: <linux-media+bounces-47734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E6AC88527
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 07:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811443AA948
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 06:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD52531691A;
	Wed, 26 Nov 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEeVV90V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541A31281F
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764139981; cv=none; b=pFT1evyeNRwwRZCL2CwtNFbyw/ps7w2XoyKG2mAuV1PvX5sM+Okn8ke6QQamA8LhiG7n+eyia8ouZ461mFodVc0psLaiEc7dH3d3dngMSF6r6i/4Qz6ZBugCXuj9Cx0tN49vZs54UlC6l5UO8WQbTy//8JgwjdBU764i488hGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764139981; c=relaxed/simple;
	bh=BK+tZ9pD5eAAc9qRGUcd0m51Raok99lisnLY6sDj8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvQGs3ghN+QYHropqvP5j324l9jSTVraf4pfsRB5WIKD0CMKVPZ3H47wJjyIOBWBExl4msuOIOrQeXiw8oy2K9rFm5TAm5kWVinN3x9djP2sbY0KZn23VPpYigPlHba0e5GV5lVxY2y2Du7czGS2gAbCWpoAe1VKUUVfPGs9RNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEeVV90V; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso7867484b3a.2
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764139979; x=1764744779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=PEeVV90V3ZslaH3uCF8eDUidMWQH/QCmR7B95vxckTFul5xmW56JI1ZERvupwnaiCr
         l35s1Zp4tzygchqDvFE22CZ8gCZbaK+sO7m1V1VyrWo/AMNf1NuKVUz3xdHyuPgIVB4U
         5sYR8K1zv50V7LUmXYDtMiEQKdujDjAAdNPOXmDGSc3YL6VXT6yzI3XZQH7CakvAGoIt
         RJaMcyp/tqk4ifxPpj05RtLtmnpl7ZeAKCucdinxokljxOZvVk3NT5LsPuaeP6yxe2Se
         ZWE4thp0qLsDqIFKPjmp83iBLetkDjKeHQZAHKlLameyGG4fCrEKqHMEIl+gkf9+Y1DM
         K3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764139979; x=1764744779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgOIexVeDfDtUYQCupJMpajtM+/Y7OYtN4nw8vkU+0g=;
        b=eQ9ux1zSuxPo7DbICeP/nnGaYVn7mBvRyFx1N9jx6uX2cUVgSWOfOr4Jwhjxy6wn75
         +xRLOxz/32xYxCY7obUYZNdrt3kjTI49M8D+gNrfNGX2s5rFUonbeUqKHEd/amOxRoMf
         RXToSQbwXdvuvcz2DKaCrwW/BP0QGI+8h/EjnW6BFFsQY4l+VIoEdwDMawYBH9kKsN2j
         cFKMvUQ23kJuyWR2ozkzH5+bLOLaXn4yes8J0RKPHM8Tlf8TJrqqWuhtYrTP1QOHSTxo
         /c4Vp+a9mA23npb4jOQqdym8Bv2yEBN7lappPQc7xk/OBg3aGoxVYOFDFe8K+ITHhw4Z
         GQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZAmiQZACWHGXnztBcnSMnSgTpXflnxfLwxCZ4IGyAu8/W47warObOzrRY/R/9ADpfqeDrQS72cnH8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zd77uipeTX4jBypmHwVNcprdQ8jmF0izWubVLMXi623PayNf
	OPO6s7cnD4TEoKPMRwn7Z8Oyycgt4bstJKdlvIaKtmkjXyFqvO0v7c1f
X-Gm-Gg: ASbGncu22U6Fdc988CnYufDIsDlhXb5J6wOBmrnM6QbbDX/AimYRLXWZXMhdSOyzjTB
	gLcBZdIL93JBDYCHTpquplN1SzAFrDOG84kKvb3kmijzgdf5uyhshOAam8ZZwknUku7LP00kn1Y
	xPSghIxekKNaeRBC2N81RRkIqM1K4QgmMJRwm0Bte6eCg702w46kZRfwT4d6zI+36Cdtr5j6m/K
	aIdDAn2jRp/rUiFTm5YGfcPpN1pvToTqxJWqWtC9wgzou+OzHN0cfzzbgNZnfwLBlCkGj0aYRBT
	WOmTnerfdyN2KXa89i9PdsieawcB7relx+H6bxdux5cW1I7EBAwes05GAKmoaRytFwjhUbeYxV0
	xPpN2KDgx9HtDR+uvSHdtD7bpBSADu4CruDPJUC/0yyGOT+Njub3tYTfBe8W2/UCQ0pGqPB4nix
	jcflq2F3XA2SVlYgEzkDCGjHMXzIB2O/T2+4Fs
X-Google-Smtp-Source: AGHT+IEE4CTbu1c5peHPM99zicrUlC0JsRXRgiT1+i7EQCCIG5zPCF+CYZG2Zt6NXjE83or4Omrl3A==
X-Received: by 2002:a05:6a00:92a2:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7c58e609950mr19280180b3a.16.1764139978740;
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
Received: from LAPTOP-6H9JJHSF.mshome.net ([61.1.189.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174c9dasm20077037b3a.65.2025.11.25.22.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 22:52:58 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: thierry.reding@gmail.com
Cc: jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] media: tegra: vi: replace devm_kzalloc with kzalloc in probe
Date: Wed, 26 Nov 2025 06:52:42 +0000
Message-ID: <20251126065242.12186-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_kzalloc() (line 1881) with kzalloc() in tegra_vi_probe()
since memory must be freed manually in error paths. Freed via kfree() in
rpm_disable, as recommended in the file comment (line 1204).

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..73127ea6ee49 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1878,7 +1878,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	struct tegra_vi *vi;
 	int ret;
 
-	vi = devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
+	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
 	if (!vi)
 		return -ENOMEM;
 
@@ -1941,6 +1941,7 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	if (vi->ops->vi_enable)
 		vi->ops->vi_enable(vi, false);
 	pm_runtime_disable(&pdev->dev);
+	kfree(vi);
 	return ret;
 }
 
-- 
2.43.0


