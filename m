Return-Path: <linux-media+bounces-42668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17214B7CD9B
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1771C200AF
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 12:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1099330CB5F;
	Wed, 17 Sep 2025 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WBNlnGOy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B4232BC04
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110988; cv=none; b=qkCzIh05U4aSmrdlWtq4uoZEzff/LriyNb2j0eIVmMCIcnjsYZn6KYdcoJ8S0A9QffqcJ8JeUBoEMfS3Tdzhc3ylRRVVodrhMfqUPJlFvvzvo2ZFaqKFZbVuMdQtuyMekBktlNY9YxHznKCBIm2etu2EJgmd7jT25ZCozhq3pRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110988; c=relaxed/simple;
	bh=8oUJwioEDnAfVO3Y1PXWwxoLC14KxAtkMyhu2PHDtkY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=E72NpKesHenLyazmPgPZ6rFGQWMHIxftP5mB9bxRnJsY5wfx4mbM2A/iRp0Fc6uH6cvTt9jmdHmvEZFeLA0mkKMdWUb7SqFd96k8pYpDhigUQFW+FTvYGX5RbqlpgnHzZWLdDLz3/NH5bkneXjC8nw7Icn2UtQaG6q84mUs9ffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WBNlnGOy; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250917120943epoutp01526e3a2ccc7a12a4ad03d939314ae424~mEJ-TYnIk1612016120epoutp01B
	for <linux-media@vger.kernel.org>; Wed, 17 Sep 2025 12:09:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250917120943epoutp01526e3a2ccc7a12a4ad03d939314ae424~mEJ-TYnIk1612016120epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758110983;
	bh=owWadpSv9H77ZxbKoBmofshhPRj3pGK/wIU+s8/EQVc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=WBNlnGOyvhvdURAbgVsc8eIroy5H8a2SRO75EfKSBc741Nklz9GuHlXwKhGkpBx7i
	 NJ4PocbRepuBeZmxh6sDk2lkIC6+IfkVvFVtbwTWIqq00H9tVxmPrUcs4OBKvjsIBT
	 IH6udZJYiSGrQ0QhlT51XCv96TJuZCZo1e68KdI4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917120942epcas5p357c123d3099e83bb132f2cf79da872fb~mEJ_a0QgV0694206942epcas5p3J;
	Wed, 17 Sep 2025 12:09:42 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRcyY23SNz3hhT4; Wed, 17 Sep
	2025 12:09:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250917120940epcas5p2ccd8cbd489fe1634d9b176f1e8c01e79~mEJ85vD6F3174731747epcas5p26;
	Wed, 17 Sep 2025 12:09:40 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250917120937epsmtip29e2450f342f91ad1dce9599cf91c9426~mEJ6DjSln1850718507epsmtip2N;
	Wed, 17 Sep 2025 12:09:37 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Rob Herring'" <robh@kernel.org>
Cc: <rmfrfs@gmail.com>, <laurent.pinchart@ideasonboard.com>,
	<martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<pankaj.dubey@samsung.com>, <ravi.patel@samsung.com>,
	<shradha.t@samsung.com>
In-Reply-To: <20250829174638.GA1054721-robh@kernel.org>
Subject: RE: [PATCH v3 1/7] dt-bindings: media: nxp: Add support for FSD SoC
Date: Wed, 17 Sep 2025 17:39:35 +0530
Message-ID: <024f01dc27cb$f167d370$d4377a50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIBSJFzUA8Lz5NCh/Whmc1GwVh24gH1qTvqAkLBkWsB/yoSjrQbSRSA
Content-Language: en-in
X-CMS-MailID: 20250917120940epcas5p2ccd8cbd489fe1634d9b176f1e8c01e79
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085926epcas5p1b82576210280fb44c6c7f02851da71c6@epcas5p1.samsung.com>
	<20250828085911.81266-2-inbaraj.e@samsung.com>
	<20250829174638.GA1054721-robh@kernel.org>

Hi Rob,

Thanks for the review


> > +    description:
> > +      Syscon used to hold and release the reset of MIPI D-PHY
> 
> Reset? Sounds like you should be using the reset binding.

The Tesla FSD Soc does not have a dedicated reset controller. Instead, we
are using the
system controller which is MMIO Space handled by syscon driver, to assert or
de-assert the D-PHY
reset. So, I prefer to use syscon.

> 
> > +
> >    phy-supply:
> >      description: The MIPI D-PHY digital power supply
> >
> > @@ -93,7 +91,8 @@ properties:
> >              properties:
> >                data-lanes:
> >                  description:
> > -                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2
data lines.
> > +                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2
data
> > +                  lines.
> 
> Reformatting should be a separate patch.

Sure, I'll add new patch in next patchset.

> 
> >                  minItems: 1
> >                  items:
> >                    - const: 1
> > @@ -115,7 +114,6 @@ required:
> >    - interrupts
> >    - clocks
> >    - clock-names
> > -  - power-domains
> >    - ports
> >
> >  additionalProperties: false
> > @@ -124,20 +122,73 @@ allOf:
> >    - if:
> >        properties:
> >          compatible:
> > -          contains:
> > -            const: fsl,imx7-mipi-csi2
> > +          const: fsl,imx7-mipi-csi2
> 
> 'contains' was correct. It is more future proof when there is another SoC
that
> is backwards compatible with imx7.

Sure, I'll add new patch in next patchset.

> 
> >      then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: The peripheral clock (a.k.a. APB clock)
> > +            - description: The external clock (optionally used as the
pixel
> > +                clock)
> > +            - description: The MIPI D-PHY clock
> > +        clock-names:
> > +          items:
> > +            - const: pclk
> > +            - const: wrap
> > +            - const: phy
> > +        tesla,syscon-csis: false
> > +        fsl,num-channels: false
> 
> blank line

Will remove in nextpatchset.

> 
> >        required:
> > +        - power-domains
> >          - phy-supply
> >          - resets
> > -    else:
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: fsl,imx8mm-mipi-csi2
> > +    then:
> >        properties:
> >          clocks:
> > -          minItems: 4
> > +          items:
> > +            - description: The peripheral clock (a.k.a. APB clock)
> > +            - description: The external clock (optionally used as the
pixel
> > +                clock)
> > +            - description: The MIPI D-PHY clock
> > +            - description: The AXI clock
> >          clock-names:
> > -          minItems: 4
> > +          items:
> > +            - const: pclk
> > +            - const: wrap
> > +            - const: phy
> > +            - const: axi
> > +        tesla,syscon-csis: false
> > +        fsl,num-channels: false
> >          phy-supply: false
> >          resets: false
> 
> blank line
> 
> > +      required:
> > +        - power-domains
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: tesla,fsd-mipi-csi2
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: The peripheral clock (a.k.a. APB clock)
> > +            - description: The DMA clock
> 
> Wouldn't this be the same as the "AXI clock"?

According to v4.3 manual it is DMA clock.

> 
> > +        clocks-names:
> > +          items:
> > +            - const: pclk
> > +            - const: aclk
> > +        phy-supply: false
> > +        resets: false
> > +        power-domains: false
> 
> blank line

Sure will remove in next patchset.
> 
> > +      required:
> > +        - tesla,syscon-csis
> > +        - fsl,num-channels
> >
> >  examples:
> >    - |
> > --
> > 2.49.0
> >

Regards,
Inbaraj E


