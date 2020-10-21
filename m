Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803892953B6
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 22:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436546AbgJUU7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 16:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410577AbgJUU6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 16:58:48 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784B2C0613CE;
        Wed, 21 Oct 2020 13:58:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c16so4065228wmd.2;
        Wed, 21 Oct 2020 13:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s74siZQB3FKM9z0qxWwv2SGlNNinz7Nkfatg9g1QUzc=;
        b=c4dlbQUSDc6ri5/VYit3hwOKJJ9P2gqoKF2NxzjUdvG6YGVYlmN8Y0N6gfEpIRHG/M
         okd2hicwVhXqWPeJvOEQtS4qI/IAat7e8E5tg0Qa/RIdezvD3WjON73sdpxmFw220aiu
         xx36DDlPFiA9UgqkqJvKXrmWmYoy1eKBUca/7PfIfru2wyFovHWuuWOHzJY2fcVAJNjj
         4+b4uUTOm6o5/5ADZTrmpFOoaeV8tUKE+Vv7Lx7sRz2du/o/b0SRbe2pBru7PRXDwzpk
         00oa6w9xHW/d5MtkLUjjMjHdacDcF+FZrryS53atJSpu24ND3u16ScaXcmw5W/hyQacq
         nYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s74siZQB3FKM9z0qxWwv2SGlNNinz7Nkfatg9g1QUzc=;
        b=R9KCFgui/stt+2RIO0+K0TtpzmdfGnrMN4CrAopFf2na+hEAuIhCZGnqO6wIwYU16D
         i4HnekrdByEdDC48OOaXnVufn2aAjLParXjij8VNFK4yun+XyZrSFrM320XroVcD/TML
         6GJM6FqvoqabfGvvjdGfDI7cfUDuAH8Y36ITJdNSEAJ1lzSRTIxj7DETLwdnWrD2lc1p
         yqps/OBXEQN9+ep/tiR9CKKT9HHjBBEKau8z99Gn0CeMV65i5TSEX44c48nwFfd8FtY6
         G3YjBWmZaRauRvYqxsxtWmBIVQjH93lUUqXgA/hte+jW1uk0vel2j8WC67OFYescmqMH
         T8FA==
X-Gm-Message-State: AOAM532zddZm7BB3Ll42vcRsQ9RpTlZrJWl6meeqHqPBxVTIkEOFv8Op
        QTbm1Y8Jovq5Jl+DlBnkb00=
X-Google-Smtp-Source: ABdhPJxSnoWgo7Y318NsEzzugGqhjESiROQou03jrmgTUCxEKT1RQBbuyQMgI150vl88MqhkcNYq0w==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr4739155wma.99.1603313927067;
        Wed, 21 Oct 2020 13:58:47 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z64sm5251388wmg.19.2020.10.21.13.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 13:58:46 -0700 (PDT)
Date:   Wed, 21 Oct 2020 21:58:44 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201021205844.xpk4fgcppahlyee7@arch-thunder.localdomain>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
 <20201020190051.1852778-4-rmfrfs@gmail.com>
 <20201021155016.bs2n5ixuhxwjzjy2@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021155016.bs2n5ixuhxwjzjy2@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,
Thanks for the review.

On Wed, Oct 21, 2020 at 05:50:16PM +0200, Jacopo Mondi wrote:
> Hi Rui,
> 
> On Tue, Oct 20, 2020 at 08:00:51PM +0100, Rui Miguel Silva wrote:
> > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > the textual document and update MAINTAINERS entry.
> >
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > ---
> >
> > v4 -> v5:
> >   Rob Herring:
> >     https://lore.kernel.org/linux-media/20201020153044.GA875273@bogus/
> >     - fix indentation of oneOf items const
> >
> >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 173 insertions(+), 91 deletions(-)
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
> > index 000000000000..309af5805d74
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > @@ -0,0 +1,172 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> > +  This is the device node for the mipi csi-2 receiver core in i.mx7 soc. It is
> > +  compatible with previous version of samsung d-phy.
> 
> To be picky, mipi and csi-2 should be spelled with capital letters.
> Probably i.MX7 too.

yeah, I normally skip that part but it is important, will fix this in
next version.

> 
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx7-mipi-csi2
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 3
> 
> Do you need a maxItems too ?

sure, thanks.

> 
> nits apart
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks, Should I use this tag with renesas mail or the other that you
already used in the other patches? I think the later makes more sense.

------
Cheers,
     Rui

> 
> Thanks
>   j
> 
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
> > +    description:
> > +      The IP main (system bus) clock frequency in Hertz
> > +    default: 166000000
> > +
> > +  fsl,csis-hs-settle:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Differential receiver (HS-RX) settle time
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
> > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > +                description: See ../video-interfaces.txt
> > +                oneOf:
> > +                  - items:
> > +                      - const: 1
> > +                  - items:
> > +                      - const: 1
> > +                      - const: 2
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
> > +          Output port node
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - phy-supply
> > +  - resets
> > +  - reset-names
> > +  - ports
> > +
> > +additionalProperties: false
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
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 557713b3ee95..34e53a1570aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10779,8 +10779,8 @@ L:	linux-media@vger.kernel.org
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
