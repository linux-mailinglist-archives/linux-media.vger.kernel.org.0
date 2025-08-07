Return-Path: <linux-media+bounces-39020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD449B1D600
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3512B6272D3
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD3027815B;
	Thu,  7 Aug 2025 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rutD1znq"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11762231A24
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563860; cv=none; b=os3x5z6o9Mv34ucA/LY80SQFY8tg4Q+CKllYHn5wLRFlzwoR2K67akcqE+mtrUInbPW1Fnnv0sGOv1u/PFVlhHSsj9CtPPbXtu0NYguDw7ZsxM71Owj/ZQ3fk6pcAFPLVEbGaMp0QQpRXUAsToxHtKamouCtsl3cS+G+gPsXHbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563860; c=relaxed/simple;
	bh=0dryVq5nRSws/NbsLT7Hcf5Mho3K9ucUhF/AjqVvwk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=hNmKtx+i5nOTwwAtISuCnNU2/0BeDcBQj3os2A3f4oebfaZgtUZwMQIYYix8qJ+k5i4wAP/XYt270P10RZoCEWAZUeyw2x4cSgUXtaJwRsudaqeniYom/7IZGHnR6c8WQAZYPgm/ND6uB/I6aDtCBxzF1hR2xQeVHVoPfzjnFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rutD1znq; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105057epoutp04c6946d89c49c373b94644bd2d4df8ca8~Zdog9bwyF0332603326epoutp04q
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:50:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105057epoutp04c6946d89c49c373b94644bd2d4df8ca8~Zdog9bwyF0332603326epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563857;
	bh=FPtZ58ERtJV4rrW7KCBL7kaZgXIToED8nobTPIsau4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rutD1znqXFvYB3upaZIMHVGrGPz7Txifv/kuVrGap8cCnILqNnEC9/aZApT1fdEfy
	 fpHBAsz7sTOnilCbmGGAwDVlbCBUTn9PqOP5cdKvSNJahxKdREDSsIiRQjWeA2mNTt
	 4Ap49P9iDm90egatHf4tx3vONoFJ3rWAsehjWCbY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250807105056epcas5p4af44a3b26818f504c0226fa780910a28~ZdogSbunP0998009980epcas5p4q;
	Thu,  7 Aug 2025 10:50:56 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8b4fl9z6B9m4; Thu,  7 Aug
	2025 10:50:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80~ZXjRgDILX0818708187epcas5p4d;
	Thu,  7 Aug 2025 03:25:08 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032506epsmtip218d2a9395a8da0b379396b6dc7d53467~ZXjPivwkQ1697916979epsmtip2V;
	Thu,  7 Aug 2025 03:25:06 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 02/10] ARM: dts: samsung: exynos4: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:41 +0530
Message-ID: <20250807032449.92770-3-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032508epcas5p416a3af567faba6a4fe3d6f6af5c0dd80@epcas5p4.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4.dtsi b/arch/arm/boot/dts/samsung/exynos4.dtsi
index ed47d0ce04e1..a2f15fbe98cb 100644
--- a/arch/arm/boot/dts/samsung/exynos4.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4.dtsi
@@ -435,7 +435,7 @@ i2s2: i2s@13970000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,mfc-v5";
+			compatible = "samsung,exynos4-mfc";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&pd_mfc>;
-- 
2.49.0


