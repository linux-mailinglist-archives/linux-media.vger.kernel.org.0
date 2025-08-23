Return-Path: <linux-media+bounces-40807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EDB32661
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 04:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9357FB644D2
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 02:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890E51F8725;
	Sat, 23 Aug 2025 02:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c1Sv7Cnj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530A1F2C34
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755914741; cv=none; b=i9H1IwVFT+vZsRYc8mAIYYg73v437ZrcJWZJUZ7sdJ9tmaNAJ1SoI2aXWv23+dyiYE/zwcITvtJLR9Lurir+ApQj19HHXk7EGbTYdPxwTGXnuWJnLa94y/W1KUjcc4aoCiWehY8vBYtPBfFi4/43Gu2sjNBH+8ylXu07SUn+VDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755914741; c=relaxed/simple;
	bh=2RyIzjXm7b9+cnzeMC18DAd1kJ8HkUkKDXL9CCakxGY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=I73qVKRoVFzqsqObW1819gijUmdtJkWB93owdhozyhQTf+FymbO35Llt0lfCRYRQF3IJYAam8ObXiXFQtgdrvPS/WgXpNkGmw44tOrjmYB3C+eL9c3okFflQdp6/m5qtUn6/y9cKwuXzyNOSLhMQJeHe056LA4V37GH6jYDUUnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c1Sv7Cnj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250823020530epoutp014b9ebf58b9d5f0ec3aeb50a95d8e85dc~eQyTdiNDO3093430934epoutp01Z
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 02:05:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250823020530epoutp014b9ebf58b9d5f0ec3aeb50a95d8e85dc~eQyTdiNDO3093430934epoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755914730;
	bh=qbnO/+sq+8ONZt0KTeFBgfHeWWE3a0C0n2e4rSAYFr8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=c1Sv7CnjQKX7XbuXu5Cv9J8czEpU4yZeeYXHw40EN0Eu5XvdvZSojdD3I4dYt3+Zu
	 cSlUyM76qwQrRTwr4iwftmmQ+bb+Lk/DmUxhy5yqgFGLAQR4h5ZA9GzF48v7smFb86
	 qOu6NeKL3Tb0MYeg1v+vlLUwJQYDjzTCjCwczAP0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823020529epcas5p46c5400dbc26564b90f4d6ffdf82d1e66~eQySihPyI0145101451epcas5p4H;
	Sat, 23 Aug 2025 02:05:29 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c80kw2NSbz6B9m7; Sat, 23 Aug
	2025 02:05:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8~eQyQxE8K70145101451epcas5p4E;
	Sat, 23 Aug 2025 02:05:27 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823020523epsmtip1c66b58ee1eac02d62d96b211baa19c19~eQyNFvkoL1748917489epsmtip1s;
	Sat, 23 Aug 2025 02:05:23 +0000 (GMT)
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
In-Reply-To: <1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>
Subject: RE: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Sat, 23 Aug 2025 07:35:22 +0530
Message-ID: <00d401dc13d2$65033080$2f099180$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQHrKQRZAj9O8PIBXjI9/7KIHEcQ
Content-Language: en-in
X-CMS-MailID: 20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>
	<20250814140943.22531-12-inbaraj.e@samsung.com>
	<1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>

Hi Krzysztof,

Thanks for the review.

> 
> Tesla FSD
> 
> You are changing defconfig for all platforms, it's not your personal or
> company defconfig.

I noticed that Exynos and NXP driver configs are added in the defconfig.
Could you please clarify why I shouldn't add my driver config in defconfig?

> 
> 

Regards,
Inbaraj E


