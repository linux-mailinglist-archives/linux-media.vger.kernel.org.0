Return-Path: <linux-media+bounces-33919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95198ACAF00
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EAC73A41AD
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1152206B1;
	Mon,  2 Jun 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ry2ZLToJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB171FF61E;
	Mon,  2 Jun 2025 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870930; cv=none; b=ZB7j09mCDPiLNrESXLRX/nuYnA6KtjW2R4cwSr1Os1Lub6S2A9DaS+RhGFXyx0d0YKwW45pHgu4xd0/Xx1r8yHK19JwsxbjG7N+SDufA0WlVWOOQSoTUBEXp29WWoCOoZMYeI7GgzJxUcqQ1ToNUWGViHtux79EU5C1QmIL9gu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870930; c=relaxed/simple;
	bh=GHu/uGah50Q9xqXZQgy2REwYYTTnPThxDJ1YpGowp/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxLFJHNy8qPMnvHVBp2jrFcJ7bbmO8KN13RAaaepT6ATQSGqZsDw6Ycfdj3C0eP7EmSunEJ2gcztdvhzQaQB0XyCAjDqvZIcMcnP9kSJl0yKygz/f8XAEsl1OPuj+hrplQwBeFD+nLnbaLo0c9VWYZPEqf0xS4IHYoX+w5guE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ry2ZLToJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FBB7C9;
	Mon,  2 Jun 2025 15:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748870925;
	bh=GHu/uGah50Q9xqXZQgy2REwYYTTnPThxDJ1YpGowp/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ry2ZLToJH4Gq7Uy96YHJqT46DUk/ibpH2wUHjJ1DL1ZxqQbyqVPsSMLlxsII0iUdK
	 Jf6/IuMmtu2J+WC+U5oa2bjT6gKIi2g/iDeEGDF1XTKp5zFNmCuUh4UxcPNAnO4pD5
	 L33x4Fu3Wt0L04NQT1lk/bpBMKwsektt1AwddIEI=
Date: Mon, 2 Jun 2025 16:28:38 +0300
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
Subject: Re: [PATCH v3 12/15] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
Message-ID: <20250602132838.GE11750@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:41PM +0300, Tomi Valkeinen wrote:
> In the case where link-freq is not available, make sure we fail if there
> are more than one stream configured, and also use the correct stream
> number for that single stream.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 65c7f3040696..b9f83aae725a 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1018,17 +1018,22 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>  	 */
>  	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>  	if (freq < 0) {
> +		struct v4l2_subdev_route *route = &state->routing.routes[0];

const

>  		const struct rcar_csi2_format *format;
>  		struct v4l2_mbus_framefmt *fmt;
>  		unsigned int lanes;
>  		unsigned int bpp;
>  		int ret;
>  
> +		if (state->routing.num_routes > 1)
> +			return -EINVAL;

Do we have to guard against the case where there would be no route ?

> +
>  		ret = rcsi2_get_active_lanes(priv, &lanes);
>  		if (ret)
>  			return ret;
>  
> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
> +						   route->sink_stream);
>  		if (!fmt)
>  			return -EINVAL;
>  

-- 
Regards,

Laurent Pinchart

