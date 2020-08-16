Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D2624586C
	for <lists+linux-media@lfdr.de>; Sun, 16 Aug 2020 17:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgHPPyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Aug 2020 11:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgHPPyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Aug 2020 11:54:22 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909F9C061786;
        Sun, 16 Aug 2020 08:54:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f9so6491075pju.4;
        Sun, 16 Aug 2020 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ROKHDEP/OCDBcnDVvI/zczMDQypCsxjEouHK4qoGXdA=;
        b=eSQSHRkCdBmD2PwlSRLk0/qF8bsnZMmQ03CM4u7DwJTCI/I69uKazhZfEsScaU6O3A
         Dl2RZVywGqdolrsBybq5W3jTxe4CuAhatKdgaPDFNwbAKu3x5WpdO7W/C1fMbUxApcCu
         HaHAlod3EzCJhWUw0fQhHBcUSftILsfMQdroFj4n+VyEQXUNx/ygEi6EoAxh63hwaeK2
         rB9ZL8JMBU5GEXfjqpBtLLqDR50qTPEjkRaDXG3kP4IS5Y39l3WWGSHGRQOYCFdLR3wD
         z0kXpPnANO/UihQNKpseIM0G/dfHTB84pgFIQgHW64YI8r1paWPzHjdJb3sOlmct/pZk
         Ffzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ROKHDEP/OCDBcnDVvI/zczMDQypCsxjEouHK4qoGXdA=;
        b=H2jcpsiNkvoxRk5gTuUPXzq5wi3g50W6fIQ4jXvkYDzPsZdLNjQQVc0LLRMGbryLpW
         DxNx5aUok6kTNXa+W5CiPhmYHrMxjLuDYK2ibWqdhLoUBi7kPqcCc+MnlywsuTiCzbxH
         +1N0rGSyaMv35W2URiNvdXEwmOeLHr+v7mfp12Y4LANQGV7kGFQSxbjBaugqgdVarrY3
         NFR0eINx3mXsQi/rsEIC936u4Szpu5a21VfIPcCxgKWUBUFjxMHi3xG1fsFhfH4AE1p3
         9zdUWrs7RK2Ix2bXKWJ5+cLKg9jqYyKHBVM6lSPy4CXTgUh+sz021KnrYKiWRDoHskZZ
         usaA==
X-Gm-Message-State: AOAM530oiAsGviZ10XEUh/ttyhWtXlsBKivqWRbhpG7xkwHCkZEJJwjg
        YAW4hG9xq/05Sa5n/osq0H8=
X-Google-Smtp-Source: ABdhPJwzZUW9jnQhtTKgqSBrV5j0h1NzlHiI+1G+m7S3VqeYs//JjLT0uasG+q1zxkoFOvqImKojnw==
X-Received: by 2002:a17:902:6b05:: with SMTP id o5mr8302571plk.173.1597593261278;
        Sun, 16 Aug 2020 08:54:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b185sm15733288pfg.71.2020.08.16.08.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 08:54:20 -0700 (PDT)
Subject: Re: Protecting uvcvideo againt USB device disconnect [Was: Re:
 Protecting usb_set_interface() against device removal]
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <b0a7247c-bed3-934b-2c73-7f4b0adb5e75@roeck-us.net>
 <20200815020739.GB52242@rowland.harvard.edu>
 <20200816003315.GA13826@roeck-us.net>
 <20200816121816.GC32174@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9bb20ed7-b156-f6c2-4d25-6acac1a0021b@roeck-us.net>
