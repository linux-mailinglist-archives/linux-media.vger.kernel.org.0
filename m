Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F192303078
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 00:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732435AbhAYVOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 16:14:35 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:43331 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731305AbhAYVOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 16:14:02 -0500
Received: by mail-oi1-f170.google.com with SMTP id i25so4887949oie.10;
        Mon, 25 Jan 2021 13:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cX7e5IAmASc14zGSnphUn29Siqdn8Wr9I+VbJxTaObg=;
        b=n4jmTvXlWAfB2ERsBU4gyQx0OQEJ/736ZhHKfnSE8sw/Q6dicF2yDkL3cyYsDtn6h1
         aEt2+e3R09YQwSPr5Fdluo8BNQO4GaSkPFnn9PuRXmKhDNB6xEhdYtcJ/DYhOYO0p4SF
         s/FFX3D6LB02YAjDEW1MiNk7ubbTaEa7mOTO53zQxA0GtxgwDopG3a2/sRGw0vioTCkr
         fnYXacQlQxk5J6GPmVBs+SpRZO5CDoximNqpz3KhiqiI6K2oS5pxoGk56WqPOq8qrrEN
         EjH9gDBP4jGCJw4+F23tYOVuFXKvE3Q5M3aw5pJHaJWLVik0pycFnrvHkhygH7VamzF6
         zwGg==
X-Gm-Message-State: AOAM531dnS7YaDmZvZN5lVbQ09Hnwx+rLQ1aZ2CvgUXvhkbdstlOKlGq
        KRqciU+Tdyxcr+BmozRTMA==
X-Google-Smtp-Source: ABdhPJxyHpYE0jveACHdHGN4IUgt1JxJunblNFJL71YJPq5wqcX95oVfuHOeO2+rUY8for0DukPa1Q==
X-Received: by 2002:aca:5d09:: with SMTP id r9mr1282546oib.25.1611609200585;
        Mon, 25 Jan 2021 13:13:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m10sm616132oim.42.2021.01.25.13.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 13:13:19 -0800 (PST)
Received: (nullmailer pid 1004036 invoked by uid 1000);
        Mon, 25 Jan 2021 21:13:16 -0000
Date:   Mon, 25 Jan 2021 15:13:16 -0600
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
Subject: Re: [PATCH v2 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
Message-ID: <20210125211316.GA1000096@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1610616132-8220-9-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 05:22:06PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> 
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 105 +++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> new file mode 100644
> index 00000000..187824e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pxl2dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qxp Pixel Link to Display Pixel Interface
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qxp Pixel Link to Display Pixel Interface(PXL2DPI)
> +  interfaces the pixel link 36-bit data output and the DSI controller’s
> +  MIPI-DPI 24-bit data input, and inputs of LVDS Display Bridge(LDB) module
> +  used in LVDS mode, to remap the pixel color codings between those modules.
> +  This module is purely combinatorial.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8qxp-pxl2dpi
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers(CSR) module.

If this is the only control interface, then make it a child node of the 
phandle.

> +
> +  fsl,companion-pxl2dpi:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to companion PXL2DPI which is used by downstream
> +      LVDS Display Bridge(LDB) in split mode.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The PXL2DPI input port node from pixel link.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The PXL2DPI output port node to downstream bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - power-domains
> +  - fsl,syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    pxl2dpi {
> +        compatible = "fsl,imx8qxp-pxl2dpi";
> +        power-domains = <&pd IMX_SC_R_MIPI_0>;
> +        fsl,syscon = <&mipi_lvds_0_csr>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +
> +                mipi_lvds_0_pxl2dpi_dc_pixel_link0: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&dc_pixel_link0_mipi_lvds_0_pxl2dpi>;
> +                };
> +
> +                mipi_lvds_0_pxl2dpi_dc_pixel_link1: endpoint@1 {
> +                     reg = <1>;
> +                     remote-endpoint = <&dc_pixel_link1_mipi_lvds_0_pxl2dpi>;
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> +                };
> +
> +                mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
