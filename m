Return-Path: <linux-media+bounces-39974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE841B27D07
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D5D3B0BAE
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 09:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0283C25EFBE;
	Fri, 15 Aug 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="j3b6Eb0e"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4D1E2312;
	Fri, 15 Aug 2025 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249564; cv=pass; b=LOlNATvLn33rg6n9+k9QSqRZjYqwKbv9VrNST8BTY3XxznxQ+mO5bIuFgiUp3oTXZQBby7zE8DoUUFwZ4PZ8RjG+Yzh8HirTZEF6voXK6ijJ6Z6t4YRxwY8rrpaRVXN5V7/0rFxfam0vcyMzGXKNyI2FZBw+825S8X2HXb70Loo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249564; c=relaxed/simple;
	bh=S655IPnldNjmatwhWKh+tqjNPWVJxcyuKkH8RPT7Bf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw37myXk7k9V3GoENMgAmwxfE48axgI6frGqlLUm0oOCaEgVrwAjqLfeNKGIaVRVbjDbaC+M2Si7mFWSA0hwAomLQlbJPHa+XbC+nvKOldU3Xu15HXSPamuuJD+zvFY8sPTGBkXwInwiytMlH/NX3W2gnxZF4S0ByoXN+6pItro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=j3b6Eb0e; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c3Gl23xpBzyTF;
	Fri, 15 Aug 2025 12:19:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755249553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aD4o17qvx1E5SCsxlqbpRYGrDXPxx4Nan8mqO9dt8j0=;
	b=j3b6Eb0eXExInSrvffulTJxS4/N5TE3zeKFBNo93DzhbTPQHSOZREzdRyyRfZYVvDKhnfp
	2VMkpoOmc2FytiUHV9dujAwyl8xuXjRIhox+Lep/3ndqH/eCIKk6Xyo16+LWY0XRiEQgtC
	Hec/a8dP7Mfshymy2u7YCS9fdMMAGI0=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755249553; a=rsa-sha256; cv=none;
	b=jF+rxq3ET9Xhqtw4D+v3xbpInVI+UFjFh5fgT9fkWJTIu0A5aTDqDnQ/kIWYffO+7sp1Tr
	PQArqD6tgG8qq/Q1kEltCpW1YVAOHJHQYHa+bJxxs9LgWv8vkVNBm9mS7N6/yyi/lXF02g
	hn1iWU1jT818AiFWraPcaWgJ6Gb9gSg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755249553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aD4o17qvx1E5SCsxlqbpRYGrDXPxx4Nan8mqO9dt8j0=;
	b=Gjv7iR31M+ZJ9fECxdx+WbKwwuYGbWwMxrCYpyd+az3+kntNEBCRTP/kd7d7tXRMsH7FmP
	qklCBbZMFJVq0qzLKSutQBFsuM/7viPuCjocSPufhUWeuDGxAXvZIqkVvto6EKeGpqQCux
	8vR0xtXCWQ6bvcH4PftdIoUbBt7LLAQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D834C634C93;
	Fri, 15 Aug 2025 12:18:12 +0300 (EEST)
Date: Fri, 15 Aug 2025 09:18:13 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814113701.165644-1-isaac.scott@ideasonboard.com>

Hi Isaac,

Thanks for the patch.

On Thu, Aug 14, 2025 at 12:37:01PM +0100, Isaac Scott wrote:
> Although 4 lanes may be physically available, we may not be using all of
> them. Get the number of configured lanes in the case a driver has
> implemented the get_mbus_config op.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> 
> ---
> 
> Currently, the imx-mipi-csis driver parses the device tree to determine
> the number of configured lanes for the CSI receiver. This may be
> incorrect in the case that the connected device only uses a subset of
> lanes, for example. Allow the drivers for these cameras to create a
> mbus_config to configure the number of lanes that are actually being
> used.
> 
> If the driver does not support the get_mbus_config op, this patch will
> have no functional change.
> 
> Compile tested against media-master (v6.17-rc1)
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..efe4e2ad0382 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -939,6 +939,43 @@ static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
>  	return container_of(sdev, struct mipi_csis_device, sd);
>  }
>  
> +static int mipi_csis_get_active_lanes(struct v4l2_subdev *sd)
> +{
> +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> +	struct v4l2_mbus_config mbus_config = { 0 };
> +	int ret;
> +
> +	ret = v4l2_subdev_call(csis->source.sd, pad, get_mbus_config,
> +			       0, &mbus_config);
> +	if (ret == -ENOIOCTLCMD) {
> +		dev_dbg(csis->dev, "No remote mbus configuration available\n");
> +		return 0;
> +	}
> +
> +	if (ret) {
> +		dev_err(csis->dev, "Failed to get remote mbus configuration\n");
> +		return ret;
> +	}
> +
> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> +		dev_err(csis->dev, "Unsupported media bus type %u\n",
> +			mbus_config.type);
> +		return -EINVAL;
> +	}
> +
> +	if (mbus_config.bus.mipi_csi2.num_data_lanes > csis->bus.num_data_lanes) {
> +		dev_err(csis->dev,
> +			"Unsupported mbus config: too many data lanes %u\n",
> +			mbus_config.bus.mipi_csi2.num_data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	csis->bus.num_data_lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +	dev_dbg(csis->dev, "Number of lanes: %d\n", csis->bus.num_data_lanes);

None of the above is really specific to this driver. Could you instead
implement a function that parses the information from the fwnode endpoint
and uses mbus configuration on top?

The function could take struct media_pad pointer as an argument, or struct
v4l2_subdev pointer and the pad number.

I wonder if any other parameters could change dynamically but I can't think
of that now, so perhaps just the number of lanes is what the function
should indeed return.

> +
> +	return 0;
> +}
> +
>  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
>  
> +	ret = mipi_csis_get_active_lanes(sd);
> +	if (ret < 0)
> +		dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> +
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
>  		goto err_unlock;

-- 
Kind regards,

Sakari Ailus

