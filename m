Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE6F26ED0F
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 04:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgIRCQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 22:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729087AbgIRCQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 22:16:21 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EEBC06174A;
        Thu, 17 Sep 2020 19:16:20 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id m7so5145305oie.0;
        Thu, 17 Sep 2020 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gbH5E5rs2K3NqaRMteTzMKVEgZuAVTRrHWHQqwGDA4o=;
        b=p6vHxc0YjTvuEqqTvBvlwTCTWqD2Rb0xCIYpkPg3sHUL4nDfx27SZQGIlanZppmXH0
         Pe4SkaPu0MORVF7G7qxU4aNtlWsHAqwdP8/J/rkpx+KL9HeXSkPHzf3He+som1a8WhKU
         fIuO/qHHew2jBjEcgqoVivSMBIrZMqExC9g1AIF2GgX53KBFFhHRDHcp8XVbbkIdlFLP
         d2nDjxUlURkg5Plv+yZ5hhrNC7i6UjeczBWI+GuEbisYwocz5Gd0aJ1wcBRC0qDNaLB9
         Okqgsx9wXqYtP4VUwZcowjbsvhI7YOqDwwwWmQP+IOBrh8TlpqbbhqNCwqB/hbQjGQPQ
         08dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gbH5E5rs2K3NqaRMteTzMKVEgZuAVTRrHWHQqwGDA4o=;
        b=Q1cHaf95rGW986zCQW+qJQboaREiV1DYA2RZPPt5smezhrhyGP/Qc60CnTtUy5R5Ej
         +MUM2dBR8y51l24UBOkF4cjR4lO+nW9BWLDuVOs7RzmhjFqLXCLCCZhUlpO+Du0yeekW
         iHs8RlVtPaI4u1aF6cZd2h0IgULUHpWdksufkzK70d2BO7kqR3sb/NW1xFDc/7KOA8aG
         L9k4e9trRYnTumj/SuLeYKbTDElDR/jr34S/FmxUkeaOTSgWRU681lB6g1t+EoixzJ08
         DMy9GOGdkao3OYOV6EcGOryr4yiQzFLPB6+8Qqt13f99FhSc5MyYnxme8O4dyrk3ZmJb
         PJQg==
X-Gm-Message-State: AOAM5302MI4gzBeyPowvD9DaHfvVYYpJa/+u/GRcEncQ5gAf2qKyuUek
        lbQBMmpRMOcZix8hUfUOJxG9IPM08xY=
X-Google-Smtp-Source: ABdhPJyANTmdUjGmAK31LDiLmZktxjy1T+pPi2YYzYmlN1d/NYOIpmqSXorZoTUV4cFZgkTmvVWzcQ==
X-Received: by 2002:a54:4619:: with SMTP id p25mr7425373oip.18.1600395380127;
        Thu, 17 Sep 2020 19:16:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z5sm1240812otp.16.2020.09.17.19.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 19:16:19 -0700 (PDT)
Subject: Re: [PATCH RESEND v3 0/5] media: uvcvideo: Fix race conditions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200917022547.198090-1-linux@roeck-us.net>
 <20200917124714.GD3969@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <990652f1-b6e4-211c-7a96-8c3fc3ea6efd@roeck-us.net>
Date:   Thu, 17 Sep 2020 19:16:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917124714.GD3969@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 9/17/20 5:47 AM, Laurent Pinchart wrote:
> Hi Guenter,
> 
> On Wed, Sep 16, 2020 at 07:25:42PM -0700, Guenter Roeck wrote:
>> Something seems to have gone wrong with v3 of this patch series.
>> I am sure I sent it out, but I don't find it anywhere.
>> Resending. Sorry for any duplicates.
> 
> I haven't checked the mailing list, but I've found it in my inbox :-)
> I'm not forgetting about you, just been fairly busy recently. I still
> plan to try and provide an alternative implementation in the V4L2 core
> (in a form that I think should even be moved to the cdev core) that
> would fix this for all drivers.
> 
Thanks for letting me know. As it turns out, this problem is responsible
for about 2% of all Chromebook crashes, so I'll probably not wait for
the series to be accepted upstream but apply it as-is to the various
ChromeOS kernel branches.

> By the way, as you managed to get hold of non-UVC webcams, one thing you
> could try in your tests to make the drivers misbehave is to block on a
> DQBUF call, and unplug the device at that time. When blocking, DQBUF
> releases the driver lock (through the vb2ops .wait_prepare() and
> .wait_finis() operations for drivers based on vb2), so this may allow
> unregistration to proceed without waiting for userspace calls to
> complete.
> 

Good idea. I'll give it a try.

Thanks,
Guenter

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
>> While there are not many references to this problem on mailing lists, it is
>> reported on a regular basis on various Chromebooks (roughly 300 reports
>> per month). The problem is relatively easy to reproduce by adding msleep()
>> calls into the code.
>>
>> I tried to reproduce the problem with non-uvcvideo webcams, but was
>> unsuccessful. I was unable to get Philips (pwc) webcams to work. gspca
>> based webcams don't experience the problem, or at least I was unable to
>> reproduce it (The gspa driver does not trigger sending USB messages in the
>> open function, and otherwise uses the locking mechanism provided by the
>> v4l2/vb2 core).
>>
>> I don't presume to claim that I found every issue, but this patch series
>> should fix at least the major problems.
>>
>> The patch series was tested exensively on a Chromebook running chromeos-4.19
>> and on a Linux system running a v5.8.y based kernel.
>>
>> v3:
>> - In patch 5/5, add missing calls to usb_autopm_put_interface() and kfree()
>>   to failure code path
>>
>> v2:
>> - Added details about problem frequency and testing with non-uvc webcams
>>   to summary
>> - In patch 4/5, return EPOLLERR instead of -ENODEV on poll errors
>> - Fix description in patch 5/5
>>
>> ----------------------------------------------------------------
>> Guenter Roeck (5):
>>       media: uvcvideo: Cancel async worker earlier
>>       media: uvcvideo: Lock video streams and queues while unregistering
>>       media: uvcvideo: Release stream queue when unregistering video device
>>       media: uvcvideo: Protect uvc queue file operations against disconnect
>>       media: uvcvideo: Abort uvc_v4l2_open if video device is unregistered
>>
>>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 ++++++----
>>  drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++
>>  drivers/media/usb/uvc/uvc_queue.c  | 32 +++++++++++++++++++++++++--
>>  drivers/media/usb/uvc/uvc_v4l2.c   | 45 ++++++++++++++++++++++++++++++++++++--
>>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>>  5 files changed, 93 insertions(+), 8 deletions(-)
> 

