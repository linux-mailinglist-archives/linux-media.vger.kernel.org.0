Return-Path: <linux-media+bounces-29608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B281A7FE00
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0E061644B1
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E059B26983B;
	Tue,  8 Apr 2025 11:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmTSg0k2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D92690F9
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110076; cv=none; b=DDyJQeh6c9MgmxvJCxHPkprlo3LwsuA+Bd4vQQGyy8KhWwRXtU0TNO3tw8poIO1qS9KKrh0TK1s/1jXRq8+aGuj7h5fv0R84MSDhevlGLXQpNYnRRFsCBvtFgh8WotZWtujQbUqCauRvYmCaoQNFQlc+reS89j0PYnNs0L1QAFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110076; c=relaxed/simple;
	bh=oBRV+hJTjXkQAzZVoiu1kFV6AQRh7iQOXACUSdBFYyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHhYee1XEwRUZajkPhS5K3dt+A+LCwCMRQU8XFk6nhz5grNUCTSpd7f5JkfCaQBxaAzB+//LA3TrS2ADgHyF3F24PTOt0boWvNLqcaalfquv0WxuGzeVTHIJ8oSSu5WsY/JSJKLKOeDK6JE3+NugMH4K8LZGVrVsbEz8msVf4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmTSg0k2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744110074; x=1775646074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBRV+hJTjXkQAzZVoiu1kFV6AQRh7iQOXACUSdBFYyg=;
  b=FmTSg0k2Ussei6MAAxdNjvnhSr7/2vthyA3BohRxENlGGHfjnxT9Kypn
   MIro7oXWeyFUK2ZzXZMqU/bg4SRI1BwwI4d9vULMc1j2miNaPVefcDR+O
   qUIu9huseb/1M+Q8uikhuyufQt716wGBoVfm4m9tKLO109E5oEykwWHf/
   eEC2W7Zg4HzsqqKd2PLOGqJ5x1FlW3Afhs6msB/gLLdr0lirHPJFiF3A9
   +++/ZkiVTk90g3GyZEMMPxHGc6Ti4O1bCLDy9Y9KGH9AD03I262wTULrJ
   8icjMNXKWQtq+R4qsy+rVwMGRp3YcyaE79oUgrmzlyStkoUhM8LJzkCj6
   w==;
X-CSE-ConnectionGUID: xIdWWRFERkKNfHJ8/vvKmw==
X-CSE-MsgGUID: WEnHK6EvQC2FvIs0b2B76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48245180"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="48245180"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:01:13 -0700
X-CSE-ConnectionGUID: ePh2CzjOQOuTxJyi+hZwlA==
X-CSE-MsgGUID: v6pW/nkLRQ6acaJqEbrlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128216394"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:01:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A8C411FB1F;
	Tue,  8 Apr 2025 14:01:09 +0300 (EEST)
Date: Tue, 8 Apr 2025 11:01:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 5/5] media: intel/ipu6: Move isys_subdev functions to
 common code
Message-ID: <Z_UB9QPYpT3RSRQm@kekkonen.localdomain>
References: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
 <20250401090953.473339-7-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401090953.473339-7-stanislaw.gruszka@linux.intel.com>

Hi Stanislaw,

