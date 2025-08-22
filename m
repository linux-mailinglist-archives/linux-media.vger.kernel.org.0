Return-Path: <linux-media+bounces-40759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA9B31947
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 507E2AE1076
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934C63054E5;
	Fri, 22 Aug 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PxGRN7kv"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75003009D1
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868586; cv=none; b=JVqX8E3mxn520EQwOBIh2tdxY1aM9fDttV9DN02yARMpN4WxM9N9lPF070B7Xs0r99TngiFt0rWBt+CzgX5xPCfMxhKoZQjLox7LDFdW0Z6BytGM18NqLthInw4WrVg9CGYRE54dWcuGsjxwgm90pzg4X+SC6J2kTJH+SBpSPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868586; c=relaxed/simple;
	bh=CdrU7eCrr3LV3Lu1u46oRfF2i9xBpxz4MaRNU2opurg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=PjjcADicA0ygOC6eRIKCq7WnWRDKY53zFIWrwjKksqkoNM8jNIbj9a3HeS8YTAQL3/p7xctCyovh3VT42pMSwVSws6nxSS5IiltMzTtKGr1XzRe2VXOHZC4toRw+gAdgIj7nGAr+0w1j0GmfVcLLD9hut2vVBdgyU3u+n5rkKj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PxGRN7kv; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250822131621epoutp010e0d241b9a935b74024349305b6b89c8~eGSwUn_aK2068220682epoutp01F
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:16:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250822131621epoutp010e0d241b9a935b74024349305b6b89c8~eGSwUn_aK2068220682epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755868581;
	bh=9ZJZJ33xPZN7YhRnDXzj6QYdPa3pESiJ7l6R5mbj/y8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PxGRN7kvTKdGM7owi9m91ynX2Bv2hG7D+oiG/X22aQy1vO0iPIOLRXdWW4vVdD8K+
	 Sp0y6q8xArHia/7z/DTgpyJpjO3MlWUhPoeXBhZBKzjGB0YYbQogAsX/FwKpKw8oqw
	 UYPrFvT1zq4NpSpj2+YYC6b6Ukjc4lCjH4qetH9I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250822131620epcas5p4fb8e2cb786224a21ccd3128b8c4bf219~eGSu_iGlk1406114061epcas5p4E;
	Fri, 22 Aug 2025 13:16:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c7ggR2zLSz3hhT4; Fri, 22 Aug
	2025 13:16:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822131618epcas5p170f75240f21ff047898bbaab4188142b~eGStIRSuw0944809448epcas5p11;
	Fri, 22 Aug 2025 13:16:18 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822131614epsmtip1b5ad2e345c8486a50a1145d3feb073b6~eGSpYp5xV1475814758epsmtip1L;
	Fri, 22 Aug 2025 13:16:14 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <05da83dd-2cd2-4f51-8169-e8cf0190d6c1@kernel.org>
Subject: RE: [PATCH v2 00/12] Add FSD CSI support
Date: Fri, 22 Aug 2025 18:46:12 +0530
Message-ID: <00cf01dc1366$f210a000$d631e000$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHSAysb0EL7RTtQtCp/95MWB/0BNwK5oFMDAeOgCum0Xd0h0A==
Content-Language: en-in
X-CMS-MailID: 20250822131618epcas5p170f75240f21ff047898bbaab4188142b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
References: <CGME20250814140956epcas5p480aa24441933523484da5c241a201d3c@epcas5p4.samsung.com>
	<20250814140943.22531-1-inbaraj.e@samsung.com>
	<05da83dd-2cd2-4f51-8169-e8cf0190d6c1@kernel.org>

Hi Krzysztof

> >
> > Changes since v1:
> > 1. Addressed review comments from Laurent Pinchart to integrate the
> > with imx-mipi-csis.c to handle the CSIS and expose it as a subdev.
> >
> > Here is the link to v1 patch for reference:
> > https://patchwork.kernel.org/project/linux-media/patch/7e7832c16925386
> > b771ddb7e00e08661115aa0ea.1668963790.git.sathya@samsung.com/
> 
> Use lore links. b4 gives them for free..

I'll use lore links from next patchset.

> 
> >
> > Inbaraj E (12):
> >   dt-bindings: clock: Add CAM_CSI clock macro for FSD
> >   clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
> >   dt-bindings: media: nxp: Add support for FSD SoC
> >   arm64: dts: fsd: Add CSI nodes
> 
> Please split patches targeting different subsystems, since they are
> completely independent. There is little benefit in combining independent
> work into one huge patchset.

I'll spilt into different patchset according to the subsystem

> Best regards,
> Krzysztof

Regards,
Inbaraj E


