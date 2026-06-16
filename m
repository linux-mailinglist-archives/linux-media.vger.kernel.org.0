Return-Path: <linux-media+bounces-65029-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S2TgCDFTMWpMgwUAu9opvQ
	(envelope-from <linux-media+bounces-65029-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:44:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 847636900C8
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=r5m1QWKm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65029-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65029-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F0D23036E50
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DE432D0FC;
	Tue, 16 Jun 2026 13:41:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3025731E83A;
	Tue, 16 Jun 2026 13:41:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617307; cv=none; b=IQkcYPblHN+nxCH6d8YqW3vj5kYMBwNu6DCELZc8UG6oKWas1les6E+1mVXQaDLRfJiWyVSlPBw85+YSKZ8khMHHntbofuCfxe+GB0VE9pmcUSormWQsOrnpgG+n8144prXHzs3fiwuw02PxyApoX7EECU5MMc/2Y/Rjo/ROb8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617307; c=relaxed/simple;
	bh=HQ2cA6sijSENjvxiBq3cGo9mOJLEhm0fydOD4faHUtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rilEAIww+2X2SupqWyomtGswgpMiwg2uKY5E1uqb9Moz6AtSCfzvipYzGyPqZpRj12hg8htUJ+k9iXAEt6tL64Iimo3p11Xo+3vkgI2Td+MtWysHYJ6pS7k21d35d9FA/oXTT5EZ57+1DCXGy2qArjOItn5qPj/9fbW0zC1myuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r5m1QWKm; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F1EE8FA;
	Tue, 16 Jun 2026 15:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781617270;
	bh=HQ2cA6sijSENjvxiBq3cGo9mOJLEhm0fydOD4faHUtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5m1QWKmOh3JrmEhK2g7cFCdJK8Otm8cNcCMkxCaQlDZx8mWfjJ+7ZSLP8OQ534ui
	 A3QU5+xsrmzKujTRN3gZYKJJx0Ax4/DGOMDPuBsD44PWMkliNThNj0r/sHTB6kJOC2
	 L2BouZFW0auPucW9Kg+VbWFkEn4sz1GXM8KyquQ0=
Date: Tue, 16 Jun 2026 16:41:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 04/10] media: rcar-csi2: Switch to Streams API
Message-ID: <20260616134142.GI2984510@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-4-3e6c957d7567@ideasonboard.com>
 <20260318210455.GH716464@killaraus.ideasonboard.com>
 <f27cb679-8a9b-4aed-a25b-9a531172d41f@ideasonboard.com>
 <20260616122700.GB2984510@killaraus.ideasonboard.com>
 <ca1c4ea1-c6f0-4162-a4d4-4b0361eaeab0@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca1c4ea1-c6f0-4162-a4d4-4b0361eaeab0@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65029-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 847636900C8

