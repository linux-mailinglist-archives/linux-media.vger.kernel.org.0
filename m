Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26F91E8966
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 23:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgE2VCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 17:02:23 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:38943 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgE2VCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 17:02:22 -0400
Received: by mail-il1-f196.google.com with SMTP id p5so2749849ile.6;
        Fri, 29 May 2020 14:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DXoD27d9tewtnlv/PY5e/uw4mOGR5EbYaPYYjxh7KMg=;
        b=R7O+K1oR8vV7TAOBSFrm/J8JhXEdJ7zryPcu1oR4xo0CQl/8gEpxit3RQ9pl6OPGQc
         d+21cThZdWleXV5rgtePq5c5UTjYit3YgmHStuk1zZXk3CVt5oouC0X416CR6J0kyE1C
         v829CwRGACCDsSsGUhh527fLFcLWjta2XjO3XtOpN+0k2oJQUvJPjq6xz/Lq+kC4fJ06
         uIAHnOuhOonUjlDiHl1klRlqH3xSvHoiJbARinILaVZQrATEpotoElluV4gh6expc3Le
         NagW5FNuyoZ0BimnaZJ7QN3bffKAwC8S0iG68e82BXMFJvBVRK7yDNoLFSFTpCmqyNxO
         wM1A==
X-Gm-Message-State: AOAM533icBzLtE5D7k7s9hjY0wwDmSnxVISGEHAQK2GsR9ZBwgshLAZ9
        u1ieHSQko7TGey18+caSqA==
X-Google-Smtp-Source: ABdhPJyntTJ6+8NEaC8etSzQbcHfSUXHzsW9dAPNhHO+10TgJjNyGZUH7gJPQ9ygLnLcZMHsHjzflg==
X-Received: by 2002:a92:a1d1:: with SMTP id b78mr4797424ill.164.1590786140567;
        Fri, 29 May 2020 14:02:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y12sm3016502ili.83.2020.05.29.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 14:02:19 -0700 (PDT)
Received: (nullmailer pid 2948882 invoked by uid 1000);
        Fri, 29 May 2020 21:02:18 -0000
Date:   Fri, 29 May 2020 15:02:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Add ch7322 media i2c device
Message-ID: <20200529210218.GA2815707@bogus>
References: <20200529030012.254592-1-jnchase@google.com>
 <20200529030012.254592-2-jnchase@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529030012.254592-2-jnchase@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 28, 2020 at 11:00:11PM -0400, Jeff Chase wrote:
> The ch7322 is a Chrontel CEC controller.
> 
> Signed-off-by: Jeff Chase <jnchase@google.com>
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml   | 65 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  MAINTAINERS                                   |  7 ++
>  3 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> new file mode 100644
> index 000000000000..d5706e08164c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Chrontel HDMI-CEC Controller
> +
> +maintainers:
> +  - Jeff Chase <jnchase@google.com>
> +
> +description: |-

Can drop the '|-' as you don't need any formatting.

> +  The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
> +  programmable through I2C and drives a single CEC line.
> +
> +properties:
> +  compatible:
> +    const: chrontel,ch7322
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the RESET pin, if any. This
> +      pin is active-low.

How many? (maxItems: 1)

> +
> +  standby-gpios:

How many?

> +    description: |-
> +      Reference to the GPIO connected to the OE pin, if any. When low
> +      the device will respond to power status requests with "standby"
> +      if in auto mode.
> +
> +  # see ../cec.txt
> +  hdmi-phandle:
> +    description: phandle to the HDMI controller
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      ch7322@75 {
> +        compatible = "chrontel,ch7322";
> +        reg = <0x75>;
> +        interrupts = <47 IRQ_TYPE_EDGE_RISING>;
> +        standby-gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
> +        reset-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
> +        hdmi-phandle = <&hdmi>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index d3891386d671..7794ffccd325 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -187,6 +187,8 @@ patternProperties:
>      description: ChipOne
>    "^chipspark,.*":
>      description: ChipSPARK
> +  "^chrontel,.*":
> +    description: Chrontel, Inc.
>    "^chrp,.*":
>      description: Common Hardware Reference Platform
>    "^chunghwa,.*":
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d633a131dcd7..34c6d30e61e5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4047,6 +4047,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
>  N:	cros_ec
>  N:	cros-ec
>  
> +CHRONTEL CH7322 CEC DRIVER
> +M:	Jeff Chase <jnchase@google.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
> +
>  CIRRUS LOGIC AUDIO CODEC DRIVERS
>  M:	James Schulman <james.schulman@cirrus.com>
>  M:	David Rhodes <david.rhodes@cirrus.com>
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog
> 
