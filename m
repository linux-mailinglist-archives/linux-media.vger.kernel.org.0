Return-Path: <linux-media+bounces-20508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AAB9B4607
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 10:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96A641C2222C
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3932420408C;
	Tue, 29 Oct 2024 09:52:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FC47464
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730195562; cv=none; b=LYO1GivOSiNyjHc3i3lDtoFlP/rDYXt6ABP79RFayk9vtRNU43OHgTUmZG7v2nsShM2++iG+u1/P0R+V4ZunnYk08LVm8JunS4uURbk/QNFYtrSGOhjIYrrcIK9+Q1h04IAYE1GEKH0w281Nj/ecFsl3eJoeJRvdt8unEZUmxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730195562; c=relaxed/simple;
	bh=LLbLWhVZBF0Wcno58evLzhQ+7NgSCvMHUF3HKV9EJBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZHgVP8PKQnohYGa4/EXSZjLFt7UV/xLvOdhWnAz80Xgy4sVoW0f9zzugjW8xw3nlagkqRFDnhdCT4L1MWjvWA3NDMF1C5QJmr4XzCgraXO7zDBiKcsZjv/bWt2YXRo8AQHdyPoKC6zAePqHM319TmYeD79CAxBv2ykTRGdRiOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91693C4CECD;
	Tue, 29 Oct 2024 09:52:41 +0000 (UTC)
Message-ID: <ec9a7e23-a850-47c3-a17d-32f64e30dfcf@xs4all.nl>
Date: Tue, 29 Oct 2024 10:52:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
 <20241028155244.GK24052@pendragon.ideasonboard.com>
 <e9ce9b42-ba66-4908-a528-b839272c2ab6@xs4all.nl>
 <rwq3qbxuzfbglb5b5nczys33dhc6sezfcsoauna7r2x36uhz7k@akdq4yzjppsn>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <rwq3qbxuzfbglb5b5nczys33dhc6sezfcsoauna7r2x36uhz7k@akdq4yzjppsn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/24 09:52, Jacopo Mondi wrote:
> Hi Hans
> 
> On Tue, Oct 29, 2024 at 09:17:57AM +0100, Hans Verkuil wrote:
>> On 28/10/2024 16:52, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> On Mon, Oct 28, 2024 at 12:10:22PM +0100, Hans Verkuil wrote:
>>>> Hi all,
>>>>
>>>> This mail thread uncovered some corner cases around how many buffers should be allocated
>>>> if VIDIOC_REQBUFS with count = 1 is called:
>>>>
>>>> https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8
>>>
>>> I'll repeat below some comments I've made in that thread, as they're
>>> better discussed in the context of this RFC.
>>>
>>>> When it comes to the minimum number of buffers there are a number of limitations:
>>>>
>>>> 1) The DMA engine needs at least N buffers to be queued before it can start. Typically
>>>>    this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
>>>>    So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
>>>>    DMA to. Allocating just one buffer would mean the DMA engine can never return that
>>>>    buffer to userspace (it would just keep recycling the same buffer over and over), so
>>>>    the minimum must be min_queued_buffers + 1.
>>>
>>> I think you're mixing hardware and driver constraints here. Drivers can
>>> use scratch buffers to relax the hardware requirements, and allow
>>> userspace operation with less buffers than strictly required by the
>>> hardware.
>>>
>>> The cost of allocating such scratch buffers vary depending on the
>>> device. When an IOMMU is available, or when the device has a line stride
>>> that can be set to 0 and supports race-free programming of the stride
>>> and buffer addresses, the scratch buffer can be as small as a single
>>> page or a single line. In other cases, a full-frame scratch buffer is
>>> required, which is costly, and the decision on whether or not to
>>> allocate such a scratch buffer should probably be taken with userspace
>>> being involved.
>>
>> I honestly don't see why you would want to spend a lot of time on adding
>> scratch buffer support just to save a bit of memory. Is the use-case of
>> capturing just a single buffer so common? To me it seems that it only
>> makes sense to spend effort on this if you only need to capture a single
>> buffer and never need to stream more buffers.
> 
> I can give you two examples I'm currently working with
> 
> - A device with a "viewfinder" device node and a "still capture"
>   capture device. We want to only queue one buffer to the "still
>   capture" capture device when the user requires to (the usual "tap to
>   capture"). Adam which was in cc to my patch for RkISP1 that removes
>   min_queued_buffers was struggling to implement "tap to capture"
>   support in his application has he had to queue 3 buffers before he
>   could capture an image from the "still capture" pipe.
> 
> - A resource constrained device that only capture one frame
>   sporadically because it needs to reduce memory pressure and can't
>   allocate a number of buffers that allows it to keep the queued
>   buffers queue populated to sustain high frame rates produced by the
>   sensor
> 
> - In libcamera we want the image pipeline to be running even if no
>   buffers are queued to the capture devices at its end. This means
>   that we want statistics to be produced by the ISP and parameters to
>   be consumed even if the frames produced by the ISP are actually
>   discarded to the scratch buffers.
> 
>   We want this because we want the algorithms to keep running even if
>   users are queuing capture buffers sporadically, to ensure a smaller as
>   possible recovery period of the 3A algorithms (ideally, there
>   shouldn't be nothing to recover from as the system is 'live' all the
>   time) so we want stats to be generated for every frame produced by
>   the sensor. And we ideally want this from frame#0 without waiting
>   for users to queue a min number buffer to start the pipeline.
> 
> I'm sure in robotics/machine vision there are even more advanced use
> cases for capturing single buffers in response to events from the
> external world.

