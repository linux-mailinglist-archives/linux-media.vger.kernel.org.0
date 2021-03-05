Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B1B32F606
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 23:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCEWnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 17:43:04 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:46913 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCEWmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 17:42:31 -0500
Received: by mail-ot1-f52.google.com with SMTP id 97so3324294otf.13;
        Fri, 05 Mar 2021 14:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c2C6WMShY+WqUn8ocEbn4JzI7GfAfSZXHH5finzHrgs=;
        b=uHNX4jtxObc+Z7uhaaX8Y7VA6ibw92MuUtnPyVxgTR8hAxFD2OkM/WT24X26VCKXt8
         Li2FsRbRNSDLKBuDcz/OaV0GRmJ9kEtXE2SwyMXSCAAqxS6hewgRvnI0kcTmog/KnR7b
         LbTwmfNHFFK6q6SIGHRLaqVkkhuW2tIennzWPdTzKGSVN/5XYB49aVKZKQNxWWFeqf+H
         09WYZ/bR+s8ch59L8bHSEr1GKL5ELOIcwZM1crbpDOObhqWxteQeLePjC9PgPgUr/U63
         pawI2F61YHMY4NVOZeuh/1aLUIA8+v7NZSRlxM9dmhz2vxPJ85FWrcfwNfXCQbKYWbNZ
         Cf/Q==
X-Gm-Message-State: AOAM532+aAarNt6iQkr6lUUonnpfwCjMiwZhPwE8XphzQk+x6XQFr613
        njABqRJooUPbR3Wx5mvQFw==
X-Google-Smtp-Source: ABdhPJwHxoXqLZ4lWQqRohvKICEtEIomW3eK+a4HsIZziHEivB+j570TIzOlpHgX/R5ljdy1hLfbaQ==
X-Received: by 2002:a05:6830:18f1:: with SMTP id d17mr9590230otf.196.1614984150157;
        Fri, 05 Mar 2021 14:42:30 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f19sm811965oiw.38.2021.03.05.14.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:42:29 -0800 (PST)
Received: (nullmailer pid 776845 invoked by uid 1000);
        Fri, 05 Mar 2021 22:42:27 -0000
Date:   Fri, 5 Mar 2021 16:42:27 -0600
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
Subject: Re: [PATCH v4 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
Message-ID: <20210305224227.GA772562@robh.at.kernel.org>
References: <1613619715-28785-1-git-send-email-victor.liu@nxp.com>
 <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1613619715-28785-9-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 18, 2021 at 11:41:49AM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * Add 'fsl,sc-resource' property. (Rob)
> 
> v2->v3:
> * Drop 'fsl,syscon' property. (Rob)
> * Mention the CSR module controls PXL2DPI.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> 
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> new file mode 100644
> index 00000000..e4e77fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> @@ -0,0 +1,108 @@
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
> +  The i.MX8qxp PXL2DPI is controlled by Control and Status Registers(CSR) module.
> +  The CSR module, as a system controller, contains the PXL2DPI's configuration
> +  register.

So this node should be a child of the CSR. Ideally, this schema is also 
referenced from the CSR's schema (and if that doesn't exist, it should 
be there first).

> +
> +properties:
> +  compatible:
> +    const: fsl,imx8qxp-pxl2dpi
> +
> +  fsl,sc-resource:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The SCU resource ID associated with this PXL2DPI instance.
> +
> +  power-domains:
> +    maxItems: 1
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
> +  - fsl,sc-resource
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    pxl2dpi {
> +        compatible = "fsl,imx8qxp-pxl2dpi";
> +        fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> +        power-domains = <&pd IMX_SC_R_MIPI_0>;
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
