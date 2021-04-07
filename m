Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41473577CF
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 00:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhDGWfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 18:35:24 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:34641 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhDGWfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 18:35:24 -0400
Received: by mail-ot1-f53.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so419115otn.1;
        Wed, 07 Apr 2021 15:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MEMq327WA/e87K0wxfaMG3l9c1pXdRbYCJIAGb1VTd8=;
        b=qD/kTYqJEF4nFcB8Ypqtuvexzpz/WKttWPyQhzN7EsKNjcn5axnRWhaFqbhtIvbuab
         DFigb50Vyam/cvNzxL/MOoL9nP4jXhznWqpESdVNGkhj4e0D0xk6Dtp8cCehwc/hxmPB
         o72gUMIyMz+1iZ+vw8aOSIpRvNLvP0Xv5ul5AYVzLJgRDc6Eyi7JxluRrP7JDt8VyrA/
         go7nbR/+0b1n+k1M4nNaAWeDbcHaZj1v+V5tIrxRVR9F9lQ1PCjmcP7reMuqCrt7ETiz
         /DoxFWqORsmMurGDlvJXRpTK431Ewljc80kN2gtKita/BgKaxW70dajhXfvtfdH5IWSr
         e20g==
X-Gm-Message-State: AOAM532VfSwBiogjRm4tTw6bQ5EO8uajNkikLj6ySdqQpCtohEoOLekT
        LyHLHSjYjPFfJh59Yyao7Q==
X-Google-Smtp-Source: ABdhPJy+BlXgo+BjPHRC4iHY/IqLH7C4uZgjCbEcpW5oBCp267IAObrQIvy29NMBjrNuna/6tu6rzQ==
X-Received: by 2002:a9d:17e7:: with SMTP id j94mr4910435otj.41.1617834913863;
        Wed, 07 Apr 2021 15:35:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v1sm5725361otk.67.2021.04.07.15.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:35:13 -0700 (PDT)
Received: (nullmailer pid 142607 invoked by uid 1000);
        Wed, 07 Apr 2021 22:35:12 -0000
Date:   Wed, 7 Apr 2021 17:35:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        devicetree@vger.kernel.org, sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for imx335
Message-ID: <20210407223512.GA140520@robh.at.kernel.org>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
 <20210330142023.141-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330142023.141-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 30, 2021 at 03:20:18PM +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx335 sensor driver
> - Add MAINTAINERS entry for Sony imx335 binding documentation
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx335.yaml | 90 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> new file mode 100644
> index 000000000000..0e286226ad9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx335.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX335 Sensor
> +
> +maintainers:
> +  - Paul J. Murphy <paul.j.murphy@intel.com>
> +  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +
> +description:
> +  IMX335 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 2592H x 1944V. It is programmable through I2C interface. The
> +  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
> +  sent through MIPI CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx335
> +  reg:
> +    description: I2C address
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true
> +
> +  clocks:
> +    description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reference to the GPIO connected to the XCLR pin, if any.

Missed one thing. You need 'maxItems: 1' to define how many gpios.

> +
> +  port:
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +          link-frequencies: true
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx335";
> +            reg = <0x1a>;
> +            clocks = <&imx335_clk>;
> +
> +            assigned-clocks = <&imx335_clk>;
> +            assigned-clock-parents = <&imx335_clk_parent>;
> +            assigned-clock-rates = <24000000>;
> +
> +            port {
> +                imx335: endpoint {
> +                    remote-endpoint = <&cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <594000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd988b258fe0..510e3c4a45b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16875,6 +16875,14 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
>  F:	drivers/media/i2c/imx334.c
>  
> +SONY IMX335 SENSOR DRIVER
> +M:	Paul J. Murphy <paul.j.murphy@intel.com>
> +M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> +
>  SONY IMX355 SENSOR DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.11.0
> 
