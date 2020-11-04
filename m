Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78282A70A8
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 23:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732225AbgKDWik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 17:38:40 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:40632 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgKDWik (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 17:38:40 -0500
Received: by mail-oo1-f67.google.com with SMTP id l4so34188oos.7;
        Wed, 04 Nov 2020 14:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5F9w24H5+YugjPz9c4Mn+stc5mZszvwF1JlDcvgb4RY=;
        b=ky7oPzb9BTZrRvGwyJcFHu7QSIZlcKarKEPfX9mOU5lgte2vVuKb78cYBN6UYSM+Jq
         heRBfNma99P4fZzi3lCUzmcx+X1smECdxUctgHWNBysV0/Ad/sJPXfClUYsuFPtKkT1B
         hQ7mgJIT5hR0La9pRYj6UqV/LZ1i+QhTwx0ZhyigP8vZMDElAMq0M9gfqil8fjA9UU83
         Pc173I1djXR1YktIJ1mpZOWAIFhud+eWn7sCQMshRZ9Ye2GYEJuTTTMCCLZO4un6qaot
         ivokkB1yGGDPBtzgNkA49IOxCqIljx0Rb1SSAgjpJ+cVE70bHcMQHeyW8T/yWo0dqc/5
         SaGg==
X-Gm-Message-State: AOAM530hMbJuej1YV0x1BzU8/N1QzREWWjTXf0dJftgU+5zAkwfILNQW
        Wl+J4NUZoat9nuyyLjIXjw==
X-Google-Smtp-Source: ABdhPJxXChkJO0SFyBD8Gjh0W3TV35P8ZCaeFyqrtpfDrDFLHya2Ssx8m75+AmX6F6omD2jKDaE9tg==
X-Received: by 2002:a4a:6b1a:: with SMTP id g26mr261780ooc.13.1604529519488;
        Wed, 04 Nov 2020 14:38:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t4sm826598oov.15.2020.11.04.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 14:38:38 -0800 (PST)
Received: (nullmailer pid 54072 invoked by uid 1000);
        Wed, 04 Nov 2020 22:38:37 -0000
Date:   Wed, 4 Nov 2020 16:38:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v4 03/11] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Message-ID: <20201104223837.GA49021@bogus>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
 <20201102030821.3049-4-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102030821.3049-4-mirela.rabulea@oss.nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 02, 2020 at 05:08:13AM +0200, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add bindings documentation for i.MX8QXP/QM JPEG decoder & encoder driver.
> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  .../devicetree/bindings/media/imx8-jpeg.yaml  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> new file mode 100644
> index 000000000000..2df538d87bfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/imx8-jpeg.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/imx8-jpeg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8QXP/QM JPEG decoder/encoder Device Tree Bindings
> +
> +maintainers:
> +  - Mirela Rabulea <mirela.rabulea@nxp.com>
> +
> +description: |-
> +  The JPEG decoder/encoder present in.MXQXP/QM SoC is an
> +  ISO/IEC 10918-1 JPEG standard compliant decoder/encoder, for Baseline
> +  and Extended Sequential DCT modes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +            # JPEG decoder
> +          - fsl,imx8-jpgdec
> +            # JPEG encoder
> +          - fsl,imx8-jpgenc

Which imx8? Should be SoC specific.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description: |
> +      There are 4 slots available in the IP
> +      If a certain slot is used, it should have an associated interrupt
> +    minItems: 1               # At least one slot should be available
> +    maxItems: 4               # The IP has 4 slots available for use

You don't need to know which slot is available?

> +
> +  power-domains:
> +    description:
> +      List of phandle and PM domain specifier as documented in
> +      Documentation/devicetree/bindings/power/power_domain.txt
> +    minItems: 2               # Wrapper and 1 slot
> +    maxItems: 5               # Wrapper and 4 slots
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    jpegdec: jpegdec@58400000 {
> +        compatible = "fsl,imx8-jpgdec";
> +        reg = <0x58400000 0x00050000 >;
> +        interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> +                        <&pd IMX_SC_R_MJPEG_DEC_S0>,
> +                        <&pd IMX_SC_R_MJPEG_DEC_S1>,
> +                        <&pd IMX_SC_R_MJPEG_DEC_S2>,
> +                        <&pd IMX_SC_R_MJPEG_DEC_S3>;
> +    };
> +
> +    jpegenc: jpegenc@58450000 {
> +        compatible = "fsl,imx8-jpgenc";
> +        reg = <0x58450000 0x00050000 >;
> +        interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> +                        <&pd IMX_SC_R_MJPEG_ENC_S0>,
> +                        <&pd IMX_SC_R_MJPEG_ENC_S1>,
> +                        <&pd IMX_SC_R_MJPEG_ENC_S2>,
> +                        <&pd IMX_SC_R_MJPEG_ENC_S3>;
> +    };
> +...
> -- 
> 2.17.1
> 
