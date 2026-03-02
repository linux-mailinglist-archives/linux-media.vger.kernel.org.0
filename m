Return-Path: <linux-media+bounces-54089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICaVC3qIpWmWDQYAu9opvQ
	(envelope-from <linux-media+bounces-54089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:54:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84011D93A1
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B20F33028B59
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 12:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868493ACF07;
	Mon,  2 Mar 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqkzAM/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD05363C5A;
	Mon,  2 Mar 2026 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455723; cv=none; b=mXjy0MoRff7aiTrNTIZJ/9lGUqf6crG0MiSG4NGdid2w92cAu1gtY6iSXnp8dx48H8EzCGIOGLm1nOR+ZSR7Gfv3hiluWrdt9zkJdGAoRRcGwDQ3Ltvk7UXqts1Oo/Q1ytjATGNNfwRr3vCHTMO8UfkC+bWqZwBk3ODZXqfPujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455723; c=relaxed/simple;
	bh=4IxaHMCM9ehMRMHTFNt/Jkl9Rq3n+dBsnCgr2kc1gek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndH2tjOXZeueIUFraYjXpKKJbfOm/KAOd+qpoIsmDaZilAJlOtzJ4JbjYKpn7/YPKEzRXRbCWFYqVqDrRoD8xtqT4L8cldmsUgft/zcFsEhHTYl+MKxoANrELfjq3FNyv2aPTaVJerpbfZL7eheFjzzqlymCZcvqu/kaxwRsqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqkzAM/m; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772455721; x=1803991721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4IxaHMCM9ehMRMHTFNt/Jkl9Rq3n+dBsnCgr2kc1gek=;
  b=RqkzAM/m8bzxswGEec5p9nHUzY3WySNgjjRB37nE1pveIyE/9Ucqmg6m
   IY89RM+twez70MtXVOK99Mei+u+989WHsl26HVxMw3YDWkn+1difLQp5G
   L282slYitVyBk2vJ3D6qq388Nk05gZJfSRZw8/fp7vTfCYmQbqwGFx2yT
   1DkGOqJ6clY45W/JV/KzwiltQtavsndO25hS48x3NYLhQtkYI1O5j4LwG
   AzxzOcKyjoLUoIl1ISGNfe7Vd5AN+cCkiabYhNSDcWiUReILEy7JGbBN9
   0K2aw6IEGKoZgoFz1O+MnPxiNAa+Etk/GueAgl3gRBDDkPA/ChMz3BT9N
   g==;
X-CSE-ConnectionGUID: DI/BP33sRjCApo9EFRsrWA==
X-CSE-MsgGUID: VST8PEFGQ8qes6EpGbeZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72662070"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="72662070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:48:40 -0800
X-CSE-ConnectionGUID: Lzn3CLPyTAuFmvGZoBRsrg==
X-CSE-MsgGUID: 7Lk/JzZqTAKmuvjDnRxSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="216771421"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:48:37 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A75101212D6;
	Mon, 02 Mar 2026 14:49:03 +0200 (EET)
Date: Mon, 2 Mar 2026 14:49:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	hverkuil+cisco@kernel.org, johannes.goede@oss.qualcomm.com,
	hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: ov9282: Switch to using the
 sub-device state lock
Message-ID: <aaWHP2x4QydooVM3@kekkonen.localdomain>
References: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
 <20260301104809.3505257-3-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301104809.3505257-3-xiaolei.wang@windriver.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-54089-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,siliconsignals.io:email]
X-Rspamd-Queue-Id: C84011D93A1
X-Rspamd-Action: no action

Hi Xiaolei,

Thanks for the update. A few comments below...

