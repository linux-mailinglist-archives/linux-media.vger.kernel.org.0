Return-Path: <linux-media+bounces-48882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0279BCC32A3
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDEFA3030160
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71B9350D4F;
	Tue, 16 Dec 2025 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d25b+y+E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84755339859;
	Tue, 16 Dec 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890708; cv=none; b=VrchnfkfjpqJqYHlesjktp+cf9fxpWNc7KkxVmYB4vj5GnXc2wwf25OG/L5sL8mvCQmft+Eox81Z2oLbKHgtMinZyOXWZNUUkxNG+k95xJhTOKWDtJqTwqgXbv2ZqLroeiCPSsb/VG92k9Bqn5AOlbxdrKi2B7nyd/fTTDkWoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890708; c=relaxed/simple;
	bh=tI3kiUimdfV7oUdfnJ1Pwn8j3dFneC/sdOuyyLRXU1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcRp/0acczZsoZC5PiDh2ztR+TJTL66PHelipFSw5T6pW4rfJVtUYBiy3dV/a4QWSaycGgYAaUA/rEsteYX2wtZRP4hqfkr7RB14wBm7vWfWuJYE5WCI8HG7Lyi0x9bI7VF2efA2WhYO/hA+3a28NmZH+baWPDTFwFqJ0tEi0pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d25b+y+E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52354581;
	Tue, 16 Dec 2025 14:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765890695;
	bh=tI3kiUimdfV7oUdfnJ1Pwn8j3dFneC/sdOuyyLRXU1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d25b+y+Ei+AKRSWhrNc3bhgz71lJrm0bUUxtp1k+PtqN5uTD3br79gEw5MDHNVuvs
	 ODggDWAONLvdurU0+5S7QEPptt7vLmRiv/38MH1+V9ZKMmc6Ks9h37QZnzHADYFYHV
	 nXYW6UfcQKmXbF2OCzB3zXGDf8HOhtWFNtJ1vHN8=
Message-ID: <a7ca9000-e5de-482c-a2af-cd2aa2674da2@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] media: rcar-isp: Add full streams support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-15-026655df7138@ideasonboard.com>
 <20250602135738.GD23515@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250602135738.GD23515@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 16:57, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:44PM +0300, Tomi Valkeinen wrote:
>> Add the missing pieces to enable full streams support:
>>
>> - Add set_routing
>> - Drop the explicit uses of a single stream, and instead use the streams
>>   mask.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-isp/csisp.c | 41 +++++++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> index 887d8eb21a3a..101d69a2eba4 100644
>> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
>> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> @@ -342,6 +342,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>>  {
>>  	struct rcar_isp *isp = sd_to_isp(sd);
>>  	int ret = 0;
>> +	u64 sink_streams;
> 
> I'd move this before ret.

Sure.

>>  
>>  	if (source_streams_mask != 1)
>>  		return -EINVAL;
>> @@ -355,8 +356,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>>  			return ret;
>>  	}
>>  
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
>> +						       source_pad,
>> +						       RCAR_ISP_SINK,
>> +						       &source_streams_mask);
>> +
>>  	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
>> -					 BIT_ULL(0));
>> +					 sink_streams);
>>  	if (ret) {
>>  		risp_stop(isp);
>>  		return ret;
>> @@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>>  				u64 source_streams_mask)
>>  {
>>  	struct rcar_isp *isp = sd_to_isp(sd);
>> +	u64 sink_streams;
>>  
>>  	if (source_streams_mask != 1)
>>  		return -EINVAL;
>> @@ -379,7 +386,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>>  	if (!isp->remote)
>>  		return -ENODEV;
>>  
>> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
>> +						       source_pad,
>> +						       RCAR_ISP_SINK,
>> +						       &source_streams_mask);
>> +
>> +	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
>>  
>>  	if (isp->stream_count == 1)
>>  		risp_stop(isp);
>> @@ -419,12 +431,37 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +static int risp_set_routing(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *state,
>> +			    enum v4l2_subdev_format_whence which,
>> +			    struct v4l2_subdev_krouting *routing)
>> +{
>> +	int ret;
>> +
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
> 
> Given V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING, shouldn't the
> num_routes check be replaced by an intrinsic hardware limit (I would
> guess 8, as that's the number of source pads) ?

I've dropped the V4L2_FRAME_DESC_ENTRY_MAX check, as it's now in the
framework.

I don't think we should need any extra checks. If we have
V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING, it should implicitly limit
the sources to the number of pads, shouldn't it?

 Tomi

>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
>> +					       &risp_default_fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct v4l2_subdev_pad_ops risp_pad_ops = {
>>  	.enable_streams = risp_enable_streams,
>>  	.disable_streams = risp_disable_streams,
>>  	.set_fmt = risp_set_pad_format,
>>  	.get_fmt = v4l2_subdev_get_fmt,
>>  	.link_validate = v4l2_subdev_link_validate_default,
>> +	.set_routing = risp_set_routing,
>>  };
>>  
>>  static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
> 


