Return-Path: <linux-media+bounces-48883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E027CC33BD
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1322A3050D1B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7F53BCC48;
	Tue, 16 Dec 2025 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lUk3ywCS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D93BB839;
	Tue, 16 Dec 2025 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890949; cv=none; b=NpSC+L4y8UsFxgvWEsg4QF1xfv3+kFnxQuFH/n3Ky40LfiIhFB14GgFlS63kJK7noBPjjNSEYuvTxWUxGkpOqjdFnAYoFV1yi8cUgNEAFQx3QJKGIt4Vth+EczzwXgFRDSVDnxK1X1oP6YZpZqHZtpkTDniU2lhbaPqNEeQtRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890949; c=relaxed/simple;
	bh=uhg9cYOq5pBtw5jKEaQ2saPzgne+hAfzWi8uzfyJQt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Og/4VHoWqlrbihlG8RpP7pmmtQ4f14P9/E33bJxPcBM8CVgWZiUh5Ah0uK7L48wA6OsNnEeZy6RKmSqoXjaWfnVuwIP8dzrWcXN4DMMxdrARkooSvO5inWejFk87x/1lJkeIMWNunfO2B3EO27PjZYrdS6ULPr4eYsaOrpitzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lUk3ywCS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E85CC581;
	Tue, 16 Dec 2025 14:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765890940;
	bh=uhg9cYOq5pBtw5jKEaQ2saPzgne+hAfzWi8uzfyJQt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lUk3ywCS4vJufRD2mkUtkK1pR9nqym67B9xhBiR9G6SMmcK+8Heg8xiI3LHSxYkQX
	 ImhHEB1iTtqjKgt/NwyOCGt3QLbNVQeSXncFeCqDiIUMWbCvh9N+T0xbEj/RLR7k2c
	 GZ6k99ePWuBBzU+w/TCoglrXX6XXQlyZtPUgGAt0=
Message-ID: <d29f9917-6ae9-46b7-a00c-6cd5a778cb8b@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] media: rcar-csi2: Switch to Streams API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>
 <20250602140641.GF23515@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250602140641.GF23515@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 17:06, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:37PM +0300, Tomi Valkeinen wrote:
>> Switch to Streams API with a single hardcoded route. This breaks any
>> existing userspace which depended on the custom rcar streams
>> implementation, but a single camera use case should continue to work.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 47 +++++++++++++++++++++---------
>>  1 file changed, 33 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index e0a0fd96459b..20bd44274bd2 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1028,7 +1028,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>  		if (ret)
>>  			return ret;
>>  
>> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>>  		if (!fmt)
>>  			return -EINVAL;
>>  
>> @@ -1069,7 +1069,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>  	int mbps, ret;
>>  
>>  	/* Use the format on the sink pad to compute the receiver config. */
>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>>  
>>  	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>>  		fmt->width, fmt->height,
>> @@ -1650,8 +1650,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>  				struct v4l2_subdev_state *state,
>>  				struct v4l2_subdev_format *format)
>>  {
>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	unsigned int num_pads = rcsi2_num_pads(priv);
>> +	struct v4l2_mbus_framefmt *fmt;
>>  
>>  	if (format->pad > RCAR_CSI2_SINK)
>>  		return v4l2_subdev_get_fmt(sd, state, format);
>> @@ -1659,11 +1658,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>  	if (!rcsi2_code_to_fmt(format->format.code))
>>  		format->format.code = rcar_csi2_formats[0].code;
>>  
>> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>> +	/* Set sink format */
> 
> s/format/format./

Ok.

>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>> +
>> +	/* Propagate to source format */
> 
> Same here. Although I'd write
> 
> 	/* Propagate the format to the source pad. */

Ok. Although maybe "source stream" would be better. Then again, that's
on a source pad, so... =)

 Tomi

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>>  
>> -	/* Propagate the format to the source pads. */
>> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
>> -		*v4l2_subdev_state_get_format(state, i) = format->format;
>> +	*fmt = format->format;
>>  
>>  	return 0;
>>  }
>> @@ -1683,8 +1691,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>  static int rcsi2_init_state(struct v4l2_subdev *sd,
>>  			    struct v4l2_subdev_state *state)
>>  {
>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	unsigned int num_pads = rcsi2_num_pads(priv);
>> +	static struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = RCAR_CSI2_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +		},
>> +	};
>>  
>>  	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>>  		.width		= 1920,
>> @@ -1697,10 +1712,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>>  		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>>  	};
>>  
>> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
>> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
>> +	static const struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>>  
>> -	return 0;
>> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
>> +						&rcar_csi2_default_fmt);
>>  }
>>  
>>  static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
>> @@ -2356,7 +2374,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>>  	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>>  	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>>  		 KBUILD_MODNAME, dev_name(&pdev->dev));
>> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +			     V4L2_SUBDEV_FL_STREAMS;
>>  
>>  	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>  	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 


