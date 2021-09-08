Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD320403FE2
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 21:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351962AbhIHThp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 15:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351299AbhIHThl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 15:37:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D7BC061575;
        Wed,  8 Sep 2021 12:36:32 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so2491343wmi.0;
        Wed, 08 Sep 2021 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFkz0KIGVRanwwOpQOB63f3hI9/QKctdUdt0tgTh9zM=;
        b=EsgfooutlpvYl9zZZ9jQN162hfvTjlYk1i9udEEEpQT6+D6RVJlzfbaoSW0cZLZP4K
         8xjfRlw4uyPuQkVzfdwFjgnMHKj8AVM7DEY4eWyoHUXuxJZ2+Izt9Mob96Pd4fRhVq2A
         XtGyX4voyU40GJwE/hqW18Wv8CPa9aS6Hi0DY8qM3FgE+dDi3K1kUmvHB5vPenjG15Wx
         hK0M2H5ivu/BupXc7LcC3UWfsEimZOq7bHpreacydK1E5X28APExPAa6Ln/l28kvTJqr
         1MI9fO/4LDwr55zEPOxEG/IRUIPw+EHFjBVjOmm61dZZ1perSvJFmCcafvEXROgvg38V
         i2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFkz0KIGVRanwwOpQOB63f3hI9/QKctdUdt0tgTh9zM=;
        b=w4rNMS5cvXzWIhv6TmP9BOx7j5LYCgLMm1s8JAHsgLLJGNKF7P3I2ivRRCxHjw0bfb
         BnVDySX2hpgdM1wSdGH13X6Ao1dXiTb7gwRgIOJIHF+uV3LhC5xBgaZz+X887O4MVB8k
         O2Msrn82K+lGgboipyJnGsV88DhIRxXjwZyiESvEgLid7IINwDymrZCTiYQTbEYbYuTV
         o8w5BrZ7bIHXnexMQ3Lyfa4PY/Y03nWq4OlscM/XocHaQD2qUZ40zPbdrP8NMPu5h/3y
         ADe/obHkHYRr8BV89ZC2cZ2FPrJFizwr/skxXxJMuRnr/tDTz15TfNOD+HkB1aWaXUh5
         f5LA==
X-Gm-Message-State: AOAM531T2MV8cUgqXxqdSLuvXV2vAENKGjsiSNfKv6xHB5ywprrXIrmv
        Q9CtaWCsdD2CB5V8yA8J/pfFC0TS+40whUMtbVg=
X-Google-Smtp-Source: ABdhPJzGCBZ4p5uJTM2qKSxGVjbqTwcWC8t2Hh+xiorvb8wF4TXx7LGAPQm7BCJsMICYTysbM28XWciPFXRZDwu8Q0w=
X-Received: by 2002:a05:600c:5110:: with SMTP id o16mr5203020wms.44.1631129790799;
 Wed, 08 Sep 2021 12:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-9-robdclark@gmail.com>
 <YTj36NbUNxnn6uBU@phenom.ffwll.local> <CAF6AEGuVkHOvOkVHo69fOy71qiBh=12Nd=yMXm36p_bjzfFe9A@mail.gmail.com>
 <YTkFzjs3cEvPcCzn@phenom.ffwll.local>
In-Reply-To: <YTkFzjs3cEvPcCzn@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Sep 2021 12:40:48 -0700
Message-ID: <CAF6AEGv4cRCb+5qZdEH_b-m1jVu7t=CYb-18cADviwxvnJXELA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 8, 2021 at 11:49 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 08, 2021 at 11:23:42AM -0700, Rob Clark wrote:
> > On Wed, Sep 8, 2021 at 10:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Sep 03, 2021 at 11:47:59AM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The initial purpose is for igt tests, but this would also be useful for
> > > > compositors that wait until close to vblank deadline to make decisions
> > > > about which frame to show.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >
> > > Needs userspace and I think ideally also some igts to make sure it works
> > > and doesn't go boom.
> >
> > See cover-letter.. there are igt tests, although currently that is the
> > only user.
>
> Ah sorry missed that. It would be good to record that in the commit too
> that adds the uapi. git blame doesn't find cover letters at all, unlike on
> gitlab where you get the MR request with everything.
>
> Ok there is the Link: thing, but since that only points at the last
> version all the interesting discussion is still usually lost, so I tend to
> not bother looking there.
>
> > I'd be ok to otherwise initially restrict this and the sw_sync UABI
> > (CAP_SYS_ADMIN?  Or??) until there is a non-igt user, but they are
> > both needed by the igt tests
>
> Hm really awkward, uapi for igts in cross vendor stuff like this isn't
> great. I think hiding it in vgem is semi-ok (we have fences there
> already). But it's all a bit silly ...
>
> For the tests, should we instead have a selftest/Kunit thing to exercise
> this stuff? igt probably not quite the right thing. Or combine with a page
> flip if you want to test msm.

Hmm, IIRC we have used CONFIG_BROKEN or something along those lines
for UABI in other places where we weren't willing to commit to yet?

I suppose if we had to I could make this a sw_sync ioctl instead.  But
OTOH there are kind of a limited # of ways this ioctl could look.  And
we already know that at least some wayland compositors are going to
want this.

I guess I can look at non-igt options.  But the igt test is already a
pretty convenient way to contrive situations (like loops, which is a
thing I need to add)

BR,
-R


> -Daniel
>
> >
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > > ---
> > > >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> > > >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> > > >  2 files changed, 39 insertions(+)
> > > >
> > > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > > index 394e6e1e9686..f295772d5169 100644
> > > > --- a/drivers/dma-buf/sync_file.c
> > > > +++ b/drivers/dma-buf/sync_file.c
> > > > @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > > > +                                     unsigned long arg)
> > > > +{
> > > > +     struct sync_set_deadline ts;
> > > > +
> > > > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     if (ts.pad)
> > > > +             return -EINVAL;
> > > > +
> > > > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > > >                           unsigned long arg)
> > > >  {
> > > > @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > > >       case SYNC_IOC_FILE_INFO:
> > > >               return sync_file_ioctl_fence_info(sync_file, arg);
> > > >
> > > > +     case SYNC_IOC_SET_DEADLINE:
> > > > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > > > +
> > > >       default:
> > > >               return -ENOTTY;
> > > >       }
> > > > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> > > > index ee2dcfb3d660..f67d4ffe7566 100644
> > > > --- a/include/uapi/linux/sync_file.h
> > > > +++ b/include/uapi/linux/sync_file.h
> > > > @@ -67,6 +67,18 @@ struct sync_file_info {
> > > >       __u64   sync_fence_info;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct sync_set_deadline - set a deadline on a fence
> > > > + * @tv_sec:  seconds elapsed since epoch
> > > > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > > > + * @pad:     must be zero
> > > > + */
> > > > +struct sync_set_deadline {
> > > > +     __s64   tv_sec;
> > > > +     __s32   tv_nsec;
> > > > +     __u32   pad;
> > > > +};
> > > > +
> > > >  #define SYNC_IOC_MAGIC               '>'
> > > >
> > > >  /**
> > > > @@ -95,4 +107,12 @@ struct sync_file_info {
> > > >   */
> > > >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> > > >
> > > > +
> > > > +/**
> > > > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > > > + *
> > > > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> > > > + */
> > > > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > > > +
> > > >  #endif /* _UAPI_LINUX_SYNC_H */
> > > > --
> > > > 2.31.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
