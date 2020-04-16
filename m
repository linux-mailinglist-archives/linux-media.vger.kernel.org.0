Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB2D1ABC96
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503559AbgDPJQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:16:24 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44417 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441115AbgDPIGz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:06:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OzXYjxVq4lKa1OzXbjQkuA; Thu, 16 Apr 2020 10:06:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587024391; bh=VBI5oUG+uTezSFmxftHT4Qi6zUBNWPzbk7vNwQwfi28=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QO1ieELnqo10BZHUmPUqJZub9wgGiXSO6o4qaRBIVtAr+1ACuxHYJLgdKF7fhZbbZ
         5qw1Zix/2i54RNrWzSLcHBIfB5VfNnl+gT7I0BnObv10m7yKCPAZUGgJ9xttEqtUXj
         VhUIzeehrhLnRaiL1T+xVHHfWEkuR6e26nbIdwWeW+1N7QpkGH7LweFzwDiqDqvX/b
         fEWNi/0G8R08IWbrUMCZMmx0mj+G/3jePQj6kEB40BM3TrsqMcffmlbBhRyWtKhiPg
         UYDL2anRGuHNk/AFTPL443ffs73OjbsMQpCk3IwRysg3CmzhfLLdwMnjL13fIr0nD8
         m5AVxu7KUhTcg==
Subject: Re: Script to build the media documentation as if it were a single
 book
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20200414153739.30b58bdc@coco.lan>
 <e83dbd40-2a34-3bad-be5f-e451c3a5d020@xs4all.nl>
 <20200416092132.2cbfce7e@coco.lan>
 <c55b5aae-ffb5-3ca0-b855-1df4a2da08f9@xs4all.nl>
 <20200416095554.53566315@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a3236eb0-2328-266e-b5b2-167e37b56c7a@xs4all.nl>
Date:   Thu, 16 Apr 2020 10:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416095554.53566315@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDJKe/ismbLn4g8Tjnngs7xjHz5M5xZmhsXGcy8By/dTzvjxW/q09UDnQx+cgFKV5dY75F8yuE7NwTk8NOqfOOQa5Nfq0jjrveNhhiI+9vpiPaNGCMDh
 SKtTYvfeD1gS5sC9IZro18ftWAZ9jrFTIjfaysHIA9HJUI0Rp+R6vTEUaZy6nByqmEyunOCLfRBa5DPyOaho+nuTprR7CndpjFk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2020 09:55, Mauro Carvalho Chehab wrote:
> Em Thu, 16 Apr 2020 09:29:45 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> On 16/04/2020 09:21, Mauro Carvalho Chehab wrote:
>>> Em Thu, 16 Apr 2020 09:01:55 +0200
>>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>>   
>>>> On 14/04/2020 15:37, Mauro Carvalho Chehab wrote:  
>>>   
>>>>> ================================
>>>>> Linux Kernel Media Documentation
>>>>> ================================
>>>>>
>>>>> .. toctree::
>>>>> 	:maxdepth: 4
>>>>>
>>>>>         admin-guide/index
>>>>>         driver-api/index
>>>>>         userspace-api/index    
>>>>
>>>> Wouldn't it make more sense to have the userspace-api before the admin-guide?  
>>>
>>> There, I just placed them on alphabetic order.
>>>
>>> But answering your question, that depends on the audience ;-)
>>>
>>> -
>>>
>>> Yet, assuming that we are doing a good job, I would expect a lot more
>>> users than developers[1].  
>>
>> If you want to see what it looks like with userspace-api on top:
>>
>> https://hverkuil.home.xs4all.nl/spec/index.html
>>
>> I think it makes more sense that way.
> 
> With the current content, I fully agree with you. However, take a look
> at the RFC patch I just sent. It is just the start of something
> (and it is not aligned yet with the latest Kconfig changes).
> 
> Anyway, my plan is to add something that a random media user could
> find some useful information, and point to our Wiki pages where
> it would make sense.

But that's only useful for people who need to build their own kernel or do
other admin tasks. That's a small group and it is usually a one-off thing.

The vast majority is interested in the public APIs.

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> [1] Granted, there are lots of gaps there for it to be a generic guide
>>>     to media subsystem. I'm planning to improve the admin-guide in order
>>>     to make it more consistent and useful for media users.
>>>
>>> The order there, IMHO, doesn't matter much, as someone accessing it from
>>> LinuxTV.org would likely use this URL:
>>>
>>> 	https://linuxtv.org/docs.php
>>>
>>> Side note: I need to add a pointer to the admin guide there - and at the
>>> wiki pages.
>>>
>>> Thanks,
>>> Mauro
>>>   
>>
> 
> 
> 
> Thanks,
> Mauro
> 

