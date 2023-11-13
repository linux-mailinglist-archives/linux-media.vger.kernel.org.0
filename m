Return-Path: <linux-media+bounces-281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E802E7EA104
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B8A280DB6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F3D22311;
	Mon, 13 Nov 2023 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V+dXfJmM"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022FD20B2D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:12:13 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F0010F4
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:12:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7698B29A;
	Mon, 13 Nov 2023 17:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699891906;
	bh=0H0SobTVWoMIt35IXmK4t2u4vxKWawLKprExuxq8Y7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+dXfJmMK+FuQrzwRbBowXVn5Dw4cHq1pKohDrKxBk+pSAGWQWhwImZMszUNvKqZY
	 NdZoy7SicCSRbrEcqjkmCjMrvgQ6JlbToi8HvQhHDHwhqTgnqza3qA0PsZJ4jBcb9j
	 N8C5DikJpmjFuQjcuFFbNsLaCUPtD/ZEll7XH9Pc=
Date: Mon, 13 Nov 2023 18:12:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v3 5/6] media: ccs: Better separate CCS static data access
Message-ID: <20231113161217.GI24338@pendragon.ideasonboard.com>
References: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
 <20231113160601.1427972-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113160601.1427972-6-sakari.ailus@linux.intel.com>

On Mon, Nov 13, 2023 at 06:06:00PM +0200, Sakari Ailus wrote:
> Separate CCS static data read-only register access in ccs-reg-access.c by
> naming them differently.
> 
> The code in this file generally deals with reading and writing registers
> where as static data (when it comes to ccs_static_data_read_ro_reg())
> contains the read-only register values but no hardware registers are
> accessed in that case.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-reg-access.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> index 25993445f4fe..03daaa8310a6 100644
> --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> @@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
>  	return 0;
>  }
>  
> -static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
> -			   u32 reg, u32 *val)
> +static int __ccs_static_data_read_ro_reg(struct ccs_reg *regs, size_t num_regs,
> +					 u32 reg, u32 *val)
>  {
>  	unsigned int width = ccs_reg_width(reg);
>  	size_t i;
> @@ -235,16 +235,17 @@ static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
>  	return -ENOENT;
>  }
>  
> -static int ccs_read_data(struct ccs_sensor *sensor, u32 reg, u32 *val)
> +static int
> +ccs_static_data_read_ro_reg(struct ccs_sensor *sensor, u32 reg, u32 *val)
>  {
> -	if (!__ccs_read_data(sensor->sdata.sensor_read_only_regs,
> -			     sensor->sdata.num_sensor_read_only_regs,
> -			     reg, val))
> +	if (!__ccs_static_data_read_ro_reg(sensor->sdata.sensor_read_only_regs,
> +					   sensor->sdata.num_sensor_read_only_regs,
> +					   reg, val))
>  		return 0;
>  
> -	return __ccs_read_data(sensor->mdata.module_read_only_regs,
> -			       sensor->mdata.num_module_read_only_regs,
> -			       reg, val);
> +	return __ccs_static_data_read_ro_reg(sensor->mdata.module_read_only_regs,
> +					     sensor->mdata.num_module_read_only_regs,
> +					     reg, val);
>  }
>  
>  static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
> @@ -253,7 +254,7 @@ static int ccs_read_addr_raw(struct ccs_sensor *sensor, u32 reg, u32 *val,
>  	int rval;
>  
>  	if (data) {
> -		rval = ccs_read_data(sensor, reg, val);
> +		rval = ccs_static_data_read_ro_reg(sensor, reg, val);
>  		if (!rval)
>  			return 0;
>  	}

-- 
Regards,

Laurent Pinchart

