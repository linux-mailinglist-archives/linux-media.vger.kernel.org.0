Return-Path: <linux-media+bounces-64989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NDmyK/cxMWoWdwUAu9opvQ
	(envelope-from <linux-media+bounces-64989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:22:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C868EC01
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:22:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="s18/0acy";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64989-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64989-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB67C3009E17
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CED83BADB3;
	Tue, 16 Jun 2026 11:22:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA59A3BB12B;
	Tue, 16 Jun 2026 11:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608937; cv=none; b=qt+KVE9K28EsZ6CjQE8HzN8xsRh+ikjGaanU1QyG8u08NQyXGF0c3uvVFU4NuiC9QW7xlcWMjuAbo3Av5f1CtHo0JfCZ3owL0KaaE0UXkBLRrQgyv6H4QmVWGeDgyc6XffW5OTgFCF0D6WLy+xMUbB8zelxaRu3MVoSfMEk9iK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608937; c=relaxed/simple;
	bh=SNSFy5209CukrGcJmme0QooZeHzXkRNMn9Ja0MTLe4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3sHglObUgYS1qV29HR0/VWs9yZWjNUlO8ANa33wSmQ/tNKi/CvQhTv0ShCodLlE8ZlSqgXoqQiFzQE8GN9CYWyeFmiMTnBrS/d3L0qx7mY35Oq7U28N+3+iE5aZENxP5QFOZ2iNtbAhZP0EtBdoU85rT2c3FX353iWr0KdKLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s18/0acy; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D90AE8FA;
	Tue, 16 Jun 2026 13:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781608900;
	bh=SNSFy5209CukrGcJmme0QooZeHzXkRNMn9Ja0MTLe4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s18/0acy7gHsa5BdK29Vnys13BEt6m5omykfP/xQ90ezchRVR585To44nGjtlRR8/
	 3i8y722zq6csqSRIyFQjpzY7KOQIq+sLxiiNXrsm/sb7M+2uFc/j+K/O+vpEQspUHQ
	 nlrlicQPU20Dpgngy1RlUtHXC2xhCvTzTufyBAlY=
Message-ID: <f27cb679-8a9b-4aed-a25b-9a531172d41f@ideasonboard.com>
Date: Tue, 16 Jun 2026 14:22:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] media: rcar-csi2: Switch to Streams API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
 <20260318210455.GH716464@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260318210455.GH716464@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64989-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A34C868EC01

Hi,

On 18/03/2026 23:04, Laurent Pinchart wrote:
> On Wed, Mar 11, 2026 at 03:53:17PM +0200, Tomi Valkeinen wrote:
>> Switch to Streams API with a single hardcoded route.
>>
>> For single-stream use case there should be no change in behavior.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
>>   1 file changed, 50 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 158fa447e668..ad62c95c8f9a 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>   	 */
>>   	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>>   	if (freq < 0) {
>> +		const struct v4l2_subdev_route *route;
>>   		const struct rcar_csi2_format *format;
>>   		const struct v4l2_mbus_framefmt *fmt;
>>   		unsigned int lanes;
>>   		unsigned int bpp;
>>   		int ret;
>>   
>> +		if (state->routing.num_routes != 1)
>> +			return -EINVAL;
>> +
>>   		ret = rcsi2_get_active_lanes(priv, &lanes);
>>   		if (ret)
>>   			return ret;
>>   
>> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> +		route = &state->routing.routes[0];
>> +
>> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>> +						   route->sink_stream);
>>   		if (!fmt)
>>   			return -EINVAL;
>>   
>> @@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>   static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>   				     struct v4l2_subdev_state *state)
>>   {
>> +	const struct v4l2_subdev_route *route;
>>   	const struct rcar_csi2_format *format;
>>   	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
>>   	const struct v4l2_mbus_framefmt *fmt;
>> @@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>   	int mbps, ret;
>>   
>>   	/* Use the format on the sink pad to compute the receiver config. */
>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> +
>> +	if (state->routing.num_routes != 1)
>> +		return -EINVAL;
>> +
>> +	route = &state->routing.routes[0];
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>> +					   route->sink_stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>>   
>>   	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>>   		fmt->width, fmt->height,
>> @@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>   				struct v4l2_subdev_state *state,
>>   				struct v4l2_subdev_format *format)
>>   {
>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	unsigned int num_pads = rcsi2_num_pads(priv);
>> +	struct v4l2_mbus_framefmt *fmt;
>>   
>>   	if (format->pad > RCAR_CSI2_SINK)
>>   		return v4l2_subdev_get_fmt(sd, state, format);
>> @@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>   	if (!rcsi2_code_to_fmt(format->format.code))
>>   		format->format.code = rcar_csi2_formats[0].code;
>>   
>> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>> +	/* Set sink format. */
>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
> 
> Can the call return NULL, isn't it checked by the subdev core already ?
> 
>> +
>> +	*fmt = format->format;
>> +
>> +	/* Propagate the format to the source pad. */
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
> 
> I wonder if this error check could be omitted too. If there's a format
> for the sink stream, it means there's a route, so the opposite stream
> format should be guaranteed to exist. Or maybe it's too late and I
> should go to bed :-)

I've thought about that every now and then, and afaics we should always 
have a stream fmt. But not checking the return feels like you're doing 
something nasty, so I've just added them as usually it's not troublesome 
to return an error...

  Tomi

> Looking at what other drivers do, they all check the return value of the
> function, so let's keep it as-is for now.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>   
>> -	/* Propagate the format to the source pads. */
>> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
>> -		*v4l2_subdev_state_get_format(state, i) = format->format;
>> +	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>> @@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>   static int rcsi2_init_state(struct v4l2_subdev *sd,
>>   			    struct v4l2_subdev_state *state)
>>   {
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
>>   	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>>   		.width		= 1920,
>> @@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>>   		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>>   	};
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
>>   }
>>   
>>   static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
>> @@ -2599,7 +2634,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>>   	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>>   	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>>   		 KBUILD_MODNAME, dev_name(&pdev->dev));
>> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +			     V4L2_SUBDEV_FL_STREAMS;
>>   
>>   	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>   	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
>>
> 


