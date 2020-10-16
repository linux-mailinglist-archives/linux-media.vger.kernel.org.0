Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD2B2907BB
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407807AbgJPOvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405198AbgJPOvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:51:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0646CC061755;
        Fri, 16 Oct 2020 07:51:14 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t9so3209266wrq.11;
        Fri, 16 Oct 2020 07:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cmF8Vk+gzX9wcVczAaQxnFEkbXoYOSFr5BMRRO7LOIM=;
        b=EeatVyX6Zgv2zvDtuK0+YUNo1gQkyK//mYwxTqFiHdsvfgEgTygB0KVkYb77edmOdk
         xxK8VZlO36ud+3W/iChqlJTvPIHRiz3cm3CgkFLCr9jmzkMKrp3AuKdU9B98tmeJGLvD
         xxDuWMLD817D7sz48dKFTTi9U/2YrXcmWAtfTJ72I7J8ii6Fu2PNVGTXRUwQpbRUhy1J
         jxhLJvZrQiI0qlWNFJv8pDCV2uD0HV5456LqezMEuJpIc7fRdSRZxjZGS2HfwaTKyvVJ
         7MK2JFWPavoWLzAthb2H5gSYgHB+/uKq1YS3dL3RbdVrwPOHKRmFElsqKvQxRSLDToM4
         7NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cmF8Vk+gzX9wcVczAaQxnFEkbXoYOSFr5BMRRO7LOIM=;
        b=J3Y+yT7ecff/TzYfoYAfQ8U4QhvWrkhoKjUfAFOw1OBulLxA3IpnCane+BRMyn0bYv
         iGt/0caIjyQQRxkyxC9aIhOgG/HhxAfNrXBxXZLx5yzQjsmwnCEJiQmgB9w2fyFcC+op
         edYwESM++t6bsMJ0F9YZUXjW2MzO2MUvAcWEnnNP8WByzSywZaH1ZY2gxdKWd4/zZ1IG
         yCV1JFD//W4cV5gVfm6cE1oFxYmejhU+ryXQ4hIZpH+26tHgo7kH5P9hf7L5ULaN3xkG
         SjfCvTttYHdQ7URbegIYvmme7f7tU1EPY4HWBldplakO0H4YsKkGsV+hIEo2Ro74AMMc
         zn8g==
X-Gm-Message-State: AOAM530zMH2kFW6/4BDr9rFtEeqdlqNvaRdz3w+GHXHeZNrjW7UjApWZ
        maG43opb+b1CyAQAiLfhn/g=
X-Google-Smtp-Source: ABdhPJxXoOuXKKwYWAmlILgGf3pH1NMAaUWss76ig8XA9Vmtwlt57qe2QmVyf+vrLbN6NpUGeZU2Gg==
X-Received: by 2002:a05:6000:1046:: with SMTP id c6mr4337304wrx.218.1602859872508;
        Fri, 16 Oct 2020 07:51:12 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id a199sm3255128wmd.8.2020.10.16.07.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:51:11 -0700 (PDT)
Date:   Fri, 16 Oct 2020 15:51:09 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201016145109.lscb56fwfs3k4jct@arch-thunder.localdomain>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-4-rmfrfs@gmail.com>
 <20201015155251.3npqi2t4oghuguab@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015155251.3npqi2t4oghuguab@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again Jacopo,
