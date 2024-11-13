Return-Path: <linux-media+bounces-21379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 882819C6FBB
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 13:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4878C282813
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 12:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F97F200BA5;
	Wed, 13 Nov 2024 12:50:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978841DD55A;
	Wed, 13 Nov 2024 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502222; cv=none; b=nTuMYAglhbwTYqZE1Ke5Ibtj1uTaiaoFoSuyRGt0SjDjVDWjtqQA9WmYUBhj9GdPp270YzRX++1RUMXh7iu06XxeT/ovwApLdkY+TQbhqybX9saO1BbROP+Soxmyr+odQUjJl9wTyfF2p/bpwG7h4ZVlPl8uWedZgiBSipUD6TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502222; c=relaxed/simple;
	bh=p7eBHMwhjhRcbQRsfdiry8DDKwHmaHJ4TFtZppYiEe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpRfpUx8TyXOtc53PrHg1BtpKkJmygwGsfO7W/hgoNbfbCfMZyGhm6H1hdtOuw5fGsBmzVeA7rBlN14iHcP9rXN7RrPCPftQEFPPau7lulRwDqBr9YMDVhxAxYYMt9fAp0DaUNmrHvTqUGvGuCcB8tOpEfgoCXGudwPcrNkOgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858FEC4CEE0;
	Wed, 13 Nov 2024 12:50:18 +0000 (UTC)
Message-ID: <5887ab26-5c95-4e0c-a831-9aa8254b6e85@xs4all.nl>
Date: Wed, 13 Nov 2024 13:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/28] media: iris: implement reqbuf ioctl with
 vb2_queue_setup
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-9-a88e7c220f78@quicinc.com>
 <96966b66-a93a-4675-8d28-6fe9152644b8@xs4all.nl>
 <0fb27983-e253-3375-1c01-bfad7d05485c@quicinc.com>
 <d4fb8e3e-d19e-4af5-8a16-8b8b53c3530e@xs4all.nl>
 <1360d885-52f1-9dbc-7beb-23ac58ec8ff0@quicinc.com>
 <0afd368a-36ed-4415-977b-abf6d245b754@xs4all.nl>
 <98696180-a40f-deca-13f3-e3636a0d9d16@quicinc.com>
 <ac01378f-1375-45bd-9369-187645657db9@xs4all.nl>
 <fa91d95a-2bcd-5768-02d7-4f80e4e006d9@quicinc.com>
 <567c33a2-9c35-4941-9356-b280c8138009@xs4all.nl>
 <64dbbe4b-fc16-25c9-22ce-e12bc89a7e0a@quicinc.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <64dbbe4b-fc16-25c9-22ce-e12bc89a7e0a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 13:44, Dikshita Agarwal wrote:
