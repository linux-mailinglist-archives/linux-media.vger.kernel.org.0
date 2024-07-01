Return-Path: <linux-media+bounces-14470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B291DF5D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 14:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E181F1F2405E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 12:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4202214E2C1;
	Mon,  1 Jul 2024 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P9PSzlUo"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A413D24D;
	Mon,  1 Jul 2024 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719837200; cv=none; b=PoP/mePdWEAR22oJZgdTyal6fOE1B5KYNdT1VGkjQHG5WHnEnPpLuGATUE39Yeis1OL3ZY2+O/RNsningMQYCBYrgpBMdAQVaGyq2qWMGhtBn09P5+sRS9XveLzSH8uXDywa2vjB+rQdQrZyQRB1ckTPGr0MdxaoFSeUBZ/dy1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719837200; c=relaxed/simple;
	bh=LI+EiaaUtXjCvlztbPDmqW7RSa67yefBBbUId0tcbSc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jy+MBojF5L206XYv6jp/aLiMCCDcqsd2kEbcjqxiG3Jvm6bIlNLh/J9sCGKPpoLdYHb7xgMqu0UFBEnOiOuKbSfZ4AnPtuMRWBIUKuygKanhnLpawkR1UnXxGLNFFGFSLyWwMgmdyypN5euEejdm8qjOvFTwavBl5QVF42dwClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P9PSzlUo; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 461CX3tl040710;
	Mon, 1 Jul 2024 07:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719837183;
	bh=y4VLfPsqj3o0YnCEt+VeXw7KaebJ4cvpfW3glJFxqmY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P9PSzlUor/NXZ6wL51ncNvQ9uzXUAYK6ThH69dlxLU/vOL75tcO/w5/F5aOhFpboY
	 m5FgFW+nFhjkN7dE+XBZ18DwxXSAycmo8ETn9BqdRbGvjvUkw6QD7yh9/wPIt48reM
	 hF/mRTLbCVZo4gSRC982Tg+cBANUw/+GPol3+N94=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 461CX3OM056028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 07:33:03 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 07:33:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 07:33:03 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 461CX26b093123;
	Mon, 1 Jul 2024 07:33:02 -0500
Date: Mon, 1 Jul 2024 18:03:01 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Changhuang
 Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 02/13] dt-bindings: media: ti,j721e-csi2rx-shim:
 Support 32 dma chans
Message-ID: <i4x2w6jyjxi77l6twff57vwzc3onzfejlgw6wotqo6crji4jzh@gu7mwf4ttttg>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-2-6ae96c54c1c3@ti.com>
 <d391c877-3e30-4a97-810e-241468901ff6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d391c877-3e30-4a97-810e-241468901ff6@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Krzysztof,

Thanks for the review.

On Jul 01, 2024 at 11:30:13 +0200, Krzysztof Kozlowski wrote:
> On 27/06/2024 15:09, Jai Luthra wrote:
> > The CSI2RX SHIM IP can support a maximum of 32x DMA channels.
> > 
> > These can be used to split incoming "streams" of data on the CSI-RX
> > port, distinguished by MIPI Virtual Channel (or Data Type), into
> > different locations in memory (/dev/videoX nodes).
> > 
> > Actual number of DMA channels reserved is different for each SoC
> > integrating this IP, but a maximum of 32x channels are always available
> > in this IP's register space, so set minimum as 1 and maximum as 32.

Sorry, this above paragraph is incorrect. All variants of SoCs 
integrating this IP can in-fact support 32 channels.

I will update the commit description in the next revision to make this 
clearer.

> > 
> > Link: https://www.ti.com/lit/pdf/spruiv7
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../bindings/media/ti,j721e-csi2rx-shim.yaml       | 39 ++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> > index f762fdc05e4d..0e00533c7b68 100644
> > --- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> > +++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> > @@ -20,11 +20,44 @@ properties:
> >      const: ti,j721e-csi2rx-shim
> >  
> >    dmas:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 32
> >  
> >    dma-names:
> > +    minItems: 1
> >      items:
> >        - const: rx0
> 
> So all variants now get total random number of DMAs? I don't understand
> why this is not constrained.

The default system-level resource partitioning allocates < 32 channels 
for some platforms, though that can be changed by the user [1].

I don't think a separate compatible for constraints makes sense here, as 
this is not an IP or SoC-level constraint, and only depends on how the 
end-user allocates the channels across peripherals.

> 
> Best regards,
> Krzysztof
> 

[1] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/latest/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

