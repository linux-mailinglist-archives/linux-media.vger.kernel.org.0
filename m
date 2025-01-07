Return-Path: <linux-media+bounces-24322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40469A039E0
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 09:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F521653EC
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B349B1E0091;
	Tue,  7 Jan 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBZ++xr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6513B58D;
	Tue,  7 Jan 2025 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239000; cv=none; b=dR+avjWdtCDBLWDQ6Y27MyxSj7fKft5y9rOz8Pj5Gt/fNHsdGN7Q8Y4P0tO3Is2WvK0p4lvzut6fqHFR+aslSYkMafd/85zC+EJMoN2Mez8irsR6rZ+mKjaRFTIhvWq02D6xfS0YnWeG7BfSLfdsU6Nl97IhlhRUnEpyxAeFp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239000; c=relaxed/simple;
	bh=bKued9kGOv1aKlOI/ltppi9djTLB4uTYa1slajCF9yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKMEaTKMFi+Hbzns0Xpt5csTrLM3iazk4Jwq2npf9INyhINSY6OmdE5oqDqXOQhSUgvnoDZ5Gyum0H/6jC+dNeFpHS62H5z/bhQLPRd9TKJNeHVf6b9mm5xYcC04zpjhwrVhZtxowxFiQRSGyVEgfkvlaLBS4Bb2UG7rbhS041s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBZ++xr9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736238997; x=1767774997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bKued9kGOv1aKlOI/ltppi9djTLB4uTYa1slajCF9yc=;
  b=OBZ++xr9qh1e8MYDhJ/C1AolPzd1T65Sn/C2utLf/kQWDFlX4urIhDNV
   VY3ATybKOkiPxxaACVdrb4kfsnKPpvFkDUWcbU82EBmKMbcrpwjTLigG6
   ZG+5B7/h4n4AiiVPz2m1hUV8qEA1KlOri/nj6jfO3bLtchnaWWPm7WTIS
   5j7sZNfYGnLvwnIRXA7QUw6NDwZNj3mzkfIpwzP//q45jMhZF7yhEulEc
   LMZJl3irEWpKAD82Hz0ckUK5D+pMf1vQoS2xaimkGwUPYBlV9sw5GbQ3Q
   SvPNrBplkWa63OHSn1ArBSJixNh5qNKMLjUtaCcn4ck2lsMFZ+IgIoOVo
   Q==;
X-CSE-ConnectionGUID: Fy/dGgDoRmWwVHlbgbpI+Q==
X-CSE-MsgGUID: g2WWy1nnQYSStJLeiCeN3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35706004"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="35706004"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:36:36 -0800
X-CSE-ConnectionGUID: pDS5QeU9QYC9aWlPdu3K4g==
X-CSE-MsgGUID: o+uP5GGnSQGJvcDxhVaxBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103194804"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:36:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0263511FA2C;
	Tue,  7 Jan 2025 10:36:31 +0200 (EET)
Date: Tue, 7 Jan 2025 08:36:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l: fwnode: Parse CSI-2 C-PHY line-orders
 like bus-type
Message-ID: <Z3znj0MOWvIhbOxj@kekkonen.localdomain>
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
 <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>

Hejssan Niklas,

Tack för dessa lappar!

On Sat, Jan 04, 2025 at 08:55:48PM +0100, Niklas Söderlund wrote:
> Provided a safe-guard from the raw values used in device tree sources
> and the in-kernel defines used to describe the different line orders.
> This mimics what have been done for the bus-type property to provide the
> same safe-guard.
> 
> The macros used in device tree sources are defined in video-interfaces.h
> (MEDIA_BUS_CSI2_CPHY_LINE_ORDER_*) and are only visible to DTS source
> files. These raw values map directly to the in-kernel names by fwnode
> defines in v4l2-fwnode.h (V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_*). These
> fwnode defines are finally translated to defines which are exposed to
> drivers to act on (V4L2_MBUS_CSI2_CPHY_LINE_ORDER_*).
> 
> Previously the translation to values provided to drivers have exploited
> the fact that the numerical value for each setting are the same for the
> defines used in device tree sources. While this is unlikely to change
> this harmonises the bus-type and line-orders parsing to work using the
> same mechanics, while at the same time make the large CSI-2 parsing
> function a little more readable.

Do we in fact need the V4L2_MBUS_ definitions of the line orders at all?

The same could extend to the V4L2_MBUS_ bus type defitions, but that's out
of scope of this patch.

> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 80 ++++++++++++++++++++++-----
>  1 file changed, 66 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index cb153ce42c45..69f6d1df8c39 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -121,6 +121,70 @@ v4l2_fwnode_mbus_type_to_string(enum v4l2_mbus_type type)
>  	return conv ? conv->name : "not found";
>  }
>  
> +static const struct v4l2_fwnode_csi2_cphy_line_orders_conv {
> +	enum v4l2_fwnode_csi2_cphy_line_orders_type fwnode_order;
> +	enum v4l2_mbus_csi2_cphy_line_orders_type mbus_order;
> +	const char *name;
> +} csi2_cphy_line_orders[] = {
> +	{
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ABC,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> +		"ABC",
> +	}, {
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ACB,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> +		"ACB",
> +	}, {
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BAC,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> +		"BAC",
> +	}, {
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BCA,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> +		"BCA",
> +	}, {
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CAB,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> +		"CAB",
> +	}, {
> +		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CBA,
> +		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> +		"CBA",
> +	}
> +};
> +
> +static const struct v4l2_fwnode_csi2_cphy_line_orders_conv *
> +get_v4l2_fwnode_line_order_conv_by_fwnode_order(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(csi2_cphy_line_orders); i++)
> +		if (csi2_cphy_line_orders[i].fwnode_order == order)
> +			return &csi2_cphy_line_orders[i];
> +
> +	/* The default line order is ABC */
> +	pr_warn("invalid line-order assuming ABC (got %u)\n", order);
> +	return &csi2_cphy_line_orders[0];
> +}
> +
> +static enum v4l2_mbus_csi2_cphy_line_orders_type
> +v4l2_fwnode_line_order_to_mbus(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> +{
> +	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
> +		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
> +
> +	return conv->mbus_order;
> +}
> +
> +static const char *
> +v4l2_fwnode_line_order_to_string(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
> +{
> +	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
> +		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
> +
> +	return conv->name;
> +}
> +
>  static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  					       struct v4l2_fwnode_endpoint *vep,
>  					       enum v4l2_mbus_type bus_type)
> @@ -268,21 +332,9 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
>  						       num_data_lanes);
>  
>  			for (i = 0; i < num_data_lanes; i++) {
> -				static const char * const orders[] = {
> -					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
> -				};
> -
> -				if (array[i] >= ARRAY_SIZE(orders)) {
> -					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> -						i, array[i]);
> -					bus->line_orders[i] =
> -						V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> -					continue;
> -				}
> -
> -				bus->line_orders[i] = array[i];
> +				bus->line_orders[i] = v4l2_fwnode_line_order_to_mbus(array[i]);
>  				pr_debug("lane %u line order %s", i,
> -					 orders[array[i]]);
> +					 v4l2_fwnode_line_order_to_string(array[i]));
>  			}
>  		} else {
>  			for (i = 0; i < num_data_lanes; i++)
> -- 
> 2.47.1
> 

-- 
Med vänliga hälsningar,

Sakari Ailus

