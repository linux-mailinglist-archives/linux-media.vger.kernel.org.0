Return-Path: <linux-media+bounces-23250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372A9EE037
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 08:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E0B1885379
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A285620B1E8;
	Thu, 12 Dec 2024 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR0unn6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5684945027;
	Thu, 12 Dec 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988357; cv=none; b=q1gqh2povUrxy8qIUuv8r+BRNTzlLy4tYAQ1gA8HnFcgHzWPORT4uruzHTUL4ucCcdDv2GogZ8zaCMUAu8P6WkmJznabPtgFIs8TTViyZax6wXd2ki6F+mtocxMJLEiJnt2+tnzeC3syYxLiEIkycrGyVvS6+ENHp66WN7HRKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988357; c=relaxed/simple;
	bh=WQgesphKPZtQtDkSSaKmZdO5cVGMF3Bi1WZp8uEHTrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5dz/j8Mpwcaprj6l3dFdK7WhMrgHiLYHv+k7QEmC6HckwFxns/knSX554Pp0ll+nQoJkajWsidYg6yyWvX6al/Cs4DlclvWKlnbZ4jp9QKExL5HoS3HoGdSn+BCbUnB3j4ZIDbgOQCEqBUD+lI6+uuStc7N7u77Eo5v3fNTbkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR0unn6B; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733988355; x=1765524355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WQgesphKPZtQtDkSSaKmZdO5cVGMF3Bi1WZp8uEHTrA=;
  b=lR0unn6Byw3WyKTjob4qgFQipqm0cE3C6YdpY1rO8CykV9gvgwRfJGAo
   TuiQ5mQTV1pXvMRjoIWMAiOsqTl2qRHDkDzCkJqSjpFsHQE7+Tvowqaz/
   6dH0yuPXRFsP0k4vxlmgQREZPIvBf6x0pKejZcnufa+t80hr3v42cUBD4
   OOkp4Xd3ov5iB4NLwVgVlHM9y5R4EqeppkIzgwXzArduCXT8BoJjXH0Wc
   mq7/hqVxP1LEPyJ72Y/RdiV12GmAIkboomzxslHQRGpJS5HuopeablgY6
   Zhcpj9n64nnnnKJJpgaGWhHdUCKMGQ9csYqbN9wK0R+lNrUxpWYXsM1GF
   A==;
X-CSE-ConnectionGUID: 77A/qfrDRLmMyXtZnPxQ0w==
X-CSE-MsgGUID: WMeSDTAUSuKI/NvzPU913g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34313112"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34313112"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:25:49 -0800
X-CSE-ConnectionGUID: O5T98L/HQj+9++OChIET0w==
X-CSE-MsgGUID: pKrY4UCpSwyigNxg5j2Edw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119391224"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 23:25:43 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3E24011F81D;
	Thu, 12 Dec 2024 09:25:38 +0200 (EET)
Date: Thu, 12 Dec 2024 07:25:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <Z1qP8uY72kw9uX2E@kekkonen.localdomain>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>

Hej Niklas,

On Thu, Nov 21, 2024 at 02:41:06PM +0100, Niklas Söderlund wrote:
> Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> line-orders order properties as defined in MIPI Discovery and
> Configuration (DisCo) Specification for Imaging.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Use array instead of switch to get printable line order string for
>   debug output.
> - Wrap lines harder for 80 chars instead of 100, but keep string formats
>   on same line even if they break the 80 chars.
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 43 ++++++++++++++++++++++++++-
>  include/media/v4l2-mediabus.h         | 21 +++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index f19c8adf2c61..bb5ea3e00414 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -127,7 +127,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  {
>  	struct v4l2_mbus_config_mipi_csi2 *bus = &vep->bus.mipi_csi2;
>  	bool have_clk_lane = false, have_data_lanes = false,
> -		have_lane_polarities = false;
> +		have_lane_polarities = false, have_line_orders = false;
>  	unsigned int flags = 0, lanes_used = 0;
>  	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
>  	u32 clock_lane = 0;
> @@ -197,6 +197,17 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  		have_lane_polarities = true;
>  	}
>  
> +	rval = fwnode_property_count_u32(fwnode, "line-orders");
> +	if (rval > 0) {
> +		if (rval != num_data_lanes) {
> +			pr_warn("invalid number of line-orders entries (need %u, got %u)\n",
> +				num_data_lanes, rval);
> +			return -EINVAL;
> +		}
> +
> +		have_line_orders = true;
> +	}
> +
>  	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
>  		clock_lane = v;
>  		pr_debug("clock lane position %u\n", v);
> @@ -250,6 +261,36 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  		} else {
>  			pr_debug("no lane polarities defined, assuming not inverted\n");
>  		}
> +
> +		if (have_line_orders) {
> +			fwnode_property_read_u32_array(fwnode,
> +						       "line-orders", array,
> +						       num_data_lanes);
> +
> +			for (i = 0; i < num_data_lanes; i++) {
> +				static const char * const orders[] = {
> +					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
> +				};
> +
> +				if (array[i] > 5) {


I'd use:

				if (... >= ARRAY_SIZE(order)) {

I can do the change while applying...

> +					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> +						i, array[i]);
> +					bus->line_orders[i] =
> +						V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> +					continue;
> +				}
> +
> +				bus->line_orders[i] = array[i];
> +				pr_debug("lane %u line order %s", i,
> +					 orders[array[i]]);
> +			}
> +		} else {
> +			for (i = 0; i < num_data_lanes; i++)
> +				bus->line_orders[i] =
> +					V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> +
> +			pr_debug("no line orders defined, assuming ABC\n");
> +		}
>  	}
>  
>  	return 0;
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 5bce6e423e94..e7f019f68c8d 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -73,6 +73,24 @@
>  
>  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
>  
> +/**
> + * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC (default)
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
> + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
> + */
> +enum v4l2_mbus_csi2_cphy_line_orders_type {
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> +};
> +
>  /**
>   * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
>   * @flags: media bus (V4L2_MBUS_*) flags
> @@ -81,6 +99,8 @@
>   * @num_data_lanes: number of data lanes
>   * @lane_polarities: polarity of the lanes. The order is the same of
>   *		   the physical lanes.
> + * @line_orders: line order of the data lanes. The order is the same of the
> + *		   physical lanes.
>   */
>  struct v4l2_mbus_config_mipi_csi2 {
>  	unsigned int flags;
> @@ -88,6 +108,7 @@ struct v4l2_mbus_config_mipi_csi2 {
>  	unsigned char clock_lane;
>  	unsigned char num_data_lanes;
>  	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
> +	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
>  };
>  
>  /**

-- 
Med vänliga hälsingar,

Sakari Ailus

