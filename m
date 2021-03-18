Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF852340071
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 08:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhCRHuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 03:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCRHta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 03:49:30 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB879C061760
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 00:49:29 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id l5so4026951ilv.9
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCGPp7xDgIEFGVnmOfTAwVRTBXg0JrC/tTvPITi4f4U=;
        b=Q828CewOTb5/edKwMjw+KtXXkAy1ua1h453tHFrXPdbm6rJgTVfTO8iTUhBnwcDGjV
         koPxrFJ90TvVOlRCqBlR6bslYADcKfjUjMhkd4U2jnHY3XWvFBjieegce0LFjCHLuPvr
         eBEeB8n82yX7wVmGMYnwyM3fx9GcIiwIoUjo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCGPp7xDgIEFGVnmOfTAwVRTBXg0JrC/tTvPITi4f4U=;
        b=t7X+HwEIIOw1KzA8tkvuwIi85DUSJmILzQUyhLcM1C8NzCa62sBhoirarbK9y37z+t
         qZcVSaXJJ4cGJYuR/E0fXib+NFhRLiW3tL8/iMUmnv9qFsbB0MDhhDng3+a/a62j6fu3
         mHTckttWb97zvFC+PlYai6wq98O9Vhq1PLYUW1qOUm/h5YFeeX8uVtDN2zgbfsuTPlGF
         +AtIYIg8+8kYW3Y8SPK9AX3mYimUnyxfSTYdptuCVqgkPEDaJF6CluYOp63mwuLxjnCC
         iQIWoU1PAvF8+WJ2rv7lPvp9+gLFz3wnk+ro1PSQkqhL1mJv3MtYEXgpaA3PUzavO5WB
         OvmQ==
X-Gm-Message-State: AOAM533Fh/3g+v79GkFmcBIMai1JdbjIZFbKzxMmIvUGw3Zonwi4fOeW
        DRDHJITulGJxa9glOlJjbHunyC40xQJsggsi
X-Google-Smtp-Source: ABdhPJxjd75DI6hminbB80P2DCnXoxHCoAOiMquqFq9/KeT+Fc6ZiHLlq+XJ8tEdKwKZkgNdFGzmxw==
X-Received: by 2002:a92:b003:: with SMTP id x3mr10948010ilh.15.1616053768886;
        Thu, 18 Mar 2021 00:49:28 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id h193sm690850iof.9.2021.03.18.00.49.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 00:49:28 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id 19so4029224ilj.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 00:49:28 -0700 (PDT)
X-Received: by 2002:a92:c545:: with SMTP id a5mr10880851ilj.89.1616053767662;
 Thu, 18 Mar 2021 00:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210317164511.39967-1-ribalda@chromium.org> <20210317164511.39967-2-ribalda@chromium.org>
 <f07a5767-fced-18af-8219-6e54b83a785d@xs4all.nl> <CANiDSCs+xc-nMksdZVZq4Z3mn=wd8rD14AhXOiup3D95sO50xg@mail.gmail.com>
 <e6273f17-cd0d-7fe5-bfc1-3827c2fbc82e@xs4all.nl>
In-Reply-To: <e6273f17-cd0d-7fe5-bfc1-3827c2fbc82e@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 18 Mar 2021 08:49:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCvtOhr0Q-_SYZ1=1naP5WYM+j_c-ghE5qMQ0ERNGq9q8Q@mail.gmail.com>
Message-ID: <CANiDSCvtOhr0Q-_SYZ1=1naP5WYM+j_c-ghE5qMQ0ERNGq9q8Q@mail.gmail.com>
Subject: Re: [PATCH v6 01/17] media: v4l2-ioctl: check_ext_ctrls: Fix
 multiclass V4L2_CTRL_WHICH_DEF_VAL
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, Mar 18, 2021 at 8:48 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 18/03/2021 08:17, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > Can I merge 1-3, but leave 4 as a separate one? It helps to tell a
> > story for 5 and  6.
>
> I really prefer it as a single patch. All four patches are basically a single big fix
> for v4l2-ioctl.c where the code for drivers that do not use the control framework had
> become very outdated. Fixing it in a single patch helps backporting to stable, and
> it is easier to review and see everything that had to be done to fix this.
>
> In this case I wondered when I was reviewing patch 1 why V4L2_CTRL_WHICH_DEF_VAL was
> just accepted without checking for S/TRY_EXT_CTRLS. Basically patch 1 is a broken fix
> w.r.t. DEF_VAL until patch 4, which really fixes it.
>
> Just do it all in a single patch, splitting it up doesn't work in this particular case.

