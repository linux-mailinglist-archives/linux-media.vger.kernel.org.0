Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0467729598E
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 09:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508877AbgJVHqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 03:46:39 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47257 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2508871AbgJVHqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 03:46:39 -0400
X-Greylist: delayed 57268 seconds by postgrey-1.27 at vger.kernel.org; Thu, 22 Oct 2020 03:46:37 EDT
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3544D10000D;
        Thu, 22 Oct 2020 07:46:34 +0000 (UTC)
Date:   Thu, 22 Oct 2020 09:46:33 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to
 yaml
Message-ID: <20201022074633.3ju2sgtbhpwlpapj@uno.localdomain>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
 <20201020190051.1852778-4-rmfrfs@gmail.com>
 <20201021155016.bs2n5ixuhxwjzjy2@uno.localdomain>
 <20201021205844.xpk4fgcppahlyee7@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201021205844.xpk4fgcppahlyee7@arch-thunder.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Wed, Oct 21, 2020 at 09:58:44PM +0100, Rui Miguel Silva wrote:
> Hi Jacopo,
> Thanks for the review.
>
> On Wed, Oct 21, 2020 at 05:50:16PM +0200, Jacopo Mondi wrote:
> > Hi Rui,
> >
> > On Tue, Oct 20, 2020 at 08:00:51PM +0100, Rui Miguel Silva wrote:
> > > Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
> > > the textual document and update MAINTAINERS entry.
> > >
> > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > > ---
> > >
> > > v4 -> v5:
> > >   Rob Herring:
> > >     https://lore.kernel.org/linux-media/20201020153044.GA875273@bogus/
> > >     - fix indentation of oneOf items const
> > >
> > >  .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
> > >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
> > >  MAINTAINERS                                   |   2 +-
> > >  3 files changed, 173 insertions(+), 91 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > >  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt b/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > > deleted file mode 100644
> > > index 71fd74ed3ec8..000000000000
> > > --- a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > > +++ /dev/null
> > > @@ -1,90 +0,0 @@
> > > -Freescale i.MX7 Mipi CSI2
> > > -=========================
> > > -
> > > -mipi_csi2 node
> > > ---------------
> > > -
> > > -This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
> > > -compatible with previous version of Samsung D-phy.
> > > -
> > > -Required properties:
> > > -
> > > -- compatible    : "fsl,imx7-mipi-csi2";
> > > -- reg           : base address and length of the register set for the device;
> > > -- interrupts    : should contain MIPI CSIS interrupt;
> > > -- clocks        : list of clock specifiers, see
> > > -        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> > > -- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
> > > -                  entries in the clock property;
> > > -- power-domains : a phandle to the power domain, see
> > > -          Documentation/devicetree/bindings/power/power_domain.txt for details.
> > > -- reset-names   : should include following entry "mrst";
> > > -- resets        : a list of phandle, should contain reset entry of
> > > -                  reset-names;
> > > -- phy-supply    : from the generic phy bindings, a phandle to a regulator that
> > > -	          provides power to MIPI CSIS core;
> > > -
> > > -Optional properties:
> > > -
> > > -- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
> > > -		    value when this property is not specified is 166 MHz;
> > > -- fsl,csis-hs-settle : differential receiver (HS-RX) settle time;
> > > -
> > > -The device node should contain two 'port' child nodes with one child 'endpoint'
> > > -node, according to the bindings defined in:
> > > - Documentation/devicetree/bindings/ media/video-interfaces.txt.
> > > - The following are properties specific to those nodes.
> > > -
> > > -port node
> > > ----------
> > > -
> > > -- reg		  : (required) can take the values 0 or 1, where 0 shall be
> > > -                     related to the sink port and port 1 shall be the source
> > > -                     one;
> > > -
> > > -endpoint node
> > > --------------
> > > -
> > > -- data-lanes    : (required) an array specifying active physical MIPI-CSI2
> > > -		    data input lanes and their mapping to logical lanes; this
> > > -                    shall only be applied to port 0 (sink port), the array's
> > > -                    content is unused only its length is meaningful,
> > > -                    in this case the maximum length supported is 2;
> > > -
> > > -example:
> > > -
> > > -        mipi_csi: mipi-csi@30750000 {
> > > -                #address-cells = <1>;
> > > -                #size-cells = <0>;
> > > -
> > > -                compatible = "fsl,imx7-mipi-csi2";
> > > -                reg = <0x30750000 0x10000>;
> > > -                interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > > -                clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> > > -                                <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> > > -                                <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> > > -                clock-names = "pclk", "wrap", "phy";
> > > -                clock-frequency = <166000000>;
> > > -                power-domains = <&pgc_mipi_phy>;
> > > -                phy-supply = <&reg_1p0d>;
> > > -                resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> > > -                reset-names = "mrst";
> > > -                fsl,csis-hs-settle = <3>;
> > > -
> > > -                port@0 {
> > > -                        reg = <0>;
> > > -
> > > -                        mipi_from_sensor: endpoint {
> > > -                                remote-endpoint = <&ov2680_to_mipi>;
> > > -                                data-lanes = <1>;
> > > -                        };
> > > -                };
> > > -
> > > -                port@1 {
> > > -                        reg = <1>;
> > > -
> > > -                        mipi_vc0_to_csi_mux: endpoint {
> > > -                                remote-endpoint = <&csi_mux_from_mipi_vc0>;
> > > -                        };
> > > -                };
> > > -        };
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > > new file mode 100644
> > > index 000000000000..309af5805d74
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > > @@ -0,0 +1,172 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: NXP i.MX7 Mipi CSI2
> > > +
> > > +maintainers:
> > > +  - Rui Miguel Silva <rmfrfs@gmail.com>
> > > +
> > > +description: |
> > > +  This is the device node for the mipi csi-2 receiver core in i.mx7 soc. It is
> > > +  compatible with previous version of samsung d-phy.
> >
> > To be picky, mipi and csi-2 should be spelled with capital letters.
> > Probably i.MX7 too.
>
> yeah, I normally skip that part but it is important, will fix this in
> next version.
>
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: fsl,imx7-mipi-csi2
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    minItems: 3
> >
> > Do you need a maxItems too ?
>
> sure, thanks.
>
> >
> > nits apart
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
> Thanks, Should I use this tag with renesas mail or the other that you
> already used in the other patches? I think the later makes more sense.

