Return-Path: <linux-media+bounces-26412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8EBA3CA8F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DA0177021
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 20:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D957024FC02;
	Wed, 19 Feb 2025 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g//3XvXs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3324F5A5;
	Wed, 19 Feb 2025 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998582; cv=none; b=llVjL7spUpNhiK/VsegzqTYl9uki/4CUHfZKFKlgOecyPp90Q8mQ592txGIPwfbrlVQh2C5qlYkrDKmAsgzEFFLoRKPnMhBYnWIBsjKDsCSHM3srx5GzjG6kbrsBTztBoWvtQ2ZyEypru2tAVCPBKWk5cWZxK5F3+GMUPJufv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998582; c=relaxed/simple;
	bh=SwVFKxSc+q+/Fk6lprZYJUu87KetLTJcBHlaby5JfD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxMJIk4LXF/hr6buN3vskF2N14t4h72e61LGk9cFmo6gTD1U3nzvTHH2DO33v5w1wqiIDJCws5eVm5FBkBMkyKr2hm9iSUjsAw7Ucy9qUQbFob9s8RWD8XJivq1AekKpnDNMWqdoz4qOMiQCnmKoXuyr0QcZixkkIpbD0hjQQY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g//3XvXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CF9C4CEE6;
	Wed, 19 Feb 2025 20:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739998581;
	bh=SwVFKxSc+q+/Fk6lprZYJUu87KetLTJcBHlaby5JfD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g//3XvXseCTgecaubv9AFYITuKjsv0klarkoDHLZpSRf7EuHldOjnCEQqpDPkCIFe
	 WjVpoJmy+hDof+8PzYw3CJiBYQ+TZ7HsClDeJzmxzD8rvBCO7dv6NHJrI4KzFCAP/u
	 qiexEJG77DV9LckiMfeHH7IHpTTPpMaERQJYbMx/bpp1MVphxAGD0QvwfnQq3wY8uG
	 dYB4s5aup4KU9qfnnLYshDpAcgPWcrKmIGfdxaEC9LPjMlmJQAC674HE9rs/kbs2pg
	 R8jWVjb5CCdTPN0r4Hr0fV6+tnC3Ojcszd+exZSU5ZfdW27LSll/g2fEOBeKv6BEeT
	 1THu592Sqa84A==
Date: Wed, 19 Feb 2025 14:56:20 -0600
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
Message-ID: <20250219205620.GA2912221-robh@kernel.org>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-3-tommaso.merciai.xr@bp.renesas.com>
 <20250214002951.GB8393@pendragon.ideasonboard.com>
 <20250219145139.GA2551711-robh@kernel.org>
 <20250219151237.GB31825@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219151237.GB31825@pendragon.ideasonboard.com>

On Wed, Feb 19, 2025 at 05:12:37PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 19, 2025 at 08:51:39AM -0600, Rob Herring wrote:
> > On Fri, Feb 14, 2025 at 02:29:51AM +0200, Laurent Pinchart wrote:
> > > Hi Tommaso, Prabhakar,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Mon, Feb 10, 2025 at 12:45:34PM +0100, Tommaso Merciai wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > > - A different D-PHY
> > > > - Additional registers for the MIPI CSI-2 link
> > > > - Only two clocks
> > > > 
> > > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > > SoC.
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 63 ++++++++++++++-----
> > > >  1 file changed, 48 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > index 7faa12fecd5b..0d07c55a3f35 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > > @@ -17,12 +17,15 @@ description:
> > > >  
> > > >  properties:
> > > >    compatible:
> > > > -    items:
> > > > -      - enum:
> > > > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > > > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > > > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > > > -      - const: renesas,rzg2l-csi2
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > > > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > > > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > > > +          - const: renesas,rzg2l-csi2
> > > > +
> > > 
> > > I'd drop the empty line.
> > > 
> > > > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> > > >  
> > > >    reg:
> > > >      maxItems: 1
> > > > @@ -31,16 +34,24 @@ properties:
> > > >      maxItems: 1
> > > >  
> > > >    clocks:
> > > > -    items:
> > > > -      - description: Internal clock for connecting CRU and MIPI
> > > > -      - description: CRU Main clock
> > > > -      - description: CRU Register access clock
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - description: Internal clock for connecting CRU and MIPI
> > > > +          - description: CRU Main clock
> > > > +          - description: CRU Register access clock
> > > > +      - items:
> > > > +          - description: CRU Main clock
> > > > +          - description: CRU Register access clock
> > > >  
> > > >    clock-names:
> > > > -    items:
> > > > -      - const: system
> > > > -      - const: video
> > > > -      - const: apb
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: system
> > > > +          - const: video
> > > > +          - const: apb
> > > > +      - items:
> > > > +          - const: video
> > > > +          - const: apb
> > > 
> > > I would move the clocks and clock-names definitions to the conditional
> > > below. Otherwise I think a device tree that has two clocks only but
> > > incorrectly uses "system" and "video" instead of "video" and "apb" will
> > > validate.
> > 
> > No, that wouldn't be allowed. The preference is to have it like this 
> > because it discourages creating more variations. If the names are all 
> > defined in if/then schema, then you can just add a new one with any 
> > names you want. Though if the variations become such a mess, then 
> > defining them in the if/then schemas would probably be better.
> > 
> > It would be better if 'clocks' could be reworked to avoid the 'oneOf' 
> > though (oneOf == poor error messages). It just needs a 'minItems: 2' 
> > added and the descriptions reworded for both cases.
> 
> Don't the items in clocks need to match the items in clock-names ? We
> can't reorder clock-names items as that would be an ABI breakage, so we
> can't reorder clocks items either.

Validation wise, the only thing we check is is it 2 or 3 entries. No way 
to enforce it's the right clock. The description is just for humans. So 
you could just put "(optional)" on the first entry though there is no 
way in json-schema to really do that. If you prefer as-is with the 
oneOf, that's fine too.

Rob

