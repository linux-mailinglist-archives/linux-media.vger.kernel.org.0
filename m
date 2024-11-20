Return-Path: <linux-media+bounces-21618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4F9D3513
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 09:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DC02820C4
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6735170A3D;
	Wed, 20 Nov 2024 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnX8Z4jz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0FA1586DB;
	Wed, 20 Nov 2024 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732090267; cv=none; b=s5luPLo53gQcaMlC81yVEKe7+je2Z5ldYaD9JRXE3eXa6kWZynClMu89csdLI2NJV/WBpOckU0fx50OYGaLmdfTtlZqatxyRGhNAElO+Gj5ayMfYQweUq99RwWfE8XAWs+pinsDmEbOQi10BmTaNHaUVlku+vw1r9/rbKcEn45w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732090267; c=relaxed/simple;
	bh=v1wo4bxWJLud4VLSRj8I8xAVToMBv7f3W9r2hPkVfT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn7hVRVOCYscI1JdJP7G2mr+8gaS0xDb5LIAVQPYuYvbb9lehsl9fyN195ljyoigRi7OqblSYKVVHIyGZojvJ0QCiwI5LEOa6yq7sRR9F7XVSk3tUfxMTFqTwej7C6Qm0AOoMDWzYQQzUBkmZQh7185oEUegEpmD08YRtpmTU9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnX8Z4jz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732090266; x=1763626266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=v1wo4bxWJLud4VLSRj8I8xAVToMBv7f3W9r2hPkVfT8=;
  b=DnX8Z4jzXyb4x2tUZktifpGXdp4wXR3b45Wfynk1osiSsxfAlPTyRKZl
   s62JuEkrpQ/X11RsM1CMsXHJeEcnAvBkhwr5wF7GjgEwKrpYbDhDVwCjZ
   M5lHM6ggefthauPVwNvuWjrjPhdoIoRkcqg+plx/nSa6GpNAehtfC6MU4
   7h+elpfvNGuakCnKccUxHN45mSZaLEGxS3pyG3VkhQj8tN9tG/L5FNhuR
   Ldq9wwwwWc+bpQ6TSOZYfCKfCkDX3Zwy5LT5JcDXlsCPBydKlXTuN6EAB
   nC5mDMOUnC4Kg3y4IuGJpq5019oVn+dhYs/nYDrzXSJsELfcSWnrmotxZ
   w==;
X-CSE-ConnectionGUID: hvtkSwVOQ+CUpbZXVU34qg==
X-CSE-MsgGUID: wEm6VjhSRNWxAfFoS9CYzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49561230"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="49561230"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 00:10:48 -0800
X-CSE-ConnectionGUID: 5Z+o/VGvQwuNE/Poyedy8Q==
X-CSE-MsgGUID: N5elFeXnSrqn8Msyfy7bhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90214947"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 00:10:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4C1D711F89A;
	Wed, 20 Nov 2024 10:10:42 +0200 (EET)
Date: Wed, 20 Nov 2024 08:10:42 +0000
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
Subject: Re: [PATCH 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <Zz2Zgvjm21iv-qtc@kekkonen.localdomain>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119221249.539610-3-niklas.soderlund+renesas@ragnatech.se>

Hejssan,

On Tue, Nov 19, 2024 at 11:12:47PM +0100, Niklas Söderlund wrote:
> Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> line-orders order properties as defined in MIPI Discovery and
> Configuration (DisCo) Specification for Imaging.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 56 ++++++++++++++++++++++++++-
>  include/media/v4l2-mediabus.h         | 21 ++++++++++
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index f19c8adf2c61..b8b2b7fb685e 100644
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
> @@ -250,6 +261,49 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
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
> +				const char *order;
> +
> +				switch (array[i]) {
> +				case 0:
> +					order = "ABC";
> +					break;
> +				case 1:
> +					order = "ACB";
> +					break;
> +				case 2:
> +					order = "BAC";
> +					break;
> +				case 3:
> +					order = "BCA";
> +					break;
> +				case 4:
> +					order = "CAB";
> +					break;
> +				case 5:
> +					order = "CBA";
> +					break;

Please use an array instead.

> +				default:
> +					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> +						i, array[i]);
> +					bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> +					continue;
> +				}
> +				bus->line_orders[i] = array[i];
> +				pr_debug("lane %u line order %s", i, order);
> +			}
> +		} else {
> +			for (i = 0; i < num_data_lanes; i++)
> +				bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;

A few lines could be wrapped above.

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
Med vänliga hälsningar,

Sakari Ailus

