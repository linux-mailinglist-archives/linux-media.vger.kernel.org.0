Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7AEBE2067
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 18:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407184AbfJWQTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 12:19:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41172 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391119AbfJWQTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 12:19:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NGIqF8127305;
        Wed, 23 Oct 2019 11:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571847532;
        bh=ODWaDxTjS3/SmkbHhxjbC1c6IROYHUkP3F+mSGxV+xg=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Ph1xELH1URQhQ79H+YFG5m7YMm3MYNcT68OPAyY3TN5OLX1L+lRzipiW1sWvvx/mu
         WC4+NDrgSnFXgF8KVHIh0nWuiG1ePzCXcyP0R6SLtVpQZy8lLiN3vFRO+88Q4pGTP0
         1nVJP58wha/3x79wIpaAOjuq9E6iNDNZOPMOxYNc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9NGIpn2122613
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Oct 2019 11:18:51 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 11:18:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 11:18:51 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x9NGIoYC108676;
        Wed, 23 Oct 2019 11:18:50 -0500
Date:   Wed, 23 Oct 2019 11:18:45 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 19/19] dt-bindings: media: cal: convert binding to yaml
Message-ID: <20191023161844.hgrxeo244krq26lz@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-20-bparrot@ti.com>
 <20191022074623.GE864@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191022074623.GE864@valkosipuli.retiisi.org.uk>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> wrote on Tue [2019-Oct-22 10:46:23 +0300]:
> Hi Benoit,
> 
> Thanks for the patch.
> 
> On Fri, Oct 18, 2019 at 10:34:37AM -0500, Benoit Parrot wrote:
> > Convert ti-cal.txt to ti,cal.yaml.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  .../devicetree/bindings/media/ti,cal.yaml     | 186 ++++++++++++++++++
> >  .../devicetree/bindings/media/ti-cal.txt      |  82 --------
> >  2 files changed, 186 insertions(+), 82 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/ti,cal.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/ti-cal.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
> > new file mode 100644
> > index 000000000000..c3fbb22b4571
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
> > @@ -0,0 +1,186 @@
> > +# SPDX-License-Identifier: (GPL-2.0)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/ti,cal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Benoit Parrot <bparrot@ti.com>
> > +
> > +description: |-
> > +  The Camera Adaptation Layer (CAL) is a key component for image capture
> > +  applications. The capture module provides the system interface and the
> > +  processing capability to connect CSI2 image-sensor modules to the
> > +  DRA72x device.
> > +
> > +  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
> > +  should contain a 'port' child node with child 'endpoint' node. Please
> > +  refer to the bindings defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +  compatible should be
> > +     "ti,dra72-cal", for DRA72 controllers
> > +     "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
> > +     "ti,dra76-cal", for DRA76 controllers
> > +     "ti,am654-cal", for AM654 controllers
> > +
> > +properties:
> > +  compatible:
> > +      items:
> > +        - enum:
> > +            - ti,dra72-cal
> > +            - ti,dra72-pre-es2-cal
> > +            - ti,dra76-cal
> > +            - ti,am654-cal
> > +
> > +  reg:
> > +    minItems: 2
> > +    items:
> > +      - description: The CAL main register region
> > +      - description: The RX Core0 (DPHY0) register region
> > +      - description: The RX Core1 (DPHY1) register region
> > +
> > +  reg-names:
> > +    minItems: 2
> > +    items:
> > +      - const: cal_top
> > +      - const: cal_rx_core0
> > +      - const: cal_rx_core1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  syscon-camerrx:
> > +    maxItems: 1
> > +    items:
> > +      - description:
> > +           phandle to the device control module and offset to the
> > +           control_camerarx_core register
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: functional clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: fck
> > +
> > +  power-domains:
> > +    description:
> > +      List of phandle and PM domain specifier as documented in
> > +      Documentation/devicetree/bindings/power/power_domain.txt
> > +    maxItems: 1
> > +
> > +  # See ./video-interfaces.txt for details
> > +  ports:
> > +    maxItems: 1
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^port@[0-9a-fA-F]+$':
> > +        minItems: 1
> > +        maxItems: 2
> 
> Obviously you need a port node to connect a sensor. But can the device do
> something useful without one? I guess it may be a matter of taste whether
> you require one.

In an ideal world all of these would be covered by a video-interfaces.yaml
file I would just need to include... :)

But I'll try and add some more "required" and see how much trouble it gets
me.
> 
> > +        type: object
> > +        additionalProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            minItems: 1
> > +            items:
> > +              - description: The port id
> > +
> > +        patternProperties:
> > +          '^endpoint@[0-9a-fA-F]+$':
> > +            minItems: 1
> 
> The graph bindings allows for no endpoints.

Maybe but then it is not much use.
> 
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> 
> Does the device support lane reordering? If not, you could omit the
> clock-lanes property. It wasn't documented earlier either albeit the
> example had it for some reason.

Not sure what you mean by lane re-ordering here, but this IP needs to know
which lanes are used for data and which lane is the clock lane.