On Thu, Oct 15, 2020 at 05:52:51PM +0200, Jacopo Mondi wrote:
> Hi Rui,
> 
> On Wed, Oct 14, 2020 at 03:27:59PM +0100, Rui Miguel Silva wrote:
> > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > the textual document and update MAINTAINERS entry.
> >
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > ---
> >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 181 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 182 insertions(+), 91 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt b/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > deleted file mode 100644
> > index 71fd74ed3ec8..000000000000
> > --- a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > +++ /dev/null
> > @@ -1,90 +0,0 @@
> > -Freescale i.MX7 Mipi CSI2
> > -=========================
> > -
> > -mipi_csi2 node
> > ---------------
> > -
> > -This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
> > -compatible with previous version of Samsung D-phy.
> > -
> > -Required properties:
> > -
> > -- compatible    : "fsl,imx7-mipi-csi2";
> > -- reg           : base address and length of the register set for the device;
> > -- interrupts    : should contain MIPI CSIS interrupt;
> > -- clocks        : list of clock specifiers, see
> > -        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> > -- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
> > -                  entries in the clock property;
> > -- power-domains : a phandle to the power domain, see
> > -          Documentation/devicetree/bindings/power/power_domain.txt for details.
> > -- reset-names   : should include following entry "mrst";
> > -- resets        : a list of phandle, should contain reset entry of
> > -                  reset-names;
> > -- phy-supply    : from the generic phy bindings, a phandle to a regulator that
> > -	          provides power to MIPI CSIS core;
> > -
> > -Optional properties:
> > -
> > -- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
> > -		    value when this property is not specified is 166 MHz;
> > -- fsl,csis-hs-settle : differential receiver (HS-RX) settle time;
> > -
> > -The device node should contain two 'port' child nodes with one child 'endpoint'
> > -node, according to the bindings defined in:
> > - Documentation/devicetree/bindings/ media/video-interfaces.txt.
> > - The following are properties specific to those nodes.
> > -
> > -port node
> > ----------
> > -
> > -- reg		  : (required) can take the values 0 or 1, where 0 shall be
> > -                     related to the sink port and port 1 shall be the source
> > -                     one;
> > -
> > -endpoint node
> > --------------
> > -
> > -- data-lanes    : (required) an array specifying active physical MIPI-CSI2
> > -		    data input lanes and their mapping to logical lanes; this
> > -                    shall only be applied to port 0 (sink port), the array's
> > -                    content is unused only its length is meaningful,
> > -                    in this case the maximum length supported is 2;
> > -
> > -example:
> > -
> > -        mipi_csi: mipi-csi@30750000 {
> > -                #address-cells = <1>;
> > -                #size-cells = <0>;
> > -
> > -                compatible = "fsl,imx7-mipi-csi2";
> > -                reg = <0x30750000 0x10000>;
> > -                interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > -                clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> > -                                <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> > -                                <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> > -                clock-names = "pclk", "wrap", "phy";
> > -                clock-frequency = <166000000>;
> > -                power-domains = <&pgc_mipi_phy>;
> > -                phy-supply = <&reg_1p0d>;
> > -                resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> > -                reset-names = "mrst";
> > -                fsl,csis-hs-settle = <3>;
> > -
> > -                port@0 {
> > -                        reg = <0>;
> > -
> > -                        mipi_from_sensor: endpoint {
> > -                                remote-endpoint = <&ov2680_to_mipi>;
> > -                                data-lanes = <1>;
> > -                        };
> > -                };
> > -
> > -                port@1 {
> > -                        reg = <1>;
> > -
> > -                        mipi_vc0_to_csi_mux: endpoint {
> > -                                remote-endpoint = <&csi_mux_from_mipi_vc0>;
> > -                        };
> > -                };
> > -        };
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > new file mode 100644
> > index 000000000000..0438b28232ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > @@ -0,0 +1,181 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> Same question about dual licensing
> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX7 Mipi CSI2
> > +
> > +maintainers:
> > +  - Rui Miguel Silva <rmfrfs@gmail.com>
> > +
> > +description: |
> > +  this is the device node for the mipi csi-2 receiver core in i.mx7 soc. it is
> > +  compatible with previous version of samsung d-phy.
> 
> nit: missing a few captial letters (beginning and after a full stop).

will fix along all document.

> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - fsl,imx7-mipi-csi2
> 
> Should enum with a single item be expressed as a const ?

agree.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: wrap
> > +      - const: phy
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  phy-supply:
> > +    description:
> > +      Phandle to a regulator that provides power to the PHY. This
> > +      regulator will be managed during the PHY power on/off sequence.
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: mrst
> > +
> > +  clock-frequency:
> 
> This was here already, but shouldn't this property be assigned in the
> clock provider and you should have here a reference to it ? Otherwise,
> is this really a custom property hijacking a standard property name ?
> 
> I see it is mentioned in the example-schema.yaml, so it's probably
> correct.

