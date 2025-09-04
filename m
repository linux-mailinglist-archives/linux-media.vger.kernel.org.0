Return-Path: <linux-media+bounces-41761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DDB4362A
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B781B21A01
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687712C2343;
	Thu,  4 Sep 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6bvvW3R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221C2C11F6;
	Thu,  4 Sep 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975500; cv=none; b=hSxsklOXAEW2PmBGZ7RYcCBjMnk8R0FLEwOl4vky+iwdi9WfeUIUG2XGQlmmSQCgwoiHwjshqrBHBU5ESsZAc+VwDoVOEbB2jIpbwHWN+Dqg7gJXwkrIvHeLpZSZH1yj72QRWF/iuWuQEzJsnzpAydB9gG+OWC7QNK8ywl4pBLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975500; c=relaxed/simple;
	bh=gzetGRXPPEFaGfqJAQ6Chzwhs2gIrlbRduBmetQTYrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tI8jmt4xM9HxdsoLxPtjVjKSR0dzxveejQIGbGkkHQG2a5zE20/T67wSJExzZnpQminw6H8f8GD/1WkkSBVpixrCpmvU1U9EglugASZigCy38IIfeSeoSZgr3B6TznIdVfECfhsCac3QZk9S2MbnU2RGkHbFzEjhp8OEa1lmSMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6bvvW3R; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756975499; x=1788511499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gzetGRXPPEFaGfqJAQ6Chzwhs2gIrlbRduBmetQTYrY=;
  b=m6bvvW3Rom+DeuhxAKuIGPrKc89UY7KAXA3I7vWy1nyug+yc5r4v78ZD
   DPxZAYGVJr3bT2h1WN1DNGCySAFMrf8mHg+8Pg1jBvDoQlJ1213IXOq6M
   00j3uUWMMxh5xA/QkNLmi+Laj2WquRC4GIidlCmG9UVtakPm4olsKhGxT
   777dCUeIGpx8nkMMPLyChN3KuDLj1MgTAUUqtYw6nI6QOWe5xhNKbyJCg
   EQIVQ7we70bB1bF1Nu6rMaE+nIKZgwzu8ePzNYMucGedCZrQMCwlCrAPV
   bbbyBVmk+qIYkqcXf8cfhFrxX1T3i+ZTRKBYFFAP4qMF5RRb1U5gqLBT+
   A==;
X-CSE-ConnectionGUID: HW5VAqwcTQSYK3jPIFVeHA==
X-CSE-MsgGUID: WY7bHa3aSPKAMJd1f7FSOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58520275"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="58520275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 01:44:58 -0700
X-CSE-ConnectionGUID: N3TxRB0xQP6c9RbJ1GcVrg==
X-CSE-MsgGUID: aYx3EAAlQhmx5apJZHzVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="177096940"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.92])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 01:44:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EBE7611FCC7;
	Thu, 04 Sep 2025 11:44:49 +0300 (EEST)
Date: Thu, 4 Sep 2025 11:44:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se,
	dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com,
	mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active
 lanes via a pad
Message-ID: <aLlRgRBztMEicEgM@kekkonen.localdomain>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com>
 <20250903102243.1563527-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102243.1563527-2-isaac.scott@ideasonboard.com>

Hi Isaac,

Thanks for the update.

On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> connecting to the MIPI CSI receiver of their device. Add a helper
> function that checks the mbus_config for the device driver to allow
> users to define the number of active data lanes through the
> get_mbus_config op.
> 
> If the driver does not implement this op, fall back to using the number
> of data lanes specified in device tree.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-common.h           |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 6e585bc76367..8683107b3704 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> +
> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes)

This line would benefit from being wrapped.

> +{
> +	struct v4l2_mbus_config mbus_config = {};
> +	struct v4l2_subdev *sd;
> +	unsigned int lanes;
> +	int ret;
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> +			       &mbus_config);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		return ret;
> +
> +	if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> +		return dt_lanes;
> +
> +	lanes = mbus_config.bus.mipi_csi2.num_data_lanes;
> +
> +	if (lanes < 0 || lanes > dt_lanes)

lanes is unsigned int so no need to check for less than 0.

I might just not use a local variable for this, up to you.

> +		return -EINVAL;
> +
> +	return lanes;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /*
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 0a43f56578bc..3f8937260c76 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
>  	(pad, mul, div)
>  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
>  			     unsigned int div);

Some kernel-doc documentation would be nice.

> +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, unsigned int dt_lanes);

Please wrap this, too.

>  #else
>  #define v4l2_get_link_freq(handler, mul, div)		\
>  	__v4l2_get_link_freq_ctrl(handler, mul, div)

-- 
Kind regards,

Sakari Ailus

