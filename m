Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B2C44BCB0
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 09:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhKJISK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 03:18:10 -0500
Received: from mga09.intel.com ([134.134.136.24]:57977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhKJISJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 03:18:09 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232470090"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="232470090"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 00:15:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="452216705"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2021 00:15:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mkil9-005Le4-Um;
        Wed, 10 Nov 2021 10:15:07 +0200
Date:   Wed, 10 Nov 2021 10:15:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YYt/i9PAvGEHRGY7@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 10, 2021 at 12:01:19AM +0000, Daniel Scally wrote:
> On 09/11/2021 16:35, Daniel Scally wrote:

Some comments to the code below.

...

> +static int dw9719_i2c_rd8(struct i2c_client *client, u8 reg, u8 *val)
> +{
> +	struct i2c_msg msg[2];

> +	u8 buf[2] = { reg };

See below.

> +	int ret;
> +
> +	msg[0].addr = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].len = 1;
> +	msg[0].buf = buf;
> +
> +	msg[1].addr = client->addr;
> +	msg[1].flags = I2C_M_RD;
> +	msg[1].len = 1;
> +	msg[1].buf = &buf[1];
> +	*val = 0;
> +
> +	ret = i2c_transfer(client->adapter, msg, 2);
> +	if (ret < 0)
> +		goto err;
> +
> +	*val = buf[1];
> +
> +	return 0;

> +err:
> +	return ret;

Useless. Return in-place.

> +}

...

> +	u8 buf[3] = { reg, (u8)(val >> 8), (u8)(val & 0xff)};

This, and similar cases, has endianess issue.

You are supposed to have __be16 or __le16 buffer with respect to the hardware.
Another way (since I looked at the other places) is to use put_unligned_*().

As per above this requires put_unaligned_be16().

...

> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);

Why this can't be set by user space?

...

> Subject: [PATCH 2/3] device property: Check fwnode->secondary when finding
>  properties
> 
> fwnode_property_get_reference_args() searches for named properties
> against a fwnode_handle, but these could instead be against the fwnode's
> secondary. If the property isn't found against the primary, check the
> secondary to see if it's there instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/base/property.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 453918eb7390..054e62a4e710 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -479,8 +479,16 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
>  				       unsigned int nargs, unsigned int index,
>  				       struct fwnode_reference_args *args)
>  {
> -	return fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
> -				  nargs, index, args);
> +	int ret;
> +
> +	ret = fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
> +				 nargs, index, args);
> +
> +	if (ret < 0 && !IS_ERR_OR_NULL(fwnode->secondary))
> +		ret = fwnode_call_int_op(fwnode->secondary, get_reference_args,
> +					 prop, nargs_prop, nargs, index, args);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(fwnode_property_get_reference_args);
>  
> -- 
> 2.25.1
> 

> From dd7532ddea71482502394b6b36c9fd3e5f2a0a37 Mon Sep 17 00:00:00 2001
> From: Daniel Scally <djrscally@gmail.com>
> Date: Tue, 9 Nov 2021 23:12:06 +0000
> Subject: [PATCH 1/3] platform/x86: int3472: Add vsio regulator supply to board
>  file
> 
> The Surface Go2 board file needs to additionally specify a supply name
> mapping the VSIO regulator to the world facing camera's VCM device, as
> it can sit behind an I2C daisy chain which requires this regulator be
> enabled to function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470_board_data.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 20615c342875..556a615afaa9 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -29,6 +29,7 @@ static struct regulator_consumer_supply int347a_vcm_consumer_supplies[] = {
>  
>  static struct regulator_consumer_supply int347a_vsio_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT347A:00"),
> +	REGULATOR_SUPPLY("vsio", "i2c-INT347A:00-VCM"),
>  };
>  
>  static const struct regulator_init_data surface_go_tps68470_core_reg_init_data = {
> -- 
> 2.25.1
> 


-- 
With Best Regards,
Andy Shevchenko


