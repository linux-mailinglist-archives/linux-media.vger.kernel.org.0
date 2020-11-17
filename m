Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2465B2B58EE
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 05:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgKQEp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 23:45:58 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44097 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726274AbgKQEp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 23:45:58 -0500
X-Greylist: delayed 580 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Nov 2020 23:45:57 EST
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 13E9C12DF;
        Mon, 16 Nov 2020 23:36:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 16 Nov 2020 23:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
        kszPB7jeuJ2s0wgF4vEobMXp32NtsKINiE+dXw3VWA=; b=faQ040BYeumwKBqS6
        VAgIb8XEx/yt88bgcSSTyuSgg1Q5pyEZmTnJEbTiC4s4pePmK1u+vJH3bKt5aZxf
        XW3VZ9Pb64FCp5XALSrSSy64yoR3ZJoi8/e3ZFmnBawHo6fSIKeki5mAud8PKC/w
        Ii+6Sky1WOR9vNl3CcZjrX/gcd3g6Zv/DSMcxYwzDZPYRqq13lo0yuH4Ly7db1Vd
        bkqjPkR2/Qq0uMk/zQktEidmdrJ8bNf8SQqlHcQdkSVoVHe5p5tVYGaVpJtGGwV8
        H8e9QWoWiLC+647XqQo/FMGZuh9TPoWZpqBdFarSKUH+MgQ0WisQIsZNi/7rE9xN
        /LQcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=pkszPB7jeuJ2s0wgF4vEobMXp32NtsKINiE+dXw3V
        WA=; b=mEqfsoGrOXn64UpvVznr0IwaETGuAhL2+cFv1OI8DwzMW77ixhdVGpdMN
        vbbjCqXHZI3ftX7YRTEXh4j9tdX6C2d3qBB1zMZcD+4stis12XSzEK+oa9jTReMM
        rObIAu9/GoMkhtlplDQ3gKrQoKHvBbAOTBm1ab5RFY5z5lOSCHBxRuhasVcflOZt
        USPLpZHetF27YtYyyqVLoxcIJdRPioe09ZHdFK+XaYf5liRbwES3Xvik6OPsfVWu
        EAUS8qwBnOsI4OtnPnaIBj9N4xH0Br5cMpME7Jyge/JWsJQMZfhczsVXnKibxoyX
        UCfxT/7H5dcnMZSEvmMvLaCgPwkMQ==
X-ME-Sender: <xms:PVOzXz6kXgyWcKgQjxAevdVgKQpWBF6dhptuhu2_khtd-9N8T8jUPg>
    <xme:PVOzX46--cBuRWjUkte98zmS-9qkfNnEabFIoXDk2U_SX_NmSxLTsxU0a-pJoWhU4
    XkzGqvpATX-3Vj_kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfevffetleehffejueekvdekvdeitdehveegfeekheeuieeiueet
    uefgtedtgeegnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:PVOzX6cO0lFlBJXntTv3tGcR9iQZWWG7530idRXzM3N7fUF8-acCLA>
    <xmx:PVOzX0KzcSio2QdVCCWApNH4gdajMeu7Z_TXHSOdkGDVJICDxBAJ7Q>
    <xmx:PVOzX3Jjkhi5yiNbY5W4mRVc8Mq5jjB2y49yIGB24iXBZSUvduwC3A>
    <xmx:P1OzXw6oI-JF_KyUNvkPBU0U7NPkZyzfoH3N--HMfZKlzYlSRjYYUg9gSSc>
Received: from [192.168.50.169] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id D73E13280060;
        Mon, 16 Nov 2020 23:36:12 -0500 (EST)
Subject: Re: [RFC 2/3] ARM: sunxi: do not select COMMON_CLK to fix builds
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-3-krzk@kernel.org>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <f637762e-0b02-1705-ea6b-24ac338fcd69@sholland.org>
Date:   Mon, 16 Nov 2020 22:36:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201115170950.304460-3-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/15/20 11:09 AM, Krzysztof Kozlowski wrote:
> COMMON_CLK is a user-selectable option with its own dependencies.  The
> most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
> should not select COMMON_CLK because they will create a dependency cycle
> and build failures.  For example on MIPS a configuration with COMMON_CLK
> (selected by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (selected by
> SOC_RT305X) is possible:

Ah, that makes sense.

> 
>   WARNING: unmet direct dependencies detected for COMMON_CLK
>     Depends on [n]: !HAVE_LEGACY_CLK [=y]
>     Selected by [y]:
>     - SND_SUN8I_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
>       (ARCH_SUNXI || COMPILE_TEST [=y]) && OF [=y] && (MACH_SUN8I || ARM64 && ARCH_SUNXI || COMPILE_TEST [=y])
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/clk/clk.o: in function `clk_set_rate':
>     (.text+0xaeb4): multiple definition of `clk_set_rate'; arch/mips/ralink/clk.o:(.text+0x88): first defined here
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-sunxi/Kconfig | 1 +
>  sound/soc/sunxi/Kconfig     | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index eeadb1a4dcfe..4d9f9b6d329d 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -4,6 +4,7 @@ menuconfig ARCH_SUNXI
>  	depends on ARCH_MULTI_V5 || ARCH_MULTI_V7
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CLKSRC_MMIO
> +	select COMMON_CLK

This is not necessary, since ARCH_SUNXI depends (through ARCH_MULTI_V{5,7}) on
ARCH_MULTIPLATFORM, which selects COMMON_CLK already.

>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB
>  	select PINCTRL
> diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
> index 69b9d8515335..ddcaaa98d3cb 100644
> --- a/sound/soc/sunxi/Kconfig
> +++ b/sound/soc/sunxi/Kconfig
> @@ -14,7 +14,7 @@ config SND_SUN8I_CODEC
>  	tristate "Allwinner SUN8I audio codec"
>  	depends on OF
>  	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
> -	select COMMON_CLK
> +	depends on COMMON_CLK
>  	select REGMAP_MMIO
>  	help
>  	  This option enables the digital part of the internal audio codec for
> 

For this file:
Reviewed-by: Samuel Holland <samuel@sholland.org>

Thanks,
Samuel
