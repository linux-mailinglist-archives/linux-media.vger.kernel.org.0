Return-Path: <linux-media+bounces-56245-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNhoBDkPu2kSegIAu9opvQ
	(envelope-from <linux-media+bounces-56245-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:46:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF482C299A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91FE43055121
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE84134B1AB;
	Wed, 18 Mar 2026 20:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SnNd+W/m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B8733C51D;
	Wed, 18 Mar 2026 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866688; cv=none; b=VVfqfwIv1jIrAt9lwQ2N6HUcwgTfF9IZ1pn7cJduPSZjOEop5ohzrAKhNkVuEhaUAN7KggkQh6hBTKDYjAlbW8+Cq0TGYEHIHimBq3Rq6DzENPsCer5av0O5mfNVMSrBQBEXnj9qcYS/9Wmp6RGTZg1l88LLiVhyGjQK9pFPI3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866688; c=relaxed/simple;
	bh=aUg2FOKzwtv/5vg+loAinfrgbjmx7AS32zi2EP1EQkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9VGFVBavRbEuCa8Jo3TLlnm28LWEGXQJ4tlzxJWume51veouDKlZZNPJ5Lu3QFuNmYen0HI4Pb47zoo7qDhbawO+nMm6TV+ediRhPj9IjgrnK5DqyTBUM6Z/veQNiFkIn2MOpgO6178qZ0zg/PQmxVb5eayzzrbcQilA/iEwP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SnNd+W/m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F59C308;
	Wed, 18 Mar 2026 21:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773866611;
	bh=aUg2FOKzwtv/5vg+loAinfrgbjmx7AS32zi2EP1EQkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnNd+W/ma3PyWANKpRFBh2nlAyph6l8V5rmmL6OlPOYwFYBTLarwbMa74RA1KpiM6
	 7ZTDPnDe0NPhYW/cfkdmfJ/ok4H18Xiqp6AinsX3DxOpsg+UAwqtLGX0as0uWyttzc
	 gAgZz3ddvpjK8s1ia5TpezM41kDmK78hTuOEUaHw=
Date: Wed, 18 Mar 2026 22:44:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 02/10] media: rcar-isp: Move
 {enable|disable}_streams() calls
Message-ID: <20260318204442.GF716464@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-2-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-rcar-streams-v5-2-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56245-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 6AF482C299A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:53:15PM +0200, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the ISP hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> risp_start() and risp_stop().
> 
> On Gen4, a side effect of this change is that if the sink side devices
> call .enable_streams() on rcar-isp multiple times, the second call will
> fail. This is because we always use stream ID 0, so the second call
> would attempt to enable the same stream again, leading to an error. In
> other words, a normal single-stream setup continues to work, but trying
> to use the current driver's custom VC based routing will fail.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 27 ++++++++++++++++---------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 8fb2cc3b5650..58a9a3bd9f75 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
>  
> -	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> -					 BIT_ULL(0));
> -	if (ret)
> -		risp_power_off(isp);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static void risp_stop(struct rcar_isp *isp)
>  {
> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> -
>  	/* Stop ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
>  
> @@ -291,7 +284,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			       u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> -	int ret = 0;
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -305,9 +298,17 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		if (isp->stream_count == 0)
> +			risp_stop(isp);
> +		return ret;
> +	}
> +
>  	isp->stream_count += 1;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int risp_disable_streams(struct v4l2_subdev *sd,
> @@ -315,6 +316,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  				u64 source_streams_mask)
>  {
>  	struct rcar_isp *isp = sd_to_isp(sd);
> +	int ret;
>  
>  	if (source_streams_mask != 1)
>  		return -EINVAL;
> @@ -322,6 +324,11 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  	if (!isp->remote)
>  		return -ENODEV;
>  
> +	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
> +					  BIT_ULL(0));
> +	if (ret)
> +		return ret;
> +
>  	if (isp->stream_count == 1)
>  		risp_stop(isp);
>  
> 

-- 
Regards,

Laurent Pinchart

