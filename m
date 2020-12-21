Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21212E028C
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgLUWcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:32:25 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33178 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgLUWcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:32:24 -0500
Received: by mail-oi1-f174.google.com with SMTP id d203so12890022oia.0;
        Mon, 21 Dec 2020 14:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CrCNdD9kKFd0w/18HL8sM1tY8e07PfB1FWqVN+teSm0=;
        b=I3n/+8R+XR25EX5m5WyWOOhse+mYR1ZtY6ZRQZBWjwCNN4/3zCC+Q3tXlCRak9GlGX
         S5iMGnhVOsQtVkSRFovFQ5H3gKvtrfe9Iln/oR73UEf4I+xkeR3XBb1HKiUQsc6dPmca
         o64B3lLaSNmork/Rp5LbWCo+P2sUI2bgVX9l1AkUU1eg5RBc0nmOeMryBwKZo+d/8sZ6
         ZrtsmiNrb95YrisVLASWwAfU1/YkIU9EBlB/LBrBmrUqyU9vfsWe5W4TAWFv0eXI9vUb
         cu0snsyqFphy7c0Ju45IAyA3UoUArxZyYOquUPH+k3C0ANgb4KpTL/9BWquQFZczRx9g
         6LZg==
X-Gm-Message-State: AOAM532W2JZqi+aDc+pTcyjpkG0E3yfuN51maWK48EFrWQ2mHJciNxF+
        /8jBQ9sxjS9d2TjjQOQuug==
X-Google-Smtp-Source: ABdhPJwd3rb480++WHPVL+OW+GohWnneE/ypMwzopQAGGGNcpsFcZLA+a1WpJRtC7opt6UMNNivAAQ==
X-Received: by 2002:aca:6202:: with SMTP id w2mr4690067oib.5.1608589903376;
        Mon, 21 Dec 2020 14:31:43 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z6sm3980286ooz.17.2020.12.21.14.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:31:42 -0800 (PST)
Received: (nullmailer pid 689847 invoked by uid 1000);
        Mon, 21 Dec 2020 22:31:40 -0000
Date:   Mon, 21 Dec 2020 15:31:40 -0700
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
Subject: Re: [PATCH 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <20201221223140.GA687317@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608199173-28760-7-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 05:59:25PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp display pixel link.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> new file mode 100644
> index 00000000..fd24a0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Pixel Link
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Display Pixel Link(DPL) forms a standard
> +  asynchronous linkage between pixel sources(display controller or
> +  camera module) and pixel consumers(imaging or displays).
> +  It consists of two distinct functions, a pixel transfer function and a
> +  control interface.  Multiple pixel channels can exist per one control channel.
> +  This binding documentation is only for pixel links whose pixel sources are
> +  display controllers.

Perhaps some information about how this 'device' is accessed because you 
have no control interface.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-dc-pixel-link
> +      - fsl,imx8qxp-dc-pixel-link
> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing pixel link input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The pixel link input port node from upstream video source.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg

You can drop 'reg' parts.

> +
> +    patternProperties:
> +      "^port@[1-4]$":
> +        type: object
> +        description: The pixel link output port node to downstream bridge.
> +
> +        properties:
> +          reg:
> +            enum: [ 1, 2, 3, 4 ]
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +
> +    anyOf:
> +      - required:
> +          - port@1
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +      - required:
> +          - port@4
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dc0-pixel-link0 {
> +        compatible = "fsl,imx8qxp-dc-pixel-link";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            /* from dc0 pixel combiner channel0 */
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
> +                };
> +            };
> +
> +            /* to PXL2DPIs in MIPI/LVDS combo subsystems */
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
> +                    reg = <0>;
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> +                };
> +
> +                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> +                };
> +            };
> +
> +            /* to imaging subsystem */
> +            port@4 {
> +                reg = <4>;
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
