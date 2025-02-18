Return-Path: <linux-media+bounces-26278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D7A39C59
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 13:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E8016E692
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 12:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECBD245030;
	Tue, 18 Feb 2025 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RDWoyVWf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66124338C;
	Tue, 18 Feb 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882123; cv=none; b=frgoilVT5DIzyCy+2enZzeobUhrnV17vcW2ZpyVFzRtT0PyRkc0L9oD+mGzvf0iQD1uJ75hk8iryRqfW2bwIsMZEZNLD+lSyO9JIR4CRxPc3wvSWTkc9rQsu/xipNTtvR1ZoAmh2XHVmw0quYFXcPdOsAV/n5m5Am25Mv2B7sgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882123; c=relaxed/simple;
	bh=DrNseaTwlu1baj9FfFrUyEuRbOY0WkAbyg7rLHvq8/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcTU0AwkkoE1pCgs5IztYu8uQHFjtpql86KeIt5sO70Q6U8UrqPw6hFiOZk1gU/57dktXptJrc/e3Rau32g5WxY9CelvAEtJRrB9tN99n8I23ikzTAqa76Q+b+MwPZPyODq8AvJUANCARWPm5D/dMut5u/lHNMxlGw0HzFYe4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RDWoyVWf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 217FA18D;
	Tue, 18 Feb 2025 13:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739882036;
	bh=DrNseaTwlu1baj9FfFrUyEuRbOY0WkAbyg7rLHvq8/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDWoyVWfPkTI6hWbn9tcBiYgdqyOC+z4fW6AC72LZdNWHWe4TPU7G48gaWoyZU2Ar
	 bB4lDbJSUfYzT7vPiMNX0ip5QrJeodVJP5wj9WCAS7J/rIvL/M4RS5HPMOIypn2Lzh
	 oinUo7VUDuoekFT/TK1yN0vjKDqc3Xi3KdiIh5qA=
Date: Tue, 18 Feb 2025 14:35:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/V2H(P) SoC
Message-ID: <20250218123503.GC20695@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
 <Z7R1KiIBqPcR06hP@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7R1KiIBqPcR06hP@tom-desktop>

On Tue, Feb 18, 2025 at 12:55:22PM +0100, Tommaso Merciai wrote:
> On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> > On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > 
> > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > - A different D-PHY
> > > - Additional registers for the MIPI CSI-2 link
> > > - Only two clocks
> > > 
> > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > SoC.
> > > 
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> > >  1 file changed, 48 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > index 7faa12fecd5b..0d07c55a3f35 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > @@ -17,12 +17,15 @@ description:
> > >  
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > > -      - const: renesas,rzg2l-csi2
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > > +          - const: renesas,rzg2l-csi2
> > > +
> > 
> > I'd drop the empty line.
> 
> I'll drop this line in v2, thanks.
> 
> > > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> > >  
> > >    reg:
> > >      maxItems: 1
> > > @@ -31,16 +34,24 @@ properties:
> > >      maxItems: 1
> > >  
> > >    clocks:
> > > -    items:
> > > -      - description: Internal clock for connecting CRU and MIPI
> > > -      - description: CRU Main clock
> > > -      - description: CRU Register access clock
> > > +    oneOf:
> > > +      - items:
> > > +          - description: Internal clock for connecting CRU and MIPI
> > > +          - description: CRU Main clock
> > > +          - description: CRU Register access clock
> > > +      - items:
> > > +          - description: CRU Main clock
> > > +          - description: CRU Register access clock
> > >  
> > >    clock-names:
> > > -    items:
> > > -      - const: system
> > > -      - const: video
> > > -      - const: apb
> > > +    oneOf:
> > > +      - items:
> > > +          - const: system
> > > +          - const: video
> > > +          - const: apb
> > > +      - items:
> > > +          - const: video
> > > +          - const: apb
> > 
> > I would move the clocks and clock-names definitions to the conditional
> > below. Otherwise I think a device tree that has two clocks only but
> > incorrectly uses "system" and "video" instead of "video" and "apb" will
> > validate.
> 
> Agreed. Taking as reference your work done on renesas,fcp.yaml.
> What about the following?
> 
>   clocks: true
>   clock-names: true
> 
> Then move the clocks and clock-names below as you suggested
> into the conditional block:
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g057-csi2
>     then:
>       properties:
>         clocks:
>           items:
>             - description: CRU Main clock
>             - description: CRU Register access clock
>         clock-names:
>           items:
>             - const: video
>             - const: apb
> 
>     else:
>       properties:
>         clocks:
>           items:
>             - description: Internal clock for connecting CRU and MIPI
>             - description: CRU Main clock
>             - description: CRU Register access clock
>         clock-names:
>           items:
>             - const: system
>             - const: video
>             - const: apb
> 
> Thanks in advance.

I do like that, but I think Krzysztof wasn't entirely happy with it (it
could be a separate but similar issue though, I don't recall the
details). I'd recommend checking with him (he's on CC, so he will
probably reply unless the mail gets buried in a mailbox that I am sure
fills up quite quickly).

> > >  
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -48,7 +59,7 @@ properties:
> > >    resets:
> > >      items:
> > >        - description: CRU_PRESETN reset terminal
> > > -      - description: CRU_CMN_RSTB reset terminal
> > > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
> > >  
> > >    reset-names:
> > >      items:
> > > @@ -101,6 +112,28 @@ required:
> > >    - reset-names
> > >    - ports
> > >  
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a09g057-csi2
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 2
> > > +
> > > +        clock-names:
> > > +          maxItems: 2
> > > +
> > > +    else:
> > > +      properties:
> > > +        clocks:
> > > +          maxItems: 3
> > > +
> > > +        clock-names:
> > > +          maxItems: 3
> > > +
> > >  additionalProperties: false
> > >  
> > >  examples:

-- 
Regards,

Laurent Pinchart

