Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D67A286EBE
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 08:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgJHGfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 02:35:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:38100 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgJHGfU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 02:35:20 -0400
IronPort-SDR: o1903/WkZ4i1QcSerkALr55iFyC0vuA0sVkbMYvHND4wJPkoLfSxC5ozvi1YfdCZgwU3FaJ7YC
 Ybd395M9XkbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="145147173"
X-IronPort-AV: E=Sophos;i="5.77,349,1596524400"; 
   d="scan'208";a="145147173"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 23:35:20 -0700
IronPort-SDR: 4vu8cqzJHKdYQkVKCtx63+0vZPJG5ZFq8dSY0RDANOAjUPnXsiNMsBcx/M0rNahSSkYtw0YQdf
 GjyBe9oV+TBQ==
X-IronPort-AV: E=Sophos;i="5.77,349,1596524400"; 
   d="scan'208";a="343281368"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 23:35:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8589620728; Thu,  8 Oct 2020 09:35:15 +0300 (EEST)
Date:   Thu, 8 Oct 2020 09:35:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Message-ID: <20201008063515.GO26842@paasikivi.fi.intel.com>
References: <20201002133537.172379-1-bogdan.togorean@analog.com>
 <20201002133537.172379-2-bogdan.togorean@analog.com>
 <20201006204713.GA2807001@bogus>
 <DM6PR03MB527408B6BBFA25FF782DE27E9B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR03MB527408B6BBFA25FF782DE27E9B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bogdan,

On Thu, Oct 08, 2020 at 06:23:33AM +0000, Togorean, Bogdan wrote:
> Thank you Rob for review
> > On Fri, Oct 02, 2020 at 04:35:17PM +0300, Bogdan Togorean wrote:
> > > Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> > > front-end.
> > >
> > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > ---
> > > v2: added reg property description
> > > ---
> > >  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
> > >  1 file changed, 76 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > new file mode 100644
> > > index 000000000000..7c4af704db98
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > @@ -0,0 +1,76 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > https://urldefense.com/v3/__http://devicetree.org/schemas/media/i2c/adi,add
> > i9036.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ8ATa9okn
> > JqDbtobtK46hHICblE2i2Yj2sZL$
> > > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-
> > schemas/core.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ
> > 8ATa9oknJqDbtobtK46hHICblE2iz34fu4o$
> > > +
> > > +title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
> > > +
> > > +maintainers:
> > > +  - Bogdan Togorean <bogdan.togorean@analog.com>
> > > +
> > > +description: |-
> > > +  The ADDI9036 is a complete, 45 MHz, front-end solution for charge coupled
> > > +  device (CCD) time of flight (TOF) imaging applications. It is programmable
> > > +  through I2C interface. Image data is sent through MIPI CSI-2 2 lanes and
> > > +  can output two RAW12 packed data streams. One is IR and the other is
> > Depth.
> > > +  Each data stream is on a separate or same MIPI Virtual Channel, depending
> > > +  on configuration and each have 640x480 resolution.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: adi,addi9036
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > 
> > Can drop this.
> ACK
> > 
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > 
> > maxItems: 1
> ACK
> > 
> > > +    description: |-
> > > +      Reference to the GPIO connected to the RST/SYNC pin, if any.
> > > +      Must be released (set high) after all supplies are applied.
> > > +
> > > +  # See ../video-interfaces.txt for more details
> > > +  port:
> > > +    type: object
> > > +    properties:
> > > +      endpoint:
> > > +        type: object
> > > +        properties:
> > > +          data-lanes:
> > > +            description: |-
> > > +              The sensor supports two-lane operation.
> > > +              For two-lane operation the property must be set to <1 2>.
> > > +            items:
> > > +              - const: 1
> > > +              - const: 2
> > 
> > If this is the only possible setting, then why does it need to be in DT?
> If this is not set the bus_type will be not be correctly set after call of
> v4l2_fwnode_endpoint_parse. 

That's not a DT binding issue. The driver needs to set the field before
calling v4l2_fwnode_endpoint_parse.

Does the device not support one lane operation?

-- 
Regards,

Sakari Ailus
