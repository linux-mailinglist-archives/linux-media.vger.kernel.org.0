Return-Path: <linux-media+bounces-39024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC0B1D612
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4700E1AA2216
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF1127814A;
	Thu,  7 Aug 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fZfeytNB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E882777FD
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754564008; cv=none; b=IusCnrD4CtBtXsCs8GxFnADnzpYQgxjJypRecv+ZXSjcD1B1L0Wmqjex5c0YTNubQMFr/nsdPUPD1bLODZcfbMyL3bcYGCycsIruROPj7JD0NkmXrimgI903+Y5WiM+Ih2p41YFUZnSEdJswoV6gVByEb65LHbtvkqusmSFSr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754564008; c=relaxed/simple;
	bh=iFQwtztrwE7wz+Dzr5cvKNkER7lv4ej4WRpVBznyvYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eoG8sC+INZCYpWW/ZJ9IhkvMFgliaKdstNDLsrJx4yVEuCYgNE7G51QYr0ylh6BQpA0F3EEaWuCqMjAH4Zp21cV9rZwVqyCGAbJaCKzPYv7RkbNwfFdhfZor9g0XxTV5kT6ZnLkbvts5Y9NDIDL58lvDzrFa6y/nZaxNwB+7Igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fZfeytNB; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250807105325epoutp04eaeccb747aafe79992d6dd1e3f0374c8~ZdqrV7b000573805738epoutp04f
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:53:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250807105325epoutp04eaeccb747aafe79992d6dd1e3f0374c8~ZdqrV7b000573805738epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564005;
	bh=+IgihIT+WwnjED1zT4CW3dZuETZ4lvvEIL07taCvIHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZfeytNBhdTWHZ2URqGiTIliTA3yl49c14sDM3Tza2IgWwDyLVtXRTGgBDczO4mHx
	 PtOFIkTyWAWfsqFn64rJIifMLNBoOx8hNzrNL2aec17ETGbL0ZlBzPgkBy/WKWHANm
	 LEbwQagqhv4BNS8GUROlzDQt+Jtj3GVc5E5NLas8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105325epcas5p1c2250f6aa9109186361aa639bf5b973b~Zdqq00_fz2123021230epcas5p1I;
	Thu,  7 Aug 2025 10:53:25 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byPCS3Gj3z2SSKf; Thu,  7 Aug
	2025 10:53:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032518epcas5p2af27b86e19d451e5ccc9cbc9c7b676ce~ZXjaUu-Za1823418234epcas5p2Z;
	Thu,  7 Aug 2025 03:25:18 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032516epsmtip28f2e6bb9c955edebd9a9705587917ce2~ZXjYW8qiw1697916979epsmtip2k;
	Thu,  7 Aug 2025 03:25:16 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 06/10] ARM: dts: samsung: s5pv210: Use SoC-specific
 compatible string for MFC
Date: Thu,  7 Aug 2025 08:54:45 +0530
Message-ID: <20250807032449.92770-7-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032518epcas5p2af27b86e19d451e5ccc9cbc9c7b676ce
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032518epcas5p2af27b86e19d451e5ccc9cbc9c7b676ce
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032518epcas5p2af27b86e19d451e5ccc9cbc9c7b676ce@epcas5p2.samsung.com>

Modify the MFC device tree node to use a SoC-specific
compatible string instead of a generic one.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm/boot/dts/samsung/s5pv210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210.dtsi b/arch/arm/boot/dts/samsung/s5pv210.dtsi
index 34e8a3d5efa5..0a746c2243f8 100644
--- a/arch/arm/boot/dts/samsung/s5pv210.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210.dtsi
@@ -450,7 +450,7 @@ ohci: usb@ec300000 {
 		};
 
 		mfc: codec@f1700000 {
-			compatible = "samsung,mfc-v5";
+			compatible = "samsung,s5pv210-mfc";
 			reg = <0xf1700000 0x10000>;
 			interrupt-parent = <&vic2>;
 			interrupts = <14>;
-- 
2.49.0


