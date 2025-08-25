Return-Path: <linux-media+bounces-41007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B5B33E7C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 13:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 327EE3B2258
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001CA2E7F16;
	Mon, 25 Aug 2025 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CI6X0S/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1926C399
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756122908; cv=none; b=MHHrPKZKrftbcU2i8AG7kOKxfOOotTWkoQAReMQYeKOdq8sPVBxbvbrlu2QvjetL5CspebmwIcThr+YAKFlDU9cvSUJ2vGBBOFVRSqs7rcZhiqGd9QstrglJbErGVZQds7EewiucBbR+QLutFBZEETSN/ZfRKOjqtqQWniAHPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756122908; c=relaxed/simple;
	bh=t4a7zrF0Xr2ClAN6pV1FixF/O//yC/uzplxDHLALIK4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=qQ0lYbaCXRVEkyPA5eP+CrTIWshPvKeF6Pif625D7WQbSVlUGV5ERcTznPSUEQP4KESZ/aNKWKfjrYheC6u9O+37NfIV0zo6dATSA1zfnMpkAosyRek3rQa8byo05FWE+msrYMneXnSbATOSoMGsLxhaa4Yo1Yzjj4HLuyf17N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CI6X0S/J; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825115504epoutp04a45d3e8ddca1d5e87ad5f8dd098becd6~fAHotdY-c2625826258epoutp04c
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:55:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825115504epoutp04a45d3e8ddca1d5e87ad5f8dd098becd6~fAHotdY-c2625826258epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756122904;
	bh=t4a7zrF0Xr2ClAN6pV1FixF/O//yC/uzplxDHLALIK4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CI6X0S/Jsv7Kjb6cHe/Y/TBFcxIENb+lsuEYgQ8sV+JGy+RCHJ/rp+AsYvgFCc83y
	 4sO2ljNm/Q0wTFqR+1D27EXtXh6nABLvgDnA9Nr53VP6mqr+LExS6QbtiXkhGwKL8o
	 hnztLPGBbBtRKWtnpraFI8mrEMHAsfLjRXvesLoc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825115503epcas5p3cfb8d3f909e3d377f5e0ff6166178520~fAHoFByz-3077330773epcas5p37;
	Mon, 25 Aug 2025 11:55:03 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9TkG5JQ2z2SSKZ; Mon, 25 Aug
	2025 11:55:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825115502epcas5p4279b95596caf95a26b0d5c6ccec726e9~fAHmgL5x80820308203epcas5p4B;
	Mon, 25 Aug 2025 11:55:02 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825115457epsmtip13e6a6a0580ea03ee165871a0c3831561~fAHinOYHh0161601616epsmtip1X;
	Mon, 25 Aug 2025 11:54:57 +0000 (GMT)
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
In-Reply-To: <322df419-10fb-412c-9c3f-7493d9a58670@kernel.org>
Subject: RE: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Mon, 25 Aug 2025 17:24:56 +0530
Message-ID: <015901dc15b7$16a67b40$43f371c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQHrKQRZAj9O8PIBXjI9/wIrSUI/Adz/j96ya6VQEA==
Content-Language: en-in
X-CMS-MailID: 20250825115502epcas5p4279b95596caf95a26b0d5c6ccec726e9
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
	<00d401dc13d2$65033080$2f099180$@samsung.com>
	<322df419-10fb-412c-9c3f-7493d9a58670@kernel.org>

Hi Krzysztof,

=2E
> >
> > I noticed that Exynos and NXP driver configs are added in the defconfig=
.
> > Could you please clarify why I shouldn't add my driver config in defcon=
fig?
>=20
> No, I gave you rationale why your commit description is poor.

I'll update the commit description in next patchset.

>=20
> Best regards,
> Krzysztof

Regards,
Inbaraj E


