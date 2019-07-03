Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD575E9C0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 18:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbfGCQwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 12:52:20 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44877 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfGCQwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 12:52:20 -0400
Received: by mail-io1-f65.google.com with SMTP id s7so6375593iob.11
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eOE8oJo1jLJl9SLBjlosSkJnbhFFcHHRACJHk26QwOQ=;
        b=C156tufEn6WG7EdJi2MTk24Avjkc50Jjdny4Ov8S86j+PVK83t7uy4N9VEe4+6o3Wc
         9VZVljsgT3VKdeV+flS6NBMwAg/YEfUa6thdNJmXUJGfxVtzbr1yBxu6z7EhlFHSptr0
         GWq90v5PMdcKDW8D+rHNP17TqyVmCIBYtrHxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eOE8oJo1jLJl9SLBjlosSkJnbhFFcHHRACJHk26QwOQ=;
        b=KrDm14Ywp2+eHFolFk5QcocQ6JYKCJ6ecmS+UOx/HJovM2q/4hERneHbyNM6SY/9Q2
         wQi8kHT9LQihCFeMnMWmxo/yV7BTe9IqFM8jKQ4s4mg4V4N6X2bVvTiy6ZuQL4AhuIhH
         mwQyO+z5PHY7dz1iVYZ5HoOBnrtlcAvGZ8T3Sc/Bp69AMYC1PtwiKrfE35fABaQvegJt
         Sn8VzctdkYG5AXEBa++8XqbzSN2ilQc6jszFCLWvpB2Q6DfJrC+tjVId6MyuprXM2ee3
         ASk0gqXa0faaYLglsCh95hoosK3IEmPaJwUVQfMVq+/ukMSIdHL4gIKaABawtB9FA5aM
         kQWA==
X-Gm-Message-State: APjAAAXN/aqk/2u3CtMYYMqZhFXiNo7ieOrHnfSLoSOr7CsXgDezU9Rj
        k0MY7z22pb3dJvDnprPepwAqHd7xtEE=
X-Google-Smtp-Source: APXvYqxneK+7dpcPHIkrBfD0fSCa4RaBmemAZ3yGZQZFfI0Ab1rFgRiMgGcyodrENNgxZ3PeGcnbKA==
X-Received: by 2002:a02:9a0f:: with SMTP id b15mr8643257jal.32.1562172739026;
        Wed, 03 Jul 2019 09:52:19 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id p10sm3105924iob.54.2019.07.03.09.52.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:52:18 -0700 (PDT)
Subject: Re: [PATCH 0/2] Use Media Dev Allocator to fix vimc dev lifetime bugs
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1558667245.git.skhan@linuxfoundation.org>
 <c9160fe7-e880-4070-3959-b9e9177acf54@xs4all.nl>
 <2862ebca-c58f-c265-cc74-8d0f9b943275@collabora.com>
 <1c794ca1-5490-26a4-dc39-f86e05fadc46@linuxfoundation.org>
 <20190616184506.GD5006@pendragon.ideasonboard.com>
 <6e67ae76-6d37-cd70-c05f-1c6b6dd4af1a@linuxfoundation.org>
 <20190630114102.GB7043@pendragon.ideasonboard.com>
 <20190703161702.GA26461@bigcity.dyn.berto.se>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0306e792-e4b9-37b4-2ee0-9b0133c92828@linuxfoundation.org>
Date:   Wed, 3 Jul 2019 10:52:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703161702.GA26461@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Laurent,

