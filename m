Return-Path: <linux-media+bounces-6809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929D877F1A
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 12:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB76283D2E
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 11:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582943B794;
	Mon, 11 Mar 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpMqnHEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037903A1CD
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710156939; cv=none; b=HZbd1tXCByNPgf8+7kpvifsfn7uT/syU7BF+j7mHLsd0Q8z9XR1bZMFZ4DB5+F/9qV4wYCEnmgTlaHgCPi5iBUIFNQmwf5g9xX2ms2SIMhQuhbZqJFEs/EKIvcOv1L2pOy5IV+WXoMRBFYM88YS+BGyVXc/50vet5zlkeWMvU8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710156939; c=relaxed/simple;
	bh=h0yobWQyftM/NNxEmNB/LCHJ+/I+pwqoHDLoOibZRAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcXxaYoDl4LtKraGUix5cLYdHrBv3M4tFFl+EvCvhgFmqj9yL/Ax97JunfseX69mbDuCF6wl9nIDqQl2wD3nrzwFseSJzlkdUxl8Xn1V4Pon5dpcgkMOnhSebeSwJnioVvcVJ1/aRBCQfJrwxAWArRJPjPHXMX2Hbdj1ryP6064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpMqnHEg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33e93514a6aso649652f8f.1
        for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710156936; x=1710761736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60KPGdGPlkD64tX317tsyohxUc6XQiy447S1QUV0V8s=;
        b=bpMqnHEgheUs3ZrQJLsZQlPRMmw0h80ALGWPeGmIugn26xqIMYio29dr02JZpPhtR5
         aGxU60vV57tzyQblDPkgZoOpTPrP1lpNT5eejzyPuV/I5IyVin9dQWvyLF3mvj5Sdc03
         zbeqSXh8ZsrnErqpQHS3pJ3M3WtsbaPrJwjU5HqcuFK/dZ4yKBFF7MuiNifJf77+Y6Xx
         3VPDFBbhDb2nP66iKXE2cAv9baiBXyT0qNgR5R6BN+i1hBLkB1jyc5cw4LWubgaZNCP5
         PkIm1NgzoOxlXOKjOLNw+bwWecXX2H96s4lPWABFAs3IqX4b/gj6ZbdJ3bZDWa7v4WjI
         cUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156936; x=1710761736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60KPGdGPlkD64tX317tsyohxUc6XQiy447S1QUV0V8s=;
        b=hDivL/VYsT+Kvaw/pH4qRN8PpxusHeXQ+SfWDtaA90TYF6aO8TfxJRHCvfdPP1fmi4
         y29wRb2sRwmfwwoyjabqtUuSKLQRLzMd+R8JcCxvrIPRjco9SAz2t8s4ve3YEWHOv2Qx
         Vze/FJBAqACG7jEwxWI2WYr+XSti+NEB5JXHBbhmB8cWCFZ977jY7IbqCEd88xle38Zw
         YsCMC8aIatZLj975eEfz9nVyKv6RjA6IBdd+zrvoVHsN+QKryIbqLlbxeiNipw20ySlC
         EHVzyN7bGfueXnKte+jNtq+h3hU9pzd8OdQht+Jh4FJ01Y1NZngo6KI7lX4YnwEJnrDa
         u5/Q==
X-Gm-Message-State: AOJu0Yz98uXeiWlXhdvmsHJa+TlDv0tpZy+KVjV0OVaHtejvWG7syneH
	r45h3901KcxGYRgd4BB/th/rjfs8z6JtQDYSycNmBOmv5E0PpwS2jAhx5AR1+08=
X-Google-Smtp-Source: AGHT+IH0pMbMCr4Uxmu1wLQ7FkXsuF2EMAtdWHp6Kw9G0NeQN3M93LJaVLxfrButFq09okz2cOC9Pg==
X-Received: by 2002:a5d:64a2:0:b0:33b:187c:4ca0 with SMTP id m2-20020a5d64a2000000b0033b187c4ca0mr4736746wrp.62.1710156935956;
        Mon, 11 Mar 2024 04:35:35 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
        by smtp.gmail.com with ESMTPSA id by19-20020a056000099300b0033e8c50fc3fsm4084411wrb.90.2024.03.11.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:35:35 -0700 (PDT)
Date: Mon, 11 Mar 2024 12:35:33 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	sakari.ailus@linux.intel.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Message-ID: <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311090042.30280-1-umang.jain@ideasonboard.com>

Hi Umang,
Thanks for the patch.

