Return-Path: <linux-media+bounces-19945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B59A575B
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ACE1B21A72
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9047A198A22;
	Sun, 20 Oct 2024 22:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YQZjGCpk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB6440C;
	Sun, 20 Oct 2024 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729463590; cv=none; b=RFC22Nno3k2I4B0rtgAZ4w7bJTaYHGCwMinBfUwX9EuYOdunqOroxsSCl8r+KyqwIk8MpdyLre8mtCN3Wt1qS4+Kp2sqqzufBXpVZROh3JWMEeXbdQInMMW0lJ+TEUERZsxkpA6cyGhDU8rjOJH34akle8iHTANuauIXO9WRRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729463590; c=relaxed/simple;
	bh=NqL/RqKWZLPioK03xgIwuUNSNcnm0YbSBNMS3AiuEPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNkyBnnm8M9O+piFwSfV+aofpJ7B5CA256/3zelOh6x4SEBwVs+UG1iAFOwaetaHAFj9oyyFi/LCR41ew5hQ7ltU4Rw9ELgphfXbK5i0jIcWlVW1dkCpIE3ruQyCN8UhFQFrQHLHlvf4bG20UJKZkLG6abhRO/D2uD8PH14hl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YQZjGCpk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E3FC4CF;
	Mon, 21 Oct 2024 00:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729463481;
	bh=NqL/RqKWZLPioK03xgIwuUNSNcnm0YbSBNMS3AiuEPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQZjGCpk0+i+f9MNG9LqgG6O5bI916fso0V911xafXlzCMEirR17GmA004rzUdqMl
	 LTnGSdZMBPl8Tjh/LrbmJ3f/UmsLAygdr71o67cQQf5aU6SeluAAh30ecDBluAC6fd
	 SgkRViZNfzfNU+MudA8/bYUCYJRfzIb9+X6HUjjo=
Date: Mon, 21 Oct 2024 01:33:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 03/10] media: i2c: ov5645: Replace dev_err with
 dev_err_probe in probe function
