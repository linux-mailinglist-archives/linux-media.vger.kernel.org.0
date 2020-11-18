Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C5A2B7715
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 08:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgKRHmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 02:42:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:59582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgKRHl7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 02:41:59 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0D9024656;
        Wed, 18 Nov 2020 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605685319;
        bh=Q4jpEyGuwcCkj+Ak7YzDr/tG7X4Egxkvlz1mTnJ8TFQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SJw9vTE3zE3+IwA5FcC/Gc6ap8q20Ark7HFMfCaI5bNbYMRiKF22QEP6+MbTSf3O0
         r6AiVfmnmNBDYarTXPNBwtt/cWi014DbhBMfe/hl4x2BF1z3k8/NOFFONf6DX1cwuz
         bHhMD0xiWDmO++3Zu1g+bi4C9NqpSm06ozKIB+SQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201115170950.304460-2-krzk@kernel.org>
References: <20201115170950.304460-1-krzk@kernel.org> <20201115170950.304460-2-krzk@kernel.org>
Subject: Re: [PATCH 1/3] clk: fix redefinition of clk_prepare on MIPS with HAVE_LEGACY_CLK
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
To:     Chen-Yu Tsai <wens@csie.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Date:   Tue, 17 Nov 2020 23:41:57 -0800
Message-ID: <160568531746.60232.15496517544781609246@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-11-15 09:09:48)
> COMMON_CLK even though is a user-selectable symbol, is still selected by
> multiple other config options.  COMMON_CLK should not be used when
> legacy clocks are provided by architecture, so it correctly depends on
> !HAVE_LEGACY_CLK.
>=20
> However it is possible to create a config which selects both COMMON_CLK
> (by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (by SOC_RT305X) which leads to

Why is SND_SUN8I_CODEC selecting COMMON_CLK? Or really, why is
SOC_RT305X selecting HAVE_LEGACY_CLK?
