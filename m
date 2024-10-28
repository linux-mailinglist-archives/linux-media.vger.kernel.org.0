Return-Path: <linux-media+bounces-20432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB99B34F7
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B9C1C22DBA
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602DD1DE2D8;
	Mon, 28 Oct 2024 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RxO3W2KA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312D12F585;
	Mon, 28 Oct 2024 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129559; cv=none; b=UVALI221IRVTOJKISCdIkHZ6A4SM5uF8hr0r4gsF9SY/K7fxYpGtn5nHwPR/WaL3qKitTw4hdBCIlVq34aVsLiV68QID+hjbNx6bCthR+DNKy3usclYlop432+VhRvJBvxrcIEo1pxBAJRuJuj055Yhd9+tOLVvHsz5rQN0vWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129559; c=relaxed/simple;
	bh=NbMZisdFcz4ACvPI0iTxOfwwOk6Hcpnxy+CAtnZn0OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5u1uW/H20pjfifFh2gN2HbZpGwv3m9s0x4PofymO1JWLGqwpXNMPTWdq1vesJLtuFDY/PtOKEVLIOLyUVl9UJ+PHpCAyIuYnmtWuuZPn9JFpkk8UjypEisQW5p7vBLhXISJIuPIqwUCOkCWRDr3mGJa6vr/J8uXI25w4ab3R6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RxO3W2KA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D4F3743;
	Mon, 28 Oct 2024 16:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730129549;
	bh=NbMZisdFcz4ACvPI0iTxOfwwOk6Hcpnxy+CAtnZn0OY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RxO3W2KA54SlswsiY2OQCeQjf6fBZMEJSWNxwva8dwbRXH63VhRxVMIrpVXMiSp3B
	 sWxphgQaeietass/SrKrc1pgaLx25MhfbCQ48FEPim8FQ1/BjL3QxS3LaErDWGXZpI
	 sS/RlPxUG3zxaYdNVPNyigDBpbo/FdpLJEbVP/p8=
Message-ID: <62073d7a-0a4b-4440-90e5-dcce0dec72d7@ideasonboard.com>
Date: Mon, 28 Oct 2024 17:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Naushir Patuck
 <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <02f05b61-08e7-45f8-8d59-f79bc20d076f@ideasonboard.com>
 <74286a86-51b9-4742-bb0c-583d70b1b0a7@xs4all.nl>
 <505c502e-b67a-4dca-8420-eb87eae4e170@ideasonboard.com>
 <59cf95be-fb53-4a94-bc6e-f9dca322749d@xs4all.nl>
 <5832a2f9-c908-4f5a-a3ee-9cb7d23ddab4@ideasonboard.com>
 <563347aa-4155-47e1-b71a-0107aed83eb6@xs4all.nl>
 <20241028151713.GI24052@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241028151713.GI24052@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent,