Message-ID: <20241020223301.GA14328@pendragon.ideasonboard.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241018153230.235647-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, Oct 18, 2024 at 04:32:23PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor error handling in the ov5645_probe() function by replacing
> multiple dev_err() calls with dev_err_probe().
> 
> - Note that during this process, the error string "external clock
>   frequency %u is not supported" was replaced with "unsupported xclk
>   frequency %u" to ensure it wraps at 80 columns.
> - Additionally, the error string for control initialization failure was
>   changed from "%s: control initialization error %d\n" to "failed to add
>   controls\n" as there is no need to print the function name and error code
>   in the string, since dev_err_probe() already provides this information.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5645.c | 82 +++++++++++++++++---------------------
>  1 file changed, 36 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index d344d3447a95..520afd3d2aa3 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1076,51 +1076,44 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->dev = dev;
>  
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> -	if (!endpoint) {
> -		dev_err(dev, "endpoint node not found\n");
> -		return -EINVAL;
> -	}
> +	if (!endpoint)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "endpoint node not found\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
>  					 &ov5645->ep);
>  
>  	of_node_put(endpoint);
>  
> -	if (ret < 0) {
> -		dev_err(dev, "parsing endpoint node failed\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "parsing endpoint node failed\n");
>  
> -	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "invalid bus type, must be CSI2\n");
> -		return -EINVAL;
> -	}
> +	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid bus type, must be CSI2\n");
>  
>  	/* get system clock (xclk) */
>  	ov5645->xclk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ov5645->xclk)) {
> -		dev_err(dev, "could not get xclk");
> -		return PTR_ERR(ov5645->xclk);
> -	}
> +	if (IS_ERR(ov5645->xclk))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->xclk),
> +				     "could not get xclk");
>  
>  	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "could not get xclk frequency\n");
>  
>  	/* external clock must be 24MHz, allow 1% tolerance */
> -	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> -		dev_err(dev, "external clock frequency %u is not supported\n",
> -			xclk_freq);
> -		return -EINVAL;
> -	}
> +	if (xclk_freq < 23760000 || xclk_freq > 24240000)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "unsupported xclk frequency %u\n",
> +				     xclk_freq);
>  
>  	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "could not set xclk frequency\n");
>  
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];
> @@ -1131,16 +1124,14 @@ static int ov5645_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> -	if (IS_ERR(ov5645->enable_gpio)) {
> -		dev_err(dev, "cannot get enable gpio\n");
> -		return PTR_ERR(ov5645->enable_gpio);
> -	}
> +	if (IS_ERR(ov5645->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio),
> +				     "cannot get enable gpio\n");
>  
>  	ov5645->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(ov5645->rst_gpio)) {
> -		dev_err(dev, "cannot get reset gpio\n");
> -		return PTR_ERR(ov5645->rst_gpio);
> -	}
> +	if (IS_ERR(ov5645->rst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio),
> +				     "cannot get reset gpio\n");
>  
>  	mutex_init(&ov5645->power_lock);
>  
> @@ -1177,9 +1168,8 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->sd.ctrl_handler = &ov5645->ctrls;
>  
>  	if (ov5645->ctrls.error) {
> -		dev_err(dev, "%s: control initialization error %d\n",
> -		       __func__, ov5645->ctrls.error);
>  		ret = ov5645->ctrls.error;
> +		dev_err_probe(dev, ret, "failed to add controls\n");
>  		goto free_ctrl;
>  	}
>  
> @@ -1193,7 +1183,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
>  	if (ret < 0) {
> -		dev_err(dev, "could not register media entity\n");
> +		dev_err_probe(dev, ret, "could not register media entity\n");
>  		goto free_ctrl;
>  	}
>  
> @@ -1203,14 +1193,14 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_high);
>  	if (ret < 0 || chip_id_high != OV5645_CHIP_ID_HIGH_BYTE) {
> -		dev_err(dev, "could not read ID high\n");
>  		ret = -ENODEV;
> +		dev_err_probe(dev, ret, "could not read ID high\n");
>  		goto power_down;
>  	}
>  	ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low);
>  	if (ret < 0 || chip_id_low != OV5645_CHIP_ID_LOW_BYTE) {
> -		dev_err(dev, "could not read ID low\n");
>  		ret = -ENODEV;
> +		dev_err_probe(dev, ret, "could not read ID low\n");
>  		goto power_down;
>  	}
>  
> @@ -1219,24 +1209,24 @@ static int ov5645_probe(struct i2c_client *client)
>  	ret = ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
>  			      &ov5645->aec_pk_manual);
>  	if (ret < 0) {
> -		dev_err(dev, "could not read AEC/AGC mode\n");
>  		ret = -ENODEV;
> +		dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
>  		goto power_down;
>  	}
>  
>  	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
>  			      &ov5645->timing_tc_reg20);
>  	if (ret < 0) {
> -		dev_err(dev, "could not read vflip value\n");
>  		ret = -ENODEV;
> +		dev_err_probe(dev, ret, "could not read vflip value\n");
>  		goto power_down;
>  	}
>  
>  	ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
>  			      &ov5645->timing_tc_reg21);
>  	if (ret < 0) {
> -		dev_err(dev, "could not read hflip value\n");
>  		ret = -ENODEV;
> +		dev_err_probe(dev, ret, "could not read hflip value\n");
>  		goto power_down;
>  	}
>  
> @@ -1248,7 +1238,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ret = v4l2_async_register_subdev(&ov5645->sd);
>  	if (ret < 0) {
> -		dev_err(dev, "could not register v4l2 device\n");
> +		dev_err_probe(dev, ret, "could not register v4l2 device\n");
>  		goto err_pm_runtime;
>  	}
>  

-- 
Regards,

Laurent Pinchart

