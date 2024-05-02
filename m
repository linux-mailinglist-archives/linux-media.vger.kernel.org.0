Return-Path: <linux-media+bounces-10646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB38BA09F
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC691F21438
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DA4174EDF;
	Thu,  2 May 2024 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dLuo7NTW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEEA155350;
	Thu,  2 May 2024 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714675064; cv=none; b=W+SbLGRF1PaHMWuEzjzSf6NPpVFw1NPNJCgU6T3rQWjLy+oPPMridFyFtsQTPSPzMV2BoSsdtz+cRzGU13kh5o7w8kZPiv7U5kH96wCiLVSohK/iV5/hG48JD3hSWd0z5TJsRrbSOR20+DClL396nRmNASzAzgK57D+v78ezefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714675064; c=relaxed/simple;
	bh=5jd2gWJvfIM9JCHJc2zW5hGSSxAkAFAvAlbJrd3dQ10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMl10NP71BJ2EB9FK5fhkiwOZQyvM4qIpFU7n0RYIO8nTqGfSfyBZDLzJ2c3obq6pfJz4jEJ9ix4tdAx14W1WoU8NiAgGUb5SBNOI4RnavyBR/5+XJkwD/wGqiOlylFK6GDAzew1M/0mvm7C76JDiXkYrLsh6vWDdVIAVaukKz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dLuo7NTW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D239363B;
	Thu,  2 May 2024 20:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714675004;
	bh=5jd2gWJvfIM9JCHJc2zW5hGSSxAkAFAvAlbJrd3dQ10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLuo7NTWIYkn380gCpIxIcZArBbtkPlHh5nTnWJHAzfoE2AufMMJTdIaHbrxiZPSd
	 WqigbpxMR61QjBr4cRkDb9R9IuqsOXfd7PU1NCpBaKtqihXEhDOaT5ULArHaAjd5Ec
	 fSKygCtfKWFAI6jv8lexeDI05clXOfn/VQ9F9eys=
Date: Thu, 2 May 2024 21:37:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 14/19] media: max9286: Implement .get_mbus_config()
Message-ID: <20240502183734.GU15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-15-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-15-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:50PM +0200, Jacopo Mondi wrote:
> Implement the .get_mbus_config() operation to allow the remote receiver
> to retrieve the bus configuration.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

This looks good to me, but I expect changes in v2 to address the
comments on 13/19, so I won't add a R-b tag yet.

> ---
>  drivers/media/i2c/max9286.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 0e08a1041eed..a71f0aabd67d 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1072,6 +1072,20 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int max9286_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> +				   struct v4l2_mbus_config *config)
> +{
> +	struct max9286_priv *priv = sd_to_max9286(sd);
> +
> +	if (pad != MAX9286_SRC_PAD)
> +		return -EINVAL;
> +
> +	config->type = V4L2_MBUS_CSI2_DPHY;
> +	config->bus.mipi_csi2.num_data_lanes = priv->csi2_data_lanes;
> +
> +	return 0;
> +}
> +
>  static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  				  struct v4l2_mbus_frame_desc *fd)
>  {
> @@ -1127,6 +1141,7 @@ static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
>  	.enum_mbus_code = max9286_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= max9286_set_fmt,
> +	.get_mbus_config = max9286_get_mbus_config,
>  	.get_frame_interval = v4l2_subdev_get_frame_interval,
>  	.set_frame_interval = max9286_set_frame_interval,
>  	.get_frame_desc	= max9286_get_frame_desc,

-- 
Regards,

Laurent Pinchart

