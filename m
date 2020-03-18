Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94951895E7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 07:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCRGfN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 02:35:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40635 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgCRGfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 02:35:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id a24so29637943edy.7
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avzVrZIf1wLUz+pG+uc67ZsrE+8uaVtP16+bPi4jkyo=;
        b=eR0KUqEM7U1L9kpP91LjCBdYPTGJyfXe1E7R7mQf+FblSrMDoBL8StMpl7S5MEHR/Y
         ACkhx0H5AQjP1WkNxyHmL+O5wrGTuQJ0W/AOR2woUcTXrExTEdYMm3APSD/K6OWxlH7K
         83OxEO+vpje/2M7spg/ZsJtADvmfPGtKmlFL2X6dn/+jMIqzXQAY/dvIyNcxpAUAlEL9
         z8JA3g47AUzPwyJmL4MZ4yFKXFHmCsi5+tKd4XJz5uKLbOEbs+Vp+6WY0wm0BhFGajyu
         dpu09/+m1MeqizJaKCTKxOWu/IR9kgpeRsma2nngyzff/FF3qs4wYiOmWu5ugjiIvl+t
         Hjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avzVrZIf1wLUz+pG+uc67ZsrE+8uaVtP16+bPi4jkyo=;
        b=s6BikL0ed5X50tDDJ19OJJp9P4Yp5hV84lERzriqU5H/AxQ+8LlMthzDdxJ+9chnz6
         k48ummKhpTnxkX1Dqfnn/a+/XGWWkLgZnHygIxVEwNexs04Kou9hvtoQ5Z7kK74r7Zeq
         ioSPDkZXKtT19l2t0OtCN5ET95IVNZb7aTiA+uwd11TUtaD/FkwUCNDt5Bf9NRbNHsUM
         IsQ7UqRJtHTkk5eTPw32sQD5UbKzJoptSeElawapiKHZwvAFrVyGvwVQrntGO6KBGBba
         TJhuB6UzJX47qs02LbApKaP41oj0N972rn7oZyyykRoiph+vsDTmh7iJZB4ZwKmFoWsq
         5BbA==
X-Gm-Message-State: ANhLgQ2S6qpvah2a2LFsg9qLzxbE+NwfX30NiT6qHFdc4euBEdrK71Cp
        Wk6EBAuDjOlYVqWn8QVguoYaohgLKkrA54DTQnuoFRdTKjo=
X-Google-Smtp-Source: ADFU+vu55g7kA273IrMf2mncefNvZ0T7dPQRUCZ0sh3qUa6VEWGHUHcpctrA/5X/YVQ+sXIfN5f2akGGtQHRgDRjItM=
X-Received: by 2002:a17:906:d18e:: with SMTP id c14mr2761556ejz.120.1584513310044;
 Tue, 17 Mar 2020 23:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com>
 <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
 <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
 <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com> <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com>
In-Reply-To: <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Wed, 18 Mar 2020 01:34:58 -0500
Message-ID: <CAOFGe96Nbc8GoAWSby8awTsTQkywFa198hrjm-cRzfxEp6KfXQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux ecosystem
To:     Jacob Lifshay <programmerjake@gmail.com>
Cc:     Lucas Stach <dev@lynxeye.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 12:20 AM Jacob Lifshay <programmerjake@gmail.com> wrote:
>
> On Tue, Mar 17, 2020 at 7:08 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Tue, Mar 17, 2020 at 7:16 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
> > >
> > > On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
> > > >
> > > > Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > > > > I think I found a userspace-accessible way to create sync_files and
> > > > > dma_fences that would fulfill the requirements:
> > > > > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> > > > >
> > > > > I'm just not sure if that's a good interface to use, since it appears
> > > > > to be designed only for debugging. Will have to check for additional
> > > > > requirements of signalling an error when the process that created the
> > > > > fence is killed.
> >
> > It is expressly only for debugging and testing.  Exposing such an API
> > to userspace would break the finite time guarantees that are relied
> > upon to keep sync_file a secure API.
>
> Ok, I was figuring that was probably the case.
>
> > > > Something like that can certainly be lifted for general use if it makes
> > > > sense. But then with a software renderer I don't really see how fences
> > > > help you at all. With a software renderer you know exactly when the
> > > > frame is finished and you can just defer pushing it over to the next
> > > > pipeline element until that time. You won't gain any parallelism by
> > > > using fences as the CPU is busy doing the rendering and will not run
> > > > other stuff concurrently, right?
> > >
> > > There definitely may be other hardware and/or processes that can
> > > process some stuff concurrently with the main application, such as the
> > > compositor and or video encoding processes (for video capture).
> > > Additionally, from what I understand, sync_file is the standard way to
> > > export and import explicit synchronization between processes and
> > > between drivers on Linux, so it seems like a good idea to support it
> > > from an interoperability standpoint even if it turns out that there
> > > aren't any scheduling/timing benefits.
> >
> > There are different ways that one can handle interoperability,
> > however.  One way is to try and make the software rasterizer look as
> > much like a GPU as possible:  lots of threads to make things as
> > asynchronous as possible, "real" implementations of semaphores and
> > fences, etc.
>
> This is basically the route I've picked, though rather than making
> lots of native threads, I'm planning on having just one thread per
> core and have a work-stealing scheduler (inspired by Rust's rayon
> crate) schedule all the individual render/compute jobs, because that
> allows making a lot more jobs to allow finer load balancing.
>
> > Another is to let a SW rasterizer be a SW rasterizer: do
> > everything immediately, thread only so you can exercise all the CPU
> > cores, and minimally implement semaphores and fences well enough to
> > maintain compatibility.  If you take the first approach, then we have
> > to solve all these problems with letting userspace create unsignaled
> > sync_files which it will signal later and figure out how to make it
> > safe.  If you take the second approach, you'll only ever have to
> > return already signaled sync_files and there's no problem with the
> > sync_file finite time guarantees.
>
> The main issue with doing everything immediately is that a lot of the
> function calls that games expect to take a very short time (e.g.
> vkQueueSubmit) would instead take a much longer time, potentially
> causing problems.

Do you have any evidence that it will cause problems?  What I said
above is what switfshader is doing and they're running real apps and
I've not heard of it causing any problems.  It's also worth noting
that you would only really have to stall at sync_file export.  You can
async as much as you want internally.

> One idea for a safe userspace-backed sync_file is to have a step
> counter that counts down until the sync_file is ready, where if
> userspace doesn't tell it to count any steps in a certain amount of
> time, then the sync_file switches to the error state. This way, it
> will error shortly after a process deadlocks for some reason, while
> still having the finite-time guarantee.
>
> When the sync_file is created, the step counter would be set to the
> number of jobs that the fence is waiting on.
>
> It can also be set to pause the timeout to wait until another
> sync_file signals, to handle cases where a sync_file is waiting on a
> userspace process that is waiting on another sync_file.
>
> The main issue is that the kernel would have to make sure that the
> sync_file graph doesn't have loops, maybe by erroring all sync_files
> that it finds in the loop.
>
> Does that sound like a good idea?

Honestly, I don't think you'll ever be able to sell that to the kernel
community.  All of the deadlock detection would add massive complexity
to the already non-trivial dma_fence infrastructure and for what
benefit?  So that a software rasterizer can try to pretend to be more
like a GPU?  You're going to have some very serious perf numbers
and/or other proof of necessity if you want to convince the kernel to
people to accept that level of complexity/risk.  "I designed my
software to work this way" isn't going to convince anyone of anything
especially when literally every other software rasterizer I'm aware of
is immediate and they work just fine.

--Jason
