Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABACB116F
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 16:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732698AbfILOuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 10:50:03 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:44247 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732444AbfILOuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 10:50:03 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 8QQ0iBwZqQUjz8QQ4i9fKY; Thu, 12 Sep 2019 16:50:00 +0200
Subject: Re: [RFC] V4L2 & Metadata: switch to /dev/v4l-metaX instead of
 /dev/videoX
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f26a4eb0-7009-a25f-29bc-3a292d2d79e1@xs4all.nl>
 <60769f0c-506c-4057-00ce-f4c8620441c5@ideasonboard.com>
 <20190912112114.3a66663f@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cb7fe2ed-d1f2-6ac8-6c0f-ec6b1aa5ddf3@xs4all.nl>
Date:   Thu, 12 Sep 2019 16:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912112114.3a66663f@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLiIqulueqHDuvwbkS+ynSzB8rW0KVZzZ8ZxbtZKz3Tf12N8ZT9gQOOuXhDFx7Ky93BeVYpYGKYFnwnuCLWLdYmqS6aczRmML0cm+AjhOqabfuF7QxdD
 oMSiF6d0sjQOYKWIuYsY6X9rhgqCoDw8PHmS7I4cQn71YcN+ZgQLcOL5nV4he+dq1jOQyqe0Rgqr6pYCtGbb5FjKufTe3iWDtsub1s/Qamh/bTUH4fSZ3OGJ
 CYon/yi3p+XUiGRKAtTvRh/a7x5/4xwhqR77rv2Hjm4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 4:21 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 12 Sep 2019 14:16:11 +0100
> Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
> 
>> Hi Hans,
>>
>> On 12/09/2019 08:48, Hans Verkuil wrote:
>>> Hi all,
>>>
>>> I am increasingly unhappy about the choice of /dev/videoX for metadata devices.
>>>
>>> It is confusing for end-users (especially w.r.t. the common uvc driver) and
>>> if we want to change this, then we need to do it soon.
> 
> Kernel has (about) nothing to do with how the userspace devnodes are
> named, as the actual name is given by udev.

To my knowledge the standard udev rules do not rename anything for media
devices, so in reality it IS the kernel that decides this.

But this is why I suggested to put it under a kernel config option.

> 
> Anyway, from Kernel standpoint, it sounds too late to change the name
> of the devices from "videoX" to something else, as a change like that
> may break existing apps.
> 
> It could make sense to have something like that at udev rules.

But wouldn't that break existing apps as well?

A bigger problem is that it isn't easy to detect the difference between
a regular video device and a metadata device: you'd have to call QUERYCAP
to determine that.

Now that device_caps is always available, perhaps we should exports that
as an attribute? Regardless of this specific issue, it would make it a lot
easier to write udev rules.

Regards,

	Hans

> 
> Btw, at least at the apps I'm maintaining on userspace, I'm not using
> /dev/foo to detect devices anymore. Instead, I'm relying on udev
> in order to enum devices, checking if the devnode support video stream
> capabilities before exposing them for userspace to select.
> 
>>>
>>> This patch https://patchwork.linuxtv.org/patch/58693/ adds a new VFL_TYPE_METADATA
>>> so at least drivers can now explicitly signal that they want to register a
>>> metadata device.
>>>
>>> This also makes it possible to add a kernel config option that allows you
>>> to select whether you want metadata devices to appear as videoX or v4l-metaX.
>>> I would prefer to set it to v4l-metaX by default.  
>>
>> I think I prefer this separation (v4l-metaX).
>>
>> Having metadata as a (separate) videoX seemed odd to me - but I only
>> saw/was affected by the metadata topics when it was too late it seemed ...
>>
>>
>>> We can also consider backporting this to the stable/long-term kernels.
>>>
>>> Metadata capture was introduced in 4.12 for the vsp1 driver, in 4.16 for the
>>> uvc driver and in 5.0 for the staging ipu3 driver.
>>>
>>> Does someone remember the reason why we picked /dev/videoX for this in the
>>> first place?  
>>
>> I've wondered why it's not a separate queue on the same video device -
>> much like we have multiple queues for V4L2-M2M devices ....
>>
>> The data is relative to the same frames coming from the main queue right ?
>>
>> That might have been awkward to express through our device type flags
>> though.
>>
>> Anyway, I thought the horse had bolted on this topic ?
>>
>>  :-D
>>
>>
>>> Regards,
>>>
>>> 	Hans
>>>   
>>
>>
> 
> 
> 
> Thanks,
> Mauro
> 

