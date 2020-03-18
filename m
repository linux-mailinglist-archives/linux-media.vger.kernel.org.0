Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CDE189631
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 08:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgCRH1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 03:27:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34869 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgCRH1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 03:27:46 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so8273494wru.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QSMihYeOGG/HiqnP/AX830zIskcO0mtrshGzaPZRRQg=;
        b=pwizgFNEYVZz+fPR+tMDio40C/gqChzqqn+ulB00rE4aEgn8SDtqEMLxew2GgnSL1E
         t49tZrX2xgFoS52P0X/Jfn+7Bz7QaBOnpqgSfizkYUsPbthZR93/znCtm421O+pzhsoT
         gGZiPWGUUg/Yz3jsG+N9nh9OzskjxlgVsBX9Md9keHr/bWQ+5Fxq/XtnIV9mfIDAzadb
         mkd/PdTLM0Pj3DkLaDFeAZBc2BGc+c6veUYtJZ05qgusDWzW1wn6Q6rmRTo14fffmj41
         9Ooj+R6W5Tc/8vPkV5pSFNamFAcxQ0quumqAkHUG0L7VH8vF2FgEX3YwuKGTNZP3bzL8
         pqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QSMihYeOGG/HiqnP/AX830zIskcO0mtrshGzaPZRRQg=;
        b=LSHRbYYaAdBpZ3zR25oyhzJOcTJVC1fn+raOb4zYx5UJ3frlgZZ2mAIExhRFs8UyGM
         0EE+hi6kQZJjyNRD46JXnPECCnVXSzxdEIcgNOwyGj10DS3vQbBQnjUJifCEJFMdtJ5n
         nFZo8+pstN8zWoUDP2Wixiab3MpAXcpEwNW5DNmbLdxxY0t7HuEML5C6cWTAa0Pgounk
         1HfD5Uub63RvecZhMo7LsfP0dnMm8VEGn+DXjO+6oN4NQbZggz2l/H+kNJrJbWkWJnft
         Z76L8XCE1lK6UJsAGPaL318+XWE5H1Esl2RBt9VBBo85Tqoz8e370bCBjwgVH+SoR7Bq
         R/xw==
X-Gm-Message-State: ANhLgQ2N/I0QIGylA6YNjL5CKyGC22P8qrhHsobi9JD9oBnR1pWx8f4B
        +XWj3OfaH/AcQ17Cgz3JvUC5BzWCqQyaZlFprsw=
X-Google-Smtp-Source: ADFU+vtPlnevW7Td5WqBZuOyfh2BJ236ChxGKrxEZG7CawLl/GBqgQMOfeLQUeI1ISCwD3fKxpvb8gfT+M2ApXA7/zE=
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr3850543wrn.415.1584516463649;
 Wed, 18 Mar 2020 00:27:43 -0700 (PDT)
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
 <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com>
 <CAC2bXD43ctzqg2O9yDgr2Hf0Q-RQ7bVtVvAJBXuX43gZwr=Nfw@mail.gmail.com> <CAOFGe96Nbc8GoAWSby8awTsTQkywFa198hrjm-cRzfxEp6KfXQ@mail.gmail.com>
In-Reply-To: <CAOFGe96Nbc8GoAWSby8awTsTQkywFa198hrjm-cRzfxEp6KfXQ@mail.gmail.com>
From:   Jacob Lifshay <programmerjake@gmail.com>
Date:   Wed, 18 Mar 2020 00:27:30 -0700
Message-ID: <CAC2bXD6FwjCjmhAWCuvDznd2hdKjeRtz03TMOqoK4u32CVYArQ@mail.gmail.com>
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

On Tue, Mar 17, 2020 at 11:35 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Wed, Mar 18, 2020 at 12:20 AM Jacob Lifshay <programmerjake@gmail.com> wrote:
> >
> > The main issue with doing everything immediately is that a lot of the
> > function calls that games expect to take a very short time (e.g.
> > vkQueueSubmit) would instead take a much longer time, potentially
> > causing problems.
>
> Do you have any evidence that it will cause problems?  What I said
> above is what switfshader is doing and they're running real apps and
> I've not heard of it causing any problems.  It's also worth noting
> that you would only really have to stall at sync_file export.  You can
> async as much as you want internally.

Ok, seems worth trying out.

> > One idea for a safe userspace-backed sync_file is to have a step
> > counter that counts down until the sync_file is ready, where if
> > userspace doesn't tell it to count any steps in a certain amount of
> > time, then the sync_file switches to the error state. This way, it
> > will error shortly after a process deadlocks for some reason, while
> > still having the finite-time guarantee.
> >
> > When the sync_file is created, the step counter would be set to the
> > number of jobs that the fence is waiting on.
> >
> > It can also be set to pause the timeout to wait until another
> > sync_file signals, to handle cases where a sync_file is waiting on a
> > userspace process that is waiting on another sync_file.
> >
> > The main issue is that the kernel would have to make sure that the
> > sync_file graph doesn't have loops, maybe by erroring all sync_files
> > that it finds in the loop.
> >
> > Does that sound like a good idea?
>
> Honestly, I don't think you'll ever be able to sell that to the kernel
> community.  All of the deadlock detection would add massive complexity
> to the already non-trivial dma_fence infrastructure and for what
> benefit?  So that a software rasterizer can try to pretend to be more
> like a GPU?  You're going to have some very serious perf numbers
> and/or other proof of necessity if you want to convince the kernel to
> people to accept that level of complexity/risk.  "I designed my
> software to work this way" isn't going to convince anyone of anything
> especially when literally every other software rasterizer I'm aware of
> is immediate and they work just fine.

After some further research, it turns out that it will work to have
all the sync_files that a sync_file needs to depend on specified at
creation, which forces the dependence graph to be a DAG since you
can't depend on a sync_file that isn't yet created, so loops are
impossible by design.

Since kernel deadlock detection isn't actually required, just timeouts
for the case of halted userspace, does this seem feasable?

I'd guess that it'd require maybe 200-300 lines of code in a
self-contained driver similar to the sync_file debugging driver
mentioned previously but with the additional timeout code for safety.

Jacob
