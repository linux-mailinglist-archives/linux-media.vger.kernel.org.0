Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F032CD152
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 09:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgLCIe1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 03:34:27 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45657 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLCIe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 03:34:27 -0500
Received: by mail-ot1-f66.google.com with SMTP id k3so996422otp.12;
        Thu, 03 Dec 2020 00:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilzJtTiyX+f8izL+F5Hy5/SSF4PEcp/bq73wyPG189A=;
        b=e7omSuYStB1T6dhsCIP9S/WrbQF0zFeYyfPD+MDhY35f1uzCiq5PlXTBoHznUUnQCa
         eYkE69LeexxswggCmH6WrZZA759RXspAyO6wSSZjfb0TftDx0Yp6Cj2dbVpV/B9+yijx
         bCJ8/28PW/yO3ac5lyzgwlFYZVOe0FryZqXMzSM488C5pG28/7C9uaIkizvVV5tL9T80
         X/VBl3EzzIqH6jieWXFT9AyxF8ooRA/UjvUbiXo1rvN2EnzVuP0Ko9pLDFvV4I8rGwfG
         RI4kYp8Fc35KoOFS+G1qM7UoCeA7hG/ovKTdUBeIO7tOQdX4TmzzBwwL0SAtVCUvyx5P
         p6Uw==
X-Gm-Message-State: AOAM5316ic8dxjZ+Mp7rvyUay7ZpbH8sod6cAQ9f6KHyfVccjQK9Fz+r
        IsoUrrQKPP2Y5peL9tRO70VUknT8OIspBzDVbHj1XBf4/u8=
X-Google-Smtp-Source: ABdhPJwhw5JsdHBbjIPr8K7coeF1jJgqSXpZCz+dDdCOwq6Mo4crvRo15PrbjE5LagUhjfBGfoAGUCLl3ruPxk1BDOE=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1365332oth.250.1606984425791;
 Thu, 03 Dec 2020 00:33:45 -0800 (PST)
MIME-Version: 1.0
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
 <20201203075830.2701c8b5@coco.lan> <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
 <bca27ed8-f6bc-f44e-df2e-ff210ac599a5@xs4all.nl> <20201203085248.17a734d1@coco.lan>
In-Reply-To: <20201203085248.17a734d1@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Dec 2020 09:33:34 +0100
Message-ID: <CAMuHMdUC94_+VhsCGPkbTC72k3gWZ2R=8T7Yeg29s_6L2=Ap7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD register
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Dec 3, 2020 at 8:53 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Thu, 3 Dec 2020 08:08:09 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > On 03/12/2020 08:06, Hans Verkuil wrote:
> > > On 03/12/2020 07:58, Mauro Carvalho Chehab wrote:
> > >> Em Thu, 26 Nov 2020 08:47:55 +0100
> > >> Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:
> > >>
> > >>> As reported in patch 2/2 commit message the the VNCSI_IFMD register
> > >>> has the following limitations according to chip manual revision 2.20
> > >>>
> > >>> - V3M, V3H and E3 do not support the DES1 field has they do not feature
> > >>> a CSI20 receiver.
> > >>> - D3 only supports parallel input, and the whole register shall always
> > >>> be written as 0.
> > >>>
> > >>> This patch upports the BSP change commit f54697394457
> > >>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
> > >>> Koji Matsuoka
> > >>
> > >> As checkpatch warned:
> > >>
> > >>    -:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
> > >>
> > >> There's no such commit upstream. Are you referring to an OOT patch?
> > >>
> > >> If so, you should provide an URL from where the patch is stored,
> > >> as otherwise this comment won't make any sense upstream.
> > >>
> > >> If you can't provide such URL, please adjust the comment to provide
> > >> a description that won't be dependent of such OOT commit.
> >
> > Ah, it's too early in the morning for me. I didn't read your email carefully
> > enough.
>
> Yeah, I realized that the commit is for an OOT patch ;-)
>
> The main point is that Patch descriptions should be self-contained, bringing
> everything that is needed to describe the patch on it. It is acceptable to have
> URLs pointing to some external references that will be there as long as the
> driver will remain at the Linux Kernel. The way the description currently is,
> it doesn't fulfill such criteria.
>
> -
>
> Btw, I was unable to find such commit, even googling for it.

https://github.com/renesas-rcar/linux-bsp/commit/f54697394457

It's indeed unfortunate that Google doesn't support searching by
git commit ID.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
