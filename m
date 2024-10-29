Return-Path: <linux-media+bounces-20490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 786EF9B4400
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2E11C21476
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470D201254;
	Tue, 29 Oct 2024 08:18:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52318A95A
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 08:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189880; cv=none; b=Z9CQjCAV6/1Rj0HlMYOFlaSCsCeeMR9C+F9DBVfszAgAUx/VLaiaiQuuXlGdyvD2mJZX4BhoR+mNqMg3ZdQMRO6hjr1EUX0PoPHTaoUbVDTQK2VQa/bQQu89YWadL73pZPQ8AnObtdrbQAFzB7ra2cOBdvDjQl3wzI2vwVnRjxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189880; c=relaxed/simple;
	bh=P/DaXYmMmtgMvsRJPGuotneOmHGNfDIg33LKVnfw0iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1WplQREkkkFJyccDF0V1Ly7mIkWOZHKrCv1sfO9NHHaBt/FlwZApaHkMjKwk4I0Ej5CAoUpFj/o1ne1QaKS5GTmkhRAa9YvA9afts9Lxn53YCd5OC1s54i+mw1j1IXiu2vn/06iS+7luUa5FjhKO94Rua9IDmrwipABelmXMl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D89C4CECD;
	Tue, 29 Oct 2024 08:17:59 +0000 (UTC)
Message-ID: <e9ce9b42-ba66-4908-a528-b839272c2ab6@xs4all.nl>
Date: Tue, 29 Oct 2024 09:17:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
 <20241028155244.GK24052@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241028155244.GK24052@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2024 16:52, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Oct 28, 2024 at 12:10:22PM +0100, Hans Verkuil wrote:
>> Hi all,
>>
>> This mail thread uncovered some corner cases around how many buffers should be allocated
>> if VIDIOC_REQBUFS with count = 1 is called:
>>
>> https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8
> 
> I'll repeat below some comments I've made in that thread, as they're
> better discussed in the context of this RFC.
> 
>> When it comes to the minimum number of buffers there are a number of limitations:
>>
>> 1) The DMA engine needs at least N buffers to be queued before it can start. Typically
>>    this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
>>    So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
>>    DMA to. Allocating just one buffer would mean the DMA engine can never return that
>>    buffer to userspace (it would just keep recycling the same buffer over and over), so
>>    the minimum must be min_queued_buffers + 1.
> 
> I think you're mixing hardware and driver constraints here. Drivers can
> use scratch buffers to relax the hardware requirements, and allow
> userspace operation with less buffers than strictly required by the
> hardware.
> 
> The cost of allocating such scratch buffers vary depending on the
> device. When an IOMMU is available, or when the device has a line stride
> that can be set to 0 and supports race-free programming of the stride
> and buffer addresses, the scratch buffer can be as small as a single
> page or a single line. In other cases, a full-frame scratch buffer is
> required, which is costly, and the decision on whether or not to
> allocate such a scratch buffer should probably be taken with userspace
> being involved.

I honestly don't see why you would want to spend a lot of time on adding
scratch buffer support just to save a bit of memory. Is the use-case of
capturing just a single buffer so common? To me it seems that it only
makes sense to spend effort on this if you only need to capture a single
buffer and never need to stream more buffers.

Can you describe the use-case of capturing just a single buffer? Is that
just for testing libcamera? Or is it something that happens all the time
during normal libcamera operation?

Supporting scratch buffers is a lot of effort for something that is not
needed for normal streaming.

> 
> min_queued_buffers describes how the device operates from a userspace
> point of view, so I don't think it should be considered or documented as
> being a hardware requirement, but a driver requirement.

It's a hardware and/or driver requirement. It is absolutely not a userspace
requirement. Normal userspace applications that use VIDIOC_REQBUFS and just
stream video will never notice this.

> 
>> 2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
>>    ensures the application can smoothly process the video stream. Typically this will
>>    be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
>>    one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
>>    returns a filled buffer to userspace, and one buffer is processed by userspace.
>>
>>    This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
>>    to the driver to increment it to a workable value.
> 
> Do we know what those applications are ? I'm not disputing the fact that
> this may need to be supported to avoid breaking old userspace, but I
> also think this feature should be phased out for new drivers, especially
> drivers that require a device-specific userspace and therefore won't
> work out of the box with old applications.

xawtv is one: it will call REQBUFS with count = 2 (so this would fail for
any driver that sets min_queued_buffers to 2), and with count = 1 if it wants
to capture just a single frame.

'git grep min_queued_buffers|grep -v videobuf|wc' gives me 83 places where it is
set. Some of those are likely wrong (min_queued_buffers has been abused as a
replacement for min_reqbufs_allocation), but still that's quite a lot.

Mostly these are older drivers for hardware without an IOMMU and typically for
SDTV capture. So memory is not a consideration for those drivers since a
SDTV buffer is quite small.