I think limits and default can be assigned here.

> 
> > +    description:
> > +      The IP main (system bus) clock frequency in Hertz
> > +    default: 166000000
> > +
> > +  fsl,csis-hs-settle:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      differential receiver (HS-RX) settle time
> 
> You have used capital letters at the beginning of documentation blocks
> before.
> 
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing input and output port nodes with endpoint definitions
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      port@0:
> > +        type: object
> > +        description:
> > +          Input port node, single endpoint describing the CSI-2 transmitter.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +          endpoint:
> > +            type: object
> > +
> > +            properties:
> > +              data-lanes:
> > +                maxItems: 1
> 
> How many data lanes does this receiver supports ? I see in the txt
> bindingsd:
>     data-lanes    : (required) an array specifying active physical MIPI-CSI2
>                     data input lanes and their mapping to logical lanes; this
>                     shall only be applied to port 0 (sink port), the array's
>                     content is unused only its length is meaningful,
>                     in this case the maximum length supported is 2;
> 
> I'm not sure I fully get this. Does this mean up to 2 data lanes are
> supported ?

yeah, it supports up to 2 data lanes. Will fix

> 
> > +
> > +              remote-endpoint: true
> > +
> > +            required:
> > +              - data-lanes
> > +              - remote-endpoint
> > +
> > +            additionalProperties: false
> > +
> > +        additionalProperties: false
> > +
> > +      port@1:
> > +        type: object
> > +        description:
> > +          Output port node,
> 
> Rougue ',' at the end. You probably want a full stop or
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +          endpoint:
> > +              type: object
> > +
> > +              properties:
> > +                remote-endpoint: true
> > +
> > +              required:
> > +                - remote-endpoint
> > +
> > +              additionalProperties: false
> 
> As no other endpoint property is specified, the whole 'endpoint' block
> can probably be omitted ?
> 
> > +
> > +        additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - ports
> 
> phy-supply was listed as required in the txt bindings

good catch.

> 
> > +
> > +unevaluatedProperties: false
> 
> additionalProperties: false
> 

Thanks again for your review.

Cheers,
   Rui

> Thanks
>   j
> 
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx7d-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/reset/imx7-reset.h>
> > +
> > +    mipi_csi: mipi-csi@30750000 {
> > +            compatible = "fsl,imx7-mipi-csi2";
> > +            reg = <0x30750000 0x10000>;
> > +            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +            clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> > +                     <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> > +                     <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> > +            clock-names = "pclk", "wrap", "phy";
> > +            clock-frequency = <166000000>;
> > +
> > +            power-domains = <&pgc_mipi_phy>;
> > +            phy-supply = <&reg_1p0d>;
> > +            resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> > +            reset-names = "mrst";
> > +            fsl,csis-hs-settle = <3>;
> > +
> > +            ports {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> > +
> > +                    port@0 {
> > +                            reg = <0>;
> > +
> > +                            mipi_from_sensor: endpoint {
> > +                                    remote-endpoint = <&ov2680_to_mipi>;
> > +                                    data-lanes = <1>;
> > +                            };
> > +                    };
> > +
> > +                    port@1 {
> > +                            reg = <1>;
> > +
> > +                            mipi_vc0_to_csi_mux: endpoint {
> > +                                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
> > +                            };
> > +                    };
> > +            };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b7f7f14cd85b..9da67222b0c7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10773,8 +10773,8 @@ L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  T:	git git://linuxtv.org/media_tree.git
> >  F:	Documentation/admin-guide/media/imx7.rst
> > -F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > +F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> >  F:	drivers/staging/media/imx/imx7-media-csi.c
> >  F:	drivers/staging/media/imx/imx7-mipi-csis.c
> >
> > --
> > 2.28.0
> >