Ups, I mixed the two
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Sorry!

>
> ------
> Cheers,
>      Rui
>
> >
> > Thanks
> >   j
> >
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pclk
> > > +      - const: wrap
> > > +      - const: phy
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  phy-supply:
> > > +    description:
> > > +      Phandle to a regulator that provides power to the PHY. This
> > > +      regulator will be managed during the PHY power on/off sequence.
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    const: mrst
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      The IP main (system bus) clock frequency in Hertz
> > > +    default: 166000000
> > > +
> > > +  fsl,csis-hs-settle:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Differential receiver (HS-RX) settle time
> > > +
> > > +  ports:
> > > +    type: object
> > > +    description:
> > > +      A node containing input and output port nodes with endpoint definitions
> > > +      as documented in
> > > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description:
> > > +          Input port node, single endpoint describing the CSI-2 transmitter.
> > > +
> > > +        properties:
> > > +          reg:
> > > +            const: 0
> > > +
> > > +          endpoint:
> > > +            type: object
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +                description: See ../video-interfaces.txt
> > > +                oneOf:
> > > +                  - items:
> > > +                      - const: 1
> > > +                  - items:
> > > +                      - const: 1
> > > +                      - const: 2
> > > +
> > > +              remote-endpoint: true
> > > +
> > > +            required:
> > > +              - data-lanes
> > > +              - remote-endpoint
> > > +
> > > +            additionalProperties: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description:
> > > +          Output port node
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - phy-supply
> > > +  - resets
> > > +  - reset-names
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx7d-clock.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +    #include <dt-bindings/reset/imx7-reset.h>
> > > +
> > > +    mipi_csi: mipi-csi@30750000 {
> > > +            compatible = "fsl,imx7-mipi-csi2";
> > > +            reg = <0x30750000 0x10000>;
> > > +            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +            clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> > > +                     <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> > > +                     <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> > > +            clock-names = "pclk", "wrap", "phy";
> > > +            clock-frequency = <166000000>;
> > > +
> > > +            power-domains = <&pgc_mipi_phy>;
> > > +            phy-supply = <&reg_1p0d>;
> > > +            resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> > > +            reset-names = "mrst";
> > > +            fsl,csis-hs-settle = <3>;
> > > +
> > > +            ports {
> > > +                    #address-cells = <1>;
> > > +                    #size-cells = <0>;
> > > +
> > > +                    port@0 {
> > > +                            reg = <0>;
> > > +
> > > +                            mipi_from_sensor: endpoint {
> > > +                                    remote-endpoint = <&ov2680_to_mipi>;
> > > +                                    data-lanes = <1>;
> > > +                            };
> > > +                    };
> > > +
> > > +                    port@1 {
> > > +                            reg = <1>;
> > > +
> > > +                            mipi_vc0_to_csi_mux: endpoint {
> > > +                                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
> > > +                            };
> > > +                    };
> > > +            };
> > > +    };
> > > +
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 557713b3ee95..34e53a1570aa 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10779,8 +10779,8 @@ L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media_tree.git
> > >  F:	Documentation/admin-guide/media/imx7.rst
> > > -F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > > +F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > >  F:	drivers/staging/media/imx/imx7-media-csi.c
> > >  F:	drivers/staging/media/imx/imx7-mipi-csis.c
> > >
> > > --
> > > 2.28.0
> > >
