Return-Path: <linux-media+bounces-11846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182B8CE437
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 12:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB661F22295
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 10:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F1E85659;
	Fri, 24 May 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HQ2cUX+I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334A39ADD;
	Fri, 24 May 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716546696; cv=none; b=h9PK7RIvyT6BTCMZUNj3PGVA6fGKBmq+5iFR0LL+UxeVLDq/IXY+WAiY7Qu64M+dFAp6O0dYCkh6l+tcY1hCsKtMXPtRfpeT7YQxWs4vAUzlUnoZzm6EtY7K9bQroPtuI6UFVCcr4o/WSHdfkWUDL8tQ+pnIolNX2Wi2h/fWnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716546696; c=relaxed/simple;
	bh=jrbjgP/bVJL1Cbv5DrmhoQOTOlIAiZ8mvNp3Rc/7k3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOiVLEC1exf9T+LmTMEg0UQNC9+V3LsPUaEc+AABDLeaA/SvtdRvcrmakD58DhBIQw7+g2jbG4+nUpl9ibX77tfVPQrO8AlGXCyuG0zU7hNMwoSWqYinfbzKa83ME+kHAKpRL2dMyzvpBqzs20GKkVlFLdCPxir8ddTmvyGRPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HQ2cUX+I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70023475;
	Fri, 24 May 2024 12:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716546677;
	bh=jrbjgP/bVJL1Cbv5DrmhoQOTOlIAiZ8mvNp3Rc/7k3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HQ2cUX+IS5RkLOwVFkwDimcwNkjP/sEp7BF2moUtdwbwBGNCwSLaqf2ZMNo59vydr
	 dW5Q5t7OJSTItJ33XEKboSKsWD5Eo+06ycT8jKxyHuvPRfM4oUvIFkWqonUIpzmLI1
	 81DHOkEztKIExIPoaqZmnL77pU94K+djT9jHo9/Q=
Message-ID: <8fe3bfb9-73d6-445f-bc90-d33b5c192507@ideasonboard.com>
Date: Fri, 24 May 2024 11:31:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <4ea66114-37a4-413f-b672-43ec3d4631c6@ideasonboard.com>
 <Zk-tyxjm-6R-66JO@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <Zk-tyxjm-6R-66JO@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari

On 23/05/2024 21:57, Sakari Ailus wrote:
> Hi Dan,
>
> On Thu, May 23, 2024 at 03:27:36PM +0100, Dan Scally wrote:
>> Hi Sakari - sorry, one part I missed...
>>
>> On 23/05/2024 09:03, Sakari Ailus wrote:
>>>> +
>>>> +int mali_c55_isp_s_stream(struct mali_c55_isp *isp, int enable)
>>> Have you considered {enable,disable}_streams? All new drivers should use
>>> these instead of s_stream() now.
>>
>> Although named s_stream this is actually a purely internal function - it's
>> not exposed as part of the subdev video ops. The resizer subdevices
>> similarly don't expose an .s_stream() operation, they're simply started in
>> the callpath of mali_c55_vb2_start_streaming(). I'll split the stop
>> functionality into mali_c55_isp_stop_stream() and rename this
>> mali_c55_isp_start_stream() to make that less confusing.
> Ack. But this might require some rework, depending on based on what
> streaming is actually started. I'm referring to the discussion elsewhere
> in the same thread.
>
>>
>> The TPG subdevice on the other hand does expose an .s_stream() operation,
>> since the intention was to model it exactly like a connected external
>> subdevice. I can switch to the .enable_streams() operation there.
> Sounds good.


Actually, not sure about this...the TPG just has a single source pad, so there's no _routing_ to set 
and as far as I can tell that means there's also no _streams_ to set since they depend on the 
routing - v4l2_subdev_enable_streams() checks the state's stream_configs to make sure the stream 
you're asking to enable exists, and those stream_configs get created when routing is created - so I  
think for now that the TPG has to stay as .s_stream().


In the isp subdevice I can switch to v4l2_subdev_[enable|disable]_streams() and let it fallback to 
.s_stream() for the tpg - that part's fine.


Dan

>>>> +{
>>>> +	struct mali_c55 *mali_c55 = isp->mali_c55;
>>>> +	struct media_pad *source_pad;
>>>> +	struct media_pad *sink_pad;
>>>> +	int ret;
>>>> +
>>>> +	if (!enable) {
>>>> +		if (isp->source)
>>>> +			v4l2_subdev_call(isp->source, video, s_stream, false);
> This call could be v4l2_subdev_disable_streams().
>
>>>> +		isp->source = NULL;
>>>> +
>>>> +		mali_c55_isp_stop(mali_c55);
>>>> +
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>>>> +	source_pad = media_pad_remote_pad_unique(sink_pad);
>>>> +	if (IS_ERR(source_pad)) {
>>>> +		dev_err(mali_c55->dev, "Failed to get source for ISP\n");
>>>> +		return PTR_ERR(source_pad);
>>>> +	}
>>>> +
>>>> +	isp->source = media_entity_to_v4l2_subdev(source_pad->entity);
>>>> +
>>>> +	isp->frame_sequence = 0;
>>>> +	ret = mali_c55_isp_start(mali_c55);
>>>> +	if (ret) {
>>>> +		dev_err(mali_c55->dev, "Failed to start ISP\n");
>>>> +		isp->source = NULL;
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = v4l2_subdev_call(isp->source, video, s_stream, true);
> And this could be v4l2_subdev_enable_streams() as well.
>
>>>> +	if (ret) {
>>>> +		dev_err(mali_c55->dev, "Failed to start ISP source\n");
>>>> +		mali_c55_isp_stop(mali_c55);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +

