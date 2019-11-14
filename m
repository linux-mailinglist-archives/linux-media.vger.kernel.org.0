Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82A80FD02F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 22:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKNVQK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 16:16:10 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41591 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbfKNVQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 16:16:09 -0500
Received: by mail-oi1-f196.google.com with SMTP id e9so6651131oif.8;
        Thu, 14 Nov 2019 13:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fuBWITyC2SUHGRslSMvj5Vn8Ahl50d58H5d7xUTeDJI=;
        b=tc7YV5ON3zl81ROXYDKc6mFSGhuezco79nmwVqvjQrOVnXv5z4t7CulJoM4af8tXA+
         /1ajDCrKZrqlTXA3zhfOBsdwHP1zGHFNWKWQi68ZycawAQ4lTB60jBd2M/IIbSVOtbNj
         a48ymqEtnrvVD4lUWz4zo4LpzrPGfEhsH5b6tjkneLX2C9OlQfF2Htc2tjAeDcppEw1C
         /EahNQHUseAoKJfBUOCZ8UE029fItz/XHhnZooVH04UN0zZKl8wmBUuSX8MJAZLCbox4
         cMcPNTnB4WmQsg2qXrSNggk71JX6LuGTSrL23Ueets1zchQkSIyGMu1MuzwQyWK1XNws
         4R/Q==
X-Gm-Message-State: APjAAAXxTTzI1etyH3tx7iBQUFOp007ApJVwLHz67ozgg+7U9sihJAu8
        iP2obnMHR5me/QfafQzIbUWCWt4=
X-Google-Smtp-Source: APXvYqwevaCYrY0AyZMovwZy/WJFexiM3d8xYM1wLFqCGNAgEmUo1sPa+HW+eNGxzjEN3JlrU08W9A==
X-Received: by 2002:aca:b909:: with SMTP id j9mr5324529oif.121.1573766168634;
        Thu, 14 Nov 2019 13:16:08 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h9sm2209821otn.14.2019.11.14.13.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 13:16:07 -0800 (PST)
Date:   Thu, 14 Nov 2019 15:16:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mark.rutland@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: renesas,ceu: Convert to yaml
Message-ID: <20191114211607.GA4896@bogus>
References: <20191111120017.83161-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111120017.83161-1-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 11, 2019 at 01:00:17PM +0100, Jacopo Mondi wrote:
> Convert the Renesas CEU bindings description to json-schema and remove
> the existing textual bindings document.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/renesas,ceu.txt | 86 -------------------
>  .../bindings/media/renesas,ceu.yaml           | 72 ++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 73 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,ceu.yaml


> diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> new file mode 100644
> index 000000000000..3c4a4ff975ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only

If only Renesas authors, can you dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,ceu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Capture Engine Unit (CEU) Bindings
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
> +  - linux-renesas-soc@vger.kernel.org
> +
> +description: |+
> +  The Capture Engine Unit is the image capture interface found in the Renesas SH
> +  Mobile, R-Mobile and RZ SoCs. The interface supports a single parallel input
> +  with data bus width of 8 or 16 bits.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r7a72100-ceu
> +      - renesas,r8a7740-ceu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +       endpoint:
> +         type: object
> +
> +         # Properties described in
> +         # Documentation/devicetree/bindings/media/video-interfaces.txt
> +         properties:
> +           hsync-active: true
> +           vsync-active: true
> +           field-even-active: false
> +           bus-width:
> +             enum: [8, 16]

These should all have 'default'.

> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - port
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    ceu: ceu@e8210000 {
> +        reg = <0xe8210000 0x209c>;
> +        compatible = "renesas,r7s72100-ceu";
> +        interrupts = <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        port {
> +            ceu_in: endpoint {
> +                remote-endpoint = <&ov7670_out>;
> +                hsync-active = <1>;
> +                vsync-active = <0>;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37a977cbac6f..feab894f7584 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10133,7 +10133,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/renesas,ceu.txt
> +F:	Documentation/devicetree/bindings/media/renesas,ceu.yaml
>  F:	drivers/media/platform/renesas-ceu.c
>  F:	include/media/drv-intf/renesas-ceu.h
> 
> --
> 2.23.0
> 
