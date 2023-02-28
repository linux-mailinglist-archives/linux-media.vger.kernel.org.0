Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD5E6A5FEE
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 20:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjB1TsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 14:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjB1TsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 14:48:13 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3BE1C302;
        Tue, 28 Feb 2023 11:48:11 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bm20so8993073oib.7;
        Tue, 28 Feb 2023 11:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677613691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6AWgk38+dTcU1+mejGb2/o+ftP8MTujuhC/3B4ExDQ=;
        b=ige+8up2DEpf5jbuZZLbqAXPllK21I8pU7z6B62/+rsiqOUHgf+tPXTEf+e1slNMgu
         i2cYxHHAkwFZjGq8mzku6wjj2KNMMtvD5Bj/MKrCrbe7OOsHTeuVfdoOeDdLnmzCW5Eq
         0IS938xQdPcLDKNCTK6c7ZQr4hIWBFvPFqZ0w8ssnsTKGbWqFc3/HQnTA/BztQCNO8Ng
         MDZRmbzYiV1mKcbQFlPfNi3Fn7G/a9kkC7gOMoeP5uM35tmn+t+pchgqdWE7BwmjyVuQ
         KDz3y5HhklWDT2WVZOYY5hfICg7iyZ9HgSNBqoCCO+QfpyQWPcVTlfg0NfVVnwN/Bf/S
         bC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677613691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6AWgk38+dTcU1+mejGb2/o+ftP8MTujuhC/3B4ExDQ=;
        b=XdN3K0ls5RDMs6rheszXzB+SiR4k+CVZ6kQUHxUxJUXFSRDQjz1jY2H5ZQVPJYJlZG
         CtDYLcGGfOUdxVRm/fF1U7MtyPGDOx7cVUMxbl8XlfjAdFDYsxUWx8kmpxwmw5T1xtr8
         Za/Jlp9UOgWKHYgpI41mYEI+ddjQ4r1PYfOZXxw/B1YFzrkmggD8UmMBv17gSvnuPzbL
         FbHgNR5CCxx0trSEV/0HLH/LxmLkxwE6b+oKCi76pOE67ekD5tWHYwDTnCMmb1WF+ZlS
         rCLcFmFcXybBdUFHX/inGvDrojY7hGhqWYa5iUly6wm+pKiqquvqqZ4OR7tcNQET0Cii
         dzxg==
X-Gm-Message-State: AO0yUKVqdhhyIIrem5oLTrrlU9kFXvR+4kjX/VRBa8PdC9S7dCwf2hcp
        bclYZciizBbLgCF6y1I7Q0nxKCaQp1acANZo4QQ=
X-Google-Smtp-Source: AK7set9keJVYa+i1zqh5jp2cnA3sA6/AAsEU28TAnr0uVeyTvTrcT5iO0UESk31AobEWgbOlPb04AX6066Qk2dlbA5k=
X-Received: by 2002:a05:6808:1cf:b0:384:253:642d with SMTP id
 x15-20020a05680801cf00b003840253642dmr1372513oic.3.1677613690814; Tue, 28 Feb
 2023 11:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20230227193535.2822389-1-robdclark@gmail.com> <20230227193535.2822389-8-robdclark@gmail.com>
 <20230228112310.39274fcf@eldfell>
