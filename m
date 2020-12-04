Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77BD2CEB45
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 10:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387722AbgLDJor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 04:44:47 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:44747 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387556AbgLDJoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 04:44:46 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2B521240022;
        Fri,  4 Dec 2020 09:44:01 +0000 (UTC)
Date:   Fri, 4 Dec 2020 10:44:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201204094408.liaenlxqk3v22n6v@uno.localdomain>
References: <20201203001302.3407476-1-robh@kernel.org>
 <20201203001302.3407476-2-robh@kernel.org>
 <20201203175040.ml7fo4xp3ofauojq@uno.localdomain>
 <20201203230751.GC2644458@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201203230751.GC2644458@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

[snip]

> > > +  data-lanes:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    minItems: 1
> > > +    maxItems: 4
> > > +    items:
> > > +      # Assume up to 4 data and 1 clock lane
> > > +      maximum: 4
> > > +    description:
> > > +      An array of physical data lane indexes. Position of an entry determines
> > > +      the logical lane number, while the value of an entry indicates physical
> > > +      lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> > > +      assuming the clock lane is on hardware lane 0. If the hardware does not
> > > +      support lane reordering, monotonically incremented values shall be used
> > > +      from 0 or 1 onwards, depending on whether or not there is also a clock
> > > +      lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> >
> > This won't flag [1, 3] as wrong, right ?
>
> Right. In theory you could have hardware that does this, right? You
> could pick and choose which lanes to use.

You could if your platform supports lane re-ordering (iirc there's a
single device that supports that in mainline)

My (badly worded) question is: do we expect users to define the valid
values as here below reported ? Or are we happy with 'maximum: 2' ?

If we ask users to provide the valid arrays, we get an ugly DTS and,
more problematically, this has be noticed and suggested during
reviews likely for every submission, this is all but intuitive and
most platforms don't support lane re-ordering, most if not all will
have to limit the property supported values. We get DTS validation in
exchange.

If we're fine with just having the maximum value specified, we lose
dts validation but it really gets less clunky for DTS. Run-time handling
for drivers won't change much, as devices that don't support lane
re-ordering mostly care about the number of active lanes.

It's more a policy question than a technical one...

>
> > I guess the only alternative is the ugly:
> >
> >             anyOf:
> >               - items:
> >                 - const: 1
> >               - items:
> >                 - const: 1
> >                 - const: 2
> >               - items:
> >                 - const: 1
> >                 - const: 2
> >                 - const: 3
> >               - items:
> >                 - const: 1
> >                 - const: 2
> >                 - const: 3
> >                 - const: 4
> >
> > As we express "monotonically incremented" I think it's fine, even if
> > validation won't catch it.
> >
> > Also, sakari just pointed me to the just merged
> > Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:
> >
> >           data-lanes:
> >             minItems: 1
> >             maxItems: 8
> >
> > sakari, where does 8 come from ? Afaik D-PHY supports 4 differential
> > data lanes, and C-PHY 3 'trios'
>
> Okay, let me know what values to put here.
>

I'll defer this to Sakari :)

Thanks
   j
