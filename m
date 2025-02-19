Return-Path: <linux-media+bounces-26418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248B9A3CB38
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3951883E88
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9D8256C7A;
	Wed, 19 Feb 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fNrL9+qr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91BD1C6FE9;
	Wed, 19 Feb 2025 21:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999878; cv=none; b=gst0XwGNq9bAWojsWbdMycwvRny+n5K+hR8W0eS+liX5yIfhyvgunMC47cna3yVLsKOPtHJQk9bdeStqn7s6tgiEmKof064XaFQxaHsmTx1+IacibUciLe5YeYWS7sMpjnZGJG2R1k24gLy4GcYHkhpbzEIJqViZQMjOm/B+Hec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999878; c=relaxed/simple;
	bh=1X2BOKSVh3K8xi0Zs9JwRulWC942UXKMjUOVk49fsVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUH8YEIIlgkwNMp9NYIXp8dOdieh4QPvI+hrqnatKbyYtSraC4MW27gGV5fbP/ZRoANBqlqzxxzGyGNNBl2YI/GU5R59SiAreb2B9TszWUGbW4dEA0xqJAXxYxDTdnh0vWegW/8z8tF8ItY+if/61A2XmzEUl2g+/TVaY8N4qCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fNrL9+qr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78F14169;
	Wed, 19 Feb 2025 22:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739999791;
	bh=1X2BOKSVh3K8xi0Zs9JwRulWC942UXKMjUOVk49fsVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNrL9+qrRiXYpe+ui1lESh8ksitjT5ZXPSjc2ZH28uxRs5mlYbtTMspy4alOCXPI9
	 NEjoIo18eu8dP+D6Wx+GMogJAq8Ul6/uhN6djY7fiFSB0qIIhqseaXjx6WvEIJvq/O
	 exFRNjaElgZ3Q52qA7ZE64wGWbu/gD4qFY/FutqA=
Date: Wed, 19 Feb 2025 23:17:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
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
Message-ID: <20250219211738.GE31825@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
 <20250219145139.GA2551711-robh@kernel.org>
 <20250219151237.GB31825@pendragon.ideasonboard.com>
 <20250219205620.GA2912221-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219205620.GA2912221-robh@kernel.org>

On Wed, Feb 19, 2025 at 02:56:20PM -0600, Rob Herring wrote:
> On Wed, Feb 19, 2025 at 05:12:37PM +0200, Laurent Pinchart wrote:
> > On Wed, Feb 19, 2025 at 08:51:39AM -0600, Rob Herring wrote:
> > > On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> > > > Hi Tommaso, Prabhakar,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > 
> > > > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > > > - A different D-PHY
> > > > > - Additional registers for the MIPI CSI-2 link
> > > > > - Only two clocks
> > > > > 
> > > > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > > > SoC.
> > > > > 
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> > > > >  1 file changed, 48 insertions(+), 15 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > > index 7faa12fecd5b..0d07c55a3f35 100644
> > > > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > > @@ -17,12 +17,15 @@ description:
> > > > >  
> > > > >  properties:
> > > > >    compatible:
> > > > > -    items:
> > > > > -      - enum:
> > > > > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > > > > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > > > > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > > > > -      - const: renesas,rzg2l-csi2
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > > > > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > > > > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > > > > +          - const: renesas,rzg2l-csi2
> > > > > +
> > > > 
> > > > I'd drop the empty line.
> > > > 
> > > > > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> > > > >  
> > > > >    reg:
> > > > >      maxItems: 1
> > > > > @@ -31,16 +34,24 @@ properties:
> > > > >      maxItems: 1
> > > > >  
> > > > >    clocks:
> > > > > -    items:
> > > > > -      - description: Internal clock for connecting CRU and MIPI
> > > > > -      - description: CRU Main clock
> > > > > -      - description: CRU Register access clock
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - description: Internal clock for connecting CRU and MIPI
> > > > > +          - description: CRU Main clock
> > > > > +          - description: CRU Register access clock
> > > > > +      - items:
> > > > > +          - description: CRU Main clock
> > > > > +          - description: CRU Register access clock
> > > > >  
> > > > >    clock-names:
> > > > > -    items:
> > > > > -      - const: system
> > > > > -      - const: video
> > > > > -      - const: apb
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - const: system
> > > > > +          - const: video
> > > > > +          - const: apb
> > > > > +      - items:
> > > > > +          - const: video
> > > > > +          - const: apb
> > > > 
> > > > I would move the clocks and clock-names definitions to the conditional
> > > > below. Otherwise I think a device tree that has two clocks only but
> > > > incorrectly uses "system" and "video" instead of "video" and "apb" will
> > > > validate.
> > > 
> > > No, that wouldn't be allowed. The preference is to have it like this 
> > > because it discourages creating more variations. If the names are all 
> > > defined in if/then schema, then you can just add a new one with any 
> > > names you want. Though if the variations become such a mess, then 
> > > defining them in the if/then schemas would probably be better.
> > > 
> > > It would be better if 'clocks' could be reworked to avoid the 'oneOf' 
> > > though (oneOf == poor error messages). It just needs a 'minItems: 2' 
> > > added and the descriptions reworded for both cases.
> > 
> > Don't the items in clocks need to match the items in clock-names ? We
> > can't reorder clock-names items as that would be an ABI breakage, so we
> > can't reorder clocks items either.
> 
> Validation wise, the only thing we check is is it 2 or 3 entries. No way 
> to enforce it's the right clock. The description is just for humans. So 
> you could just put "(optional)" on the first entry though there is no 
> way in json-schema to really do that. If you prefer as-is with the 
> oneOf, that's fine too.

Adding "(optional)" would work for me in this case I think, even if I
think it could be a bit confusing. I'm OK either way.

-- 
Regards,

Laurent Pinchart

