Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35197189521
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 06:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCRFUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 01:20:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43965 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgCRFUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 01:20:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id b2so22384647wrj.10
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 22:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNB745vvoQ12OYSATXCWkUBAFrhv7Zz0aM5zCjC5TCM=;
        b=HoiXBdGDx37rTXRzpTcNoSa5ZrJyBTK4yUt3GwQSTg8qfcA3wlAm3DCHUXR4FYhUvU
         IRKKn6eR/3vxJyIGL186jsFmnW+GhZIuno7AYD8/EWRWSnVJd4+EUDk0Zc52UIda7rIk
         w5s349kUblR2qyINHrP2G+iwvF6E6FeBSNvHRLNtPNhfbR+DwAuGoUmYZkAR7TWIMAha
         CCcH8gG0skFc5QzoOVu0qPO9BNhfDwV+vAuIMrEISx7Rzn8ep5N+uUfGE5GT5QDi6FEE
         zXbJoKSQHq+vTNpsWeeY6L8anI+JtJPLAuwS1G8WurNzAGqZNNaU2CUw/jT+01D29y/Q
         RfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNB745vvoQ12OYSATXCWkUBAFrhv7Zz0aM5zCjC5TCM=;
        b=Z4K5WYIvs4v6eh0ieEBLrYOlH0H1AsKWnhlPv7Rd1r0cvR1PXYKFhRJxnHgX4thWvt
         bppNvQc6Moo6u1LYclwWYZ6/BG6jzzuI7bqmu5WLnP2Q2Jl2HLv/c4y30HHFPSxIU5mq
         bjUgb9v4orK4HT4s9GDYKS/0L1Kx6ewmel2ydXupAugR/e9P864Cg311GbjNoHsa8ADv
         NOAW34lwMEGENHpvVDpkocTf5hAW682Cz3lWnDJ+OXCZa5u5akLz8V8FsR0eLRAATdph
         5C+7UFw6y/vvFjepYSnovYDNlLyysLJFy/i+EWjJtkmA96195YnBYYbgFSFvCMuPJbZ5
         keXg==
X-Gm-Message-State: ANhLgQ2hXRv3/uGX7jFljiitIepD+D+oKUYFl7YBUydeAtrPdTEJM6v1
        SbKLm0bp+w2HDG0vdHMeHVm7mkQD3BW5n7XiVAU=
X-Google-Smtp-Source: ADFU+vsmGHGMuko3pfA8piDJCJlH96yEFSqEAO9PfYHlermSRluBjO/KUwnSudVj5uCcB7zGjFj7NOObldq1jbMxxSg=
X-Received: by 2002:adf:e70d:: with SMTP id c13mr1952669wrm.306.1584508844740;
 Tue, 17 Mar 2020 22:20:44 -0700 (PDT)
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
 <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com> <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com>
In-Reply-To: <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com>
From:   Jacob Lifshay <programmerjake@gmail.com>
Date:   Tue, 17 Mar 2020 22:20:33 -0700
Message-ID: <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux ecosystem
To:     Jason Ekstrand <jason@jlekstrand.net>
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

On Tue, Mar 17, 2020 at 7:08 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Tue, Mar 17, 2020 at 7:16 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
> >
> > On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
> > >
> > > Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > > > I think I found a userspace-accessible way to create sync_files and
> > > > dma_fences that would fulfill the requirements:
> > > > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> > > >
> > > > I'm just not sure if that's a good interface to use, since it appears
> > > > to be designed only for debugging. Will have to check for additional
> > > > requirements of signalling an error when the process that created the
> > > > fence is killed.
>
> It is expressly only for debugging and testing.  Exposing such an API
> to userspace would break the finite time guarantees that are relied
> upon to keep sync_file a secure API.

Ok, I was figuring that was probably the case.

> > > Something like that can certainly be lifted for general use if it makes
> > > sense. But then with a software renderer I don't really see how fences
> > > help you at all. With a software renderer you know exactly when the
> > > frame is finished and you can just defer pushing it over to the next
> > > pipeline element until that time. You won't gain any parallelism by
> > > using fences as the CPU is busy doing the rendering and will not run
> > > other stuff concurrently, right?
> >
> > There definitely may be other hardware and/or processes that can
> > process some stuff concurrently with the main application, such as the
> > compositor and or video encoding processes (for video capture).
> > Additionally, from what I understand, sync_file is the standard way to
> > export and import explicit synchronization between processes and
> > between drivers on Linux, so it seems like a good idea to support it
> > from an interoperability standpoint even if it turns out that there
> > aren't any scheduling/timing benefits.
>
> There are different ways that one can handle interoperability,
> however.  One way is to try and make the software rasterizer look as
> much like a GPU as possible:  lots of threads to make things as
> asynchronous as possible, "real" implementations of semaphores and
> fences, etc.

This is basically the route I've picked, though rather than making
lots of native threads, I'm planning on having just one thread per
core and have a work-stealing scheduler (inspired by Rust's rayon
crate) schedule all the individual render/compute jobs, because that
allows making a lot more jobs to allow finer load balancing.

> Another is to let a SW rasterizer be a SW rasterizer: do
> everything immediately, thread only so you can exercise all the CPU
> cores, and minimally implement semaphores and fences well enough to
> maintain compatibility.  If you take the first approach, then we have
> to solve all these problems with letting userspace create unsignaled
> sync_files which it will signal later and figure out how to make it
> safe.  If you take the second approach, you'll only ever have to
> return already signaled sync_files and there's no problem with the
> sync_file finite time guarantees.

The main issue with doing everything immediately is that a lot of the
function calls that games expect to take a very short time (e.g.
vkQueueSubmit) would instead take a much longer time, potentially
causing problems.

One idea for a safe userspace-backed sync_file is to have a step
counter that counts down until the sync_file is ready, where if
userspace doesn't tell it to count any steps in a certain amount of
time, then the sync_file switches to the error state. This way, it
will error shortly after a process deadlocks for some reason, while
still having the finite-time guarantee.

When the sync_file is created, the step counter would be set to the
number of jobs that the fence is waiting on.

It can also be set to pause the timeout to wait until another
sync_file signals, to handle cases where a sync_file is waiting on a
userspace process that is waiting on another sync_file.

The main issue is that the kernel would have to make sure that the
sync_file graph doesn't have loops, maybe by erroring all sync_files
that it finds in the loop.

Does that sound like a good idea?

Jacob
