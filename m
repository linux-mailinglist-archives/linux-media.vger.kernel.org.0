Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B4D302DA5
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 22:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbhAYV2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 16:28:43 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:44288 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732647AbhAYVT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 16:19:59 -0500
Received: by mail-oi1-f182.google.com with SMTP id n7so4415365oic.11;
        Mon, 25 Jan 2021 13:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NibYT71W+B8TDWyLV12/C5+2M+J43v+ssl9R4tm+o1Q=;
        b=WBQYa4KNp88aJf5nI2uN2Ep4giLJJa8qwpPc+76m4vXtxf2aP8yhLWy/5Ks88+KExy
         Xaig3hTzFR+hVxTg3DCf/5shFxpXjczIiVAgtzb7DhaIkUZoc1Y+DMvFTDgiMz513kAu
         XNTmqE4CmAT8K/US+8CIs5f1YJZbh1+Oyro8niDUZ1rH5zjY7hbiqXAxY/+Xp9EWgdGK
         B0l121+fnoucrJdcHayWAEDQTQN9HGVbIkAJvyhv8tNvQEmb/rzmmknAsXVVKslHyBRO
         Rgodc2+xZrpm+a2d6ulhGlUVM7uKZD2+kZmU73CzKIIQBoBMGVEWbzmD/LtfHFv6QRxy
         EzMA==
X-Gm-Message-State: AOAM531fIhbzZFGcvUo5fldq3PqfhT512sEmiItywvCOA/5L/rhxLfHo
        RBN02i4lnr34CSETcwpMyA==
X-Google-Smtp-Source: ABdhPJzawJ1RMizxJND21fu6qb4j513EzjDeH7HKS+tLfPZacMXvR7CRmkgQOrWYyoYiX7+j1r9tOg==
X-Received: by 2002:aca:f255:: with SMTP id q82mr1293905oih.138.1611609555404;
        Mon, 25 Jan 2021 13:19:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z20sm2732315oth.55.2021.01.25.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:19:12 -0800 (PST)
Received: (nullmailer pid 1014454 invoked by uid 1000);
        Mon, 25 Jan 2021 21:19:10 -0000
Date:   Mon, 25 Jan 2021 15:19:10 -0600
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
Subject: Re: [PATCH v2 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
Message-ID: <20210125211910.GA1004310@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610616132-8220-12-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 05:22:09PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)
> 
>  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 176 +++++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> new file mode 100644
> index 00000000..514ac90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> @@ -0,0 +1,176 @@
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
> +
> +  A side note is that i.MX8qm/qxp LDB is officially called pixel mapper in
> +  the SoC reference manuals.  The pixel mapper uses logic of LDBs embedded in
> +  i.MX6qdl/sx SoCs, i.e., it is essentially based on them.  To keep the naming
> +  consistency, this binding calls it LDB.
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

Again, seems like this binding should be a child of the syscon.

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
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port of the channel.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port of the channel.
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
