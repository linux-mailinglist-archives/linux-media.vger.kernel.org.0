Return-Path: <linux-media+bounces-39022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33690B1D606
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B0B01719DE
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E152797BD;
	Thu,  7 Aug 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="k+2WVpSC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41022D78A
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563876; cv=none; b=ni5Hk+JUWKJ2UEHIHd6oydL7BJC3/gLHu3E0mN5ubpdh/hbwyR3OrwnhY4st4Qu+d5N0LGk89jkGpZwsbJp6bQxqICzbdVL0chRbFg+hUSxPy3jHR9U97J1w+vfMoeg9rtNDhVxmdB0SoEPlLXwnGSN1rjBSLqEpgA4IbwCM8a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563876; c=relaxed/simple;
	bh=S0htgdIKDL9Ik1bDSngE6XtbRG8xcNIlM+WQAB31t3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=QRBJr7SXvzdWT6IbFf1NpsCFYbYXQIe/pkeI3K2UcBZtFYYivlwDRFWQPQ895GKvlZZV+VxIsQ54PeVSG2UfPPQnD/WN6UH/WxxDE3xzLlYnH9Dp5qY5tGcFav/BodKmQjlrFYMGmW2C4c0fjU73lIpmkass++A72d3+3szfmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=k+2WVpSC; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250807105112epoutp0172cbca961db32f495e94b99b7c9fb644~ZdovZZoOg0976409764epoutp01S
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:51:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250807105112epoutp0172cbca961db32f495e94b99b7c9fb644~ZdovZZoOg0976409764epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563872;
	bh=x4K00fqUKSMf1320Zsxlq3La5Bqwytr3BaKcuXPCcBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+2WVpSCa86pG8hkxebYCpwnKUEQYiMKb38RV/oZ1reabXRlnUrzQhXLAPAttFiEX
	 9hnRAUVmELK4Egy+0XkvQcVnI7SVoqkdtULqWXru+PTivSfVSqlk3GEsu0/kYRYJuA
	 S1mYC5EGosAzq6NcxGRSnE+Nwacyr6prGT+fb99g=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105112epcas5p1e82eefc1a9bf77cae9c44eff3067544e~Zdou9mp1Y0067900679epcas5p1G;
	Thu,  7 Aug 2025 10:51:12 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4byP8v36C8z6B9m5; Thu,  7 Aug
	2025 10:51:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032513epcas5p224dc2883dff3610770140af0f93354cf~ZXjV440Ou0047300473epcas5p2V;
	Thu,  7 Aug 2025 03:25:13 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032511epsmtip27f6d1df53d9a5dc8ec815551528afc37~ZXjT65V3n1491114911epsmtip2X;
	Thu,  7 Aug 2025 03:25:11 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 04/10] ARM: dts: samsung: exynos5420: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:43 +0530
Message-ID: <20250807032449.92770-5-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032513epcas5p224dc2883dff3610770140af0f93354cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032513epcas5p224dc2883dff3610770140af0f93354cf
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032513epcas5p224dc2883dff3610770140af0f93354cf@epcas5p2.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5420.dtsi b/arch/arm/boot/dts/samsung/exynos5420.dtsi
index 196c6d04675a..31738350b522 100644
--- a/arch/arm/boot/dts/samsung/exynos5420.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5420.dtsi
@@ -299,7 +299,7 @@ clock_audss: audss-clock-controller@3810000 {
 		};
 
 		mfc: codec@11000000 {
-			compatible = "samsung,mfc-v7";
+			compatible = "samsung,exynos5420-mfc";
 			reg = <0x11000000 0x10000>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_MFC>;
-- 
2.49.0