On Sun, Mar 01, 2026 at 06:48:08PM +0800, Xiaolei Wang wrote:
> Switch to using the sub-device state lock and properly call
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
> remove().
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/ov9282.c | 50 +++++++++++++++-----------------------
>  1 file changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 8bfaa3ae4be5..8acbd43838d5 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -221,7 +221,6 @@ struct ov9282 {
>  	bool noncontinuous_clock;
>  	const struct ov9282_mode *cur_mode;
>  	u32 code;
> -	struct mutex mutex;
>  };
>  
>  static const s64 link_freq[] = {
> @@ -795,8 +794,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct ov9282 *ov9282 = to_ov9282(sd);
>  
> -	mutex_lock(&ov9282->mutex);
> -
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		struct v4l2_mbus_framefmt *framefmt;
>  
> @@ -807,8 +804,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  				       fmt);
>  	}
>  
> -	mutex_unlock(&ov9282->mutex);
> -
>  	return 0;
>  }
>  
> @@ -829,8 +824,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  	u32 code;
>  	int ret = 0;
>  
> -	mutex_lock(&ov9282->mutex);
> -
>  	mode = v4l2_find_nearest_size(supported_modes,
>  				      ARRAY_SIZE(supported_modes),
>  				      width, height,
> @@ -856,8 +849,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  		}
>  	}
>  
> -	mutex_unlock(&ov9282->mutex);
> -
>  	return ret;
>  }
>  
> @@ -904,10 +895,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>  	case V4L2_SEL_TGT_CROP: {
>  		struct ov9282 *ov9282 = to_ov9282(sd);
>  
> -		mutex_lock(&ov9282->mutex);
>  		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
>  						sel->which);
> -		mutex_unlock(&ov9282->mutex);
>  
>  		return 0;
>  	}
> @@ -1019,9 +1008,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
>  static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct ov9282 *ov9282 = to_ov9282(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret;
>  
> -	mutex_lock(&ov9282->mutex);
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>  
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(ov9282->dev);
> @@ -1036,14 +1026,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  		pm_runtime_put(ov9282->dev);
>  	}
>  
> -	mutex_unlock(&ov9282->mutex);
> +	v4l2_subdev_unlock_state(state);
>  
>  	return 0;
>  
>  error_power_off:
>  	pm_runtime_put(ov9282->dev);
>  error_unlock:
> -	mutex_unlock(&ov9282->mutex);
> +	v4l2_subdev_unlock_state(state);
>  
>  	return ret;
>  }
> @@ -1285,9 +1275,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	if (ret)
>  		return ret;
>  
> -	/* Serialize controls with sensor device */
> -	ctrl_hdlr->lock = &ov9282->mutex;
> -
>  	/* Initialize exposure and gain */
>  	lpfr = mode->vblank + mode->height;
>  	ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> @@ -1409,13 +1396,10 @@ static int ov9282_probe(struct i2c_client *client)
>  		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>  				     "Failed to init CCI\n");
>  
> -	mutex_init(&ov9282->mutex);
> -
>  	ret = ov9282_power_on(ov9282->dev);
> -	if (ret) {
> -		dev_err(ov9282->dev, "failed to power-on the sensor");
> -		goto error_mutex_destroy;
> -	}
> +	if (ret)
> +		return dev_err_probe(ov9282->dev, ret,
> +				     "failed to power-on the sensor");
>  
>  	/* Check module identity */
>  	ret = ov9282_detect(ov9282);
> @@ -1448,10 +1432,10 @@ static int ov9282_probe(struct i2c_client *client)
>  		goto error_handler_free;
>  	}
>  
> -	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
> +	ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov9282->sd);
>  	if (ret < 0) {
> -		dev_err(ov9282->dev,
> -			"failed to register async subdev: %d", ret);
> +		ret = dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");

Assigning ret here won't do anything, will it?

>  		goto error_media_entity;
>  	}
>  
> @@ -1459,16 +1443,22 @@ static int ov9282_probe(struct i2c_client *client)
>  	pm_runtime_enable(ov9282->dev);
>  	pm_runtime_idle(ov9282->dev);

The sensor may be powered down here...

>  
> +	ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
> +	if (ret < 0)
> +		goto v4l2_subdev_cleanup;
> +
>  	return 0;
>  
> +v4l2_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov9282->sd);
> +	pm_runtime_disable(ov9282->dev);
> +	pm_runtime_set_suspended(ov9282->dev);
>  error_media_entity:
>  	media_entity_cleanup(&ov9282->sd.entity);
>  error_handler_free:
>  	v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
>  error_power_off:
>  	ov9282_power_off(ov9282->dev);

and again here.

I'd suggest to call pm_runtime_idle() after registering the async
sub-device to avoid doing this twice.

> -error_mutex_destroy:
> -	mutex_destroy(&ov9282->mutex);
>  
>  	return ret;
>  }
> @@ -1482,9 +1472,9 @@ static int ov9282_probe(struct i2c_client *client)
>  static void ov9282_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct ov9282 *ov9282 = to_ov9282(sd);
>  
>  	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);
>  
> @@ -1492,8 +1482,6 @@ static void ov9282_remove(struct i2c_client *client)
>  	if (!pm_runtime_status_suspended(&client->dev))
>  		ov9282_power_off(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> -
> -	mutex_destroy(&ov9282->mutex);
>  }
>  
>  static const struct dev_pm_ops ov9282_pm_ops = {

-- 
Kind regards,

Sakari Ailus

