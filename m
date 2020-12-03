Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4172CD26B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 10:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgLCJVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 04:21:21 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:40901 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgLCJVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 04:21:20 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5781C240006;
        Thu,  3 Dec 2020 09:20:35 +0000 (UTC)
Date:   Thu, 3 Dec 2020 10:20:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD
 register
Message-ID: <20201203092044.c6dikka4yy35p4ak@uno.localdomain>
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
 <20201203075830.2701c8b5@coco.lan>
 <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
 <bca27ed8-f6bc-f44e-df2e-ff210ac599a5@xs4all.nl>
 <20201203085248.17a734d1@coco.lan>
 <CAMuHMdUC94_+VhsCGPkbTC72k3gWZ2R=8T7Yeg29s_6L2=Ap7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUC94_+VhsCGPkbTC72k3gWZ2R=8T7Yeg29s_6L2=Ap7A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Dec 03, 2020 at 09:33:34AM +0100, Geert Uytterhoeven wrote:
> Hi Mauro,
>
> On Thu, Dec 3, 2020 at 8:53 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Em Thu, 3 Dec 2020 08:08:09 +0100
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > > On 03/12/2020 08:06, Hans Verkuil wrote:
> > > > On 03/12/2020 07:58, Mauro Carvalho Chehab wrote:
> > > >> Em Thu, 26 Nov 2020 08:47:55 +0100
> > > >> Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:
> > > >>
> > > >>> As reported in patch 2/2 commit message the the VNCSI_IFMD register
> > > >>> has the following limitations according to chip manual revision 2.20
> > > >>>
> > > >>> - V3M, V3H and E3 do not support the DES1 field has they do not feature
> > > >>> a CSI20 receiver.
> > > >>> - D3 only supports parallel input, and the whole register shall always
> > > >>> be written as 0.
> > > >>>
> > > >>> This patch upports the BSP change commit f54697394457
> > > >>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
> > > >>> Koji Matsuoka
> > > >>
> > > >> As checkpatch warned:
> > > >>
> > > >>    -:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
> > > >>

Ups :/

> > > >> There's no such commit upstream. Are you referring to an OOT patch?
> > > >>
> > > >> If so, you should provide an URL from where the patch is stored,
> > > >> as otherwise this comment won't make any sense upstream.
> > > >>
> > > >> If you can't provide such URL, please adjust the comment to provide
> > > >> a description that won't be dependent of such OOT commit.
> > >
> > > Ah, it's too early in the morning for me. I didn't read your email carefully
> > > enough.
> >
> > Yeah, I realized that the commit is for an OOT patch ;-)
> >
> > The main point is that Patch descriptions should be self-contained, bringing
> > everything that is needed to describe the patch on it. It is acceptable to have
> > URLs pointing to some external references that will be there as long as the
> > driver will remain at the Linux Kernel. The way the description currently is,
> > it doesn't fulfill such criteria.
> >
> > -
> >
> > Btw, I was unable to find such commit, even googling for it.
>
> https://github.com/renesas-rcar/linux-bsp/commit/f54697394457
>
> It's indeed unfortunate that Google doesn't support searching by
> git commit ID.

Thanks Geert for the link and sorry Mauro and Hans.

Hans confirmed me he'll fix the commit message when making the PR,
thank you!

Cheers
   j

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
