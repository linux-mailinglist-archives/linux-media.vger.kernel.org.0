Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185181190F6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 20:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLJTsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 14:48:04 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:37530 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfLJTsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 14:48:04 -0500
Received: by mail-io1-f69.google.com with SMTP id p2so14113407iof.4
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2019 11:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=EpJ1D8lGNCCnF6AyqKcMgQqopgAaZAfpppfEN6g4mew=;
        b=RY8DbobIk8Sw8SSCxi3RqnIphs27/ard+KnLuNLUo7P4HmSMRI//4B78VbWt1cJl+1
         YY12vfnEDp3v73LSzk/wFf3vCW6PDAPeaZmDOe7btASysbf7v0UfzKTKrqXZLKyZeIZN
         vF4IboBgLaHlw3mQOnDr9GgXb0gZ1LoX48DLk7VXoPxBFfr8vJYHjtPkBd/UBTESr344
         hxEIoHXQDRGzEWI2FOzf0mdS+5KA94KNjowt/9zmXhgQ1cVys9qAD/6SAulpdRuDQ4TV
         0b++TEUMeTbTN2FRIfOCUN2VQmiIn3gAL3qz9h91pykHxhhU1braYaL4j1QY/5vpt8Sl
         m34w==
X-Gm-Message-State: APjAAAUKbilVHf45RmyMLeUOeS0ay0T04Zg0+wCX3W3KfkCXFVX8NG8O
        Me2889RlntQX/huZbZJx01WMDPMCtykx1FcQFvdmIVmwKUiy
X-Google-Smtp-Source: APXvYqwuqiWxFJXsBzogBCZjMGzDiTKUypBZbe+oMoucxW8s2E2Cb8cXBp3EE0k/qlPWuuAizvelDPXY0UPuH6oDIY+R0HfGA4r5
MIME-Version: 1.0
X-Received: by 2002:a02:2385:: with SMTP id u127mr5450623jau.127.1576007282986;
 Tue, 10 Dec 2019 11:48:02 -0800 (PST)
Date:   Tue, 10 Dec 2019 11:48:02 -0800
In-Reply-To: <Pine.LNX.4.44L0.1912101440100.1647-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000441a4205995eca11@google.com>
Subject: Re: Re: KASAN: use-after-free Read in usbvision_v4l2_open
From:   syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andreyknvl@google.com, hverkuil@xs4all.nl, jrdr.linux@gmail.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, rfontana@redhat.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On Mon, 9 Dec 2019, syzbot wrote:

>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    1f22d15c usb: gadget: add raw-gadget interface
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1296f42ae00000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=c7b0ec009a216143df30
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

>> Unfortunately, I don't have any reproducer for this crash yet.

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com

>> ==================================================================
>> BUG: KASAN: use-after-free in __mutex_lock_common
>> kernel/locking/mutex.c:1043 [inline]
>> BUG: KASAN: use-after-free in __mutex_lock+0x124d/0x1360
>> kernel/locking/mutex.c:1106
>> Read of size 8 at addr ffff8881cad4d8b8 by task v4l_id/4526

>> CPU: 0 PID: 4526 Comm: v4l_id Not tainted 5.4.0-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> Call Trace:
>>    __dump_stack lib/dump_stack.c:77 [inline]
>>    dump_stack+0xef/0x16e lib/dump_stack.c:118
>>    print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
>>    __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
>>    kasan_report+0xe/0x20 mm/kasan/common.c:638
>>    __mutex_lock_common kernel/locking/mutex.c:1043 [inline]
>>    __mutex_lock+0x124d/0x1360 kernel/locking/mutex.c:1106
>>    usbvision_v4l2_open+0x77/0x340
>> drivers/media/usb/usbvision/usbvision-video.c:314
>>    v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
>>    chrdev_open+0x219/0x5c0 fs/char_dev.c:414
>>    do_dentry_open+0x494/0x1120 fs/open.c:797
>>    do_last fs/namei.c:3412 [inline]
>>    path_openat+0x142b/0x4030 fs/namei.c:3529
>>    do_filp_open+0x1a1/0x280 fs/namei.c:3559
>>    do_sys_open+0x3c0/0x580 fs/open.c:1097
>>    do_syscall_64+0xb7/0x5b0 arch/x86/entry/common.c:294
>>    entry_SYSCALL_64_after_hwframe+0x49/0xbe

> This looks like a race in v4l2_open(): The function drops the
> videodev_lock mutex before calling the video driver's open routine, and
> the device can be unregistered during the short time between.

> This patch tries to make the race much more likely to happen, for
> testing and verification.

> Andrey, will syzbot run the same test with this patch, even though it
> says it doesn't have a reproducer?

> Alan Stern

> #syz test: https://github.com/google/kasan.git 1f22d15c

This crash does not have a reproducer. I cannot test it.


> Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
> +++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> @@ -1585,6 +1585,7 @@ static void usbvision_disconnect(struct
>   		wake_up_interruptible(&usbvision->wait_frame);
>   		wake_up_interruptible(&usbvision->wait_stream);
>   	} else {
> +		msleep(100);
>   		usbvision_release(usbvision);
>   	}

> Index: usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> ===================================================================
> --- usb-devel.orig/drivers/media/v4l2-core/v4l2-dev.c
> +++ usb-devel/drivers/media/v4l2-core/v4l2-dev.c
> @@ -419,9 +419,10 @@ static int v4l2_open(struct inode *inode
>   	video_get(vdev);
>   	mutex_unlock(&videodev_lock);
>   	if (vdev->fops->open) {
> -		if (video_is_registered(vdev))
> +		if (video_is_registered(vdev)) {
> +			msleep(200);
>   			ret = vdev->fops->open(filp);
> -		else
> +		} else
>   			ret = -ENODEV;
>   	}


