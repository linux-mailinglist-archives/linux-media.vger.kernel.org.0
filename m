Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E70C45CABE
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhKXRVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 12:21:16 -0500
Received: from mga14.intel.com ([192.55.52.115]:38639 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229509AbhKXRVP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 12:21:15 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235570024"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="235570024"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 09:15:03 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="741273446"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 09:15:00 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8314220165;
        Wed, 24 Nov 2021 19:14:58 +0200 (EET)
Date:   Wed, 24 Nov 2021 19:14:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 2/3] media: dt-bindings: Add Intersil ISL79987 DT
 bindings
Message-ID: <YZ5zEnV9oJPPq24K@paasikivi.fi.intel.com>
References: <20211123101517.3656935-1-m.tretter@pengutronix.de>
 <20211123101517.3656935-3-m.tretter@pengutronix.de>
 <YZzLVI2ZUBvXGhkZ@paasikivi.fi.intel.com>
 <20211124164907.GD20126@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124164907.GD20126@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Wed, Nov 24, 2021 at 05:49:07PM +0100, Michael Tretter wrote:
> On Tue, 23 Nov 2021 13:07:00 +0200, Sakari Ailus wrote:
> > On Tue, Nov 23, 2021 at 11:15:16AM +0100, Michael Tretter wrote:
> > > From: Marek Vasut <marex@denx.de>
> > > 
> > > Add bindings for the Intersil ISL79987 analog to MIPI CSI-2 decoder.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > To: linux-media@vger.kernel.org
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Changelog:
> > > 
> > > v8: none
> > > 
> > > v7: none
> > > 
> > > v6: none
> > > 
> > > v5: none
> > > 
> > > v4: none
> > > 
> > > v3:
> > > 
> > > - rename pd-gpios property to powerdown-gpios
> > > - reference graph.yaml for ports/port properties
> > > - remove reference to video-interfaces.txt
> > > - remove unnecessary description of ports property
> > > 
> > > v2:
> > > 
> > > - convert binding to yaml
> > > - change description to match only isl79987
> > > - replace num-inputs property with multiple ports
> > > - add reset gpio
> > > ---
> > >  .../bindings/media/i2c/isil,isl79987.yaml     | 100 ++++++++++++++++++
> > >  1 file changed, 100 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> > > new file mode 100644
> > > index 000000000000..aee4a5966df3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
> > > @@ -0,0 +1,100 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/isil,isl79987.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Intersil ISL79987 Analog to MIPI CSI-2 decoder
> > > +
> > > +maintainers:
> > > +  - Michael Tretter <m.tretter@pengutronix.de>
> > > +  - Marek Vasut <marex@denx.de>
> > > +
> > > +description:
> > > +  The Intersil ISL79987 is an analog to MIPI CSI-2 decoder which is capable of
> > > +  receiving up to four analog stream and multiplexing them into up to four MIPI
> > > +  CSI-2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - isil,isl79987
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      A GPIO spec for the RSTB pin (active high)
> > > +
> > > +  powerdown-gpios:
> > > +    maxItems: 1
> > > +    description:
> > > +      A GPIO spec for the Power Down pin (active high)
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: Output port
> > 
> > I think you need need the data-lanes property for endpoints on this port.
> 
> Thanks. The bot also found that the clock-lanes property is missing, too.
> 
> The following specification seems to satisfy the checker, but I'm not
> completely sure, if it is actually correct:
> 
> 	port@0:
> 	  $ref: /schemas/graph.yaml#/$defs/port-base
> 	  unevaluatedProperties: false
> 	  description: Output port
> 
> 	  properties:
> 	    endpoint:
> 	      $ref: /schemas/media/video-interfaces.yaml#
> 	      unevaluatedProperties: false
> 
> 	      properties:
> 		clock-lanes:
> 		  maxItems: 1
> 
> 		data-lanes:
> 		  minItems: 1
> 		  maxItems: 2
> 
> 	      required:
> 		- clock-lanes
> 		- data-lanes
> 
> Is this how I can correctly add the clock-lanes and data-lanes properties to
> the endpoint?

clock-lanes is extra, unless the hardware supports lane remapping.

-- 
Sakari Ailus
