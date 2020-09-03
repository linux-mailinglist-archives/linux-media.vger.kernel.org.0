Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E22F25C14F
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 14:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbgICMsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 08:48:09 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50557 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgICMpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 08:45:52 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5BFFB20002;
        Thu,  3 Sep 2020 12:44:45 +0000 (UTC)
Date:   Thu, 3 Sep 2020 14:48:31 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Leon Luo <leonl@leopardimaging.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx274: Convert to json-schema
Message-ID: <20200903124831.okjegcpk7n7sshsn@uno.localdomain>
References: <20200903115143.13717-1-jacopo+renesas@jmondi.org>
 <20200903115143.13717-3-jacopo+renesas@jmondi.org>
 <20200903122331.GJ32646@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903122331.GJ32646@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Thu, Sep 03, 2020 at 03:23:31PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the update.
>
> On Thu, Sep 03, 2020 at 01:51:42PM +0200, Jacopo Mondi wrote:
> > Convert the imx274 bindings document to json-schema and update
> > the MAINTAINERS file accordingly.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx274.txt  | 38 ------------
> >  .../bindings/media/i2c/sony,imx274.yaml       | 59 +++++++++++++++++++
> >  MAINTAINERS                                   |  2 +-
> >  3 files changed, 60 insertions(+), 39 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > deleted file mode 100644
> > index 0727079d2410..000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> > -
> > -The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> > -an active array size of 3864H x 2202V. It is programmable through I2C
> > -interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> > -Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> > -at 1440 Mbps.
> > -
> > -
> > -Required Properties:
> > -- compatible: value should be "sony,imx274" for imx274 sensor
> > -- reg: I2C bus address of the device
> > -
> > -Optional Properties:
> > -- reset-gpios: Sensor reset GPIO
> > -- clocks: Reference to the input clock.
> > -- clock-names: Should be "inck".
> > -- VANA-supply: Sensor 2.8v analog supply.
> > -- VDIG-supply: Sensor 1.8v digital core supply.
> > -- VDDL-supply: Sensor digital IO 1.2v supply.
> > -
> > -The imx274 device node should contain one 'port' child node with
> > -an 'endpoint' subnode. For further reading on port node refer to
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Example:
> > -	sensor@1a {
> > -		compatible = "sony,imx274";
> > -		reg = <0x1a>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -		reset-gpios = <&gpio_sensor 0 0>;
> > -		port {
> > -			sensor_out: endpoint {
> > -				remote-endpoint = <&csiss_in>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > new file mode 100644
> > index 000000000000..f757ce380cb2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx274.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony 1/2.5-Inch 8.51MP CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Leon Luo <leonl@leopardimaging.com>
> > +
> > +description: |
> > +  The Sony IMX274 is a 1/2.5-inch CMOS active pixel digital image sensor with an
> > +  active array size of 3864H x 2202V. It is programmable through I2C interface.
> > +  Image data is sent through MIPI CSI-2, which is configured as 4 lanes at 1440
> > +  Mbps.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx274
> > +
> > +  reg:
> > +    const: 0x1a
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      Output video port. See ../video-interfaces.txt.
> > +
>
> What happened to the supplies and the clocks?
>

AH!

74ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and supplies")
went in a release later than my v2. From there I kep carrying on what
I had in the yaml file in v3 and v4 without noticing the original
bindings in textual form had changed in between!

I've just seen this this morning
https://patchwork.linuxtv.org/project/linux-media/patch/1599012278-10203-3-git-send-email-skomatineni@nvidia.com/
and I thought it was a new addition.

Let me reply to Sowjanya. I'll send a v4.1 of this patch in reply to
this version with the newly documented properties added.

> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        imx274: camera-sensor@1a {
> > +            compatible = "sony,imx274";
> > +            reg = <0x1a>;
> > +            reset-gpios = <&gpio_sensor 0 0>;
> > +
> > +            port {
> > +                sensor_out: endpoint {
> > +                    remote-endpoint = <&csiss_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3f8f093268b7..093a54ae1527 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16127,7 +16127,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> > -F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
> > +F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> >  F:	drivers/media/i2c/imx274.c
> >
> >  SONY IMX290 SENSOR DRIVER
>
> --
> Regards,
>
> Sakari Ailus