> 
> 
> On 11/13/2024 5:44 PM, Hans Verkuil wrote:
>> On 11/13/24 12:20, Dikshita Agarwal wrote:
>>>
>>>
>>> On 11/13/2024 4:45 PM, Hans Verkuil wrote:
>>>> On 11/13/24 11:32, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 11/13/2024 2:52 PM, Hans Verkuil wrote:
>>>>>> On 13/11/2024 10:00, Dikshita Agarwal wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/13/2024 1:18 PM, Hans Verkuil wrote:
>>>>>>>> On 13/11/2024 07:19, Dikshita Agarwal wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 11/12/2024 3:20 PM, Hans Verkuil wrote:
>>>>>>>>>> On 05/11/2024 07:55, Dikshita Agarwal wrote:
>>>>>>>>>>> Implement reqbuf IOCTL op and vb2_queue_setup vb2 op in the driver with
>>>>>>>>>>> necessary hooks.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>>>>>>> ---
>>>>>>>>
>>>>>>>> <snip>
>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>>>>>>> new file mode 100644
>>>>>>>>>>> index 000000000000..61033f95cdba
>>>>>>>>>>> --- /dev/null
>>>>>>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>>>>>>> @@ -0,0 +1,74 @@
>>>>>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>>>>>> +/*
>>>>>>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>>>>>> + */
>>>>>>>>>>> +
>>>>>>>>>>> +#include "iris_buffer.h"
>>>>>>>>>>> +#include "iris_instance.h"
>>>>>>>>>>> +#include "iris_vb2.h"
>>>>>>>>>>> +#include "iris_vpu_buffer.h"
>>>>>>>>>>> +
>>>>>>>>>>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>>>>>>>>>>> +			 unsigned int *num_buffers, unsigned int *num_planes,
>>>>>>>>>>> +			 unsigned int sizes[], struct device *alloc_devs[])
>>>>>>>>>>> +{
>>>>>>>>>>> +	enum iris_buffer_type buffer_type = 0;
>>>>>>>>>>> +	struct iris_buffers *buffers;
>>>>>>>>>>> +	struct iris_inst *inst;
>>>>>>>>>>> +	struct iris_core *core;
>>>>>>>>>>> +	struct v4l2_format *f;
>>>>>>>>>>> +	int ret = 0;
>>>>>>>>>>> +
>>>>>>>>>>> +	inst = vb2_get_drv_priv(q);
>>>>>>>>>>> +
>>>>>>>>>>> +	mutex_lock(&inst->lock);
>>>>>>>>>>> +
>>>>>>>>>>> +	core = inst->core;
>>>>>>>>>>> +	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
>>>>>>>>>>> +
>>>>>>>>>>> +	if (*num_planes) {
>>>>>>>>>>> +		if (*num_planes != f->fmt.pix_mp.num_planes ||
>>>>>>>>>>> +			sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage)
>>>>>>>>>>> +			ret = -EINVAL;
>>>>>>>>>>> +		goto unlock;
>>>>>>>>>>> +	}
>>>>>>>>>>> +
>>>>>>>>>>> +	buffer_type = iris_v4l2_type_to_driver(q->type);
>>>>>>>>>>> +	if (buffer_type == -EINVAL) {
>>>>>>>>>>
>>>>>>>>>> Can this ever fail?
>>>>>>>>>>
>>>>>>>>> If the q->type passed is not supported by driver then it can fail.
>>>>>>>>
>>>>>>>> But it is the driver that sets q->type when the vb2_queue is initialized.
>>>>>>>> So it makes no sense to test it here, it would be a driver bug if this fails.
>>>>>>>>
>>>>>>> Ok, Will remove this check.
>>>>>>>>>>> +		ret = -EINVAL;
>>>>>>>>>>> +		goto unlock;
>>>>>>>>>>> +	}
>>>>>>>>>>> +
>>>>>>>>>>> +	if (!inst->once_per_session_set) {
>>>>>>>>>>> +		inst->once_per_session_set = true;
>>>>>>>>>>> +
>>>>>>>>>>> +		ret = core->hfi_ops->session_open(inst);
>>>>>>>>>>> +		if (ret) {
>>>>>>>>>>> +			ret = -EINVAL;
>>>>>>>>>>> +			dev_err(core->dev, "session open failed\n");
>>>>>>>>>>> +			goto unlock;
>>>>>>>>>>> +		}
>>>>>>>>>>> +	}
>>>>>>>>>>> +
>>>>>>>>>>> +	buffers = &inst->buffers[buffer_type];
>>>>>>>>>>> +	if (!buffers) {
>>>>>>>>>>
>>>>>>>>>> This definitely can never fail.
>>>>>>>>>>
>>>>>>>>> Right, will remove the check.
>>>>>>>>>>> +		ret = -EINVAL;
>>>>>>>>>>> +		goto unlock;
>>>>>>>>>>> +	}
>>>>>>>>>>> +
>>>>>>>>>>> +	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>>>>>>>>>> +	buffers->actual_count = *num_buffers;
>>>>>>>>>>
>>>>>>>>>> Don't mirror the number of buffers in actual_count, instead just always
>>>>>>>>>> ask for the number of buffers using vb2_get_num_buffers().
>>>>>>>>>>
>>>>>>>>>> This code is wrong anyway, since actual_count isn't updated if more
>>>>>>>>>> buffers are added using VIDIOC_CREATEBUFS.
>>>>>>>>>>
>>>>>>>>> Ok, so below would fix the VIDIOC_CREATEBUFS as well, right?
>>>>>>>>> - buffers->actual_count = *num_buffers;
>>>>>>>>> + buffers->actual_count = vb2_get_num_buffers();
>>>>>>> Does this look good?
>>>>>>
>>>>>> No. You shouldn't have the actual_count field at all, especially since I see that
>>>>>> you set it in several places. vb2_get_num_buffers() reports the current number of
>>>>>> buffers, which can change if userspace calls VIDIOC_CREATE_BUFS or REMOVE_BUFS.
>>>>>>
>>>>>> You shouldn't try to mirror that value yourself. If you need that information,
>>>>>> then call vb2_get_num_buffers().
>>>>>>
>>>>>> There are weird things going on in your driver w.r.t. actual_count and also min_count
>>>>>> (and I saw a count_actual as well, very confusing).
>>>>>>
>>>>>> I'm not sure what you are trying to achieve, but it doesn't look right.
>>>>>>
>>>>> We need to set the value of actual buffers being queued to firmware via a
>>>>> property, for that we are caching the value in actual_count so that we can
>>>>> set it to fw when needed.
>>>>
>>>> So do you need to know the number of allocated buffers, or the number of
>>>> buffers queued to the device instance?
>>>>
>>>> The first is reported by vb2_get_num_buffers(), the second is something
>>>> you can keep track of yourself: a buffer is queued in the buf_queue op and
>>>> dequeued when vb2_buffer_done is called. But this has nothing to do with
>>>> what happens in queue_setup.
>>>>
>>> We need to know the number of allocated buffers, hence using
>>> vb2_get_num_buffers() is fine as you said.
>>
>> Why do you need this? Are the buffer addresses also passed to the fw?
>>
>> Remember that buffer memory is only allocated when using V4L2_MEMORY_MMAP.
>> In the DMABUF case it just allocates vb2_buffer structs, not the actual
>> buffer memory. So a buffer can be dequeued and the corresponding dmabuf
>> closed (so the memory is freed) by the application.
>>
>> In other words, vb2_get_num_buffers() reports the number of allocated
>> vb2_buffer structs, but not the actual number of buffers in memory, that
>> might be different in the DMABUF case.
>>
>> What exactly is the firmware using this number for? What does it expect
>> it contains?
>>
> Firmware uses this number to create its internal buffer pool of
> input/output buffers. It should be the maximum numbers of buffers that can
> be queued by client, which is same as the number of allocated buffers.
> it doesn't need to match the number of buffers actually being queued.

Since with CREATE_BUFS userspace can add buffers on the fly, and with
REMOVE_BUFS it can remove buffers on the fly, the number of buffers can
fluctuate. Can the fw be updated whenever that number changes?

And if the fw just needs the max, can't you just set it to VIDEO_MAX_FRAME
and be done with it? Or does the fw allocate a lot of internal memory for
each buffer, so you want it to be a precise number?

Regards,

	Hans

> 
> Thanks,
> Dikshita
>> Regards,
>>
>> 	Hans
>>
>>>
>>> But would want to cache this in internal buffer strcuture in queue_setup,
>>> to be able to use later while setting to firmware.
>>>
>>> Thanks,
>>> Dikshita
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>>
>>>>> count_actual is the variable of the hfi struture being filled to set the
>>>>> property to fw,
>>>>> ---
>>>>> u32 ptype = HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL;
>>>>> struct hfi_buffer_count_actual buf_count;
>>>>> int ret;
>>>>>
>>>>> buf_count.type = HFI_BUFFER_INPUT;
>>>>> buf_count.count_actual = inst->buffers[BUF_INPUT].actual_count;
>>>>> ---
>>>>>
>>>>> Calling vb2_get_num_buffers from HFI layer will violate the current design
>>>>> of driver so will need to cache this info in upper layer, best place to do
>>>>> that seems to be queue_setup which is called from both VIDIOC_REQBUFS and
>>>>> VIDIOC_CREATE_BUFS.
>>>>> Any other suggestions for the same?
>>>>>
>>>>> To avoid the confusion, I can rename the actual_count to count_actual to
>>>>> match with hfi structure.
>>>>> Also, I can cleanup some part of driver where this variable is being
>>>>> updated un-necessarily.
>>>>> This is only needed to set the property to firmware as explained above.
>>>>>
>>>>> min_count holds the min numbers of buffer needed by firmware for the
>>>>> particluar session, it can be changed by firmware if source changes.
>>>>>
>>>>> Thanks,
>>>>> Dikshita
>>>>>> Regards,
>>>>>>
>>>>>> 	Hans
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Dikshita
>>


