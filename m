Return-Path: <linux-media+bounces-65028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9LbjK15PMWrngQUAu9opvQ
	(envelope-from <linux-media+bounces-65028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:27:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149F68FECF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="h/7iVzpR";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65028-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65028-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FCDA304D44A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE40D32E13B;
	Tue, 16 Jun 2026 13:26:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733431E83A;
	Tue, 16 Jun 2026 13:26:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616405; cv=none; b=pxBB1GRkZGtUJrv+AFUKx6n/Ll44EQ0VWwFkbGl98t72VH5HyRq9H2f1FnQ18vj2Y/7Waw8jOLuOgRKWCGZ9+73ozKA3hhqHLW2gQSqO1w1yciVkTZ/TczfoUr/2yKSI6VtJG/Cg9fCN3zNBaSVlIPdtFWUf002TeWwGu/15UzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616405; c=relaxed/simple;
	bh=7iTgJsH1DOWVTjJsBKQ7yRp8wChF8i1jOvjjDZIGEbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RypmCudxp7/o1pnmtKK5nFHelyEg97Z6ZBnFtXvWpqdBUCFxalC0/rZthXFrPmSlxWcu+uUtdS8W/00Nqg/9CqqADFZMTYcaPNPJ8+9TXDjUhTx6VEV7nyFli3b3cE2a8YMsXZUH5Qnk9Vtkropr5463T8+oQsOdqTAjaXLbZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h/7iVzpR; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4D908FA;
	Tue, 16 Jun 2026 15:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781616368;
	bh=7iTgJsH1DOWVTjJsBKQ7yRp8wChF8i1jOvjjDZIGEbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h/7iVzpRVs7FIfV3BS4FEYiZav2oI9TEiOI8FUdV90H7vPDVU89OEIAYxNqTy077R
	 0o0BqnhBAcLP3ZOvbWNCvgrjICwnUI2ukA0/zBjtKQ24k3QhWmOUQLEJfJMZFnRBrD
	 BM2IFQPfjCiGpQ5DrhwOczN6AiY22g//Yqe/4+d8=
Message-ID: <ca1c4ea1-c6f0-4162-a4d4-4b0361eaeab0@ideasonboard.com>
Date: Tue, 16 Jun 2026 16:26:37 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] media: rcar-csi2: Switch to Streams API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
 <20260318210455.GH716464@killaraus.ideasonboard.com>
 <f27cb679-8a9b-4aed-a25b-9a531172d41f@ideasonboard.com>
 <20260616122700.GB2984510@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260616122700.GB2984510@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65028-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1149F68FECF

Hi,

On 16/06/2026 15:27, Laurent Pinchart wrote:
> On Tue, Jun 16, 2026 at 02:22:10PM +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 18/03/2026 23:04, Laurent Pinchart wrote:
>>> On Wed, Mar 11, 2026 at 03:53:17PM +0200, Tomi Valkeinen wrote:
>>>> Switch to Streams API with a single hardcoded route.
>>>>
>>>> For single-stream use case there should be no change in behavior.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
>>>>    1 file changed, 50 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>>>> index 158fa447e668..ad62c95c8f9a 100644
>>>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>>>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>>>> @@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>>>    	 */
>>>>    	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>>>>    	if (freq < 0) {
>>>> +		const struct v4l2_subdev_route *route;
>>>>    		const struct rcar_csi2_format *format;
>>>>    		const struct v4l2_mbus_framefmt *fmt;
>>>>    		unsigned int lanes;
>>>>    		unsigned int bpp;
>>>>    		int ret;
>>>>    
>>>> +		if (state->routing.num_routes != 1)
>>>> +			return -EINVAL;
>>>> +
>>>>    		ret = rcsi2_get_active_lanes(priv, &lanes);
>>>>    		if (ret)
>>>>    			return ret;
>>>>    
>>>> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>>>> +		route = &state->routing.routes[0];
>>>> +
>>>> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>>>> +						   route->sink_stream);
>>>>    		if (!fmt)
>>>>    			return -EINVAL;
>>>>    
>>>> @@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>>>    static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>>>    				     struct v4l2_subdev_state *state)
>>>>    {
>>>> +	const struct v4l2_subdev_route *route;
>>>>    	const struct rcar_csi2_format *format;
>>>>    	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
>>>>    	const struct v4l2_mbus_framefmt *fmt;
>>>> @@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>>>    	int mbps, ret;
>>>>    
>>>>    	/* Use the format on the sink pad to compute the receiver config. */
>>>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>>>> +
>>>> +	if (state->routing.num_routes != 1)
>>>> +		return -EINVAL;
>>>> +
>>>> +	route = &state->routing.routes[0];
>>>> +
>>>> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>>>> +					   route->sink_stream);
>>>> +	if (!fmt)
>>>> +		return -EINVAL;
>>>>    
>>>>    	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>>>>    		fmt->width, fmt->height,
>>>> @@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>>>    				struct v4l2_subdev_state *state,
>>>>    				struct v4l2_subdev_format *format)
>>>>    {
>>>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
>>>> -	unsigned int num_pads = rcsi2_num_pads(priv);
>>>> +	struct v4l2_mbus_framefmt *fmt;
>>>>    
>>>>    	if (format->pad > RCAR_CSI2_SINK)
>>>>    		return v4l2_subdev_get_fmt(sd, state, format);
>>>> @@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>>>    	if (!rcsi2_code_to_fmt(format->format.code))
>>>>    		format->format.code = rcar_csi2_formats[0].code;
>>>>    
>>>> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
>>>> +	/* Set sink format. */
>>>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>>> +	if (!fmt)
>>>> +		return -EINVAL;
>>>
>>> Can the call return NULL, isn't it checked by the subdev core already ?
>>>
>>>> +
>>>> +	*fmt = format->format;
>>>> +
>>>> +	/* Propagate the format to the source pad. */
>>>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>>>> +							   format->stream);
>>>> +	if (!fmt)
>>>> +		return -EINVAL;
>>>
>>> I wonder if this error check could be omitted too. If there's a format
>>> for the sink stream, it means there's a route, so the opposite stream
>>> format should be guaranteed to exist. Or maybe it's too late and I
>>> should go to bed :-)
>>
>> I've thought about that every now and then, and afaics we should always
>> have a stream fmt. But not checking the return feels like you're doing
>> something nasty, so I've just added them as usually it's not troublesome
>> to return an error...
> 
> I tend to avoid them, but sometimes wonder if relying on invariants
> creates ticking time bombs when core code is refactored. We always make
> assumptions, for instance this function doesn't check if the sd or state
> pointer is NULL. Is not checking the return value of
> v4l2_subdev_state_get_opposite_stream_format() here worse ?

