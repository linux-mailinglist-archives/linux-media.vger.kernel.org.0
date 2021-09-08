Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088D7403EFC
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 20:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348537AbhIHSUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 14:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbhIHSUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 14:20:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74C5C061575;
        Wed,  8 Sep 2021 11:19:25 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x6so4585071wrv.13;
        Wed, 08 Sep 2021 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXWXn5/EqjKqsUkXyCynCYfIWkuXt5M/pVohhlcjXgE=;
        b=Svz+R+W0FLfICEgyXgsfpvWiAydhkXbdEnCtdDBGeRwL7XzZpfZkgVQWTIjAhZp0IE
         3/1nG3DHajwsIvAmpPiYzNG11XP6mOvXWB9RVu1ukwntjswu1nHME+wrjJOIOzLj9L6l
         jp771nsPTQNVGpek4R02PKlTYXqiQAu/oGXDfXsV+bzjS+lh+S69knuqVNCqietJUu82
         FROkKlqNhOO+/iRJXc8nobntNMmpco7Xd7PBMewftPVyWKSpIYeeQAGjIGBIl/rorIT7
         1ktP1Yr9psprxcIV4N1ciRoxNTQjaBzktuaGVfMyAdJ0HpU4Qn30TG1S1BPDrafABQk4
         8Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXWXn5/EqjKqsUkXyCynCYfIWkuXt5M/pVohhlcjXgE=;
        b=wvreZlUhG9Wjn3l4oW5LtSSD5IiWbbV0/g6JQILSqzAXER4RdLiB3syEvZMJrKmzmq
         Bes3Ea5xokpUW6fd8EUNtsx5wE6yg4Yfql1YESbCI0WAXjpsDRCVYmDyMxj3JfX3KcQe
         NHUyTaMkdVEjjomVhoCrfGAkaSWnbFdZ+TOo7AvOvBDr6D0b6JLXWgWYtZGxklS+7/A/
         gqsf66ofQK/fyBCbGvp+pZ/Yg/CSLsrxBF2iJsQDI8OE7hRTjvcEWaQb51NeCZsCaFIt
         dhjHEfOTZpQ7koyUEnFZYa3ny41pDW7lrwmdENk/ixzCTiXXe0EnMuP1nQGrCCNaekk0
         erTA==
X-Gm-Message-State: AOAM532zwpHEK1qqSlYV0PTtZArVAon7B6u9gfQ5964/ZJOAu6Ab4YtB
        NZOHVdJ3dwl4sWarvffIzjB2yjuyaNn0X7KUGlc=
X-Google-Smtp-Source: ABdhPJwQ5AsT4txkrgjZ6JJAtbh67NxBAfD3WXyCFZPIaMwYnA0mrUaPvbdi3dta/paPYMKnHC45d3U45+fYwUqjrbE=
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr5578824wrn.251.1631125164315;
 Wed, 08 Sep 2021 11:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-9-robdclark@gmail.com>
 <YTj36NbUNxnn6uBU@phenom.ffwll.local>
In-Reply-To: <YTj36NbUNxnn6uBU@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Sep 2021 11:23:42 -0700
Message-ID: <CAF6AEGuVkHOvOkVHo69fOy71qiBh=12Nd=yMXm36p_bjzfFe9A@mail.gmail.com>
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

On Wed, Sep 8, 2021 at 10:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Sep 03, 2021 at 11:47:59AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The initial purpose is for igt tests, but this would also be useful for
> > compositors that wait until close to vblank deadline to make decisions
> > about which frame to show.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Needs userspace and I think ideally also some igts to make sure it works
> and doesn't go boom.

See cover-letter.. there are igt tests, although currently that is the
only user.

I'd be ok to otherwise initially restrict this and the sw_sync UABI
(CAP_SYS_ADMIN?  Or??) until there is a non-igt user, but they are
both needed by the igt tests

BR,
-R

> -Daniel
>
> > ---
> >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > index 394e6e1e9686..f295772d5169 100644
> > --- a/drivers/dma-buf/sync_file.c
> > +++ b/drivers/dma-buf/sync_file.c
> > @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
> >       return ret;
> >  }
> >
> > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > +                                     unsigned long arg)
> > +{
> > +     struct sync_set_deadline ts;
> > +
> > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > +             return -EFAULT;
> > +
> > +     if (ts.pad)
> > +             return -EINVAL;
> > +
> > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> > +
> > +     return 0;
> > +}
> > +
> >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >                           unsigned long arg)
> >  {
> > @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
> >       case SYNC_IOC_FILE_INFO:
> >               return sync_file_ioctl_fence_info(sync_file, arg);
> >
> > +     case SYNC_IOC_SET_DEADLINE:
> > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> > index ee2dcfb3d660..f67d4ffe7566 100644
> > --- a/include/uapi/linux/sync_file.h
> > +++ b/include/uapi/linux/sync_file.h
> > @@ -67,6 +67,18 @@ struct sync_file_info {
> >       __u64   sync_fence_info;
> >  };
> >
> > +/**
> > + * struct sync_set_deadline - set a deadline on a fence
> > + * @tv_sec:  seconds elapsed since epoch
> > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > + * @pad:     must be zero
> > + */
> > +struct sync_set_deadline {
> > +     __s64   tv_sec;
> > +     __s32   tv_nsec;
> > +     __u32   pad;
> > +};
> > +
> >  #define SYNC_IOC_MAGIC               '>'
> >
> >  /**
> > @@ -95,4 +107,12 @@ struct sync_file_info {
> >   */
> >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> >
> > +
> > +/**
> > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > + *
> > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> > + */
> > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > +
> >  #endif /* _UAPI_LINUX_SYNC_H */
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
