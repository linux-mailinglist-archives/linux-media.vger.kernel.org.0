Return-Path: <linux-media+bounces-39018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB43AB1D5F5
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F4C62735F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581B7221F31;
	Thu,  7 Aug 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ppYXl6BU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F37E21FF49
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563849; cv=none; b=OmvI7ruVQZiJ5fl4pjhJQ8yCinkVOZafSFS0cIGhiKRU26kdTVSW7kVrR4dKAZEE9HyU0vvjd3Xr6V43NlhY/9Pd2cuZ9TSt26H2xxlRJVhk/pV1AhQr5areqPAiXPQxbWnww8fzh+aCAE09POedtl+4V0qb1gcXivmDcoIztWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563849; c=relaxed/simple;
	bh=5N0sCYf2Cs1KmNgBKMto4VeDsYyl1/Ny7xhHxwxRX48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=CDis3VDpHhjzhg6I/n7iKqPk65IipH0dZryoCh2avbID/oZ07/SceGhK3fy+yH9qxXHWEknBGmiEDrd6XGcYOHcPLMQJaBoADvWOxosnfBtTeeVQjIosRja3jOQpNmYFUqi36q1Jy6OgV8O5SjsGGWQAjXFMgquQO3GXf8Amun0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ppYXl6BU; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250807105046epoutp024830dca0ab01548310d32f9dc5664217~ZdoWtWzEA1759417594epoutp02V
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 10:50:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250807105046epoutp024830dca0ab01548310d32f9dc5664217~ZdoWtWzEA1759417594epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754563846;
	bh=9EFIJet6GwguCOgHXt373HO19RdNPt1XWJDM2bajplk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ppYXl6BUAVAeVZr16oTAuTzCiqe7yhCZS+FFgZzvF4nkidEBipqlnZylkV4VUzezu
	 CB2MBnBBTia4sRLvv5W4Z5g3ZJs3fIBqTRcepasnE5PQZyLIRAwSA7oHHnQdsqBTIM
	 W4HRgZNEHXl+bbwWKiLK/xzlWe3vfYCA3lEUb/6E=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250807105045epcas5p200483d0bdac63cb3b323ff857f67fdc1~ZdoWNaOIH1874618746epcas5p2P;
	Thu,  7 Aug 2025 10:50:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4byP8P11ymz2SSKf; Thu,  7 Aug
	2025 10:50:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22~ZXjJEevMZ2629026290epcas5p1A;
	Thu,  7 Aug 2025 03:24:59 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032457epsmtip217c0a672ffd1a22f97b647b84be6597d~ZXjHGrzJG1346113461epsmtip29;
	Thu,  7 Aug 2025 03:24:57 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 00/10] Use SoC-specific compatible string for Samsung MFC
Date: Thu,  7 Aug 2025 08:54:39 +0530
Message-ID: <20250807032449.92770-1-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22
References: <CGME20250807032459epcas5p1d6bd796f5b654c92372bdcc8a7926c22@epcas5p1.samsung.com>

This patch series modifies the samsung MFC version compatible to
SoC-specific compatible.

Aakarsh Jain (10):
  ARM: dts: samsung: exynos3250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos4: Use SoC-specific compatible string for MFC
  ARM: dts: samsung: exynos5250: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5420: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: exynos5800: Use SoC-specific compatible string for
    MFC
  ARM: dts: samsung: s5pv210: Use SoC-specific compatible string for MFC
  media: s5p-mfc: Modify compatible string check for SoC-specific
    support
  media: s5p-mfc: Add new compatible string corresponding to S5pv210 SoC
  dt-bindings: media: s5p-mfc: Modify compatible string check for
    SoC-specific support
  dt-bindings: media: s5p-mfc: Add SoC-specific compatible for
    'samsung,mfc-v5'

 .../bindings/media/samsung,s5p-mfc.yaml       | 24 ++++++++++---------
 arch/arm/boot/dts/samsung/exynos3250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos4.dtsi        |  2 +-
 arch/arm/boot/dts/samsung/exynos5250.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5420.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos5800.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/s5pv210.dtsi        |  2 +-
 .../media/platform/samsung/s5p-mfc/s5p_mfc.c  | 13 ++++++----
 8 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.49.0