In-Reply-To: <20230228112310.39274fcf@eldfell>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 28 Feb 2023 11:47:59 -0800
Message-ID: <CAF6AEGve4Jx-TJZe_+PF4ekyBzCzxZBdwMeGQ1WoRawwX1tsxg@mail.gmail.com>
Subject: Re: [PATCH v7 07/15] dma-buf/sw_sync: Add fence deadline support
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Simon Ser <contact@emersion.fr>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 28, 2023 at 1:23 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 27 Feb 2023 11:35:13 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This consists of simply storing the most recent deadline, and adding an
> > ioctl to retrieve the deadline.  This can be used in conjunction with
> > the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
> > sw_sync fences, merge them into a fence-array, set deadline on the
> > fence-array and confirm that it is propagated properly to each fence.
> >
> > v2: Switch UABI to express deadline as u64
> > v3: More verbose UAPI docs, show how to convert from timespec
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >  drivers/dma-buf/sw_sync.c      | 58 ++++++++++++++++++++++++++++++++++
> >  drivers/dma-buf/sync_debug.h   |  2 ++
> >  include/uapi/linux/sync_file.h |  6 +++-
> >  3 files changed, 65 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 348b3a9170fa..3e2315ee955b 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -52,12 +52,28 @@ struct sw_sync_create_fence_data {
> >       __s32   fence; /* fd of new fence */
> >  };
> >
> > +/**
> > + * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fe=
nce
> > + * @deadline_ns: absolute time of the deadline
> > + * @pad:     must be zero
> > + * @fence_fd:        the sw_sync fence fd (in)
> > + *
> > + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
>
> Hi,
>
> the commit message explains this returns the "most recent" deadline,
> but the doc here forgets to mention that. I suppose that means the
> most recently set deadline and not the deadline furthest forward in
> time (largest value).
>
> Is "most recent" the appropriate behaviour when multiple deadlines have
> been set? Would you not want the earliest deadline set so far instead?

It's not what a "normal" implementation of ->set_deadline() would do.
But it was useful for determining that the deadline propagates
correctly through composite (array/chain) fences.

I guess I could change the test to work with a more normal
->set_deadline() implementation (which would just track the nearest
(in time) deadline).

> What if none has been set?

you'd get zero.. I suppose I could make it return an error instead..

BR,
-R

> > + */
> > +struct sw_sync_get_deadline {
> > +     __u64   deadline_ns;
> > +     __u32   pad;
> > +     __s32   fence_fd;
> > +};
> > +
> >  #define SW_SYNC_IOC_MAGIC    'W'
> >
> >  #define SW_SYNC_IOC_CREATE_FENCE     _IOWR(SW_SYNC_IOC_MAGIC, 0,\
> >               struct sw_sync_create_fence_data)
> >
> >  #define SW_SYNC_IOC_INC                      _IOW(SW_SYNC_IOC_MAGIC, 1=
, __u32)
> > +#define SW_SYNC_GET_DEADLINE         _IOWR(SW_SYNC_IOC_MAGIC, 2, \
> > +             struct sw_sync_get_deadline)
> >
> >  static const struct dma_fence_ops timeline_fence_ops;
> >
> > @@ -171,6 +187,13 @@ static void timeline_fence_timeline_value_str(stru=
ct dma_fence *fence,
> >       snprintf(str, size, "%d", parent->value);
> >  }
> >
> > +static void timeline_fence_set_deadline(struct dma_fence *fence, ktime=
_t deadline)
> > +{
> > +     struct sync_pt *pt =3D dma_fence_to_sync_pt(fence);
> > +
> > +     pt->deadline =3D deadline;
> > +}
> > +
> >  static const struct dma_fence_ops timeline_fence_ops =3D {
> >       .get_driver_name =3D timeline_fence_get_driver_name,
> >       .get_timeline_name =3D timeline_fence_get_timeline_name,
> > @@ -179,6 +202,7 @@ static const struct dma_fence_ops timeline_fence_op=
s =3D {
> >       .release =3D timeline_fence_release,
> >       .fence_value_str =3D timeline_fence_value_str,
> >       .timeline_value_str =3D timeline_fence_timeline_value_str,
> > +     .set_deadline =3D timeline_fence_set_deadline,
> >  };
> >
> >  /**
> > @@ -387,6 +411,37 @@ static long sw_sync_ioctl_inc(struct sync_timeline=
 *obj, unsigned long arg)
> >       return 0;
> >  }
> >
> > +static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsig=
ned long arg)
> > +{
> > +     struct sw_sync_get_deadline data;
> > +     struct dma_fence *fence;
> > +     struct sync_pt *pt;
> > +
> > +     if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     if (data.deadline_ns || data.pad)
> > +             return -EINVAL;
> > +
> > +     fence =3D sync_file_get_fence(data.fence_fd);
> > +     if (!fence)
> > +             return -EINVAL;
> > +
> > +     pt =3D dma_fence_to_sync_pt(fence);
> > +     if (!pt)
> > +             return -EINVAL;
> > +
> > +
> > +     data.deadline_ns =3D ktime_to_ns(pt->deadline);
> > +
> > +     dma_fence_put(fence);
> > +
> > +     if (copy_to_user((void __user *)arg, &data, sizeof(data)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> >  static long sw_sync_ioctl(struct file *file, unsigned int cmd,
> >                         unsigned long arg)
> >  {
> > @@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsign=
ed int cmd,
> >       case SW_SYNC_IOC_INC:
> >               return sw_sync_ioctl_inc(obj, arg);
> >
> > +     case SW_SYNC_GET_DEADLINE:
> > +             return sw_sync_ioctl_get_deadline(obj, arg);
> > +
> >       default:
> >               return -ENOTTY;
> >       }
> > diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.=
h
> > index 6176e52ba2d7..2e0146d0bdbb 100644
> > --- a/drivers/dma-buf/sync_debug.h
> > +++ b/drivers/dma-buf/sync_debug.h
> > @@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_paren=
t(struct dma_fence *fence)
> >   * @base: base fence object
> >   * @link: link on the sync timeline's list
> >   * @node: node in the sync timeline's tree
> > + * @deadline: the most recently set fence deadline
> >   */
> >  struct sync_pt {
> >       struct dma_fence base;
> >       struct list_head link;
> >       struct rb_node node;
> > +     ktime_t deadline;
> >  };
> >
> >  extern const struct file_operations sw_sync_debugfs_fops;
> > diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_f=
ile.h
> > index 49325cf6749b..dc6645b2598b 100644
> > --- a/include/uapi/linux/sync_file.h
> > +++ b/include/uapi/linux/sync_file.h
> > @@ -72,7 +72,11 @@ struct sync_file_info {
> >   * @deadline_ns: absolute time of the deadline
> >   * @pad:     must be zero
> >   *
> > - * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> > + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank). =
 For
> > + * example:
> > + *
> > + *     clock_gettime(CLOCK_MONOTONIC, &t);
> > + *     deadline_ns =3D (t.tv_sec * 1000000000L) + t.tv_nsec + duration=
_ns
>
> Shouldn't this hunk be in patch 5 instead?
>
> What's duration_ns? Maybe ns_until_my_deadline would be more clear that
> it is something userspace freely chooses?
>
> >   */
> >  struct sync_set_deadline {
> >       __u64   deadline_ns;
>
>
> Thanks,
> pq
