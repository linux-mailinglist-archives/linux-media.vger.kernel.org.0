Return-Path: <linux-media+bounces-60-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105437E7F40
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88EA1B22980
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791843E49B;
	Fri, 10 Nov 2023 17:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BTiiBoZ1"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED0C3D990
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:47:09 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA64739CC7
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:46:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD54C49E;
	Fri, 10 Nov 2023 15:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699627553;
	bh=VRSE9UU7VYZ8UrK6+lJC0pP8vGr3IK0vmR+d96eLP3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTiiBoZ1Vdt48+ihp1EPTKR1YeVbLUVxoILVJnYLm8dK90jQyH91QfwkD2Dk97sZq
	 j27XZzOtq/S+n9qcZPM5HE9ank7g4fXBOkWSvI4hlIBjH5gHj1Lw3jKWQM/ZKZUg/y
	 uPbMUb4H3BW2LHXMOhzbKjY602qt/DWhMgU5BoEc=
Date: Fri, 10 Nov 2023 16:46:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 5/6] media: ccs: Better separate CCS static data access
Message-ID: <20231110144622.GD21167@pendragon.ideasonboard.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110094705.1367083-6-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Nov 10, 2023 at 11:47:04AM +0200, Sakari Ailus wrote:
> Separate CCS static data read-only register access in ccs-reg-access.c.

Please explain why. I don't have enough information to review this
patch.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-reg-access.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
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

