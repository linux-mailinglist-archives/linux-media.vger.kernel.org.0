Return-Path: <linux-media+bounces-250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB07E9DEE
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD817B20AC7
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D8620B15;
	Mon, 13 Nov 2023 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LenxxZyg"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3721DA5B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:57:06 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FEFD4C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:57:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED77610A;
	Mon, 13 Nov 2023 14:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699883799;
	bh=hv7IEdSk2MmoQ9pjLeYzHxQEwK+3s6H20I/W+nU93Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LenxxZygToJCfsKzF+GsZKto0mZ2va0nh6pWVadp4dCEACGelfHQlQrnuRhAGQ6RF
	 aqIslDp+s7SmOnODMOSwmeUNK6COU39izd+Qs193YcWDfybtBF6kQ4M7uAF+X7EXxM
	 ciLKMAZEsddJ1q65oP8kbE6O7R1bu0GQAh4T4JH4=
Date: Mon, 13 Nov 2023 15:57:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 5/6] media: ccs: Better separate CCS static data access
Message-ID: <20231113135710.GG24338@pendragon.ideasonboard.com>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113134458.1423754-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Nov 13, 2023 at 03:44:57PM +0200, Sakari Ailus wrote:
> Separate CCS static data read-only register access in ccs-reg-access.c by
> naming them differently.

"naming the access functions differently"

> The code in this file generally deals with reading and writing registers
> where as static data (when it comes to ccs_static_read_only()) contains
> the read-only register values but no hardware registers are accessed in
> that case.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../driver-api/media/drivers/ccs/mk-ccs-regs  |  2 +-
>  drivers/media/i2c/ccs/ccs-reg-access.c        | 20 +++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> index 01252ee6062b..3d3152b45821 100755
> --- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> +++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> @@ -136,7 +136,7 @@ if (! defined $kernel) {
>  
>  print $H "#define CCS_FL_FLOAT_IREAL	" . flag_str(\$flag, \$all_flags) . "\n";
>  print $H "#define CCS_FL_IREAL		" . flag_str(\$flag, \$all_flags) . "\n";
> -print $H "#define CCS_BUILD_BUG \
> +print $H "#define CCS_BUILD_BUG \\

This doesn't seem related.

>  	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & ($all_flags))\n"
>      if defined $kernel;
>  
> diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> index 25993445f4fe..652d705a2ef5 100644
> --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> @@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
>  	return 0;
>  }
>  
> -static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
> -			   u32 reg, u32 *val)
> +static int __ccs_static_read_only(struct ccs_reg *regs, size_t num_regs,

"static read only" sounds weird when interpreting "read" as a verb. And
if "read" is not a verb, you're missing a verb :-) Maybe
__ccs_read_state_data() would be a better name ? Same below.

> +				  u32 reg, u32 *val)
>  {
>  	unsigned int width = ccs_reg_width(reg);
>  	size_t i;
> @@ -235,16 +235,16 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
>  	return -ENOENT;
>  }
>  
> -static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
> +static int ccs_static_read_only(struct ccs_sensor *sensor, u32 reg, u32 *val)
>  {
> -	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
> -			     sensor->sdata.num_sensor_read_only_regs,
> -			     reg, val))
> +	if (!__ccs_static_read_only(sensor->sdata.sensor_read_only_regs,
> +				    sensor->sdata.num_sensor_read_only_regs,
> +				    reg, val))
>  		return 0;
>  
> -	return __ccs_read_data(sensor->mdata.module_read_only_regs,
> -			       sensor->mdata.num_module_read_only_regs,
> -			       reg, val);
> +	return __ccs_static_read_only(sensor->mdata.module_read_only_regs,
> +				      sensor->mdata.num_module_read_only_regs,
> +				      reg, val);
>  }
>  
>  static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
> @@ -253,7 +253,7 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
>  	int rval;
>  
>  	if (data) {
> -		rval = ccs_read_data(sensor, reg, val);
> +		rval = ccs_static_read_only(sensor, reg, val);
>  		if (!rval)
>  			return 0;
>  	}

-- 
Regards,

Laurent Pinchart

