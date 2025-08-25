Return-Path: <linux-media+bounces-41013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A24B33FD2
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B664188DE37
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F28192B84;
	Mon, 25 Aug 2025 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="V6MeUGkm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D3634EC
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756125979; cv=none; b=DvecJHfcBy2/xaqfUy6PJi0pjBObBJ+uy2pRuI/hg2TYNIfbnc8XLdVKPiTbs17VoD6jk9m0SGujpcBfsqRS+5G+qTi5T/XsnvflRGolOz6cy0CKCfzv5xLN8cIMG+n2ZSIaJ2V0jWkPyVg6yx7JNkQQr72IhRBpT+UcD4sl6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756125979; c=relaxed/simple;
	bh=NFA7Rip9aCBxNZXcfUwWfEWkPVvY2cnDcsKyD6aZzXw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=loTmRyQgG4UQe9vYrAypCCJxU7nXw8rYQw0Lksj+iRknnz9kdysNYEbLUXWeQyMGFmq7jkNWYK33V5e2wZfe+HkYL6YB3rN+hxwF4+kLOdrkhkz0HrLdnSR/X3Cbf1w1tjgIs3pIFFH5k4J/fALSohpUBi4GroLScce0IwKLhOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=V6MeUGkm; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825124615epoutp04982fd9bcf9fced872c099e62889c1c59~fA0VT7LPp0805708057epoutp04K
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:46:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825124615epoutp04982fd9bcf9fced872c099e62889c1c59~fA0VT7LPp0805708057epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756125976;
	bh=B3ggiGG3zGwf6IwROz+KzPW9tQZQRZy1LRUC1d2oO7M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=V6MeUGkmsrAeOtXmXencbUG3LWQKsujjNiIvmQ0U0GcTarAlfFOtZ9oEOI5oUawEI
	 09MZ9QmBOwb4nSuIoQXswuhngUcu/w0Tvs1f5J2we0U8PH7sf49EMNNIMTnQ4/cJmi
	 gGp3gB6rXhx3Ar/gz8NFWoZUYyqKMEp1Msg7CUNA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825124614epcas5p2ae7004efd1bd437a7c96737bb944d2df~fA0T3T3Eb0139601396epcas5p2h;
	Mon, 25 Aug 2025 12:46:14 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c9VsK3Nzhz3hhT4; Mon, 25 Aug
	2025 12:46:13 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250825124612epcas5p1bd59a975b75029ee366a424379ad6dee~fA0SV3_FU1396413964epcas5p1g;
	Mon, 25 Aug 2025 12:46:12 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825124608epsmtip2bfc35ca4c6d5c979e37d4c4cca04ef7c~fA0Oi-Efs2384823848epsmtip2R;
	Mon, 25 Aug 2025 12:46:08 +0000 (GMT)
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
In-Reply-To: <4af38093-007e-4bfc-8439-0c3dc84012d8@kernel.org>
Subject: RE: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
Date: Mon, 25 Aug 2025 18:16:07 +0530
Message-ID: <016201dc15be$3d032ca0$b70985e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQLOIzgLAmiUCqAC0LEeUQJu3YaUAdjFWtWyVbegcA==
Content-Language: en-in
X-CMS-MailID: 20250825124612epcas5p1bd59a975b75029ee366a424379ad6dee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>
	<20250814140943.22531-13-inbaraj.e@samsung.com>
	<b1f59033-12d0-4395-85f1-e296a5dbca5f@kernel.org>
	<00e301dc1424$033ed5a0$09bc80e0$@samsung.com>
	<4af38093-007e-4bfc-8439-0c3dc84012d8@kernel.org>


Hi Krzysztof,

> >> Even more questions why?
> >
> > If CONFIG_PM is enabled, the clocks are enabled manually in the driver
> > through fsd_csis_runtime_resume API.
> >
> > If CONFIG_PM is enabled, the clocks are managed through the PM runtime
> > framework.
> >
> > Can you please help me understand what wrong here?
>=20
> I think I see such code for the first time, so wrong is doing something
> common in completely unusual way.
>=20

Driver should ensure a device can be also used normally when runtime
PM is disabled. So enabling clocks manually in probe, if CONFIG_PM is
disabled.

A Couple of other drivers also doing it in same way
drivers/media/platform/nxp/imx-mipi-csis.c and=20
drivers/media/platform/samsung/exynos4-is/fimc-core.c

> >
> > I'll fix in next patchset.
> >
> >>> +
> >>> +	ret =3D fsd_csis_async_register(csis);
> >>> +	if (ret)
> >>> +		goto err_media_cleanup;
> >>> +
> >>> +	return 0;
> >>> +
> >>> +err_media_cleanup:
> >>> +	fsd_csis_media_cleanup(csis);
> >>
> >> Also this...
> >>
> >
> > if fsd_csis_media_init fails, the cleanup is handled internally.
>=20
> What does it mean internally?

I mean that in case fsd_csis_media_init fails, the cleanup of resources is =
handled
Within the same function itself.

>=20
> > Here, cleanup is used only for fsd_csis_async_register failure.
> >
> > can you please help me understand what is wrong here?
>=20
> Yeah, you leak clock resources.

I'll fix in next patchset

Regards,
Inbaraj E


