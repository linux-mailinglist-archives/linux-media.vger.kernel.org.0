Return-Path: <linux-media+bounces-11842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32A8CE26F
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 10:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2578B22013
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 08:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFBF129A8D;
	Fri, 24 May 2024 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rf9Szd8L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308E71292E9;
	Fri, 24 May 2024 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539832; cv=none; b=EReX6SvfSrWYmmnzmLj0DeEAX90VKeuVTU3sh2VQv/pjRbIkmQlElqj4GThg4XzU4pl55cq96XgIxZ8qzFLgGnoSfuyflUPrXSISQRXtCJCfqEpzEbjq7SyEz/eN8+fWt0jOM04whiVThF9u2jo8MkUuuRUw2GRegrZBhv2C8xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539832; c=relaxed/simple;
	bh=4L3zRy2G25p+yu5kS7kMFfTnQ2bZrZ5d2I0JdRnMmrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We+gvCiTK+4Tteda9XfgdSC8VOrwdXZY2TFAJZ9TKziUytkAhHo8yZfPAK50v0rUCPcqz2gQHZ3CMntwc3Z8jxhieGX/tVG29uCxpo4741PxZ+EDsArN0RoOgxRtOh/8GEkXAnU+vzLf2xaL+pjRtsp7MH37Rc4hE8SCJHz8r8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rf9Szd8L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D0E19C1;
	Fri, 24 May 2024 10:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716539813;
	bh=4L3zRy2G25p+yu5kS7kMFfTnQ2bZrZ5d2I0JdRnMmrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rf9Szd8L5C1fMGIxE4U7Kdw8dSDhBiZmDwufrRMgfCnmu3nqJmrHtuP6erkETQaqe
	 l+y+9Ivzbl3OPDUJ8sq/h8tRPtGlmaaGSoj9T3JtoSYMHO/e8dE1TA7d31NZnJfvI+
	 MFULPvwtcqEF5Q3pg4Hqr72xaLbNdxx/ES/vUB84=
Message-ID: <3d8679ca-28a4-4b7b-99da-7f1ccedb415c@ideasonboard.com>
Date: Fri, 24 May 2024 09:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
 <20240523094926.GA10295@pendragon.ideasonboard.com>
 <417b2d78-6233-4fd7-9b32-aa176938f682@ideasonboard.com>
 <Zk-ukx7rh3kNMIRx@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <Zk-ukx7rh3kNMIRx@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good morning Sakari

On 23/05/2024 22:01, Sakari Ailus wrote:
> Hi Dan,
>
> On Thu, May 23, 2024 at 12:22:45PM +0100, Dan Scally wrote:
>> Hello
>>
>> On 23/05/2024 10:49, Laurent Pinchart wrote:
>>> On Thu, May 23, 2024 at 11:48:02AM +0200, Jacopo Mondi wrote:
>>>> On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
>>>>> Hi Daniel,
>>>> [snip]
>>>>
>>>>>> +
>>>>>> +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>>>>> +{
>>>>>> +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
>>>>>> +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
>>>>>> +	struct mali_c55_resizer *rzr = cap_dev->rzr;
>>>>>> +	struct mali_c55_isp *isp = &mali_c55->isp;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	guard(mutex)(&isp->lock);
>>>>>> +
>>>>>> +	ret = pm_runtime_resume_and_get(mali_c55->dev);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	ret = video_device_pipeline_start(&cap_dev->vdev,
>>>>>> +					  &cap_dev->mali_c55->pipe);
>>>>>> +	if (ret) {
>>>>>> +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
>>>>>> +			mali_c55_cap_dev_to_name(cap_dev));
>>>>>> +		goto err_pm_put;
>>>>>> +	}
>>>>>> +
>>>>>> +	mali_c55_cap_dev_stream_enable(cap_dev);
>>>>>> +	mali_c55_rzr_start_stream(rzr);
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * We only start the ISP if we're the only capture device that's
>>>>>> +	 * streaming. Otherwise, it'll already be active.
>>>>>> +	 */
>>>>>> +	if (mali_c55->pipe.start_count == 1) {
>>>>> Do you start streaming on the sensor when the first video node does?
>>>>>
>>>>> This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
>>>>> streaming on the sensor once all video nodes of the pipeline have been
>>>>> started.
>>>> How would you ever know which nodes will be started ?
>>> That can be done with link setup. Any video device that has an active
>>> link to the ISP would need to be started.
>>
>> So if you don't want to stream data from one of the two capture nodes, you'd
>> need to disable the link between it and the resizer? That seems quite
>> clunky. Does it matter if one of them starts a frame or two later? As
>> opposed to both of them starting in sync a frame or two later?
> Video frames on a given queue are lost due to the driver implementation.
> I might consider that to be a driver bug.


This seems a bit odd to me; I think that the implication is when you **queue** a buffer to the 
driver you're targeting a specific frame from the sensor...is that right? What about if you want to 
start streaming on the second capture node at some later point, after the first had already been 
started? I think we'd be in the same situation there, with the already started capture node getting 
buffers filled after the second had had buffers queued, but before you could start it.


>
> It's also true that some use cases could also benefit from the behaviour
> but on regular CSI-2 receivers that's probably quite rare. We'd need
> additional APIs to be able to convey the desired behaviour to the drivers.
>

