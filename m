Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAB7E9CBA
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 14:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfJ3Nyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 09:54:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58994 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3Nyf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 09:54:35 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDsXKi110222;
        Wed, 30 Oct 2019 08:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572443673;
        bh=8ykTgyJX9j+6OmR41gVi2ndS+WzwXLAbtw0EOg4AupA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=qqwMFUHwFIG+QXcF3k6AQxuwRnf65GrzV+n+ozoWzZs7cIRe933bWMlB5tw7XyNML
         bv8y+me1PpLeDx/p1hgFmb39jRMC75UXaa8j4ftditXYLqoz1VGQn3L3yJhTQj7U9U
         ji5vDhRQNcLMDcukufCffatnH7uOR9gvIhEdUOlo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDsXqx028268
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 08:54:33 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 08:54:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 08:54:20 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x9UDsWoa094969;
        Wed, 30 Oct 2019 08:54:32 -0500
Date:   Wed, 30 Oct 2019 08:54:32 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 19/19] dt-bindings: media: cal: convert binding to yaml
Message-ID: <20191030135432.6dd6e7hnj77krj67@ti.com>
References: <20191018153437.20614-1-bparrot@ti.com>
 <20191018153437.20614-20-bparrot@ti.com>
 <20191029142253.GA7612@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191029142253.GA7612@bogus>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rob Herring <robh@kernel.org> wrote on Tue [2019-Oct-29 09:22:53 -0500]:
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
> 
> Drop these or add as comments to the schema below.

Ok.

> 
> > +
> > +properties:
> > +  compatible:
> > +      items:
> 
> You can drop 'items' here since there is only 1.

Ok so just enum then?

> 
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
> 
> Needs a type definition.

Hmm, is there a phandle generic type?

> 
> > +    maxItems: 1
> > +    items:
> > +      - description:
> > +           phandle to the device control module and offset to the
> > +           control_camerarx_core register
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: functional clock
> 
> You can drop the description.

Ok.

> 
> > +
> > +  clock-names:
> > +    items:
> 
> Drop items.

Ok.

> 
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
> 
> But ports is not an array...

So remove maxItems? Not sure what you mean here?

> 
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
> 
> In a device binding, you need to specify 'port@0' and 'port@1' (assuming 
> 0 and 1) and say what they are.

Well depending on the 'variant' the device might have 1 or 2 physical csi2
ports so how would you represent that then?

> 
> > +        minItems: 1
> > +        maxItems: 2
> 
> Not valid for an object (aka node).

Again not sure how else to represent this.

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
> 
> Just 'endpoint' is valid too.

Ok I'll change that.

> 
> > +            minItems: 1
> > +            type: object
> > +            additionalProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
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
