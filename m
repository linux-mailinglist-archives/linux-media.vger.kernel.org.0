Return-Path: <linux-media+bounces-40760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A303DB31A0A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 15:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB1901891EB9
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 13:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4422FD7C9;
	Fri, 22 Aug 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YpMiv/9z"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CB27462
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869990; cv=none; b=DpY0h6DMnzJXdhv/o1ZycJtGQRqpqGxvCPPgtG2CmOYAMhipsUCeC/Sfza3gd2B54D8u2OJfGL6w8kSxSQS8n+EaNUs+0FQ8udlnu9L4tx4gnY+yCMV8g7FB4/csJoH4by3ViwOjkvCAaK7bMThaalaC2rg1ln5Ui4wPd61G9p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869990; c=relaxed/simple;
	bh=CA66BcBYt8100hRqu+e6ER5OVlN6pGDYn+4HZgMWABA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GCeR3qOm8vPUhTCUhgpHM08+pmrj4bv8xCY5p2e7ty6edmWFQ1DpHPuCk2LlmS82vthDCSv7Ub1dtTaoTOchaLHwcr6jkydCrZpwoBtYxoSgif9fRwOFgcBPSTBwUb0mohHyuLu6DYbIU2DbVPa1ELMI5nrd2GL1LSzBC31UlRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YpMiv/9z; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250822133945epoutp01664aeac9046905adcb9c9f76c25ed2bd~eGnLPqEUp0583705837epoutp01U
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:39:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250822133945epoutp01664aeac9046905adcb9c9f76c25ed2bd~eGnLPqEUp0583705837epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755869985;
	bh=u1nIEzQAHzexEwe1eBw6VP9QOhuA5DOvKet0k5mUpZU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YpMiv/9zvNnJVVTqDCQFz8ApOBDdjhGp5prNSGmskCpeGTCMbkWiyn3wFR5uZuKXD
	 J8bh6I+edk0r0H1aJ8MTy2GLsjoE3hQcgepGQ+L9bfurpJbtGDWb1soIpc0GV/w/lc
	 dKW1V/MRwVJlxcj/SO9oZASAAVnPikD0WB2KRNNg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250822133943epcas5p3db3194b4f778165c369f994cc9fb349f~eGnKIRpRe2325823258epcas5p3h;
	Fri, 22 Aug 2025 13:39:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7hBR05d6z6B9m4; Fri, 22 Aug
	2025 13:39:43 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250822133942epcas5p37a9e03d4cefed84c9f458f47b648d929~eGnIVLNXg2325823258epcas5p3c;
	Fri, 22 Aug 2025 13:39:42 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250822133937epsmtip1fcccb1ff7946a18f9bda033b67ce9139~eGnEmK2i82772327723epsmtip1D;
	Fri, 22 Aug 2025 13:39:37 +0000 (GMT)
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
In-Reply-To: <ac9769af-9ab6-4b48-9890-ec3bcda3b180@kernel.org>
Subject: RE: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD
 SoC
Date: Fri, 22 Aug 2025 19:09:36 +0530
Message-ID: <00d001dc136a$36ad7230$a4085690$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQF6bLd9AsRKNAMBJ/ZVhLKIV+Nw
Content-Language: en-in
X-CMS-MailID: 20250822133942epcas5p37a9e03d4cefed84c9f458f47b648d929
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


Hi Krzysztof,

Thanks for the review.

>=20
> Explain the hardware.

I'll explain in the next patchset.

>=20
> >
> > Signed-off-by: Inbaraj E <inbaraj.e=40samsung.com>
> > ---
> >  .../bindings/media/nxp,imx-mipi-csi2.yaml     =7C 88 ++++++++++++++---=
--
> >  1 file changed, 68 insertions(+), 20 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > index 03a23a26c4f3..802fb1bd150d 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > =40=40 -14,7 +14,7 =40=40 description: =7C-
> >    The NXP i.MX7 and i.MX8 families contain SoCs that include a MIPI CS=
I-2
> >    receiver IP core named CSIS. The IP core originates from Samsung, an=
d
> may be
> >    compatible with some of the Exynos4 and S5P SoCs. i.MX7 SoCs use
> > CSIS version
> > -  3.3, and i.MX8 SoCs use CSIS version 3.6.3.
> > +  3.3, i.MX8 SoCs use CSIS version 3.6.3 and FSD SoC uses CSIS version=
 4.3.
> >
> >    While the CSI-2 receiver is separate from the MIPI D-PHY IP core, th=
e PHY
> is
> >    completely wrapped by the CSIS and doesn't expose a control
> > interface of its =40=40 -26,6 +26,7 =40=40 properties:
> >        - enum:
> >            - fsl,imx7-mipi-csi2
> >            - fsl,imx8mm-mipi-csi2
> > +          - tesla,fsd-mipi-csi2
>=20
>=20
> Isn't this Samsung CSI IP?=20

Yes, it is Samsung CSI IP.

Why are you adding it to NXP?

Samsung CSIS IP core present in Exynos(samsung/exynos4-is/mipi-csis.c) seri=
es is
completely different from the one in the Tesla FSD SoC. However, it is comp=
atible
with the samsung CSIS IP used in the NXP SoC. For better code reusability, =
I am
integrating it with the NXP imx-mipi-csis driver.

=20
> Nothing in commit, msg helps me to understand that.

I'll explain the same in commit description as well.

>=20

> >        - items:
> >            - enum:
> >                - fsl,imx8mp-mipi-csi2
> > =40=40 -38,24 +39,21 =40=40 properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    minItems: 3
> > -    items:
> > -      - description: The peripheral clock (a.k.a. APB clock)
> > -      - description: The external clock (optionally used as the pixel =
clock)
> > -      - description: The MIPI D-PHY clock
> > -      - description: The AXI clock
> > +    minItems: 2
> > +    maxItems: 4
> >
> >    clock-names:
> > -    minItems: 3
> > -    items:
> > -      - const: pclk
> > -      - const: wrap
> > -      - const: phy
> > -      - const: axi
> > +    minItems: 2
> > +    maxItems: 4
> >
> >    power-domains:
> >      maxItems: 1
> >
> > +  samsung,syscon-csis:
>=20
> samsung, so not nxp. Even more confusing.
>=20

I used samsung,syscon-csis because the system controller on Tesla FSD
follows Samsung's sysreg design.

>=20
> Best regards,
> Krzysztof

Regards,
Inbaraj E


