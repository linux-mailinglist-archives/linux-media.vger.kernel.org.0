Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A84314996
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 08:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhBIHhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 02:37:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:36206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhBIHhY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 02:37:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3B6B64E0D;
        Tue,  9 Feb 2021 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856200;
        bh=G769Yqc/eLFiJYEOdppz3f+n4p9N+1dJg7vbaQQq4FU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lU4BPzzM/9NcH7NqTOMW3e/IApzKmdZ02tzOGIe/2x1fpMhu4j/jnlQNqUf7kJGR0
         2Wnraxd9PvnaIDP1QAJbnlk2TGcjpqFfwbiXNp/MhQEGIZVOeE4VXFRNrHxgsw0YC0
         oFYLgq3aLKndtsqANVATSfmVp+A0TuDIG4p1iiwPlwMz2CmNFQyh2mKmii+XOOPFEn
         0Ps0lemoICpvi3qXd+ACa/e6Fa/Aedugqos+nvkZVXO4Tv8Lm/w0tTv0qjn8jNL+i5
         8vuu0D9vf4n2d72yDiq0ApXXh3DMpBja87kCl6mLBVxf6xykUR4ioKt8N3qYnZf3Bd
         lQidkcVGPmKPA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201221223225.14723-2-jae.hyun.yoo@linux.intel.com>
References: <20201221223225.14723-1-jae.hyun.yoo@linux.intel.com> <20201221223225.14723-2-jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 1/1] media: aspeed: fix clock handling logic
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 08 Feb 2021 23:36:39 -0800
Message-ID: <161285619930.76967.620222959363595605@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jae Hyun Yoo (2020-12-21 14:32:25)
> Video engine uses eclk and vclk for its clock sources and its reset
> control is coupled with eclk so the current clock enabling sequence works
> like below.
>=20
>  Enable eclk
>  De-assert Video Engine reset
>  10ms delay
>  Enable vclk
>=20
> It introduces improper reset on the Video Engine hardware and eventually
> the hardware generates unexpected DMA memory transfers that can corrupt
> memory region in random and sporadic patterns. This issue is observed
> very rarely on some specific AST2500 SoCs but it causes a critical
> kernel panic with making a various shape of signature so it's extremely
> hard to debug. Moreover, the issue is observed even when the video
> engine is not actively used because udevd turns on the video engine
> hardware for a short time to make a query in every boot.
>=20
> To fix this issue, this commit changes the clock handling logic to make
> the reset de-assertion triggered after enabling both eclk and vclk. Also,
> it adds clk_unprepare call for a case when probe fails.
>=20
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>=20
> clk: ast2600: fix reset settings for eclk and vclk
>=20
> Video engine reset setting should be coupled with eclk to match it
> with the setting for previous Aspeed SoCs which is defined in
> clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
> driver. Also, reset bit 6 is defined as 'Video Engine' reset in
> datasheet so it should be de-asserted when eclk is enabled. This
> commit fixes the setting.
>=20
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
