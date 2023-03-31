Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5DD6D23C8
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbjCaPPF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 31 Mar 2023 11:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbjCaPPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:15:04 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DAC1CBA9;
        Fri, 31 Mar 2023 08:14:55 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54601d90118so265040327b3.12;
        Fri, 31 Mar 2023 08:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680275694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWgHRMVasG7nDW/oXg1Gn0gxLEITRLu6jYb9r+As/UQ=;
        b=M8kG/2ViLAhn9U0zvuCVf74FdL8tRHbVN5lQR1a0PlnaKIP0pdA3m5VJbDRNhpcwMA
         4kBRr+zvl51VXiSFZPd966cTaetZe89nI2PTCA+rSikCcnGDXLBAGSWyjXwylX10B7mW
         JHuUGulaC9wy2DUmduLP7olOdci20V5iK6New6yQYy8sOVK+i5hm3iDiNXdvMzHTDp51
         LI4PxwznyTVBhd/9XbL+9+pqHJyfq1un+KjWfhaWju54RvwFXF62xJ/oXjvD8ZNlQF6f
         RayTo8CsPGeENunyvpUVyjrXW2ExAxX/eiAEBXRLJGjtrxiAmif1+vIScabF7ZIUhlf+
         rLkg==
X-Gm-Message-State: AAQBX9eoVa1ft6fKFO7mHyVz/G/rBbwtU+r33lwLrRU3U4zMN8u7GURl
        pqnrSeClHeTDdXikPP9KG85FFjh3iCaqMw==
X-Google-Smtp-Source: AKy350b+7EJaz9B3Zg9GG2rbkRWaXUjuix3rX5/EWcWFl2Yc69EPzqCAKFr968Rd0g4ucwtVLFAuJw==
X-Received: by 2002:a81:92c8:0:b0:543:dca5:8407 with SMTP id j191-20020a8192c8000000b00543dca58407mr24902591ywg.28.1680275694490;
        Fri, 31 Mar 2023 08:14:54 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id i11-20020a81f20b000000b00545a08184cbsm574389ywm.91.2023.03.31.08.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 08:14:54 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5456249756bso420475047b3.5;
        Fri, 31 Mar 2023 08:14:54 -0700 (PDT)
X-Received: by 2002:a81:ac19:0:b0:545:5e70:323f with SMTP id
 k25-20020a81ac19000000b005455e70323fmr2450399ywh.4.1680275694152; Fri, 31 Mar
 2023 08:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230331141032.3817866-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 31 Mar 2023 17:14:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXANL4RwjqcqGsjJa8_R2ExefnWbsOfayHLegzHsjpP8Q@mail.gmail.com>
Message-ID: <CAMuHMdXANL4RwjqcqGsjJa8_R2ExefnWbsOfayHLegzHsjpP8Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: maxim,max96712: Require setting
 bus-type property
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 31, 2023 at 4:15 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The MAX96712 can support both CSI-2 C-PHY and D-PHY bus. Document the
> supported bus-types and make the property mandatory.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -65,9 +65,14 @@ properties:
>
>              properties:
>                data-lanes: true
> +              bus-type:
> +                enum:
> +                  - 1 # CSI-2 C-PHY
> +                  - 4 # CSI-2 D-PHY

Perhaps use/refer to the symbolic names, too?

Sounds like an opportunity for improvement for
Documentation/devicetree/bindings/media/video-interfaces.yaml, too.

>
>              required:
>                - data-lanes
> +              - bus-type
>
>      required:
>        - port@4
> @@ -82,6 +87,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
>
>      i2c@e6508000 {
>              #address-cells = <1>;
> @@ -101,6 +107,7 @@ examples:
>                              port@4 {
>                                      reg = <4>;
>                                      max96712_out0: endpoint {
> +                                            bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                                              clock-lanes = <0>;
>                                              data-lanes = <1 2 3 4>;
>                                              remote-endpoint = <&csi40_in>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
