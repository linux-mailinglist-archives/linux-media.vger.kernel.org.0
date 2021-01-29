Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EFD308331
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 02:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbhA2BYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 20:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhA2BYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 20:24:05 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3855EC06174A
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 17:23:25 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id i12so1091385vsq.6
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 17:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sjkb6yXWtZ9Sxv1/gNdqQbGBoN1+dPLaicMA2ZT6rNM=;
        b=iCLYU3fuPsvJZltkAom5unfVux3qbx/84SoQSmqh5RtsiImcrCdGMT31C6+1ENMBLS
         0+LRiLAsmRhmOFQ5Q3GHbyu5aZ74aQkQRyaA63MegeLEXfmWLspArV+SQzI3/B/1cGxJ
         1rQ42u/3utf0mvm4yEsRiVY+BSTy3WgKy9UUCY1jQR27gxY3lKBZJ2MjQvlH/Y3jc8R5
         O3KBn5Wfuxbpq3cWKoGssSVuk/IPGSipcB70yiVvVwUkdP1OYGYUTRRJlSo87uQH/33A
         B+txLKIct1lZEOxXRo12HH2AlAlcCOCVY8UJXBD8D02HEcysxUof5gYWcOYymjgwUMGv
         a2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sjkb6yXWtZ9Sxv1/gNdqQbGBoN1+dPLaicMA2ZT6rNM=;
        b=i5N8o7qIJmKxkqAv7YZCaFf9y75VfS/nmpLA2BFzjlHtAAXinJ1nmmKYyDZE4mSriS
         KF2devDZxbZby1xiHKr9E9hKuWEffldWbkDiaPWcm3+iWjxjKAb3cPAssLm8jTgQbGvA
         7mTM7MBQTyutFRDJix90cWDofaiQqN4OnhrK7NERoeaJafrv7cEb0lLlXuMVm0QxcM4S
         rSd+YV00a4obLZi7A4vPHC1bCrIdcdIIkbPHDuzkP0N4TjFJfFKxK62o1zHlIplaCRSI
         Hod66IFFr+AkIG0obmtGeGHoYiW59HyJ0OX5upGXvIInZXhh8lVTwAFhgRwzaNcBycj6
         N2UA==
X-Gm-Message-State: AOAM533iAnMSXsejJ1At+B2ppM2MYNUK3s5z46G14/fM35UHGwUhRY1l
        vzxVo34Dq6eZViRztuugGEhp3kqX9qAVxl7Uk1997w==
X-Google-Smtp-Source: ABdhPJzvSoHd4aqU6Cv8LKu9Sl0lIJ7bapX7TwH6WxQlYBY8b93nG65hR4r/fmD0J1GnGIrVHo0uyX2Ku496O34Z6ik=
X-Received: by 2002:a67:f810:: with SMTP id l16mr1395266vso.41.1611883403850;
 Thu, 28 Jan 2021 17:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org> <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
In-Reply-To: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
From:   Daniel Mentz <danielmentz@google.com>
Date:   Thu, 28 Jan 2021 17:23:12 -0800
Message-ID: <CAE2F3rBSADvPsFYyDAaPbEaFGNVKbgwOuakkD+MLwa0J-09Dcg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     Brian Starkey <brian.starkey@arm.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 16, 2020 at 12:04 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> > On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > > @@ -393,6 +424,16 @@ static int system_heap_allocate(struct dma_heap *heap,
> > >               /* just return, as put will call release and that will free */
> > >               return ret;
> > >       }
> > > +
> > > +     /*
> > > +      * For uncached buffers, we need to initially flush cpu cache, since
> > > +      * the __GFP_ZERO on the allocation means the zeroing was done by the
> > > +      * cpu and thus it is likely cached. Map (and implicitly flush) it out
> > > +      * now so we don't get corruption later on.
> > > +      */
> > > +     if (buffer->uncached)
> > > +             dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
> >
> > Do we have to keep this mapping around for the entire lifetime of the
> > buffer?
>
> Yea, I guess we can just map and unmap it right there.  It will look a
> little absurd, but that sort of aligns with your next point.
>
> > Also, this problem (and solution) keeps lingering around. It really
> > feels like there should be a better way to solve "clean the linear
> > mapping all the way to DRAM", but I don't know what that should be.
>
> Yea, something better here would be nice...

In ION, we had a little helper function named
ion_buffer_prep_noncached that called arch_dma_prep_coherent() on all
sg entries like so

for_each_sg(table->sgl, sg, table->orig_nents, i)
        arch_dma_prep_coherent(sg_page(sg), sg->length);

Would that help?
