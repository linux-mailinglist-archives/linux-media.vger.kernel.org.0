Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717545085B1
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 12:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377598AbiDTKX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 06:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377530AbiDTKX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 06:23:26 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB3D20F5B;
        Wed, 20 Apr 2022 03:20:41 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id i14so953635qvk.13;
        Wed, 20 Apr 2022 03:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f0NnpsPLCg2iui7O5h5I1HyO+jn7EEmNeJX5s7EqFIs=;
        b=sAHcdY6CaHJ8xnV/2s+53fWRlJldgRb+8jpk2qwevj7Vj1wDOYVHVbMpU5ePVGnraF
         h5nDiGqbwqkcZwXj1vykjvt1EsZ62aM/M3S5g7buVkHzlcVYILBCDr0KdM5Y46s8qow/
         I9zf2Qw95x0dA/Q1DYimF9AISueJnCSqKLay7RnhqALoZzfhNJZ1EH8jWILK1hBKF1jp
         E7y5C5PBeISqOnGfFpTfRpUM7zHLxHVdQMnWXL11/SAjZa2U0cF7f4kpW+LGaXk3Z1+c
         wKrcEwYPmA3vEkpHKYi+u9TXUfxd8f7Iqpp+OrRAzzQuBHSyk9t6xlrQfr8zISEr4ZaW
         xAlA==
X-Gm-Message-State: AOAM530fkvXAwDCGR4eBj2TCBxhQEh+XQNSEz+EIq1DBgov23FJGRx1A
        4OXZScT8CHQLyLGZCcgOuqOQ+ZeUBDbmCA==
X-Google-Smtp-Source: ABdhPJx7gHeDrhgkH7LU2C53/lj/J+nJhh8Mpcas+Oi2HKyrOG25SR5cs66Wqim/49BE1y3dHfTrAg==
X-Received: by 2002:a05:6214:3006:b0:444:2fa9:9849 with SMTP id ke6-20020a056214300600b004442fa99849mr14871653qvb.101.1650450039989;
        Wed, 20 Apr 2022 03:20:39 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id w3-20020a376203000000b0069e9a4568f9sm1325949qkb.125.2022.04.20.03.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 03:20:39 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2ef4a241cc5so12900337b3.2;
        Wed, 20 Apr 2022 03:20:39 -0700 (PDT)
X-Received: by 2002:a81:6ccb:0:b0:2f1:68f1:d90e with SMTP id
 h194-20020a816ccb000000b002f168f1d90emr17834467ywc.62.1650450039480; Wed, 20
 Apr 2022 03:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com> <20220419181757.63346-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419181757.63346-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Apr 2022 12:20:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAgJf89ZS_SnF0UMU9tUhROqDxP5N_mAeNj9N6oQBAUw@mail.gmail.com>
Message-ID: <CAMuHMdXAgJf89ZS_SnF0UMU9tUhROqDxP5N_mAeNj9N6oQBAUw@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2L VSPD bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Tue, Apr 19, 2022 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document VSPD found in RZ/G2L SoC. VSPD block is similar to VSP2-D
> found on R-Car SoC's, but it does not have a version register and
> it has 3 clocks compared to 1 clock on vsp1 and vsp2.
>
> This patch introduces a new compatible 'renesas,r9a07g044-vsp2' to
> handle these differences.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v7->v8:

Thanks for the update!

>  * Added Clock-names to false for Non RZ/G2L SoC's
>  * Replaced compatble 'renesas,rzg2l-vsp2'->'renesas,r9a07g044-vsp2'

Don't you want to keep "renesas,rzg2l-vsp2" as a fallback...

> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -17,6 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - renesas,r9a07g044-vsp2 # RZ/G2L
>        - renesas,vsp1 # R-Car Gen2 and RZ/G1
>        - renesas,vsp2 # R-Car Gen3 and RZ/G2
>

> @@ -50,17 +51,43 @@ required:
>
>  additionalProperties: false
>
> -if:
> -  properties:
> -    compatible:
> -      items:
> -        - const: renesas,vsp1
> -then:
> -  properties:
> -    renesas,fcp: false
> -else:
> -  required:
> -    - renesas,fcp
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,vsp1
> +    then:
> +      properties:
> +        renesas,fcp: false
> +    else:
> +      required:
> +        - renesas,fcp
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-vsp2

... so you can check for  "renesas,rzg2l-vsp2" here (and in the driver),
and don't have to update this check (and the driver) when adding support
for RZ/V2L later?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
