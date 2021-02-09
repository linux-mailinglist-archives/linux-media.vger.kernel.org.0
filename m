Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1BA315991
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 23:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhBIWc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 17:32:57 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:39668 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbhBIWPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 17:15:12 -0500
Received: by mail-wm1-f52.google.com with SMTP id u14so133753wmq.4;
        Tue, 09 Feb 2021 14:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iGjSkLmZpYZM3cnDu88EyFKx7+uIVrVY7bqhCJV1qtM=;
        b=qMrkbkGc2Hq/bdDBUWBHVexlYYnCKzk9NvN16s8/vJt9mEcLFQx6Lj4RlnUQN6xqaz
         exoJNum/mCek8R0TiIk6QuoYpvEjrCSUHrlTH8Mu0yqagHBX3or6ptEJrlzUOWDtVE4m
         QDlce4IeutijlMEQ+cufYzrcX9yhEIZxEqML1zmcNhZCWVhVCN/xDpSIETusk7XngVUe
         ay3LZdiehOjIFuEoXuDNC0pvvpzW6q1HqfO0i+W6d8+Y71FkbM//gGkv7aA0KnWbHaDI
         Vh+qtaoEF0z9dz94sMSXJ5cDIJuYw92VJDxCjRxLplYMT74KiJrvWTj842XqYEwNB0NK
         RLYg==
X-Gm-Message-State: AOAM532JHBhP8mvHoiUOPN3/yktqw0xZtbezbCWA+ZB+Iu7sfcRqQUyl
        cfToIn7236YKoakxitCScVvsvXovzlQ=
X-Google-Smtp-Source: ABdhPJznRW8XU4DiwipkRFmZtgShOqQIj1MdzTkTXqmncTdt8pBPkywwKum0SJRx1KU8n4+WvzNWRg==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr198138wmc.80.1612908866496;
        Tue, 09 Feb 2021 14:14:26 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h9sm14959163wrc.94.2021.02.09.14.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 14:14:25 -0800 (PST)
Date:   Tue, 9 Feb 2021 23:14:23 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH v7 1/2] dt-bindings: media: Add bindings for imx334
Message-ID: <20210209221423.e7klhiqqdvm6n2ej@kozik-lap>
References: <20210203135441.136-1-martinax.krasteva@linux.intel.com>
 <20210203135441.136-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210203135441.136-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 03, 2021 at 01:54:40PM +0000, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx334 sensor driver.
> - Add MAINTAINERS entry for Sony imx334 binding documentation.
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Reviewed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx334.yaml | 90 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> new file mode 100644
> index 000000000000..3145e94d043e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2021 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx334.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX334 Sensor
> +
> +maintainers:
> +  - Paul J. Murphy <paul.j.murphy@intel.com>
> +  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +
> +description:
> +  IMX334 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 3864H x 2202V. It is programmable through I2C interface. The
> +  I2C client address is fixed to 0x1a as per sensor data sheet. Image data is
> +  sent through MIPI CSI-2.
> +
> +properties:
> +  compatible:
> +    const: sony,imx334
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
> +
> +  port:
> +    type: object
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/properties/port
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          data-lanes:
> +            $ref: ../video-interfaces.yaml#/properties/data-lanes
> +          link-frequencies:
> +            $ref: ../video-interfaces.yaml#/properties/link-frequencies
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

For the bindings:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

> +            reg = <0x1a>;
> +            clocks = <&imx334_clk>
> +
> +            assigned-clocks = <&imx334_clk>;
> +            assigned-clock-rates = <24000000>;
> +
> +            port {
> +                imx334: endpoint {
> +                    remote-endpoint = <&cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <891000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3353de0c4bc8..2ab75519938a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16589,6 +16589,14 @@ S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/imx319.c
>  
> +SONY IMX334 SENSOR DRIVER
> +M:	Paul J. Murphy <paul.j.murphy@intel.com>

This entry looks unusual.  Paul's name appears in multiple places (added
as maintainer for Keembay and this sensor) but there are no emails from
him:
https://lore.kernel.org/lkml/?q=f%3Apaul.j.murphy%40intel.com
Nothing on LKML.

Does this person really exists and plans to work with upstream?

I am asking because several patches came with acks and reviews before
first submission to LKML which could mean that you just send something
from your internal kernel tree. Usually it is expected to see the
Acks/Reviews/Tested on the lists. Providing them via private channels is
rather discouraged - does not look like open way of doing things.

Best regards,
Krzysztof

> +M:	Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
