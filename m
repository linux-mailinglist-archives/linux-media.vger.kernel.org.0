Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F6863A8EA
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiK1NH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbiK1NH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:07:26 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C44B959B
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:07:25 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z92so4870214ede.1
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jVO3NPc4MotQ6I1W5xYQ7Ut6YqRh9PUC5s/7s2zwHQ=;
        b=LGJwufVUTwdLBhLfvfpWFghCPGDJXRB20uy423c/p8ZwTtV/ZjyxOysBh79eCuigEP
         0fzYGS3+Vhm18OpIOUS6Lb4uiaQ7fxEWmJl6I1iWYEPgE65muhJBS7yif7GOxDxBZh7h
         TS9tRy/oPseFJj+KA+75lALUqbX6sKRAgwUIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jVO3NPc4MotQ6I1W5xYQ7Ut6YqRh9PUC5s/7s2zwHQ=;
        b=4K2hJ9gIBDcwu5z8GfPuaZtC3ceJjyXBBqrtCx4rI3JegXQYI5YzUIheT83RJoOjK5
         BvfzPL/QdvTkHxOGWBpcvu9tFflR0BFh1gRNWDYbbpD13MCKpXzwAzUhFoasUtf1Vf8G
         RD/H/NwGUKLsl5RJVjiC68TEsbOMV/4i5QFtqoa5Kb+UFihuXjBWfnk+va+D5jGSPjGo
         M2s4OPVOXkmracZJ4cb3Q2Ye4FPGREheJ9j9RAj1ogRyPOk+YIr/4dS+yXSabSGo5zuc
         ROGlWpWwgXRU8oWMqkDCNbMcXub8tqaTFTXaMTXFmXf0CM2AQK4lf3AvdNHLbDsob04B
         zN0g==
X-Gm-Message-State: ANoB5pmALxkM5XH0drEhwOh/TBPDEuP3TUwfZWaXOYO0/DVh3nx1qici
        wuftMy5IV/Q0CFwgOWDe3v7pag==
X-Google-Smtp-Source: AA0mqf7r5SvbXKYEHCK1kb8FngaEW2G1uTb7xR8aKosbVVQl80lXR/J78bSPNTtslYulkreKbScdlg==
X-Received: by 2002:a05:6402:5290:b0:461:af68:9bcd with SMTP id en16-20020a056402529000b00461af689bcdmr30745038edb.67.1669640843807;
        Mon, 28 Nov 2022 05:07:23 -0800 (PST)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060cc200b007bd7178d311sm3314605ejh.51.2022.11.28.05.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:07:23 -0800 (PST)
Date:   Mon, 28 Nov 2022 15:07:22 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v1 1/5] DT bindings for imx492
Message-ID: <Y4SyiutWc2r52KVt@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <20221125153120.541298-2-petko.manolov@konsulko.com>
 <Y4Q7JiJlhUL96yBW@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4Q7JiJlhUL96yBW@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-11-28 06:37:58, Laurent Pinchart wrote:
> Hi Petko,
> 
> Thank you for the patch.
> 
> The subject line should start with the proper prefix. Look at the git
> log in the directory to see what is customary. Furthermore,
> s/imx492/Sony IMX492/.
> 
> On Fri, Nov 25, 2022 at 05:31:16PM +0200, Petko Manolov wrote:
> > Here goes the DT bindings file.
> 
> This is also a peculiar commit message :-)

Short and to the point, isn't it? :)

Honestly, i'm not sure what else i should put as subject line, apart from "Sony
IMX492".

> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> > ---
> >  .../bindings/media/i2c/sony,imx492.yaml       | 101 ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> > new file mode 100644
> > index 000000000000..f4feef17c677
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx492.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony imx492 Sensor
> 
> s/imx492/IMX492/. Same below. When referring to the hardware, it's
> customary to use uppercase.

OK.

> > +
> > +maintainers:
> > +  - Petko Manolov <petko.manolov@konsulko.com>
> > +
> > +description:
> > +
> > +  imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> > +  monochrome square pixel array and approximately 47.08 M effective pixels.
> > +  12-bit digital output makes it possible to output the signals with high
> > +  definition for moving pictures. It is programmable through I2C interface. The
> > +  I2C client address can be either 0x10 or 0x1a depending on SLASEL pin. Image
> > +  data is sent through MIPI CSI-2.
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx492
> 
> Missing blank line.

OK.

> > +  reg:
> > +    description: I2C address
> 
> You can drop the description.
> 
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
> 
> This shouldn't be needed.

OK.

> > +
> > +  clocks:
> > +    description: Clock frequency 6MHz, 12MHz, 18MHz and 24MHz
> 
> If you know the name of the clock pin, I would include it here.

OK.

> > +    maxItems: 1
> > +
> > +  dovdd-supply:
> > +    description: Interface power supply.
> 
> I would list the voltage. Same below.

OK.

> > +
> > +  avdd-supply:
> > +    description: Analog power supply.
> > +
> > +  dvdd-supply:
> > +    description: Digital power supply.
> > +
> > +  reset-gpios:
> > +    description: Reference to the GPIO connected to the XCLR pin, if any.
> > +    maxItems: 1
> > +
> > +  port:
> > +    additionalProperties: false
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes: true
> > +          link-frequencies: true
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        camera@10 {
> > +            compatible = "sony,imx492";
> > +            reg = <0x10>;
> > +            clocks = <&imx492_clk>;
> > +
> > +            assigned-clocks = <&imx492_clk>;
> > +            assigned-clock-parents = <&imx492_clk_parent>;
> > +            assigned-clock-rates = <24000000>;
> 
> You can drop this from the example, it doesn't showcase the DT bindings for
> the IMX492.

OK.

> > +
> > +            port {
> > +                imx492: endpoint {
> 
> s/imx492/imx492_out/
> 
> > +                    remote-endpoint = <&cam>;
> 
> s/cam/cam_in/

OK to both of the above.

> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 <600000000>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> 
> -- 
> Regards,
> 
> Laurent Pinchart


cheers,
Petko
