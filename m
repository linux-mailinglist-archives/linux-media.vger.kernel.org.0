Return-Path: <linux-media+bounces-18602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5765986E6E
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74561C21D81
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 08:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FD813EFF3;
	Thu, 26 Sep 2024 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIV7QyVP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E094C91;
	Thu, 26 Sep 2024 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337675; cv=none; b=p40jcDjSftGrDxUbzLx2l7RI82EkcCSMIBd3E6NEPmm6lkTERPIAPmXHSsGDzCX+az/JSqZHzHViddVBiVnYqbR6y8oDEr7bQGaAYQhz/Z4K9caAj6dfFu2ja5W3R9uHXEV8xQVvzklzpDypwna8sBubjgIAJJTfNCDwKXtn/KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337675; c=relaxed/simple;
	bh=LQuBADvhGdNSAqPKamvkEFKBQPk9oIxRXzi8MbJ1c3I=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=glq8re4mDOjuRh+GjYur1NvIqURMAkjkmaESmxymKBUGef/OH1DRAKjqZyyHo8Nrqfn7fQICTupynW7yPO9ZrgRfnA/YNc85r11dXR/sUBBiq/LiXFCwRI4o4fepD74n+tr3arpxbLz6d/5VEJ6ADHXo79Lv9snHTJiorhwDOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIV7QyVP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727337673; x=1758873673;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=LQuBADvhGdNSAqPKamvkEFKBQPk9oIxRXzi8MbJ1c3I=;
  b=EIV7QyVPsMHJDaMJhBuBMj3e+tj4ByDnviJt0lcPJ1ZUzwThug2n1XZp
   TtFn7KzhUF0TOrr1QBE+vg36Ab91m3ZL812flWWi/Vz13H80HeqoIo7fX
   SXJ4FjCyBz/xneyYxJlUGuPfr2OBWrLvoCcWs3g6dYKrii9HQIpXJf0+F
   ikJ1FKB8afxVeSoy99nhsZ2qAjKMdHzm7AUb+bgica+dpB4ovd8Qlgj3a
   eeAtSObX48cMAXltgXa1/vnD3fF6gzvA+15YeTJj1fpGvVdTelrc8hj9L
   n2Bn4xIKkZ1JIlHHGpR5ZzIHc3jDBg6st+pZDTbC5hf6B4U16dYN9hZCN
   Q==;
X-CSE-ConnectionGUID: k2K4ixR1Q1+WX/ZD9TBWLw==
X-CSE-MsgGUID: gZTKl/a6RoKuSdH4ZOftNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="14039373"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="14039373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 01:01:12 -0700
X-CSE-ConnectionGUID: jEkMThRGQMStiOeHBiv7Qw==
X-CSE-MsgGUID: cjFeVvXYQIuIg54zfu0B0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="102829130"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 01:01:10 -0700
Subject: Re: [PATCH/RFC v1 2/9] media: i2c: Add a driver for the onsemi AR0144
 camera sensor
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dongcheng Yan <dongcheng.yan@intel.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
 <20240630141802.15830-3-laurent.pinchart@ideasonboard.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <da12c6ba-1c49-0ec7-8ee0-5c230d3de2d3@linux.intel.com>
Date: Thu, 26 Sep 2024 16:03:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240630141802.15830-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Laurent,

