Return-Path: <linux-media+bounces-40072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AACB2987C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FB3D4E6DB5
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3062027057C;
	Mon, 18 Aug 2025 04:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Cp2HdVw6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060F26FD8F
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491905; cv=none; b=LHh48b9G7v7Kw0fCrz0PM97Gy3wckKUrjlW5UJ/YHmhBCDnBmbujmA10PabaSIEvHeuvF13VjVmDsdQJiiSOaJVa86jLjqCRt/zbeSNaV4kOEvGKrcvvP0bbeMsixoMhGgRDI48ZJOJctq/zk+qYAe8Xc7Zd/vzKYMhVMMKL7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491905; c=relaxed/simple;
	bh=dsZnyelYmJUR/r8yNANfzYsB7tUfqb2ZEpkJb08J6xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=XKi5HkPRSeMKCPge8i0soEDClk7eV6OvDcpVu579/g9+syEVyDQmY/8gdtS2lbnKKKCGECRgFZzZTg2S7xBr0pbroWJ1Uufe5aax6rsqhD4DTXax2wTbQ6obly5AMZHMfOU5ghU2zlCh6wCsrrqo618wE6zwzt1szMXQI8ZYNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Cp2HdVw6; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043821epoutp0287d2537adb07e76e10f87cfcbfe6597b~cwpVkb_-O1679416794epoutp02Q
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043821epoutp0287d2537adb07e76e10f87cfcbfe6597b~cwpVkb_-O1679416794epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491901;
	bh=pIIh+RNwzrD2SWtoiNYwjSlCZ+91/tIwejowRxgZB/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cp2HdVw6FMh5MWfVuvUL1/lvwlfLFBpiAtH5gBgbnAodyIdlpOmoxkzMkFIbn8MYs
	 XpzPxgHwABp88QJG/B1uoXkltKGRmUyZbOYWm7UT8z91zNuuOOgjdPd6cDE7LkJE71
	 zbGvTAB5pX9oXczOpagLqStumF/ntjKf3rSUiUOk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043820epcas5p485bd22b98432d4e3bab33109e3307f58~cwpUyFQIE3042630426epcas5p4u;
	Mon, 18 Aug 2025 04:38:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50Mb5Lmhz6B9m9; Mon, 18 Aug
	2025 04:38:19 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141057epcas5p21ca33641e42164886dc1bf404237876d~bp4Ihcefq0720407204epcas5p2a;
	Thu, 14 Aug 2025 14:10:57 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141053epsmtip2b31baf764fde081c646d3e1c84b1b4d6~bp4EsmoYH1850318503epsmtip2S;
	Thu, 14 Aug 2025 14:10:52 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Thu, 14 Aug 2025 19:39:42 +0530
Message-ID: <20250814140943.22531-12-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>

Enable CSIS DMA driver support for FSD based platforms.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..7f7e1fadb74f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -878,6 +878,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
+CONFIG_VIDEO_FSD_CSIS=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SUN6I_CSI=m
-- 
2.49.0