Just for the record: I have no problem with drivers implementing
scratch buffers so you can leave min_queued_buffers at 0. But I don't
think I would want to enforce it for non-ISP drivers, and it certainly
won't help existing drivers that set min_queued_buffers to a non-zero
value since those are old and nobody will change those drivers to
support scratch buffers.

> 
>>
>> Can you describe the use-case of capturing just a single buffer? Is that
>> just for testing libcamera? Or is it something that happens all the time
>> during normal libcamera operation?
>>
>> Supporting scratch buffers is a lot of effort for something that is not
>> needed for normal streaming.
>>
>>>
>>> min_queued_buffers describes how the device operates from a userspace
>>> point of view, so I don't think it should be considered or documented as
>>> being a hardware requirement, but a driver requirement.
>>
>> It's a hardware and/or driver requirement. It is absolutely not a userspace
>> requirement. Normal userspace applications that use VIDIOC_REQBUFS and just
>> stream video will never notice this.
>>
>>>
>>>> 2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
>>>>    ensures the application can smoothly process the video stream. Typically this will
>>>>    be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
>>>>    one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
>>>>    returns a filled buffer to userspace, and one buffer is processed by userspace.
>>>>
>>>>    This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
>>>>    to the driver to increment it to a workable value.
>>>
>>> Do we know what those applications are ? I'm not disputing the fact that
>>> this may need to be supported to avoid breaking old userspace, but I
>>> also think this feature should be phased out for new drivers, especially
>>> drivers that require a device-specific userspace and therefore won't
>>> work out of the box with old applications.
>>
>> xawtv is one: it will call REQBUFS with count = 2 (so this would fail for
>> any driver that sets min_queued_buffers to 2), and with count = 1 if it wants
>> to capture just a single frame.
>>
>> 'git grep min_queued_buffers|grep -v videobuf|wc' gives me 83 places where it is
>> set. Some of those are likely wrong (min_queued_buffers has been abused as a
>> replacement for min_reqbufs_allocation), but still that's quite a lot.
>>
>> Mostly these are older drivers for hardware without an IOMMU and typically for
>> SDTV capture. So memory is not a consideration for those drivers since a
>> SDTV buffer is quite small.
>>
>>>
>>>> 3) Stateful codecs in particular have additional requirements beyond the DMA engine
>>>>    limits due to the fact that they have to keep track of reference buffers and other
>>>>    codec limitations. As such more buffers are needed, and that number might also vary
>>>>    based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>>>    controls are used to report that. Support for this is required by the stateful codec
>>>>    API.
>>>>
>>>>    The documentation of these controls suggest that these are generic controls, but
>>>>    as of today they are only used by stateful codec drivers.
>>>>
>>>> 4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
>>>>    3 or 4 buffers since the buffers arrive at a high frequency.
>>>
>>> High frame rates is an important feature, but it's also a can of worms.
>>> V4L2 is lacking the ability to batch multiple frames, we will have to
>>> address that. Hopefully it could be decoupled from this RFC.
>>
>> It's a separate issue indeed. I just mentioned it because I know SDR drivers
>> use this. They are rarely used, though.
>>
>>>
>>>> Rather than have drivers try to correct the count value (typically incorrectly), the
>>>> vb2_queue min_reqbufs_allocation field was added to set the minimum number of
>>>> buffers that VIDIOC_REQBUFS should allocate if count is less than that.
>>>
>>> Even if I dislike this feature, I agree it's better implemented through
>>> min_reqbufs_allocation than by manual calculations in drivers.
>>>
>>>> VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
>>>> of how many buffers you want to create. It might create fewer buffers if you run out of
>>>> memory, but never more than requested.
>>>>
>>>> But what is missing is that if you use CREATE_BUFS you need to know the value of
>>>> min_queued_buffers + 1, and that is not exposed.
>>>>
>>>> I would propose to add a min_num_buffers field to struct v4l2_create_buffers
>>>> and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
>>>> that field. And vb2 can set it to min_queued_buffers + 1.
>>>
>>> This would require allocating a buffer first to get the value. Wouldn't
>>> a read-only control be better ?
>>
>> No. You can call CREATE_BUFS with count = 0: in that case it does nothing,
>> except filling in all those capabilities. It was designed with that in mind
>> so you have an ioctl that can return all that information.
>>
>>>
>>> Furthermore, I would rather provide the min_queued_buffers value instead
>>> of min_queued_buffers + 1. The V4L2 API should provide userspace with
>>> information it needs to make informed decisions, but not make those
>>> decisions in behalf of userspace. It's up to applications to add 1 or
>>> more buffers depending on their use case.
>>
>> I would definitely want more opinions on this. What's the point of returning
>> min_queued_buffers and then creating that many buffers and still not be able
>> to stream?
> 
> There are use cases for memory constrained systems where buffers are
> only queued sporadically. It might come from the requirement of
> allocating less buffers as possible [*] or because processing frames
> takes a longer time and maintaing the buffer queue populated for sustained
> frame-rate operations would require a lot of buffers to be reserved.

