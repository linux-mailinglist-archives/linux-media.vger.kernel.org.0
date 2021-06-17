Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAD23ABA42
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 19:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhFQRJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 13:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhFQRJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 13:09:08 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165DFC061760
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 10:06:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id d7so5102641edx.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dBVXQS+ylKBG0bfyc6u9OxuiaPrfrMUBNYtXDRwH6rE=;
        b=Twbo1hoJtrr1QYAOMFgezeK6qjEFBO2LSa1gDLBQdPSN0HHfpJTeQG+NvizXyjGggT
         5qOcKbTwVoRfRAlPrxKnZh2Zzfh+I+c3U/FY4EawWfXLIpdZ78VNokK+tUQog6zWm9Mf
         2o/Kxi3ANHBhs4xEi4h6OEUmn5pjdMGDx+ioJh2SOTD2sRezAD7IREFqUwHEoILO2r8B
         K+5lkn/phM3e9vCxvJCgk3WGzSl+bmjX1i+ANJnv9OR80oGrjyswTtym1mZwebA013IJ
         gcs4CbIqeUmB1wO8JmtNKXA4BvsF7f7h0IkDI5EZqhjdfkSMrWC582NbEzaWZDf97ot5
         XDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dBVXQS+ylKBG0bfyc6u9OxuiaPrfrMUBNYtXDRwH6rE=;
        b=ScNENIb7To6Qv1cp2o/3CEsg1gE50zoRNYKYJGXDtXN9ugEgunHVHBbMhfSKrXpeAu
         l9tLVD9dTAtKNZf2/zJopwTWijXCmqiDozD0a+htajWd2HGTGGj5JIKoPJQ5IFsEz1UU
         Z2Om0SQP0H+q7ufncMARxdHhtJoiALQmGBeNJXazke0fBHtZjjX0S/m2TQkpZrL+4EB1
         p+vN2/PHZXDlKDxhiAmpM/xL4R/SIU8E/xVnfDb5FiRqQaQMqtk0GB2DCtMDuU/nQqi5
         lElFhEpLh7UMnZCm2eCIyjogoEjWg7W7YSx/ojDLSxYctmj7nZTAwBZKytfuJxjFyNAA
         tkVQ==
X-Gm-Message-State: AOAM532TaPqp9qPjfxmEdeGzCKq66wFRwg9nfeXvZyZs9NE4cDuV/x2p
        abZt9+k0a/E49D4KDdlVMm6KXrmDkCbyA55cdaKZWQ==
X-Google-Smtp-Source: ABdhPJz/2I2K2MjVMWAixrgjAXoh9TwNDYWckTB04s6rH3ZA4pjwWpJKopZhb04A237Vju4rgvPe6MUtpLFBCwjFhQA=
X-Received: by 2002:aa7:db16:: with SMTP id t22mr7992522eds.49.1623949617650;
 Thu, 17 Jun 2021 10:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200917022547.198090-1-linux@roeck-us.net> <20200917022547.198090-2-linux@roeck-us.net>
In-Reply-To: <20200917022547.198090-2-linux@roeck-us.net>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 17 Jun 2021 14:06:46 -0300
Message-ID: <CAAEAJfDdW-Xwyz=USE2v0vKcdO8paBgsQVkJ4FUP+xuP9iO9WA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 1/5] media: uvcvideo: Cancel async worker earlier
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, 16 Sept 2020 at 23:33, Guenter Roeck <linux@roeck-us.net> wrote:
>
> So far the asynchronous control worker was canceled only in
> uvc_ctrl_cleanup_device. This is much later than the call to
> uvc_disconnect. However, after the call to uvc_disconnect returns,
> there must be no more USB activity. This can result in all kinds
> of problems in the USB code. One observed example:
>
> URB ffff993e83d0bc00 submitted while active
> WARNING: CPU: 0 PID: 4046 at drivers/usb/core/urb.c:364 usb_submit_urb+0x4ba/0x55e
> Modules linked in: <...>
> CPU: 0 PID: 4046 Comm: kworker/0:35 Not tainted 4.19.139 #18
> Hardware name: Google Phaser/Phaser, BIOS Google_Phaser.10952.0.0 08/09/2018
> Workqueue: events uvc_ctrl_status_event_work [uvcvideo]
> RIP: 0010:usb_submit_urb+0x4ba/0x55e
> Code: <...>
> RSP: 0018:ffffb08d471ebde8 EFLAGS: 00010246
> RAX: a6da85d923ea5d00 RBX: ffff993e71985928 RCX: 0000000000000000
> RDX: ffff993f37a1de90 RSI: ffff993f37a153d0 RDI: ffff993f37a153d0
> RBP: ffffb08d471ebe28 R08: 000000000000003b R09: 001424bf85822e96
> R10: 0000001000000000 R11: ffffffff975a4398 R12: ffff993e83d0b000
> R13: ffff993e83d0bc00 R14: 0000000000000000 R15: 00000000fffffff0
> FS:  0000000000000000(0000) GS:ffff993f37a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000ec9c0000 CR3: 000000025b160000 CR4: 0000000000340ef0
> Call Trace:
>  uvc_ctrl_status_event_work+0xd6/0x107 [uvcvideo]
>  process_one_work+0x19b/0x4c5
>  worker_thread+0x10d/0x286
>  kthread+0x138/0x140
>  ? process_one_work+0x4c5/0x4c5
>  ? kthread_associate_blkcg+0xc1/0xc1
>  ret_from_fork+0x1f/0x40
>
> Introduce new function uvc_ctrl_stop_device() to cancel the worker
> and call it from uvc_unregister_video() to solve the problem.
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

If I understand correctly, this patch is correct and can be merged
independently of the rest in this series.

I think it could also be fixed with a check in uvc_ctrl_status_event_work,
to prevent pending workers from accessing the device, which is now disconnected.
Something like this (untested):

@@ -1325,6 +1325,10 @@ static void uvc_ctrl_status_event_work(struct
work_struct *work)

        uvc_ctrl_status_event(w->chain, w->ctrl, w->data);

+       /* Don't submit URBs if the device was disconnected */
+       if (!usb_get_intfdata(dev->intf))
+               return;
+

In any case, it'd be nice to fix this case now, and pospone taking care
of the other race conditions in the core, as you suggested in the cover letter.

Thanks!
Ezequiel
