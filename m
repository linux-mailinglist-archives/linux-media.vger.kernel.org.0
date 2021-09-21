Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25332413970
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 20:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhIUSFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 14:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbhIUSFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 14:05:44 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961A4C061574;
        Tue, 21 Sep 2021 11:04:15 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id w17so33718051wrv.10;
        Tue, 21 Sep 2021 11:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/G3Qa808WP8sJJrKGbpGjsu3WNB70LujCVmf+r+9a7I=;
        b=E+3TpsCMuvie8IHVehuRQa7boCiwqbpAEdXmaqZS72X0rK5S1O8khUjtqD3zdlbquj
         FOSihL6Cfj4V0BYI1juyczfKZqwGvdQsTz7dRPzUdsuMaXX4fw18KcnzPFDJin0TyJ21
         i69wdaYdwzzoCTI+S6zTEeLi+/m0Z2E5bzKICgyB8/F4lHcaq83GTax1AZ8f8tGLLUiG
         0uvncEWf4OtvUcjztJAfyzIebiIxp9YbsXVBVuW5nFGEtVAa+75gw8FIJBrnQ0UHyOsq
         J7LJRA+kKW5UaHMWR1zyxf8837bsD7COU+iHI5RtJW8bthKYrUfi8TZY007kTnWXnXCf
         JGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/G3Qa808WP8sJJrKGbpGjsu3WNB70LujCVmf+r+9a7I=;
        b=GPYTP4y/3i3HzF2Zf+lDY3GEeDIAYUijYdNDb1EoIzIBBr+IGHKkSc/nzw9UmVp429
         kS5gsK/NNLZO6UXhHryUA0xZeQsJ7uLmPn9HcY/YPz9qwpZ7On9rt2X/qQ1XJROs/s9X
         fCgsr4+DqrvOjUlCDDOhuYc4lGbPZbsXJXu5XgPT2ABwqme+nHcUTdIOpMpHOm8WPDn2
         BhiPJyKvZHjuMiCofloROe3SpUS9LXp8icK1VJom0HFCV4vdtNl1b0DWqZA6T/izOL1T
         mkfrsOjfDUN6NcC+QNbbSxP+Ubkp1fbOcy3fHeXrxHhvwaN/kFd3tCXPIsRzXnxH/sec
         oZOA==
X-Gm-Message-State: AOAM533G77sbhyxX3SpfA2FBRUhqk7i8Vhvu4bZpdt7JTySF4y3s2DWW
        08YbF2zu8kX8iLeGzKOQYkTB4L5rO6/ILZR2w4s=
X-Google-Smtp-Source: ABdhPJxOI5g6DcRSW++Sm5b3yN4IfqPGJkK47Ku+OdxNbcLRKFvJ6Lrk8uh4oPL2Y7NWZWZ3SfZ29LQnzMQGhIVuxLE=
X-Received: by 2002:a5d:64e6:: with SMTP id g6mr20870849wri.151.1632247454077;
 Tue, 21 Sep 2021 11:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-9-robdclark@gmail.com>
 <YTj36NbUNxnn6uBU@phenom.ffwll.local> <CAF6AEGuVkHOvOkVHo69fOy71qiBh=12Nd=yMXm36p_bjzfFe9A@mail.gmail.com>
 <YTkFzjs3cEvPcCzn@phenom.ffwll.local> <CAF6AEGv4cRCb+5qZdEH_b-m1jVu7t=CYb-18cADviwxvnJXELA@mail.gmail.com>
 <CAKMK7uH3w3wfPgK0-WSFEbE=y2ADh9ppOABt7V9ZuXs2vdgDig@mail.gmail.com>
In-Reply-To: <CAKMK7uH3w3wfPgK0-WSFEbE=y2ADh9ppOABt7V9ZuXs2vdgDig@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 21 Sep 2021 11:08:43 -0700
Message-ID: <CAF6AEGuN+REwFhMS7k_-LfXqJgue7+dphzTrthcVa8pxFpTwCw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 8, 2021 at 2:10 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 8, 2021 at 9:36 PM Rob Clark <robdclark@gmail.com> wrote:
> > On Wed, Sep 8, 2021 at 11:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Wed, Sep 08, 2021 at 11:23:42AM -0700, Rob Clark wrote:
> > > > On Wed, Sep 8, 2021 at 10:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Fri, Sep 03, 2021 at 11:47:59AM -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > The initial purpose is for igt tests, but this would also be useful for
> > > > > > compositors that wait until close to vblank deadline to make decisions
> > > > > > about which frame to show.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Needs userspace and I think ideally also some igts to make sure it works
> > > > > and doesn't go boom.
> > > >
> > > > See cover-letter.. there are igt tests, although currently that is the
> > > > only user.
> > >
> > > Ah sorry missed that. It would be good to record that in the commit too
> > > that adds the uapi. git blame doesn't find cover letters at all, unlike on
> > > gitlab where you get the MR request with everything.
> > >
> > > Ok there is the Link: thing, but since that only points at the last
> > > version all the interesting discussion is still usually lost, so I tend to
> > > not bother looking there.
> > >
> > > > I'd be ok to otherwise initially restrict this and the sw_sync UABI
> > > > (CAP_SYS_ADMIN?  Or??) until there is a non-igt user, but they are
> > > > both needed by the igt tests
> > >
> > > Hm really awkward, uapi for igts in cross vendor stuff like this isn't
> > > great. I think hiding it in vgem is semi-ok (we have fences there
> > > already). But it's all a bit silly ...
> > >
> > > For the tests, should we instead have a selftest/Kunit thing to exercise
> > > this stuff? igt probably not quite the right thing. Or combine with a page
> > > flip if you want to test msm.
> >
> > Hmm, IIRC we have used CONFIG_BROKEN or something along those lines
> > for UABI in other places where we weren't willing to commit to yet?
> >
> > I suppose if we had to I could make this a sw_sync ioctl instead.  But
> > OTOH there are kind of a limited # of ways this ioctl could look.  And
> > we already know that at least some wayland compositors are going to
> > want this.
>
> Hm I was trying to think up a few ways this could work, but didn't
> come up with anything reasonable. Forcing the compositor to boost the
> entire chain (for gl composited primary plane fallback) is something
> the kernel can easily do too. Also only makes sense for priority
> boost, not so much for clock boosting, since clock boosting only
> really needs the final element to be boosted.

