Return-Path: <linux-media+bounces-28816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2286CA72AB0
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C83177596
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE331FF7B8;
	Thu, 27 Mar 2025 07:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki525I+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4644A1A;
	Thu, 27 Mar 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061318; cv=none; b=G99UzfE4pPYtvyf6EC3OSQdzN3PaDxuJB7YVVckC2FMu75B/Ihpu4Kqm3lsq8uFPfi2O/8ACzWcJrbt3+3n4q5MANdU3dSb930B6Pb2DfDTgB8QYX3s1QlqJcdDwGTaiO1ApCG4SDFqdd1Sg0e7Q7ufenGeCYGXB94wtOPYE3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061318; c=relaxed/simple;
	bh=rS/W8PtUK3wydqAsyCw7gtilzvxiYmel+/Mo/7jtdGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPi/0ektEfgoC+TkzNMqAolA75l4bXwmMJYTn/XfY6XDIa4YftQMF3JPfPDIvq+OogoU8u0by9C3qsav9hIclK93bZL9EhdcKSQJbP2fkiaNSxiOFh4eDSg/AqRFmjbD1lhhh+CACnvQ7dul0A3XjGqzNcpS+RQ/zIyG5TBjWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ki525I+a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743061317; x=1774597317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rS/W8PtUK3wydqAsyCw7gtilzvxiYmel+/Mo/7jtdGs=;
  b=ki525I+agqA9jExrvxPO5NgTPBRil90hYGbe3rrnZvtnOLnz4DeQhSTO
   MV0R9u6+PrQUV55l3gl3+RvrvLngkS95bVgr/QBeryn0Xjnulgg5RWCKV
   +52YEbXHHeZl16DM+dtcdF81nxvOFot2cX5uWQGrjNPRtO0cSVPj8+Tbs
   Y2ikrKpgaWUZRfpoinznFR/9AgMi68SwrTj2Q18v765EohP0h9Y7QdRuD
   UilU6t5mNSOirAQGAA0yKGd3Xvrg7VGbc6n1eAcXJx0/F1Y9t1WZn4Om+
   GPXZ0Kki3viLISeGVhnl5563IagLqM5nIIKbSz8bhqQtv8D9HiVoEWDVv
   Q==;
X-CSE-ConnectionGUID: Q87xCuXDQsqGA4W15ed8nA==
X-CSE-MsgGUID: YxW12tsSQ7aBNfxW4IqXNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55036398"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55036398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:41:56 -0700
X-CSE-ConnectionGUID: cw3L1cCTQw+ao+TCAeXSUA==
X-CSE-MsgGUID: kadRPl+sQu64fYePLRue4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="130122613"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:41:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 52B9711F99F;
	Thu, 27 Mar 2025 09:41:49 +0200 (EET)
Date: Thu, 27 Mar 2025 07:41:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
Message-ID: <Z-UBPcSvq_oUDLAp@kekkonen.localdomain>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>

A few more comments.

On Tue, Mar 25, 2025 at 02:49:29PM +0000, Bryan O'Donoghue wrote:
> +static int ov02e10_set_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	const struct ov02e10_mode *mode;
> +	s32 vblank_def, h_blank;
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height, fmt->format.width,
> +				      fmt->format.height);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	ov02e10_update_pad_format(mode, &fmt->format);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
> +		    fmt->format;
> +	} else {
> +		ov02e10->cur_mode = mode;
> +		__v4l2_ctrl_s_ctrl(ov02e10->link_freq, mode->link_freq_index);
> +		__v4l2_ctrl_s_ctrl_int64(ov02e10->pixel_rate,
> +					 to_pixel_rate(mode->link_freq_index));
> +
> +		/* Update limits and set FPS to default */
> +		vblank_def = mode->vts_def - mode->height;
> +		__v4l2_ctrl_modify_range(ov02e10->vblank,
> +					 mode->vts_min - mode->height,
> +					 OV02E10_VTS_MAX - mode->height, 1,
> +					 vblank_def);

Note that this can fail.

> +		__v4l2_ctrl_s_ctrl(ov02e10->vblank, vblank_def);

As well as this one.

> +		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
> +		    mode->width;
> +		__v4l2_ctrl_modify_range(ov02e10->hblank, h_blank, h_blank, 1,
> +					 h_blank);
> +	}
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}

Please rely on sub-device state and the state lock instead, see e.g. imx219
driver for an example.

> +
> +static int ov02e10_get_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +	else
> +		ov02e10_update_pad_format(ov02e10->cur_mode, &fmt->format);
> +
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}

And you won't need this with sub-device state.

> +
> +static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +	return 0;
> +}
> +
> +static int ov02e10_enum_frame_size(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +		return -EINVAL;
> +
> +	fse->min_width = supported_modes[fse->index].width;
> +	fse->max_width = fse->min_width;
> +	fse->min_height = supported_modes[fse->index].height;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +
> +static int ov02e10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	ov02e10_update_pad_format(&supported_modes[0],
> +				  v4l2_subdev_state_get_format(fh->state, 0));

Please rely on init_cfg pad op instead.

> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov02e10_video_ops = {
> +	.s_stream = ov02e10_set_stream,

Please use {enable,disable}_streams instead. See e.g. imx283 driver for an
example.

> +};

-- 
Sakari Ailus