On 28/10/2024 17:17, Laurent Pinchart wrote:
> On Mon, Oct 28, 2024 at 12:30:45PM +0100, Hans Verkuil wrote:
>> On 28/10/2024 12:25, Tomi Valkeinen wrote:
>>> On 28/10/2024 13:13, Hans Verkuil wrote:
>>>> On 28/10/2024 12:05, Tomi Valkeinen wrote:
>>>>> On 28/10/2024 12:11, Hans Verkuil wrote:
>>>>>> On 28/10/2024 10:21, Tomi Valkeinen wrote:
>>>>>>> On 24/10/2024 11:20, Hans Verkuil wrote:
>>>>>>>> Hi Tomi,
>>>>>>>>
>>>>>>>> I know this driver is already merged, but while checking for drivers that use
>>>>>>>> q->max_num_buffers I stumbled on this cfe code:
>>>>>>>>
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>>> +/*
>>>>>>>>> + * vb2 ops
>>>>>>>>> + */
>>>>>>>>> +
>>>>>>>>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>>>>>>>>> +               unsigned int *nplanes, unsigned int sizes[],
>>>>>>>>> +               struct device *alloc_devs[])
>>>>>>>>> +{
>>>>>>>>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
>>>>>>>>> +    struct cfe_device *cfe = node->cfe;
>>>>>>>>> +    unsigned int size = is_image_node(node) ?
>>>>>>>>> +                    node->vid_fmt.fmt.pix.sizeimage :
>>>>>>>>> +                    node->meta_fmt.fmt.meta.buffersize;
>>>>>>>>> +
>>>>>>>>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
>>>>>>>>> +        node->buffer_queue.type);
>>>>>>>>> +
>>>>>>>>> +    if (vq->max_num_buffers + *nbuffers < 3)
>>>>>>>>> +        *nbuffers = 3 - vq->max_num_buffers;
>>>>>>>>
>>>>>>>> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
>>>>>>>> is called. So 32 + *nbuffers is never < 3.
>>>>>>>>
>>>>>>>> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
>>>>>>>> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
>>>>>>>> for you.
>>>>>>>>
>>>>>>>> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
>>>>>>>> since the code is almost always wrong.
>>>>>>>
>>>>>>> Looking at this, the original code in the old BSP tree was, which somehow, along the long way, got turned into the above:
>>>>>>>
>>>>>>> if (vq->num_buffers + *nbuffers < 3)
>>>>>>>            *nbuffers = 3 - vq->num_buffers;
>>>>>>>
>>>>>>> So... I think that is the same as "q->min_reqbufs_allocation = 3"?
>>>>>>>
>>>>>>> The distinction between min_queued_buffers and
>>>>>>> min_reqbufs_allocation, or rather the need for the latter, still
>>>>>>> escapes me. If the HW/SW requires N buffers to be queued, why
>>>>>>> would we require allocating more than N buffers?
>>>>>>
>>>>>> min_queued_buffers is easiest to explain: that represents the requirements of the DMA
>>>>>> engine, i.e. how many buffers much be queued before the DMA engine can be started.
>>>>>> Typically it is 0, 1 or 2.
> 
> That's partly true only. Even if the hardware requires 2 buffers, a
> driver can allocate scratch buffers to lower the requirement for
> userspace. Setting min_queued_buffers to 1 is usually fine, as there are
> few use cases for userspace to start the hardware before a buffer is
> available to capture a frame to. A value of 2 is much more problematic,
> as it prevents operating with a single buffer. I know using a single
> buffer results in frame drops, but there are resource-constrained
> systems where application don't always need all the frames (such as the
> Raspberry Pi Zero for instance). I very strongly encourage drivers to
> never set a min_queued_buffers value higher than 1.
> 
>>>>>>
>>>>>> min_reqbufs_allocation is the minimum number of buffers that will be allocated when
>>>>>> calling VIDIOC_REQBUFS in order for userspace to be able to stream without blocking
>>>>>> or dropping frames.
>>>>>>
>>>>>> Typically this is 3 for video capture: one buffer is being DMAed, another is queued up
>>>>>> and the third is being processed by userspace. But sometimes drivers have other
>>>>>> requirements.
> 
> This is exactly why I dislike min_reqbufs_allocation when set based on
> this logic, it encodes assumption on userspace use cases that a capture
> driver really shouldn't make.
> 
>>>>>>
>>>>>> The reason is that some applications will just call VIDIOC_REQBUFS with count=1 and
>>>>>> expect it to be rounded up to whatever makes sense. See the VIDIOC_REQBUFS doc in
>>>>>> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-reqbufs.html
>>>>>>
>>>>>> "It can be smaller than the number requested, even zero, when the driver runs out of
>>>>>>     free memory. A larger number is also possible when the driver requires more buffers
>>>>>>     to function correctly."
>>>>>>
>>>>>> How drivers implement this is a mess, and usually the code in the driver is wrong as
>>>>>> well. In particular they often did not take VIDIOC_CREATE_BUFS into account, i.e.
>>>>>> instead of 'if (vq->num_buffers + *nbuffers < 3)' they would do 'if (*nbuffers < 3)'.
>>>>>
>>>>> Thanks, this was educational!
>>>>>
>>>>> So. If I have a driver that has min_queued_buffers = 1, I can use
>>>>> VIDIOC_CREATE_BUFS to allocate a single buffer, and then capture
>>>>> just one buffer, right? Whereas VIDIOC_REQBUFS would give me
>>>>> (probably) three (or two, if the driver does not set
>>>>> min_reqbufs_allocation). Three buffers makes sense for full
>>>>> streaming, of course.
>>>>>
>>>>>> When we worked on the support for more than 32 buffers we added min_reqbufs_allocation
>>>>>> to let the core take care of this. In addition, this only applies to VIDIOC_REQBUFS,
> 
> I agree it's better to handle it in the core than in drivers, even if I
> dislike the feature in the first place.
> 
>>>>>> if you want full control over the number of allocated buffers, then use VIDIOC_CREATE_BUFS,
>>>>>> with this ioctl the number of buffers will never be more than requested, although it
>>>>>> may be less if you run out of memory.
> 
> On a side note, we should transition libcamera to use VIDIOC_CREATE_BUFS
> unconditionally.
> 
>>>>>>
>>>>>> I really should go through all existing drivers and fix them up if they try to
>>>>>> handle this in the queue_setup function, I suspect a lot of them are quite messy.
>>>>>>
>>>>>> One thing that is missing in the V4L2 uAPI is a way to report the minimum number of
>>>>>> buffers that need to be allocated, i.e. min_queued_buffers + 1. Since if you want
>>>>>
>>>>> Hmm, so what I wrote above is not correct? One needs min_queued_buffers + 1? Why is that?
>>>>
>>>> The DMA engine always uses min_queued_buffers, so if there are only that many buffers,
>>>> then it can never return a buffer to userspace! So you need one more. That's the absolute
>>>> minimum. For smooth capture you need two more to allow time for userspace to process the
>>>> buffer.
>>>
>>> Hmm, ok, I see. Well, I guess my "I want to capture just a single frame" is not a very common case.
> 
> It's not that uncommon, see above.
> 
>>>
>>> Can I queue one buffer, start streaming, stop streaming, and get the
>>> filled buffer? But then I guess I don't when the buffer has been
>>> filled, i.e. when to call stop streaming.
>>
>> Exactly. If you really want that, then the driver has to be adapted in the way that Laurent
>> suggested, i.e. with one or more scratch buffers. But that is not always possible, esp. with
>> older hardware without an IOMMU.
> 
> Drivers can always allocate a full-frame scratch buffer in the worst
> case. That can waste memory though, which is less than ideal.
> 
>>> So, never mind, I don't actually have any use case for this, just wondering.
>>>
>>>>>
>>>>>> to use CREATE_BUFS you need that information so you know that you have to create
>>>>>> at least that number of buffers. We have the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control,
>>>>>> but it is effectively codec specific. This probably should be clarified.
>>>>>>
>>>>>> I wonder if it wouldn't be better to add a min_num_buffers field to
>>>>>> struct v4l2_create_buffers and set it to min_queued_buffers + 1.
> 
> Don't add the +1. We should give userspace the information it needs to
> make informed decisions, not make decisions on its behalf.
> 
>>>>>
>>>>> I think this makes sense (although I still don't get the +1).
>>>>>
>>>>> However, based on the experiences from adding the streams features
>>>>> to various ioctls, let's be very careful =). The new
>>>>> 'min_num_buffers' can be filled with garbage by the userspace. If
>>>>> we define the 'min_num_buffers' field to be always filled by the
>>>>> kernel, and any value provided from the userspace to be ignored, I
>>>>> think it should work.
>>>>
>>>> I've posted an RFC for this.
>>>
>>> Thanks, I'll check it out.
>>>
>>> For the original issue in this thread, I think the correct fix is to
>>> remove the lines from cfe_queue_setup(), and add
>>> "q->min_reqbufs_allocation = 3".
> 
> Or just don't set min_reqbufs_allocation ? This is a new driver, and it
> requires a device-specific userspace to operate the ISP. I don't think
> we need to care about applications blindly calling VIDIOC_REQBUFS(1) and
> expecting to get more buffers.

It doesn't require a device-specific userspace for plain CSI-2 capture.

If I understood right, the expected behavior for VIDIOC_REQBUFS is to 
return enough buffers for "smooth streaming". So even if device-specific 
userspace would be required, doesn't it still make sense to have 
min_reqbufs_allocation = 3?

Or is your point that even a device-specific userspace, which knows 
exactly what it's doing, would use VIDIOC_REQBUFS, instead of 
VIDIOC_CREATE_BUFS?

Also, if I don't set min_reqbufs_allocation, VIDIOC_REQBUFS(1) would 
still allocate two buffers, not one.

  Tomi


