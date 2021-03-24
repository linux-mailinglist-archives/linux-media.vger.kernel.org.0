Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B23347BEB
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 16:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhCXPRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 11:17:34 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:34525 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236497AbhCXPRT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 11:17:19 -0400
Received: by mail-io1-f48.google.com with SMTP id x16so21871962iob.1;
        Wed, 24 Mar 2021 08:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pFK/hlLIyYgFOB9MKct/KWeHqcYMta2ZA7PC3OnmFDI=;
        b=al0wPBKmD6GQPhtWm/7RwdxH9f/l7idyDb/DeZ8Bt3ya6oEiNuEffa3QEQ0PnbMx5b
         KrjeNAuVwWaK45h4d+r+2ytwamt+CcRINuv4oCsn+axMSBEAuZRtr3hEUlsNbpVikGek
         1oySYssro0+aafRP+nyhr4FO8ZvfEKL/h/mw9GXa1NXTObw65x8E+g9JIUiD4Ct2Oho4
         gFUVI0QHP35F2t18PGXNDuIy5fCpxSz1+yD7IIuvdefyqsQ/1T2OPP3NTt2clWTawvN1
         dVKNwMB1+GmfgXOyPwOLldmfzJfUegd/qLguhA08zcz7uvUERxVgnzquZC7cyp+Avm41
         8VeQ==
X-Gm-Message-State: AOAM532cpcLj+IKlAE5H4uzeJtuyd8m3q5Attzbx2QZE/6mW3yB6UILw
        mJONKa2x1pa26dEWesOEzFASXXFKBA==
X-Google-Smtp-Source: ABdhPJxa1T5Mab+bhlE6pdxQmGvtMBiwyMq64Di77lMMKOnjRC3K5lSWHh1Il3w07Isf9/IdyGVIXg==
X-Received: by 2002:a6b:4109:: with SMTP id n9mr2760705ioa.43.1616599039279;
        Wed, 24 Mar 2021 08:17:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s15sm1247129ilv.4.2021.03.24.08.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:17:17 -0700 (PDT)
Received: (nullmailer pid 3082380 invoked by uid 1000);
        Wed, 24 Mar 2021 15:17:15 -0000
Date:   Wed, 24 Mar 2021 09:17:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 06/10] media: dt-bindings: Document SAMA5D4 VDEC
 bindings
Message-ID: <20210324151715.GA3070006@robh.at.kernel.org>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <20210311154055.3496076-7-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311154055.3496076-7-emil.l.velikov@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 11, 2021 at 03:40:51PM +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> Add devicetree binding documentation for the Hantro G1/G2 VDEC on
> the Microchip SAMAS5D4 SoC.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v2
>  - Newly introduced
>  - s/Atmel/Microchip/ (Nicolas)
>  - Drop leading 0 in node name/address
> ---
>  .../media/microchip,sama5d4-vdec.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> new file mode 100644
> index 000000000000..9cb2c0295d54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Hantro G1 VPU codec implemented on Microchip SAMA5D4 SoCs
> +
> +maintainers:
> +  - Emil Velikov <emil.velikov@collabora.com>
> +
> +description:
> +  Hantro G1 video decode accelerator present on Microchip SAMA5D4 SoCs.
> +
> +properties:
> +  compatible:
> +    const: microchip,sama5d4-vdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - const: vdec

Why do you need a name? *-names are used to distinguish multiple entries 
and don't add anything if only a single entry.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: vdec_clk

And here too? These are typically named for either the name of input 
signal (hclk, aclk, etc.) or function ('core', 'bus', etc.). 

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/at91.h>
> +        #include <dt-bindings/interrupt-controller/irq.h>
> +
> +        vdec0: vdec@300000 {
> +                compatible = "microchip,sama5d4-vdec";
> +                reg = <0x00300000 0x100000>;
> +                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +                interrupt-names = "vdec";
> +                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
> +                clock-names = "vdec_clk";
> +        };
> -- 
> 2.30.1
> 
