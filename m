Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86A6B507159
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 17:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353583AbiDSPIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 11:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbiDSPIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 11:08:50 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12B839BBA;
        Tue, 19 Apr 2022 08:06:04 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id hf18so11901146qtb.0;
        Tue, 19 Apr 2022 08:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3kmij7iNaQJU5WT/jMrZ8Zz5Ucc96C4QBrTjjRrlJY=;
        b=2+3MdOwLthbCEIJucCNKeQij4bGeUwleMmz/nqilSEIPRFBCH502FQY7XAmduzJIt1
         5emqlMqRh/+pMnxvgvlgEhRPsFpifpKBxDi2DeHdoyS5cf02Q5Y6FDgHmr+vv+AQpOoC
         vtAsfGs8xSoWtbtcZuLLzJN65OH5mAYtzpDsjl+xMPy8lESeaCGNn88abORyngpiJk7B
         KAmF0TXrFvJ53mtk4yV+2/sPrx7ujj+5beq4tmWudh9/4qhBw8CqcUJv5N/L7ManbEsK
         n4GkdvnmDkw75+gv9fkt4TYmSeCSHVXyqJT01BMXOeMZLz72Pz761F+oBnqwiyrVbkYm
         F/pA==
X-Gm-Message-State: AOAM532LaqewC+ot9xJPmHy3AQHd4DFzWjZWvtC5uXFo47KLgFsKMY8V
        51P7dA2xh6NxcofccF8xlwWA3SU8xtLsFg==
X-Google-Smtp-Source: ABdhPJxEO4ixZkX/Sjb4EF4ijhHSWbyhAFtIgJPaWYS3/a9UKgbZK53tIh9OcnUwLvyuoD5b+DLAKA==
X-Received: by 2002:a05:622a:9:b0:2f1:e9d7:d734 with SMTP id x9-20020a05622a000900b002f1e9d7d734mr10771744qtw.476.1650380763651;
        Tue, 19 Apr 2022 08:06:03 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id a63-20020ae9e842000000b0069e6722632bsm136973qkg.39.2022.04.19.08.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 08:06:03 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id s33so4137886ybi.12;
        Tue, 19 Apr 2022 08:06:03 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr15696350ybq.393.1650380762989; Tue, 19
 Apr 2022 08:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com> <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Apr 2022 17:05:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR4ONpLwPc59erG1adGQAn0iU4y_vH+4nYob-712pneQ@mail.gmail.com>
Message-ID: <CAMuHMdVR4ONpLwPc59erG1adGQAn0iU4y_vH+4nYob-712pneQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Thu, Apr 14, 2022 at 4:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> similar to VSP2-D found on R-Car SoC's, but it does not have a version
> register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
>
> This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> these differences.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - renesas,vsp1 # R-Car Gen2 and RZ/G1
>        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> +      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L

Given there is no version register, probably you want to define
SoC-specific compatible values.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
