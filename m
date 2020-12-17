Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305BD2DCFB4
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 11:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgLQKrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 05:47:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:58076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgLQKrQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 05:47:16 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608201995;
        bh=Pue5gigex8jLd7iX7Y19MlVXPLtenFipsfqR9Dz+YM4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QtT1U6O0JVdEkWREGobtHZUPwRol1SATKWy0EPGBHuEaXkxfISISnMSKYD9wskfIE
         EVacZcGpuh+mZ+qWqMGlF+rdda8qETP2qmPLQyckTG4lDsYv5Y08lpwxZBB3WLQ+Ui
         /WeTNXF/5BVMSkINYM0MRupJLYrXJ+1cK4Bpq2c+20VhSnwJchvrFM2KPJo3M2ilaE
         /KtNSSTowXM59VW1/wQEQrYfxnSvveRplsgVnYuDilLtC9Ke+M76p9gEH8Wisc1His
         oM+Kmj7zYb3P8XCVqFfB6uHP6Ww8WuLIE6Uu9T5pM7J9bq0/bzqq2b4bSLSEdSrIEc
         e4ki9Pt2LUnmA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com> <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com> <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com> <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>
Date:   Thu, 17 Dec 2020 02:46:33 -0800
Message-ID: <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
> Hi Joel,
>=20
> On 12/7/2020 6:39 PM, Joel Stanley wrote:
> > On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com=
> wrote:
> >>
> >> Video engine uses eclk and vclk for its clock sources and its reset
> >> control is coupled with eclk so the current clock enabling sequence wo=
rks
> >> like below.
> >>
> >>   Enable eclk
> >>   De-assert Video Engine reset
> >>   10ms delay
> >>   Enable vclk
> >=20
> > This is the case after " clk: ast2600: fix reset settings for eclk and
> > vclk" is applied, correct? Without that patch applied the reset
> > sequence is correct by accident for the 2600, but it will be wrong for
> > the 2500?
>=20
> Correct. Video Engine reset was coupled with eclk for AST2500 and vclk
> for AST2600 so above sequence was observed only in AST2500. As you said,
> AST2600 didn't make the issue by accident but the clk/reset pair should
> be fixed by this patch series.

So should the two patches be squashed together and go through the
media tree?
