Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD5D3373A2
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbhCKNUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbhCKNUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:20:00 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51033C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:20:00 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id g9so18883914ilc.3
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GXHl9fSxcmQzeK9YqZgNEbOFQ9SXnwQZIJnbEdymJw=;
        b=fThld/2qZpymVzdehyxtMMrK5ejB7jGm9VZgUGkt2fcv7w7iNJF4+3+08Qjf4dmzo5
         N+dh3vv48LnQIkNT3ua5YJoxotrr7ABpNpIKo7FGxpdIEWHt6mBqdyhl3X7Dxnp/htPr
         qcQkuOmnvI6TwnEixe9+2azTjcDL7Bbu0wjX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GXHl9fSxcmQzeK9YqZgNEbOFQ9SXnwQZIJnbEdymJw=;
        b=KCVxYSJmu14pSj/Lp8Ektwa3bntOx7rRoRG57mMIRgAGsgXnr1hPpXPD327P4QF4dg
         mexJ36ev5Ro0Ll/09Gnq8h4tm6tj2YXFmFK0jxY68/bz1g5YkhQZjx7NpPWpq/f1ysYT
         kcZgzG0JTp1+Wu3ek6YmN+SXbzcQnRXSnSpwlOVmT9ZTMxGs9XkHQA9ND5nMCMfZEOOh
         ebjnCK5iNS8vKCcjXWDpWa4jttKsYooLLPtl1HhYgylqwGEP5Uc9XPu6Vf8CPDfRZMUU
         OGLSi/4AmwGrPRxyQ04Pbu85OZJnteBojNsIH1HzuURP/wb4F+tF6+EXVR1xZWeveF+2
         KGYg==
X-Gm-Message-State: AOAM533aWXv14ueBR3La3oIOFWcT0HurA2am3yau0T+S87ypC7y8qEpW
        sP/oDwXf3WjVM68qQVOimETdBdHMl0wr30gI
X-Google-Smtp-Source: ABdhPJwcmBDRRRpLJMkBg9x+Wvvs3qOG/tRzmInbyBV6XuMBk6m3OxIgB5HssRQzWWExOVS2Wuas7g==
X-Received: by 2002:a05:6e02:1a49:: with SMTP id u9mr6635404ilv.140.1615468799560;
        Thu, 11 Mar 2021 05:19:59 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id b19sm1363075ioj.50.2021.03.11.05.19.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 05:19:59 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id o11so21901514iob.1
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 05:19:59 -0800 (PST)
X-Received: by 2002:a05:6602:26c6:: with SMTP id g6mr6120811ioo.150.1615468798723;
 Thu, 11 Mar 2021 05:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20210310212450.1220416-1-ribalda@chromium.org>
 <cbabd1db-5fda-309b-50bc-8398e8d1580c@xs4all.nl> <CANiDSCuCvbYJp8CDKZV7_8dsxxzgUTG--insgLiEwqh2RrQ7Qw@mail.gmail.com>
 <a1021cbe-1ae6-a5bf-c890-21bb1b48d6d0@xs4all.nl>
In-Reply-To: <a1021cbe-1ae6-a5bf-c890-21bb1b48d6d0@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Mar 2021 14:19:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCtBFrEXWmM_AGznnV27qXZWoNjBxCCSDYAosbBKZpoM4g@mail.gmail.com>
Message-ID: <CANiDSCtBFrEXWmM_AGznnV27qXZWoNjBxCCSDYAosbBKZpoM4g@mail.gmail.com>
Subject: Re: [PATCH] v4l2-compliance: Fix V4L2_CTRL_WHICH_DEF_VAL in multi_classes
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 11, 2021 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 11/03/2021 14:06, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > Thanks for your review!
> >
> >
> > On Thu, Mar 11, 2021 at 1:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 10/03/2021 22:24, Ricardo Ribalda wrote:
> >>> If there are multiple classes, the ioctl should fail.
> >>
> >> It shouldn't matter if there are multiple classes or not, it should
> >> work.
> >
> > I believe this is the part of the kernel that is triggering the issue:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/v4l2-core/v4l2-ioctl.c#n929
> >
> > I can send a patch if that is not the intended behaviour ;)
> >
> > /* Check that all controls are from the same control class. */
> > for (i = 0; i < c->count; i++) {
> > if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
> > c->error_idx = i;
> > return 0;
>
> Ah, and this is only called for drivers that do not use the control framework.
>
> This is a bug, just before that for-loop it says:
>
>         if (!c->which)
>                 return 1;
>
> This should be:
>
>         if (!c->which || c->which == V4L2_CTRL_WHICH_DEF_VAL)
>                 return 1;
>         if (c->which == V4L2_CTRL_WHICH_REQUEST_VAL)
>                 return 0;

Can I send a patch for that?

>
> Regards,
>
>         Hans
>
> >
> >>
> >> What is the exact error you get with which driver?
> >
> > I am trying to fix uvc compliance
> >
> >  fail: v4l2-test-controls.cpp(813): doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls)
> > test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >
> >
> >>
> >> Regards,
> >
> > Best regards!
> >
> >>
> >>         Hans
> >>
> >>>
> >>> Fixes: 0884b19adada ("v4l2-compliance: add test for V4L2_CTRL_WHICH_DEF_VAL")
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> index 9a68b7e847b0..79982bc15054 100644
> >>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> @@ -793,7 +793,10 @@ int testExtendedControls(struct node *node)
> >>>       ctrls.which = V4L2_CTRL_WHICH_DEF_VAL;
> >>>       fail_on_test(!doioctl(node, VIDIOC_S_EXT_CTRLS, &ctrls));
> >>>       fail_on_test(!doioctl(node, VIDIOC_TRY_EXT_CTRLS, &ctrls));
> >>> -     fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> >>> +     if (multiple_classes)
> >>> +             fail_on_test(!doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> >>> +     else
> >>> +             fail_on_test(doioctl(node, VIDIOC_G_EXT_CTRLS, &ctrls));
> >>>       return 0;
> >>>  }
> >>>
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda
