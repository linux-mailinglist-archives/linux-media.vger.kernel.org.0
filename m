Return-Path: <linux-media+bounces-40808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B93DB3267A
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 04:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A700058760C
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 02:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A6B21C16B;
	Sat, 23 Aug 2025 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jy2W90b/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23471218EA8
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755916752; cv=none; b=IWmQHUIHjRJY8FCNvE0cOBJveOHAU6C7W5FhysPFVOT1bJBFLDtesI70BYxVcPNrsZ84B1QQ2PiA/vXqQIsfbhzhc8nStLlaB7Wq9W/O7pT99mPs0ZNDWB2PT7GAPnczEOhfQcz6Xl0lEG9Idy9ouYtuttFdkZ0TKT3OpHvOXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755916752; c=relaxed/simple;
	bh=L7WoG8zGop/ZKdVUhYNfywWNrZs1UmlVsAEI7SXXCWs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZjtsIqWP+i4fy2oF3bfI455O68araH6cbPA0sOhhut72HGwEV1mpKmZb5Vh9qezwdTs04lYA6CRD9BU0pSgVFoOynsQZFZE0EN1HilrfSBgvzatkcBpL862SVYCOBe184JurJT9xhIfIk+wiROV07TJsESz/6tp1wWS+c1DGHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jy2W90b/; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823023908epoutp040d1edc173b2666536648609e35d08761~eRPqzrYFL2926629266epoutp04q
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 02:39:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823023908epoutp040d1edc173b2666536648609e35d08761~eRPqzrYFL2926629266epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755916748;
	bh=QgV+PmLGp/KB9EJOqn7Inp5PsJT3991z6ChCStxbjQg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jy2W90b/yrA+cEyfyqMXqbqQteuc2jI/0L9Ybe/nN8QpCAue5U9nz09bkUuiT0Xd4
	 1QGv9YB9XuWQsft8FF2bQEDnhhxzDeENeHRSdySchf+t/gxnERhGgsBjp5d67rzs+E
	 eiBSPgHwA/nNGUV8uOTjHVnyZTpm+SMtmiOLWZc4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250823023906epcas5p2f0bf896d97618e2e66cfd9b27c4cd6bf~eRPpnxNTD1444614446epcas5p2L;
	Sat, 23 Aug 2025 02:39:06 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c81Tk0Kjcz3hhT3; Sat, 23 Aug
	2025 02:39:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250823023905epcas5p28b7b4c4015e8be3f26883ecf205427ba~eRPoLvoEO2360223602epcas5p2l;
	Sat, 23 Aug 2025 02:39:05 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823023901epsmtip1dafb04bddf79dbf9f341e0d7af7c0106~eRPkfpx8c0621806218epsmtip1J;
	Sat, 23 Aug 2025 02:39:01 +0000 (GMT)
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
In-Reply-To: <c46c6f66-dee6-4efa-a624-de62aa705206@kernel.org>
Subject: RE: [PATCH v2 10/12] dt-bindings: media: fsd: Document CSIS DMA
 controller
Date: Sat, 23 Aug 2025 08:09:00 +0530
Message-ID: <00e201dc13d7$17d2a750$4777f5f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIMxZSZAiExi2YA0x2iD7KMY0ZQ
Content-Language: en-in
X-CMS-MailID: 20250823023905epcas5p28b7b4c4015e8be3f26883ecf205427ba
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

Hi Krzysztof,

Thanks for the review.

> On 14/08/2025 16:09, Inbaraj E wrote:
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - iommus
> > +  - port
>=20
> Also, you miss here supplies (as required).

According to the HW design of FSD SoC, the control to manage CSIS power is =
given to
a separate CPU where custom firmware runs. Therefore. The Linux side does n=
ot control
the CSIS power supplies directly and are hence not included in the device t=
ree.
=20

Regards,
Inbaraj E


