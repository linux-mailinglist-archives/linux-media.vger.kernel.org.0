Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC6A2E06F8
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 08:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgLVHui (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 02:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLVHui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 02:50:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D78BC0613D3;
        Mon, 21 Dec 2020 23:49:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6445122D;
        Tue, 22 Dec 2020 08:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608623395;
        bh=Exqr1U7ZK5QA2QmOpysmWhIMOufJ5nlRZH7MblTh1xg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ufqjcqB8eooPQQUZwxD210unOKskt2p0/MyNZi0Xw53oJm1TBoJCi88YSTSfY2O1/
         cX/C058N4t6QxvrRO2lEHXqCk83fkAbwtr8NTsND9LRTmWp47LHlbM0RU+ccGYpaoX
         pM2rqLghSRJ3GVrKQN0Uyo5dxPK8nxgJho2HgpPI=
Date:   Tue, 22 Dec 2020 09:49:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mchehab@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, kishon@ti.com,
        vkoul@kernel.org
Subject: Re: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Message-ID: <X+GlG3iEM2IXhVNP@pendragon.ideasonboard.com>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
 <X+GiA4LqJTQR9vrz@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X+GiA4LqJTQR9vrz@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Liu,

On Tue, Dec 22, 2020 at 09:36:37AM +0200, Laurent Pinchart wrote:
> On Thu, Dec 17, 2020 at 05:59:30PM +0800, Liu Ying wrote:
> > This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++++++++++++++++++
> >  1 file changed, 185 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > new file mode 100644
> > index 00000000..4e5ff6f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> > @@ -0,0 +1,185 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8qm/qxp LVDS Display Bridge
> > +
> > +maintainers:
> > +  - Liu Ying <victor.liu@nxp.com>
> > +
> > +description: |
> > +  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
> > +
> > +  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
> > +  format and can map the input to VESA or JEIDA standards.  The two channels
> > +  cannot be used simultaneously, that is to say, the user should pick one of
> > +  them to use.  Two LDB channels from two LDB instances can work together in
> > +  LDB split mode to support a dual link LVDS display.  The channel indexes
> > +  have to be different.  Channel0 outputs odd pixels and channel1 outputs
> > +  even pixels.
> 
> In this case, does the display controller output odd pixels and even
> pixels separately to the two LVDS channels, with each channel
> effectively be a separate LVDS encoder ? Could you give an example of DT
> integration for dual-link LVDS support, with the display controller, two
> LDB instances, and a dual-link LVDS panel ?

I also can't find any mention of the LDB in IMX8MDQLQRM or IMX8DQXPRM.
Am I missing something ?

> > +
> > +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> > +  input color format.  The two channels can be used simultaneously, either
> > +  in dual mode or split mode.  In dual mode, the two channels output identical
> > +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> > +  pixels.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx8qm-ldb
> > +      - fsl,imx8qxp-ldb
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    items:
> > +      - description: pixel clock
> > +      - description: bypass clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pixel
> > +      - const: bypass
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  fsl,syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to Control and Status Registers(CSR) module.
> > +
> > +  fsl,companion-ldb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      A phandle which points to companion LDB which is used in LDB split mode.
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: Represents a channel of LDB.
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      reg:
> > +        description: The channel index.
> > +        enum: [ 0, 1 ]
> > +
> > +      phys:
> > +        description: A phandle to the phy module representing the LVDS PHY.
> > +        maxItems: 1
> > +
> > +      phy-names:
> > +        const: lvds_phy
> > +
> > +      port@0:
> > +        type: object
> > +        description: Input port of the channel.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +        required:
> > +          - reg
> > +
> > +      port@1:
> > +        type: object
> > +        description: Output port of the channel.
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - reg
> > +      - phys
> > +      - phy-names
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - fsl,syscon
> > +  - channel@0
> > +  - channel@1
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: fsl,imx8qm-ldb
> > +    then:
> > +      properties:
> > +        fsl,companion-ldb: false
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +    ldb {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        compatible = "fsl,imx8qxp-ldb";
> > +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> > +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> > +        clock-names = "pixel", "bypass";
> > +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> > +        fsl,syscon = <&mipi_lvds_0_csr>;
> > +
> > +        channel@0 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <0>;
> > +            phys = <&mipi_lvds_0_phy>;
> > +            phy-names = "lvds_phy";
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> > +                };
> > +            };
> > +        };
> > +
> > +        channel@1 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            reg = <1>;
> > +            phys = <&mipi_lvds_0_phy>;
> > +            phy-names = "lvds_phy";
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +
> > +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> > +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> > +                };
> > +            };
> > +        };
> > +    };
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Laurent Pinchart