On 7/3/19 10:17 AM, Niklas Söderlund wrote:
> Hi Shauah, Laurent,
> 
> On 2019-06-30 14:41:02 +0300, Laurent Pinchart wrote:
>> Hi Shuah,
>>
>> On Fri, Jun 28, 2019 at 10:41:07AM -0600, Shuah Khan wrote:
>>> On 6/16/19 12:45 PM, Laurent Pinchart wrote:
>>>> On Fri, Jun 14, 2019 at 05:26:46PM -0600, Shuah Khan wrote:
>>>>> On 6/13/19 7:24 AM, Helen Koike wrote:
>>>>>> On 6/13/19 2:44 AM, Hans Verkuil wrote:
>>>>>>> On 5/24/19 5:31 AM, Shuah Khan wrote:
>>>>>>>> media_device is embedded in struct vimc_device and when vimc is removed
>>>>>>>> vimc_device and the embedded media_device goes with it, while the active
>>>>>>>> stream and vimc_capture continue to access it.
>>>>>>>>
>>>>>>>> Fix the media_device lifetime problem by changing vimc to create shared
>>>>>>>> media_device using Media Device Allocator API and vimc_capture getting
>>>>>>>> a reference to vimc module. With this change, vimc module can be removed
>>>>>>>> only when the references are gone. vimc can be removed after vimc_capture
>>>>>>>> is removed.
>>>>>>>>
>>>>>>>> Media Device Allocator API supports just USB devices. Enhance it
>>>>>>>> adding a genetic device allocate interface to support other media
>>>>>>>> drivers.
>>>>>>>>
>>>>>>>> The new interface takes pointer to struct device instead and creates
>>>>>>>> media device. This interface allows a group of drivers that have a
>>>>>>>> common root device to share media device resource and ensure media
>>>>>>>> device doesn't get deleted as long as one of the drivers holds its
>>>>>>>> reference.
>>>>>>>>
>>>>>>>> The new interface has been tested with vimc component driver to fix
>>>>>>>> panics when vimc module is removed while streaming is in progress.
>>>>>>>
>>>>>>> Helen, can you review this series? I'm not sure this is the right approach
>>>>>>> for a driver like vimc, and even if it is, then it is odd that vimc-capture
>>>>>>> is the only vimc module that's handled here.
>>>>>>
>>>>>> Hi Hans,
>>>>>>
>>>>>> Yes, I can take a look. Sorry, I've been a bit busy these days but I'll
>>>>>> try to take a look at this patch series (and the others) asap.
>>>>>>
>>>>>> Helen
>>>>>>
>>>>>>> My gut feeling is that this should be handled inside vimc directly and not
>>>>>>> using the media-dev-allocator.
>>>>>
>>>>> Hi Hans and Helen,
>>>>>
>>>>> I explored fixing the problem within vimc before I went down the path to
>>>>> use Media Device Allocator API. I do think that it is cleaner to go this
>>>>> way and easier to maintain.
>>>>>
>>>>> vimc is a group pf component drivers that rely on the media device vimc
>>>>> in vimc and falls into the use-case Media Device Allocator API is added
>>>>> to address. The release and life-time management happens without vimc
>>>>> component drivers being changed other than using the API to get and put
>>>>> media device reference.
>>>>
>>>> Our replies crossed each other, please see my reply to Hans. I would
>>>> just like to comment here that if having multiple kernel modules causes
>>>> issue, they can all be merged together. There's no need for vimc to be
>>>> handled through multiple modules (I actually think it's quite
>>>> counterproductive, it only makes it more complex, for no added value).
>>>
>>> There are several problems in this group of drivers as far as lifetime
>>> management is concerned. I explained some of it in the patch 2/2
>>>
>>> If vimc module is removed while streaming is active, vimc_exit runs
>>> into NULL pointer dereference error when streaming thread tries to
>>> access and lock graph_mutex in the struct media_device.
>>>
>>> The primary reason for this is that:
>>>
>>> media_device is embedded in struct vimc_device and when vimc is removed
>>> vimc_device and the embedded media_device goes with it, while the active
>>> stream and vimc_capture continue to access it.
>>
>> The issue isn't so much that media_devic is embedded in vimc_device, but
>> that vimc_device is released too early. Not only does the thread need to
>> access the graph_mutex lock in the media_device structure, but it can
>> potentially access fields of the device-specific structures as well. The
>> proper solution is to propagate media_device_release() one level up, in
>> order to only release the top-level structure containing media_device
>> when the last reference to the media_device is dropped.
> 

Yes. vimc_device is the master device for all the component drivers and
it being released early definitely causes problems. I tried to solve
this by isolating the media_device embedded in it and taking that out
of contention for release later. This problem could be solved by making
sure vimc_device sticks around and I am on that solution now.

> I have seen similar problems with rcar-vin, the device specific data is
> released to early. In my case it was not triggered by the struct
> media_device but with a struct v4l2_device embedded in the device
> specific data IIRC.
> 
> This was when I tried to address the lifetime issues of the video device
> when binding/unbinding the device to the driver and not when unloading
> the module. This was quiet a while ago so I don't recall specifics,
> sorry about that. One finding was that there are also unsolved problems
> when it comes async notifiers and unloading/unbinding and then
> loading/binding subdevices as well as the driver controlling the video
> device. It was such a mess I gave up.
> 

Yes. You will find such problems with various media drivers. It could be
the v4l2 device or some other device that gets released while still in
use.

> I'm happy to see activity in this area but I fear it might need work on
> a higher level and not trying to work around the problem in drivers.
> 

Drivers still need to handle such issues anyway. Is there a reason why
you think it is a work-around?

>>
>>> If we chose to keep these drivers as component drivers, media device
>>> needs to stick around until all components stop using it. This is tricky
>>> because there is no tie between these set of drivers. vimc module can
>>> be deleted while others are still active. As vimc gets removed, other
>>> component drivers start wanting to access the media device tree.
>>
>> Reference-counting is the key.
>>
>>> This is classic media device lifetime problem which could be solved
>>> easily with the way I solved it with this series. I saw this as a
>>> variation on the same use-case we had with sound and media drivers
>>> sharing the media device.
>>
>> This isn't about solving it easily, it's about solving it properly. The
>> media device allocator as used here is a hack and takes us in the
>> opposite direction of a proper fix.
>>

Labeling this hack doesn't accurate. I agree though that this might be a
big hammer and there might be other solutions that can be limited to
just vimc scope. :)

>>> I have a TODO request from you asking to extend Media Device Allocator
>>> API to generic case and not restrict it to USB devices. My thinking is
>>> that this gives a perfect test case to extend the API to be generic
>>> and use to solve this problem.
>>
>> The biggest issue at the moment with the media device allocator, which I
>> have pointed out numerous times and has never been addressed (and which
>> explains why I didn't think the code was ready to be merged) is that the
>> media_device contains operations that are based on having a single
>> driver controlling the media device. A proper shared media device
>> allocator needs to drop the concept of a single master for the media
>> device, and thus needs to refactor those operations to allow any user of
>> the media device to implement them (the .link_notify() operation is a
>> prime example, and the recently added request operations will make this
>> even more challenging - think of how this patch series would prevent
>> vimc from properly implementing the request API). As long as these issue
>> are not fixed I will be firmly opposed to spreading the usage of the
>> media device allocator beyond what exists today.
>>

During the reviews, it was deemed necessary to make media driver as the
master for creating parts of the tree and provide hooks for other
drivers to add their own media components to the tree. The same is
extended to other interfaces. This feature was on ice for so long,
I don't recall all the details on how it evolved.

thanks,
-- Shuah

