Return-Path: <linux-media+bounces-41014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88867B3400D
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E25D206513
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F57C1E766E;
	Mon, 25 Aug 2025 12:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AMh285rd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE672219319
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756126257; cv=none; b=KUDfqejXDhZ7u4VEO836hZYtkV0j4+pIOzRJ/bNu3PqMRJvlY0sghsGPbX+9UyxKs14d2yZHGXxMZxCxZTLcgbI3qgnQzBpYokp5DqP3H7ttx3zuvTZ0qGukL9b1vXp06Xyo2YURrC20HGZG03JKFJWn6zcIe29WChojUznoRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756126257; c=relaxed/simple;
	bh=PrWQKYuTQBEonO1XwozKv/FyqCzSqcNDCkgOqZLybHY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=SFfX0ZrIRbR1cokWL5DBVw9SHYk20wpr9TvrbhfOVYaE/jAx4BXh+/hUYQFC4AI4gaZS1q15lFicffi9Zky09DpbMJusgAq6X7/PdbtZQbJZPIw2qC8GFTSpn4b318WRxE6jKlz/82rJFNnAZY5TS0trJyKsOLGhRko0VkHzW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AMh285rd; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825125054epoutp040560563ba90d7268b0f53075a9a40e54~fA4YcDd3I0649706497epoutp04Y
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 12:50:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825125054epoutp040560563ba90d7268b0f53075a9a40e54~fA4YcDd3I0649706497epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756126254;
	bh=IyZaAnO05abMqFNQPoye38pNw/RRf81HOUABNDFs+ow=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=AMh285rdmU623jHntaAR4Uc/mjZOaKCdNV28Ulz6Y8YFW4MLqPqU9eQrLry+2PA5e
	 ful1ZrE3jAecQhBtGRFTOPZ3iCsxrDZjsbVrnFoa/JIQ4nGUsxCSoecAGP75ts7x/3
	 3eXVslFmwYW4edJjEgHeDXPOGDpotI/AG6N10jFc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825125053epcas5p294541daa3b844dd44558dd8ff6676e60~fA4XffRJ20205802058epcas5p2S;
	Mon, 25 Aug 2025 12:50:53 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9Vyh1bXbz2SSKY; Mon, 25 Aug
	2025 12:50:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825125051epcas5p4f1fd9b26b26e388fdeef403aa802c252~fA4V6hK7A1505115051epcas5p4O;
	Mon, 25 Aug 2025 12:50:51 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825125047epsmtip11752ab6f3c0ad6db5a0093669b0fc3db~fA4SKmAoD3254932549epsmtip1I;
	Mon, 25 Aug 2025 12:50:47 +0000 (GMT)
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
In-Reply-To: <926e9bb2-cdde-4048-9ae2-159d088aa935@kernel.org>
Subject: RE: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD
 SoC
Date: Mon, 25 Aug 2025 18:20:46 +0530
Message-ID: <016301dc15be$e3256300$a9702900$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQF6bLd9AsRKNAMBJ/ZVhAEp+FCyAvdCX9oBWhQiOgImNHTdsk/6UEA=
Content-Language: en-in
X-CMS-MailID: 20250825125051epcas5p4f1fd9b26b26e388fdeef403aa802c252
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946@epcas5p4.samsung.com>
	<20250814140943.22531-4-inbaraj.e@samsung.com>
	<ac9769af-9ab6-4b48-9890-ec3bcda3b180@kernel.org>
	<00d001dc136a$36ad7230$a4085690$@samsung.com>
	<7b7f6958-3178-4c6f-8be3-f52ef77464f7@kernel.org>
	<00d201dc136d$1fdd6bc0$5f984340$@samsung.com>
	<926e9bb2-cdde-4048-9ae2-159d088aa935@kernel.org>

Hi Krzysztof,

> >
> > Using tesla,syscon-csis results in a =22prefix not found=22 issue when
> > running dtbs_check
> Because you develop on ancient, 10 year old downstream kernel?
>=20
> You really do not try enough and this is just wasting our time.
>=20
> Please think and really carefully check your replies. What prefix do you =
have
> in compatible? This command:
> git grep tesla, =7C wc -l
>=20
> gives '99' results including obviously vendor prefix.
>=20
> So your warning is basically impossible or your code is just broken.
> Don't just ask maintainers on every little trouble you have. You must deb=
ug
> it. Not we.
>=20

Sorry, I made a mistake while  running dtbs_check. I'll use the tesla prefi=
x in the next
patchset

Regards,
Inbaraj E


