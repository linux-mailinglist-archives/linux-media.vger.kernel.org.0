Return-Path: <linux-media+bounces-48885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B39CC3279
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 957D33007755
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009EA364E8B;
	Tue, 16 Dec 2025 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KssrVYzy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C5730F53E;
	Tue, 16 Dec 2025 13:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891369; cv=none; b=tcGHFz65oNLErwM5cxaVrYs4jY0fHcxdzom7er7ULnUlcwv2nlt8bbkpFp3EJvshpbAGQikMLxNJt2Hy0ursHzCH0Z+/iPVsH7vmBUeVY+NRBs0U44YfOdGtdSF3A8h0cU6l6g1KiV0fQyOQXjIZl43o/pCFj4a3vd647ag/wRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891369; c=relaxed/simple;
	bh=yahtiBTpPTi2f6zqrf1MCECQc1o1RSWHkdSy1DfHsPU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YxkWbBp0Yf0aDU+VIgKxfp8jC9IIkRIs2/YLFLzM/nKpfxeIT05EPkoGMqXPyVrzxQCUTQQqMwzU5plA0xJNm8mmsdVnTF4fu6LE9Ky+c3DOIkBT0/TCSzRv2JMaQFXcyR7X/L8LtLq5DJ+ixYhYGVQPZDKliLZUwddWRaRe2cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KssrVYzy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8787F581;
	Tue, 16 Dec 2025 14:22:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765891354;
	bh=yahtiBTpPTi2f6zqrf1MCECQc1o1RSWHkdSy1DfHsPU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=KssrVYzyGKfeYUAT1qtpOHmcS+Sq9pBVsiclCygG4Cd8j/iB4N6XUvB9B4aKoWRuO
	 ntL0nfaUnyuc8QP1Uzi9lAxw9knUOLTEjaj45/2SA0enMhJTyjIs/y44+7ZePgEm6I
	 obv/wZU6do0Zk+x5wLiy4m+U+8YR7gjW5m6F/2zc=
Message-ID: <e529d001-cfac-4f52-a505-0878897e9330@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] media: rcar-csi2: Add .get_frame_desc op
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>
 <20250606121426.GG2770609@ragnatech.se>
 <3946a90a-0656-4f70-a773-1e205e55f37b@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <3946a90a-0656-4f70-a773-1e205e55f37b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16/12/2025 15:18, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/06/2025 15:14, Niklas Söderlund wrote:
>> Hi Tomi,
>>
>> Thanks for your work.
>>
>> On 2025-05-30 16:50:39 +0300, Tomi Valkeinen wrote:
>>> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
>>>
>>> We also implement a fallback for the case where the upstream subdevice
>>> does not implement .get_frame_desc. It assumes a single stream with VC =
>>> 0 and DT based on the configured stream mbus format.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> ---
>>>  drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
>>>  1 file changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>>> index 20bd44274bd2..65c7f3040696 100644
>>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>>> @@ -1676,12 +1676,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>>  	return 0;
>>>  }
>>>  
>>> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>>> +					 unsigned int pad,
>>> +					 struct v4l2_mbus_frame_desc *fd)
>>> +{
>>> +	const struct rcar_csi2_format *format;
>>> +	struct v4l2_subdev_state *state;
>>> +	struct v4l2_mbus_framefmt *fmt;
>>> +	int ret = 0;
>>> +
>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>> +
>>> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>>> +	if (!fmt) {
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	format = rcsi2_code_to_fmt(fmt->code);
>>> +	if (!format) {
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>> +
>>> +	fd->num_entries = 1;
>>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>>> +	fd->entry[0].stream = 0;
>>> +	fd->entry[0].pixelcode = fmt->code;
>>> +	fd->entry[0].bus.csi2.vc = 0;
>>> +	fd->entry[0].bus.csi2.dt = format->datatype;
>>> +
>>> +out:
>>> +	v4l2_subdev_unlock_state(state);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>>> +				struct v4l2_mbus_frame_desc *fd)
>>> +{
>>> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
>>> +	int ret;
>>> +
>>> +	if (WARN_ON(!priv->info->use_isp))
>>> +		return -ENOTTY;
>>
>> This looks odd, why can't we support the frame descriptor and streams on 
>> Gen3 that do not use the ISP Channel Selector?
> 
> Yes, this is not right. There was another similar case. I think they are
> remnants of a gen4-only series.

Ah, never mind, now I see. On Gen3 the VINs are connected to the CSI-2.
There's no one that would call get_frame_desc on csi2.

Also, we use v4l2_subdev_get_frame_desc_passthrough() which requires a
1-sink-1-source subdevice, i.e. CSI-2 on Gen4, but not on Gen3.

 Tomi

>>
>>> +
>>> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
>>> +		return -EINVAL;
>>> +
>>> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
>>> +	if (ret == -ENOIOCTLCMD)
>>> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
>>> +	return ret;
>>> +}
>>> +
>>>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>>>  	.enable_streams = rcsi2_enable_streams,
>>>  	.disable_streams = rcsi2_disable_streams,
>>>  
>>>  	.set_fmt = rcsi2_set_pad_format,
>>>  	.get_fmt = v4l2_subdev_get_fmt,
>>> +
>>> +	.get_frame_desc = rcsi2_get_frame_desc,
>>>  };
>>>  
>>>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>>
>>> -- 
>>> 2.43.0
>>>
>>
> 


