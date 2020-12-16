Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0332DC572
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 18:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbgLPRj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 12:39:26 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:36469 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbgLPRjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 12:39:25 -0500
Received: by mail-ot1-f49.google.com with SMTP id d20so5790942otl.3;
        Wed, 16 Dec 2020 09:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SBgo//YKkA63AqbkoZjO8ivHupKtKSKuS3BbHIyo60A=;
        b=lJ28NWWEytBUIYl4SWWNC14lIATBzeN70KIWXlHeisysiVNpffqqFJ6dp5r2nL9Lxu
         TnpwnMA1iEz2Vf4jjyj0p+eAzHiRLHdgwyu4/QnXJdUfFE8jCnXZR/1GZGMzt10M0Oam
         VmPWU0JIVhO8fLjBt5LWDIU9gRlJhrEXTxdyHU27RGP/lixC2X4/2j2Ft7FlTz9+l/DA
         ULHpGCFtoTv8Vj5e70YpneqCbAWmnvxu/Bfk2seax+AOVSuaGoldRKH6mIRBXGpurHRH
         OUqz10O9qN7jZo02CXTUtJhdabp4JhdEufRCVv1WckDVVwcYFMoc5gP4hXi1IYdsJhX8
         Jy6A==
X-Gm-Message-State: AOAM531Tvl6FAQ1XtnfFoNnKY+MsgIC7YDutvmZ4vB5pcsGx0Uo2p9dC
        tK++WpbaHSXBWv7nulmKyQ==
X-Google-Smtp-Source: ABdhPJyqeBN9d5dfNZIeMhAY+vi8REGWDQgMuqX3U+UOmL7tj/LmTASk8c+K/pzD1mU3WSxkAHwgOg==
X-Received: by 2002:a9d:590c:: with SMTP id t12mr26463191oth.308.1608140324102;
        Wed, 16 Dec 2020 09:38:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z38sm612215ooi.34.2020.12.16.09.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 09:38:42 -0800 (PST)
Received: (nullmailer pid 2150082 invoked by uid 1000);
        Wed, 16 Dec 2020 17:38:41 -0000
Date:   Wed, 16 Dec 2020 11:38:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20201216173841.GC651087@robh.at.kernel.org>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-6-robh@kernel.org>
 <X9olm4dVwY8HRC3j@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9olm4dVwY8HRC3j@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 16, 2020 at 05:19:55PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> Thank you for the patch.
> 
> On Thu, Dec 10, 2020 at 03:16:25PM -0600, Rob Herring wrote:
> > Now that we have graph and video-interfaces schemas, rework the media
> > related schemas to use them.
> > 
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: linux-media@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---


> > diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > index d94bd67ccea1..3657f2f41098 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > @@ -73,19 +73,16 @@ properties:
> >      enum: [ 0, 180 ]
> > 
> >    port:
> > -    type: object
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> >      properties:
> >        endpoint:
> > -        type: object
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> >          properties:
> > -          link-frequencies:
> > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > -            description: List of allowed data link frequencies.
> > -          data-lanes:
> > -            minItems: 1
> > -            maxItems: 8
> 
> Don't we need
> 
>           link-frequencies: true
>           data-lanes: true
> 
> to convey the fact that those properties are applicable for this device
> ? This applies to a few locations below too.

Adding them would convey that to the reader, but wouldn't change the 
schema validation. We'd have to use 'additionalProperties' instead and 
also add 'remote-endpoint' everywhere (and 'reg' sometimes). I prefer 
not doing all that, but if we want it just for purposes of documenting 
the usage, that's fine.

> >            bus-type:
> > -            description: The type of the data bus.
> >              oneOf:
> >                - const: 1 # CSI-2 C-PHY
> >                - const: 3 # CCP2
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > index 280c62afae13..3b1ea9da437a 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> > @@ -31,27 +31,15 @@ properties:
> >      maxItems: 1
> > 
> >    port:
> > -    type: object
> > -    description: |-
> > -      Should contain one endpoint sub-node used to model connection to the
> > -      video receiver according to the specification defined in
> > -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > 
> >      properties:
> >        endpoint:
> > -        type: object
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > 
> >          properties:
> > -          remote-endpoint:
> > -            description: |-
> > -              phandle to the video receiver input port.
> > -
> > -          clock-noncontinuous:
> > -            type: boolean
> > -            description: |-
> > -              Set to true to allow MIPI CSI-2 non-continuous clock operations.
> > -
> > -        additionalProperties: false
> > +          clock-noncontinuous: true
> > 
> >      additionalProperties: false
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > index cde85553fd01..c29b057ae922 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > @@ -57,16 +57,13 @@ properties:
> >        active low.
> > 
> >    port:
> > -    type: object
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> >      additionalProperties: false
> > -    description:
> > -      A node containing an output port node with an endpoint definition
> > -      as documented in
> > -      Documentation/devicetree/bindings/media/video-interfaces.txt
> > 
> >      properties:
> >        endpoint:
> > -        type: object
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > 
> >          properties:
> >            data-lanes:
> > @@ -79,18 +76,13 @@ properties:
> >                - const: 4
> > 
> >            link-frequencies:
> > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > -            description:
> > -              Allowed data bus frequencies. 360000000, 180000000 Hz or both
> > -              are supported by the driver.
> > -
> > +            maxItems: 2
> > +            items:
> > +              enum: [ 360000000, 180000000 ]
> 
> This is a limitation of the driver, not the device. Should we keep this
> information in a comment, to eventually get it fixed and drop the
> limitation from the bindings ?

If your dts has anything else, then it won't work. Warning on that seems 
valuable to me, so I think we should keep it. If someone with a better 
driver complains, we can drop it.

I can keep the description with 'Frequencies listed are driver, not h/w 
limitations'.

Rob