Date:   Sun, 16 Aug 2020 08:54:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200816121816.GC32174@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/16/20 5:18 AM, Laurent Pinchart wrote:
> Hi Guenter,
> 
> CC'ing Hans Verkuil and Sakari Ailus for the discussion about handling
> file operations and disconnect in V4L2.
> 
> On Sat, Aug 15, 2020 at 05:33:15PM -0700, Guenter Roeck wrote:
>> + linux-uvc-devel@lists.sourceforge.net
>> + linux-media@vger.kernel.org
>> + laurent.pinchart@ideasonboard.com
>>
>> and changed subject
>>
>> On Fri, Aug 14, 2020 at 10:07:39PM -0400, Alan Stern wrote:
>>> On Fri, Aug 14, 2020 at 04:07:03PM -0700, Guenter Roeck wrote:
>>>> Hi all,
>>>>
>>>> over time, there have been a number of reports of crashes in usb_ifnum_to_if(),
>>>> called from usb_hcd_alloc_bandwidth, which is in turn called from usb_set_interface().
>>>> Examples are [1] [2] [3]. A typical backtrace is:
>>>>
>>>> <3>[ 3489.445468] intel_sst_acpi 808622A8:00: sst: Busy wait failed, cant send this msg
>>>> <6>[ 3490.507273] usb 1-4: USB disconnect, device number 3
>>>> <1>[ 3490.516670] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
>>>> <6>[ 3490.516680] PGD 0 P4D 0
>>>> <4>[ 3490.516687] Oops: 0000 [#1] PREEMPT SMP PTI
>>>> <4>[ 3490.516693] CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
>>>> <4>[ 3490.516696] Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
>>>> <4>[ 3490.516706] RIP: 0010:usb_ifnum_to_if+0x29/0x40
>>>> <4>[ 3490.516710] Code: ee 0f 1f 44 00 00 55 48 89 e5 48 8b 8f f8 03 00 00 48 85 c9 74 27 44 0f b6 41 04 4d 85 c0 74 1d 31 ff 48 8b 84 f9 98 00 00 00 <48> 8b 10 0f b6 52 02 39 f2 74 0a 48 ff c7 4c 39 c7 72 e5 31 c0 5d
>>>> <4>[ 3490.516714] RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
>>>> <4>[ 3490.516718] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
>>>> <4>[ 3490.516721] RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
>>>> <4>[ 3490.516724] RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
>>>> <4>[ 3490.516727] R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
>>>> <4>[ 3490.516731] R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
>>>> <4>[ 3490.516735] FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
>>>> <4>[ 3490.516738] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> <4>[ 3490.516742] CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
>>>> <4>[ 3490.516745] Call Trace:
>>>> <4>[ 3490.516756] usb_hcd_alloc_bandwidth+0x1ee/0x30f
>>>> <4>[ 3490.516762] usb_set_interface+0x1a3/0x2b7
>>>> <4>[ 3490.516773] uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
>>>> <4>[ 3490.516781] uvc_video_start_streaming+0x91/0xdd [uvcvideo]
>>>> <4>[ 3490.516787] uvc_start_streaming+0x28/0x5d [uvcvideo]
>>>> <4>[ 3490.516795] vb2_start_streaming+0x61/0x143 [videobuf2_common]
>>>> <4>[ 3490.516801] vb2_core_streamon+0xf7/0x10f [videobuf2_common]
>>>> <4>[ 3490.516807] uvc_queue_streamon+0x2e/0x41 [uvcvideo]
>>>> <4>[ 3490.516814] uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
>>>> <4>[ 3490.516820] __video_do_ioctl+0x33d/0x42a
>>>> <4>[ 3490.516826] video_usercopy+0x34e/0x5ff
>>>> <4>[ 3490.516831] ? video_ioctl2+0x16/0x16
>>>> <4>[ 3490.516837] v4l2_ioctl+0x46/0x53
>>>> <4>[ 3490.516843] do_vfs_ioctl+0x50a/0x76f
>>>> <4>[ 3490.516848] ksys_ioctl+0x58/0x83
>>>> <4>[ 3490.516853] __x64_sys_ioctl+0x1a/0x1e
>>>> <4>[ 3490.516858] do_syscall_64+0x54/0xde
>>>>
>>>> I have been able to reproduce the problem on a Chromebook by strategically placing
>>>> msleep() calls into usb_set_interface() and usb_disable_device(). Ultimately, the
>>>> problem boils down to lack of protection against device removal in usb_set_interface()
>>>> [and/or possibly other callers of usb_ifnum_to_if()].
>>>>
>>>> Sequence of events is roughly as follows:
>>>>
>>>> - usb_set_interface() is called and proceeds to some point, possibly to
>>>>   mutex_lock(hcd->bandwidth_mutex);
>>>> - Device removal event is detected, and usb_disable_device() is called
>>>
>>> At this point all interface drivers get unbound (their disconnect 
>>> routines are called).
>>>
>>>> - usb_disable_device() starts removing actconfig data. It has removed
>>>>   and cleared dev->actconfig->interface[i], but not dev->actconfig
>>>> - usb_set_interface() calls usb_hcd_alloc_bandwidth(), which calls
>>>>   usb_ifnum_to_if()
>>>> - In usb_ifnum_to_if(), dev->actconfig is not NULL, but
>>>>   dev->actconfig->interface[i] is NULL
>>>> - crash
>>>>
>>>> Question is what we can do about this. Checking if dev->state != USB_STATE_NOTATTACHED
>>>> in usb_ifnum_to_if() might be a possible approach, but strictly speaking it would
>>>> still be racy since there is still no lock against device removal. I have not tried
>>>> calling usb_lock_device() in usb_set_interface() - would that possibly be an option ?
>>>
>>> As far as I know, protecting against these races is the responsibility 
>>> of the USB interface drivers.  They must make sure that their disconnect 
>>> routines block until all outstanding calls to usb_set_interface return 
>>> (in fact, until all outstanding device accesses have finished).
>>>
>>> For instance, in the log extract you showed, it's obvious that the 
>>> uvc_start_streaming routine was running after the disconnect routine had 
>>> returned, which looks like a bug in itself: Once the disconnect routine 
>>> returns, the driver is not supposed to try to access the device at all 
>>> because some other driver may now be bound to it.
>>>
>>> We can't just call usb_lock_device from within usb_set_interface, 
>>> because usb_set_interface is often called with that lock already held.
>>>
>> I had a closer look into the uvcvideo driver and compared it to other usb
>> drivers, including drivers in drivers/media/usb/ which connect to the video
>> subsystem.
>>
>> The usbvideo driver lacks protection against calls to uvc_disconnect() while
> 
> Are you confusing usbvideo and uvcvideo ? Both exist, and uvcvideo would
> have been called usbvideo if the former hadn't already been in use.
> 

Yes, sorry :-(. I am not sure how s/uvc/usb/ happened.

>> calls into file operations are ongoing. This is pretty widespread, and not
>> even limited to file operations (for example, there is a worker which is only
>> canceled in uvc_delete, not in ucv_disconnect). The existing protection only
>> ensures that no file operations are started after the call to ucv_disconnect,
>> but that is insufficient.
>>
>> Other drivers do have that protection and make sure that no usb operations
>> can happen after the disconnect call.
>>
>> The only remedy I can see is to rework the usbvideo driver and add the
>> necessary protections. At first glance, it looks like this may be a
>> substantial amount of work. I'd sign up for that, but before I start,
>> I would like to get input from the usbvideo community. Is such an effort
>> already going on ? If yes, how can I help ? If not, is the problem
>> understood and accepted ? Are there any ideas on how to solve it ?
> 
> This is something that has been discussed before, and needs to be solved
> in the V4L2 framework itself, not in individual drivers. Not only would
> this avoid rolling out the same code manually everywhere (in different
> incorrect ways, as races are difficult to solve and implementations are
> more often wrong than right), but it will also avoid similar issues for
> non-USB devices.
> 
You mean code that ensures that no user-space v4l2 operation is in progress
after video_device_unregister / v4l2_device_unregister return ? I agree,
that would simplify the necessary changes on the uvc side.
I actually came from the other side - I assumed that there is a reason
that is not already the case, and that the problem therefore has to be
resolved on the driver side.

So I guess the next question is: Is this already being addressed on the
v4l2 side ?

> It shouldn't take more than two flags (to track user-space operations in
> progress and disconnection), a spinlock and a wait queue entry. I'm not
> sure if someone has already given it a try, and don't recall why this
> hasn't been done yet, as it should be fairly straightforward.
> 
> On the UVC side, the work queue probably has to be flushed in
> uvc_disconnect(). I'd keep the destroy call in uvc_delete() though.
> Please make sure to look for potential race conditions between the URB
> completion handler and the .disconnect() handler (they shouldn't be any,
> but I haven't checked lately myself).
> 
My current solution for this problem is to call uvc_ctrl_cleanup_device()
from uvc_disconnect(), after uvc_unregister_video(). An alternative might
be to add a uvc_ctrl_stop_device() function which would just cancel the
worker.

Thanks,
Guenter