On 6/30/24 10:17 PM, Laurent Pinchart wrote:
> The AR0144 is a 1/4" 1MP CMOS camera sensor from onsemi. The driver
> supports both the monochrome and color versions, and both the parallel
> and MIPI CSI-2 interfaces. Due to limitations of the test platform, only
> the CSI-2 output has been tested.
> 
> The driver supports 8-, 10- and 12-bit output formats, analog crop and
> binning/skipping. It exposes controls that cover the usual use cases for
> camera sensors.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ar0144.c | 1826 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1839 insertions(+)
>  create mode 100644 drivers/media/i2c/ar0144.c
> 
...
> +
> +/* -----------------------------------------------------------------------------
> + * PLL
> + */
> +
> +static int ar0144_pll_calculate(struct ar0144 *sensor, struct ccs_pll *pll,
> +				unsigned int link_freq, unsigned int bpp)
> +{
> +	struct ccs_pll_limits limits = {
> +		.min_ext_clk_freq_hz = 6000000,
> +		.max_ext_clk_freq_hz = 48000000,
> +
> +		.vt_fr = {
> +			.min_pre_pll_clk_div = 1,
> +			.max_pre_pll_clk_div = 63,
> +			.min_pll_ip_clk_freq_hz = 1000000,	/* min_pll_op_clk_freq_hz / max_pll_multiplier */
> +			.max_pll_ip_clk_freq_hz = 24000000,	/* max_pll_op_clk_freq_hz / min_pll_multiplier */
> +			.min_pll_multiplier = 32,
> +			.max_pll_multiplier = 384,
> +			.min_pll_op_clk_freq_hz = 384000000,
> +			.max_pll_op_clk_freq_hz = 768000000,
> +		},
> +		.vt_bk = {
> +			.min_sys_clk_div = 1,
> +			.max_sys_clk_div = 16,
> +			.min_pix_clk_div = 4,
> +			.max_pix_clk_div = 16,
> +			.min_pix_clk_freq_hz = 6000000,		/* No documented limit */
> +			.max_pix_clk_freq_hz = 74250000,
> +		},
> +		.op_bk = {
> +			.min_sys_clk_div = 1,
> +			.max_sys_clk_div = 16,
> +			.min_pix_clk_div = 8,
> +			.max_pix_clk_div = 12,
> +			.min_pix_clk_freq_hz = 6000000,		/* No documented limit */
> +			.max_pix_clk_freq_hz = 74250000,
> +		},
> +
> +		.min_line_length_pck_bin = 1200 + AR0144_MIN_HBLANK,	/* To be checked */
> +		.min_line_length_pck = 1200 + AR0144_MIN_HBLANK,
> +	};
> +	unsigned int num_lanes = sensor->bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	int ret;
> +
> +	/*
> +	 * The OP pixel clock limits depends on the number of lanes, which the
> +	 * PLL calculator doesn't take into account despite specifying the
> +	 * CCS_PLL_FLAG_LANE_SPEED_MODEL flag. Adjust them manually.
> +	 */
> +	limits.op_bk.min_pix_clk_freq_hz /= num_lanes;
> +	limits.op_bk.max_pix_clk_freq_hz /= num_lanes;
> +
> +	/*
> +	 * There are no documented constraints on the sys clock frequency, for
> +	 * either branch. Recover them based on the PLL output clock frequency
> +	 * and sys_clk_div limits on one hand, and the pix clock frequency and
> +	 * the pix_clk_div limits on the other hand.
> +	 */
> +	limits.vt_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
> +		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
> +	limits.vt_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
> +		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
> +
> +	limits.op_bk.min_sys_clk_freq_hz =
> +		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
> +		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
> +	limits.op_bk.max_sys_clk_freq_hz =
> +		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
> +		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
> +
> +	memset(pll, 0, sizeof(*pll));
> +
> +	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +	pll->op_lanes = num_lanes;
> +	pll->vt_lanes = 1;
> +	pll->csi2.lanes = num_lanes;
> +	/*
> +	 * As the sensor doesn't support FIFO derating, binning doesn't
> +	 * influence the PLL configuration. Hardcode the binning factors.
> +	 */
> +	pll->binning_horizontal = 1;
> +	pll->binning_vertical = 1;
> +	pll->scale_m = 1;
> +	pll->scale_n = 1;
> +	pll->bits_per_pixel = bpp;
> +	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
> +	pll->link_freq = link_freq;
> +	pll->ext_clk_freq_hz = clk_get_rate(sensor->clk);
> +
> +	ret = ccs_pll_calculate(sensor->dev, &limits, pll);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The sensor ignores the LSB of the PLL multiplier. If the multiplier
> +	 * is an odd value, as a workaround to avoid precision loss, multiply
> +	 * both the pre-divider and the multiplier by 2 if this doesn't bring
> +	 * them beyond their maximum values. This doesn't necessarily guarantee
> +	 * optimum PLL parameters. Ideally the PLL calculator should handle
> +	 * this constraint.
> +	 */
> +	if ((pll->vt_fr.pll_multiplier & 1) &&
> +	    pll->vt_fr.pll_multiplier * 2 <= limits.vt_fr.max_pll_multiplier &&
> +	    pll->vt_fr.pre_pll_clk_div * 2 <= limits.vt_fr.max_pre_pll_clk_div) {
> +		pll->vt_fr.pll_multiplier *= 2;
> +		pll->vt_fr.pre_pll_clk_div *= 2;
> +	}
> +
> +	if (pll->vt_fr.pll_multiplier & 1)
> +		dev_warn(sensor->dev,
> +			 "Odd PLL multiplier, link frequency %u will not be exact\n",
> +			 pll->link_freq);
> +
> +	return 0;
> +}

Dongcheng and I are trying to calculate the AR pll like code here. But
we did not find any datasheet or manual to refer to. Even vendor has no
idea. Could you share which doc can help us to do that?

> +
> +static int ar0144_pll_update(struct ar0144 *sensor,
> +			     const struct ar0144_format_info *info)
> +{
> +	u64 link_freq;
> +	int ret;
> +
> +	link_freq = sensor->bus_cfg.link_frequencies[sensor->link_freq->val];
> +	ret = ar0144_pll_calculate(sensor, &sensor->pll, link_freq, info->bpp);
> +	if (ret) {
> +		dev_err(sensor->dev, "PLL calculations failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate,
> +				 sensor->pll.pixel_rate_pixel_array);
> +
> +	return 0;
> +}
> +
...
> 

-- 
Best regards,
Bingbu Cao

