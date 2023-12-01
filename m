Return-Path: <linux-media+bounces-1445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9C8003EB
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 07:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87330B2128F
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 06:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FA81172A;
	Fri,  1 Dec 2023 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yNkbszn6"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C51DDE;
	Thu, 30 Nov 2023 22:33:31 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B16XAPa046868;
	Fri, 1 Dec 2023 00:33:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701412390;
	bh=R3JOMs+GLcTvTmXuGQ+uZWSEdM5pv0lZocvcKZHDUSY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yNkbszn6/F7jIaLVqhcX0SwjspqMmcnD/VB+kCC6iGtV3l64BIVvBDdvnaSprN/k1
	 D5nFt/F8uioG9/TU7eoMTdPtsb39NVv6GXZsYbqvDn3QtdAAmcNSIqefXpne0KkoAF
	 R4bzE1sRH+xUmR54Nj0rK4BqcwG8TuRs+eszBTB4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B16XAIt004605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Dec 2023 00:33:10 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Dec 2023 00:33:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Dec 2023 00:33:10 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B16X9SM105901;
	Fri, 1 Dec 2023 00:33:09 -0600
Date: Fri, 1 Dec 2023 00:33:09 -0600
From: Nishanth Menon <nm@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Sebastian Fricke <sebastian.fricke@collabora.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel
 Team <kernel@pengutronix.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jackson Lee
	<jackson.lee@chipsnmedia.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, Ivan Bornyakov
	<brnkv.i1@gmail.com>,
        Deborah Brouwer <deborah.brouwer@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        <devicetree@vger.kernel.org>,
        Robert Beckett <bob.beckett@collabora.com>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        "R, Vignesh"
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v14 6/8] dt-bindings: media: wave5: add yaml devicetree
 bindings
Message-ID: <20231201063309.tingjc3cjhsqb6r7@confusing>
References: <20231108-wave5-v14-rebased-v14-0-0b4af1258656@collabora.com>
 <20231108-wave5-v14-rebased-v14-6-0b4af1258656@collabora.com>
 <CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 11:27-20231128, Geert Uytterhoeven wrote:
> Hi Sebastian,
> 
> CC TI K3

Thanks for looping us in Geert.


[...]
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - ti,k3-j721s2-wave521c
> 
> This is the only compatible value defined which contains both "k3"
> and "j72*".  I assume the "k3-" part should be dropped?

Correct - we have not been using architecture prefix such as k3- in
compatibles for any other peripheral and that lines up with DT spec[1]

$ git grep ti, Documentation/|grep compatible|grep yaml|cut -d ':' -f2|grep k3-
is empty.

I have for asked this to be cleared up[2] before I can pick the dts changes
corresponding to the binding.. I will wait for the bindings to hit linus
master prior to looking at the dts changes.

[1] https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.4
[2] https://lore.kernel.org/all/20231201062427.6fw5gn2zgkkurv4q@shadow/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

