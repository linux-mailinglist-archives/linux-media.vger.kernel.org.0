Return-Path: <linux-media+bounces-40764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27AB31A97
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B52D1D01D57
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED808308F1C;
	Fri, 22 Aug 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jwvOoxx+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48933074A9
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871041; cv=none; b=S91QJseFicWyKEZWaw6Ci5pCvYw2mPLNgFQ5E/ck/3tbvuFpmMqXRxmBC37kGXSON8NL0bOhPqEVmXplBAUE1uhYNIjPR0/e1pJCikOT44vtiIfSgy9yaJawPTdie0sftv52zjkAEwWusgWTh0Drib1q08YBcOtWN4xiXppMaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871041; c=relaxed/simple;
	bh=qYOiKaomuYF3FFz6S9PgNZ0UIWGTOlBCNi6+QRdBe8c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=mw/YHtDsD8s+UWU0P8dC1Ml9i3lPoXSjq+W0Z90oX0jH4uQ4e55jYq9wn+E+0EZeAVbso462T9u5Ko+tcRvS8TxB2Ksxq27kqq6PmbP68MDgzfnyq10GHzCfjQB9hGMGF/sLZNROXQaYmUN5dXVjEOuW1A3Ib2BaIWBf2+C9+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jwvOoxx+; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250822135717epoutp028fb4a6014c8e09306e91b766c41fa133~eG2e8omEO2740627406epoutp02K
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:57:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250822135717epoutp028fb4a6014c8e09306e91b766c41fa133~eG2e8omEO2740627406epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755871037;
	bh=W4C5v6Mam7mfoOZt+/Uk2fNaLUuqcHXWmVmMPWM4nmI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jwvOoxx+0UkR29FGHjt3nZB44roEkqCrPy3UV4AxVKwtIX37Oul0uvkstC1WMv2Jq
	 EVKhVqqQcxDJBxtEAtUas3cMR818eJ/xFBm1R+98ywV0zAFG1JpHKkCARpXGj0ZOLa
	 6w0XRyIrH69pEU8cfi4QLo0K4EXFLxqOhao5xbfs=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250822135716epcas5p18bd9dbea2d4c64fddf513df96cf206a8~eG2eIJ28p2289722897epcas5p1m;
	Fri, 22 Aug 2025 13:57:16 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7hZg1tPyz6B9m4; Fri, 22 Aug
	2025 13:57:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822135714epcas5p1061155a3eaf18a8843e73652afbcfe52~eG2ckacBH1755517555epcas5p1I;
	Fri, 22 Aug 2025 13:57:14 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822135710epsmtip1545b9b7689f40f6c2351d8d4952539fc~eG2Y0A9DZ0796007960epsmtip1e;
	Fri, 22 Aug 2025 13:57:10 +0000 (GMT)
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
In-Reply-To: <1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Fri, 22 Aug 2025 19:27:09 +0530
Message-ID: <00d101dc136c$aa037020$fe0a5060$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXx7J94PTA
Content-Language: en-in
X-CMS-MailID: 20250822135714epcas5p1061155a3eaf18a8843e73652afbcfe52
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
	<20250814140943.22531-5-inbaraj.e@samsung.com>
	<1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>


Hi Krzysztof,

Thanks for the review.

>=20
> On 14/08/2025 16:09, Inbaraj E wrote:
> > There is a csi dma and csis interface that bundles together to allow
>=20
> CSI DMA?
> What is CSIS?
>=20
> > csi2 capture.
>=20
> CSI2?

CSIS stands for Camera Serial Interface Slave.

Samsung v4.3 CSIS IP bundles both the CSIS link operation and the CSIS
DMA operation. The DMA-related operation are referred to as CSIS DMA and
are handled by the fsd-csis driver. The link related operations are
referred to simply as CSIS and are integrated into imx-mipi-csis driver.

I'll update the commit message and commit description accordingly,
and maintain consistency across the patches.

>=20
> >
> > Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/tesla/fsd-evb.dts =7C  96 +++++
> > +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> > =40=40 -493,6 +493,558 =40=40 clock_mfc: clock-controller=4012810000 =
=7B
> >  			clock-names =3D =22fin_pll=22;
> >  		=7D;
> >
> > +		mipicsis0: mipi-csis=4012640000 =7B
>=20
> Messed ordering. See DTS coding style.

I'll fix the ordering in next patchset.

>=20
> Node names should be generic. See also an explanation and list of example=
s
> (not exhaustive) in DT specification:
> https://protect2.fireeye.com/v1/url?k=3Da30d23f8-c28636dd-a30ca8b7-
> 74fe485cbff6-ee12f8a711c584c8&q=3D1&e=3Db96506d8-2d5d-4303-b9e8-
> 0e1189db1585&u=3Dhttps%3A%2F%2Fdevicetree-
> specification.readthedocs.io%2Fen%2Flatest%2Fchapter2-devicetree-
> basics.html%23generic-names-recommendation
>=20

There is no generic name directly related to CSI apart from camera. That's
why I used mipi-csis. If preferred, I can move the name to csis or simply c=
si.
Please let me know which one is more appropriate.

Regards,
Inbaraj E


