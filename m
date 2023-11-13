Return-Path: <linux-media+bounces-216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 055177E9AA5
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D1D1C20906
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7E1CA91;
	Mon, 13 Nov 2023 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="F71rRbPi"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895318625
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 11:06:45 +0000 (UTC)
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2DF10D0
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 03:06:42 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4STRSw46pjz49PwQ
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:06:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1699873600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PX5erVL2047MQq/mcxk/feu4DbN8eEdVm0JFAv0KyRM=;
	b=F71rRbPiJhlaRdxI8zQJ/NNp30DDbr5J4GvoJaGySk6JyIeN3BitoC6V1VWavdVycXWBvr
	QVFYRVDq/b7nGjohx90nJPX8eYnVMMNud3QR5smeR/8BAmuB9KpgHmtsxxJLuzOC41NVTR
	dRBvDEBswHBxMJFFUWOuHw3hxjou77+Pu+W9HtkbTukVYgVRXJJEOUPDqU4OK3AwXfQXu6
	zwrKBdIpKmeRYVgPtrMDfLzfWX7qVlIS6DOFqXOKV8LSCQ6cTlQUaZKhpiaZvO7W5AQCsC
	IeRt/03mO5K9/pFz1CDucz9yfMHIzXucOIGkyV6P6ouAz1BscKO2cvoVx1bNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1699873600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PX5erVL2047MQq/mcxk/feu4DbN8eEdVm0JFAv0KyRM=;
	b=jM/6qNUmREyJv/wF4lAuz+j0O28fz2gmSyM4Hk9SZLAvRcF69ZeYvCZinGpj0ttjvhydBz
	zHegP+eynNlOYvpC8VSow9rwnISK9eKES6lp7wc/NVp09qg0lKYzFo6p+Ftir+G9PiWXUd
	fI8+30UmZNk0/2rwlcYgVXdMOaDcZ+mWOXdUgsbUoBzCEh56j6+/quwB54QXxlmPSTXV1Y
	i0dmrKz3YjfEm1xT1XSZ44PZay7ic7iFcGVyaInS5vctqsGhmhAvmHnoEsKGcrZ4OZ1NqQ
	JqeQy8AQ+s9C789S2Gs5gAd1dccOKdqwW22qfo81VNCCNGMqq6WbbCg1vQD0bA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1699873600; a=rsa-sha256;
	cv=none;
	b=YzDj3O14RUJ6GuoIZUxs3GrhyboSaF29jQ0lDKkWKs93/HqTKNC9fdyC37xEkSwkPCPfg0
	K4OCxDvde3I9OcNqgKgVQYQUfw4T1bptYDggrAM9YMzGl4W92oJCDyDeuMErwxSABi1kEM
	whN7TvCAUbeP0jdGkvK1/i83w8LMkhRCW6HboAoIwLUg7F0Kvmrsg8MPIZ9xkqQHTRVr3l
	wkNuAyMu9GkM3ontZ9aLR4JctKP33H/SJdaMRnWz3NMiRVWsotzy0vcempaecjGjUHVUUn
	wgPy4oIdYcaATywxqLR+LZu6fxQyw3lYqjb9/XTIMIWsnDDNziBGs6FElgeplg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1445C634C93;
	Mon, 13 Nov 2023 13:06:35 +0200 (EET)
Date: Mon, 13 Nov 2023 11:06:34 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 2/2] media: v4l2-subdev: Relax warnings in link
 validation
Message-ID: <ZVIDOlMYhCWiyNPh@valkosipuli.retiisi.eu>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113101718.6098-3-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

Thanks for the patch.

On Mon, Nov 13, 2023 at 12:17:18PM +0200, Laurent Pinchart wrote:
> Before v6.3, the v4l2_subdev_link_validate() helper would ignore links
> whose source was a video device and sink a subdev. The helper was (and
> still is) used by drivers in such cases, in particular for subdevs with
> multiple sink pads, some connected to video devices and some to other
> subdevs.
> 
> Then, commit a6b995ed03ff ("media: subdev: use streams in
> v4l2_subdev_link_validate()") assumed the entities on the two sides of a
> link are both subdevs, and caused crashes in drivers that use the helper
> with subdev sink pads connected to video devices. Commit 55f1ecb11990
> ("media: v4l: subdev: Make link validation safer"), merged in v6.4,
> fixed the crash by adding an explicit check with a pr_warn_once(),
> mentioning a driver bug.
> 
> Links between a subdev and a video device need to be validated, and
> v4l2_subdev_link_validate() can't handle that. Drivers typically handle
> this validation manually at stream start time (either in the .streamon()
> ioctl handler, or in the .start_streaming() vb2 queue operation),
> instead of implementing a custom .link_validate() handler. Forbidding

While some do the validation as part of the streamon callback, it'd be
nicer to move this to the link_validate callback instead: this is what the
callback is for. I'd presume not may drivers depend on
v4l2_subdev_link_validate() fail silently on non-subdevices as the issue
hasn't been reported before while the patch that seems to have broken this
was merged in 6.3.

Not failing silently in link_validate also ensures the validation gets
done: there have been drivers (more than one) that have simply missed the
link validation due to the issue (non-sub-device entity on one end) being
silently ignored by default.

> usage of v4l2_subdev_link_validate() as the .link_validate() handler
> would thus force all subdev drivers that mix source links to subdev and
> video devices to implement a custom .link_validate() handler that
> returns immediately for the video device links and call
> v4l2_subdev_link_validate() for subdev links. This would create lots of
> duplicated code for no real gain. Instead, relax the check in
> v4l2_ctrl_modify_range() to ignore links from a video device to a subdev
> without printing any warning.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 30 ++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 67d43206ce32..b00be1d57e05 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1356,15 +1356,31 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  	struct v4l2_subdev *source_sd, *sink_sd;
>  	struct v4l2_subdev_state *source_state, *sink_state;
>  	bool states_locked;
> +	bool is_sink_subdev;
> +	bool is_source_subdev;
>  	int ret;
>  
> -	if (!is_media_entity_v4l2_subdev(link->sink->entity) ||
> -	    !is_media_entity_v4l2_subdev(link->source->entity)) {
> -		pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> -			     !is_media_entity_v4l2_subdev(link->sink->entity) ?
> -			     "sink" : "source",
> -			     link->source->entity->name, link->source->index,
> -			     link->sink->entity->name, link->sink->index);
> +	is_sink_subdev = is_media_entity_v4l2_subdev(link->sink->entity);
> +	is_source_subdev = is_media_entity_v4l2_subdev(link->source->entity);
> +
> +	if (!is_sink_subdev || !is_source_subdev) {
> +		/*
> +		 * Do not print the warning if the source is a video device and
> +		 * the sink a subdev. This is a valid use case, to allow usage
> +		 * of this helper by subdev drivers that have multiple sink
> +		 * pads, some connected to video devices and some connected to
> +		 * other subdevs. The video device to subdev link is typically
> +		 * validated manually by the driver at stream start time in such
> +		 * cases.
> +		 */
> +		if (!is_sink_subdev ||
> +		    !is_media_entity_v4l2_video_device(link->source->entity))
> +			pr_warn_once("%s of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> +				     !is_sink_subdev ? "sink" : "source",
> +				     link->source->entity->name,
> +				     link->source->index,
> +				     link->sink->entity->name,
> +				     link->sink->index);
>  		return 0;
>  	}
>  

-- 
Kind regards,

Sakari Ailus