On Tue, Apr 01, 2025 at 11:09:53AM +0200, Stanislaw Gruszka wrote:
> Move more functions (those that utilize isys_subdev structure internally),
> to common code to be shared with ipu7 driver.
> 
> Additionally use isd variable name for isys_subdevice, asd name is used
> for historical reason - precursor of the drier was atomisp driver, the
> variables names stayed unchanged, what is a little confusing.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   8 +-
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 179 +-----------------
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  11 +-
>  drivers/media/pci/intel/ipu6/isys-subdev.c    | 159 ++++++++++++++++
>  drivers/media/pci/intel/ipu6/isys.h           |   9 +
>  5 files changed, 174 insertions(+), 192 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 2441f47e8742..5c4baaffa092 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -487,7 +487,7 @@ static const struct v4l2_subdev_pad_ops csi2_sd_pad_ops = {
>  	.set_fmt = ipu6_isys_subdev_set_fmt,
>  	.get_selection = ipu6_isys_csi2_get_sel,
>  	.set_selection = ipu6_isys_csi2_set_sel,
> -	.enum_mbus_code = ipu6_isys_subdev_enum_mbus_code,
> +	.enum_mbus_code = isys_subdev_enum_mbus_code,

Regarding naming -- could you keep the ipu prefix here and elsewhere?

It'll be probably easiest to use git format-patch and then:

$ perl -i -pe 's/([^_])(isys_subdev)/$1ipu_$2/g' patches_here

>  	.set_routing = isys_subdev_set_routing,
>  	.enable_streams = ipu6_isys_csi2_enable_streams,
>  	.disable_streams = ipu6_isys_csi2_disable_streams,
> @@ -510,7 +510,7 @@ void ipu6_isys_csi2_cleanup(struct ipu6_isys_csi2 *csi2)
>  
>  	v4l2_device_unregister_subdev(&csi2->asd.sd);
>  	v4l2_subdev_cleanup(&csi2->asd.sd);
> -	ipu6_isys_subdev_cleanup(&csi2->asd);
> +	isys_subdev_cleanup(&csi2->asd);
>  	csi2->isys = NULL;
>  }
>  
> @@ -526,8 +526,8 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
>  	csi2->port = index;
>  
>  	csi2->asd.sd.entity.ops = &csi2_entity_ops;
> -	ret = ipu6_isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
> -				    NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
> +	ret = isys_subdev_init(&csi2->asd, dev, &csi2_sd_ops, 0,
> +			       NR_OF_CSI2_SINK_PADS, NR_OF_CSI2_SRC_PADS);
>  	if (ret)
>  		goto fail;
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> index 020c25925ca0..655057d54785 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
> @@ -141,14 +141,6 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_format *format)
>  {
> -	struct isys_subdev *asd = to_isys_subdev(sd);
> -	struct v4l2_mbus_framefmt *fmt;
> -	struct v4l2_rect *crop;
> -	u32 code = asd->supported_codes[0];
> -	u32 other_pad, other_stream;
> -	unsigned int i;
> -	int ret;
> -
>  	/* No transcoding, source and sink formats must match. */
>  	if ((sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SOURCE) &&
>  	    sd->entity.num_pads > 1)
> @@ -160,174 +152,5 @@ int ipu6_isys_subdev_set_fmt(struct v4l2_subdev *sd,
>  				      IPU6_ISYS_MIN_HEIGHT,
>  				      IPU6_ISYS_MAX_HEIGHT);
>  
> -	for (i = 0; asd->supported_codes[i]; i++) {
> -		if (asd->supported_codes[i] == format->format.code) {
> -			code = asd->supported_codes[i];
> -			break;
> -		}
> -	}
> -	format->format.code = code;
> -	format->format.field = V4L2_FIELD_NONE;
> -
> -	/* Store the format and propagate it to the source pad. */
> -	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> -	if (!fmt)
> -		return -EINVAL;
> -
> -	*fmt = format->format;
> -
> -	if (!(sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_SINK))
> -		return 0;
> -
> -	/* propagate format to following source pad */
> -	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> -							   format->stream);
> -	if (!fmt)
> -		return -EINVAL;
> -
> -	*fmt = format->format;
> -
> -	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
> -						    format->pad,
> -						    format->stream,
> -						    &other_pad,
> -						    &other_stream);
> -	if (ret)
> -		return -EINVAL;
> -
> -	crop = v4l2_subdev_state_get_crop(state, other_pad, other_stream);
> -	/* reset crop */
> -	crop->left = 0;
> -	crop->top = 0;
> -	crop->width = fmt->width;
> -	crop->height = fmt->height;
> -
> -	return 0;
> -}
> -
> -int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_state *state,
> -				    struct v4l2_subdev_mbus_code_enum *code)
> -{
> -	struct isys_subdev *asd = to_isys_subdev(sd);
> -	const u32 *supported_codes = asd->supported_codes;
> -	u32 index;
> -
> -	for (index = 0; supported_codes[index]; index++) {
> -		if (index == code->index) {
> -			code->code = supported_codes[index];
> -			return 0;
> -		}
> -	}
> -
> -	return -EINVAL;
> -}
> -
> -static int subdev_set_routing(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_state *state,
> -			      struct v4l2_subdev_krouting *routing)
> -{
> -	static const struct v4l2_mbus_framefmt format = {
> -		.width = 4096,
> -		.height = 3072,
> -		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> -		.field = V4L2_FIELD_NONE,
> -	};
> -	int ret;
> -
> -	ret = v4l2_subdev_routing_validate(sd, routing,
> -					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> -	if (ret)
> -		return ret;
> -
> -	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> -}
> -
> -static int ipu6_isys_subdev_init_state(struct v4l2_subdev *sd,
> -				       struct v4l2_subdev_state *state)
> -{
> -	struct v4l2_subdev_route route = {
> -		.sink_pad = 0,
> -		.sink_stream = 0,
> -		.source_pad = 1,
> -		.source_stream = 0,
> -		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> -	};
> -	struct v4l2_subdev_krouting routing = {
> -		.num_routes = 1,
> -		.routes = &route,
> -	};
> -
> -	return subdev_set_routing(sd, state, &routing);
> -}
> -
> -static const struct v4l2_subdev_internal_ops ipu6_isys_subdev_internal_ops = {
> -	.init_state = ipu6_isys_subdev_init_state,
> -};
> -
> -int ipu6_isys_subdev_init(struct isys_subdev *asd, struct device *dev,
> -			  const struct v4l2_subdev_ops *ops,
> -			  unsigned int nr_ctrls, unsigned int num_sink_pads,
> -			  unsigned int num_source_pads)
> -{
> -	unsigned int num_pads = num_sink_pads + num_source_pads;
> -	unsigned int i;
> -	int ret;
> -
> -	v4l2_subdev_init(&asd->sd, ops);
> -
> -	asd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> -			 V4L2_SUBDEV_FL_HAS_EVENTS |
> -			 V4L2_SUBDEV_FL_STREAMS;
> -	asd->sd.owner = THIS_MODULE;
> -	asd->sd.dev = dev;
> -	asd->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> -	asd->sd.internal_ops = &ipu6_isys_subdev_internal_ops;
> -
> -	asd->pad = devm_kcalloc(dev, num_pads, sizeof(*asd->pad), GFP_KERNEL);
> -	if (!asd->pad)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num_sink_pads; i++)
> -		asd->pad[i].flags = MEDIA_PAD_FL_SINK |
> -				    MEDIA_PAD_FL_MUST_CONNECT;
> -
> -	for (i = num_sink_pads; i < num_pads; i++)
> -		asd->pad[i].flags = MEDIA_PAD_FL_SOURCE;
> -
> -	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
> -	if (ret)
> -		return ret;
> -
> -	if (asd->ctrl_init) {
> -		ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, nr_ctrls);
> -		if (ret)
> -			goto out_media_entity_cleanup;
> -
> -		asd->ctrl_init(&asd->sd);
> -		if (asd->ctrl_handler.error) {
> -			ret = asd->ctrl_handler.error;
> -			goto out_v4l2_ctrl_handler_free;
> -		}
> -
> -		asd->sd.ctrl_handler = &asd->ctrl_handler;
> -	}
> -
> -	asd->source = -1;
> -
> -	return 0;
> -
> -out_v4l2_ctrl_handler_free:
> -	v4l2_ctrl_handler_free(&asd->ctrl_handler);
> -
> -out_media_entity_cleanup:
> -	media_entity_cleanup(&asd->sd.entity);
> -
> -	return ret;
> -}
> -
> -void ipu6_isys_subdev_cleanup(struct isys_subdev *asd)
> -{
> -	media_entity_cleanup(&asd->sd.entity);
> -	v4l2_ctrl_handler_free(&asd->ctrl_handler);
> +	return isys_subdev_set_fmt(sd, state, format);
>  }
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> index f3835d873991..e8d1ff181a9d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (C) 2013--2024 Intel Corporation */
> +/* Copyright (C) 2013-2025 Intel Corporation */

It was an en dash! :-o

-- 
Kind regards,

Sakari Ailus

