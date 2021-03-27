Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512E834B76C
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 14:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhC0Nno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 09:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhC0Nne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 09:43:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540F6C0613B1;
        Sat, 27 Mar 2021 06:43:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u4so10612169ljo.6;
        Sat, 27 Mar 2021 06:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wKotxx/awUycRD+fkna42rIx+vqO8dW/HIq/KOKL9cI=;
        b=LKFZ43FLHPWczoqXaWDhXR31hXmXwNOO8dzqy+szxykaZR4W5Sg85B50ytQtEXLtZ8
         D60bPoEwrk1FUkh00hUQnVKqR8jsIYh6UrOk5S4+xXi8M0A8kZGpJD+kC547l8DuYCii
         jEaLBYJTEgyGtfwJUPOnrh2r+VRXqF/TD7yn4iisPcJPWbGlSsRRNkDjr1cbVrrsard7
         fvmrdAr8Rdt4lqQuYiWIYhEspBJJSGA9YYagWLSqJRWHkrwcOibtibyYwn/t+mKINyHf
         KDRVyII7KF8guQvIm3c4vHQQCd8ylRSySOhbDcblmgi0vdQDLI45daGatUKA5azNKHRD
         9vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wKotxx/awUycRD+fkna42rIx+vqO8dW/HIq/KOKL9cI=;
        b=R+16aXASUpQDxtWfkkUWsV5Od5hO61G8NghIeNDVYzuCcxh6fO0Hj+fKYtDSp5pG1z
         tUamE4IJR7oHjJNQxQQYIBYj4DNFTPHLedJ6N/EeqjLqOge0miOXlvufjchAywfKmhli
         DmiN+VtyzD+wtcARB345/CmQ5C3yVdTnfwMyVYk4/Q59otBeQ8lh7UDuMvlF2PTIDpGA
         2aDkqVlRPTyEwkVVkNu+FkMr9hyAccHwZDZ6kvVkW2Onjnc5u/iMu9J+1uAnOftMyLoV
         XQFY8PfBaOhYehlzm67GGinRz/JiSNdsGvo+zU7YGuUrdK7NFWl2kmLFmWZghJczxHBu
         KG1w==
X-Gm-Message-State: AOAM5330UdMRm1j4ZxnaZ1qp0FinXMswjGzjXyhEGPObqNPhs/K/MxSz
        MrkE+NjkmBKLazhFgNmMdS1Hr1t3OcnI32QQWHo=
X-Google-Smtp-Source: ABdhPJytzhch4r2XjTYINqfLSX+KY8VqAotBqm4lb70p3pWO7/g3LQkZnSx7HJIlSt4llk2cnegt7w==
X-Received: by 2002:a05:651c:118b:: with SMTP id w11mr11967883ljo.223.1616852612694;
        Sat, 27 Mar 2021 06:43:32 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id 3sm1204816lfq.1.2021.03.27.06.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 06:43:31 -0700 (PDT)
Message-ID: <c7af9f1a1c76ac56ec2a1e7470ae90a02a76365d.camel@gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in em28xx_dvb_init
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com" 
        <syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com>
Date:   Sat, 27 Mar 2021 16:43:30 +0300
In-Reply-To: <CAHp75VcH9BpvRLcqY_LxyiycQ-pOpZP4QrJXYKe69zUDbYG=SA@mail.gmail.com>
References: <20210327082613.4702-1-paskripkin@gmail.com>
         <CAHp75VcH9BpvRLcqY_LxyiycQ-pOpZP4QrJXYKe69zUDbYG=SA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On Sat, 2021-03-27 at 11:01 +0200, Andy Shevchenko wrote:
> 
> 
> On Saturday, March 27, 2021, Pavel Skripkin <paskripkin@gmail.com>
> wrote:
> > syzbot reported memory leak in em28xx_dvb_init()[1]
> > The problem was in wrong error handling after
> > em28xx_alloc_urbs()[2]
> > call.
> > In case of error allocated urbs must be freed
> > 
> > 
> 
> I believe you may reduce twice the below backtrace and leave only
> important line(s).

Ok, I'll send new patch version soon.
Thank you!

> 
>  
> >   backtrace:
> >     [<ffffffff8304c141>] kmalloc_array.constprop.0+0x41/0x60
> > include/linux/slab.h:594
> >     [<ffffffff8304dba2>] kcalloc include/linux/slab.h:623 [inline]
> >     [<ffffffff8304dba2>] em28xx_alloc_urbs+0x102/0x550
> > drivers/media/usb/em28xx/em28xx-core.c:930 [2]
> >     [<ffffffff84279fa7>] em28xx_dvb_init
> > drivers/media/usb/em28xx/em28xx-dvb.c:1517 [inline]      [1]
> >     [<ffffffff84279fa7>] em28xx_dvb_init.cold+0xa3/0x2bb1
> > drivers/media/usb/em28xx/em28xx-dvb.c:1483
> >     [<ffffffff8304e33b>] em28xx_init_extension+0x9b/0xe0
> > drivers/media/usb/em28xx/em28xx-core.c:1126
> >     [<ffffffff83050143>] request_module_async+0x33/0x40
> > drivers/media/usb/em28xx/em28xx-cards.c:3406
> >     [<ffffffff81259229>] process_one_work+0x2c9/0x600
> > kernel/workqueue.c:2275
> >     [<ffffffff81259dbb>] process_scheduled_works
> > kernel/workqueue.c:2337 [inline]
> >     [<ffffffff81259dbb>] worker_thread+0x2fb/0x5d0
> > kernel/workqueue.c:2426
> >     [<ffffffff81261228>] kthread+0x178/0x1b0 kernel/kthread.c:292
> >     [<ffffffff8100227f>] ret_from_fork+0x1f/0x30
> > arch/x86/entry/entry_64.S:294
> > 
> > Reported-by: syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > ---
> >  drivers/media/usb/em28xx/em28xx-dvb.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c
> > b/drivers/media/usb/em28xx/em28xx-dvb.c
> > index 526424279637..471bd74667e3 100644
> > --- a/drivers/media/usb/em28xx/em28xx-dvb.c
> > +++ b/drivers/media/usb/em28xx/em28xx-dvb.c
> > @@ -2010,6 +2010,7 @@ static int em28xx_dvb_init(struct em28xx
> > *dev)
> >         return result;
> > 
> >  out_free:
> > +       em28xx_uninit_usb_xfer(dev, EM28XX_DIGITAL_MODE);
> >         kfree(dvb);
> >         dev->dvb = NULL;
> >         goto ret;
> > -- 
> > 2.30.2
> > 
> > 
> 
> 

-- 
With regards,
Pavel Skripkin