You misunderstood me, sorry for that.

My question was about whether CREATE_BUFS would report 'min_queued_buffers'
(so >= 0) or min_queued_buffers + 1 (so >= 1). In the latter case you can
pass that value on to REQBUFS. In the first case you would have to add 1 to
it yourself if you want to use it with REQBUFS. Personally I think that is
very confusing.

Regards,

	Hans

> 
> In general, we can't predict the use cases in which a driver will be
> used, so informing user-space about the actual requirements without
> trying to hint what they should do seems better to me,
> 
> [*] I understand that allocating a full scratch buffer in the driver
> kind of goes in the opposite direction of "not wasting memory" but if
> the DMA engine does not support discarding frames in HW, a single buffer
> in kernel space avoids a larger allocation in user space
> 
>>
>> Can you think of a scenario (e.g. in libcamera or elsewhere) where that makes
>> sense?
>>
>> Also, will the average V4L2 user have the knowledge to understand that? You
>> have that knowledge, but I think for anyone else it would be really confusing.
>>
>>>
>>> I think we also need to discuss policies regarding scratch buffer
>>> allocation in the context of this RFC. When the hardware supports small
>>> scratch buffers, I would like to make it mandatory for drivers to do so
>>> and support min_queued_buffers = 0.
>>
>> I would first like to know the use-case (as I mentioned above).
>>
>> For the type of drivers I mostly work with (video receivers), it would just
>> be a lot of work for no gain. But perhaps for camera pipelines it does make
>> sense?
>>
>>> When scratch buffers are expensive, do we want to still support them in
>>> the kernel, perhaps in a way controlled by userspace ? A userspace that
>>> can guarantee it will always provide min_queued_buffers + 1 buffers
>>> could indicate so and avoid scratch buffer allocation, while a userspace
>>> that can't provide that guarantee would get scratch buffers from the
>>> kernel.
>>
>> That is really the difference between using VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS.
>> I.e., userspace can already choose this.
>>
>> Just to clarify the reason for this RFC: the current situation is messy. There
>> is a lot of history and a lot of older drivers do not always do the right thing.
>>
>> With this RFC I would like to get a consensus of how it should work. After that
>> I want to implement any missing bits and improve the documentation, and finally
>> go through the drivers and at least try to make them behave consistently.
> 
> my2c: if CREATE_BUFFERS(0) allows to retrieve min_queued_buffers to
> allow userspace make informed decisions about how many buffers to
> allocate to at least get streaming going, I would be happy with such
> API more than with a control.
> 
> When it comes to scratch buffers usage, I'm not sure we can enforce it
> as a requirement (or even try to provide some helper in the core for
> drivers) but I defintately see use cases for applicating queueing buffers
> sporadically and for driver being ready to discard frames without
> stalling or delaying the start of the capture pipeline operations.
> 
> Thanks
>   j
> 
>>
>> Also I want to improve v4l2-compliance to test more corner cases, especially
>> if you use CREATE_BUFS instead of REQBUFS (I already have a patch for that
>> ready).
>>
>> The work Benjamin did on increasing the max number of supported buffers and the
>> REMOVE_BUFS ioctl uncovered a lot of that messy history, and it is clear we need
>> to try and clarify how it should work.
>>
>>>> The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>>> are for stateful codec support only, at least for now.
>>
>> I just discovered that v4l2-compliance and v4l2-ctl do not honor these controls
>> for stateful codecs. That's something that needs to be fixed.
>>
>> There is also one other item that I would like to discuss: the vb2 queue_setup
>> callback is currently used for both REQBUFS and CREATE_BUFS, and it remains
>> confusing for drivers how to use it exactly. I am inclined to redesign that
>> part, most likely splitting it in two: either one callback for REQBUFS and one
>> for CREATE_BUFS, or alternatively, one callback when allocating buffers for
>> the first time (so REQBUFS and when CREATE_BUFS is called for the first time,
>> i.e. when no buffers are allocated yet), and one callback when adding additional
>> buffers. I would have to think about this, and probably experiment a bit.
>>
>> Regards,
>>
>> 	Hans
>>
>>>>
>>>> If this is in place, then min_reqbufs_allocation should be set to a sane number of
>>>> buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.
>>>
>>
>>