> 
>> 3) Stateful codecs in particular have additional requirements beyond the DMA engine
>>    limits due to the fact that they have to keep track of reference buffers and other
>>    codec limitations. As such more buffers are needed, and that number might also vary
>>    based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>>    controls are used to report that. Support for this is required by the stateful codec
>>    API.
>>
>>    The documentation of these controls suggest that these are generic controls, but
>>    as of today they are only used by stateful codec drivers.
>>
>> 4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
>>    3 or 4 buffers since the buffers arrive at a high frequency.
> 
> High frame rates is an important feature, but it's also a can of worms.
> V4L2 is lacking the ability to batch multiple frames, we will have to
> address that. Hopefully it could be decoupled from this RFC.

It's a separate issue indeed. I just mentioned it because I know SDR drivers
use this. They are rarely used, though.

> 
>> Rather than have drivers try to correct the count value (typically incorrectly), the
>> vb2_queue min_reqbufs_allocation field was added to set the minimum number of
>> buffers that VIDIOC_REQBUFS should allocate if count is less than that.
> 
> Even if I dislike this feature, I agree it's better implemented through
> min_reqbufs_allocation than by manual calculations in drivers.
> 
>> VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
>> of how many buffers you want to create. It might create fewer buffers if you run out of
>> memory, but never more than requested.
>>
>> But what is missing is that if you use CREATE_BUFS you need to know the value of
>> min_queued_buffers + 1, and that is not exposed.
>>
>> I would propose to add a min_num_buffers field to struct v4l2_create_buffers
>> and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
>> that field. And vb2 can set it to min_queued_buffers + 1.
> 
> This would require allocating a buffer first to get the value. Wouldn't
> a read-only control be better ?

No. You can call CREATE_BUFS with count = 0: in that case it does nothing,
except filling in all those capabilities. It was designed with that in mind
so you have an ioctl that can return all that information.

> 
> Furthermore, I would rather provide the min_queued_buffers value instead
> of min_queued_buffers + 1. The V4L2 API should provide userspace with
> information it needs to make informed decisions, but not make those
> decisions in behalf of userspace. It's up to applications to add 1 or
> more buffers depending on their use case.

I would definitely want more opinions on this. What's the point of returning
min_queued_buffers and then creating that many buffers and still not be able
to stream?

Can you think of a scenario (e.g. in libcamera or elsewhere) where that makes
sense?

Also, will the average V4L2 user have the knowledge to understand that? You
have that knowledge, but I think for anyone else it would be really confusing.

> 
> I think we also need to discuss policies regarding scratch buffer
> allocation in the context of this RFC. When the hardware supports small
> scratch buffers, I would like to make it mandatory for drivers to do so
> and support min_queued_buffers = 0.

I would first like to know the use-case (as I mentioned above).

For the type of drivers I mostly work with (video receivers), it would just
be a lot of work for no gain. But perhaps for camera pipelines it does make
sense?

> When scratch buffers are expensive, do we want to still support them in
> the kernel, perhaps in a way controlled by userspace ? A userspace that
> can guarantee it will always provide min_queued_buffers + 1 buffers
> could indicate so and avoid scratch buffer allocation, while a userspace
> that can't provide that guarantee would get scratch buffers from the
> kernel.

That is really the difference between using VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS.
I.e., userspace can already choose this.

Just to clarify the reason for this RFC: the current situation is messy. There
is a lot of history and a lot of older drivers do not always do the right thing.

With this RFC I would like to get a consensus of how it should work. After that
I want to implement any missing bits and improve the documentation, and finally
go through the drivers and at least try to make them behave consistently.

Also I want to improve v4l2-compliance to test more corner cases, especially
if you use CREATE_BUFS instead of REQBUFS (I already have a patch for that
ready).

The work Benjamin did on increasing the max number of supported buffers and the
REMOVE_BUFS ioctl uncovered a lot of that messy history, and it is clear we need
to try and clarify how it should work.

>> The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>> are for stateful codec support only, at least for now.

I just discovered that v4l2-compliance and v4l2-ctl do not honor these controls
for stateful codecs. That's something that needs to be fixed.

There is also one other item that I would like to discuss: the vb2 queue_setup
callback is currently used for both REQBUFS and CREATE_BUFS, and it remains
confusing for drivers how to use it exactly. I am inclined to redesign that
part, most likely splitting it in two: either one callback for REQBUFS and one
for CREATE_BUFS, or alternatively, one callback when allocating buffers for
the first time (so REQBUFS and when CREATE_BUFS is called for the first time,
i.e. when no buffers are allocated yet), and one callback when adding additional
buffers. I would have to think about this, and probably experiment a bit.

Regards,

	Hans

>>
>> If this is in place, then min_reqbufs_allocation should be set to a sane number of
>> buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.
> 


