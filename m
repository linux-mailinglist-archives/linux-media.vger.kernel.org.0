Return-Path: <linux-media+bounces-54093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPYrEtaOpWmoDgYAu9opvQ
	(envelope-from <linux-media+bounces-54093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:21:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A07081D9ABC
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD2F03040462
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 13:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F03876C5;
	Mon,  2 Mar 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxNUpnIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDF377026;
	Mon,  2 Mar 2026 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457675; cv=none; b=TQf3JYVdsKHA9KLWopoTF9JarBayeulSLjEapp7o7eMlqbUqTpxsSUv7gZ0X9MDp6d+xr2vFvFZ2MlBphFW6d1xANa/AO3QGUtZtc93kdQ8HoOAtYuJ57wKBHTE/9zqbG5wj9Ii6PgXlK73i7zAsX11FmSN19CmAAxp+t6obojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457675; c=relaxed/simple;
	bh=Pf94sfCIJI9BUBbVIb9M5Np6YIpqH0nC+NCN1J44u/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1UThPCBiUW5jmnCbsQ6KRTNPDN9Dt6quGkO9o43BstBH/v3XAxbVWSI/heGkUJjPITRMA8CjxM3csgwTkLXBWemk3BCIEYIgLeJGNH5BLMLccKp/RuxCUC5l0+alExqFFyaTs/ONPVdaLf5p4uh/Cne3PxYChf8U6ggB9QQWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxNUpnIj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772457675; x=1803993675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pf94sfCIJI9BUBbVIb9M5Np6YIpqH0nC+NCN1J44u/A=;
  b=cxNUpnIjxYT2E6XlEWNc59BXSVxnrhltC6UXF60EVnPqCKrtWkvOFaS4
   ZVe++AFhoI0FEBMunmqFu+oOy1SsBt8MUCgi3N5ZqWeCLSpH7S8VHzNy+
   qoJpuNLAzQ+cHlrrdSvIz5PdrNJfLtEVQQ2gJHoPX9nbtp3VQdO35K8Gf
   Kmsps4Jl4FoOykZPzpE78ieq4xYVj6HW9D2U7zdZZhDi7Wv1Ji3qZeAid
   q/m7bgwdoE2Xj5WbEHVasaPInPXW8F98oHELTTNjemTSkkrQudNNSaYuk
   Ogqz3QJgPxrTPXuX5UlfitERzIUNm5T8bn/24nrMYCoCAJOX1PgczZ5ou
   g==;
X-CSE-ConnectionGUID: XwQNv4aUTR+X6kcNx6h5+A==
X-CSE-MsgGUID: 5/IK7V2/STOhNJ5WPg3qfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73649458"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="73649458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 05:21:15 -0800
X-CSE-ConnectionGUID: 6UVxLDjJSHqLDQrsr0eO/w==
X-CSE-MsgGUID: 3tbVJbR3QuWoe1udCHpF8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="221805022"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.89])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 05:21:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2CE241212D6;
	Mon, 02 Mar 2026 15:21:39 +0200 (EET)
Date: Mon, 2 Mar 2026 15:21:39 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/3] media: v4l: async: add helper API
 media_async_register_subdev()
Message-ID: <aaWO49Dga6gHgOXS@kekkonen.localdomain>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
 <20260226-v4l2_init_register-v2-1-902d7140f9fa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-v4l2_init_register-v2-1-902d7140f9fa@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54093-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid,nxp.com:email]
X-Rspamd-Queue-Id: A07081D9ABC
X-Rspamd-Action: no action

Hi Frank,

Thanks for the set.

On Thu, Feb 26, 2026 at 05:55:26PM -0500, Frank Li wrote:
> Add the helper API media_async_register_subdev(), which
> combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> v4l2_async_register_subdev() into a single call.
> 
> Reduce code duplication and simplify error handling in drivers.

I appreciate your efforts to try to simplify registering a sensor
sub-device, but I'm not sure this gets far enough to make a notable
difference: the new function calls two functions typically needed and
requires the driver to implement a new one for registering a sub-device.

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 33 +++++++++++++++++++++++++++++++++
>  include/media/v4l2-async.h           | 22 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 1c08bba9ecb91f46b7479da613d6c1688d4b0b5c..e07173f566fbd8fa332b5e58be288e806b4c0482 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> +#include <media/media-entity.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -881,6 +882,38 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
>  }
>  EXPORT_SYMBOL(__v4l2_async_register_subdev);
>  
> +int __media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> +	struct media_pad *pads,
> +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> +	struct module *module)
> +{
> +	int ret;
> +
> +	if (!register_subdev)
> +		return -EINVAL;
> +
> +	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_entity_cleanup;
> +
> +	ret = register_subdev(sd, module);
> +	if (ret)
> +		goto err_subdev_cleanup;
> +
> +	return 0;
> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +	return ret;
> +}
> +EXPORT_SYMBOL(__media_pad_init_and_register_subdev);
> +
>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  {
>  	struct v4l2_async_connection *asc, *asc_tmp;
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index f26c323e9c963065fd7c19d6d9835df1194bc069..220a302a626732e15452f3efb19b03bdc51e64d5 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -336,6 +336,28 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
>  int __must_check
>  v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
>  
> +struct media_pad;
> +
> +int __must_check
> +__media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
> +	struct media_pad *pads,
> +	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
> +	struct module *module);
> +
> +/**
> + * media_async_register_subdev - Initialize the entity pads and
> + *				 registers a sub-device to the
> + *				 asynchronous subdevice framework
> + * @sd: pointer to &struct v4l2_subdev
> + * @num_pads: total number of sink and source pads
> + * @pads: Array of @num_pads pads.
> + *
> + * Returns an error on failure, 0 on success.
> + */
> +#define media_async_register_subdev(sd, num_pads, pads)			\
> +	__media_pad_init_and_register_subdev(sd, num_pads, pads,	\
> +					     __v4l2_async_register_subdev, \
> +					     THIS_MODULE)
>  /**
>   * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
>   *	subdevice framework
> 

-- 
Kind regards,

Sakari Ailus

