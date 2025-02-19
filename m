Return-Path: <linux-media+bounces-26397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA68A3C2A8
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A31176CF6
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BC61F4192;
	Wed, 19 Feb 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdEcfxmT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98081F3BA9;
	Wed, 19 Feb 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976701; cv=none; b=D4HGYPAPrMhyO0DTHS78ObJlXvtpnowKdXopW7g5y/1EcCCOoYA50dUrZt42d1q2JNO92h2PAg85F8jBDLXYVWCOzHS1vJjpwErtCjRR1PvqxOGWD8PTozJtOqkpbBu3Pa21IulHIGYPakulKFGwHtkvyHzcPxJcJl26qs8N/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976701; c=relaxed/simple;
	bh=/CK+5j11wLa5nDdap0f7zUnuk4BO4rRMkCo5B3kEvHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4Gpw3SNj57tA+kOHfgSk1HNaJNQ0TI801pz2XI0wa4hvf8yizEMEKgSnYeJmrL2LWLA3OFEK/U4UvAY2QSAKN7sXHBS5xDmAIr8Q8AVvfXMiHkVBCElA05S51M7uyciKmBjGl5i9XbiP1Qc4xcddO97fV6m8HjQ0/JQej8mCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdEcfxmT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B06EC4CED1;
	Wed, 19 Feb 2025 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739976700;
	bh=/CK+5j11wLa5nDdap0f7zUnuk4BO4rRMkCo5B3kEvHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdEcfxmTQ53fLKTmAQfck3fGldoocOBNo5RWI2h0Nrti6iICPUgkAGC26VLBFrwoz
	 Lqb8fVLVzz1/JbC3biXuvhUGGcPUvWxoKxF8x1QpXVuiMAPZ+qpyuyU8bS2r/bpYij
	 6F4aedcJOysjUHHlPgeuGIl/reHRqD+kRjtRt9yi1BwYcvhWaAD30gBc4UZ6qDJhxn
	 8vN0lMiy7Opud8ghhiDZIhu1eD3sFvvnpPs3c66QNkSBOQke63+WwWsIrxEu+r2CAu
	 bCx0L9B2ZG/A13Lgtl6L0exMKCM/V0QRcJSJMUwC8SS7abUxRGmNI12csTHNBlr2It
	 ULmrooa4K29gg==
Date: Wed, 19 Feb 2025 08:51:39 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <20250219145139.GA2551711-robh@kernel.org>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214002951.GB8393@pendragon.ideasonboard.com>

On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> Hi Tommaso, Prabhakar,
> 
> Thank you for the patch.
> 
> On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > found on the Renesas RZ/G2L SoC, with the following differences:
> > - A different D-PHY
> > - Additional registers for the MIPI CSI-2 link
> > - Only two clocks
> > 
> > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > SoC.
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> >  1 file changed, 48 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > index 7faa12fecd5b..0d07c55a3f35 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > @@ -17,12 +17,15 @@ description:
> >  
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > -      - const: renesas,rzg2l-csi2
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > +          - const: renesas,rzg2l-csi2
> > +
> 
> I'd drop the empty line.
> 
> > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> >  
> >    reg:
> >      maxItems: 1
> > @@ -31,16 +34,24 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > -    items:
> > -      - description: Internal clock for connecting CRU and MIPI
> > -      - description: CRU Main clock
> > -      - description: CRU Register access clock
> > +    oneOf:
> > +      - items:
> > +          - description: Internal clock for connecting CRU and MIPI
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> > +      - items:
> > +          - description: CRU Main clock
> > +          - description: CRU Register access clock
> >  
> >    clock-names:
> > -    items:
> > -      - const: system
> > -      - const: video
> > -      - const: apb
> > +    oneOf:
> > +      - items:
> > +          - const: system
> > +          - const: video
> > +          - const: apb
> > +      - items:
> > +          - const: video
> > +          - const: apb
> 
> I would move the clocks and clock-names definitions to the conditional
> below. Otherwise I think a device tree that has two clocks only but
> incorrectly uses "system" and "video" instead of "video" and "apb" will
> validate.

No, that wouldn't be allowed. The preference is to have it like this 
because it discourages creating more variations. If the names are all 
defined in if/then schema, then you can just add a new one with any 
names you want. Though if the variations become such a mess, then 
defining them in the if/then schemas would probably be better.

It would be better if 'clocks' could be reworked to avoid the 'oneOf' 
though (oneOf == poor error messages). It just needs a 'minItems: 2' 
added and the descriptions reworded for both cases.

Rob