On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
> Drop dev_err() and use the dev_err_probe() helper on probe path.
> 
> No functional changes intended.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e17ef2e9d9d0..acd27e2ef849 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
>  
>  	if (ctrl_hdlr->error) {
>  		ret = ctrl_hdlr->error;
> -		dev_err(&client->dev, "%s control init failed (%d)\n",
> -			__func__, ret);
> +		dev_err_probe(&client->dev, ret,
> +			      "%s control init failed\n",
> +			      __func__);
>  		goto error;
>  	}
>  
> @@ -1025,15 +1026,15 @@ static int imx219_identify_module(struct imx219 *imx219)
>  
>  	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
>  	if (ret) {
> -		dev_err(&client->dev, "failed to read chip id %x\n",
> -			IMX219_CHIP_ID);
> -		return ret;
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read chip id %x\n",
> +				     IMX219_CHIP_ID);
>  	}

I think you can remove also here the curve brakets we don't need that
anymore.

>  
>  	if (val != IMX219_CHIP_ID) {
> -		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
> -			IMX219_CHIP_ID, val);
> -		return -EIO;
> +		return dev_err_probe(&client->dev, -EIO,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     IMX219_CHIP_ID, val);
>  	}

ditto

>  
>  	return 0;
> @@ -1048,35 +1049,36 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  	int ret = -EINVAL;
>  
>  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> -	if (!endpoint) {
> -		dev_err(dev, "endpoint node not found\n");
> -		return -EINVAL;
> -	}
> +	if (!endpoint)
> +		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
>  	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> -		dev_err(dev, "could not parse endpoint\n");
> +		dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
>  		goto error_out;
>  	}
>  
>  	/* Check the number of MIPI CSI2 data lanes */
>  	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
>  	    ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> -		dev_err(dev, "only 2 or 4 data lanes are currently supported\n");
> +		dev_err_probe(dev, -EINVAL,
> +			      "only 2 or 4 data lanes are currently supported\n");
>  		goto error_out;
>  	}
>  	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
>  
>  	/* Check the link frequency set in device tree */
>  	if (!ep_cfg.nr_of_link_frequencies) {
> -		dev_err(dev, "link-frequency property not found in DT\n");
> +		dev_err_probe(dev, -EINVAL,
> +			      "link-frequency property not found in DT\n");
>  		goto error_out;
>  	}
>  
>  	if (ep_cfg.nr_of_link_frequencies != 1 ||
>  	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
>  	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> -		dev_err(dev, "Link frequency not supported: %lld\n",
> -			ep_cfg.link_frequencies[0]);
> +		dev_err_probe(dev, -EINVAL,
> +			      "Link frequency not supported: %lld\n",
> +			      ep_cfg.link_frequencies[0]);
>  		goto error_out;
>  	}
>  
> @@ -1108,30 +1110,27 @@ static int imx219_probe(struct i2c_client *client)
>  
>  	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
>  	if (IS_ERR(imx219->regmap)) {
> -		ret = PTR_ERR(imx219->regmap);
> -		dev_err(dev, "failed to initialize CCI: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
> +				     "failed to initialize CCI\n");
>  	}

ditto

>  
>  	/* Get system clock (xclk) */
>  	imx219->xclk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(imx219->xclk)) {
> -		dev_err(dev, "failed to get xclk\n");
> -		return PTR_ERR(imx219->xclk);
> +		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> +				     "failed to get xclk\n");
>  	}

ditto

>  
>  	imx219->xclk_freq = clk_get_rate(imx219->xclk);
>  	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> -		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> -			imx219->xclk_freq);
> -		return -EINVAL;
> +		return dev_err_probe(dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",
> +				     imx219->xclk_freq);
>  	}

ditto

>  
>  	ret = imx219_get_regulators(imx219);
> -	if (ret) {
> -		dev_err(dev, "failed to get regulators\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
>  
>  	/* Request optional enable pin */
>  	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> @@ -1183,20 +1182,21 @@ static int imx219_probe(struct i2c_client *client)
>  
>  	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
>  	if (ret) {
> -		dev_err(dev, "failed to init entity pads: %d\n", ret);
> +		dev_err_probe(dev, ret, "failed to init entity pads\n");
>  		goto error_handler_free;
>  	}
>  
>  	imx219->sd.state_lock = imx219->ctrl_handler.lock;
>  	ret = v4l2_subdev_init_finalize(&imx219->sd);
>  	if (ret < 0) {
> -		dev_err(dev, "subdev init error: %d\n", ret);
> +		dev_err_probe(dev, ret, "subdev init error\n");
>  		goto error_media_entity;
>  	}
>  
>  	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
>  	if (ret < 0) {
> -		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> +		dev_err_probe(dev, ret,
> +			      "failed to register sensor sub-device\n");
>  		goto error_subdev_cleanup;
>  	}
>  
> -- 
> 2.43.0

Thanks & Regards,
Tommaso

> 
> 