I cannot just assume that clock lane is always lane 0, I have a sensor
where the clock lane is #2 for instance and the data lanes are 0, 1, 3, 4.

But at any rate before it was not specifically documented because I thought
it was covered by the "see
Documentation/devicetree/bindings/media/video-interfaces.txt" or de we need
to duplicate that in every binding?

Benoit
> 
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +              remote-endpoint: true
> > +
> > +            required:
> > +              - remote-endpoint
> > +
> > +        required:
> > +          - reg
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - syscon-camerrx
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    cal: cal@4845b000 {
> > +        compatible = "ti,dra72-cal";
> > +        reg = <0x4845B000 0x400>,
> > +              <0x4845B800 0x40>,
> > +              <0x4845B900 0x40>;
> > +        reg-names = "cal_top",
> > +                    "cal_rx_core0",
> > +                    "cal_rx_core1";
> > +        interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +        syscon-camerrx = <&scm_conf 0xE94>;
> > +
> > +        ports {
> > +              #address-cells = <1>;
> > +              #size-cells = <0>;
> > +
> > +              csi2_0: port@0 {
> > +                    reg = <0>;
> > +                    csi2_phy0: endpoint@0 {
> > +                           remote-endpoint = <&csi2_cam0>;
> > +                           clock-lanes = <0>;
> > +                           data-lanes = <1 2>;
> > +                    };
> > +              };
> > +        };
> > +    };
> > +
> > +    i2c5: i2c@4807c000 {
> > +        status = "okay";
> > +        clock-frequency = <400000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ov5640@3c {
> > +               compatible = "ovti,ov5640";
> > +               reg = <0x3c>;
> > +
> > +               clocks = <&clk_ov5640_fixed>;
> > +               clock-names = "xclk";
> > +
> > +               port {
> > +                    csi2_cam0: endpoint@0 {
> > +                            remote-endpoint = <&csi2_phy0>;
> > +                            clock-lanes = <0>;
> > +                            data-lanes = <1 2>;
> > +                    };
> > +               };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/media/ti-cal.txt b/Documentation/devicetree/bindings/media/ti-cal.txt
> > deleted file mode 100644
> > index b7bf8492dc2a..000000000000
> > --- a/Documentation/devicetree/bindings/media/ti-cal.txt
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -Texas Instruments DRA72x CAMERA ADAPTATION LAYER (CAL)
> > -------------------------------------------------------
> > -
> > -The Camera Adaptation Layer (CAL) is a key component for image capture
> > -applications. The capture module provides the system interface and the
> > -processing capability to connect CSI2 image-sensor modules to the
> > -DRA72x device.
> > -
> > -Required properties:
> > -- compatible:
> > - Should be "ti,dra72-cal", for DRA72 controllers
> > - Should be "ti,dra72-pre-es2-cal", for DRA72 controllers pre ES2.0
> > - Should be "ti,dra76-cal", for DRA76 controllers
> > - Should be "ti,am654-cal", for AM654 controllers
> > -- reg:	CAL Top level, Receiver Core #0, Receiver Core #1 and Camera RX
> > -	control address space
> > -- reg-names: cal_top, cal_rx_core0, cal_rx_core1 and camerrx_control
> > -	     registers
> > -- interrupts: should contain IRQ line for the CAL;
> > -- syscon-camerrx: phandle to the device control module and offset to the
> > -		  control_camerarx_core register
> > -		  This node is meant to replace the "camerrx_control" reg
> > -		  entry above but "camerrx_control" is still handled
> > -		  for backward compatibility.
> > -
> > -CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
> > -should contain a 'port' child node with child 'endpoint' node. Please
> > -refer to the bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Example:
> > -	cal: cal@4845b000 {
> > -		compatible = "ti,dra72-cal";
> > -		reg = <0x4845B000 0x400>,
> > -		      <0x4845B800 0x40>,
> > -		      <0x4845B900 0x40>;
> > -		reg-names = "cal_top",
> > -			    "cal_rx_core0",
> > -			    "cal_rx_core1";
> > -		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > -		syscon-camerrx = <&scm_conf 0xE94>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		ports {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			csi2_0: port@0 {
> > -				reg = <0>;
> > -				csi2_phy0: endpoint@0 {
> > -					remote-endpoint = <&csi2_cam0>;
> > -					clock-lanes = <0>;
> > -					data-lanes = <1 2>;
> > -				};
> > -			};
> > -			csi2_1: port@1 {
> > -				reg = <1>;
> > -			};
> > -		};
> > -	};
> > -
> > -	i2c5: i2c@4807c000 {
> > -		status = "okay";
> > -		clock-frequency = <400000>;
> > -
> > -		ov5640@3c {
> > -			compatible = "ovti,ov5640";
> > -			reg = <0x3c>;
> > -
> > -			clocks = <&clk_ov5640_fixed>;
> > -			clock-names = "xclk";
> > -
> > -			port {
> > -				csi2_cam0: endpoint {
> > -					remote-endpoint = <&csi2_phy0>;
> > -					clock-lanes = <0>;
> > -					data-lanes = <1 2>;
> > -				};
> > -			};
> > -		};
> > -	};
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
