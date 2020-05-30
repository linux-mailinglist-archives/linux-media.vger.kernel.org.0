Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB82D1E8FFA
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 11:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgE3JWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 05:22:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726975AbgE3JWM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 05:22:12 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B131206C3;
        Sat, 30 May 2020 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590830532;
        bh=+qWBdGEDbIIib0pi3ThEKT0sCW2mGkQSYxrHrj7r2Bg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I1WroDaFDdXChCLooNsfISaeiGNHDT8v4Ob1Egy7P0m2LlphCYeYn8TIP3MFlALcF
         jh+46f4nghHA0QOCCdKL/hULrfe97Hfu0qjdRwDmkdHgVU5LqDqmEGoAa01bX2gK2F
         JXU8B/p2Y7wQPOAS0co2XVnyf2AhrZRNUk+ART5o=
Date:   Sat, 30 May 2020 11:22:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 1/9] staging: media: atomisp: fix incorrect NULL pointer
 check
Message-ID: <20200530112207.69f830c2@coco.lan>
In-Reply-To: <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
References: <20200529200031.4117841-1-arnd@arndb.de>
        <CAKwvOdnND7XFgr7W9PvZAikJB1nKxB4K5N-oP0YrBT74oX_C9g@mail.gmail.com>
        <CAK8P3a2UKC=s7re2P+qfxz8eqeC+yCcPGuYKkgji9N_ugdgWhg@mail.gmail.com>
        <CAK8P3a3u9fs9pSOXSkrmO=xNWUZ5fxZnL_O=f=0BDZ8DkHNYWQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 29 May 2020 22:31:44 +0200
Arnd Bergmann <arnd@arndb.de> escreveu:

> On Fri, May 29, 2020 at 10:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, May 29, 2020 at 10:04 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:  
> > >
> > > See also Nathan's 7 patch series.
> > > https://lore.kernel.org/lkml/20200527071150.3381228-1-natechancellor@gmail.com/
> > >
> > > Might be some overlap between series?
> > >  
> >
> > Probably. I really should have checked when I saw the number of warnings.
> >
> > At least this gives Mauro a chance to double-check the changes and see if
> > Nathan and I came to different conclusions on any of them.  
> 
> I checked now and found that the overlap is smaller than I expected.
> In each case, Nathans' solution seems more complete than mine,
> so this patch ("staging: media: atomisp: fix incorrect NULL pointer check")
> and also "staging: media: atomisp: fix a type conversion warning" can be
> dropped, but I think the others are still needed.

Hi Arnd,

I applied most of the patches from you. I had to add two extra patches
before this one:

	[PATCH 5/9] staging: media: atomisp: fix stack overflow in init_pipe_defaults()

And rebase it, because otherwise gcc would fail to compile here.

I'm placing the patches I have so far ready for atomisp on this
tree:

	https://git.linuxtv.org/mchehab/media-next.git/log/

Thanks,
Mauro
