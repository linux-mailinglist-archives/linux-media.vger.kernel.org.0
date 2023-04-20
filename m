Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5384D6E977C
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 16:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbjDTOq2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 20 Apr 2023 10:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjDTOq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 10:46:26 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696374682;
        Thu, 20 Apr 2023 07:46:24 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id l5so2286840ybe.7;
        Thu, 20 Apr 2023 07:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682001983; x=1684593983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucGFoKzyMkvbqBH4ukYaF9U0mjf0Vik4MYd/Gcx2gRc=;
        b=QniObtIcQELZ6TJDRQr5zqlTYnkFO3udxnc3Q2dNZAEkic3p6EYb7KGMOaQf9vGX0I
         YjUXeMii4Ao6FotQGG5tyrprXQPcJrJSDk2p8GUmQgLa4+vZio0OUtls+rtMi4Ax9/pz
         TdX4e5N1uYFJYgMm3N+JFnH1kdWhR783SJBT6VCToNNsXN4At/OSikETanQH1sbLdZcZ
         e3kpyLCyLoVqsXdtHn28RhkTHta9SYMWEb0Px3kpypYyKGLvve0NT4ZaQcReBtQeCfvb
         iuxU4L3rZy5Z7Q9fcfTsXup+AehnHY7kEMDt7jmBg0MXh74p71e4+0mB4qW7X7inQ2JR
         XGOw==
X-Gm-Message-State: AAQBX9ceDOA3UhBxJrY14iHaSXCQiBMq5RLR3izM+jA3LYXUpMTd8n2B
        au2ZCyVyFxrC3oZKk9aWKHYUYyDFSDmWbBRi
X-Google-Smtp-Source: AKy350YriUWwhbd/fU600NJcI5ixhLW8jcQFJyCyS0y72jwIPckrYVFT865zl5fnFFaf1ajAbgZ4CQ==
X-Received: by 2002:a05:6902:102a:b0:b95:630:1de1 with SMTP id x10-20020a056902102a00b00b9506301de1mr2050422ybt.46.1682001983423;
        Thu, 20 Apr 2023 07:46:23 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id k184-20020a2524c1000000b00b8ed4e15acbsm326002ybk.63.2023.04.20.07.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:46:22 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-552ae3e2cbeso43925117b3.13;
        Thu, 20 Apr 2023 07:46:22 -0700 (PDT)
X-Received: by 2002:a0d:c8c3:0:b0:54f:bb39:792b with SMTP id
 k186-20020a0dc8c3000000b0054fbb39792bmr896173ywd.26.1682001982220; Thu, 20
 Apr 2023 07:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com> <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 16:46:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
Message-ID: <CAMuHMdVTR8-yDfX24V-_+fR-i4pv8XH9fhDinRok1MAp+80psw@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/V2L DU bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

On Tue, Apr 11, 2023 at 2:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
> SoC and therefore use RZ/G2L fallback to avoid any driver changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -16,8 +16,13 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - renesas,r9a07g044-du # RZ/G2{L,LC}
> +    oneOf:
> +      - enum:
> +          - renesas,r9a07g044-du # RZ/G2{L,LC}
> +      - items:
> +          - enum:
> +              - renesas,r9a07g054-vsp2    # RZ/V2L
> +          - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback

"*-vsp2", really? ;-)

And with s/vsp2/du/, it doesn't match patch 6/8, where you use
"renesas,r9a07g054-du" without the fallback.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
