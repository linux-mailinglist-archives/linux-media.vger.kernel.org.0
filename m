Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B0D311C90
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 11:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhBFKTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 05:19:08 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46831 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229562AbhBFKTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 05:19:04 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8KfPlY0xnFFpm8KfSlIpdt; Sat, 06 Feb 2021 11:18:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612606699; bh=Xri9BfwvhrB4gD6yk6Fr2K2d2OVk8x5y/EOG3TDU+QU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kh2bFn0d02/sfz8xWLNS0SyjLw98vHcdPn0r5CucT+NbBLl3trMTKyPSmxH4c17qC
         YPxNRAeV1974jjUc7U/Ly8yjzjAE1tLZalJTHItmbgfgo+n0AFXVFhqPYJzQ2PbtU0
         DFrG/gRXLin66NS/W2T/BGzgPR8e0GMbOitwN+rEJytoLQkVOjLmu9xigf0j7aVN+1
         AC0RVB/17yV78YHdBfzU7/0y5qrg78FR8Whmw5w2yurUaPwtPW3lEIgWkMRkGgIKWN
         OcZ5QqYOguBY+2cGqaapW9gocSOOv/mLfyHeOQ79MWu3zuKl4HdCeItQN7nUF8bPml
         AHOuxORDsuQhw==
Subject: Re: Kernel version numbers after 4.9.255 and 4.4.255
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Battersby <tonyb@cybernetics.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jari Ruusu <jariruusu@protonmail.com>,
        David Laight <David.Laight@aculab.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-media@vger.kernel.org
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
 <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
 <20210205191105.128c6e48@coco.lan> <YB5DTUiurAwqZbz1@kroah.com>
 <20210206102402.2611b23f@coco.lan> <YB5hZop6JZ2Lgv63@kroah.com>
 <20210206104809.30c15609@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8220e22e-380f-5b4e-fa69-5c6fcace8535@xs4all.nl>
Date:   Sat, 6 Feb 2021 11:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210206104809.30c15609@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFrGSLo80uCTycdnKnb9k9YeEW+Js17uiCkwLgPwZJBXLiJLrXGqljvzXEQ07y5LCsbyx74UuFFitHegts0m+16xOfUBVvw2KhuFAF3b0Wu0WLE81Ezy
 8xeDXgnEM5NjurXgYDjc9KC4JYFKs8wOYksPtjUNYdWrx2AVR+FukVc80lAWDwg6FKBaa+bpr5RZmHXhbFSuMFSG4Io+PQ+uoBgxWaOvDxYOvcCV233KVxW1
 pUirA4O+U+77ZpdLgSL8AWZQ2Zqk2YxkihEhBUmQwxnMCrW69lpJmMIkX+pNz4srsr6pfU2C/WBiT96KKlMqzDfzH2Z77vd7VAwmIkp5uE36DeLWb62szwAT
 3f83ti6ztr0LrsIeQFh9H3QwlNDp8iyxKlHVTJ1vjK8qL9b9mbRG4So7b5tzUD/n0buRiGzkDYnQnEoDFVlzqFEdUVPlysyGerSWIneRk8lz7kOhs/nGThZv
 Lkb1tZc8n5ZWaUdFodM0wQ/L7dMcYPgIqz012A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/02/2021 10:48, Mauro Carvalho Chehab wrote:
