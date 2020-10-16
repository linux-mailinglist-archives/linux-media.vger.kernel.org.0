Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98EF290E0E
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 01:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410928AbgJPXPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 19:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393118AbgJPXPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 19:15:48 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D2BC0613D3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 16:15:46 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id f10so4069656otb.6
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/utRDTKVHmHoEv/2/0Wo96JPENEebgv5nLtf2BjNsM=;
        b=Oi+V1WJt62DGA+OLvUtpmMrFw9shQt3hUS/kNEujvoDH0S+ng6vAYPzCIgge+f3w9u
         TKWiYzRhkNSA9GoKq34ilGiHvwx6EY6aftODB89USCCvqSBrOF9Ahb1YH6AVXBZCgQig
         4DlUkffsXOsF1pIm13wAFD7dnXVaJqoYN2sqj94xan8ytJ2xtxnef5agl5SMLLqg4NgB
         QpAQQPmcmS3RUog/rS5HW2x/+33CWgbJZeTEULDKM2cMYyziRnQ50KtbeBtD/GX0MMx9
         fEvYXSp+sAAsczFNL8AvoNylNDa3YEDww1jbOh3ovT1X6SZKJrjCeHi3LzO3cklJhFnp
         KO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/utRDTKVHmHoEv/2/0Wo96JPENEebgv5nLtf2BjNsM=;
        b=R9PTY80kK81GZFwg4B7ky9U0shxxTFNj8J+lSsoyy73zPzatLFzXPyDNdzOmiMzme2
         6EdUK3j0uCys1rKGa5haL5y4vj6f6ZIKMKrfR8K87PGjEGrG1Ib0NobTST24velku7u1
         oeLlqPlbeceBkugA7Eg3k3YzcwFXaBazWPUMS1AvF8jTfFqvfOy3TYdTHbs3ivZePVc+
         dBbWwLSiT6Ugy3K04ye+KG8i9df6qhI6wox99YACJ1lyo2uP54QseW5Pvf/fX1wDIoRX
         zLKQvm6LzSrVBQkU+IgnrZ4ri6/Ao67cma342HGxGc0evFIy/sD/v3UkNvS6p6QVUztu
         Pw4A==
X-Gm-Message-State: AOAM531QSd5+NGEV16vj10vx3SRxCkHkEACvI/sVeIYe2a8FILEMkCE0
        V5HcNgkK9aFH3r9oEZ7X6rPIZeFHunfmJRTMiZ/4Bg==
X-Google-Smtp-Source: ABdhPJx+Js3ydQFBUP7ACgCzkoV+mCC9MxMLL2meKWUMIA/Fue2cHeE5SzEFTuMIFXv2hDabWqdWiVicuLD7Dfqz5J4=
X-Received: by 2002:a05:6830:1082:: with SMTP id y2mr4127841oto.221.1602890146021;
 Fri, 16 Oct 2020 16:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org> <20201008115101.4qi6wh3hhkb6krg5@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
In-Reply-To: <CALAqxLWrbgHoh=BCnuB4US77AOPMYmgGrE85WT6DYnEV-bad-A@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 16 Oct 2020 16:15:32 -0700
Message-ID: <CALAqxLUQkg1uDdLXoP4W7McxQUwFgsncnMxJSOE_VZ4dRRpzFg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
To:     Brian Starkey <brian.starkey@arm.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
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

On Fri, Oct 16, 2020 at 12:03 PM John Stultz <john.stultz@linaro.org> wrote:
> On Thu, Oct 8, 2020 at 4:51 AM Brian Starkey <brian.starkey@arm.com> wrote:
> > On Sat, Oct 03, 2020 at 04:02:57AM +0000, John Stultz wrote:
> > > @@ -426,6 +487,16 @@ static int system_heap_create(void)
> > >       if (IS_ERR(sys_heap))
> > >               return PTR_ERR(sys_heap);
> > >
> > > +     exp_info.name = "system-uncached";
> > > +     exp_info.ops = &system_uncached_heap_ops;
> > > +     exp_info.priv = NULL;
> > > +
> > > +     sys_uncached_heap = dma_heap_add(&exp_info);
> > > +     if (IS_ERR(sys_uncached_heap))
> > > +             return PTR_ERR(sys_heap);
> > > +
> >
> > In principle, there's a race here between the heap getting registered
> > to sysfs and the dma_mask getting updated.
> >
> > I don't think it would cause a problem in practice, but with the API
> > as it is, there's no way to avoid it - so I wonder if the
> > dma_heap_get_dev() accessor isn't the right API design.
>
> Hrm.  I guess to address your concern we would need split
> dma_heap_add() into something like:
>   dma_heap_create()
>   dma_heap_add()
>
> Which breaks the creation of the heap with the registering it to the
> subsystem, so some attributes can be tweaked inbetween?

Looking at this some more, this approach isn't going to work. We
create the device and then we call dma_coerce_mask_and_coherent() on
it, but as soon as the device is created it seems possible for
userland to directly access it. Again, though, as you mentioned this
isn't terribly likely in practice.

The best thing I can think of for now is to have the uncached heap's
allocate pointer initially point to a dummy function that returns
EBUSY and then after we update the dma mask then we can set it to the
real alloc.  I'll go with that for now, but let me know if you have
other suggestions.

thanks
-john
