Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A71C95009
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 23:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfHSVoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 17:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfHSVoL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 17:44:11 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C2192087E;
        Mon, 19 Aug 2019 21:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566251050;
        bh=sCaY4PV1zLguwJCbMU7zDajDtzMfprqvdXKtP/hBL3Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=yNAQmqIMNwW1dbup68v1cm4oKs3g1iwa6XGzkUairm6ujSoQWC5Cf9ZqmJuyWiTaf
         n1BbGjcyxJlI91ZjSCfWqHgNKD1dgeZAZ6/qvEYsq3l2B+NxuF0+VQfJu9G0dWFA7S
         rhAbXk6E/34EIgtginMPbyCLo6yl5FD6DV2z7e1c=
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     Nathan Royce <nroycea+kernel@gmail.com>,
        Brad Love <brad@nextdimension.cc>
Cc:     sean@mess.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc>
 <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
 <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org>
From:   shuah <shuah@kernel.org>
Message-ID: <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
Date:   Mon, 19 Aug 2019 15:44:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/19 2:49 PM, shuah wrote:
> On 8/16/19 7:15 PM, Nathan Royce wrote:
>> On Fri, Aug 16, 2019 at 1:42 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>> If you revert that one commit, does things start working again?
>>>
>>> thanks,
>>>
>>> greg k-h
>> Hey Greg, I just got finished building it after running "$ git revert
>> 812658d88d26" and verifying it reverted by comparing one of the files
>> from git log -p, but alas, no joy.
>>
>> On Fri, Aug 16, 2019 at 5:41 PM Brad Love <brad@nextdimension.cc> wrote:
>>>
>>> Hi Nathan,
>>>
>>> I don't have a "woodbury", but I have a Hauppauge 950Q sitting around
>>> and tested it on latest mainline kernel. w_scan is ok and streaming is
>>> fine. There's no unexpected errors. The 950Q uses the same au0828 bridge
>>> and au8522 demod as woodbury, but a different tuner. Your problem
>>> wouldn't appear to be a general au0828 issue.
>>>
> 
> Thanks Brad!
> 
>>> You might have to check out git bisect. That will be the quickest way to
>>> get to the bottom, if you've got points A and B, and are
>>> building/running your own kernel.
>>>
>>> Cheers,
>>>
>>> Brad
>> Thanks Brad, I'll explore bisecting and hopefully will be able to
>> narrow down the cause.
>> I wasn't running my own kernel, but rather using the Arch Linux kernel
>> and modding the one module and putting it in "extramodules".
>>
> 
> Hi Nathan,
> 
> Just catching up with this thread. Let me know what you find. Can you
> build your own kernel and see what you can find?
> 

You said you make changes to the

"Whenever I update my kernel, I edit the
./drivers/media/usb/au0828/au0828-cards.c file adding an entry for my
0x400 device.
I've been doing it for years and it's been working fine... until now..."

Please send me the changes you make to the file. I see the following
WOODBURY devices. I am assuming you add 0x400 entry.

{ USB_DEVICE(0x05e1, 0x0480),
                 .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },
         { USB_DEVICE(0x2040, 0x8200),
                 .driver_info = AU0828_BOARD_HAUPPAUGE_WOODBURY },


There is another table in sound/usb/quirks-table.h for AU0828
devices. In addition to 812658d88d26, 66354f18fe5f makes change
to this table to add a flag. I see two entries in that table:

AU0828_DEVICE(0x05e1, 0x0480, "Hauppauge", "Woodbury"),
AU0828_DEVICE(0x2040, 0x8200, "Hauppauge", "Woodbury"),

Since these drivers are now coupled doing resource sharing,
could it be that with your change to au02828 device table,
your changes are bow incomplete.

I don't have a Woodbury device though. This is something to
try.

Did you consider sending patch to add your device variant,
so you don't have to keep making this change whenever you
go to a new kernel?

thanks,
-- Shuah
