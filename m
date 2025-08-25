Return-Path: <linux-media+bounces-41008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE6B33EA1
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4612817A590
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA9B26E154;
	Mon, 25 Aug 2025 12:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cYziQjLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12614A4DB
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123328; cv=none; b=kYDyg4w4G7iQEeRU7Acs07K3jm6gdJqMpif1sFSE5cGJjFn0i5d7WesA6bvvhF4BoKEQ8I4xgLRvud25THCcuOSmZGzFWukUqHccc2kgEIwtMgfQaj1fg1rbjeof9Ka/wArOCXw/DiFUNn8wzxP5aMmfzrsdA5V5n5HRmnEEl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123328; c=relaxed/simple;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=b9ck3TBdKO2q/zuG5eH1urUgtn9Ie021SS2nqwmuM4vvIJWYSMFQ7hiCIpOdmFtokwoKfEutMeiuGnvg2hRGOnq5qIqhGhFZOLbhXbJvhKM4RgSfqxj9js1RGCYa2vF51PlgfJaK6oBKxEKIm+ph8X7o4KmcblFgzbnea4UOgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cYziQjLJ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250825120204epoutp0340fa6c786ec00ad5ed02bf2611eaca33~fANwQqtCr0160301603epoutp03G
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:02:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250825120204epoutp0340fa6c786ec00ad5ed02bf2611eaca33~fANwQqtCr0160301603epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123324;
	bh=+FzwHF8KuNzlOWaaKrrdM7RTgM5W1jyxUgMxJOzJj4g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=cYziQjLJ2pZX+j8U/8EwOGgqhIx2xStM1PACDs79uontzUR5RP99yKw+VKgpYFIST
	 iZiZ7kYFjO3EFHpwE5NUXlIsjM+DfLCjU4O2fYUXWXFK9eaBufESztX40L1fmjqTQl
	 Kh8kEUycYsqxnrLTktroB9vGuydDz0PqduPadSbo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825120203epcas5p1c6378c60ea36aa87f171b0477956f62a~fANuuWErA2818828188epcas5p1x;
	Mon, 25 Aug 2025 12:02:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9TtL13lDz2SSKZ; Mon, 25 Aug
	2025 12:02:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0~fANs7W8Nk0034600346epcas5p2Z;
	Mon, 25 Aug 2025 12:02:01 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825120157epsmtip265a67df65657294b364f9f90edabfe52~fANpJa82N2901829018epsmtip2W;
	Mon, 25 Aug 2025 12:01:57 +0000 (GMT)
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
In-Reply-To: <2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Mon, 25 Aug 2025 17:31:56 +0530
Message-ID: <015a01dc15b8$1095f0e0$31c1d2a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YA0x2iDwJfHwx3AsbuavuyZvR80A==
Content-Language: en-in
X-CMS-MailID: 20250825120201epcas5p2d4daa5629b3552586363349fb30e94e0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141051epcas5p14dccee388087372973988aeebcb872cf
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141051epcas5p14dccee388087372973988aeebcb872cf@epcas5p1.samsung.com>
	<20250814140943.22531-11-inbaraj.e@samsung.com>
	<c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
	<00e201dc13d7$17d2a750$4777f5f0$@samsung.com>
	<2eaa1303-79e6-431e-9902-356862357c9f@kernel.org>

Hi Krzysztof,

> > According to the HW design of FSD SoC, the control to manage CSIS
> > power is given to a separate CPU where custom firmware runs.
> > Therefore. The Linux side does not control the CSIS power supplies dire=
ctly
> and are hence not included in the device tree.
>=20
> Usually this still means you vote for enabling these resources, at least =
for
> other vendors it is like that. Unless you want to say these are essential=
ly
> always on and CANNOT be disabled ever.

Yes, we want IP to remain enabled permanently, So we are not adding power s=
upply
control in linux.

Regards,
Inbaraj E


