Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62AB52CECFE
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 12:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbgLDLXR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 06:23:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:21905 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbgLDLXQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 06:23:16 -0500
IronPort-SDR: sFas6CnuepqSGpyjLJtqmjiuDWzUNLJZyk9T0bcH/+FC58+mZP6lf2rVmIHQK360k/P+1VgMyX
 dGEx8pF4NLzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="173517874"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="173517874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:21:36 -0800
IronPort-SDR: ovVfMNZtlUAay+zuqmMgGG+3Juk6l0EJVcyXsgfQgFCKdNjR2oM0af0Mq2WZaY+jNYfY8z6Wc4
 5lz5ZlH5T6Pw==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="336343131"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 03:21:34 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3F64A20676; Fri,  4 Dec 2020 13:21:32 +0200 (EET)
Date:   Fri, 4 Dec 2020 13:21:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh@kernel.org>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201204112132.GR852@paasikivi.fi.intel.com>
References: <20201203001302.3407476-1-robh@kernel.org>
 <20201203001302.3407476-2-robh@kernel.org>
 <20201203175040.ml7fo4xp3ofauojq@uno.localdomain>
 <20201203230751.GC2644458@robh.at.kernel.org>
 <20201204094408.liaenlxqk3v22n6v@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204094408.liaenlxqk3v22n6v@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Rob,

On Fri, Dec 04, 2020 at 10:44:08AM +0100, Jacopo Mondi wrote:
> Hi Rob,
> 
> [snip]
> 
> > > > +  data-lanes:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    minItems: 1
> > > > +    maxItems: 4
> > > > +    items:
> > > > +      # Assume up to 4 data and 1 clock lane
> > > > +      maximum: 4
> > > > +    description:
> > > > +      An array of physical data lane indexes. Position of an entry determines
> > > > +      the logical lane number, while the value of an entry indicates physical
> > > > +      lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> > > > +      assuming the clock lane is on hardware lane 0. If the hardware does not
> > > > +      support lane reordering, monotonically incremented values shall be used
> > > > +      from 0 or 1 onwards, depending on whether or not there is also a clock
> > > > +      lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> > >
> > > This won't flag [1, 3] as wrong, right ?
> >
> > Right. In theory you could have hardware that does this, right? You
> > could pick and choose which lanes to use.
> 
> You could if your platform supports lane re-ordering (iirc there's a
> single device that supports that in mainline)
> 
> My (badly worded) question is: do we expect users to define the valid
> values as here below reported ? Or are we happy with 'maximum: 2' ?
> 
> If we ask users to provide the valid arrays, we get an ugly DTS and,
> more problematically, this has be noticed and suggested during
> reviews likely for every submission, this is all but intuitive and
> most platforms don't support lane re-ordering, most if not all will
> have to limit the property supported values. We get DTS validation in
> exchange.
> 
> If we're fine with just having the maximum value specified, we lose
> dts validation but it really gets less clunky for DTS. Run-time handling
> for drivers won't change much, as devices that don't support lane
> re-ordering mostly care about the number of active lanes.
> 
> It's more a policy question than a technical one...

The maximum value depends on the number of lanes in total in a device
(which may well have several CSI-2 receivers) in case the lanes allocation
to the receivers isn't static but configurable.

Therefore I wouldn't put a maximum value for the array entries at all.

If we want to improve the common case without indicating in DT whether lane
reordering is supported (the driver already knows this as it knows its
hardware), we could simply add another property to tell the number of
lanes. It could be called e.g. num-data-lanes. The reason this hasn't been
proposed has been that the information can already be conveyed with
data-lanes property, but I think it'd be much easier to get it right. In
that case clock-lanes wouldn't be used for such device either.

> 
> >
> > > I guess the only alternative is the ugly:
> > >
> > >             anyOf:
> > >               - items:
> > >                 - const: 1
> > >               - items:
> > >                 - const: 1
> > >                 - const: 2
> > >               - items:
> > >                 - const: 1
> > >                 - const: 2
> > >                 - const: 3
> > >               - items:
> > >                 - const: 1
> > >                 - const: 2
> > >                 - const: 3
> > >                 - const: 4
> > >
> > > As we express "monotonically incremented" I think it's fine, even if
> > > validation won't catch it.
> > >
> > > Also, sakari just pointed me to the just merged
> > > Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:
> > >
> > >           data-lanes:
> > >             minItems: 1
> > >             maxItems: 8
> > >
> > > sakari, where does 8 come from ? Afaik D-PHY supports 4 differential
> > > data lanes, and C-PHY 3 'trios'
> >
> > Okay, let me know what values to put here.
> >
> 
> I'll defer this to Sakari :)

There are devices that use more lanes than the standard specifies. This is
uncommon, but the common value there is 8, albeit it seems 7, 6 or 5 could
also be supported.

-- 
Kind regards,

Sakari Ailus
