Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB313B40F0
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 11:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhFYJ4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 05:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhFYJ4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 05:56:32 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAE1C061574
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:54:12 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id j184so18496185qkd.6
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ysOTdnWB+3PCxVRgIJekXfDDaWu9A++3czkxH4rPKQ=;
        b=qhApkcmL8RA1knZoI1WXcQEBOKedcnK9s46D+i4D4othZbJ4zY6NkWC4g2QZs7AttZ
         0ANmpfp06zP6l/LSXS/W+2Lx8CZd40+uv1F7/kPHCGc8FKNsS5Jh7SQnPp5lJMYuMmsH
         65An5AarVssHqDizqgDqdIEL89sM1M1n0CSk0CaVTlxg9q3w0e0QTs096yTWjYspsip/
         DJONJwUJpjYBvPt8wch4HvWA4ekqvoPlZ/92BdPqiHdflOU1W2SbZTA7TLMTF1hTK6Yf
         Tx9en6VaiAlNLVatdqjHM3WqxMbqTVJ0GDeVidYZyOM45l5801Jyqb3Td+IAfxL+EwdI
         KOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ysOTdnWB+3PCxVRgIJekXfDDaWu9A++3czkxH4rPKQ=;
        b=HiqYlSEVUoqYFsDOiSYtbcXkYda8SSLfnMcPSUL5fA1rGl6q/iUq6iYSm2YNAO9vMd
         ASUVbH2z6u14jPNPNqkN9g3NXYWA9+mvY+nEz+v4IQsbDQ91ZFKRr82zEiA53L7IFwGF
         n9nNDm0vOFwIOHpe2xwflhHq4rJ43ryTbPsc7J3lmlF83vhPRSBHKNXSm4K50jXJQyMD
         iFL5Yf0OUw94/0T2T132WW9bp9PK6Zg5n4Y3XnpmCMVnLHRbPnO9bNmHi6pUjYwKLgVR
         iKQFN41VvQnUbitWOUc3v0/7KGWkP8hc0jNZYjvmwSzvAPuW+T4C7EKvPZjA45OEqNJz
         D3dQ==
X-Gm-Message-State: AOAM531TY9cZvhduNxg0usEwMIP5CZM0FiikcSGWEMnd0eVQHQpRStfY
        Hz5aw0evoKjnM9HrmfBppdtWWUSlzvIRoLiFrswZqA==
X-Google-Smtp-Source: ABdhPJyVl8ZdxXr8z7xkfs2ag+GwdcePtI6ZoyNQcCfAV2qdGq0di2N35Dj6mVVFN3tkT+fmPId/mr5nmtTetOlcWmI=
X-Received: by 2002:a37:8081:: with SMTP id b123mr10671108qkd.231.1624614850950;
 Fri, 25 Jun 2021 02:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e61e2105c58fea48@google.com> <20210625085140.1735-1-hdanton@sina.com>
 <CACT4Y+YzgaZjLCOjvhcDC5YRjjF2OBp1XE-vS5+AZOmwmneg0Q@mail.gmail.com> <20210625094638.1791-1-hdanton@sina.com>
In-Reply-To: <20210625094638.1791-1-hdanton@sina.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 25 Jun 2021 11:53:59 +0200
Message-ID: <CACT4Y+amrcRo=1KuKHoN7L6JoCH0Bakt5dveZt7iZDhqpSu4nA@mail.gmail.com>
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

On Fri, Jun 25, 2021 at 11:46 AM Hillf Danton <hdanton@sina.com> wrote:
>
> On Fri, 25 Jun 2021 11:08:57 +0200 Dmitry Vyukov wrote:
> >On Fri, Jun 25, 2021 at 10:52 AM Hillf Danton wrote:
> >>
> >> Given the uaf in the ioctl path, open count is needed and should be
> >> maintained by stk and is implemented in the diff below with mutex - it
> >> is locked at file open time, released at file release time and aquired
> >> at disconnect time.
> >>
> >> This can be a quick fix to the uaf, though, lights on why the video_get(vdev)
> >> in v4l2_open() fails to prevent stk camera from going home too early are
> >> welcome. Is it the fault on the driver side without an eye on open count?
> >>
> >> +++ x/drivers/media/usb/stkwebcam/stk-webcam.c
> >> @@ -624,8 +624,10 @@ static int v4l_stk_open(struct file *fp)
> >>                 dev->first_init = 0;
> >>
> >>         err = v4l2_fh_open(fp);
> >> -       if (!err)
> >> +       if (!err) {
> >>                 usb_autopm_get_interface(dev->interface);
> >> +               mutex_trylock(&dev->free_mutex);
> >
> >I haven't read all of it, but doing mutex_trylock w/o checking the
> >return value looks very fishy. Can it ever be the right thing to
> >do?... E.g. the next line we unconditionally do mutex_unlock, are we
> >potentially unlocking a non-locked mutex?
>
> I am having difficulty understanding your point until I see next line...

Right, the next line unlocks a different mutex, so ignore the part
about the next line.

But I am still confused about the intention of trylock w/o using the
return value. I fail to imagine any scenarios where it's the right
thing to do.


> we have the same habit in regard to replying mails that deliver fix out
> of our boxes.
>
> What is your local time now? Wakeup without downing a pint of black tea?
> Or still working in the late night?

It's 11:53am, so I am properly caffeinated already :)

> Thanks for taking a look at it.
>
> Hillf
> >
> >
> >> +       }
> >>         mutex_unlock(&dev->lock);
> >>         return err;
> >>  }
> >> @@ -633,6 +635,7 @@ static int v4l_stk_open(struct file *fp)
> >>  static int v4l_stk_release(struct file *fp)
> >>  {
> >>         struct stk_camera *dev = video_drvdata(fp);
> >> +       int rc;
> >>
> >>         mutex_lock(&dev->lock);
> >>         if (dev->owner == fp) {
> >> @@ -645,7 +648,9 @@ static int v4l_stk_release(struct file *
> >>
> >>         usb_autopm_put_interface(dev->interface);
> >>         mutex_unlock(&dev->lock);
> >> -       return v4l2_fh_release(fp);
> >> +       rc = v4l2_fh_release(fp);
> >> +       mutex_unlock(&dev->free_mutex);
> >> +       return rc;
> >>  }
> >>
> >>  static ssize_t stk_read(struct file *fp, char __user *buf,
> >> @@ -1306,6 +1311,7 @@ static int stk_camera_probe(struct usb_i
> >>
> >>         spin_lock_init(&dev->spinlock);
> >>         mutex_init(&dev->lock);
> >> +       mutex_init(&dev->free_mutex);
> >>         init_waitqueue_head(&dev->wait_frame);
> >>         dev->first_init = 1; /* webcam LED management */
> >>
> >> @@ -1385,6 +1391,8 @@ static void stk_camera_disconnect(struct
> >>         video_unregister_device(&dev->vdev);
> >>         v4l2_ctrl_handler_free(&dev->hdl);
> >>         v4l2_device_unregister(&dev->v4l2_dev);
> >> +       mutex_lock(&dev->free_mutex);
> >> +       mutex_unlock(&dev->free_mutex);
> >>         kfree(dev);
> >>  }
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20210625094638.1791-1-hdanton%40sina.com.
