Return-Path: <linux-media+bounces-42375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D123B5387C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C777AF0A5
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584A535FC39;
	Thu, 11 Sep 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LBqbaRvV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B535A296;
	Thu, 11 Sep 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606255; cv=none; b=Rb3XM9gF6Os/ZYpA1VVrs2s9ALR/YvFf0ye/FTPLDuAcutf3DuoAlJ/1hZENXOJwkpi1030LRnaRfFLUj99t3xCIFeawT+d231uoqj5FvtgwhMLEPtjCPj32MQiAjNd/3kaoc+FxuKstJOiEguaNJcLf07Kvcgkljgx4Wc9XiNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606255; c=relaxed/simple;
	bh=sKradN4hrPLBamEcgVbncnL2328TDnqxw+EAoEE13DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8NNT9o0+9/RdqirN0E8vQD0Ue3zaNSPKwElsNVQaXgcrrCXJE+ISvRQth+IOF6lGaXCK5gmnfIfw4ZtdO0HZYh8TecR1mu3qGHFqmaozOFQIJhGI2Kbt8CViXglctAbzdjDQAxt6kTwraLMqYE6UK0ey++ghDvVL7j8zHZR4fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LBqbaRvV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757606250;
	bh=sKradN4hrPLBamEcgVbncnL2328TDnqxw+EAoEE13DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBqbaRvVoCT5HxikVs99b2Vpp/Y43wAVEtPNK2dYruWkcJpViO3FhXKiWedvSmpt/
	 s0BtO0HyXHffiJXtW7Lfd0F5N8mhbfoKo8RP7gFXOqglKttSJYdUBgDwinE7PlKKJW
	 synSVnIgYEG90e3C2xB7Q5Pg+KkByOOoxwFC94ZEszUs2PZ2p947h1CEY1jgLfZIFd
	 jmECAjfXU120BnBsc6fc4LDFIQNy98qAe2xrEHqGlEBvCxJLzMeLTIdnimavYP7Uz4
	 N3Shzy8KETSqCiAeehpKbR5eWO0g9V1jarqCySbweksiYmA+beiM/nnMqYU36B4lDK
	 JBoPwvP3w8Jbw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36e5:357f:56a7:54dd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B3DF17E12B8;
	Thu, 11 Sep 2025 17:57:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 7/7] arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588
Date: Thu, 11 Sep 2025 17:57:17 +0200
Message-ID: <20250911155720.180465-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa Rock 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..04547bcc904b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1470,6 +1470,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


