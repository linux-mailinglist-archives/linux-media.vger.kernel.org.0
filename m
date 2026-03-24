Return-Path: <linux-media+bounces-56833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFV2N+5awmnQbwQAu9opvQ
	(envelope-from <linux-media+bounces-56833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:35:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7975305AB1
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35F4330116A6
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ED83D88FE;
	Tue, 24 Mar 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F50EPJGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7032D5950;
	Tue, 24 Mar 2026 09:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344794; cv=none; b=iIaRGfVqwrCL/+LH2KfD6xXakXnpFHcWmvsmswHnSAYEpIUfjfsstBWl6uDuaAiiHZWZtYmwKw4tZBGGVLNIxCjnaoP5rpFXJ4sKwtbNzGbT5mRPASW4iQVa9DBy5zcmvb9yMV1F1IyjgPhf8gFhFTAJ9yvugo+ADfzIqHl2dUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344794; c=relaxed/simple;
	bh=uE1lBI5ZjPicogZdxGf7EFOQvDwoUwXTh7JBHZU7qPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0fpKn4PlI5kzhgx6xDwZc9libtikp0JesI9rj2iUpPUB7dHFNWEXI/Py9eNxjlco2Byqfn+9qHPLguihhNxeoeMwJpzzQBZnbiqIk9iS2REnwFcbDI2LliWVZg5cN9wjhTzp5DNVNUnE77SR5/DEqNp7V3iNeWc3OCUSZ2rLuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F50EPJGp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774344793; x=1805880793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uE1lBI5ZjPicogZdxGf7EFOQvDwoUwXTh7JBHZU7qPw=;
  b=F50EPJGp53OyrMDKlab0ti9avw/86PGBwhbijsgKcgR0XCoTLXSBU5yT
   67+ZCEruMKZMTDOIKgdsfAmlyuGiVJlZXDZXrOFecAy5ZZF/SKVsfj3Zi
   TYWMCQMHnqVXXjrjvoD/7c1eAyBzxnE5sQ6zwvD43RyZEs17lcfUDyr8G
   atDe22Ejj8yWo4iiAe+7SZ18TGmzb02KE+kMV3f9FfmtrRpxnN/dSbehF
   1U9AL0w13B36mUejEs/rePvx6G0OOMzWyqOxlaNKG1h1jxth5K3h8I226
   aK519rSt3QyUQ6+G4ctaFW07xQxr0Qi7PUHKOhNAymK69oQYPIuYIVe52
   Q==;
X-CSE-ConnectionGUID: yEIUGvCpQhO/BfKjGAF9lg==
X-CSE-MsgGUID: VaSbeLsZTzmWxIVOyxQq8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86826292"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86826292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:33:13 -0700
X-CSE-ConnectionGUID: BVEuGjsBRk6HlVLz4kxldw==
X-CSE-MsgGUID: CL6/ruIcRHKKfflsTpXxBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229047194"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:33:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14B4C121CFF;
	Tue, 24 Mar 2026 11:33:13 +0200 (EET)
Date: Tue, 24 Mar 2026 11:33:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
Message-ID: <acJaWVxXoskFUc8m@kekkonen.localdomain>
References: <20260323071647.38086-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323071647.38086-1-hpa@redhat.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56833-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: E7975305AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,

Thanks for the update.

On Mon, Mar 23, 2026 at 03:16:47PM +0800, Kate Hsuan wrote:

...

> +static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_format *format)
> +{
> +	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> +	struct v4l2_mbus_framefmt *try_fmt;
> +	struct v4l2_mbus_framefmt *fmt = &format->format;
> +	struct v4l2_rect *crop =
> +		v4l2_subdev_state_get_crop(sd_state, format->pad);
> +	unsigned int width, height;
> +	int min, max, def, ret = 0;
> +
> +	/* Limit set_fmt max size to crop width / height */
> +	width = clamp_val(ALIGN(format->format.width, 2),
> +			  T4KA3_MIN_CROP_WIDTH, crop->width);
> +	height = clamp_val(ALIGN(format->format.height, 2),
> +			   T4KA3_MIN_CROP_HEIGHT, crop->height);
> +	t4ka3_fill_format(sensor, &format->format, width, height);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {

You can move this check after the format assignment below and just return
0.

> +		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
> +		*try_fmt = format->format;
> +		return 0;
> +	}
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && sensor->streaming)
> +		return -EBUSY;
> +
> +	*v4l2_subdev_state_get_format(sd_state, 0) = format->format;
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	t4ka3_calc_mode(sensor, fmt, crop);
> +
> +	/* vblank range is height dependent adjust and reset to default */
> +	t4ka3_get_vblank_limits(sensor, sd_state, &min, &max, &def);
> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, 1, def);
> +	if (ret)
> +		return ret;
> +
> +	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
> +	if (ret)
> +		return ret;
> +
> +	def = T4KA3_PIXELS_PER_LINE - fmt->width;
> +	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
> +	if (ret)
> +		return ret;
> +
> +	return  __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
> +}

...

> +static int t4ka3_set_mode(struct t4ka3_data *sensor,
> +			  struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_state_get_format(state, 0);
> +	int ret = 0;
> +
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width, &ret);
> +	/* Write mode-height - 2 otherwise things don't work, hw-bug ? */
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE,
> +		  fmt->height - 2, &ret);
> +	/*
> +	 * Note overwritten by __v4l2_ctrl_handler_setup() based on
> +	 * vblank ctrl
> +	 */
> +	cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
> +		  T4KA3_LINES_PER_FRAME_30FPS, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE,
> +		  T4KA3_PIXELS_PER_LINE, &ret);

These two appear to be redundant as they're written though
__v4l2_ctrl_handler_setup() below.

> +	/* Always use the full sensor, using window to crop */
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_HORZ_END,
> +		  T4KA3_NATIVE_WIDTH - 1, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_VERT_END,
> +		  T4KA3_NATIVE_HEIGHT - 1, &ret);
> +	/* Set window */
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_X,
> +		  sensor->mode.win_x, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y,
> +		  sensor->mode.win_y, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret);
> +	/* Write 1 to unknown register 0x0900 */
> +	cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
> +	cci_write(sensor->regmap, T4KA3_REG_BINNING,
> +		  T4KA3_BINNING_VAL(sensor->mode.binning), &ret);
> +
> +	return ret;
> +}

...

> +static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(sensor->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *endpoint;
> +	unsigned long link_freq_bitmap;
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> +	fwnode_handle_put(endpoint);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +
> +	if (ret == -ENOENT)
> +		goto out_free_bus_cfg;
> +
> +	if (ret == -ENODATA)
> +		goto out_free_bus_cfg;

Please check for any non-zero return value instead.

> +
> +	sensor->link_freq_index = ffs(link_freq_bitmap) - 1;
> +
> +	/* 4 MIPI lanes */
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		ret = dev_err_probe(sensor->dev, -EINVAL,
> +				    "number of CSI2 data lanes %u is not supported\n",
> +				    bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		goto out_free_bus_cfg;
> +	}
> +
> +	sensor->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +
> +out_free_bus_cfg:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

I'll take this one now but please submit a patch on top to address the
above.

-- 
Kind regards,

Sakari Ailus

