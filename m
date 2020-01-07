Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 688DF131E04
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 04:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbgAGDeu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 22:34:50 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45644 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGDet (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 22:34:49 -0500
Received: by mail-qk1-f193.google.com with SMTP id x1so41454875qkl.12;
        Mon, 06 Jan 2020 19:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ndz92OQlth4qYpDlhrpQ+U0RT8dpiuuzWnP0LR0lmf0=;
        b=O/vFmAKAucz5ybhp+Bbqjm5p5I9Fe5AIpf0Hl18CR3AY6xSOcSJvLMD6wq8rkSHQ7b
         xed+biueya7POybp+amzJ4WOZnWNcpenUWBOqlotsF67/UWF1DS8AEDxEVY+56sqrnus
         GQM3/VoFDoypI5Uc4HL9dtQRRTDML9q40FK90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ndz92OQlth4qYpDlhrpQ+U0RT8dpiuuzWnP0LR0lmf0=;
        b=nbOgoaJ5e8AkDSxbYT6oYh70i/RLNAMypWLM4+L2gIHE4DV6zfIwEWNTluoc8s2Q2G
         2dL8X7G/QrK8fQ6zwEGtrfwjc+/jKqmdzefASiWyuYqhPLREFw3aRDg+rvZssIU6I/Mu
         ++oIsTwe5Z9QJu5rUC9neuVMIQkgHbGVpkMBaPQGtyELWTSQFB4T/uo+8xgE3PtTuMeq
         e1mPRxT24xg0jP/IgRPvmws7VL5zgweKY3VjkqcddfbHUa3ymBbOjdx6+aNIhXLnE0EA
         Q+IEQlBfoOdpI+jjl82ppT/c1An5ZF6CtnaZMcgSv8j1IX0/8t0TNog95d4S+qaO2SBt
         Rm/A==
X-Gm-Message-State: APjAAAVNABpYNQTB7HiHxqHptoS6bmDQ2qWZhuDeAVZf3LuF75VyWKnD
        iqE8Yq02gJFdtT5/twtfroHLAJNt6r8hJcy4L3w=
X-Google-Smtp-Source: APXvYqzG/yQj/It0Jak2RSDO0tveY9cMF2amzU1CBpByHehdAai9VEIKQ7Wsyj3hkRaiStx+jL8x9EHSqJJheOTg+uU=
X-Received: by 2002:a37:68d5:: with SMTP id d204mr86063740qkc.171.1578368088761;
 Mon, 06 Jan 2020 19:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com> <20200107011503.17435-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-2-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 Jan 2020 03:34:37 +0000
Message-ID: <CACPK8XcEVBp6hQ=97ZVM6a_y77PAhLZZsV104FDwTCsZm7JWDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: aspeed-g6: Add Video Engine node
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> The AST2600 has Video Engine so add it.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>

I will merge this through the aspeed tree for 5.6.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5f6142d99eeb..89833987e270 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -297,6 +297,16 @@
>                                 quality = <100>;
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2600-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio0: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> --
> 2.17.1
>
