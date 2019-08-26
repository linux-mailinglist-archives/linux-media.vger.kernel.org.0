Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488C29D928
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 00:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfHZWcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 18:32:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:56982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbfHZWcw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 18:32:52 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B54332080C;
        Mon, 26 Aug 2019 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566858771;
        bh=DO8QNLLXuCDlnGyxGga2q7nT+2QZpEapg80kfoCUTb0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=owf/BiTUrboc7LN0iyK021tz2vbOV4wCO/YUz67KZiA66ulPnoWUOAlKw45HNADpH
         73LUycoZ00uIMyPUTgFifB8zSuJ0pRQLAanh4ke9L0NOGF7Jbe1QZ34j/vrqTNguei
         TmIXCAjavUN4eJvxlI3XfRcD+idUcz1ix7SpI+Zg=
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     Nathan Royce <nroycea+kernel@gmail.com>
Cc:     Brad Love <brad@nextdimension.cc>, sean@mess.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
 <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc>
 <CALaQ_hqEZ-kco1esyB4mk0z9Q9Xt1XZsgYKR7gSdF7COERKoOA@mail.gmail.com>
 <eada38a3-258b-52ff-94a7-b8877899267e@kernel.org>
 <da6a1b65-cbe5-4e5e-d61c-43644a23da34@kernel.org>
 <CALaQ_hrPZ7LMBvuHnCLayxHoVFi5U0gtxF-33-ehR=phRs3D5A@mail.gmail.com>
 <94bfd12e-e9d4-1e6a-a18f-742e251f5cd9@kernel.org>
From:   shuah <shuah@kernel.org>
Message-ID: <4b3b5bf1-7ca0-2c40-a47f-1fe0cf89a4da@kernel.org>
Date:   Mon, 26 Aug 2019 16:32:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94bfd12e-e9d4-1e6a-a18f-742e251f5cd9@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/20/19 7:56 AM, shuah wrote:
> On 8/20/19 12:58 AM, Nathan Royce wrote:
>> While your mention of quirks-table.h certainly had possibilities, I'm
>> afraid adding the "AU0828_DEVICE(0x05e1, 0x0400, "Hauppauge",
>> "Woodbury")," entry for my tuner did not make any difference regarding
>> the "Tuner is busy. Error -19" message.
>>
>> I don't know if this means anything, but I see
>> https://patchwork.kernel.org/patch/97726/ from 2010 which contains
>> changes for the 0x0400 model. I guess it never got pulled in.
>>
>> Really, it's fine for me just to hang back at v5.1 for a year or two
>> until ATSC 3.0 USB tuners come out at a reasonable price.
>>
> 
> Hi Nathan,
> 
> The tuner busy error code is ENODEV. It appears some devices aren't
> created on your system. Would it be possible for you to send me your
> config and a complete dmesg.
> 
> I am curious if /dev/media0 or /dev/media1 present on your system.
> Not having this could explain the ENODEV you are seeing.
> 

Thanks for sending the dmesg and config. The difference between the
two config is you have CONFIG_MEDIA_CONTROLLER_DVB set in the second
one. This is expected because this is enabled in 5.2 with the changes
to share resources.

grep MEDIA_CONTROLLER config5115.txt
CONFIG_MEDIA_CONTROLLER=y
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# CONFIG_MEDIA_CONTROLLER_REQUEST_API is not set

grep MEDIA_CONTROLLER config529.txt
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
# CONFIG_MEDIA_CONTROLLER_REQUEST_API is not set
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y

A new code path in DVB is enabled in 5.2 compared to 5.1. What we are
seeing is somehow the DVB media graph is incomplete. When the enable
source tries to find the media device that corresponds to the fe entity
it can't find it and hence the -ENODEV you are seeing.

I would be curious to see what happens if you have disable
CONFIG_MEDIA_CONTROLLER

I think the problem is in dvb media graph creation on your device and
unfortunately, I don't have the device to debug the problem.

Will you be able run media-ctl --print-dot on your system and send
me the media graph. You can find media-ctl tool on

https://git.linuxtv.org/v4l-utils.git/

thanks,
-- Shuah
