Return-Path: <linux-media+bounces-60814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHRnAH2a/Gk6RwAAu9opvQ
	(envelope-from <linux-media+bounces-60814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:58:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E244E9B64
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBACB301BECE
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC023F9F58;
	Thu,  7 May 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IWGB+6J3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E63EDADA
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162125; cv=none; b=geTr6p73YcI8cVnjXyxSRH6+jLtw440a6qlveiwUlQAstljP5pMfKxx/vxhCLcBgNZSb3wtEIL3DBLBRd+5aWuJJQ6eWUHGbh0ZgUryysUgh74pQgQgAq4HKLyUYlsWdBcs1HXavXIE323OlzWKVrV4IHYX1/uadAPVhqnV2sJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162125; c=relaxed/simple;
	bh=w/rMZDDimMTRCVPmHPkIy/rmNwZjv+eRTeKinmSnBiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6XFlA/Ef22vhWyCxug8qxzpcCVxmZxiw8zdYjFHKcV2Z+LU/AFF5tCYuF7wx4lcY6XB7T86G2oXcZzKthKjuAY3NpT5VsD2NBrKhRx+ALLl9eUCNDPQ4p4oso12TY9r9E6hzMmF1Vk5q3o6WotwfsH2xHFEZBuSDjEEYNcNB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IWGB+6J3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E99B19CE;
	Thu,  7 May 2026 15:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778162118;
	bh=w/rMZDDimMTRCVPmHPkIy/rmNwZjv+eRTeKinmSnBiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWGB+6J3Of4wVpiSHKNIS+7Z3V/0GBZeKzyvmXSfOj1AWIxk7A8uRxMvVFBOOmiHC
	 s/L82fHe1W2TPO+LRzNx67uBOAgZmDjFppPAZwY1AOpv+09cE/r4H44e5q4MxcUsxg
	 yXjwj/KNjnjCaHntL99ZOfRp8JgGMNT7BX2iI0Qo=
Date: Thu, 7 May 2026 16:55:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, paulk@sys-base.io,
	mchehab@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v1 1/3] media: sun6i-csi: bridge: Use V4L2 subdev active
 state
Message-ID: <20260507135520.GF1938994@killaraus.ideasonboard.com>
References: <20260217064050.18388-1-arash.golgol@gmail.com>
 <20260217064050.18388-2-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217064050.18388-2-arash.golgol@gmail.com>
X-Rspamd-Queue-Id: 61E244E9B64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60814-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

Hi Arash,

Thank you for the patch.

