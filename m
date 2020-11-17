Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A49D2B5A5B
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 08:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgKQHht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 02:37:49 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40552 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgKQHhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 02:37:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id a3so2252983wmb.5;
        Mon, 16 Nov 2020 23:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=18xGlNNpDhvVYVdS8rF0z2fNATOQumPp5b7l5cZcXvw=;
        b=CSNmmPC7k6ZZOHklso9+ocCSYl0FCaFqkP3EFEnfNpIPkoqZw2ltXaAg3mVcNgAEnU
         TPTmEdR2btv2XIW6Fkk6Ms+UMSlEFoTf1ZAahGUhnzew09XIPQkLUAt4rfYFBjb8p7Ys
         aE45GumT3HngdvhYE/Yq8PRnA4CRTsx10o/ej7065Bp9MlsI6QNEe5XM9AZYJ8sPpj/S
         LFxyCz3H1nKovjQ8+L9Ohg8GiWfeUzgje/yXLYmZhbzxJdbQa1XndxNCJN307l2hwEwJ
         1Pyfy0qZm7OimuoW2lP+6dY0RKWbpZltQQjO3h+WK1Wy0cyq91ZcJUoucRKhudHQU8Yt
         7zyA==
X-Gm-Message-State: AOAM533iXoLvPf1T8zdP1/h0LyBBn2ftN4rJj9Ft+MeeK+XWkPDjQFVm
        UWVdbsCnHMBau3oqMNdQdtk=
X-Google-Smtp-Source: ABdhPJyHbqmcdYgBsSt4If51dziBJ4uOp+0GJRgB5sF5O5WZ7vgFMBLSfMpTds+fFwooZbU/Vhir4w==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr2234501wmi.48.1605598666215;
        Mon, 16 Nov 2020 23:37:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t23sm2151117wmn.4.2020.11.16.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 23:37:44 -0800 (PST)
Date:   Tue, 17 Nov 2020 08:37:43 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
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
Subject: Re: [RFC 2/3] ARM: sunxi: do not select COMMON_CLK to fix builds
Message-ID: <20201117073743.GB3436@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-3-krzk@kernel.org>
 <f637762e-0b02-1705-ea6b-24ac338fcd69@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f637762e-0b02-1705-ea6b-24ac338fcd69@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 10:36:12PM -0600, Samuel Holland wrote:
> On 11/15/20 11:09 AM, Krzysztof Kozlowski wrote:
> > COMMON_CLK is a user-selectable option with its own dependencies.  The
> > most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
> > should not select COMMON_CLK because they will create a dependency cycle
> > and build failures.  For example on MIPS a configuration with COMMON_CLK
> > (selected by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (selected by
> > SOC_RT305X) is possible:
> 
> Ah, that makes sense.
> 
> > 
> >   WARNING: unmet direct dependencies detected for COMMON_CLK
> >     Depends on [n]: !HAVE_LEGACY_CLK [=y]
> >     Selected by [y]:
> >     - SND_SUN8I_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
> >       (ARCH_SUNXI || COMPILE_TEST [=y]) && OF [=y] && (MACH_SUN8I || ARM64 && ARCH_SUNXI || COMPILE_TEST [=y])
> > 
> >     /usr/bin/mips-linux-gnu-ld: drivers/clk/clk.o: in function `clk_set_rate':
> >     (.text+0xaeb4): multiple definition of `clk_set_rate'; arch/mips/ralink/clk.o:(.text+0x88): first defined here
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/mach-sunxi/Kconfig | 1 +
> >  sound/soc/sunxi/Kconfig     | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index eeadb1a4dcfe..4d9f9b6d329d 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -4,6 +4,7 @@ menuconfig ARCH_SUNXI
> >  	depends on ARCH_MULTI_V5 || ARCH_MULTI_V7
> >  	select ARCH_HAS_RESET_CONTROLLER
> >  	select CLKSRC_MMIO
> > +	select COMMON_CLK
> 
> This is not necessary, since ARCH_SUNXI depends (through ARCH_MULTI_V{5,7}) on
> ARCH_MULTIPLATFORM, which selects COMMON_CLK already.

Thanks. I'll send a v2 with changes and your review.

Best regards,
Krzysztof
