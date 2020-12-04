Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0BE2CF0EB
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 16:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgLDPmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 10:42:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727153AbgLDPmd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 10:42:33 -0500
X-Gm-Message-State: AOAM530YkqfRFnrf2VKKdb5wN0pGOlq4VRm9iNcmKvMW1CZbc+D+jKyp
        tckSHS4YpukFVhp09QICKi9J6d5Mukp39vLTePs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607096512;
        bh=9zvhmddp4oVetTxnivsCkI0/R9z67GT3zT8WlaXkVs8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a+GDm5Ix/7H3gCi4tvga6Vr9YSjg1xp0CFWgcMFbdS+3hNVP7u1M35vanHsQUrfPl
         6VisB/C/Vt33UndIVZQqONq9DzZvH4INxBoB0v5yrAnTm5v9LogyOLmdOX4epoWTx7
         p+4qd8B5aYqqly1/iTDA5VZ58t21AjjljAgc1LSZ7d5KbkXfHAT8bvgY5xQBNGbUnq
         /BHFSr5d1xiky5jrkWFT690m8Ahs974G3k8pJtyhrIcVUHUBlf9hAQc2NXaPnmenfm
         hz5NG/Cgvnfiop6ZsUTWS9LYi/zw5wL2pxfiVgGXvra0uNUMk0g3EitUBKkny14yp6
         B3izfRuX6w7Pw==
X-Google-Smtp-Source: ABdhPJySpja6tqIbIN2DGQqo9ynqKJIG4D3U0MvhUPnJ5m4MPZB05rBkBQoYbrY5EW3BYzhdurB9LEF3TWFIfftVCpY=
X-Received: by 2002:aca:cf0a:: with SMTP id f10mr3443981oig.11.1607096511900;
 Fri, 04 Dec 2020 07:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20201203231505.1483971-1-arnd@kernel.org> <CAPBb6MUNsoQ76hi618G6i0djBoRzVvYKkTd8PovNQRacZ06LWA@mail.gmail.com>
In-Reply-To: <CAPBb6MUNsoQ76hi618G6i0djBoRzVvYKkTd8PovNQRacZ06LWA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 4 Dec 2020 16:41:35 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3e+22WiJuV6APJ+vRZjPsbZw+=recE2dje_gjtfQ3gWA@mail.gmail.com>
Message-ID: <CAK8P3a3e+22WiJuV6APJ+vRZjPsbZw+=recE2dje_gjtfQ3gWA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: add remoteproc dependency
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 9:26 AM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> On Fri, Dec 4, 2020 at 8:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The SCP firmware can only be built if CONFIG_REMOTEPROC is
> > enabled:
> >
> > WARNING: unmet direct dependencies detected for MTK_SCP
> >   Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
> >   Selected by [y]:
> >   - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
>
> Despite setting these same options I cannot reproduce this warning on
> a merge of master + media. Which tree are you using?

Sorry about the noise. I was testing this on earlier this week on v5.10-rc5,
but your commit 2da185d6fe96 ("media: mtk-vcodec: fix build breakage
when one of VPU or SCP is enabled") has made it into mainline in the
meantime and fixed the issue.

I had rebased my patches onto linux-next before sending them out to
make sure everything still works, but did not check that it was still
broken without it. Clearly my patch must have conflicted with yours
during the rebase, which should have told me to recheck.

Please disregard my fix.

       Arnd
