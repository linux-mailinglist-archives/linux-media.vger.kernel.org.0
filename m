Return-Path: <linux-media+bounces-10635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D98B9FAE
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 19:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15414282967
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 17:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ACB16FF54;
	Thu,  2 May 2024 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MwuqT6Qx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92416FF3E;
	Thu,  2 May 2024 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714671707; cv=none; b=V3PMsULKMBCFWKtrQZD0TABKyFyryHXh88MHleAsmxO72AiPUrplTHTN7lzI72EGqTpAZAIWgs6+fID4EunDqRdHbzvslOuN7/XHWqJkACoQZd1KPF8JGVqIwZIspR96iygcbgX4elZ7TzftcaDAD17bYkXqf7yHnXxc1Vr4ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714671707; c=relaxed/simple;
	bh=qv69kzTysUcW+pHkcVMngjJTc6+YSlhz/+OwbSZyjlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3HYR7wMVFYpPZzoqzLt0shEDg/r54rRu71OW0AJtT07469bqLx6+xQuMD72YvFjbo3LA8CtIoeIMiixiHHdlupKses7izS/aLFtFLP59GBUq8hppDRiflSfRcAaPb9IblF4dBRc3SiGmkXUJolUZJtnfDLzn7ImcmlshViF38g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MwuqT6Qx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E014552;
	Thu,  2 May 2024 19:40:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714671647;
	bh=qv69kzTysUcW+pHkcVMngjJTc6+YSlhz/+OwbSZyjlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwuqT6Qxhr7p2g15PtTGy8N5HoeuPEhgvnk1ojjJdI2dgm3VvN6Ta9J8exVtSgc8T
	 7zaxbdRR4Sfn8OrEjQ182opNILi02JktaOKycqfYbWi738inMgF3fcsaqFLqblM+UQ
	 P78rbiBNWcZUzOdYR833xH6XgnFuMzHCleZ0tEUk=
Date: Thu, 2 May 2024 20:41:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/19] media: adv748x: Propagate format to opposite stream
Message-ID: <20240502174138.GJ15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-5-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-5-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:40PM +0200, Jacopo Mondi wrote:
> Now that the adv748x-csi2 driver supports streams and routing, when a
> format is set on the sink pad, it gets propagated to the connected stream
> on the source pad.

As commented in the review of 01/19, this change belongs to that patch.

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index d929db7e8ef2..ace4e1d904d9 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -167,20 +167,21 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
>  {
> -	struct v4l2_mbus_framefmt *mbusformat;
> +	struct v4l2_mbus_framefmt *fmt;
>  
> -	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> -
> -	/* Format on the source pad is always copied from the sink one. */
> -	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
> -		const struct v4l2_mbus_framefmt *sink_fmt;
> +	/*
> +	 * The format set on the sink pad is propagated to the other end
> +	 * of the active route.
> +	 */
> +	if (sdformat->pad == ADV748X_CSI2_SOURCE)
> +		return -EINVAL;
>  
> -		sink_fmt = v4l2_subdev_state_get_format(sd_state,
> -							ADV748X_CSI2_SINK);
> -		sdformat->format = *sink_fmt;
> -	}
> +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +	*fmt = sdformat->format;
>  
> -	*mbusformat = sdformat->format;
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state,
> +							   sdformat->pad, 0);
> +	*fmt = sdformat->format;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

