Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5705434A564
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 11:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCZKTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 06:19:09 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43501 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229589AbhCZKSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 06:18:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PjXzl4CMD43ycPjY2l3LQU; Fri, 26 Mar 2021 11:18:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616753915; bh=aiOj49CTK2emBOjAg4PpHDRodxkGyQDxI+TJ2mqpHXg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=v9QGy444h9Uo9NlrdyTZMENNcUv9b0SH9tmMrd91TGTog+t9k50QhqPWCjwz0lu50
         wHnCQBc9hAr2U/L3ui7nIhwFNOYkysvUQeX4vMJ8Kkd7WZy0IdjjM+lwq3HHQzaaLl
         toXiFm7yo41uvLyC6fUXh5sA1f9lP902PGw6qtVIjbWe0d8vzG9ZhLA/zdX1NVxA4T
         zWLKqZ5nt6tyWiGqq0BitN2hoRfvKuNFfFRVSzWipT4xkGz0vEQK4lGyZoGFSc4aLh
         Os9sNMqiNaQsTFB0xYUQXH5piRqhrZlzsPI6+dpaumcqoBjDm6gc+PNXugTYY3WqSL
         d84ghdNJkoJiA==
Subject: Re: vb2_queue type question
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <b86d16cc-e3b1-0db3-f544-9f630572126c@ideasonboard.com>
 <67107267-69c8-d87d-6579-5e7dac0400fb@xs4all.nl>
 <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7abd695a-4a6d-e447-59d0-cf359c319a77@xs4all.nl>
Date:   Fri, 26 Mar 2021 11:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a9325fd6-8f14-ced5-97c4-3d05dc7ab150@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE62H/TX+kMrfno36FbiNzXiGMIjsVBiQrJN8LPTNaXEjZOmLhPszQTC6ghaPfAZJUIw4fPxMDT9T6jZjnKxDchaLX1bnJbMYz9wWxh8diDfzD549pad
 ewoSiNu9pY/NA4a10qdAowxu85qHI/Y0vSBB/mWnr8iapo4oduFPwz5I3VL7htBmYAY1o5z26NTCz+UrJnAobpvLeDAVac6hTN/qWkNx1MXpMP/8BCGTbz/e
 TIKGE4uUFEffJpXEM03STxsq2ZdXMiaI5XtalESjb+CRpbciMqPVp61tXDgzlDOupOGEViClxizZ7Sgh4EpRrzbp6S+9CuAIO/5YSTV7H5k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/03/2021 10:57, Tomi Valkeinen wrote:
> Hi Hans,
> 
> On 22/03/2021 11:49, Hans Verkuil wrote:
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
> 
> So what's the expected behavior here if I have both normal video ops 
> (vidioc_g_fmt_vid_cap & co.) and metadata ops (vidioc_g_fmt_meta_cap & 
> co.) defined?
> 
> I can change the queue type in s_fmt as you suggest above, but what 
> should, say, vidioc_g_fmt_meta_cap return if the current format is not 
> metadata format? I made it return -EINVAL, but then v4l2-compliance says 
> "Metadata Capture G_FMT failed, but Metadata Capture formats defined". I 
> could also make vidioc_enum_fmt_meta_cap return an error, but then it 
> would look like no metadata is supported.

No, the format ioctls are not changed.

The only thing that you do is update the queue type when you set the
video or metadata format. When you start allocating buffers the queue type
of the last set format is used. At that moment any attempt to set the format
to another type will fail since vb2_is_busy(queue) will be true.

So only the s_fmt ioctl will change the type. The g/try_fmt ioctls just must
keep working as-is.

Regards,

	Hans

> 
> Should all the metadata ops always change the queue type? That would 
> prevent g_fmt from working when the queue is busy.
> 
>   Tomi
> 

