Return-Path: <linux-media+bounces-67591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tkzfEEOLVmrv8gAAu9opvQ
	(envelope-from <linux-media+bounces-67591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:17:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95E758299
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:17:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=me7iHFdS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67591-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67591-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AB4230F0BB1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733882931FB;
	Tue, 14 Jul 2026 19:16:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996F22931DE;
	Tue, 14 Jul 2026 19:16:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056605; cv=none; b=BX5HcgpsBhK86NcWHSsFFRf9uLs0SokNRu1ThO3f0g5rtRyZxp00P+XspaivalnpBnL+Gn7DkQ1epxNTxOsMiNoF8SwYXs/cfAZDriZTJpGzPe2ez5/0DSHMJYcqhLBR3Vseo4HhAPt89c0xTZPWTyYEKLBWrb9uWuowky7aAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056605; c=relaxed/simple;
	bh=2dS2v3qnhLY566oru+A0DB5KY2waS9BxkCNo8OGMFqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBNUVOXv35gHSRTk5gjpYcxd/gVljQkEC5wat05MXx2g7Gl1bZKEcw7fVSktp1dJ3coW/F5bpJYjk+IBbwQWECcjbDQTWQ31ea+b8rVpdAus4yyoTtPVoaOK6SeLtQy1sEJD4zFy9NVpWt+MsYMMr3COS5Z55Z7mwZPuMiC8d/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=me7iHFdS; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B1BB558;
	Tue, 14 Jul 2026 21:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784056544;
	bh=2dS2v3qnhLY566oru+A0DB5KY2waS9BxkCNo8OGMFqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=me7iHFdSCDBYn9uOtTJEFHduib+YCytN2BjWlznyMQXKRsTv2rTxkgb9NMRdCPOrG
	 fKhltDXgOfQc1L453OVO+mX4zz9pjtnH9PihmOIufg+sffE8HKXZr1r85cU+TVoTR0
	 XLiVidbGxvcWCFyZjdhqoT3K4fjNqhuFM66+N5t4=
Date: Tue, 14 Jul 2026 22:16:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1 RESEND] media: i2c: mt9m114: Add get_fwnode_pad
 operation for IFP
Message-ID: <20260714191637.GA1675278@killaraus.ideasonboard.com>
References: <20260625082111.47898-1-clamor95@gmail.com>
 <20260625082111.47898-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260625082111.47898-2-clamor95@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67591-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F95E758299

Hi Svyatoslav,

Thank you for the patch.

On Thu, Jun 25, 2026 at 11:21:11AM +0300, Svyatoslav Ryhel wrote:
> Currently, the driver's binding exposes only one endpoint, which maps to
> the IFP subdevice's SOURCE pad. This configuration causes failures for
> many devices using this camera because both the DT binding and the
> one-to-one pad mapping logic map the endpoint to the wrong pad.

Could you please explain what failures this causes ? A brief analysis of
the code seems to indicate the patch will only make a difference when
the DT node has multiple endpoints, and will prevent links to be created
for any endpoint but the first one. I don't think that's desirable.

> Fix this
> by implementing the get_fwnode_pad operation for the IFP, which correctly
> matches the endpoint to the corresponding IFP pad.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/media/i2c/mt9m114.c | 44 ++++++++++++++++++++++++++++---------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index e395e2d14e97..16c2582551d3 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -1020,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114 *sensor)
>  	return ret;
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * Common Subdev Operations
> - */
> -
> -static const struct media_entity_operations mt9m114_entity_ops = {
> -	.link_validate = v4l2_subdev_link_validate,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * Pixel Array Control Operations
>   */
> @@ -1381,6 +1373,10 @@ static const struct v4l2_subdev_internal_ops mt9m114_pa_internal_ops = {
>  	.init_state = mt9m114_pa_init_state,
>  };
>  
> +static const struct media_entity_operations mt9m114_pa_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
>  static int mt9m114_pa_init(struct mt9m114 *sensor)
>  {
>  	struct v4l2_ctrl_handler *hdl = &sensor->pa.hdl;
> @@ -1403,7 +1399,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
>  
>  	/* Initialize the media entity. */
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -	sd->entity.ops = &mt9m114_entity_ops;
> +	sd->entity.ops = &mt9m114_pa_entity_ops;
>  	pads[0].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, 1, pads);
>  	if (ret < 0)
> @@ -2092,6 +2088,29 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> +/*
> + * The IFP has only one fwnode endpoint, which corresponds to the pad
> + * linked to the PA (PA SINK), while it should be the SOURCE for the
> + * next media device in the pipe.
> + */
> +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> +				      struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
> +	struct fwnode_handle *ifp_port = dev_fwnode(&sensor->client->dev);

This is not a port fwnode. I'd name the variable just fwnode.

> +	struct fwnode_handle *ifp_ep;
> +	int ret;
> +
> +	ifp_ep = fwnode_graph_get_next_endpoint(ifp_port, NULL);
> +
> +	ret = endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;
> +
> +	fwnode_handle_put(ifp_ep);
> +
> +	return ret;

Let's use the cleanup API:

#include <cleanup.h>

...

	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
	struct fwnode_handle *ifp_ep __free(fwnode_handle) =
		fwnode_graph_get_next_endpoint(fwnode, NULL);

	return endpoint->local_fwnode == ifp_ep ? 1 : -ENXIO;

> +}
> +
>  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
>  	.s_stream = mt9m114_ifp_s_stream,
>  };
> @@ -2119,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9m114_ifp_internal_ops = {
>  	.unregistered = mt9m114_ifp_unregistered,
>  };
>  
> +static const struct media_entity_operations mt9m114_ifp_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = mt9m114_ifp_get_fwnode_pad,
> +};
> +
>  static int mt9m114_ifp_init(struct mt9m114 *sensor)
>  {
>  	struct v4l2_subdev *sd = &sensor->ifp.sd;
> @@ -2136,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
>  
>  	/* Initialize the media entity. */
>  	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
> -	sd->entity.ops = &mt9m114_entity_ops;
> +	sd->entity.ops = &mt9m114_ifp_entity_ops;
>  	pads[0].flags = MEDIA_PAD_FL_SINK;
>  	pads[1].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, 2, pads);

-- 
Regards,

Laurent Pinchart