On Tue, Jun 16, 2026 at 04:26:37PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 16/06/2026 15:27, Laurent Pinchart wrote:
> > On Tue, Jun 16, 2026 at 02:22:10PM +0300, Tomi Valkeinen wrote:
> >> Hi,
> >>
> >> On 18/03/2026 23:04, Laurent Pinchart wrote:
> >>> On Wed, Mar 11, 2026 at 03:53:17PM +0200, Tomi Valkeinen wrote:
> >>>> Switch to Streams API with a single hardcoded route.
> >>>>
> >>>> For single-stream use case there should be no change in behavior.
> >>>>
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>> ---
> >>>>    drivers/media/platform/renesas/rcar-csi2.c | 64 +++++++++++++++++++++++-------
> >>>>    1 file changed, 50 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> >>>> index 158fa447e668..ad62c95c8f9a 100644
> >>>> --- a/drivers/media/platform/renesas/rcar-csi2.c
> >>>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> >>>> @@ -1023,17 +1023,24 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> >>>>    	 */
> >>>>    	freq = v4l2_get_link_freq(remote_pad, 0, 0);
> >>>>    	if (freq < 0) {
> >>>> +		const struct v4l2_subdev_route *route;
> >>>>    		const struct rcar_csi2_format *format;
> >>>>    		const struct v4l2_mbus_framefmt *fmt;
> >>>>    		unsigned int lanes;
> >>>>    		unsigned int bpp;
> >>>>    		int ret;
> >>>>    
> >>>> +		if (state->routing.num_routes != 1)
> >>>> +			return -EINVAL;
> >>>> +
> >>>>    		ret = rcsi2_get_active_lanes(priv, &lanes);
> >>>>    		if (ret)
> >>>>    			return ret;
> >>>>    
> >>>> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> >>>> +		route = &state->routing.routes[0];
> >>>> +
> >>>> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> >>>> +						   route->sink_stream);
> >>>>    		if (!fmt)
> >>>>    			return -EINVAL;
> >>>>    
> >>>> @@ -1062,6 +1069,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
> >>>>    static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> >>>>    				     struct v4l2_subdev_state *state)
> >>>>    {
> >>>> +	const struct v4l2_subdev_route *route;
> >>>>    	const struct rcar_csi2_format *format;
> >>>>    	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
> >>>>    	const struct v4l2_mbus_framefmt *fmt;
> >>>> @@ -1070,7 +1078,16 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
> >>>>    	int mbps, ret;
> >>>>    
> >>>>    	/* Use the format on the sink pad to compute the receiver config. */
> >>>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
> >>>> +
> >>>> +	if (state->routing.num_routes != 1)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	route = &state->routing.routes[0];
> >>>> +
> >>>> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> >>>> +					   route->sink_stream);
> >>>> +	if (!fmt)
> >>>> +		return -EINVAL;
> >>>>    
> >>>>    	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
> >>>>    		fmt->width, fmt->height,
> >>>> @@ -1892,8 +1909,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> >>>>    				struct v4l2_subdev_state *state,
> >>>>    				struct v4l2_subdev_format *format)
> >>>>    {
> >>>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> >>>> -	unsigned int num_pads = rcsi2_num_pads(priv);
> >>>> +	struct v4l2_mbus_framefmt *fmt;
> >>>>    
> >>>>    	if (format->pad > RCAR_CSI2_SINK)
> >>>>    		return v4l2_subdev_get_fmt(sd, state, format);
> >>>> @@ -1901,11 +1917,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> >>>>    	if (!rcsi2_code_to_fmt(format->format.code))
> >>>>    		format->format.code = rcar_csi2_formats[0].code;
> >>>>    
> >>>> -	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
> >>>> +	/* Set sink format. */
> >>>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> >>>> +	if (!fmt)
> >>>> +		return -EINVAL;
> >>>
> >>> Can the call return NULL, isn't it checked by the subdev core already ?
> >>>
> >>>> +
> >>>> +	*fmt = format->format;
> >>>> +
> >>>> +	/* Propagate the format to the source pad. */
> >>>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> >>>> +							   format->stream);
> >>>> +	if (!fmt)
> >>>> +		return -EINVAL;
> >>>
> >>> I wonder if this error check could be omitted too. If there's a format
> >>> for the sink stream, it means there's a route, so the opposite stream
> >>> format should be guaranteed to exist. Or maybe it's too late and I
> >>> should go to bed :-)
> >>
> >> I've thought about that every now and then, and afaics we should always
> >> have a stream fmt. But not checking the return feels like you're doing
> >> something nasty, so I've just added them as usually it's not troublesome
> >> to return an error...
> > 
> > I tend to avoid them, but sometimes wonder if relying on invariants
> > creates ticking time bombs when core code is refactored. We always make
> > assumptions, for instance this function doesn't check if the sd or state
> > pointer is NULL. Is not checking the return value of
> > v4l2_subdev_state_get_opposite_stream_format() here worse ?
> 
> I'm not quite sure what you mean with the last sentence. Not checking 
> the return value is worse? Or checking the return value is worse? I can 
> read your sentence both ways =).

