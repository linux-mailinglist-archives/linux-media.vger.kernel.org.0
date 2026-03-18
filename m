Return-Path: <linux-media+bounces-56249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBeKDnYWu2nYewIAu9opvQ
	(envelope-from <linux-media+bounces-56249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:17:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A12C2EA6
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 22:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF3230B3897
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 21:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480F034F49E;
	Wed, 18 Mar 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KssbYh53"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D88279DC9;
	Wed, 18 Mar 2026 21:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773868618; cv=none; b=QUeW5Kpl1Bs+vucr5zc5B5GUc6pVjERD4KcXLpGcmGOsez1zrBCK0NoCb99mlHgVl4mQnPwr+lp2xyLGvsC7YZ6f6xSlRk3gHqGykPvDZOhLFBaZueE6/heGXkBhcF+vpils1ar/rDiafY4lObleohLyJFf8IJWK0l1dY6ryrdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773868618; c=relaxed/simple;
	bh=DOLlH1UWpGtpyua3m05mimh5bsw8fM45rb6cu6STwJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAQFsUcEQWHUnhypJZOqxbCW4kRXGI294OZE9gvjIiMBNCF84wrmyrIvmo2rercKNgbfds7F55pV/HHEDvg9zYkqWDcSI4mr8HOT5Q+6l9G+l/eRdxrMD0TYpiHwDF+S8709j0UDkDsFWlDhB8nE3l8h7uJvUrpVEZ4s4pD0i4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KssbYh53; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7332F379;
	Wed, 18 Mar 2026 22:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773868542;
	bh=DOLlH1UWpGtpyua3m05mimh5bsw8fM45rb6cu6STwJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KssbYh531oOTFqTUYeRgkxoOb+73RCI+3kRHmIpXcL0suXjg9TVL1FM1sNHmDRPNV
	 hqZlTl3SGF9WfIsJq9vea9uD68SGK3ezg21UxotTbYdXsIWiFoalD/T+EYafWb3izo
	 GZCtf/2/5uL2mEqdTh8mVA8hGd3UXoaDEklSJj+o=
Date: Wed, 18 Mar 2026 23:16:54 +0200
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
Subject: Re: [PATCH v5 06/10] media: rcar-csi2: Add .get_frame_desc op
Message-ID: <20260318211654.GJ716464@killaraus.ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-rcar-streams-v5-6-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56249-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: CE3A12C2EA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:53:19PM +0200, Tomi Valkeinen wrote:
> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
> 
> We also implement a fallback for the case where the upstream subdevice
> does not implement .get_frame_desc. It assumes a single stream with VC =
> 0 and DT based on the configured stream mbus format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 70 ++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index ad62c95c8f9a..b8baf7c65e90 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1935,12 +1935,82 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
> +					 unsigned int pad,
> +					 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_route *route;
> +	const struct rcar_csi2_format *format;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
> +	if (state->routing.num_routes != 1) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	route = &state->routing.routes[0];
> +
> +	if (route->source_pad != pad) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +					   route->sink_stream);
> +	if (!fmt) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	format = rcsi2_code_to_fmt(fmt->code);
> +	if (!format) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	fd->num_entries = 1;
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->entry[0].stream = route->source_stream;
> +	fd->entry[0].pixelcode = fmt->code;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = format->datatype;
> +
> +out:
> +	v4l2_subdev_unlock_state(state);
> +
> +	return ret;
> +}
> +
> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
> +	int ret;
> +
> +	if (WARN_ON(!priv->info->use_isp))
> +		return -ENOTTY;

Why is that, can't the get frame desc operation be supported on Gen3 ?

> +
> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
> +	if (ret == -ENOIOCTLCMD)
> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);

A dev_warn_once() would be good here, to get people to fix the source
device driver.

> +	return ret;
> +}
> +
>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>  	.enable_streams = rcsi2_enable_streams,
>  	.disable_streams = rcsi2_disable_streams,
>  
>  	.set_fmt = rcsi2_set_pad_format,
>  	.get_fmt = v4l2_subdev_get_fmt,
> +
> +	.get_frame_desc = rcsi2_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
> 

-- 
Regards,

Laurent Pinchart

