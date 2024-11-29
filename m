Return-Path: <linux-media+bounces-22345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5D9DE72C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99BD281466
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C61A19E7EB;
	Fri, 29 Nov 2024 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkDBUmfA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AEB1991AA
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886590; cv=none; b=qfO+nFw4pAOcNDZPbMXCGBizf1WWDuBLzxpfDP2drKyA9YSByCGH2PZjx+9F9UrefC48xJdkLOXbZ1Upyi5GlAnOdmazud+Fbm/Hi6pxh/9NP23TEHkGyd3WJf5fzyUDHtQ4uoKgucdxiwsGcFP6WoPWVFEr/ALXJ0RKA2dSaEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886590; c=relaxed/simple;
	bh=+ZJysvZU3dKPHmvkRdia4FU+DadVzZpiQDmxfExos1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7grOY70AJl0SWzDlvMxIUDw004Au+1qrBKD9Qza7LlCouaDQk7HjFMENoWz6PnDAeJWwmn05VSPv/+fsFBJPz2MZdapwYE6vTxu/Lxw5S2tsayB2i+DNS7qZ+vJJR4BgfsPCNNuCujMMFQrZzz9/Kr2vQQpag+tr7V98QoPUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkDBUmfA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732886588; x=1764422588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ZJysvZU3dKPHmvkRdia4FU+DadVzZpiQDmxfExos1E=;
  b=ZkDBUmfAlEHzD+09Tf7iNZpelqLvc1gKKl/LcG5RLzRMSHMSF0B+acv6
   Z7qJlO6CMkWzW80FFb/NCL1ma767MjpyFEf55HdGIxdJyL65eA0Zwwn59
   ioH4yQtifJa8Cu2hFYXV5EX5oMu8bmFm4fpb8a0nmVQGIeBME0aAnob7y
   1NZ8XanLxJMfaJDWaNwExnHxUpGiEhwayOQPfXsGKevs3XCpgHRRcy9la
   +BWuroUg+gXg8Hgva8W3lzb5NoemmKJN9geidVQxr06Pv4rbQtltRbZX9
   5IWMpbYACUsBVQvhBLfTMg6Xah8ui7E4UEpNSMJ6pR8CE0k3uG01g+2DK
   Q==;
X-CSE-ConnectionGUID: TdoKtozTT8+Q49NoVSzS6w==
X-CSE-MsgGUID: W114OtoTTdO3zevv1zPM6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33261113"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="33261113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:23:07 -0800
X-CSE-ConnectionGUID: GjMhYfoKT2+I3tXSDHkVmw==
X-CSE-MsgGUID: pvBIq7YUR8OA3w8dtuCZPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="129975079"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 05:23:04 -0800
Date: Fri, 29 Nov 2024 14:23:02 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] media: ov2740: Add camera orientation and sensor
 rotation controls
Message-ID: <Z0nANsKWa3p+5xAz@linux.intel.com>
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128152338.4583-3-hdegoede@redhat.com>

On Thu, Nov 28, 2024 at 04:23:36PM +0100, Hans de Goede wrote:
> Add camera orientation and sensor rotation controls using
> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
> helpers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/media/i2c/ov2740.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index e7a611967b40..998e1977978d 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -755,15 +755,17 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
>  
>  static int ov2740_init_controls(struct ov2740 *ov2740)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
>  	const struct ov2740_mode *cur_mode;
>  	s64 exposure_max, h_blank, pixel_rate;
>  	u32 vblank_min, vblank_max, vblank_default;
> +	struct v4l2_fwnode_device_properties props;
>  	int size;
>  	int ret;
>  
>  	ctrl_hdlr = &ov2740->ctrl_handler;
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>  	if (ret)
>  		return ret;
>  
> @@ -813,6 +815,13 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>  				     V4L2_CID_TEST_PATTERN,
>  				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
>  				     0, 0, ov2740_test_pattern_menu);
> +
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
> +
>  	if (ctrl_hdlr->error) {
>  		v4l2_ctrl_handler_free(ctrl_hdlr);
>  		return ctrl_hdlr->error;
> -- 
> 2.47.0
> 
> 

