Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E4F26961C
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 22:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgINUNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 16:13:16 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:41107 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINUNO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 16:13:14 -0400
Received: by mail-il1-f195.google.com with SMTP id f82so797486ilh.8;
        Mon, 14 Sep 2020 13:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nbeDWg+iTnAnVi0q5KQbhM3HUB1BKl9YFwmERRpyJQM=;
        b=QKM9Qhb7JIrCDMiBQt35HpAiqvHsZeBQf9N+9guklRCQMStyI1Vyc3HPTRTZBsVmVD
         DJ7l+iJakcPKo0JGkhRLwpiSmDwKD4Q3G2PWyRL0YYMB8wdYWt2vSJxSXUMCJM5jc+Bc
         A7HrYiB9E4KJdaTlsf24GIipBHgtFdLHZ4h1mh282MNPHWT+9pCNJpCJEf7ntOqv5v+F
         a0FJudRQoTKKTjB5VYBkx23nXiJpPQQb2c/q8hNG7fCMiPnXMN3nU7L+YCzIxHrPOHfo
         D7D3pyOURRkCC94UwqqI2B2aLpL2pGO/BKLguSPqPZhhf596eilQqMeCcT/XbiI4vBND
         FgDA==
X-Gm-Message-State: AOAM5322DsEgu9pV5Ees7GNYH1kAW+kEEFtUbePVB8tGZDxfJQ2UvBDu
        0ASom2zZUJSVKIpjU/6xjg==
X-Google-Smtp-Source: ABdhPJzqPNiMCdNHHFESMV8o9UZee4ffeHLbRHZWFvF46CyTEba02pPXQvYv6AHvLiiID9zHWyZa0Q==
X-Received: by 2002:a92:6a08:: with SMTP id f8mr12418496ilc.94.1600114392923;
        Mon, 14 Sep 2020 13:13:12 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w13sm6386690iox.10.2020.09.14.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:13:12 -0700 (PDT)
Received: (nullmailer pid 161709 invoked by uid 1000);
        Mon, 14 Sep 2020 20:13:10 -0000
Date:   Mon, 14 Sep 2020 14:13:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: imx258: Add bindings for
 IMX258 sensor
Message-ID: <20200914201310.GA154873@bogus>
References: <1599031090-21608-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599031090-21608-1-git-send-email-krzk@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 09:18:08AM +0200, Krzysztof Kozlowski wrote:
> Add bindings for the IMX258 camera sensor.  The bindings, just like the
> driver, are quite limited, e.g. do not support regulator supplies.

Bindings should be complete, not what a driver happens to currently 
support.

> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. None
> ---
>  .../devicetree/bindings/media/i2c/imx258.yaml      | 92 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx258.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> new file mode 100644
> index 000000000000..ef789ad31143
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/imx258.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX258 13 Mpixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |-
> +  IMX258 is a diagonal 5.867mm (Type 1/3.06) 13 Mega-pixel CMOS active pixel
> +  type stacked image sensor with a square pixel array of size 4208 x 3120. It
> +  is programmable through I2C interface.  Image data is sent through MIPI
> +  CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx258
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: Frequency of input clock if clock is not provided
> +    deprecated: true

Why are we adding something deprecated on a new binding?

> +    const: 19200000
> +
> +  reg:
> +    maxItems: 1
> +
> +  # See ../video-interfaces.txt for more details
> +  port:
> +    type: object
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4

If this is the only config, why does it need to be in DT?

> +
> +          link-frequencies:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint64-array
> +            description:
> +              Allowed data bus frequencies.
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +
> +
> +if:
> +  not:
> +    required:
> +      - clocks
> +then:
> +  required:
> +    - clock-frequency
> +
> +unevaluatedProperties: false

additionalProperties

> +
> +examples:
> +  - |
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        sensor@6c {
> +            compatible = "sony,imx258";
> +            reg = <0x6c>;
> +            clocks = <&imx258_clk>;
> +
> +            port {
> +                imx258_ep: endpoint {
> +                    remote-endpoint = <&csi1_ep>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <320000000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc2aa691b75a..cca13d483d22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16130,6 +16130,7 @@ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/imx258.yaml
>  F:	drivers/media/i2c/imx258.c
>  
>  SONY IMX274 SENSOR DRIVER
> -- 
> 2.7.4
> 
