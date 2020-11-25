Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A648B2C3542
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 01:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgKYALd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 19:11:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:54106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726923AbgKYALd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 19:11:33 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEB98206E5;
        Wed, 25 Nov 2020 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606263092;
        bh=a+Rxij4TwnjUBiotOv+s4sSAjtCT1yAbFvk3KFgRQwk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CosENmDfkL+cgj7WPvYKqODfrjuLGx+KPZj+0j8+V7h280NLtz0dsqvjUjlqRfisC
         CtpwmD0iFNR5eb13g7D2wt38jkTBeDEH9o1PWdzcShDtfiwIPVqeLN3ax7sAKCHCJR
         eywKE8709HAMCLI7VcABX1ifaSVPNXJtCGRa/nAE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201118074812.GA5803@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org> <20201115170950.304460-2-krzk@kernel.org> <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com> <20201118074812.GA5803@kozik-lap>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with HAVE_LEGACY_CLK
From:   Stephen Boyd <sboyd@kernel.org>
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
To:     Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 24 Nov 2020 16:11:31 -0800
Message-ID: <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-17 23:48:12)
> On Tue, Nov 17, 2020 at 11:41:57PM -0800, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> > > COMMON_CLK even though is a user-selectable symbol, is still selected=
 by
> > > multiple other config options.  COMMON_CLK should not be used when
> > > legacy clocks are provided by architecture, so it correctly depends on
> > > !HAVE_LEGACY_CLK.
> > >=20
> > > However it is possible to create a config which selects both COMMON_C=
LK
> > > (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads =
to
> >=20
> > Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
> > SOC_RT305X selecting HAVE_LEGACY_CLK?
>=20
> The SND_SUN8I_CODEC I fixed in following patch (I sent separately v2 of
> it).
>=20
> The SOC_RT305X select HAVE_LEGACY_CLK? because it is an old, Ralink
> platform, not converted to Common clock frm. Few clock operations are
> defined in: arch/mips/ralink/clk.c
>=20

Ok so this patch isn't necessary then? It seems OK to select
HAVE_LEGACY_CLK but not to select COMMON_CLK unless it's architecture
code that can't be enabled when the other architecture code is selecting
HAVE_LEGACY_CLK.