So, I think the compositor, much like
drm_atomic_helper_wait_for_fences(), really just sees one fence per
surface, it doesn't really know (or care) that under-the-hood it is a
fence-chain or fence-array.  There isn't really much for the
compositor to do but inform "if possible, I'd like this fence to be
signaled by time T".

Say you have multiple updated frames, which have a fence-array
composed of fences from multiple different rings.  It is up to the
fence provider to keep track of the latest fence and the earliest
deadline.

The drm/msm implementation doesn't try to be too clever and track
multiple deadlines, Ie. fenceA wanted by time1 and fenceB wanted by
time2.  It just keeps track of the nearest deadline and the last
fence.  That is probably sufficient, eventually the utilization based
gpu freq governor will settle into the appropriate steady-state
framerate.

(Although, I did realize that the WAIT_FENCE ioctl should also be
setting a deadline.. I forgot to add that)

> > I guess I can look at non-igt options.  But the igt test is already a
> > pretty convenient way to contrive situations (like loops, which is a
> > thing I need to add)
>
> Yeah it's definitely very useful for testing ... One option could be a
> hacky debugfs interface, where you write a fd number and deadline and
> the debugfs read function does the deadline setting. Horribly, but
> since it's debugfs no one ever cares. That's at least where we're
> hiding all the i915 hacks that igts need.

ugg :-)

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > -Daniel
> > > > >
> > > > > > ---
> > > > > >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> > > > > >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> > > > > >  2 files changed, 39 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > > > index 394e6e1e9686..f295772d5169 100644
> > > > > > --- a/drivers/dma-buf/sync_file.c
> > > > > > +++ b/drivers/dma-buf/sync_file.c
> > > > > > @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > > > > > +                                     unsigned long arg)
> > > > > > +{
> > > > > > +     struct sync_set_deadline ts;
> > > > > > +
> > > > > > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > > > > > +             return -EFAULT;
> > > > > > +
> > > > > > +     if (ts.pad)
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > > > > >                           unsigned long arg)
> > > > > >  {
> > > > > > @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > > > > >       case SYNC_IOC_FILE_INFO:
> > > > > >               return sync_file_ioctl_fence_info(sync_file, arg);
> > > > > >
> > > > > > +     case SYNC_IOC_SET_DEADLINE:
> > > > > > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > > > > > +
> > > > > >       default:
> > > > > >               return -ENOTTY;
> > > > > >       }
> > > > > > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> > > > > > index ee2dcfb3d660..f67d4ffe7566 100644
> > > > > > --- a/include/uapi/linux/sync_file.h
> > > > > > +++ b/include/uapi/linux/sync_file.h
> > > > > > @@ -67,6 +67,18 @@ struct sync_file_info {
> > > > > >       __u64   sync_fence_info;
> > > > > >  };
> > > > > >
> > > > > > +/**
> > > > > > + * struct sync_set_deadline - set a deadline on a fence
> > > > > > + * @tv_sec:  seconds elapsed since epoch
> > > > > > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > > > > > + * @pad:     must be zero
> > > > > > + */
> > > > > > +struct sync_set_deadline {
> > > > > > +     __s64   tv_sec;
> > > > > > +     __s32   tv_nsec;
> > > > > > +     __u32   pad;
> > > > > > +};
> > > > > > +
> > > > > >  #define SYNC_IOC_MAGIC               '>'
> > > > > >
> > > > > >  /**
> > > > > > @@ -95,4 +107,12 @@ struct sync_file_info {
> > > > > >   */
> > > > > >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> > > > > >
> > > > > > +
> > > > > > +/**
> > > > > > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > > > > > + *
> > > > > > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> > > > > > + */
> > > > > > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > > > > > +
> > > > > >  #endif /* _UAPI_LINUX_SYNC_H */
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
