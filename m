Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1319B576474
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiGOPc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiGOPcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:32:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D9E19034
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:32:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ss3so9558072ejc.11
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v9+MIpPsQlOm0JZE/Y1pTuUdRuzfwlvTTL81jN8pkm8=;
        b=jqiSaDJfEZZwOkjth8dc1PDHXNYprAy9taDzrx5dJgdINQGsG74OKEcT6KnltuTyq+
         1PhCmmfo77mRSdOlCo5l6Xuae3SsHUIqmB1fyIrneJ517Jy89gyQqhfc+rT6EP3oC0uh
         dJWUvCXTpw4u0jjbovdQO15RSiveBfB0cuUgHmnlzcy3QyaTcr9hmdnnQTRS8t3fS4Tf
         W6iC4x6960QX0OVtHfvzvfses3pI+ABIvVj9dZvQZocLB+hwAGqWECOWtZrfeDYeI7Ri
         9Utl3cNukwKAlWze22+LBHrchrvh5EBDd+mPsLx0GuhJgUQYB+3hnA7NfBP+jzIhnPH1
         yhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v9+MIpPsQlOm0JZE/Y1pTuUdRuzfwlvTTL81jN8pkm8=;
        b=HAHlx7OiiDlP7omlo2snrxbi+pbFv5FkYdnv7Z1jgwJlhG6TBIzNUAQWR4lInGyOd8
         /BqWU96a+sgJzEsA0fJ85ekHgDP0vZzAbn3Kv5A3IKVnLrXv0YXu7J57FvYCIwc/zdle
         DnWctBQLumftFXFrJ9qw7hs66ZJHSpmtETuls0tFtxN3BrqFuL1Tvx0QUSQw8osPu3Kp
         iLknxAbd8IHfdNQbZpJtw2tGEMns2lWmz50nPy3XGBTE0l+S2HktBkCFJiUpv7w2UywX
         cKUIvNtEAlr0Z8RgkzQ6wEIKhHb84J1JL6pz9Z3BuqsdgnoAwOPghzVcxYX4FzMzwG1J
         gBeQ==
X-Gm-Message-State: AJIora/pEooOErSjF2h1KvFOrRdTkUCctklf5gSwN4Z6cfTVZ4qm1hGC
        RdY5+fzzgz71ZEThmM7HuOQRFw==
X-Google-Smtp-Source: AGRyM1sypL3wJZTJC/4Mvsx7SDEnY9nUm+LH4m4esA+eguo8MCq37+5YuRyrAZ+I1C/A5qzBxAR6MQ==
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id g4-20020a1709065d0400b00722f46cb891mr14372921ejt.4.1657899170037;
        Fri, 15 Jul 2022 08:32:50 -0700 (PDT)
Received: from vkh-ThinkPad-T490 ([194.44.56.171])
        by smtp.gmail.com with ESMTPSA id js1-20020a170906ca8100b00718d18a1860sm2126709ejb.61.2022.07.15.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 08:32:49 -0700 (PDT)
Date:   Fri, 15 Jul 2022 18:32:43 +0300
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: dt-bindings: media: i2c: Add mlx7502x
 camera sensor binding
Message-ID: <20220715153243.GA18207@vkh-ThinkPad-T490>
References: <cover.1657786765.git.vkh@melexis.com>
 <712c1acff963238e685cbd5c4a1b91f0ec7f9061.1657786765.git.vkh@melexis.com>
 <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys/qq4hIQ25KXB2/@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review,

