Return-Path: <linux-media+bounces-18529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBB984E09
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 00:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 489581C23645
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 22:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213AA1ACDEE;
	Tue, 24 Sep 2024 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NQQxrwwx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FD1AB51F;
	Tue, 24 Sep 2024 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217875; cv=none; b=h3EB/biPxyBOXhQjoXjhXmhpd0VNrQe1zaubco6wE6Teape1fApX9Shqs/9r2LP0ZCkwj8jX965yZWz9e3YKr42NHhr/VxiBXRVa8nva2qs38rCgAG1MJKngKWr4ZJ2Rwg6TEN8ZLeKLQWytdO4KboJ/i67maT2o3z0YRkezrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217875; c=relaxed/simple;
	bh=Nh4w8B6OrEr7+CcT9Eop5Nj8fyiVYtJx2YEeu4hbTsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzsIKs11QusTFX6cheBB1pfA2TE0WI/F/SgF8fG5u6js78vzv9Wt/oVhminyGRIybrBMnOpmJ2ccGj25EuzMGdUZ9eQNG/Z7Gn7R4KYElBW6rTwztM8IiJavj7fQYi3sAArOXehjjTtj26rGbuvNXa5ISyik2wHMIOVK1FSI/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NQQxrwwx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FA07E2;
	Wed, 25 Sep 2024 00:43:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727217784;
	bh=Nh4w8B6OrEr7+CcT9Eop5Nj8fyiVYtJx2YEeu4hbTsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQQxrwwxfRiQe5KhndbrzADSz7monTfQ1UPb2Rbh6Tjnmst0grN+lt1s88orN5/Ok
	 gkpXo9Wy0IdpbDp7VrGle6HjEg8UwWQLcvj0xRB3xbOCqHqcgfF1qPCbxgs4hWUz/9
	 qvw+iCUYYmvOLqrkQkvVQZpdxkMFSWa0eEFPuTzY=
Date: Wed, 25 Sep 2024 01:43:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 04/11] media: i2c: ov5645: Use dev_err_probe instead
 of dev_err
Message-ID: <20240924224357.GM7165@pendragon.ideasonboard.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910170610.226189-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:06:03PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Drop dev_err() and use the dev_err_probe() helper on probe path.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 74 +++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 78b86438c798..9e6ff1f1b9ac 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1076,51 +1076,37 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->dev = dev;
>  
>  	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> -	if (!endpoint) {
> -		dev_err(dev, "endpoint node not found\n");
> -		return -EINVAL;
> -	}
> +	if (!endpoint)
> +		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
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
> +		return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
>  
> -	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> -		dev_err(dev, "invalid bus type, must be CSI2\n");
> -		return -EINVAL;
> -	}
> +	if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
> +		return dev_err_probe(dev, -EINVAL, "invalid bus type, must be CSI2\n");
>  
>  	/* get system clock (xclk) */
>  	ov5645->xclk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ov5645->xclk)) {
> -		dev_err(dev, "could not get xclk");
> -		return PTR_ERR(ov5645->xclk);
> -	}
> +	if (IS_ERR(ov5645->xclk))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->xclk), "could not get xclk");
>  
>  	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "could not get xclk frequency\n");
>  
>  	/* external clock must be 24MHz, allow 1% tolerance */
> -	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> -		dev_err(dev, "external clock frequency %u is not supported\n",
> -			xclk_freq);
> -		return -EINVAL;
> -	}
> +	if (xclk_freq < 23760000 || xclk_freq > 24240000)
> +		return dev_err_probe(dev, -EINVAL, "external clock frequency %u is not supported\n",
> +				     xclk_freq);
>  
>  	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "could not set xclk frequency\n");
>  
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];
> @@ -1131,16 +1117,12 @@ static int ov5645_probe(struct i2c_client *client)
>  		return ret;
>  
>  	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> -	if (IS_ERR(ov5645->enable_gpio)) {
> -		dev_err(dev, "cannot get enable gpio\n");
> -		return PTR_ERR(ov5645->enable_gpio);
> -	}
> +	if (IS_ERR(ov5645->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio), "cannot get enable gpio\n");

Those lines are getting long. We usually try to wrap at 80 columns for
sensor drivers:

		return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio),
				     "cannot get enable gpio\n");

Same elsewhere. I'll let Sakari decide.

>  
>  	ov5645->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(ov5645->rst_gpio)) {
> -		dev_err(dev, "cannot get reset gpio\n");
> -		return PTR_ERR(ov5645->rst_gpio);
> -	}
> +	if (IS_ERR(ov5645->rst_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "cannot get reset gpio\n");
>  
>  	mutex_init(&ov5645->power_lock);
>  
> @@ -1177,9 +1159,9 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->sd.ctrl_handler = &ov5645->ctrls;
>  
>  	if (ov5645->ctrls.error) {
> -		dev_err(dev, "%s: control initialization error %d\n",
> -		       __func__, ov5645->ctrls.error);
>  		ret = ov5645->ctrls.error;
> +		dev_err_probe(dev, ret, "%s: control initialization error %d\n",
> +			      __func__, ov5645->ctrls.error);
>  		goto free_ctrl;
>  	}
>  
> @@ -1192,7 +1174,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
>  	if (ret < 0) {
> -		dev_err(dev, "could not register media entity\n");
> +		dev_err_probe(dev, ret, "could not register media entity\n");
>  		goto free_ctrl;
>  	}
>  
> @@ -1202,14 +1184,14 @@ static int ov5645_probe(struct i2c_client *client)
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
> @@ -1218,24 +1200,24 @@ static int ov5645_probe(struct i2c_client *client)
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
> @@ -1243,7 +1225,7 @@ static int ov5645_probe(struct i2c_client *client)
>  
>  	ret = v4l2_async_register_subdev(&ov5645->sd);
>  	if (ret < 0) {
> -		dev_err(dev, "could not register v4l2 device\n");
> +		dev_err_probe(dev, ret, "could not register v4l2 device\n");
>  		goto power_down;
>  	}
>  

The probe function looks really young, I think it would benefit from
being broken down in multiple functions.

-- 
Regards,

Laurent Pinchart

