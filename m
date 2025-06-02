Return-Path: <linux-media+bounces-33884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E225ACABB0
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A15179FEB
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CFA1EDA39;
	Mon,  2 Jun 2025 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P00mtQ0d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC71E5B9D;
	Mon,  2 Jun 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857425; cv=none; b=DkWW7IUpnqfZim2wkS1/bIS7Z+2mB6Ya3dg1JBANBrNtP/ITbC0Orw5HzBwMnLxWw7Ex30k8w/3mv5reD2nQdeFQcMSI/T0sgcIUuStgB8HhldoMxtlC+kF4r/AoGTar+jFYTa/eYAdjIfQbpvJQfM8rgoo/49a01SWaI9BCbcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857425; c=relaxed/simple;
	bh=x3kNh4w3y7yoZck135yvoQQWXpEmjy608kokjDlJ7KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdjXGImouPQi2aBgWAH9e0E08J8xI0P+N3mw5r+6Cu0wJOQsOyLqHb4Y9LysD2cKXnhMlYXqGd1Uwe349ZY6ab2kS97+V/cvlgvxqOlUIbAjcdaoSowQWFiQoEiVYRBhkla5wIxgHoqWj5j4RFrnbdNm3mk4P6YyfkRa6xr9qG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P00mtQ0d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C41B4379;
	Mon,  2 Jun 2025 11:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857420;
	bh=x3kNh4w3y7yoZck135yvoQQWXpEmjy608kokjDlJ7KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P00mtQ0dwrMM2fBbpQ3VJjEwikjO28KMwUWbUQMuJZvjFdsnk9YYc9U1Hlzy4h/n/
	 VfxVDbJBnUJk4EnZGyrmlJzzSxSCk2Rlf+sJEbGZbaH9mPvyLo7qO0nlTqAEDMgPX5
	 GXDaSDWTkCzd4ESa15tzuykiqO57N8TAVoIbQOjg=
Date: Mon, 2 Jun 2025 12:43:33 +0300
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
Subject: Re: [PATCH v3 03/15] media: rcar-isp: Move
 {enable|disable}_streams() calls
Message-ID: <20250602055742.GC11750@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-3-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-3-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:32PM +0300, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the ISP hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> risp_start() and risp_stop().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 8fb2cc3b5650..2337c5d44c40 100644
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
> @@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
> +					 BIT_ULL(0));

You're now potentially calling v4l2_subdev_disable_streams() multiple
times on the same pad and stream, as this call isn't covered by the
stream_count check anymore. Is that correct ? Maybe because
risp_enable_streams() is guaranteed to never be called multiple times,
with stream_count never becoming larger than 1 ? If so that should be
explained in the commit message, and stream_count should probably be
dropped.

Same when stopping.

> +	if (ret) {
> +		risp_stop(isp);

This is also not covered by the stream_count, while risp_start() is.

> +		return ret;
> +	}
> +
>  	isp->stream_count += 1;
>  
>  	return ret;
> @@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>  	if (!isp->remote)
>  		return -ENODEV;
>  
> +	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
> +
>  	if (isp->stream_count == 1)
>  		risp_stop(isp);
>  

-- 
Regards,

Laurent Pinchart

