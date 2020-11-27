Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9072C6C86
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 21:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgK0UW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 15:22:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730640AbgK0UV4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 15:21:56 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CB3F21D7A;
        Fri, 27 Nov 2020 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606508354;
        bh=o3RTkjTyHvzrrCB4moRhD+SXP7lFjO4qLgZ4zpDkqEw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E1/Cvts2AleC6juqrgkFNASwChKaHV22sMpl7ga1RdwHhzr9Sxg1//qQRacMN5vTr
         09SVpnPFbjA+/qQ+ocmDj0MCwXooOtNQMD0BH/9XJDSb0vcG51kZhsT47CJZAJVzyK
         cOG8kTYQMOco+n84s865MMiBAncUY4edGYJUV4ls=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201125141505.GA77733@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org> <20201115170950.304460-2-krzk@kernel.org> <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com> <20201118074812.GA5803@kozik-lap> <160626309137.2717324.9318376048083763040@swboyd.mtv.corp.google.com> <20201125141505.GA77733@kozik-lap>
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
Date:   Fri, 27 Nov 2020 12:19:12 -0800
Message-ID: <160650835295.2717324.6223337132204167294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-25 06:15:05)
> On Tue, Nov 24, 2020 at 04:11:31PM -0800, Stephen Boyd wrote:
> >=20
> > Ok so this patch isn't necessary then?
>=20
> For this particular build failure - it is not necessary anymore.
>=20
> However there might more of such errors - just not discovered yet. Also,
> the clock bulk API has such ifdefs so it kind of symmetrical and
> consistent approach.
>=20

Ok. Patches always welcome.
