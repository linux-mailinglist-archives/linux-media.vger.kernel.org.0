Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47DE3C14D3
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 16:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhGHOFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 10:05:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:53497 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhGHOFV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 10:05:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209326210"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="209326210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 07:02:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="564522640"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2021 07:02:37 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 34A7D20345;
        Thu,  8 Jul 2021 17:02:35 +0300 (EEST)
Date:   Thu, 8 Jul 2021 17:02:35 +0300
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Stefan =?iso-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Message-ID: <20210708140235.GB3@paasikivi.fi.intel.com>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
 <20210708091922.5508-6-s.riedmueller@phytec.de>
 <20210708112313.GA3@paasikivi.fi.intel.com>
 <b588b43347afe377b6fda03c54855f97a421d89f.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b588b43347afe377b6fda03c54855f97a421d89f.camel@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Thu, Jul 08, 2021 at 01:34:17PM +0000, Stefan Riedmüller wrote:
> Hi Sakari,
> 
> On Thu, 2021-07-08 at 14:23 +0300, Sakari Ailus wrote:
> > Hi Stefan,
> > 
> > Thanks for the patch.
> 
> Thanks for your feedback!

You're welcome!

> 
> > 
> > On Thu, Jul 08, 2021 at 11:19:21AM +0200, Stefan Riedmueller wrote:
> > > Convert mt9p031 sensor bindings to yaml schema. Also update the
> > > MAINTAINERS entry.
> > > 
> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > > ---
> > >  .../bindings/media/i2c/aptina,mt9p031.yaml    | 75 +++++++++++++++++++
> > >  .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ----------
> > >  MAINTAINERS                                   |  1 +
> > >  3 files changed, 76 insertions(+), 40 deletions(-)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > >  delete mode 100644
> > > Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > new file mode 100644
> > > index 000000000000..7de62e339895
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/mt9p031.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +
> > > +description: |
> > > +  The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image
> > > sensor
> > > +  with an active array size of 2592H x 1944V. It is programmable through
> > > a
> > > +  simple two-wire serial interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - aptina,mt9p031
> > > +      - aptina,mt9p031m
> > > +
> > > +  reg:
> > > +    description: I2C device address
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: Chip reset GPIO
> > > +
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > 
> > This should probably be:
> > 
> > 	$ref: /schemas/graph.yaml#/$defs/port-base
> 
> I actually was not sure which one of these to use because I found both in
> existing bindings. Also /schemas/graph.yaml#/properties/port has a reference
> to $defs/port-base. It would be nice if you or someone else could give me a
> hint why /schemas/graph.yaml#/$defs/port-base would be the correct one here.

I haven't dug into the details but:

<URL:https://lore.kernel.org/linux-media/20210623164344.2571043-1-robh@kernel.org/T/>

> 
> > 
> > > +    addittionalProeprties: false
> > 
> > Could you run
> > 
> > 	make dt_binding_check
> > DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.y
> > aml
> > 
> > please?
> 
> Sorry, I totally forgot about this. I'll do so before sending the next
> version.

No worries.

> 
> > 
> > > +
> > > +    properties:
> > > +      endpoint:
> > > +        $ref: /schemas/media/video-interfaces.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          input-clock-frequency: true
> > > +          pixel-clock-frequency: true
> > 
> > These two legacy properties were not in the endpoint previously.
> 
> That's right, but they are being parsed from the endpoint so I figured they
> belong here. Should I mention this in the commit message?

Please do. I missed the driver did this.

Ideally the driver would use the common properties but it's old and
unlikely to be used in new boards anyway I guess.

> 
> Thanks,
> Stefan
> 
> > 
> > > +
> > > +        required:
> > > +          - input-clock-frequency
> > > +          - pixel-clock-frequency
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - port
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c0 {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        mt9p031@5d {
> > > +            compatible = "aptina,mt9p031";
> > > +            reg = <0x5d>;
> > > +            reset-gpios = <&gpio_sensor 0 0>;
> > > +
> > > +            port {
> > > +                mt9p031_1: endpoint {
> > > +                    input-clock-frequency = <6000000>;
> > > +                    pixel-clock-frequency = <96000000>;
> > > +                };
> > > +            };
> > > +        }:
> > > +    };
> > > +
> > > +...
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> > > b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> > > deleted file mode 100644
> > > index cb60443ff78f..000000000000
> > > --- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> > > +++ /dev/null
> > > @@ -1,40 +0,0 @@
> > > -* Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
> > > -
> > > -The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor
> > > with
> > > -an active array size of 2592H x 1944V. It is programmable through a
> > > simple
> > > -two-wire serial interface.
> > > -
> > > -Required Properties:
> > > -- compatible: value should be either one among the following
> > > -	(a) "aptina,mt9p031" for mt9p031 sensor
> > > -	(b) "aptina,mt9p031m" for mt9p031m sensor
> > > -
> > > -- input-clock-frequency: Input clock frequency.
> > > -
> > > -- pixel-clock-frequency: Pixel clock frequency.
> > > -
> > > -Optional Properties:
> > > -- reset-gpios: Chip reset GPIO
> > > -
> > > -For further reading on port node refer to
> > > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > -
> > > -Example:
> > > -
> > > -	i2c0@1c22000 {
> > > -		...
> > > -		...
> > > -		mt9p031@5d {
> > > -			compatible = "aptina,mt9p031";
> > > -			reg = <0x5d>;
> > > -			reset-gpios = <&gpio3 30 0>;
> > > -
> > > -			port {
> > > -				mt9p031_1: endpoint {
> > > -					input-clock-frequency = <6000000>;
> > > -					pixel-clock-frequency = <96000000>;
> > > -				};
> > > -			};
> > > -		};
> > > -		...
> > > -	};
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c7456776ace5..f2123226baae 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12610,6 +12610,7 @@ M:	Laurent Pinchart <
> > > laurent.pinchart@ideasonboard.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media_tree.git
> > > +F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
> > >  F:	drivers/media/i2c/mt9p031.c
> > >  F:	include/media/i2c/mt9p031.h
> > >  

-- 
Regards,

Sakari Ailus
