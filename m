Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5195524D3E7
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 13:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHUL0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 07:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgHUL0c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 07:26:32 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD20AC061388;
        Fri, 21 Aug 2020 04:26:31 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id y134so866875yby.2;
        Fri, 21 Aug 2020 04:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=skzxqD/NGUvc/HsTmn3oZ/wYku/kyh5WrekF3HvBqWk=;
        b=maN2Sm8UNpQ2+YyUUFwdz9eUgQbi1RNvHlRQR7ndfum9z8ZDa1fJOt0NvhoCMuuMqE
         MSWSdrdgyi036Tjautm7k5OJVbOMbx9bxVbFQ5N3xA3fi3owA+XZhIUOaAPSjg0GFFMf
         Qu0AKQNdS+jo0ctNdXiULmIQAegFkB5OLbasQyC+AOBrJ4Go5FgHgZRpek4WASiMtINi
         FbTzg4ZLPuMETG8XTIzZmEPGG2T0HsY/tSshmQpkxewQd31bpQNsN23O8+LCw6YPxCF6
         D3eJS5uNH2H2WIoIqGnRcvrLqm2U8VLDFNffn5mXHWHeWPfMaPtE2sEz+O4PJiOGBZNs
         Uc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skzxqD/NGUvc/HsTmn3oZ/wYku/kyh5WrekF3HvBqWk=;
        b=qBGnZaDi0lUHlDxg0JrGpM8Du5OJ9gnm4j0FKtXLwzhcNu3oFFZmWy4CAGq/BUWpoy
         kkr7RurrF/6FEyJ8WK6VZbJe+0iVQtCbee3h/13ERHPSBBoQtTxJea/XWyC3IYsDYFLv
         oUZOzAju5ae8yXFe/FQj4RGuKwbq4wFh7OzHQmRXfOTmlueMX/lj3WKC8TBsRD9gpowi
         PVg+AQJ/JxzdB6xGaSDWZdQXg7iaYivnG7iSEB/3bO2gF+hPrmZp1VbV461F71gv+e1l
         CRpWkTpDGZdP+eilMmzRL9pFi2wl/acxUtXdY+GLTAR392IQLDy+ycfNes4zvctZ86Y2
         s+ew==
X-Gm-Message-State: AOAM530YEz9y4QunXaVvOXPSqUzbQpy0sQhzSSpqRpaqODJN2nY8X5Fl
        WRNgCIxY0B40bLZTD6FZxKd/ZZWZYFtKMsbzVdc=
X-Google-Smtp-Source: ABdhPJz6BOVQq+uU27DB2+qhiIgEVSq1rjdKnbRYDgmRKVlriKEHtn2fcEqXV1NjXbmtF65nIdwAiC8GYEr5wwL8D+Q=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr2814821ybv.401.1598009190877;
 Fri, 21 Aug 2020 04:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org> <20200818122012.37956-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20200818122012.37956-2-jacopo+renesas@jmondi.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 Aug 2020 12:26:04 +0100
Message-ID: <CA+V-a8vSz0z0Crq+552ZtWcK_KkTJxVEs6xX9m8G8YObiTi=LQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: ov772x: Convert to json-schema
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 18, 2020 at 1:16 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> Convert the ov772x binding document to json-schema and update
> the MAINTAINERS file accordingly.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.txt  | 40 ---------
>  .../devicetree/bindings/media/i2c/ov772x.yaml | 84 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.yaml
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabbhakar

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> deleted file mode 100644
> index 0b3ede5b8e6a..000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -* Omnivision OV7720/OV7725 CMOS sensor
> -
> -The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> -such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> -support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> -
> -Required Properties:
> -- compatible: shall be one of
> -       "ovti,ov7720"
> -       "ovti,ov7725"
> -- clocks: reference to the xclk input clock.
> -
> -Optional Properties:
> -- reset-gpios: reference to the GPIO connected to the RSTB pin which is
> -  active low, if any.
> -- powerdown-gpios: reference to the GPIO connected to the PWDN pin which is
> -  active high, if any.
> -
> -The device node shall contain one 'port' child node with one child 'endpoint'
> -subnode for its digital output video port, in accordance with the video
> -interface bindings defined in Documentation/devicetree/bindings/media/
> -video-interfaces.txt.
> -
> -Example:
> -
> -&i2c0 {
> -       ov772x: camera@21 {
> -               compatible = "ovti,ov7725";
> -               reg = <0x21>;
> -               reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> -               powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> -               clocks = <&xclk>;
> -
> -               port {
> -                       ov772x_0: endpoint {
> -                               remote-endpoint = <&vcap1_in0>;
> -                       };
> -               };
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> new file mode 100644
> index 000000000000..2b84fefeb4aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ov772x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title:  Omnivision OV7720/OV7725 CMOS sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: -|
> +  The Omnivision OV7720/OV7725 sensor supports multiple resolutions output,
> +  such as VGA, QVGA, and any size scaling down from CIF to 40x30. It also can
> +  support the YUV422, RGB565/555/444, GRB422 or raw RGB output formats.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ovti,ov7720
> +      - ovti,ov7725
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: -|
> +      Reference to the GPIO connected to the RSTB pin which is active low.
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: -|
> +      Reference to the GPIO connected to the PWDN pin which is active high.
> +    maxItems: 1
> +
> +  port:
> +    type: object
> +    description: |
> +      The device node must contain one 'port' child node for its digital output
> +      video port, in accordance with the video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        properties:
> +          remote-endpoint:
> +            description: A phandle to the bus receiver's endpoint node.
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - reset-gpios
> +  - powerdown-gpios
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c0 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        ov772x: camera@21 {
> +            compatible = "ovti,ov7725";
> +            reg = <0x21>;
> +            reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> +            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> +            clocks = <&xclk>;
> +
> +            port {
> +                ov772x_0: endpoint {
> +                    remote-endpoint = <&vcap1_in0>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1a6173d3b64..d0a20214eaaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12666,7 +12666,7 @@ M:      Jacopo Mondi <jacopo@jmondi.org>
>  L:     linux-media@vger.kernel.org
>  S:     Odd fixes
>  T:     git git://linuxtv.org/media_tree.git
> -F:     Documentation/devicetree/bindings/media/i2c/ov772x.txt
> +F:     Documentation/devicetree/bindings/media/i2c/ov772x.yaml
>  F:     drivers/media/i2c/ov772x.c
>  F:     include/media/i2c/ov772x.h
>
> --
> 2.27.0
>
