Return-Path: <linux-media+bounces-52571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA7jI7I6jGlZjgAAu9opvQ
	(envelope-from <linux-media+bounces-52571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:15:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902A122230
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 266DD3031F3B
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 08:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031DB34FF49;
	Wed, 11 Feb 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mGwYWPig"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F202E3A8F7;
	Wed, 11 Feb 2026 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797742; cv=none; b=MzL5JAzkVtq6NK/yuWL5KPzgZ4D1am0K2EaWO5NMudPqV1nQ4LnyUni6rWrtFt4mVjEpWeukZs8yp+Stj2bIppce03jQMXOAeQf5hurBV+DMBH+RB7YAvRQcGRMqme19F2BCfXostoDLnCIU8zLXBblO33N6wVmwf/hUlXneSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797742; c=relaxed/simple;
	bh=S9Nngd5Ci9bMCWrJoyP4sJg8P5P3CQre1ZbUDiRpvZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Woy5E7yBO3ltGWW7N5bvYPVJMKb3ntK+8JYCjrji+i53ePjBwzywiDslWFvVOOa1z/XVTcclyeHYkqgii/qZj2W/iEMW0nQ1W8ReV9ti01FaS6l5LaOW7gLbbmeGXKJCRKpx+wYmsh5zOEAN9pYnGbbcIiqjAn1oLyr4UYhALE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mGwYWPig; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B1A5912D6;
	Wed, 11 Feb 2026 09:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770797684;
	bh=S9Nngd5Ci9bMCWrJoyP4sJg8P5P3CQre1ZbUDiRpvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGwYWPigmx0VdBS6cJ/3BU3eujbykhWplrGRhfHhbcS27MQWTDKnGAYvaa/+wyGpQ
	 h2M4jryw0SnLwAiD/H2tTUsrH3oZ1cuCLXx9vBh0ufkcRR5Xu9XgWeUGoMDUGzfFMM
	 Ny+RfNy4P9ShnDbMutXWAUEcZaH+fhfHo9G/eWJc=
Date: Wed, 11 Feb 2026 10:15:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: tomi.valkeinen@ideasonboard.com, kernel-list@raspberrypi.com,
	mchehab@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rp1-cfe: Fix double-free on video device
 re-registration
Message-ID: <20260211081530.GB2553356@killaraus.ideasonboard.com>
References: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211034501.1815035-1-xiaolei.wang@windriver.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52571-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,xs4all.nl,linux.intel.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 2902A122230
X-Rspamd-Action: no action

Hi Xiaolei,

On Wed, Feb 11, 2026 at 11:45:01AM +0800, Xiaolei Wang wrote:
> When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod ov5647),
> the cfe_async_complete callback is invoked again, attempting to re-register
> video nodes that are still registered. This causes multiple issues:
> 
> 1. KASAN double-free in kfree_const when dev_set_name tries to free the
>    kobject name that was already freed during video_unregister_device
> 2. "tried to init an initialized object" warnings because the video_device
>    kobject is re-initialized before being fully released
> 
> Fix this by:
> - Adding a check in cfe_probe_complete() to skip nodes already in
>   NODE_REGISTERED state, preventing duplicate registration attempts
> - Implementing cfe_async_unbind() callback to properly clear the
>   source_sd pointer when the subdevice is unbound

I think a better fix would be to register video nodes at probe time, not
when sensors are bound.

> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 62dca76b468d..d3813c79316d 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -2152,6 +2152,9 @@ static int cfe_probe_complete(struct cfe_device *cfe)
>  	cfe->v4l2_dev.notify = cfe_notify;
>  
>  	for (unsigned int i = 0; i < NUM_NODES; i++) {
> +		if (check_state(cfe, NODE_REGISTERED, i))
> +			continue;
> +
>  		ret = cfe_register_node(cfe, i);
>  		if (ret) {
>  			cfe_err(cfe, "Unable to register video node %u.\n", i);
> @@ -2204,8 +2207,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
>  	return cfe_probe_complete(cfe);
>  }
>  
> +static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
> +			     struct v4l2_subdev *subdev,
> +			     struct v4l2_async_connection *asd)
> +{
> +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
> +
> +	cfe->source_sd = NULL;
> +	cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
> +}
> +
>  static const struct v4l2_async_notifier_operations cfe_async_ops = {
>  	.bound = cfe_async_bound,
> +	.unbind = cfe_async_unbind,
>  	.complete = cfe_async_complete,
>  };
>  

-- 
Regards,

Laurent Pinchart

