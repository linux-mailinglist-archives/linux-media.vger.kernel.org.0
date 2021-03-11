Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969CD337365
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbhCKNGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233188AbhCKNG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:06:28 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D6BC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:06:28 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id o11so21856269iob.1
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+/DWBqgadw7DhepiYVtNdn94sHjgYOG+QzbTsv1k+w=;
        b=cwg6O8tDP0ehYdmtpVNm0csu+3EM1uyxmxD8IcRuvLkWrNltqOAT3NVpoGmiaT2z0U
         WSLmULvD/wH4li/P3tvjZWQCbOU7qp10n1c5zi3uququ0Qvx/JXhWGo2QP5d+SWGC4sJ
         1TF409PIw+vkV96IraCAzqHs69VBOP69aAgPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+/DWBqgadw7DhepiYVtNdn94sHjgYOG+QzbTsv1k+w=;
        b=gUx5N6pwUPSv5YfeJk56XV1AoBaWWnrCj0TyJEGWFcgtdj4LhaF/lxD4ANRT+X3vu6
         xaWsXDIiFBc6Vhy9Nxxz0zs0Vppxyh3D8TYgDlHBjk9HVq4ya+SWwZSGWjTXeRZmmCdF
         PI3hSKNoTwaO1VPTIlrL6226wm7Ds4mEeIMU/qnek0wokqYxFPl0HDCha+dbc/NzNgGL
         gTRAZBxWkJKpBBt7qODwiDCL6Fd/ZP+estZPO3GjiB6A6F0Gr4C/gAR/N9OURou3KRJm
         7G/0uF/SQjkqaZ8eBsXz3zZ3Lk5oe9tDjqVO904trcDQzQjB2/jI4UaLAEfRu2N7VcQ9
         N3+Q==
X-Gm-Message-State: AOAM532kFBtB0r2dmpMXUC3LZzc4Yf/IXJf/fT4SFyLYw0eBaQ8dcWuQ
        1dWTaEOZDny/5QBFfPfR2sX7pOpbM00o4Q==
X-Google-Smtp-Source: ABdhPJz/3BZvs9GRTmICsPE5YaDE+AZtvSE8ifTjlylsXgV7ezR50sWtZsV5CrbW/+RqTNmMBlLf+A==
X-Received: by 2002:a05:6638:91:: with SMTP id v17mr3444707jao.69.1615467987834;
        Thu, 11 Mar 2021 05:06:27 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id k8sm1219259ilu.4.2021.03.11.05.06.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 05:06:27 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id i18so18809274ilq.13
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:06:27 -0800 (PST)
X-Received: by 2002:a92:130a:: with SMTP id 10mr32567ilt.71.1615467986894;
 Thu, 11 Mar 2021 05:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20210310212450.1220416-1-ribalda@chromium.org> <cbabd1db-5fda-309b-50bc-8398e8d1580c@xs4all.nl>
In-Reply-To: <cbabd1db-5fda-309b-50bc-8398e8d1580c@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Mar 2021 14:06:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCuCvbYJp8CDKZV7_8dsxxzgUTG--insgLiEwqh2RrQ7Qw@mail.gmail.com>
Message-ID: <CANiDSCuCvbYJp8CDKZV7_8dsxxzgUTG--insgLiEwqh2RrQ7Qw@mail.gmail.com>
Subject: Re: [PATCH] v4l2-compliance: Fix V4L2_CTRL_WHICH_DEF_VAL in multi_classes
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your review!


On Thu, Mar 11, 2021 at 1:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 10/03/2021 22:24, Ricardo Ribalda wrote:
> > If there are multiple classes, the ioctl should fail.
>
> It shouldn't matter if there are multiple classes or not, it should
> work.

I believe this is the part of the kernel that is triggering the issue:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n929

I can send a patch if that is not the intended behaviour ;)

/* Check that all controls are from the same control class. */
for (i = 0; i < c->count; i++) {
if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
c->error_idx = i;
return 0;

>
> What is the exact error you get with which driver?

I am trying to fix uvc compliance

 fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL


>
> Regards,

Best regards!

>
>         Hans
>
> >
> > Fixes: 0884b19adada ("v4l2-compliance: add test for V4L2_CTRL_WHICH_DEF_VAL")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  utils/v4l2-compliance/v4l2-test-controls.cpp | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > index 9a68b7e847b0..79982bc15054 100644
> > --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > @@ -793,7 +793,10 @@ int testExtendedControls(struct node *node)
> >       ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
> >       fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
> >       fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
> > -     fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> > +     if (multiple_classes)
> > +             fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> > +     else
> > +             fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> >       return 0;
> >  }
> >
> >
>


-- 
Ricardo Ribalda