> Em Sat, 6 Feb 2021 10:29:10 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
>> On Sat, Feb 06, 2021 at 10:24:02AM +0100, Mauro Carvalho Chehab wrote:
>>> Em Sat, 6 Feb 2021 08:20:45 +0100
>>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
>>>   
>>>> On Fri, Feb 05, 2021 at 07:11:05PM +0100, Mauro Carvalho Chehab wrote:  
>>>>> Em Fri, 5 Feb 2021 12:31:05 -0500
>>>>> Tony Battersby <tonyb@cybernetics.com> escreveu:
>>>>>     
>>>>>> On 2/4/21 6:00 AM, Jiri Slaby wrote:    
>>>>>>> Agreed. But currently, sublevel won't "wrap", it will "overflow" to 
>>>>>>> patchlevel. And that might be a problem. So we might need to update the 
>>>>>>> header generation using e.g. "sublevel & 0xff" (wrap around) or 
>>>>>>> "sublevel > 255 : 255 : sublevel" (be monotonic and get stuck at 255).
>>>>>>>
>>>>>>> In both LINUX_VERSION_CODE generation and KERNEL_VERSION proper.      
>>>>>>
>>>>>> My preference would be to be monotonic and get stuck at 255 to avoid
>>>>>> breaking out-of-tree modules.  If needed, add another macro that
>>>>>> increases the number of bits that can be used to check for sublevels >
>>>>>> 255, while keeping the old macros for compatibility reasons.  Since
>>>>>> sublevels > 255 have never existed before, any such checks must be
>>>>>> newly-added, so they can be required to use the new macros.
>>>>>>
>>>>>> I do not run the 4.4/4.9 kernels usually, but I do sometimes test a wide
>>>>>> range of kernels from 3.18 (gasp!) up to the latest when bisecting,
>>>>>> benchmarking, or debugging problems.  And I use a number of out-of-tree
>>>>>> modules that rely on the KERNEL_VERSION to make everything work.  Some
>>>>>> out-of-tree modules like an updated igb network driver might be needed
>>>>>> to make it possible to test the old kernel on particular hardware.
>>>>>>
>>>>>> In the worst case, I can patch LINUX_VERSION_CODE and KERNEL_VERSION
>>>>>> locally to make out-of-tree modules work.  Or else just not test kernels
>>>>>> with sublevel > 255.    
>>>>>
>>>>> Overflowing LINUX_VERSION_CODE breaks media applications. Several media
>>>>> APIs have an ioctl that returns the Kernel version:
>>>>>
>>>>> 	drivers/media/cec/core/cec-api.c:       caps.version = LINUX_VERSION_CODE;
>>>>> 	drivers/media/mc/mc-device.c:   info->media_version = LINUX_VERSION_CODE;
>>>>> 	drivers/media/v4l2-core/v4l2-ioctl.c:   cap->version = LINUX_VERSION_CODE;
>>>>> 	drivers/media/v4l2-core/v4l2-subdev.c:          cap->version = LINUX_VERSION_CODE;    
>>>>
>>>> This always struck me as odd, because why can't they just use the
>>>> uname(2) syscall instead?  
>>>
>>> I agree that this is odd on upstream Kernels.
>>>
>>> On backported ones, this should be filled with the version of the V4L2 core.
>>>
>>> We maintain a tree that allows running older Kernels with the latest V4L2
>>> media drivers and subsystem. On such tree, there's a patch that replaces
>>> LINUX_VERSION_CODE macro to V4L2_VERSION:
>>>
>>> 	https://git.linuxtv.org/media_build.git/tree/backports/api_version.patch
>>>
>>> There's a logic here which gets the version of the V4L2 used at the
>>> build. So, right now, it is filled with:
>>>
>>> 	#define V4L2_VERSION 330496 /* 0x050b00 */
>>>
>>> In other words, even if you run the backported driver on, let's say, Kernel
>>> 4.8, those calls will tell that the driver's version is from Kernel
>>> 5.11.  
>>
>> That too, is crazy and insane :)
>>
>>> Providing a little of history behind those, this came together with the
>>> V4L version 2 API developed during Kernel 2.5.x and merged at Kernel
>>> 2.6.0. 
>>>
>>> When such API was originally introduced, this field was meant to 
>>> contain the driver's version. The problem is that people used to change
>>> the drivers (even with major rewrites) without changing its version.
>>>
>>> We ended by standardizing it everywhere, filling those at the media core,
>>> instead of doing it at driver's level - and using the Kernel version.
>>>
>>> This way, developers won't need to be concerned of keeping this
>>> updated as the subsystem evolves.
>>>
>>> With time, we also improved the V4L2 API in a way that applications can
>>> be able to directly detect the core/driver functionalities without needing
>>> to rely on such fields. So, I guess recent versions of most open source
>>> applications nowadays don't use it.  
>>
>> Yes, driver "version" means nothing, so functionality is the correct way
>> to handle this.
>>
>> Any chance you all can just drop the kernel version stuff and just
>> report a static number that never goes up to allow people to use the
>> correct api for new stuff?  Pick a "modern" number, like 5.10 and leave
>> it there for forever.
> 
> Good question. I like the idea of keeping it fixed, marking those fields
> as DEPRECATED at the uAPI documentation.
> 
> However, at least the v4l2-compliance tool (used for V4L2 
> development) currently requires it:
> 
> 	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
> 		node->might_support_cache_hints = true;
> 
> Not sure if uname would work there, or if we would need, to use some
> Kconfig symbol to only return the real version on debug Kernels.
> 
> Hans,
> 
> What do you think?

It could be replaced by uname, but if we fix the version number to something
>= 5.9 (which we will no doubt do), then there is no need to change anything here.

But I was wondering if it wouldn't make sense to create a variant of
LINUX_VERSION_CODE that ignored the sublevel and just always leaves that
at 0. In practice, media API changes only happen at new kernel releases and
not in the stable series (there might be rare exceptions to that, but I'm
not aware of that).

And while we are using capability flags a lot more these days to ensure
userspace can discover what is and what is not available, we never did a full
analysis of that and I feel a bit uncomfortable about fixing the version
number.

I see more usages of LINUX_VERSION_CODE in the kernel that look like they do
something similar to what the media subsystem does, and that probably also
do not need the SUBLEVEL.

A LINUX_MAJOR_MINOR_CODE define (or whatever you want to call it) would solve
this problem for us.

Regards,

	Hans

> 
> 
>>
>>>>> Those can be used by applications in order to enable some features that
>>>>> are available only after certain Kernel versions.
>>>>>
>>>>> This is somewhat deprecated, in favor of the usage of some other
>>>>> capability fields, but for instance, the v4l2-compliance userspace tool
>>>>> have two such checks:
>>>>>
>>>>> 	utils/v4l2-compliance/v4l2-compliance.cpp
>>>>> 	640:	fail_on_test((vcap.version >> 16) < 3);
>>>>> 	641:	if (vcap.version >= 0x050900)  // Present from 5.9.0 onwards
>>>>>
>>>>> As far as I remember, all such checks are against major.minor. So,
>>>>> something like:
>>>>>
>>>>> 	sublevel = (sublevel > 0xff) ? 0xff : sublevel;
>>>>>
>>>>> inside KERNEL_VERSION macro should fix such regression at -stable.    
>>>>
>>>> I think if we clamp KERNEL_VERSION at 255 we should be fine for anyone
>>>> checking this type of thing.  Sasha has posted patches to do this.  
>>>
>>> Yes, this should be enough.
>>>
>>> As far as I remember, when opensource apps use the version from the API,
>>> since Kernel 3.0, they always check only for major.minor.
>>>
>>> So, the only problem with those APIs are due to overflows. Setting
>>> sublevel to any value beteen 0-255 should work, from V4L2 API
>>> standpoint.  
>>
>> Great, thanks for checking.
>>
>> greg k-h
> 
> 
> 
> Thanks,
> Mauro
> 

