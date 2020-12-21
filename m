Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43CBF2E0292
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgLUWeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:34:15 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:46821 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgLUWeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:34:15 -0500
Received: by mail-oi1-f179.google.com with SMTP id q205so12800428oig.13;
        Mon, 21 Dec 2020 14:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z+mwSkMBFlGy8BYewhoxfQR/8zLn/0it2xYVLOgL8+c=;
        b=szWO8fLZ5lZ6+ME8L7+PmiU9VFF50TcI9UVRhGb2GxbjiKaKAjh8ADeoBRk8rUJ0wR
         9ZdTe0iVEBgwNMK08H4MUjB8DlzM0z8a1wE/vxwlguwOfOe9aR2ilE8DnvDYQHY/FCwG
         ZTrbkEkI70h7GAsZGEbuR9NCckJ5fiaZ7yBtCprNxktywnhdw26VsPMtrlVx6ipa63xx
         CQFj0IBhsycg5I0PKwfZ2OSFgDsbTyfVjJl6jmYKX3hwb/gvLw1utxoxq7sQ+3TPbixw
         NL2xX82j6/cMenlUFp+syIWrz8cr3fWBVTkW71ItXJoMIVz1ZIL2DS/edDyOJYe4WyjC
         bZrA==
X-Gm-Message-State: AOAM530B3ZV/CWVGGyh69KN+Xtdpu5ACf1nfPEJbE0ELAkDuUreYLOIB
        afW9QnGVg6j/YZ/abxMr5Q==
X-Google-Smtp-Source: ABdhPJyP9oEFF1amNiSHt97ugC4IOmfuLFseapmIcIPPGvlasG6IhA8wPydZQforl2OqRTjFGkCFog==
X-Received: by 2002:a54:4694:: with SMTP id k20mr5142843oic.64.1608590014301;
        Mon, 21 Dec 2020 14:33:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r15sm3835754oie.33.2020.12.21.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:33:33 -0800 (PST)
Received: (nullmailer pid 692742 invoked by uid 1000);
        Mon, 21 Dec 2020 22:33:29 -0000
Date:   Mon, 21 Dec 2020 15:33:29 -0700
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mchehab@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, kishon@ti.com, vkoul@kernel.org
Subject: Re: [PATCH 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS
 display bridge binding
Message-ID: <20201221223329.GA691090@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608199173-28760-12-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 05:59:30PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 185 +++++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> new file mode 100644
> index 00000000..4e5ff6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp LVDS Display Bridge
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp LVDS Display Bridge(LDB) has two channels.
> +
> +  For i.MX8qxp LDB, each channel supports up to 24bpp parallel input color
> +  format and can map the input to VESA or JEIDA standards.  The two channels
> +  cannot be used simultaneously, that is to say, the user should pick one of
> +  them to use.  Two LDB channels from two LDB instances can work together in
> +  LDB split mode to support a dual link LVDS display.  The channel indexes
> +  have to be different.  Channel0 outputs odd pixels and channel1 outputs
> +  even pixels.
> +
> +  For i.MX8qm LDB, each channel additionally supports up to 30bpp parallel
> +  input color format.  The two channels can be used simultaneously, either
> +  in dual mode or split mode.  In dual mode, the two channels output identical
> +  data.  In split mode, channel0 outputs odd pixels and channel1 outputs even
> +  pixels.

This LDB doesn't share anything with prior ones?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-ldb
> +      - fsl,imx8qxp-ldb
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: pixel clock
> +      - description: bypass clock
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: bypass
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers(CSR) module.
> +
> +  fsl,companion-ldb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to companion LDB which is used in LDB split mode.
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: Represents a channel of LDB.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        description: The channel index.
> +        enum: [ 0, 1 ]
> +
> +      phys:
> +        description: A phandle to the phy module representing the LVDS PHY.
> +        maxItems: 1
> +
> +      phy-names:
> +        const: lvds_phy
> +
> +      port@0:
> +        type: object
> +        description: Input port of the channel.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        description: Output port of the channel.
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +      - phys
> +      - phy-names
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - fsl,syscon
> +  - channel@0
> +  - channel@1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8qm-ldb
> +    then:
> +      properties:
> +        fsl,companion-ldb: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    ldb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,imx8qxp-ldb";
> +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +        clock-names = "pixel", "bypass";
> +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> +        fsl,syscon = <&mipi_lvds_0_csr>;
> +
> +        channel@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> +                };
> +            };
> +        };
> +
> +        channel@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
