Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC102E0250
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 23:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgLUWH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 17:07:58 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:41833 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLUWH6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 17:07:58 -0500
Received: by mail-ot1-f53.google.com with SMTP id x13so10192395oto.8;
        Mon, 21 Dec 2020 14:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2VgdvX5Ur5pTGaQxWLG6Bl3LqsRP77sKFxiKnQwMdLs=;
        b=Xr5vLWoo7jqSPUMG0yzmirmJOggYBXLfpkAakLh1jPSG3K67B9B9IzfjuGM+KUvwTq
         3iUjAsIJnJmci8mPVDNn9bFLHka0fK+gvm3iOPH+vZxUxgnsfWsvRAmb9495FKXvRn5Q
         49d+aLvUOKaj75KWWe5ZTF8Rs4cnK3O7+tyWEhr+xbbpK0NdGs1tmAhLI9SGjgAflgL8
         3smLrkx7XhlTgAiCEp0OF68LQ3ZD1f+caP8kxNK0ciJcJgIZXgpqD6DI5UOnXrHmAI3u
         tUhkJMe418df+rWcIRcWqHwPnTEZ61Ik+qDPvD5C2GUoNi+NrAT3ok01U/LTG5/w5n2b
         q4ww==
X-Gm-Message-State: AOAM530TozS3L3YjDxUyHUhyZno8tqgJOSsFRuKUOtk4kdxKbeVUdoWQ
        SS0UGJBxQCkz8nKJ0mNGiQ==
X-Google-Smtp-Source: ABdhPJyoDAL7oYPx/VjD1/+QQ1bEQabcYua0wBR8spCDnUfsFpkpljR32JlL7Lrqx0Dl0tK8jRbaEQ==
X-Received: by 2002:a9d:154:: with SMTP id 78mr13429159otu.171.1608588436945;
        Mon, 21 Dec 2020 14:07:16 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e25sm1825310oof.1.2020.12.21.14.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 14:07:16 -0800 (PST)
Received: (nullmailer pid 652695 invoked by uid 1000);
        Mon, 21 Dec 2020 22:07:13 -0000
Date:   Mon, 21 Dec 2020 15:07:13 -0700
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
Subject: Re: [PATCH 04/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 pixel combiner binding
Message-ID: <20201221220713.GA610096@robh.at.kernel.org>
References: <1608199173-28760-1-git-send-email-victor.liu@nxp.com>
 <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608199173-28760-5-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 05:59:23PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp pixel combiner.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../display/bridge/fsl,imx8qxp-pixel-combiner.yaml | 160 +++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> new file mode 100644
> index 00000000..bacacd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx8qxp-pixel-combiner.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Pixel Combiner
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Pixel Combiner takes two output streams from a
> +  single display controller and manipulates the two streams to support a number
> +  of modes(bypass, pixel combine, YUV444 to YUV422, split_RGB) configured as
> +  either one screen, two screens, or virtual screens.  The pixel combiner is
> +  also responsible for generating some of the control signals for the pixel link
> +  output channel.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-pixel-combiner
> +      - fsl,imx8qxp-pixel-combiner
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: Represents a display stream of pixel combiner.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        description: The display stream index.
> +        oneOf:
> +          - const: 0
> +          - const: 1

enum: [ 0, 1 ]

> +
> +      port@0:
> +        type: object
> +        description: Input endpoint of the display stream.
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +        required:
> +          - reg

You can drop 'reg' parts. That's going to get covered by the graph 
schema.

> +
> +      port@1:
> +        type: object
> +        description: Output endpoint of the display stream.
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
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    pixel-combiner@56020000 {
> +        compatible = "fsl,imx8qxp-pixel-combiner";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x56020000 0x10000>;
> +        clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
> +        clock-names = "apb";
> +        power-domains = <&pd IMX_SC_R_DC_0>;
> +
> +        channel@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_combiner_ch0_dc0_dpu_disp0: endpoint {
> +                    remote-endpoint = <&dc0_dpu_disp0_dc0_pixel_combiner_ch0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
> +                };
> +            };
> +        };
> +
> +        channel@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_combiner_ch1_dc0_dpu_disp1: endpoint {
> +                    remote-endpoint = <&dc0_dpu_disp1_dc0_pixel_combiner_ch1>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
> +                    remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.7.4
> 
