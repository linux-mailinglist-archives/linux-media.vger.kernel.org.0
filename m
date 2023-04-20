Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723C46E97FA
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 17:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234162AbjDTPFX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 20 Apr 2023 11:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbjDTPFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 11:05:21 -0400
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656824C2B;
        Thu, 20 Apr 2023 08:05:20 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id bz21so3095998ljb.11;
        Thu, 20 Apr 2023 08:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682003118; x=1684595118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjATNR9xN0TX4Afa/FkjvELVtb7InkL6+l1hWMyUq0g=;
        b=fAq935yICpqrS6jDC1E70+yL0+BmY2H3CIZnvJvtlu9q4rL8T1FvzzD+mXcuADClbD
         xGRpepubspPTwC98atYcyHnGVSaeSaIzC+y1P7UQEWSsrnkQ+s2i/U5iC1VcJXN3PXtH
         vkng/gVwSt/NknS6Ptbxvt998vhPc3fXkILTV2IAb+DUR2hnufs3m0UDMaVz6eQZy0Z0
         rqG+FyvESyK51RFSE5FFcaRXHVLkv7zgCwYkgFmauqtJFU8GXsNyQI4664hqivAKLP5L
         CVWEWw8iyOenXRBGhUAu5xuiGelsiMJd+ThJG3s90XgvuIubeennsdu4JMhBJBKflwjp
         9RYw==
X-Gm-Message-State: AAQBX9dz5QwIVYksiDmeGSOTFE5qrBG1mfbu5VGbzK3cuLjBsU1jbE9v
        kwj1uGYqm4uoJnFBSHKHE8exytZEMDDSvde8
X-Google-Smtp-Source: AKy350ZosUFxFu/czTLm6Sg1KVq/Xxzqi8n05Tja5cNiAkPG/og5OimOTxWkdyzgDZwp/U3vOO8stg==
X-Received: by 2002:a05:651c:201e:b0:2a8:e765:16e5 with SMTP id s30-20020a05651c201e00b002a8e76516e5mr1747727ljo.25.1682003118087;
        Thu, 20 Apr 2023 08:05:18 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id g15-20020a2e938f000000b002a8aadcf15bsm269363ljh.120.2023.04.20.08.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:05:14 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2a8b082d6feso5721981fa.2;
        Thu, 20 Apr 2023 08:05:14 -0700 (PDT)
X-Received: by 2002:a19:700a:0:b0:4e9:d8ba:169 with SMTP id
 h10-20020a19700a000000b004e9d8ba0169mr496300lfc.1.1682003114061; Thu, 20 Apr
 2023 08:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com> <20230411120810.368437-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 17:04:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
Message-ID: <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] arm64: dts: renesas: r9a07g054: Add DU node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Tue, Apr 11, 2023 at 2:12 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DU node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -677,6 +677,20 @@ fcpvd: fcp@10880000 {
>                         resets = <&cpg R9A07G054_LCDC_RESET_N>;
>                 };
>
> +               du: display@10890000 {
> +                       compatible = "renesas,r9a07g054-du";

I think you have to make your mind up about using a fallback compatible
value or not. As the VSP has one, I think the DU should have one, too.

> +                       reg = <0 0x10890000 0 0x10000>;
> +                       interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A07G054_LCDC_CLK_A>,
> +                                <&cpg CPG_MOD R9A07G054_LCDC_CLK_P>,
> +                                <&cpg CPG_MOD R9A07G054_LCDC_CLK_D>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg R9A07G054_LCDC_RESET_N>;
> +                       renesas,vsps = <&vspd 0>;
> +                       status = "disabled";
> +               };
> +
>                 cpg: clock-controller@11010000 {
>                         compatible = "renesas,r9a07g054-cpg";
>                         reg = <0 0x11010000 0 0x10000>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
