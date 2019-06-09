Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4C83A2AC
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 02:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfFIA5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 20:57:08 -0400
Received: from resqmta-po-11v.sys.comcast.net ([96.114.154.170]:39228 "EHLO
        resqmta-po-11v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726190AbfFIA5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 20:57:07 -0400
Received: from resomta-po-10v.sys.comcast.net ([96.114.154.234])
        by resqmta-po-11v.sys.comcast.net with ESMTP
        id Zm3ihzCxnEDICZm8whpyNW; Sun, 09 Jun 2019 00:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1560041826;
        bh=qXVt5TQURcReYMprlBensZ+zJPw6F/S/i10fBQWNFbQ=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=SSuEpytSBwECOFRORZ0LwSNPKl/tTK0usvF6kec6z7G/zAsGNhK34WTcsh68877LL
         ITGmrAZNt7bbl2gqQa+PRAimiWr/uVk/iWvsXQb7/Ksy8Dtzdy/FLGdA0M7pFoLie4
         WKcnBAMEGx96iX8RjbQWLQnULvM4ig/F79MlSxpOMA9KkV1cUR56399/SZImaASUoa
         Kx3FVyt+HQo/ZAb9lA25+0Sc683M+MAzoleZboFx8lu+SRWeQI3JEbYLhdSL3I1G83
         1OFP/efiv4VbqzTSYZxAzz8EmA6jQMzDjLUehcj+vtS8xnZnPSIFIOeL9Zx4I1U3i2
         /QpY8ws48W8bQ==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-10v.sys.comcast.net with ESMTPA
        id Zm8khKpy1OGz5Zm8whyVU6; Sun, 09 Jun 2019 00:57:06 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduuddrudegledgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucffohhmrghinhepuhgsuhhnthhufhhorhhumhhsrdhorhhgpdhnrghrkhhivhgvrdgtohhmnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Xfinity-VMeta: sc=-100;st=legit
Subject: Re: [PATCH v1 3/3] [media] mceusb: Show USB halt/stall error recovery
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
From:   A Sun <as1033x@comcast.net>
Message-ID: <cf733b41-2f3c-267e-0fcf-5e9aed3f3f92@comcast.net>
Date:   Sat, 8 Jun 2019 20:56:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/8/2019 4:37 AM, Sean Young wrote:
> Hi,
> 

>>> I think you can call usb_lock_device_for_reset() to prevent that problem.
>>
>> Deadlock still occurs in test:
>> mceusb_deferred_kevent()
>>     ->usb_reset_device()
>>         ->mceusb_dev_disconnect()
>>             ->cancel_work_sync()
>> where cancel_work_sync() blocks because mceusb_deferred_kevent() is active.
> 
> I understand. The usb_reset_device() does not need to happen synchronously
> in mceusb_deferred_kevent(). Possibly another delayed workqueue.
> 
> Actually there is also a function usb_queue_reset_device() which might do
> what you want here.
> 

Thanks! Usb_queue_reset_device() appears to be exactly what I'm looking for.

With the help of your tip, I found Alan Stern ran into a virtually identical problem
(clear halt error and reset deadlock) with drivers/hid/usbhid/hid-core.c
https://linux-usb.vger.kernel.narkive.com/fc7Lng6q/patch-usbhid-improve-handling-of-clear-halt-and-reset
So patch for mceusb may be able to use the same techniques.

>>
>>> It would be nice to see this implemented too.
>>>
>>
>> Any additional tips to implement would help!
>> How to validate and test a rare condition with a larger audience?
> 
> This is hard. Do you know the model of the mceusb and host hardware?
> 

Host is Raspberry Pi 3B+ raspbian 4.14.xx version of mid year 2018.
mceusb Pinnacle Systems PCTV Remote USB with mce emulator interface version 1
device 2304:0225 produced the sequence:
        [59388.696941] mceusb 1-1.1.2:1.0: Error: urb status = -32 (RX HALT)
        [59388.698838] mceusb 1-1.1.2:1.0: rx clear halt error -32
RX permanently stops after the error.

All the work I'm doing for mceusb is with the above.


The other case (https://ubuntuforums.org/showthread.php?t=2406882) I heard about is:
Host ubuntu,
mceusb unknown, possibly
SMK eHome Infrared Transceiver with mce emulator interface version 1
Flooding of:
	mceusb 2-1.4:1.0: Error: urb status = -32 (RX HALT)

>> Hence, the moved line.
> 
> That's in a future patch. Please only change error strings in this patch.
> 

ok, I'll post a v2 version of this patch with only the error strings changes.

The instructions the error strings say (USB reset device manually) will be my patch
resolution for the mceusb stuck halt bug for some time.

In the meantime, I'll try and test (harder part) use of usb_queue_reset_device
for a future patch to automate the USB reset procedure.

Thanks again, ..A Sun