Ok, thanks for the clarification :)
>
> Regards,
>
>         Hans
>
> >
> > Thanks
> >
> > On Thu, Mar 18, 2021 at 8:14 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 17/03/2021 17:44, Ricardo Ribalda wrote:
> >>> Drivers that do not use the ctrl-framework use this function instead.
> >>>
> >>> - Do not check for multiple classes when getting the DEF_VAL.
> >>>
> >>> Fixes v4l2-compliance:
> >>> Control ioctls (Input 0):
> >>>               fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
> >>>       test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >>
> >> Can you merge patches 1-4 into a single patch? It's really one big fix since
> >> this code was never updated when new 'which' values were added. So keeping it
> >> together is, for once, actually preferred.
> >>
> >> You can add my:
> >>
> >> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> after these 4 patches are merged. It looks much nicer now.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: 6fa6f831f095 ("media: v4l2-ctrls: add core request support")
> >>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-ioctl.c | 47 ++++++++++++++++------------
> >>>  1 file changed, 27 insertions(+), 20 deletions(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> index 31d1342e61e8..403f957a1012 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -908,7 +908,7 @@ static void v4l_print_default(const void *arg, bool write_only)
> >>>       pr_cont("driver-specific ioctl\n");
> >>>  }
> >>>
> >>> -static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
> >>> +static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
> >>>  {
> >>>       __u32 i;
> >>>
> >>> @@ -917,23 +917,30 @@ static int check_ext_ctrls(struct v4l2_ext_controls *c, int allow_priv)
> >>>       for (i = 0; i < c->count; i++)
> >>>               c->controls[i].reserved2[0] = 0;
> >>>
> >>> -     /* V4L2_CID_PRIVATE_BASE cannot be used as control class
> >>> -        when using extended controls.
> >>> -        Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
> >>> -        is it allowed for backwards compatibility.
> >>> -      */
> >>> -     if (!allow_priv && c->which == V4L2_CID_PRIVATE_BASE)
> >>> -             return 0;
> >>> -     if (!c->which)
> >>> -             return 1;
> >>> +     switch (c->which) {
> >>> +     case V4L2_CID_PRIVATE_BASE:
> >>> +             /*
> >>> +              * V4L2_CID_PRIVATE_BASE cannot be used as control class
> >>> +              * when using extended controls.
> >>> +              * Only when passed in through VIDIOC_G_CTRL and VIDIOC_S_CTRL
> >>> +              * is it allowed for backwards compatibility.
> >>> +              */
> >>> +             if (ioctl == VIDIOC_G_CTRL || ioctl == VIDIOC_S_CROP)
> >>> +                     return false;
> >>> +             break;
> >>> +     case V4L2_CTRL_WHICH_DEF_VAL:
> >>> +     case V4L2_CTRL_WHICH_CUR_VAL:
> >>> +             return true;
> >>> +     }
> >>> +
> >>>       /* Check that all controls are from the same control class. */
> >>>       for (i = 0; i < c->count; i++) {
> >>>               if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
> >>>                       c->error_idx = i;
> >>> -                     return 0;
> >>> +                     return false;
> >>>               }
> >>>       }
> >>> -     return 1;
> >>> +     return true;
> >>>  }
> >>>
> >>>  static int check_fmt(struct file *file, enum v4l2_buf_type type)
> >>> @@ -2229,7 +2236,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
> >>>       ctrls.controls = &ctrl;
> >>>       ctrl.id = p->id;
> >>>       ctrl.value = p->value;
> >>> -     if (check_ext_ctrls(&ctrls, 1)) {
> >>> +     if (check_ext_ctrls(&ctrls, VIDIOC_G_CTRL)) {
> >>>               int ret = ops->vidioc_g_ext_ctrls(file, fh, &ctrls);
> >>>
> >>>               if (ret == 0)
> >>> @@ -2263,7 +2270,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
> >>>       ctrls.controls = &ctrl;
> >>>       ctrl.id = p->id;
> >>>       ctrl.value = p->value;
> >>> -     if (check_ext_ctrls(&ctrls, 1))
> >>> +     if (check_ext_ctrls(&ctrls, VIDIOC_S_CTRL))
> >>>               return ops->vidioc_s_ext_ctrls(file, fh, &ctrls);
> >>>       return -EINVAL;
> >>>  }
> >>> @@ -2285,8 +2292,8 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> >>>                                       vfd, vfd->v4l2_dev->mdev, p);
> >>>       if (ops->vidioc_g_ext_ctrls == NULL)
> >>>               return -ENOTTY;
> >>> -     return check_ext_ctrls(p, 0) ? ops->vidioc_g_ext_ctrls(file, fh, p) :
> >>> -                                     -EINVAL;
> >>> +     return check_ext_ctrls(p, VIDIOC_G_EXT_CTRLS) ?
> >>> +                             ops->vidioc_g_ext_ctrls(file, fh, p) : -EINVAL;
> >>>  }
> >>>
> >>>  static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> >>> @@ -2306,8 +2313,8 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> >>>                                       vfd, vfd->v4l2_dev->mdev, p);
> >>>       if (ops->vidioc_s_ext_ctrls == NULL)
> >>>               return -ENOTTY;
> >>> -     return check_ext_ctrls(p, 0) ? ops->vidioc_s_ext_ctrls(file, fh, p) :
> >>> -                                     -EINVAL;
> >>> +     return check_ext_ctrls(p, VIDIOC_S_EXT_CTRLS) ?
> >>> +                             ops->vidioc_s_ext_ctrls(file, fh, p) : -EINVAL;
> >>>  }
> >>>
> >>>  static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> >>> @@ -2327,8 +2334,8 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> >>>                                         vfd, vfd->v4l2_dev->mdev, p);
> >>>       if (ops->vidioc_try_ext_ctrls == NULL)
> >>>               return -ENOTTY;
> >>> -     return check_ext_ctrls(p, 0) ? ops->vidioc_try_ext_ctrls(file, fh, p) :
> >>> -                                     -EINVAL;
> >>> +     return check_ext_ctrls(p, VIDIOC_TRY_EXT_CTRLS) ?
> >>> +                     ops->vidioc_try_ext_ctrls(file, fh, p) : -EINVAL;
> >>>  }
> >>>
> >>>  /*
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda
