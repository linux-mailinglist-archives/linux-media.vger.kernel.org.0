Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71710131D6F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 03:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgAGCGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 21:06:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38564 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbgAGCGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 21:06:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ABE66277412
Message-ID: <cfd5156f09358a428d0c40cfcd17d688e0225f2b.camel@collabora.com>
Subject: Re: [PATCH v12 09/11] media: staging: dt-bindings: add Rockchip
 MIPI RX D-PHY yaml bindings
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org,
        andrey.konovalov@linaro.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, robh+dt@kernel.org, hans.verkuil@cisco.com,
        sakari.ailus@linux.intel.com, joacim.zetterling@gmail.com,
        kernel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org
Date:   Mon, 06 Jan 2020 23:06:12 -0300
In-Reply-To: <20200107001055.GE22189@pendragon.ideasonboard.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
         <20191227200116.2612137-10-helen.koike@collabora.com>
         <20200107001055.GE22189@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks a lot for reviewing this.

On Tue, 2020-01-07 at 02:10 +0200, Laurent Pinchart wrote:
> Hi Helen,
> 
> Thank you for the patch.
> 
> On Fri, Dec 27, 2019 at 05:01:14PM -0300, Helen Koike wrote:
> > Add yaml DT bindings for Rockchip MIPI D-PHY RX
> > 
> > This was tested and verified with:
> > mv drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml  Documentation/devicetree/bindings/phy/
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > 
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
> > 
> > ---
> > 
> > Changes in v12:
> > - The commit replaces the following commit in previous series named
> > media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY bindings
> > This new patch adds yaml binding and was verified with
> > make dtbs_check and make dt_binding_check
> > 
> > Changes in v11: None
> > Changes in v10:
> > - unsquash
> > 
> > Changes in v9:
> > - fix title division style
> > - squash
> > - move to staging
> > 
> > Changes in v8: None
> > Changes in v7:
> > - updated doc with new design and tested example
> > 
> >  .../bindings/phy/rockchip-mipi-dphy.yaml      | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > 
> > diff --git a/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml b/drivers/staging/media/phy-
> > rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > new file mode 100644
> > index 000000000000..af97f1b3e005
> > --- /dev/null
> > +++ b/drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/rockchip-mipi-dphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip SoC MIPI RX0 D-PHY Device Tree Bindings
> 
> Should this be s/RX0/RX/ ? Or do you expect different bindings for RX1 ?

The driver currently only supports RX0, but I think you are right,
it should say RX here. This binding could be extended for RX1.

> Looking at the PHY driver, it seems to handle all PHYs with a single
> struct device. Should we thus use #phy-cells = <1> to select the PHY ?
> 

I am not following this. The driver handles just one PHY. Each PHY
should have its own node.

> > +
> > +maintainers:
> > +  - Helen Koike <helen.koike@collabora.com>
> > +  - Ezequiel Garcia <ezequiel@collabora.com>
> > +
> > +description: |
> > +  The Rockchip SoC has a MIPI D-PHY bus with an RX0 entry which connects to
> > +  the ISP1 (Image Signal Processing unit v1.0) for CSI cameras.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,rk3399-mipi-dphy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Mipi d-phy ref clock
> > +      - description: Mipi d-phy rx0 cfg clock
> 
> s/Mipi d-phy/MIPI D-PHY/
> 

Yep.

> > +      - description: Video in/out general register file clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: dphy-ref
> > +      - const: dphy-cfg
> > +      - const: grf
> > +
> > +  '#phy-cells':
> > +    const: 0
> > +
> > +  power-domains:
> > +    description: Video in/out power domain.
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - '#phy-cells'
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
> > +    /*
> > +     * MIPI RX D-PHY use registers in "general register files", it
> > +     * should be a child of the GRF.
> > +     *
> > +     * grf: syscon@ff770000 {
> > +     *  compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> > +     *  ...
> 
> missing
> 
> 	* };
> 

OK.

> > +     */
> > +
> > +    #include <dt-bindings/clock/rk3399-cru.h>
> > +    #include <dt-bindings/power/rk3399-power.h>
> > +
> > +    dphy: mipi-dphy {
> > +        compatible = "rockchip,rk3399-mipi-dphy";
> > +        clocks = <&cru SCLK_MIPIDPHY_REF>,
> > +                 <&cru SCLK_DPHY_RX0_CFG>,
> > +                 <&cru PCLK_VIO_GRF>;
> > +        clock-names = "dphy-ref", "dphy-cfg", "grf";
> > +        power-domains = <&power RK3399_PD_VIO>;
> > +        #phy-cells = <0>;
> > +    };


