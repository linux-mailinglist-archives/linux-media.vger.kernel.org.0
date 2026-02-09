Return-Path: <linux-media+bounces-52393-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kObUIi+xiWndAgUAu9opvQ
	(envelope-from <linux-media+bounces-52393-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 11:04:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 057EE10DF46
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 11:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF35730157D2
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38972D7DF3;
	Mon,  9 Feb 2026 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kfeZ60HU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D962BEC45
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631452; cv=none; b=ppobKu6T0S9FkoO3WzmrDTH3l+83MaRW3q0pwWCEME/raTTRgNum1HJV9NHEq2alIfEUKNvjSDpd7qOVCnIoNr3N/F2MeVH9b9EiPVSHqomoHpuMQVI/irEKsAMvMqXHREiI0geL0Hw/tCjzVp/9iaiQBVkyEA/Sd+NMx/G2r0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631452; c=relaxed/simple;
	bh=gpUNWEX8GdohtG1lVrXF23uPge+LB4c1cYXD3ZVzqnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqeHRVlLpGWXx+XhZvnW0wH9XY4/jItAZa92Lnd9QVdIPMHVnQMdJb64xrfWgX3I1U+5/RUBMRPpx8uosjjMN5C7XSp5j7GiSGvBTfiFPSRdM+hZ9YZx4t9F+WnM54Sa6IVWJbnqFwJloeZ+IDD56/59E/WeAfX/UwBJ6YsM7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kfeZ60HU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E86AB63F;
	Mon,  9 Feb 2026 11:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770631404;
	bh=gpUNWEX8GdohtG1lVrXF23uPge+LB4c1cYXD3ZVzqnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfeZ60HUueKcUDzAJn446nIHr77hanVRCT9N+H5Adv38Mk1LUiCVeqwd50e8W9SmV
	 X2uAHkww6rVbXFLj8LMIWbG5Q7jLapnLev+/ch9ybG7vHred3JmH53724xpiNQXVQC
	 7W0cijGqc+Q8zcDRGZX9OoiSNKhZOy21ty3DyP78=
Date: Mon, 9 Feb 2026 12:04:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Message-ID: <20260209100408.GC2302514@killaraus.ideasonboard.com>
References: <20260209055529.16644-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260209055529.16644-1-arash.golgol@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52393-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 057EE10DF46
X-Rspamd-Action: no action

Hi Arash,

Thank you for the patch.

On Mon, Feb 09, 2026 at 09:25:29AM +0330, Arash Golgol wrote:
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
> 
> The sun6i-mipi-csi2 hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
> 
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
> Changes in v2:
>     - Simplify control flow by dropping the else at end of s_stream()
>     - Call v4l2_subdev_cleanup() on bridge setup failure before 
>     notifier registration
> 
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 110 +++++++++---------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  2 files changed, 55 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index b06cb73015cd..f4d1f876dac8 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
>  			   SUN6I_MIPI_CSI2_CTL_EN, 0);
>  }
>  
> -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
> +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
> +				       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap = csi2_dev->regmap;
>  	unsigned int lanes_count =
>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> -	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
>  	const struct sun6i_mipi_csi2_format *format;
>  	struct device *dev = csi2_dev->dev;
>  	u32 version = 0;
> @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
>  	union phy_configure_opts dphy_opts = { 0 };
>  	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
> -	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	const struct sun6i_mipi_csi2_format *format;
>  	struct phy *dphy = csi2_dev->dphy;
>  	struct device *dev = csi2_dev->dev;
> @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  	unsigned long pixel_rate;
>  	int ret;
>  
> -	if (!source_subdev)
> -		return -ENODEV;
> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +	if (!source_subdev) {
> +		ret = -ENODEV;
> +		goto unlock;
> +	}
>  
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  
>  	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
>  
>  	/* Sensor Pixel Rate */
>  
> @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  		goto error_pm;
>  	}
>  
> +	mbus_format = v4l2_subdev_state_get_format(state,
> +						   SUN6I_MIPI_CSI2_PAD_SINK);
>  	format = sun6i_mipi_csi2_format_find(mbus_format->code);
>  	if (WARN_ON(!format)) {
>  		ret = -ENODEV;
> @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  
>  	/* Controller */
>  
> -	sun6i_mipi_csi2_configure(csi2_dev);
> +	sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
>  	sun6i_mipi_csi2_enable(csi2_dev);
>  
>  	/* D-PHY */
> @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  	if (ret && ret != -ENOIOCTLCMD)
>  		goto disable;
>  
> -	return 0;
> +	ret = 0;
> +	goto unlock;
>  
>  disable:
>  	phy_power_off(dphy);
> @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
>  error_pm:
>  	pm_runtime_put(dev);
>  
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
>  
> @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
>  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
>  				      struct v4l2_subdev_state *state)
>  {
> -	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> -	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
> -	struct v4l2_mbus_framefmt *mbus_format =
> -		v4l2_subdev_state_get_format(state, pad);
> -	struct mutex *lock = &csi2_dev->bridge.lock;
> +	unsigned int pad;
>  
> -	mutex_lock(lock);
> +	/*
> +	 * This subdev does not perform format conversion,
> +	 * initialize both pads identically.
> +	 */
> +	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
> +		struct v4l2_mbus_framefmt *mbus_format;
>  
> -	mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
> -	mbus_format->width = 640;
> -	mbus_format->height = 480;
> +		mbus_format = v4l2_subdev_state_get_format(state, pad);
>  
> -	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +		mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
> +		mbus_format->width = 640;
> +		mbus_format->height = 480;
>  
> -	mutex_unlock(lock);
> +		sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +	}
>  
>  	return 0;
>  }
> @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> -				   struct v4l2_subdev_state *state,
> -				   struct v4l2_subdev_format *format)
> -{
> -	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> -	struct mutex *lock = &csi2_dev->bridge.lock;
> -
> -	mutex_lock(lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		*mbus_format = *v4l2_subdev_state_get_format(state,
> -							     format->pad);
> -	else
> -		*mbus_format = csi2_dev->bridge.mbus_format;
> -
> -	mutex_unlock(lock);
> -
> -	return 0;
> -}
> -
>  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
>  				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_format *format)
>  {
> -	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> -	struct mutex *lock = &csi2_dev->bridge.lock;
> +	struct v4l2_mbus_framefmt *fmt;
>  
> -	mutex_lock(lock);
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
>  
> -	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> +	sun6i_mipi_csi2_mbus_format_prepare(&format->format);
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		*v4l2_subdev_state_get_format(state, format->pad) =
> -			*mbus_format;
> -	else
> -		csi2_dev->bridge.mbus_format = *mbus_format;
> +	/* Set the format on the sink pad. */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad);
> +	*fmt = format->format;
>  
> -	mutex_unlock(lock);
> +	/* Propagate the format to the source pad. */
> +	fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
> +	*fmt = format->format;
>  
>  	return 0;
>  }
>  
>  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
>  	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
> -	.get_fmt	= sun6i_mipi_csi2_get_fmt,
> +	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= sun6i_mipi_csi2_set_fmt,
>  };
>  
> @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  	bool notifier_registered = false;
>  	int ret;
>  
> -	mutex_init(&bridge->lock);
> -
>  	/* V4L2 Subdev */
>  
>  	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  	if (ret)
>  		return ret;
>  
> +	/* V4L2 Subdev finalize */
> +
> +	ret = v4l2_subdev_init_finalize(subdev);
> +	if (ret < 0)
> +		goto error_media_entity_cleanup;
> +
>  	/* V4L2 Async */
>  
>  	v4l2_async_subdev_nf_init(notifier, subdev);
> @@ -539,7 +534,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  
>  	ret = sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
>  	if (ret && ret != -ENODEV)
> -		goto error_v4l2_notifier_cleanup;
> +		goto error_v4l2_subdev_cleanup;

