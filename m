Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054882DC898
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 23:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgLPWBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 17:01:30 -0500
Received: from mga14.intel.com ([192.55.52.115]:1772 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729840AbgLPWBa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 17:01:30 -0500
IronPort-SDR: vLL7PN+JCxDkfTrZgJizvDyvwKCT69IhzrbDCBtXA+qpIL/Js36+EuZtofY4iML6jd2acAFSXb
 1+DHaBtNu3KA==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="174377945"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="174377945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 13:59:44 -0800
IronPort-SDR: qLEOYCBgumeAOkvp+GT0wWS21af/f2VokCWRAkInnaeid9s3vLUKfL77w7RrXxEFUTf1LFRqRH
 b695EpL1VKUQ==
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="386864690"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 13:59:42 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2D01120726; Wed, 16 Dec 2020 23:59:40 +0200 (EET)
Date:   Wed, 16 Dec 2020 23:59:40 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh@kernel.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: media: Use graph and
 video-interfaces schemas
Message-ID: <20201216215940.GN26370@paasikivi.fi.intel.com>
References: <20201210211625.3070388-1-robh@kernel.org>
 <20201210211625.3070388-6-robh@kernel.org>
 <X9olm4dVwY8HRC3j@pendragon.ideasonboard.com>
 <20201216173841.GC651087@robh.at.kernel.org>
 <X9pHURqzl8gjQ4qn@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9pHURqzl8gjQ4qn@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Rob,

On Wed, Dec 16, 2020 at 07:43:45PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> On Wed, Dec 16, 2020 at 11:38:41AM -0600, Rob Herring wrote:
> > On Wed, Dec 16, 2020 at 05:19:55PM +0200, Laurent Pinchart wrote:
> > > On Thu, Dec 10, 2020 at 03:16:25PM -0600, Rob Herring wrote:
> > > > Now that we have graph and video-interfaces schemas, rework the media
> > > > related schemas to use them.
> > > > 
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > 
> > 
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > > index d94bd67ccea1..3657f2f41098 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
> > > > @@ -73,19 +73,16 @@ properties:
> > > >      enum: [ 0, 180 ]
> > > > 
> > > >    port:
> > > > -    type: object
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > > +    additionalProperties: false
> > > > +
> > > >      properties:
> > > >        endpoint:
> > > > -        type: object
> > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > +        unevaluatedProperties: false
> > > > +
> > > >          properties:
> > > > -          link-frequencies:
> > > > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > > > -            description: List of allowed data link frequencies.
> > > > -          data-lanes:
> > > > -            minItems: 1
> > > > -            maxItems: 8
> > > 
> > > Don't we need
> > > 
> > >           link-frequencies: true
> > >           data-lanes: true
> > > 
> > > to convey the fact that those properties are applicable for this device
> > > ? This applies to a few locations below too.
> > 
> > Adding them would convey that to the reader, but wouldn't change the 
> > schema validation. We'd have to use 'additionalProperties' instead and 
> > also add 'remote-endpoint' everywhere (and 'reg' sometimes). I prefer 
> > not doing all that, but if we want it just for purposes of documenting 
> > the usage, that's fine.
> 
> I'd prefer keeping it to document what properties are applicable. If we
> can later find a better way to express it in a way that will be taken
> into account during validation, that will be best, but not required now.

I agree.

There properties that are used for linking other devices such as
flash-leds. It could be related to any camera sensor, independently of its
properties. If we went that way, that should be also added to a lot of
places.

...

> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > index cde85553fd01..c29b057ae922 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > > > @@ -57,16 +57,13 @@ properties:
> > > >        active low.
> > > > 
> > > >    port:
> > > > -    type: object
> > > > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > > >      additionalProperties: false
> > > > -    description:
> > > > -      A node containing an output port node with an endpoint definition
> > > > -      as documented in
> > > > -      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > 
> > > >      properties:
> > > >        endpoint:
> > > > -        type: object
> > > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > > +        unevaluatedProperties: false
> > > > 
> > > >          properties:
> > > >            data-lanes:
> > > > @@ -79,18 +76,13 @@ properties:
> > > >                - const: 4
> > > > 
> > > >            link-frequencies:
> > > > -            $ref: /schemas/types.yaml#/definitions/uint64-array
> > > > -            description:
> > > > -              Allowed data bus frequencies. 360000000, 180000000 Hz or both
> > > > -              are supported by the driver.
> > > > -
> > > > +            maxItems: 2
> > > > +            items:
> > > > +              enum: [ 360000000, 180000000 ]
> > > 
> > > This is a limitation of the driver, not the device. Should we keep this
> > > information in a comment, to eventually get it fixed and drop the
> > > limitation from the bindings ?
> > 
> > If your dts has anything else, then it won't work. Warning on that seems 
> > valuable to me, so I think we should keep it. If someone with a better 
> > driver complains, we can drop it.
> > 
> > I can keep the description with 'Frequencies listed are driver, not h/w 
> > limitations'.
> 
> I'm fine with the constraint itself, my comment was referring to the
> fact that we're dropping the description. Your description proposal
> works for me, thanks.

Sounds good.

-- 
Sakari Ailus