Is not checking the return value of
v4l2_subdev_state_get_opposite_stream_format() a bigger problem than not
checking if sd or state are NULL ?

> As I see it, the sd & state parameters are given to us, from the 
> framework (so the framework has already verified the return values of 
> whatever functions it gets those values from), and we can easily assume 
> they are not NULL. Here we call 
> v4l2_subdev_state_get_opposite_stream_format() ourselves, and I think it 
> makes more sense to check the return values.
> 
> But really, I have no good argument for checking the return values. I 
> don't see how they could be NULL. It just... feels more correct.

It's all about guarantees. As far as I understand,
v4l2_subdev_state_get_opposite_stream_format() provides a guarantee that
it will return a non-NULL pointer *here*. That guarantee is more
difficult to prove than the guarantee sd or state won't be NULL, but
it's still provable (unless I'm wrong of course). It may however be more
fragile and at risk of breaking without being noticed when code is
modified. Those two reasons (fragility and more complex proof) are
probably why if *feels* worse to not check the return value than the sd
or state pointers.

> I do think we could perhaps write down clear rules to the docs how the 
> functions behave, e.g. if you call v4l2_subdev_state_get_format(), 
> v4l2_subdev_state_get_opposite_stream_format() with pad and stream given 
> to you via v4l2_subdev_format from the framework, the functions never 
> fail. We could do this for the most common functions and patterns. Then 
> it would be easier to make sure those functions continue to behave like 
> that, as it's explicitly described in their docs.

I think it would be useful to do so, yes.

> But in this patch's context, I take it you're ok with the error checks? =)

I'd prefer dropping them but I won't make it a casus belli. I'd drop at
least the v4l2_subdev_state_get_format() check.

> >>> Looking at what other drivers do, they all check the return value of the
> >>> function, so let's keep it as-is for now.
> >>>
> >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>
> >>>>    
> >>>> -	/* Propagate the format to the source pads. */
> >>>> -	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
> >>>> -		*v4l2_subdev_state_get_format(state, i) = format->format;
> >>>> +	*fmt = format->format;
> >>>>    
> >>>>    	return 0;
> >>>>    }
> >>>> @@ -1925,8 +1950,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >>>>    static int rcsi2_init_state(struct v4l2_subdev *sd,
> >>>>    			    struct v4l2_subdev_state *state)
> >>>>    {
> >>>> -	struct rcar_csi2 *priv = sd_to_csi2(sd);
> >>>> -	unsigned int num_pads = rcsi2_num_pads(priv);
> >>>> +	static struct v4l2_subdev_route routes[] = {
> >>>> +		{
> >>>> +			.sink_pad = RCAR_CSI2_SINK,
> >>>> +			.sink_stream = 0,
> >>>> +			.source_pad = RCAR_CSI2_SOURCE_VC0,
> >>>> +			.source_stream = 0,
> >>>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> >>>> +		},
> >>>> +	};
> >>>>    
> >>>>    	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
> >>>>    		.width		= 1920,
> >>>> @@ -1939,10 +1971,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
> >>>>    		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> >>>>    	};
> >>>>    
> >>>> -	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
> >>>> -		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
> >>>> +	static const struct v4l2_subdev_krouting routing = {
> >>>> +		.num_routes = ARRAY_SIZE(routes),
> >>>> +		.routes = routes,
> >>>> +	};
> >>>>    
> >>>> -	return 0;
> >>>> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> >>>> +						&rcar_csi2_default_fmt);
> >>>>    }
> >>>>    
> >>>>    static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
> >>>> @@ -2599,7 +2634,8 @@ static int rcsi2_probe(struct platform_device *pdev)
> >>>>    	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
> >>>>    	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
> >>>>    		 KBUILD_MODNAME, dev_name(&pdev->dev));
> >>>> -	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>>> +	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
> >>>> +			     V4L2_SUBDEV_FL_STREAMS;
> >>>>    
> >>>>    	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> >>>>    	priv->subdev.entity.ops = &rcar_csi2_entity_ops;

-- 
Regards,

Laurent Pinchart

