Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E62343D7D
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 11:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhCVKJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 06:09:12 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57039 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229548AbhCVKIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 06:08:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OHUBlugoM4XAGOHUElWvmW; Mon, 22 Mar 2021 11:08:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616407719; bh=8PO86o7OQjUm31wLOd8jbEJYpCIoWbUhnKgUlddDsVg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Iv/CdDuAgxPuFEtjXPCkbN++n8iF4ZwLAx03AoJCfCUvoEdypKlhbJub7VNCY4Nio
         htxDJsHAClo5gHmbFdjxOi0NAOwiB6RF+cBTx6Sz0X28UCSsPrGX+hvg5VddQ/TIkd
         HcdpxgfSOTDoDmjJ5EJst1UWfdBd7dow0MvtUug1YJYdey+u1sygl799gbRAXEqiB9
         /INgr4K4X6XCmmJsvihAkMyt2rU1s5s0H73kRttP5GUaHTqaWPn60L5FPVZHhnOoWs
         TDfdTvX0rXoTBYQfkxTJ8BVFkVuYptzUBEfc/+r14UNdujPVUdocYhWGWzwxtCxTV6
         ZbdK3+vq/3+sw==
Subject: Re: vb2_queue type question
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
 <YFhqg4Ux5p9LLTPO@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6dd99495-08ca-b047-0cfb-7728d88bfd75@xs4all.nl>
Date:   Mon, 22 Mar 2021 11:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFhqg4Ux5p9LLTPO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHO3gUr0G5FmVLfjnrfORr7iHmf5OGWrgYL0rbPb0ks43h3b+LFY7oIThkXt9sKfZZWGwpykDZaGBevr4MPmBh8Ha+HS0t5GfGpCHcu53gbxha52tVDP
 mBgPb4fDtuh84UL5+MsJH9cIJL2H0J2gJhrZA8Ddpv/FughpEvz2yDvaxjwHJoqx5eK12U7LFxRyi6IVt5vauwDxcJ9b3A4bTkZZeMIfs75UO5GYwTIulJFm
 MqHlCoIn1V6DQTjZ3CP5QFBOrIVgE5dDNT0kA/zYtTxLAYnVfRO3xaOVo2V9IbAa1ABzv4Yl85lVK8w9PZj96oqRIVqoZvsXqA65hMKrer8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/03/2021 10:59, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Mar 22, 2021 at 10:49:26AM +0100, Hans Verkuil wrote:
>> On 22/03/2021 10:18, Tomi Valkeinen wrote:
>>> Hi Hans,
>>>
>>> We were discussing this with Laurent and Sakari, I thought I'd ask if 
>>> you have any feedback on this.
>>>
>>> struct vb2_queue has 'type' field, so you can only use a queue for 
>>> buffers of a single type. struct video_device has 'queue' field, so you 
>>> can only use a single queue for a video_device instance.
>>>
>>> TI's SoCs have a CSI-2 receiver, with a bunch of DMA engines. The HW 
>>> doesn't care if we are currently capturing pixel buffers or metadata 
>>> buffers (I don't have experience with other HW, but I imagine this 
>>> shouldn't be a rare case). However, due to vb2_queue, the driver needs 
>>> to decide which one to support, which limits the possible use cases.
>>>
>>> I was browsing the code, and afaics the type field doesn't do much. It 
>>> is, of course, used to reject queuing buffers of wrong type, and also 
>>> (mostly in mem-2-mem code) to find out if functions are called in input 
>>> or output context.
>>>
>>> The latter one could be easily removed by just comparing the given queue 
>>> pointer to a stored pointer (e.g. queue == priv->input_queue).
>>>
>>> Do you see any problems if we were to change the type field to 
>>> type_mask, allowing multiple buffer types per queue? Or even remove the 
>>> vb2_queue->type. This raises some questions, like should a queue contain 
>>> only buffers of a single type or can it contain a mix of buffers (I 
>>> think it shouldn't contain a mix of buffers), or can a queue's type_mask 
>>> contain both input and output types (I don't see why not).
>>>
>>> An alternate which I tried was creating two vb2_queues, and switching 
>>> the video_device->queue at runtime based on set_format. It kind of 
>>> works, but I think the behavior is a bit unclear, and it might be 
>>> difficult to catch all the corner cases.
>>
>> A vb2_queue basically represents a buffer queue that will be fed to a
>> DMA engine. It assumes that all the buffers are of the same format,
>> which typically is tied directly to the type.
>>
>> The type of a vb2_queue can be changed if you like, but once buffers
>> are allocated it is fixed and can't be changed again until all buffers
>> are released. So you can't mix buffers of different types.
>>
>> This is actually done in the vivid driver: see vidioc_s_fmt_vbi_cap()
>> and vidioc_s_fmt_sliced_vbi_cap(): depending on the format the queue
>> type will be set to either capture raw or sliced VBI.
>>
>> The ivtv driver does the same thing.
>>
>> So as long as vb2_is_busy() returns false, you are free to change the
>> queue type.
>>
>> There is no need for a type_mask or anything like that. That's up to
>> the bridge driver to check. The vb2_queue type is there to ensure that
>> userspace isn't trying to mix buffers of different types, but as long
>> as no buffers are allocated it doesn't do anything and you are free to
>> change it.
> 
> I wasn't aware of this design rationale. It would be useful to expand
> the documentation of vb2_queue.type to document this. Or have I missed a
> different location where this is already explained ?
> 

It's probably not explained anywhere. It such a rare corner case that nobody
bothered. If this is going to be used more often, then I think it would be
a good idea to make a proper vb2 helper function through which you can change
the type, and that will also check with vb2_is_busy() if you are allowed to do
that.

Then that function can be documented in the header.

Changing types may also require you to change other vb2_queue fields as well,
but that's the responsibility of the bridge driver as well. For this particular
use-case I would expect that only the type field requires changing. Everything
else would stay the same, except perhaps for the vb2_ops.

Regards,

	Hans