On Thu, Jul 14, 2022 at 01:06:35PM +0300, Laurent Pinchart wrote:
> Hi Volodymyr,
> 
> Thank you for the patch.
> 
> On Thu, Jul 14, 2022 at 11:34:47AM +0300, Volodymyr Kharuk wrote:
> > Add device tree binding of the mlx7502x and update MAINTAINERS
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  .../bindings/media/i2c/melexis,mlx7502x.yaml  | 146 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 147 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > new file mode 100644
> > index 000000000000..4ac91f7a26b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> > @@ -0,0 +1,146 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/melexis,mlx7502x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Melexis ToF 7502x MIPI CSI-2 Sensor
> > +
> > +maintainers:
> > +  - Volodymyr Kharuk <vkh@melexis.com>
> > +
> > +description: |-
> > +  Melexis ToF 7502x sensors has a CSI-2 output. It supports 2 and 4 lanes,
> > +  and mipi speeds are 300, 600, 704, 800, 904, 960Mbs. Supported format is RAW12.
> > +  Sensor 75026 is QVGA, while 75027 is VGA sensor.
> > +  If you use compatible = "melexis,mlx7502x", then autodetect will be called.
> 
> I'd move this last line as a description of the compatible property, but
> I'm also not sure this should be mentioned in the DT bindings, as it's a
> driver implementation detail. I'm actually not sure we should support it
> with three different compatible values as proposed, as without this
> documentation users will have a hard time figuring out what compatible
> value to pick.
> 
> One option would be to support the following three compatible values:
> 
> 	compatible = "melexis,mlx75026", "melexis,mlx7502x";
> 	compatible = "melexis,mlx75027", "melexis,mlx7502x";
> 	compatible = "melexis,mlx7502x";
> 
> The last one only would trigger autodetection. I'm still not sure how to
> document that properly in bindings though.
> 
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - melexis,mlx7502x
> > +          - melexis,mlx75026
> > +          - melexis,mlx75027
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-parents: true
> > +  assigned-clock-rates: true
> > +
> > +  clocks:
> > +    description: Clock frequency 8MHz
> > +    maxItems: 1
> > +
> > +  vdda-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply(2.7V).
> > +
> > +  vddif-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply(1.8V).
> > +
> > +  vddd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply(1.2V).
> > +
> > +  vdmix-supply:
> > +    description:
> > +      Definition of the regulator used as mixed driver power supply(1.2V).
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Reset Sensor GPIO Control (active low)
> > +
> > +  melexis,trig-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Hardware Trigger GPIO Control (active low)
> > +      When the hardware trigger mode is enabled, this GPIO is used to generate
> > +      a low level impulse for about 100us. The impulse triggers a new
> > +      measurement cycle.
> > +
> > +  melexis,leden-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Led driver enable GPIO Control (active high)
> > +      This GPIO notifies the illumination driver when it is safe to use led
> > +      signals from the sensor.
> 
> As far as I understand this isn't an input of the sensor, but a signal
> that is driven by the driver and controls the separate illuminator. It
> shouldn't be specified in this binding, as it's not a property of the
> sensor. You should instead have a DT node for the illumination driver.
Yes, you are right. There are illuminators, which are not ready to accept
the signal from the sensor, if pin levels are not right. So I need to
notify illuminator somehow.  Can the illumination driver be as a V4L2
subdevice? Then I can notify the illuminator via s_stream. In another
case it can damage the illuminator. What do you think?
> 
> > +  port:
> > +    description: MIPI CSI-2 transmitter port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes:
> > +            oneOf:
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +              - items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +          clock-noncontinuous: true
> > +          link-frequencies: true
> > +
> > +        required:
> > +          - data-lanes
> > +          - link-frequencies
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> 
> Let's make the supplies mandatory too, as the chip can't operate without
> them.
Ok
> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        mlx7502x: camera@57 {
> > +            compatible = "melexis,mlx7502x";
> > +            reg = <0x57>;
> > +            clocks = <&mlx7502x_clk>;
> > +
> > +            assigned-clocks = <&mlx7502x_clk>;
> > +            assigned-clock-parents = <&mlx7502x_clk_parent>;
> > +            assigned-clock-rates = <8000000>;
> > +
> > +            vddd-supply = <&mlx_7502x_reg>;
> > +
> > +            reset-gpios = <&gpio_exp 6 GPIO_ACTIVE_HIGH>;
> > +            melexis,trig-gpios = <&gpio_exp 2 GPIO_ACTIVE_HIGH>;
> > +            melexis,leden-gpios = <&gpio_exp 7 GPIO_ACTIVE_HIGH>;
> > +
> > +            port {
> > +                mlx7502x_out_mipi_csi2: endpoint {
> > +                    remote-endpoint = <&mipi_csi2_from_mlx7502x>;
> > +                    data-lanes = <1 2 3 4>;
> > +                    link-frequencies = /bits/ 64 < 960000000
> > +                                                   904000000
> > +                                                   800000000
> > +                                                   704000000
> > +                                                   600000000
> > +                                                   300000000 >;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1a68d888ee14..b00a726bb3db 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12678,6 +12678,7 @@ M:	Volodymyr Kharuk <vkh@melexis.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Supported
> >  W:	http://www.melexis.com
> > +F:	Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
> >  F:	include/uapi/linux/mlx7502x.h
> >  
> >  MELFAS MIP4 TOUCHSCREEN DRIVER
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
--
Volodymyr Kharuk

