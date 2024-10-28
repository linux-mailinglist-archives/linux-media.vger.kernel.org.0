Return-Path: <linux-media+bounces-20435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD809B354B
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB797283589
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D631DE3D1;
	Mon, 28 Oct 2024 15:48:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBA1DE2DA
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130539; cv=none; b=s86QhSyaDueLn0Rq0NwHEM+0pWL45fUIiTVkDv1tg8+gVJUeLLtSgzZQdCvJI9nmS648GDVtQ1uC0AWruEs9r4+dopGdaBUxLTdTV58lKjCHsNwYALSF03PJzoUs8YkrBnMpKBaNlIZtmNl/dOtMIU4WN5n32TCXQgo40ki+gwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130539; c=relaxed/simple;
	bh=zDSFHoJ4XRHTdAcopNLbfcFeaJpefcANU+pczpLEzu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsdYJnmIolDtypqvPexTYgGe+EomCB91QRLRduimTV4QUI7hhdx2OXxls+ibFB18XSphKvWzc4fZXP2vWKkqcX2N5mzY3ZoK807H9T7pGEUcnotClKCmc3yT+fVdzHyPrQ6ZmeZsDJOvgt49LTkPB5prmyO2JAPEPexMakcwfnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67486C4CEC3;
	Mon, 28 Oct 2024 15:48:57 +0000 (UTC)
Message-ID: <6fcbb221-2b28-4fd2-8466-8c3aa711edb2@xs4all.nl>
Date: Mon, 28 Oct 2024 16:48:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rkisp1: Reduce min_queued_buffers to 0
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>,
 "open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
 Adam Pigg <adam@piggz.co.uk>
References: <20241028143553.36704-1-jacopo.mondi@ideasonboard.com>
 <392682fd-3325-41ab-825d-67cb3de4c7b2@xs4all.nl>
 <ncxqnajjdty456w6wsk5sonjuk3e2uzvcse7bdmmmmk4lop5i2@73vuqxkol4nr>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <ncxqnajjdty456w6wsk5sonjuk3e2uzvcse7bdmmmmk4lop5i2@73vuqxkol4nr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2024 16:30, Jacopo Mondi wrote:
> Hi Hans
> 
> On Mon, Oct 28, 2024 at 04:02:13PM +0100, Hans Verkuil wrote:
>> On 28/10/2024 15:35, Jacopo Mondi wrote:
>>> There apparently is no reason to require 3 queued buffers to call
>>> streamon() for the RkISP1 as the driver operates with a scratch buffer
>>> where frames can be directed to if there's no available buffer provided
>>> by userspace.
>>>
>>> Reduce the number of required buffers to 0 to allow applications to
>>> operate by queueing capture buffers on-demand.
>>>
>>> Tested with libcamera, by operating with a single capture request. The
>>> same request (and associated capture buffer) gets recycled once
>>> completed. This of course causes a frame rate drop but doesn't hinder
>>> operations.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> The first version of this patch set min_queued_buffers to 1, but setting it
>>> to 0 doesn't compromise operations and it's even better as it allows application
>>> to queue buffers to the capture devices on-demand. If a buffer is not provided
>>> to the DMA engines, image data gets directed to the driver's internal scratch
>>> buffer.
>>> ---
>>>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>> index 2bddb4fa8a5c..5fcf9731f41b 100644
>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>> @@ -35,8 +35,6 @@
>>>  #define RKISP1_SP_DEV_NAME	RKISP1_DRIVER_NAME "_selfpath"
>>>  #define RKISP1_MP_DEV_NAME	RKISP1_DRIVER_NAME "_mainpath"
>>>
>>> -#define RKISP1_MIN_BUFFERS_NEEDED 3
>>> -
>>>  enum rkisp1_plane {
>>>  	RKISP1_PLANE_Y	= 0,
>>>  	RKISP1_PLANE_CB	= 1,
>>> @@ -1563,7 +1561,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>>>  	q->ops = &rkisp1_vb2_ops;
>>>  	q->mem_ops = &vb2_dma_contig_memops;
>>>  	q->buf_struct_size = sizeof(struct rkisp1_buffer);
>>> -	q->min_queued_buffers = RKISP1_MIN_BUFFERS_NEEDED;
>>> +	q->min_queued_buffers = 0;
>>
>> You can probably just drop this since the vb2_queue struct is zeroed when it
>> is allocated. So no need to set it to 0.
> 
> I suspected so :)
> 
>>
>> And is the RKISP1_MIN_BUFFERS_NEEDED define still needed after this change?
> 
> No, and this patch removes it in facts
> 
>  -#define RKISP1_MIN_BUFFERS_NEEDED 3
>  -

I should have checked the patch :-) Sorry for the noise.

> 
>>
>> Also, see my RFC I posted today:
>>
>> https://lore.kernel.org/linux-media/126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl/T/#u
>>
>> My main concern is that applications that just call VIDIOC_REQBUFS with count = 1
>> and expect the driver to change that to a workable value, will, in fact, now just get
>> one buffer. And streaming that will cause lots of frame drops.
>>
>> It makes sense to leave min_queued_buffers at 0 if a scratch buffer is available,
>> but I'm unhappy with the fact that you get a poor experience when REQBUFS(1) is called.
> 
> Yeah, I've read the discussion between you and Tomi and it seemed like
> a good time to re-send this patch.
> 
>>
>> My RFC suggests improvements in the uAPI. With that in place you can use CREATE_BUFS in
>> libcamera to get much better control over how many buffers should be allocated.
>>
> 
> In my understanding min_queued_buffers identifies how many buffers
> should be queued before calling start_streaming, and this comes
> directly from an hw/driver requirement. This doesn't mean that at
> least min_queue_buffers should be queued at all the times during
> streaming, at least, I don't see how and where videobuf2 enforces
> this. Or does it ?

It's an intrinsic property of the HW/driver: e.g. if it needs two buffers
queued up for the DMA engine to work, then it really is always holding on
to two buffers. The only thing the framework does is postpone calling
start_streaming until that number of buffers is queued to ensure the
DMA engine has what it needs to start. But after that vb2 doesn't check
it.

> 
> If the above is correct, then the number of buffers to be queued
> during streaming is, in my opinion, less an hw/driver requirement but
> more an application decision.

No, min_queued_buffers is a HW/drivers property: the DMA engine can't
start until that many buffers are queued up, and once it is started
it will always hold on to that many buffers.

So the application has to know somehow how many buffers are needed to
actually stream. One way is via VIDIOC_REQBUFS since that is supposed to
always return a workable number of buffers, the other is by actually
reporting the minimum number of buffers as per my RFC.

> As you said an application should be good with> 3 buffers (one queued, one currently being written to, one to be
> consumed by the application), but in very specific cases where an
> application retains the buffer for longer, for whatever reason, it
> might need a larger number of queued buffers to provide the DMA
> engines a space where to write data without them being discarded (to
> scratch buffers or discarded by the DMA engine itself, if the HW
> supports that). Or maybe an application is fine to drop frames and
> only queue buffers sporadically (if the HW supports that ofc).
> 
> For libcamera, and for this specific platform in particular, we're
> going to base new developments on the assumption that
> min_queued_buffers == 0, and it would be more convenient for use to be
> able to access its value from userspace to identify if we're running
> on a kernel with or without this patch being applied.

So my proposal in my RFC to expose min_num_buffers would work for libcamera?
It sounds like that's what you need.

Regards,

	Hans

