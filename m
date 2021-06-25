Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721E33B44DA
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 15:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhFYNyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 09:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhFYNyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 09:54:06 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D16C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 06:51:46 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id r7so7487959qta.12
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GbSbNNqFKiu9Mctgx4Wsj99Xj0cOSJ9rf4uWMxWFhVY=;
        b=d/E1my5NgFegXWc2dnxbA8ZlWYIYgsn0cmMwOo+xHc07acGEwbKUi0EyZn3gld9PYh
         4YJvV7MjBv+PXeBsn3yTvZoShM8LqsEuAd/iUDNYFgRF43ei5iiyv3RtEA1MCS+c5qBM
         LnhqE06g6w0uQnhHQO4jrYPBHluD2MEah70tPTH7QwoH9rCtj24r6RYo3BjSA3FQAozf
         H6LUxpfPBtC0QroTZx7/p4x/DtlZz7qGSE+4uuZECZqlxq1tMJRZ/s9Ro65b7v1UE+wf
         NmxaPh2j/bSq0lO90lXu2OQW6guR3iJkMyo8K0VLGhCyIqBnYWgakujEDC85IDmCYSBJ
         G5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbSbNNqFKiu9Mctgx4Wsj99Xj0cOSJ9rf4uWMxWFhVY=;
        b=eIuWS+nFOnNqk7/kyRcSOkvh4nj/CxCAeSCA4xz/VxmIRWKusLC+gVpCX6vexu+Kht
         k55zdTeTGPtDh6GT5tiiNqbLNaJvd3Med8lHaI2vrPtKEJn1U5rZMEGvKPOg4JI3P3Es
         q7w2KRElMVrtI7CJYCvovHyAdOGnipneqSC57vwMQ/nJKUExatVdahmoUYNaqpZ6/AaX
         mCCP9u7i9M0OJlCL2lxeqnlnt4xLwdTCRiYSeb3E5CMXu+LMme6ZixWpMCHqx0lg2Gno
         gkp/gU2RV/NAtA/FlPkoFr/CSz81+KGM3sxYl4kMV6owyK9iE9ofny03Z+MFZoAngmNw
         qYSw==
X-Gm-Message-State: AOAM5309UZhYsjAVDF0aeRjdEXDFxi0Sb09NuZHnvpehIg8XSfT7IaS4
        WZs53P3F2QCkAxVLVEu6RJzC7zLXscmYsvpLgi0TXg==
X-Google-Smtp-Source: ABdhPJzWIBGCrYgEsbZ2B7WYA3Nw2NgDvJvNE6RynWDcDD9/I3Lwrg2cwUNGChWnr9VjFdeLmbuwhBkOKWvUm6whJ3E=
X-Received: by 2002:a05:622a:1011:: with SMTP id d17mr9795664qte.66.1624629105091;
 Fri, 25 Jun 2021 06:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e61e2105c58fea48@google.com> <20210625085140.1735-1-hdanton@sina.com>
 <CACT4Y+YzgaZjLCOjvhcDC5YRjjF2OBp1XE-vS5+AZOmwmneg0Q@mail.gmail.com>
 <20210625094638.1791-1-hdanton@sina.com> <CACT4Y+amrcRo=1KuKHoN7L6JoCH0Bakt5dveZt7iZDhqpSu4nA@mail.gmail.com>
 <20210625130813.84-1-hdanton@sina.com>
In-Reply-To: <20210625130813.84-1-hdanton@sina.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 25 Jun 2021 15:51:32 +0200
Message-ID: <CACT4Y+b_OAYhGD01k2Kct0t_jccj_OK_stQ4eLObGAiFoJE8Rg@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in v4l2_ioctl (2)
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+19c5a4b75931e8d63aab@syzkaller.appspotmail.com>,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        lijian@yulong.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 3:08 PM Hillf Danton <hdanton@sina.com> wrote:
> >> >> Given the uaf in the ioctl path, open count is needed and should be
> >> >> maintained by stk and is implemented in the diff below with mutex - it
> >> >> is locked at file open time, released at file release time and aquired
> >> >> at disconnect time.
> >> >>
> >> >> This can be a quick fix to the uaf, though, lights on why the video_get(vdev)
> >> >> in v4l2_open() fails to prevent stk camera from going home too early are
> >> >> welcome. Is it the fault on the driver side without an eye on open count?
> >> >>
> >> >> +++ x/drivers/media/usb/stkwebcam/stk-webcam.c
> >> >> @@ -624,8 +624,10 @@ static int v4l_stk_open(struct file *fp)
> >> >>                 dev->first_init = 0;
> >> >>
> >> >>         err = v4l2_fh_open(fp);
> >> >> -       if (!err)
> >> >> +       if (!err) {
> >> >>                 usb_autopm_get_interface(dev->interface);
> >> >> +               mutex_trylock(&dev->free_mutex);
> >> >
> >> >I haven't read all of it, but doing mutex_trylock w/o checking the
> >> >return value looks very fishy. Can it ever be the right thing to
> >> >do?... E.g. the next line we unconditionally do mutex_unlock, are we
> >> >potentially unlocking a non-locked mutex?
> >>
> >> I am having difficulty understanding your point until I see next line...
> >
> >Right, the next line unlocks a different mutex, so ignore the part
> >about the next line.
> >
> >But I am still confused about the intention of trylock w/o using the
> >return value. I fail to imagine any scenarios where it's the right
> >thing to do.
>
> Let me explain. The whole point of the added mutex is solely to prevent
> the disconnector from freeing the stk camera while there are still
> openers of the video device, and trylock is used to walk around deadlock
> because multiple openers are allowed. In function it is equivelant to the
> usual method on top of open count and waitqueue, something like
>
>         mutex_lock;
>         stk_cam->open_cnt++;    // mutex_trylock(&stk_cam->free_mutex);
>         mutex_unlock;
>
> at file open time, and
>
>         mutex_lock;
>         stk_cam->open_cnt = 0;
>         wake_up(&stk_cam->waitq); // mutex_unlock(&stk_cam->free_mutex);
>         mutex_unlock;
>
> at file release time, and
>
>         wait_event(stk_cam->waitq,
>                 stk_cam->open_cnt == 0); // mutex_lock(&stk_cam->free_mutex);
>                                         // mutex_unlock(&stk_cam->free_mutex);
>         kfree(stk_cam);
>
> at disconnect time, but has fewer lines of code to type.

But if trylock has failed, then the file release will still unlock the
mutex and unlocking a mutex without a prior lock is not permitted.

Or, I assume disconnect needs to wait for all files to be released.
This won't be the case with a mutex, because when the first file is
released, mutex is unlocked and disconnect can proceed.

But maybe I am still missing something.
Are you sure your use of mutex complies with the rules?
https://elixir.bootlin.com/linux/v5.13-rc7/source/include/linux/mutex.h#L31


> What is more crucial however is why the mechanisms in video core are
> failing to prevent uaf like this one from coming true. Lets wait for
> lights from the video folks.