On Tue, Feb 17, 2026 at 10:10:48AM +0330, Arash Golgol wrote:
> Use the V4L2 subdev active state API to store the active format.
> This simplifies the driver not only by dropping the bridge mbus_format
> field, but it also allows dropping the bridge lock, replaced with
> the state lock.
> 
> Previously, capture accessed bridge private state directly. After
> moving to framework-managed state, resolve the format through the
> subdev pad API.
> 
> The sun6i-csi-bridge hardware does not perform any format conversion.
> Enforce identical formats on the sink and source pads in the set_fmt()
> and init_state() callbacks.
> 
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  3 files changed, 85 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..4406b0f8c839 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -13,26 +13,6 @@
>  #include "sun6i_csi_bridge.h"
>  #include "sun6i_csi_reg.h"
>  
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -				 unsigned int *width, unsigned int *height)
> -{
> -	if (width)
> -		*width = csi_dev->bridge.mbus_format.width;
> -	if (height)
> -		*height = csi_dev->bridge.mbus_format.height;
> -}
> -
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -			     u32 *mbus_code, u32 *field)
> -{
> -	if (mbus_code)
> -		*mbus_code = csi_dev->bridge.mbus_format.code;
> -	if (field)
> -		*field = csi_dev->bridge.mbus_format.field;
> -}
> -
>  /* Format */
>  
>  static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
> @@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
>  }
>  
>  static void
> -sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
> +				     const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct device *dev = csi_dev->dev;
>  	struct regmap *regmap = csi_dev->regmap;
> @@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
>  		&csi_dev->bridge.source_parallel.endpoint;
>  	unsigned char bus_width = endpoint->bus.parallel.bus_width;
>  	unsigned int flags = endpoint->bus.parallel.flags;
> -	u32 field;
> +	u32 field = mbus_format->field;
>  	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
>  
> -	sun6i_csi_bridge_format(csi_dev, NULL, &field);
> -
>  	if (field == V4L2_FIELD_INTERLACED ||
>  	    field == V4L2_FIELD_INTERLACED_TB ||
>  	    field == V4L2_FIELD_INTERLACED_BT)
> @@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
>  }
>  
>  static void
> -sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
> +				      const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap = csi_dev->regmap;
>  	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
> -	u32 field;
> -
> -	sun6i_csi_bridge_format(csi_dev, NULL, &field);
> +	u32 field = mbus_format->field;
>  
>  	if (field == V4L2_FIELD_INTERLACED ||
>  	    field == V4L2_FIELD_INTERLACED_TB ||
> @@ -335,19 +313,19 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
>  	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
>  }
>  
> -static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
> +static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
> +					       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct regmap *regmap = csi_dev->regmap;
>  	bool capture_streaming = csi_dev->capture.state.streaming;
>  	const struct sun6i_csi_bridge_format *bridge_format;
>  	const struct sun6i_csi_capture_format *capture_format;
> -	u32 mbus_code, field, pixelformat;
> +	u32 pixelformat;
> +	u32 field = mbus_format->field;
>  	u8 input_format, input_yuv_seq, output_format;
>  	u32 value = 0;
>  
> -	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
> -
> -	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
> +	bridge_format = sun6i_csi_bridge_format_find(mbus_format->code);
>  	if (WARN_ON(!bridge_format))
>  		return;
>  
> @@ -391,16 +369,17 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
>  }
>  
>  static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
> -				       struct sun6i_csi_bridge_source *source)
> +				       struct sun6i_csi_bridge_source *source,
> +				       const struct v4l2_mbus_framefmt *mbus_format)
>  {
>  	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
>  
>  	if (source == &bridge->source_parallel)
> -		sun6i_csi_bridge_configure_parallel(csi_dev);
> +		sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format);
>  	else
> -		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> +		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format);
>  
> -	sun6i_csi_bridge_configure_format(csi_dev);
> +	sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
>  }
>  
>  /* V4L2 Subdev */
> @@ -415,6 +394,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  	struct sun6i_csi_bridge_source *source;
>  	struct v4l2_subdev *source_subdev;
>  	struct media_pad *remote_pad;
> +	struct v4l2_subdev_state *state;
> +	const struct v4l2_mbus_framefmt *mbus_format;
>  	int ret;
>  
>  	/* Source */
> @@ -433,6 +414,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  	else
>  		source = &bridge->source_mipi_csi2;
>  
> +	/* Active State */
> +
> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
> +
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		ret = 0;
> @@ -443,7 +428,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  
>  	ret = pm_runtime_resume_and_get(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
>  
>  	/* Clear */
>  
> @@ -451,7 +436,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  
>  	/* Configure */
>  
> -	sun6i_csi_bridge_configure(csi_dev, source);
> +	mbus_format = v4l2_subdev_state_get_format(state,
> +						   SUN6I_CSI_BRIDGE_PAD_SINK);
> +	sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
>  
>  	if (capture_streaming)
>  		sun6i_csi_capture_configure(csi_dev);
> @@ -472,7 +459,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  	if (ret && ret != -ENOIOCTLCMD)
>  		goto disable;
>  
> -	return 0;
> +	ret = 0;
> +	goto unlock;
>  
>  disable:
>  	if (capture_streaming)
> @@ -482,6 +470,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
>  
>  	pm_runtime_put(dev);
>  
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
>  
> @@ -504,21 +494,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
>  static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
>  				       struct v4l2_subdev_state *state)
>  {
> -	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> -	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
> -	struct v4l2_mbus_framefmt *mbus_format =
> -		v4l2_subdev_state_get_format(state, pad);
> -	struct mutex *lock = &csi_dev->bridge.lock;
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
> -	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
> -	mbus_format->width = 1280;
> -	mbus_format->height = 720;
> +		mbus_format = v4l2_subdev_state_get_format(state, pad);
>  
> -	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
> +		mbus_format->width = 1280;
> +		mbus_format->height = 720;
>  
> -	mutex_unlock(lock);
> +		sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +	}
>  
>  	return 0;
>  }
> @@ -536,53 +528,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
>  	return 0;
>  }
>  
> -static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
> -				    struct v4l2_subdev_state *state,
> -				    struct v4l2_subdev_format *format)
> -{
> -	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> -	struct mutex *lock = &csi_dev->bridge.lock;
> -
> -	mutex_lock(lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		*mbus_format = *v4l2_subdev_state_get_format(state,
> -							     format->pad);
> -	else
> -		*mbus_format = csi_dev->bridge.mbus_format;
> -
> -	mutex_unlock(lock);
> -
> -	return 0;
> -}
> -
>  static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
>  				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_format *format)
>  {
> -	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
> -	struct v4l2_mbus_framefmt *mbus_format = &format->format;
> -	struct mutex *lock = &csi_dev->bridge.lock;
> +	struct v4l2_mbus_framefmt *fmt;
>  
> -	mutex_lock(lock);
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad != SUN6I_CSI_BRIDGE_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
>  
> -	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
> +	sun6i_csi_bridge_mbus_format_prepare(&format->format);
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		*v4l2_subdev_state_get_format(state, format->pad) =
> -			*mbus_format;
> -	else
> -		csi_dev->bridge.mbus_format = *mbus_format;
> +	/* Set the format on the sink pad. */
> +	fmt = v4l2_subdev_state_get_format(state, format->pad);
> +	*fmt = format->format;
>  
> -	mutex_unlock(lock);
> +	/* Propagate the format to the source pad. */
> +	fmt = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
> +	*fmt = format->format;
>  
>  	return 0;
>  }
>  
>  static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
>  	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
> -	.get_fmt	= sun6i_csi_bridge_get_fmt,
> +	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= sun6i_csi_bridge_set_fmt,
>  };
>  
> @@ -780,8 +751,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  	};
>  	int ret;
>  
> -	mutex_init(&bridge->lock);
> -
>  	/* V4L2 Subdev */
>  
>  	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
> @@ -809,6 +778,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* V4L2 Subdev finalize */
> +
> +	ret = v4l2_subdev_init_finalize(subdev);
> +	if (ret < 0)
> +		goto error_media_entity;
> +
>  	/* V4L2 Subdev */
>  
>  	if (csi_dev->isp_available)
> @@ -818,7 +793,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  
>  	if (ret) {
>  		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
> -		goto error_media_entity;
> +		goto error_subdev_finalize;
>  	}
>  
>  	/* V4L2 Async */
> @@ -852,6 +827,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
>  	else
>  		v4l2_device_unregister_subdev(subdev);
>  
> +error_subdev_finalize:
> +	v4l2_subdev_cleanup(subdev);
> +
>  error_media_entity:
>  	media_entity_cleanup(&subdev->entity);
>  
> @@ -868,5 +846,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
>  
>  	v4l2_device_unregister_subdev(subdev);
>  
> +	v4l2_subdev_cleanup(subdev);
> +
>  	media_entity_cleanup(&subdev->entity);
>  }
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> index 44653b38f722..a5b0a6f064dd 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
>  	struct v4l2_subdev		subdev;
>  	struct v4l2_async_notifier	notifier;
>  	struct media_pad		pads[2];
> -	struct v4l2_mbus_framefmt	mbus_format;
> -	struct mutex			lock; /* Mbus format lock. */
>  
>  	struct sun6i_csi_bridge_source	source_parallel;
>  	struct sun6i_csi_bridge_source	source_mipi_csi2;
>  };
>  
> -/* Helpers */
> -
> -void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
> -				 unsigned int *width, unsigned int *height);
> -void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
> -			     u32 *mbus_code, u32 *field);
> -
>  /* Format */
>  
>  const struct sun6i_csi_bridge_format *
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 65879f4802c0..a21a146fb02a 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
>  		media_entity_to_video_device(link->sink->entity);
>  	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
>  	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
> +	struct v4l2_subdev *src_subdev =
> +		media_entity_to_v4l2_subdev(link->source->entity);
>  	const struct sun6i_csi_capture_format *capture_format;
>  	const struct sun6i_csi_bridge_format *bridge_format;
>  	unsigned int capture_width, capture_height;
> -	unsigned int bridge_width, bridge_height;
>  	const struct v4l2_format_info *format_info;
> +	struct v4l2_subdev_format src_fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> +		.pad = link->source->index
> +	};
>  	u32 pixelformat, capture_field;
> -	u32 mbus_code, bridge_field;
>  	bool match;
> +	int ret;
>  
>  	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
>  
> @@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
>  	if (WARN_ON(!capture_format))
>  		return -EINVAL;
>  
> -	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
> +	/* Resolve csi bridge format. */
> +	ret = v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
> +	if (ret)
> +		return ret;
>  
> -	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
> -	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
> +	bridge_format = sun6i_csi_bridge_format_find(src_fmt.format.code);
>  	if (WARN_ON(!bridge_format))
>  		return -EINVAL;
>  
>  	/* No cropping/scaling is supported. */
> -	if (capture_width != bridge_width || capture_height != bridge_height) {
> +	if (capture_width != src_fmt.format.width ||
> +		capture_height != src_fmt.format.height) {

	if (capture_width != src_fmt.format.width ||
	    capture_height != src_fmt.format.height) {

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		v4l2_err(v4l2_dev,
>  			 "invalid input/output dimensions: %ux%u/%ux%u\n",
> -			 bridge_width, bridge_height, capture_width,
> -			 capture_height);
> +			 src_fmt.format.width, src_fmt.format.height,
> +			 capture_width, capture_height);
>  		return -EINVAL;
>  	}
>  
> @@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
>  	/* With raw input mode, we need a 1:1 match between input and output. */
>  	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
>  	    capture_format->input_format_raw) {
> -		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
> +		match = sun6i_csi_capture_format_match(pixelformat,
> +						       src_fmt.format.code);
>  		if (!match)
>  			goto invalid;
>  	}

-- 
Regards,

Laurent Pinchart

