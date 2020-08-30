Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEF4257095
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 22:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgH3Usb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 16:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgH3Us3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 16:48:29 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F06C061573;
        Sun, 30 Aug 2020 13:48:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k15so3424265pfc.12;
        Sun, 30 Aug 2020 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uucSFUbtFxDUFEk0oJVzm7mLjNc2PirgWk/kGovDv9c=;
        b=SxtYgOgzRk6qv86E/pf09F+Ops8FMrJk5epI4McUhXgupL4KrLQIC4qdf2rl3ZPYoE
         F7sRN7o4nBhX7VYC4ezjQmt6csEIKynGUGbaJ3hiEloqYh70moVcK7cQNkueU7dCBc1Q
         BniQ+jbeKd3TqRaLj03fj0nMI0WXbKCWsI/U5LBHanfPItdo2+1Lw5FezIYEBDsCGx2n
         sMBCrRmE0HSCcwjB3li7/KS2ndyZDQeb+efRoSurBftyZud2xhiK63QFQU4cbHTTDLaI
         WnGT3rp42Tvpcm1bT7J9NMMhEznXwBgbDMQr0dJubDwZ0C64D4SwUimWEFohrKnGP32e
         F1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uucSFUbtFxDUFEk0oJVzm7mLjNc2PirgWk/kGovDv9c=;
        b=fqsb6ifc5z/nUCYIlc3cys6SuxW9nCfgLmiJCQK6GAAfjL4JfDpXdljGKP1WrUutWe
         Ah7hwaONvfL4vITT6P4yR2lFqQ63NS1Vi+bu8Mjh48UAD/hic0DLzF/1QZOMzt+uufBX
         XSDgZdgDsu443b6DyI4VBcw3vGstaSy0K1O31nyvC/GllFuemRVh8gST9isN8Fk8QX9l
         vGStfCKXe8OjMZWxcyLAaKgtK36//4PMl48jbUgr5Zv8BlH40JeJQt4PU2Zoc6X9+GvH
         OpxBvpyjLkaJPwZ+nUG7rJ84FRgcb8aFXm8McogRZ2WKed4VTp/j03W54g30grhxnkPG
         LMxA==
X-Gm-Message-State: AOAM530NnW8m9wGJWG8EdcUDLBrhOQBXzjdHyNdaqpuO3GJxOyUGHYbl
        Wcz6dzuvlTDTXkkadELj0j6oNYP/MAo=
X-Google-Smtp-Source: ABdhPJxRkQFFRP0Yj2mK/X96EYw28bgOTT2DjJiYsZA07QmC2cq6YYg6HjaCaSveFc3lBN1AdrXtyA==
X-Received: by 2002:a62:4dc1:: with SMTP id a184mr3923830pfb.203.1598820506302;
        Sun, 30 Aug 2020 13:48:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id il13sm4926757pjb.0.2020.08.30.13.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 13:48:25 -0700 (PDT)
Subject: Re: [PATCH 0/5] media: uvcvideo: Fix race conditions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200830150443.167286-1-linux@roeck-us.net>
 <20200830155833.GA6043@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ac2080a1-3b00-ac9e-cd49-d1ee84c6ca25@roeck-us.net>
