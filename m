Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F910496EF3
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 01:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbiAWAPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 19:15:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37560 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiAWAOV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 19:14:21 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DF8C556;
        Sun, 23 Jan 2022 01:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642896859;
        bh=sDE1mU7iBWs/+4OnaOaOXZNxiYBdAZPrqi2lHFFmd2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q1wjl1RE4y7cKKKxEw+7AuQ/pXnMTTtZYqxPNYGUfTW8QKAtVKleM8otLSDP5j35O
         t9uAbZgoSMwp6Ypl4ULmr8qWiaaASleaVYiy3aagFzpb60GSG/GVqSITzr4M6qpcdS
         WQ9zOJ7ZasDqX7T2b6Z/sK4PrlvOpn82unjaE43g=
Date:   Sun, 23 Jan 2022 02:14:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Message-ID: <Yeydyu+jg9cNObhN@pendragon.ideasonboard.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-20-biju.das.jz@bp.renesas.com>
 <YetXnJf85MMlJjAW@robh.at.kernel.org>
 <OS0PR01MB5922E4E0E015D3EE42A97F36865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E4E0E015D3EE42A97F36865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Sat, Jan 22, 2022 at 11:23:32AM +0000, Biju Das wrote:
> > Subject: Re: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
> > RZ/{G2L,V2L} VSPD bindings
> > 
> > On Wed, Jan 12, 2022 at 05:46:03PM +0000, Biju Das wrote:
> > > Document VSPD found in RZ/G2L and RZ/V2L family SoC's.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > index 990e9c1dbc43..b27ee23d2b29 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >      enum:
> > >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> > >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > > +      - renesas,vsp2-r9a07g044 # RZ/G2L and RZ/V2L

The commit message should explain why a new device-specific compatible
value is needed.

> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -27,7 +28,8 @@ properties:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    maxItems: 3
> > 
> > You have to define what each one is once you have more than 1.
> 
> Agreed, Will define each clocks.

This should also be conditioned by the compatible string, to have
maxItems set to 1 for renesas,vsp1 and renesas,vsp2, and 3 for
renesas,vsp2-r9a07g044.

> > >    power-domains:
> > >      maxItems: 1

-- 
Regards,

Laurent Pinchart
