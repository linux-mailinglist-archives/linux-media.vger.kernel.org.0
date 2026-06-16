Return-Path: <linux-media+bounces-65008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ODjKKiRCMWpgfgUAu9opvQ
	(envelope-from <linux-media+bounces-65008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:31:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745468F58B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=KvAbfUls;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65008-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65008-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28F443173308
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2B436165E;
	Tue, 16 Jun 2026 12:30:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F935DA7F;
	Tue, 16 Jun 2026 12:30:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613007; cv=none; b=oi2rbW1XqMToPVzb2kIHcse5/NiaG63ErVmaW5nIuBL4xON7l/sYyIq32VjaewjytDGctINB9fiQ+KAd/+Ycul5bAU+WryOuOhPZDntSruDCb8P/PfLT1399ZqmArn4SnfAS3VpORqol9bt1uUFycU6IaNQOs7SRxAf7dW32yYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613007; c=relaxed/simple;
	bh=HYN5gOLXexUC/pF5ipvNtKUN/uYsdUw9r0NDrQceyr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrqEdaka1w75Rjqcg/060nbvost6FSYXI/eatOz7GBXMo7uC8uYyVTJdSwrgyFgA5uPnk9ybr3uq+TtpGt5cm/7+Qw2aawFE02IMGZPEg80vXwYwkTYzTbX/ld0t6zaoacpJtViMjim+In9EZTPh9mlP3KIhEL3/rDBAxC833Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KvAbfUls; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14CA743;
	Tue, 16 Jun 2026 14:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781612969;
	bh=HYN5gOLXexUC/pF5ipvNtKUN/uYsdUw9r0NDrQceyr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KvAbfUlsaG7fcPluoGYedFm2Phj9IHqe8epTeGQNkoFRr2YP4aDy+EGugOm8ic+Fv
	 oQJPsdTn3Jl8LBRblapZFXmwnyXm/W4t6uxao2bF3fVo3wem8EA/05wvIc+wQgw0Pp
	 8roOHhRi4N1oZnj6V7ODu+yU1OgIqILtNykiuuV0=
Date: Tue, 16 Jun 2026 15:30:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 06/10] media: rcar-csi2: Add .get_frame_desc op
Message-ID: <20260616123001.GC2984510@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
 <20260318211654.GJ716464@killaraus.ideasonboard.com>
 <174a5210-8f77-4bd6-b091-ed5cc1ab899d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174a5210-8f77-4bd6-b091-ed5cc1ab899d@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65008-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4745468F58B

On Tue, Jun 16, 2026 at 02:30:05PM +0300, Tomi Valkeinen wrote:
> On 18/03/2026 23:16, Laurent Pinchart wrote:
> > On Wed, Mar 11, 2026 at 03:53:19PM +0200, Tomi Valkeinen wrote:
> >> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
> >>
> >> We also implement a fallback for the case where the upstream subdevice
> >> does not implement .get_frame_desc. It assumes a single stream with VC =
> >> 0 and DT based on the configured stream mbus format.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
> >>   1 file changed, 70 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> >> index ad62c95c8f9a..b8baf7c65e90 100644
> >> --- a/drivers/media/platform/renesas/rcar-csi2.c
> >> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> >> @@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> >>   	return 0;
> >>   }
> >>   
> >> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
> >> +					 unsigned int pad,
> >> +					 struct v4l2_mbus_frame_desc *fd)
> >> +{
> >> +	struct v4l2_subdev_route *route;
> >> +	const struct rcar_csi2_format *format;
> >> +	struct v4l2_subdev_state *state;
> >> +	struct v4l2_mbus_framefmt *fmt;
> >> +	int ret = 0;
> >> +
> >> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> >> +
> >> +	if (state->routing.num_routes != 1) {
> >> +		ret = -EINVAL;
> >> +		goto out;
> >> +	}
> >> +
> >> +	route = &state->routing.routes[0];
> >> +
> >> +	if (route->source_pad != pad) {
> >> +		ret = -EINVAL;
> >> +		goto out;
> >> +	}
> >> +
> >> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> >> +					   route->sink_stream);
> >> +	if (!fmt) {
> >> +		ret = -EINVAL;
> >> +		goto out;
> >> +	}
> >> +
> >> +	format = rcsi2_code_to_fmt(fmt->code);
> >> +	if (!format) {
> >> +		ret = -EINVAL;
> >> +		goto out;
> >> +	}
> >> +
> >> +	fd->num_entries = 1;
> >> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> >> +	fd->entry[0].stream = route->source_stream;
> >> +	fd->entry[0].pixelcode = fmt->code;
> >> +	fd->entry[0].bus.csi2.vc = 0;
> >> +	fd->entry[0].bus.csi2.dt = format->datatype;
> >> +
> >> +out:
> >> +	v4l2_subdev_unlock_state(state);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> >> +				struct v4l2_mbus_frame_desc *fd)
> >> +{
> >> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> >> +	int ret;
> >> +
> >> +	if (WARN_ON(!priv->info->use_isp))
> >> +		return -ENOTTY;
> > 
> > Why is that, can't the get frame desc operation be supported on Gen3 ?
> 
> It can, and it is, in this patch. The thing here is that 
> rcsi2_get_frame_desc() is the implementation for 
> v4l2_subdev_pad_ops.get_frame_desc(). On gen4, csisp calls it, but on 
> gen3, there's no one to call it as on gen3 the csi2 does the demuxing.
> 
> So the above check is just a "yell if our drivers do a totally wrong thing".

A comment would be useful.

> >> +
> >> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
> >> +		return -EINVAL;
> >> +
> >> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> >> +	if (ret == -ENOIOCTLCMD)
> >> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
> > 
> > A dev_warn_once() would be good here, to get people to fix the source
> > device driver.
> 
> Perhaps at some point, but do we want to add it already?
> 
> Hmm, actually, this will go away with Sakari's series that adds 
> framework level fallback handling, so I think warning now about a thing 
> that is no longer a thing in the future serves no purpose.

Or you could consider that adding a dev_warn_once() isn't an issue as
the code will be replaced soon :-) Up to you.

> >> +	return ret;
> >> +}
> >> +
> >>   static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
> >>   	.enable_streams = rcsi2_enable_streams,
> >>   	.disable_streams = rcsi2_disable_streams,
> >>   
> >>   	.set_fmt = rcsi2_set_pad_format,
> >>   	.get_fmt = v4l2_subdev_get_fmt,
> >> +
> >> +	.get_frame_desc = rcsi2_get_frame_desc,
> >>   };
> >>   
> >>   static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> >>

-- 
Regards,

Laurent Pinchart

