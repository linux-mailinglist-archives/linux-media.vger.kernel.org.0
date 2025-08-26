Return-Path: <linux-media+bounces-41072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F29B359D9
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3211B6751C
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3F3334375;
	Tue, 26 Aug 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r7NlZ/4t"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B5318146
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202918; cv=none; b=Y+/8nFY0JOuMX3+JFXdUgBGlDSt8O4Ix9B+MffpOuR983iyDS1ly304ktP2oLQkn0M/hHlbCAJZOQRjvxY7PFD+rb0t+cpOzjNIPwOnUV8CLg9++am80UWFhwdAQJglo+MNuAT+qWHZYNeVJ66urCFn0ksrtHYmmxBbDGckO/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202918; c=relaxed/simple;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=W9NpuSk6OBSt2WkHDztfIUWddqD9XlvWW0MzC4mlL1yjaQbGKVFgSV3iTWKQlX7QubC9BDHfpfW6lVk04gMuDr3BDhT6JQyax4VZEhIN3KcvQGH4H9VXxWDqEoEd+mDmlYOMtdyUp5OUOTC/EdNp1x9GLKThPjP2r7r0TGDbMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r7NlZ/4t; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250826100829epoutp0476038091c0a7dc54f548b5ca9e991b9a~fST220OrP2441624416epoutp04_
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:08:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250826100829epoutp0476038091c0a7dc54f548b5ca9e991b9a~fST220OrP2441624416epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756202909;
	bh=gygMN3gMSxZ6Evr4Nrnpma342Igh7n4myrgw/1fPWg4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=r7NlZ/4tAu+9H/3P7ZWUKTeFXtGPrnNGXPVGjg+FnDizdhhY2CcucA6jZY56cem/W
	 +67efryuTeLX78KEo8RXX7wyJn+cGCSiHzt5hSkaHeJF9GbnTAncXUgfih65s/Ru86
	 AnYJnsVxc+pynbElLONt0wHfZZL3yl6125+xZmlE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250826100827epcas5p1193525accefc68efcd36c224d01ca9fc~fST10omlf3119231192epcas5p1b;
	Tue, 26 Aug 2025 10:08:27 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cB3Jq08MPz6B9mF; Tue, 26 Aug
	2025 10:08:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac~fST0MRrip0241602416epcas5p2f;
	Tue, 26 Aug 2025 10:08:26 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250826100822epsmtip1d21b4e23ad85bcf46748f0d59cda39b5~fSTwTkU862841628416epsmtip1X;
	Tue, 26 Aug 2025 10:08:21 +0000 (GMT)
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
In-Reply-To: <1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Tue, 26 Aug 2025 15:38:19 +0530
Message-ID: <019c01dc1671$5c8f6850$15ae38f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXxwGMECOMAYbqfFkCHlK3ygEZONEMslGN25A=
Content-Language: en-in
X-CMS-MailID: 20250826100826epcas5p24abdd08b355b1a7c1064b086bb9c11ac
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
	<00d101dc136c$aa037020$fe0a5060$@samsung.com>
	<41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
	<016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
	<1dfaedc8-88e6-4749-8726-e8f66878e57e@kernel.org>

Hi Krzysztof,


 >> Googling for =22MIPI CSIS=22 gives me 0 results, so I still claim this =
is
> >> not a generic name.
> >
> > I checked other vendors (e.g: freescale), and they are using mipi-csi.
> > I'll adopt for the same.
> >
> >
>=20
> Then it is just =22csi=22?=20

For the CSIS MIPI CSI-2 Rx handled by imx-mipi-csis driver, I'll keep node =
name as =22csi=22

>Except that you have some other different nodes called
> =22csi=22 as well, so two different devices are =22csi=22?

For CSIS video capture interface which is handled by fsd-csis driver I'll k=
eep node
name as =22csis=22.
 If =22csis =22 and =22csi=22 is kind of confusing in the same dt, then I'l=
l keep
as =22video=22.

is it fine?

Regards,
Inbaraj E


