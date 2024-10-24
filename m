Return-Path: <linux-media+bounces-20197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C79AE48A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458F31C223B1
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BB81D63C1;
	Thu, 24 Oct 2024 12:13:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A431D5161;
	Thu, 24 Oct 2024 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771993; cv=none; b=h8Q3V5peQaqkwEPiYxxHDqS9HfkPSDhXA5NhW3NKwbHLo7Z7prq743KRXcZnjRiCjTGbRfBaZHEJaenOOK7+dz3ymwUq/uwW+4f22jd/Vd7TUTTNPigYtyI7WE3Djdra9F7v7nbXUwwGijFHWNEuSA7RMvPhIC1n0wv8i6qQfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771993; c=relaxed/simple;
	bh=5TBvku7s99J1ToH1kFVJYvaS2eZbCsj5+4aNN1tuYnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxjVTiJC+xfG+IjMlJ/IpFlLjUvL2QUIiDM+Qhq74ISE/oaaHayd9TygFSVZwjEguqROIYBOxKAMiPQ0hfQHNStVVOSyIISNr/T/ET7qjMDzzihNpqo4/XFwywz7pJSxS0HlJ3EN8x2J1tjXkNSciZDW88pvZ+24XxFawGdvQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EED7C4CEC7;
	Thu, 24 Oct 2024 12:13:09 +0000 (UTC)
Message-ID: <3a5f7d52-fbe9-4592-ab24-50cd6de548c2@xs4all.nl>
Date: Thu, 24 Oct 2024 14:13:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <b185e497-ad40-4fe3-9409-224993ed4924@ideasonboard.com>
 <af1456a3-3de8-4b11-9606-79b260bda47e@xs4all.nl>
 <20241024120507.GA6081@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241024120507.GA6081@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2024 14:05, Laurent Pinchart wrote:
> On Thu, Oct 24, 2024 at 01:21:43PM +0200, Hans Verkuil wrote:
>> On 24/10/2024 13:08, Tomi Valkeinen wrote:
>>> On 24/10/2024 11:20, Hans Verkuil wrote:
>>>> Hi Tomi,
>>>>
>>>> I know this driver is already merged, but while checking for drivers that use
>>>> q->max_num_buffers I stumbled on this cfe code:
>>>>
>>>> <snip>
>>>>
>>>>> +/*
>>>>> + * vb2 ops
>>>>> + */
>>>>> +
>>>>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>>>>> +               unsigned int *nplanes, unsigned int sizes[],
>>>>> +               struct device *alloc_devs[])
>>>>> +{
>>>>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
>>>>> +    struct cfe_device *cfe = node->cfe;
>>>>> +    unsigned int size = is_image_node(node) ?
>>>>> +                    node->vid_fmt.fmt.pix.sizeimage :
>>>>> +                    node->meta_fmt.fmt.meta.buffersize;
>>>>> +
>>>>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
>>>>> +        node->buffer_queue.type);
>>>>> +
>>>>> +    if (vq->max_num_buffers + *nbuffers < 3)
>>>>> +        *nbuffers = 3 - vq->max_num_buffers;
>>>>
>>>> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
>>>> is called. So 32 + *nbuffers is never < 3.
>>>>
>>>> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
>>>> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
>>>> for you.
>>>>
>>>> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
>>>> since the code is almost always wrong.
>>>
>>> Indeed, the code doesn't make sense. I have to say I don't know what
>>> was the intent here, but I think "at least 3 buffers should be
>>> allocated by REQBUFS" is the likely explanation.
>>>
>>> I think the hardware should work with even just a single buffer, so
>>> is it then fine to not set either q->min_queued_buffers nor
>>> q->min_reqbufs_allocation before calling vb2_queue_init()? This
>>> seems to result in REQBUFS giving at least two buffers.
>>
>> min_queued_buffers is really HW dependent. If not set, then
>> start_streaming can be called even if there are no buffers queued.
> 
> Having min_queued_buffers > 1 is bad for userspace, and it's much nicer
> to have it set to 0. The main issue with a value of 1 is that validation
> of the pipeline ends up being deferred to the first QBUF if it occurs
> after STREAMON, and error handling is then complicated.

The validation can be done in the prepare_streaming callback instead of
in start_streaming. prepare_streaming is called at STREAMON time.

> 
> It's not just a property of the hardware, kernel drivers can decide to
> work with scratch buffers if needed. In many cases, a scratch buffer
> allocated by the kernel could be very small, either relying on the same
> physical page being mapped through the IOMMU to a larger DMA space, or
> using a 0 stride value to write all lines to the same location.

None of which is possible for some of the older drivers (e.g. TI davinci)
that do not have an IOMMU and require two contiguous buffers before they can
start streaming. But for modern devices you can solve it through a scratch
buffer, that's true.

> 
> For drivers supported by libcamera, we will require min_queued_buffers
> <= 1 and may tighten that to == 0. Tomi, if you submit a patch, please
> try to target 0, and if that's too much work for now, set it to 1 at
> most.

Regards,

	Hans

> 
>> If your hardware can handle that, then it's fine to not set it.
>>
>>>>> +
>>>>> +    if (*nplanes) {
>>>>> +        if (sizes[0] < size) {
>>>>> +            cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +        size = sizes[0];
>>>>> +    }
>>>>> +
>>>>> +    *nplanes = 1;
>>>>> +    sizes[0] = size;
>>>>> +
>>>>> +    return 0;
>>>>> +}
> 


