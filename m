Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFF72DC58D
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbgLPRof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:44:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727712AbgLPRof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:44:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A87522CF;
        Wed, 16 Dec 2020 18:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608140631;
        bh=7GsKa7EzD8G8LYfUVM1oW3MsoWwv0UlaBI+xm28Ebf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fbp7gj2s1QaUkk+D2INC9T1Or2BkC7rvHpg1XMasnpCnqQNlxFTbTFwLdQ3+zR7XX
         gUu156OzrTrue8hBv50aEHgsZR8BvayxCJAtSaCJlTYP1lRN16HhEScLh4/tqOszqb
         xVsgrdMmV6hs7+ufApi+DPvh5DQnjmjeJxSILnmc=
Date:   Wed, 16 Dec 2020 19:43:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: media: Use graph and
 video-interfaces schemas
Message-ID: <X9pHURqzl8gjQ4qn@pendragon.ideasonboard.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-6-robh@kernel.org>
 <X9olm4dVwY8HRC3j@pendragon.ideasonboard.com>
 <20201216173841.GC651087@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216173841.GC651087@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Wed, Dec 16, 2020 at 11:38:41AM -0600, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 05:19:55PM +0200, Laurent Pinchart wrote:
> > On Thu, Dec 10, 2020 at 03:16:25PM -0600, Rob Herring wrote:
> > > Now that we have graph and video-interfaces schemas, rework the media
> > > related schemas to use them.
> > > 
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Cc: linux-media@vger.kernel.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> 
> 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > index d94bd67ccea1..3657f2f41098 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > @@ -73,19 +73,16 @@ properties:
> > >      enum: [ 0, 180 ]
> > > 
> > >    port:
> > > -    type: object
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > +    additionalProperties: false
> > > +
> > >      properties:
> > >        endpoint:
> > > -        type: object
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > >          properties:
> > > -          link-frequencies:
> > > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > > -            description: List of allowed data link frequencies.
> > > -          data-lanes:
> > > -            minItems: 1
> > > -            maxItems: 8
> > 
> > Don't we need
> > 
> >           link-frequencies: true
> >           data-lanes: true
> > 
> > to convey the fact that those properties are applicable for this device
> > ? This applies to a few locations below too.
> 
> Adding them would convey that to the reader, but wouldn't change the 
> schema validation. We'd have to use 'additionalProperties' instead and 
> also add 'remote-endpoint' everywhere (and 'reg' sometimes). I prefer 
> not doing all that, but if we want it just for purposes of documenting 
> the usage, that's fine.

I'd prefer keeping it to document what properties are applicable. If we
can later find a better way to express it in a way that will be taken
into account during validation, that will be best, but not required now.

> > >            bus-type:
> > > -            description: The type of the data bus.
> > >              oneOf:
> > >                - const: 1 # CSI-2 C-PHY
> > >                - const: 3 # CCP2
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > > index 280c62afae13..3b1ea9da437a 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > > @@ -31,27 +31,15 @@ properties:
> > >      maxItems: 1
> > > 
> > >    port:
> > > -    type: object
> > > -    description: |-
> > > -      Should contain one endpoint sub-node used to model connection to the
> > > -      video receiver according to the specification defined in
> > > -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > 
> > >      properties:
> > >        endpoint:
> > > -        type: object
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > 
> > >          properties:
> > > -          remote-endpoint:
> > > -            description: |-
> > > -              phandle to the video receiver input port.
> > > -
> > > -          clock-noncontinuous:
> > > -            type: boolean
> > > -            description: |-
> > > -              Set to true to allow MIPI CSI-2 non-continuous clock operations.
> > > -
> > > -        additionalProperties: false
> > > +          clock-noncontinuous: true
> > > 
> > >      additionalProperties: false
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > index cde85553fd01..c29b057ae922 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > @@ -57,16 +57,13 @@ properties:
> > >        active low.
> > > 
> > >    port:
> > > -    type: object
> > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > >      additionalProperties: false
> > > -    description:
> > > -      A node containing an output port node with an endpoint definition
> > > -      as documented in
> > > -      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > 
> > >      properties:
> > >        endpoint:
> > > -        type: object
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > 
> > >          properties:
> > >            data-lanes:
> > > @@ -79,18 +76,13 @@ properties:
> > >                - const: 4
> > > 
> > >            link-frequencies:
> > > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > > -            description:
> > > -              Allowed data bus frequencies. 360000000, 180000000 Hz or both
> > > -              are supported by the driver.
> > > -
> > > +            maxItems: 2
> > > +            items:
> > > +              enum: [ 360000000, 180000000 ]
> > 
> > This is a limitation of the driver, not the device. Should we keep this
> > information in a comment, to eventually get it fixed and drop the
> > limitation from the bindings ?
> 
> If your dts has anything else, then it won't work. Warning on that seems 
> valuable to me, so I think we should keep it. If someone with a better 
> driver complains, we can drop it.
> 
> I can keep the description with 'Frequencies listed are driver, not h/w 
> limitations'.

I'm fine with the constraint itself, my comment was referring to the
fact that we're dropping the description. Your description proposal
works for me, thanks.

-- 
Regards,

Laurent Pinchart