On second thought, I wonder if we shouldn't keep jumping to
error_v4l2_notifier_cleanup. v4l2_async_subdev_nf_init() is called
above, and even though no async subdev will be added to the notifier if
sun6i_mipi_csi2_bridge_source_setup() fails, I think calling
v4l2_async_nf_cleanup() will be more future-proof in case the
v4l2_async_subdev_nf_init() implementation changes to require a cleanup
call unconditionally.

This is a minor issue, and I'm fine with the current version of the
patch too if that's preferred by the majority, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you want to modify the goto, I recommend waiting a few days first for
Paul to review the patch before submitting a v3.

>  
>  	/* Only register the notifier when a sensor is connected. */
>  	if (ret != -ENODEV) {
> @@ -565,6 +560,10 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
>  error_v4l2_notifier_cleanup:
>  	v4l2_async_nf_cleanup(notifier);
>  
> +error_v4l2_subdev_cleanup:
> +	v4l2_subdev_cleanup(subdev);
> +
> +error_media_entity_cleanup:
>  	media_entity_cleanup(&subdev->entity);
>  
>  	return ret;
> @@ -579,6 +578,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
>  	v4l2_async_unregister_subdev(subdev);
>  	v4l2_async_nf_unregister(notifier);
>  	v4l2_async_nf_cleanup(notifier);
> +	v4l2_subdev_cleanup(subdev);
>  	media_entity_cleanup(&subdev->entity);
>  }
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> index 24b15e34b5e8..d72dfbd6a993 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
>  	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
>  	struct v4l2_fwnode_endpoint	endpoint;
>  	struct v4l2_async_notifier	notifier;
> -	struct v4l2_mbus_framefmt	mbus_format;
> -	struct mutex			lock; /* Mbus format lock. */
>  
>  	struct v4l2_subdev		*source_subdev;
>  };

-- 
Regards,

Laurent Pinchart

