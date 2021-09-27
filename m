Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF71F419670
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 16:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbhI0OdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 10:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234782AbhI0OdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 10:33:12 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55187C061575;
        Mon, 27 Sep 2021 07:31:34 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id t16-20020a1c7710000000b003049690d882so762544wmi.5;
        Mon, 27 Sep 2021 07:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2mx71Ffj1LjI9dbNVEsMItvt4/c01TG+6Jn8XnjJkBA=;
        b=BnaCahteDxcsbqrbdc5Zu34nF/xoU1HeKj99e5MrhXbRLBb3eohTmHduzQ7Bvv7PlJ
         iHImPDIK81GUnxugHpzukmeRIYtnjuF2BfEtv4pVQhEVhr7Ow4OOhUq/+F6vItMlWsvV
         zbr7YpC6iVLD1oCoe+jdqBM4W7Y7IJr4Fc4deyeupJskOQkQprR4XLaTljPNIEIB0J/+
         jFD9iHjiKIpvH4ZRA741zvzAIMY1yB8HRvKOJGRbxRpxx44OKJ5O4j7e52tiGSRp88Ta
         a69wmF3jlTlNkSveRuD+7ERqrjt1l5BCsW6ZWTb4LXuoqgkviyhmSx3ZNNIiViQPxbb2
         cHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2mx71Ffj1LjI9dbNVEsMItvt4/c01TG+6Jn8XnjJkBA=;
        b=FW1SeFGStxIZCEDDKmBHqblXeO94DGzj5z+dgQ9QCld/fI2btGbM6RsfU4vmaVTAx6
         De5Mk7esFW07Gkldha5YbQTcP5XkP8VaK5pIUsAft71YrbDyKPQFSSYnLSv6fjv4Ya0H
         MODFTFbuClmMxVDDBmz3jVBPBhW6yBrwLWmGd4v+w3YEoT/zu+tmGF7D0nBzEXGDFS+H
         BoIAqeJhUKEXgU883FEHBdN76dDyluFfk2LixNkkO1pbn6gzqloliSc2Sk93GLxK4y/U
         PUuJ49/wpt9a+0dg7B2KEzCHpD34SgJTnDDQ72b86+ijaxc5qFjN99YaUowj4eo924R8
         h/uw==
X-Gm-Message-State: AOAM531jZNL2yUQhFkIbMwShcpZGBo9oC8E0pqv9EjF17Ak3x76/KEFk
        iOmwt/y+Z7XNaNg+Nofr3OWypimTcVxv7sxNj4U=
X-Google-Smtp-Source: ABdhPJxaMT5Ib0z3brv9yjSkdXxNC2Ep4DW2qUvpXe/nYwrumdJt3grX8mjdTKUoXXZV+xNfgBGfnHDh99X4mtG/+Wc=
X-Received: by 2002:a1c:f201:: with SMTP id s1mr4139651wmc.101.1632753092855;
 Mon, 27 Sep 2021 07:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-9-robdclark@gmail.com>
 <20210927114201.1f8fdc17@eldfell>
In-Reply-To: <20210927114201.1f8fdc17@eldfell>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 27 Sep 2021 07:36:05 -0700
Message-ID: <CAF6AEGudjfgN+x_KxyED+1XBod7yNqLN43or7vs8h7UKQmzK7Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
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

On Mon, Sep 27, 2021 at 1:42 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri,  3 Sep 2021 11:47:59 -0700
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The initial purpose is for igt tests, but this would also be useful for
> > compositors that wait until close to vblank deadline to make decisions
> > about which frame to show.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
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
>
> Hi Rob,
>
> I think you need to specify which clock this timestamp must be in.
>
> Which epoch? Sounds a bit like CLOCK_REALTIME to me which would not
> make sense.

It should be monotonic.. same clock as is used for vblank timestamps,
which I assume that would be the most straightforward thing for
compositors to use

BR,
-R

> Also I cannot guess how a compositor should be using this, so
> explaining the expected usage would be really good, with reasons for
> why should userspace bother.
>
>
> Thanks,
> pq
>
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
>
