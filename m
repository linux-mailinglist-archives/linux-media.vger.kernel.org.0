Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894C5403F45
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 20:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350335AbhIHSvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 14:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348289AbhIHSvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 14:51:02 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA47C061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 11:49:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id g16so4756223wrb.3
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Agej1UpQhMlzZlUynlcP0AacuesowFLmK/jfqh//Tc=;
        b=GEwoJ4yP3BIHmNDyjyrr2wFPQZIUwC/WOiYJjW8klI585PFI8rsUPHzrS8d0jh/3d7
         LtF3wMbCGpmb6yJt+FDmMqpXEZ7xjRokRLACCHMiqdTIOHTHUnTSAQbn8TZKd7qNB+ac
         4PosfkBG9PtKUdiDjBDDmkmTdcRrPEjTnQP4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=4Agej1UpQhMlzZlUynlcP0AacuesowFLmK/jfqh//Tc=;
        b=PUj7ghjC6+6aVxo8HmkijxUJL4La2YOIYWuqnja5SG4yUN3mgiurqLooDumY/uGxpb
         2fX9enUxJYh3z1oG0bEiL+eDTOM3YyK7D9vSncJ7Cp+K5iUUEy0+N5+GuvyOH0QHX9NJ
         Y12IZ8BfZ7tXlHfCHX6yEokxSqd85yhop0Mvo+uj6O7fWQMaL3ZdmJxK+8Lez+ZZKW2t
         zODGsEyqp/PUaTDdJ/QVb+HjB7fBPpcp9FRivvXo+zUV3smDQTG3MWcCpAerjTi7oUeJ
         Zx/jnWIRqU6V1F2WfwGUY7XFXWnrRso8fpMadtsPCtga9wSLQIHwMDIqjpO8w4eKL5gd
         I0Mg==
X-Gm-Message-State: AOAM530xQ8bH9mJgozjjxKrxIllSxhWIwEZEoV9iEEgcXFLM9oUaNlXl
        k2dVlL+XCn00PZYCc8TOSXywZQ==
X-Google-Smtp-Source: ABdhPJwa5zPNpbxcNhJoOYO6pSJAqT/4uA/ZFd6XhfTDNelaBwEo+F/jtz6SLgBDyu24uXIQZhmMNg==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr232471wro.339.1631126992942;
        Wed, 08 Sep 2021 11:49:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c4sm3479357wme.14.2021.09.08.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:49:52 -0700 (PDT)
Date:   Wed, 8 Sep 2021 20:49:50 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <YTkFzjs3cEvPcCzn@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
 <YTj36NbUNxnn6uBU@phenom.ffwll.local>
 <CAF6AEGuVkHOvOkVHo69fOy71qiBh=12Nd=yMXm36p_bjzfFe9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuVkHOvOkVHo69fOy71qiBh=12Nd=yMXm36p_bjzfFe9A@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 08, 2021 at 11:23:42AM -0700, Rob Clark wrote:
> On Wed, Sep 8, 2021 at 10:50 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Sep 03, 2021 at 11:47:59AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The initial purpose is for igt tests, but this would also be useful for
> > > compositors that wait until close to vblank deadline to make decisions
> > > about which frame to show.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Needs userspace and I think ideally also some igts to make sure it works
> > and doesn't go boom.
> 
> See cover-letter.. there are igt tests, although currently that is the
> only user.

Ah sorry missed that. It would be good to record that in the commit too
that adds the uapi. git blame doesn't find cover letters at all, unlike on
gitlab where you get the MR request with everything.

Ok there is the Link: thing, but since that only points at the last
version all the interesting discussion is still usually lost, so I tend to
not bother looking there.

> I'd be ok to otherwise initially restrict this and the sw_sync UABI
> (CAP_SYS_ADMIN?  Or??) until there is a non-igt user, but they are
> both needed by the igt tests

Hm really awkward, uapi for igts in cross vendor stuff like this isn't
great. I think hiding it in vgem is semi-ok (we have fences there
already). But it's all a bit silly ...

For the tests, should we instead have a selftest/Kunit thing to exercise
this stuff? igt probably not quite the right thing. Or combine with a page
flip if you want to test msm.
-Daniel

> 
> BR,
> -R
> 
> > -Daniel
> >
> > > ---
> > >  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
> > >  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
> > >  2 files changed, 39 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> > > index 394e6e1e9686..f295772d5169 100644
> > > --- a/drivers/dma-buf/sync_file.c
> > > +++ b/drivers/dma-buf/sync_file.c
> > > @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
> > >       return ret;
> > >  }
> > >
> > > +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> > > +                                     unsigned long arg)
> > > +{
> > > +     struct sync_set_deadline ts;
> > > +
> > > +     if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> > > +             return -EFAULT;
> > > +
> > > +     if (ts.pad)
> > > +             return -EINVAL;
> > > +
> > > +     dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nsec));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > >                           unsigned long arg)
> > >  {
> > > @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsigned int cmd,
> > >       case SYNC_IOC_FILE_INFO:
> > >               return sync_file_ioctl_fence_info(sync_file, arg);
> > >
> > > +     case SYNC_IOC_SET_DEADLINE:
> > > +             return sync_file_ioctl_set_deadline(sync_file, arg);
> > > +
> > >       default:
> > >               return -ENOTTY;
> > >       }
> > > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
> > > index ee2dcfb3d660..f67d4ffe7566 100644
> > > --- a/include/uapi/linux/sync_file.h
> > > +++ b/include/uapi/linux/sync_file.h
> > > @@ -67,6 +67,18 @@ struct sync_file_info {
> > >       __u64   sync_fence_info;
> > >  };
> > >
> > > +/**
> > > + * struct sync_set_deadline - set a deadline on a fence
> > > + * @tv_sec:  seconds elapsed since epoch
> > > + * @tv_nsec: nanoseconds elapsed since the time given by the tv_sec
> > > + * @pad:     must be zero
> > > + */
> > > +struct sync_set_deadline {
> > > +     __s64   tv_sec;
> > > +     __s32   tv_nsec;
> > > +     __u32   pad;
> > > +};
> > > +
> > >  #define SYNC_IOC_MAGIC               '>'
> > >
> > >  /**
> > > @@ -95,4 +107,12 @@ struct sync_file_info {
> > >   */
> > >  #define SYNC_IOC_FILE_INFO   _IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> > >
> > > +
> > > +/**
> > > + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> > > + *
> > > + * Allows userspace to set a deadline on a fence, see dma_fence_set_deadline()
> > > + */
> > > +#define SYNC_IOC_SET_DEADLINE        _IOW(SYNC_IOC_MAGIC, 5, struct sync_set_deadline)
> > > +
> > >  #endif /* _UAPI_LINUX_SYNC_H */
> > > --
> > > 2.31.1
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
