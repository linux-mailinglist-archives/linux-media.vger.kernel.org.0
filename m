Return-Path: <linux-media+bounces-51387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA5BHggpc2kAswAAu9opvQ
	(envelope-from <linux-media+bounces-51387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:53:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B8720A7
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 08:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BCC301C8A1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA533EB09;
	Fri, 23 Jan 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZxmbYKUi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92849288C86;
	Fri, 23 Jan 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154812; cv=none; b=iRY1bcsJj0k8FkHHK4xIHpq97mRUpxabbIBJaEx1EkhRhqcOVVDPiyM9sM3UYTQP79KBeOz03OZdZppWQo4bzwoDjtL+zyNF15SL5TjhV8RFRgoz4NC31eihfUI2x6/d6CXgWAHcHzLw8wUqlHJL5FbLjc32S80j1cpVAJ9R2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154812; c=relaxed/simple;
	bh=CydP1SI/itOoSge0Z+MIOsw27/FtcA5npRVrCB4FyMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpRe5I6owRySBTRS96tJqyqBsBKemk1TYvSHPmOhlzxPPoESOcb0Ls+6jJOjXiML4SIQb38rFBqrGKTpZELgpM+Pof8VqA8CiJbW62Wjvcf5fw0Q7RoD0cOor0FDqsjsut2aT22Yx3y78oditlS/XoYZLUZWrXsYMkpBxLg1zzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZxmbYKUi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF15D103D;
	Fri, 23 Jan 2026 08:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769154768;
	bh=CydP1SI/itOoSge0Z+MIOsw27/FtcA5npRVrCB4FyMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZxmbYKUiKw9C4M1tvfYuuqeyI+/ASJy97cM0Mt5L8nwLLc19j7i1AfvLYPHT9ZK90
	 zf3GdHQNKTSlHr6WkrKq/g7LQXsEsXOEvCZaHRwAR4P+0R9JLBzpdsv9RPHEjGbQMs
	 mTz83N1m6HHk8BRZJPknuId767AjTK2EjlNgT/IM=
Message-ID: <55b08e0e-1921-4d37-a716-ff60852ec51b@ideasonboard.com>
Date: Fri, 23 Jan 2026 09:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/18] media: cadence: csi2rx: Use the stream from
 route to get format
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-13-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260121135424.1185710-13-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51387-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: D49B8720A7
X-Rspamd-Action: no action

Hi,

On 21/01/2026 15:54, Rishikesh Donadkar wrote:
> In multistream configurations, different streams can have different
> formats. Update the driver to use the stream number from the routing
> configuration when retrieving formats instead of hardcoding stream 0
> or ignoring streams.
> 
> In csi2rx_configure_ext_dphy(), use the sink_stream from the first
> route instead of always using stream 0.
> 
> In cdns_csi2rx_negotiate_ppc(), iterate through all active routes
> for the requested pad and retrieve the format using both pad and
> stream information.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 34 ++++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)

So if I understand this right, v9 was working by luck, as it was always
using stream 0 format (and expected stream 0 to be there)?

Two thoughts here:
- This should be merged to the previous patch, shouldn't it?
- Are you now testing with different resolutions, fps, etc on the
fpd-link ports?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 175366f889115..db9871fdbe3a4 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -279,6 +279,7 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  	struct v4l2_mbus_framefmt *framefmt;
>  	struct v4l2_subdev_state *state;
>  	const struct csi2rx_fmt *fmt;
> +	struct v4l2_subdev_route *route;
>  	int source_pad = csi2rx->source_pad;
>  	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>  	s64 link_freq;
> @@ -296,7 +297,9 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  	if (state->routing.num_routes > 1) {
>  		bpp = 0;
>  	} else {
> -		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
> +		route = &state->routing.routes[0];
> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
> +							route->sink_stream);
>  		if (!framefmt) {
>  			dev_err(csi2rx->dev, "Did not find active sink format\n");
>  			return -EINVAL;
> @@ -706,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>  	const struct csi2rx_fmt *csi_fmt;
> +	struct v4l2_subdev_route *route;
>  	struct v4l2_subdev_state *state;
>  	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
>  
>  	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
>  		return -EINVAL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(subdev);
> -	fmt = v4l2_subdev_state_get_format(state, pad);
> -	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
> +	/* Check all streams on requested pad */
> +	for_each_active_route(&state->routing, route) {
> +		if (route->source_pad != pad)
> +			continue;
> +
> +		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
> +						   route->source_stream);
> +		if (!fmt) {
> +			ret = -EPIPE;
> +			*ppc = 1;
> +			break;
> +		}
>  
> -	/* Reduce requested PPC if it is too high */
> -	*ppc = min(*ppc, csi_fmt->max_pixels);
> +		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
> +		if (!csi_fmt) {
> +			ret = -EINVAL;
> +			*ppc = 1;
> +			break;
> +		}
>  
> +		/* Reduce requested PPC if it is too high for this stream */
> +		*ppc = min(*ppc, csi_fmt->max_pixels);
> +	}
>  	v4l2_subdev_unlock_state(state);
>  
>  	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
>  		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>  