I'm not quite sure what you mean with the last sentence. Not checking 
the return value is worse? Or checking the return value is worse? I can 
read your sentence both ways =).

As I see it, the sd & state parameters are given to us, from the 
framework (so the framework has already verified the return values of 
whatever functions it gets those values from), and we can easily assume 
they are not NULL. Here we call 
v4l2_subdev_state_get_opposite_stream_format() ourselves, and I think it 
makes more sense to check the return values.

But really, I have no good argument for checking the return values. I 
don't see how they could be NULL. It just... feels more correct.

I do think we could perhaps write down clear rules to the docs how the 
functions behave, e.g. if you call v4l2_subdev_state_get_format(), 
v4l2_subdev_state_get_opposite_stream_format() with pad and stream given 
to you via v4l2_subdev_format from the framework, the functions never 
fail. We could do this for the most common functions and patterns. Then 
it would be easier to make sure those functions continue to behave like 
that, as it's explicitly described in their docs.

But in this patch's context, I take it you're ok with the error checks? =)

  Tomi

>>> Looking at what other drivers do, they all check the return value of the
>>> function, so let's keep it as-is for now.
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>>>    
>>>> -	/* Propagate the format to the source pads. */
>>>> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
>>>> -		*v4l2_subdev_state_get_format(state, i) = format->format;
>>>> +	*fmt = format->format;
>>>>    
>>>>    	return 0;
>>>>    }
>>>> @@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>>>    static int rcsi2_init_state(struct v4l2_subdev *sd,
>>>>    			    struct v4l2_subdev_state *state)
>>>>    {
>>>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
>>>> -	unsigned int num_pads = rcsi2_num_pads(priv);
>>>> +	static struct v4l2_subdev_route routes[] = {
>>>> +		{
>>>> +			.sink_pad = RCAR_CSI2_SINK,
>>>> +			.sink_stream = 0,
>>>> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
>>>> +			.source_stream = 0,
>>>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>>>> +		},
>>>> +	};
>>>>    
>>>>    	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>>>>    		.width		= 1920,
>>>> @@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>>>>    		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>>>>    	};
>>>>    
>>>> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
>>>> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
>>>> +	static const struct v4l2_subdev_krouting routing = {
>>>> +		.num_routes = ARRAY_SIZE(routes),
>>>> +		.routes = routes,
>>>> +	};
>>>>    
>>>> -	return 0;
>>>> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
>>>> +						&rcar_csi2_default_fmt);
>>>>    }
>>>>    
>>>>    static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
>>>> @@ -2599,7 +2634,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>>>>    	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
>>>>    	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
>>>>    		 KBUILD_MODNAME, dev_name(&pdev->dev));
>>>> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>> +			     V4L2_SUBDEV_FL_STREAMS;
>>>>    
>>>>    	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>>>    	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
> 


