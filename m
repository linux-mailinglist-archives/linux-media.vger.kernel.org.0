Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AC728DD4E
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 11:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgJNJXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 05:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731212AbgJNJWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 05:22:43 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB1EC0613B1;
        Tue, 13 Oct 2020 14:52:24 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id h9so927122ybm.4;
        Tue, 13 Oct 2020 14:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHSVzGrwxPY+5umbvS7UQaRkw2SUc5XjmhTscxoVxXY=;
        b=AysTXKjxOkM69AqLCDBsnLHnTxWtFbL79XrhZ0Mz/aJPLK2Lsa6Ojh+WgjbKVyhiCc
         qkM933Ne+RZu6OYJHQO5+xMBVXB8jRn/B+tdU9glVOKqDC8suXpCs3WcYFhcXZu2m5JQ
         ZyXtaytSacEdMxuNHdpXJEdEN70O1own5Ay9cGmcG/trjYqybP5lTma3ZWnBCpF0+iaS
         FlDB/4ISCR1au7kHRQoUrS7WNVvvUIbO2NxavrWuYkVzSjYIFI4+P/5PDgVedkd2mLJp
         pudO02MqxDIU7HQJGjow9Sm0mNB5ZGY5n3UqU5+voQ1008oH3LSzBmP8XDsBwOfl4CeQ
         7i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHSVzGrwxPY+5umbvS7UQaRkw2SUc5XjmhTscxoVxXY=;
        b=WmtcHty+L6Es+w2tFl1omMkZNKIckbBXMtaaAOkECVd3xzJee2c1KSQSAi55WUCwzx
         oxo9Svjc2l1KQu+NahbShhDqQ4/+BxoKDUncsVE7UEBDFPNl0NK910T7u6kpMbKRcPlw
         sDqUiRST5Y0eEu16e/cBLdBKNGMjhmrvBBV7lI30kHZgP6ujQgJmCcSKPUxMKpCuKTAg
         xntv7oRBASpGVjg84zCStZLz7HyWvOYlXwHLtX/Io9K6vb8HgFV9I39EBpj9mRcYzDyC
         vsTot4GrS2zy1OilMdhNIpBCY12En+ewuUkYGfA5LxtrZEbG1Jvff62eXRbKWsGAQiD5
         0FSA==
X-Gm-Message-State: AOAM532k6eegg1zJu6ERAuXsSRNe7ElLxDGu6D0LNeOYxPbzMs4hAx0r
        2AtFyxvj1YlJY4I3V4i6Q9YzD/B5JYfIKCPiD9w=
X-Google-Smtp-Source: ABdhPJx1PTzq4G5Zx99mkZN/dFLb5s+w/lzDHXyoJVjnP6bBn5APRDjororfZanWzi0TglZPZWHQ2X1fKtDkdXLvWpM=
X-Received: by 2002:a25:8246:: with SMTP id d6mr2814998ybn.25.1602625943672;
 Tue, 13 Oct 2020 14:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com> <20201013150150.14801-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201013150150.14801-6-fabrizio.castro.jz@renesas.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 13 Oct 2020 22:51:57 +0100
Message-ID: <CA+V-a8uEnQOmJK0zxOe60EX-G-f-0V756U43myZVJDVf0eQb9Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: r8a77965: Add DRIF support
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Oct 13, 2020 at 6:25 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Add the DRIF controller nodes for r8a77965 (a.k.a. R-Car M3-N).
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v2->v3:
> * New patch
>
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 120 ++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index fe4dc12e2bdf..c5a54dc7ede2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -1550,6 +1550,126 @@ vin7csi40: endpoint@2 {
>                         };
>                 };
>
> +               drif00: rif@e6f40000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f40000 0 0x84>;
> +                       interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 515>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 515>;
> +                       renesas,bonding = <&drif01>;
> +                       status = "disabled";
> +               };
> +
> +               drif01: rif@e6f50000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f50000 0 0x84>;
> +                       interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 514>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 514>;
> +                       renesas,bonding = <&drif00>;
> +                       status = "disabled";
> +               };
> +
> +               drif10: rif@e6f60000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f60000 0 0x84>;
> +                       interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 513>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x24>, <&dmac2 0x24>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 513>;
> +                       renesas,bonding = <&drif11>;
> +                       status = "disabled";
> +               };
> +
> +               drif11: rif@e6f70000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f70000 0 0x84>;
> +                       interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 512>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x26>, <&dmac2 0x26>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 512>;
> +                       renesas,bonding = <&drif10>;
> +                       status = "disabled";
> +               };
> +
> +               drif20: rif@e6f80000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f80000 0 0x84>;
> +                       interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 511>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x28>, <&dmac2 0x28>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 511>;
> +                       renesas,bonding = <&drif21>;
> +                       status = "disabled";
> +               };
> +
> +               drif21: rif@e6f90000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6f90000 0 0x84>;
> +                       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 510>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x2a>, <&dmac2 0x2a>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 510>;
> +                       renesas,bonding = <&drif20>;
> +                       status = "disabled";
> +               };
> +
> +               drif30: rif@e6fa0000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6fa0000 0 0x84>;
> +                       interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 509>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x2c>, <&dmac2 0x2c>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 509>;
> +                       renesas,bonding = <&drif31>;
> +                       status = "disabled";
> +               };
> +
> +               drif31: rif@e6fb0000 {
> +                       compatible = "renesas,r8a77965-drif",
> +                                    "renesas,rcar-gen3-drif";
> +                       reg = <0 0xe6fb0000 0 0x84>;
> +                       interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 508>;
> +                       clock-names = "fck";
> +                       dmas = <&dmac1 0x2e>, <&dmac2 0x2e>;
> +                       dma-names = "rx", "rx";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 508>;
> +                       renesas,bonding = <&drif30>;
> +                       status = "disabled";
> +               };
> +
>                 rcar_sound: sound@ec500000 {
>                         /*
>                          * #sound-dai-cells is required
> --
> 2.25.1
>