Date:   Sun, 30 Aug 2020 13:48:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200830155833.GA6043@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 8/30/20 8:58 AM, Laurent Pinchart wrote:
> Hi Guenter,
> 
> Thank you for the patches.
> 
> On Sun, Aug 30, 2020 at 08:04:38AM -0700, Guenter Roeck wrote:
>> The uvcvideo code has no lock protection against USB disconnects
>> while video operations are ongoing. This has resulted in random
>> error reports, typically pointing to a crash in usb_ifnum_to_if(),
>> called from usb_hcd_alloc_bandwidth(). A typical traceback is as
>> follows.
>>
>> usb 1-4: USB disconnect, device number 3
>> BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
>> PGD 0 P4D 0
>> Oops: 0000 [#1] PREEMPT SMP PTI
>> CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
>> Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
>> RIP: 0010:usb_ifnum_to_if+0x29/0x40
>> Code: <...>
>> RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
>> RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
>> RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
>> RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
>> R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
>> R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
>> FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
>> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
>> Call Trace:
>>  usb_hcd_alloc_bandwidth+0x1ee/0x30f
>>  usb_set_interface+0x1a3/0x2b7
>>  uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
>>  uvc_video_start_streaming+0x91/0xdd [uvcvideo]
>>  uvc_start_streaming+0x28/0x5d [uvcvideo]
>>  vb2_start_streaming+0x61/0x143 [videobuf2_common]
>>  vb2_core_streamon+0xf7/0x10f [videobuf2_common]
>>  uvc_queue_streamon+0x2e/0x41 [uvcvideo]
>>  uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
>>  __video_do_ioctl+0x33d/0x42a
>>  video_usercopy+0x34e/0x5ff
>>  ? video_ioctl2+0x16/0x16
>>  v4l2_ioctl+0x46/0x53
>>  do_vfs_ioctl+0x50a/0x76f
>>  ksys_ioctl+0x58/0x83
>>  __x64_sys_ioctl+0x1a/0x1e
>>  do_syscall_64+0x54/0xde
>>
>> While this is problem rarely observed in the field, it is relatively easy
>> to reproduce by adding msleep() calls into the code.
>>
>> I don't presume to claim that I found every issue, but this patch series
>> should fix at least the major problems.
>>
>> The patch series was tested exensively on a Chromebook running chromeos-4.19
>> and on a Linux system running a v5.8.y based kernel.
> 
> I'll review each patch individually, but I think 2/5, 4/5 and 5/5 should
> be handled in the V4L2 core, not the uvcvideo driver. Otherwise we would
> have to replicate that logic in all drivers, while I think it can easily
> be implemented in a generic fashion as previously discussed.
> 
The problem is that the v4l2 core already does support locking. There is
a global lock, in struct video_device, a queue lock in struct v4l2_m2m_ctx,
and another queue lock in struct vb2_queue. However, all of those have
to be initialized from the driver. The uvcvideo driver uses its own locks and
does not set the lock pointers in the various generic structures. I was able
to figure out how to use the uvcvideo specific locks in the uvcvideo
driver, but all my attempts to initialize and use the generic locks failed.

It may well be that the generic code isn't entirely clean - for example
I am not sure if the lock protection in v4l2_open() is complete since
it doesn't handle disconnects after checking if the video device is still
registered (and I don't really see the point of the second video_is_registered()
call in v4l2_open). However, that may just be a lack of understanding on my
side on how the code is supposed to work. Maybe the actual device open function
is expected to have its own protection against underlying hardware removal
and video device unregistration while opening the device.

[ Regarding the second call to video_is_registered() in v4l2_open():
  Add msleep(5000) between it and the call to the driver open function,
  disconnect the device during the sleep, and it will happily call the device
  open function on a non-registered video device. That is what patch 5/5 tries
  to fix or the uvcvideo driver.
  The same problem applies to other file operations in v4l2-dev.c: They all
  check if the video device is registered before calling the device
  specific code, but I don't really see the point of doing that because
  there is no protection against unregistration after the check was made
  and before/while the device specific code is running.
  Patch 4/5 tries to fix this for the uvcvideo driver.
  If that is a bug in the v4l2 code, I'll be happy to work on a fix,
  but the only generic fix I could think of would be to utilize the lock in
  struct video_device ... but that lock isn't initialized by the uvcvideo
  driver.
]

Either case, I don't think my understanding of the interaction between
v4l2 and uvcvideo is good enough to make more invasive changes. I _think_
any generic improvement should start with refactoring the uvcvideo code to
use the v4l2 locking mechanism. However, from the exchange here, my
understanding is that this locking mechanism is not used on purpose. That
means we'll have a uvcvideo specific locking mechanism, period, and I don't
think it is even possible to solve the problem without utilizing this locking
mechanism.

Of course, it may as well be that I am completely off track and clueless.
After all, the first time I looked into this code was about two weeks ago.
So please bear with me if I talk nonsense.

Thanks,
Guenter

>> ----------------------------------------------------------------
>> Guenter Roeck (5):
>>       media: uvcvideo: Cancel async worker earlier
>>       media: uvcvideo: Lock video streams and queues while unregistering
>>       media: uvcvideo: Release stream queue when unregistering video device
>>       media: uvcvideo: Protect uvc queue file operations against disconnect
>>       media: uvcvideo: In uvc_v4l2_open, check if video device is registered
>>
>>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
>>  drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
>>  drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
>>  drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
>>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>>  5 files changed, 93 insertions(+), 8 deletions(-)
> 

