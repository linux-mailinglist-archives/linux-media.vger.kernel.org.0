Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE3732F636
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 23:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhCEW6q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 17:58:46 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:45364 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCEW63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Mar 2021 17:58:29 -0500
Received: by mail-oi1-f177.google.com with SMTP id m25so4251683oie.12;
        Fri, 05 Mar 2021 14:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1oJfp5wOtSpahzuVaU4L5ORJxXB79SaHjEEoQZLe6IM=;
        b=txJFUgxeEMvtu9URK7YJhe4kKuj9NFs/c4RhIQeZD8QkQRG63meWRv3mGP/iSGuxkq
         M8OP34PUx56bynJO8vwoi5Ikc7tAHviTGWG2i/I0TEsNUmyEkHCixs2uA4iK+O/N7ZUf
         rtHM3nrA/UBk+qZ8k3eE/geLU0VTNoNf+HA/v6+Rl4UV3lRwUOFTsvvsJr3etoz/Twah
         zrOAXnqfZDNDdL1ZxY7NbwRj3niaTWP9CpW8jPihX6w8sY1hOlPyrqqBm4lJn6yx/1HS
         oZR7eyrU9ayaMdKc7pqSmPfg2fHHKjQEZ3QCOqOu2b7h5PsWaxQh94eXd971M7NLMRWk
         G8zg==
X-Gm-Message-State: AOAM532L4jcZRtxJRefOzd0avZ0yLb14BG3CSUCr/KTPC9E6vZqOFNA9
        zx6OvdlcH/rmEoT1BxisYtg/O2OJcw==
X-Google-Smtp-Source: ABdhPJyO9xP+BYGZnmgcyS3UuIcaVDE+wxMS21R4xRm7ICyJ4KPOJLuGtTr8m3fWtV3XUCNE5UYccw==
X-Received: by 2002:aca:ab09:: with SMTP id u9mr8745691oie.153.1614985109238;
        Fri, 05 Mar 2021 14:58:29 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f44sm933509otf.7.2021.03.05.14.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:58:28 -0800 (PST)
Received: (nullmailer pid 798293 invoked by uid 1000);
        Fri, 05 Mar 2021 22:58:27 -0000
Date:   Fri, 5 Mar 2021 16:58:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 2/3] media: dt-bindings: media: i2c: Add bindings for
 TW9900
Message-ID: <20210305225826.GA794278@robh.at.kernel.org>
References: <20210219081514.1592033-1-maxime.chevallier@bootlin.com>
 <20210219081514.1592033-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219081514.1592033-3-maxime.chevallier@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 19, 2021 at 09:15:13AM +0100, Maxime Chevallier wrote:
> The Techwell TW9900 is a video decoder supporting multiple input
> standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
> signal.
> 
> It's designed to be low-power, posesses some features such as a
> programmable comb-filter, and automatic input standard detection.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2->V3 : Fix the example not compiling due to a typo in the reset-gpios
> node.
> 
> V3->V4 : Add the missing reset-gpios node to the binding
> 
>  .../devicetree/bindings/media/i2c/tw9900.yaml | 64 +++++++++++++++++++

Use the compatible string for the filename.

>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> new file mode 100644
> index 000000000000..d27196e37416
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/tw9900.yaml#

Don't forget to update this...

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Techwell TW9900 NTSC/PAL/SECAM video decoder
> +
> +maintainers:
> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> +
> +description:
> +  The tw9900 is a multi-standard video decoder, supporting NTSC, PAL and SECAM
> +  standards with auto-detection features.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - techwell,tw9900
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: VDD power supply
> +
> +  reset-gpios:
> +    description: GPIO descriptor for the RESET input pin
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description:
> +      A node containing a single endpoint as doucmented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

It's now video-interfaces.yaml, but you aren't using anything from it. 
You need to reference graph.yaml though. See the examples in the tree 
now.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            tw9900: tw9900@44 {
> +                    compatible = "techwell,tw9900";
> +                    reg = <0x44>;
> +
> +                    vdd-supply = <&tw9900_supply>;
> +                    reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> +
> +                    port {
> +                            tw9900_out: endpoint {
> +                                    remote-endpoint = <&vip_in>;
> +                            };
> +                    };
> +            };
> +    };
> -- 
> 2.25.4
> 
