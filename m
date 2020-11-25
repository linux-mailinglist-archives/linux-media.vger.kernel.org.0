Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA572C41F2
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 15:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbgKYOPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 09:15:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54942 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbgKYOPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 09:15:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id d142so2138342wmd.4;
        Wed, 25 Nov 2020 06:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OTNWqTeUqmzJkpC9NOCmUX8GBH/nXgfg9fJE4Ofwcd8=;
        b=ioIYKINznM20kqTrcg+bzV634GLL7OpWvqlcV7NfmmGptW67PmEXUotW1MDInd5ny9
         igXUD5nsV4oBFXtsJ12rMCjN2VdAZjOr4Jh/Ko+IU7o7sR93+YOhGonsxA0Mwu6upwEX
         P8qI1O3EWyjJ7TfZfZuivXmYUf6X+yPVFeRZvsoEBPwh00+JaOvilhhxHnMY5xWxGiLk
         Udiafd+8Mq6X6DBIFdR2MT2SrTh+vLibQ0DZOgfQ2QTy1RYtPo4WgetERqRe9qsUX+QE
         PoH6KPHlOqk5NqvU9e5sIAhdLve4qRftFbF6jtWeRZgQpRwOmuwsULE08R+eRPoQY8NF
         m+uw==
X-Gm-Message-State: AOAM532oHVVkMZuqiASPOPeUXnjCGgrdS/eLgQ+C1xDIk+mTVbPMflHg
        JfTWHE6UfGJKyssvyBQp6RI=
X-Google-Smtp-Source: ABdhPJyvfqQ/sP05uKPapIZjZ8P1LI64iv1xcYxdq5+nC6S8RSDBQOEhxRq+85Dg1vPAhjljyRi0tQ==
X-Received: by 2002:a1c:2008:: with SMTP id g8mr4101230wmg.19.1606313708219;
        Wed, 25 Nov 2020 06:15:08 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c2sm5411796wrf.68.2020.11.25.06.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 06:15:07 -0800 (PST)
Date:   Wed, 25 Nov 2020 15:15:05 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with
 HAVE_LEGACY_CLK
Message-ID: <20201125141505.GA77733@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-2-krzk@kernel.org>
 <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
 <20201118074812.GA5803@kozik-lap>
 <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 24, 2020 at 04:11:31PM -0800, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-11-17 23:48:12)
> > On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> > > Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > > > COMMON_CLK even though is a user-selectable symbol, is still selected by
> > > > multiple other config options.  COMMON_CLK should not be used when
> > > > legacy clocks are provided by architecture, so it correctly depends on
> > > > !HAVE_LEGACY_CLK.
> > > > 
> > > > However it is possible to create a config which selects both COMMON_CLK
> > > > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to
> > > 
> > > Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> > > SOC_RT305X selecting HAVE_LEGACY_CLK?
> > 
> > The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
> > it).
> > 
> > The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
> > platform, not converted to Common clock frm. Few clock operations are
> > defined in: arch/mips/ralink/clk.c
> > 
> 
> Ok so this patch isn't necessary then?

For this particular build failure - it is not necessary anymore.

However there might more of such errors - just not discovered yet. Also,
the clock bulk API has such ifdefs so it kind of symmetrical and
consistent approach.

> It seems OK to select
> HAVE_LEGACY_CLK but not to select COMMON_CLK unless it's architecture
> code that can't be enabled when the other architecture code is selecting
> HAVE_LEGACY_CLK.

Best regards,
Krzysztof

