Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA982C4693
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 18:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732098AbgKYRXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 12:23:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:61831 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730695AbgKYRXU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 12:23:20 -0500
IronPort-SDR: gNmKAyj6EVpxyjlK2/ygiRrR2MKLyK/J4770zqE+CbI8OTd17XS/eFzrSvcoY3YdtwHXejN6IM
 b/Df5qaZ8+3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152008152"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="152008152"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 09:23:18 -0800
IronPort-SDR: up3uT+4vM7wHKCwYFBBE0RE0DVGHTcjffpZ97qA+Mwo7ACStNeFjxCppGrCdLHUswwR5m3t2TV
 WyTWKbd80E6g==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="328060510"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 09:23:17 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 065EA208C5; Wed, 25 Nov 2020 19:23:15 +0200 (EET)
Date:   Wed, 25 Nov 2020 19:23:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] v4l2-fwnode: Remove
 v4l2_async_notifier_parse_fwnode_endpoints_by_port()
Message-ID: <20201125172314.GK3940@paasikivi.fi.intel.com>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
 <20201125164450.2056963-6-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125164450.2056963-6-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan,

Tack för dessa lappar!

On Wed, Nov 25, 2020 at 05:44:50PM +0100, Niklas Söderlund wrote:
> There are no users left of this helper and as it implements an
> undesirable and too simple behaviour that should instead be implemented
> directly by drivers remove it to prevent future uses of it.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 14 -------
>  include/media/v4l2-fwnode.h           | 53 ---------------------------
>  2 files changed, 67 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 44dd04b05e2970ab..5353e37eb950e813 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -911,20 +911,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints);
>  
> -int
> -v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
> -						   struct v4l2_async_notifier *notifier,
> -						   size_t asd_struct_size,
> -						   unsigned int port,
> -						   parse_endpoint_func parse_endpoint)
> -{
> -	return __v4l2_async_notifier_parse_fwnode_ep(dev, notifier,
> -						     asd_struct_size,
> -						     port, true,
> -						     parse_endpoint);
> -}
> -EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints_by_port);

Could you also merge __v4l2_async_notifier_parse_fwnode_ep with
v4l2_async_notifier_parse_fwnode_endpoints as well? I'd do it in a separate
patch though.

> -
>  /*
>   * v4l2_fwnode_reference_parse - parse references for async sub-devices
>   * @dev: the device node the properties of which are parsed for references
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index 4e1f6e1d847ec864..4365430eea6f3802 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -484,59 +484,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
>  					   size_t asd_struct_size,
>  					   parse_endpoint_func parse_endpoint);
>  
> -/**
> - * v4l2_async_notifier_parse_fwnode_endpoints_by_port - Parse V4L2 fwnode
> - *							endpoints of a port in a
> - *							device node
> - * @dev: the device the endpoints of which are to be parsed
> - * @notifier: notifier for @dev
> - * @asd_struct_size: size of the driver's async sub-device struct, including
> - *		     sizeof(struct v4l2_async_subdev). The &struct
> - *		     v4l2_async_subdev shall be the first member of
> - *		     the driver's async sub-device struct, i.e. both
> - *		     begin at the same memory address.
> - * @port: port number where endpoints are to be parsed
> - * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
> - *		    endpoint. Optional.
> - *
> - * This function is just like v4l2_async_notifier_parse_fwnode_endpoints() with
> - * the exception that it only parses endpoints in a given port. This is useful
> - * on devices that have both sinks and sources: the async sub-devices connected
> - * to sources have already been configured by another driver (on capture
> - * devices). In this case the driver must know which ports to parse.
> - *
> - * Parse the fwnode endpoints of the @dev device on a given @port and populate
> - * the async sub-devices list of the notifier. The @parse_endpoint callback
> - * function is called for each endpoint with the corresponding async sub-device
> - * pointer to let the caller initialize the driver-specific part of the async
> - * sub-device structure.
> - *
> - * The notifier memory shall be zeroed before this function is called on the
> - * notifier the first time.
> - *
> - * This function may not be called on a registered notifier and may be called on
> - * a notifier only once per port.
> - *
> - * The &struct v4l2_fwnode_endpoint passed to the callback function
> - * @parse_endpoint is released once the function is finished. If there is a need
> - * to retain that configuration, the user needs to allocate memory for it.
> - *
> - * Any notifier populated using this function must be released with a call to
> - * v4l2_async_notifier_cleanup() after it has been unregistered and the async
> - * sub-devices are no longer in use, even if the function returned an error.
> - *
> - * Return: %0 on success, including when no async sub-devices are found
> - *	   %-ENOMEM if memory allocation failed
> - *	   %-EINVAL if graph or endpoint parsing failed
> - *	   Other error codes as returned by @parse_endpoint
> - */
> -int
> -v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
> -						   struct v4l2_async_notifier *notifier,
> -						   size_t asd_struct_size,
> -						   unsigned int port,
> -						   parse_endpoint_func parse_endpoint);
> -
>  /**
>   * v4l2_async_notifier_parse_fwnode_sensor_common - parse common references on
>   *					       sensors for async sub-devices
> -- 
> 2.29.2
> 

-- 
Sakari Ailus
