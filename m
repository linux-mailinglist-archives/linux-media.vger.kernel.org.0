Return-Path: <linux-media+bounces-7077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91587BF65
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 603851C2167D
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FDE71735;
	Thu, 14 Mar 2024 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Estxu1b8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784B029CE3
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428331; cv=none; b=AeHtR6giOM+o+nTkm67VI5EtnxVQetdDWfzxbkmeGZADaqWmALkIzhk4JRA4e7pAGbB9CVr72+5uq5KBjQrVMHOi9VVWfwtcuIt9/CbxFqDWIgllQnlcgDaW/LxJLKH+if1NSOCjf3zFJmjuWfpXZ6kBd9G58vtmGKEvpKr2P+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428331; c=relaxed/simple;
	bh=8nYR7HbAeI42sF0e2/896dK2YIDiMgk3CavpLol7FUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjsBMFnJVItD/vFZ2u7Xp8UYzlsRqPakDkfL8zyMXEw4xyiLl87I2pG/01SKlOJd0bXiev7XM0X/gbuJF4hFy/EwpsBaZLgvv4rzFXWZ2W430TiKRIDAcLdH867FshPE8FBp5HJZyxT25TsV08DiTg82FCvQYrrZuPk3jaTnU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Estxu1b8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-568a3292916so776637a12.1
        for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710428328; x=1711033128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vdS7iEv6DKEi+jrBH8CsMMrnKrsgDuFpBcBnlox9NU=;
        b=Estxu1b8YTfVXWaG69ydk/YdyWB2Xu/wf0CEkLJNCYTutr/F9msmgPLrRzD0wLbCHf
         hqxcWtt+G+EbWqS5hPU5DtSOAZjwzo1rUjEq1HIjSgRxBJfhoEYqRBBLKk71m9TYjACK
         DlDKrQgnCpDeKnKRwJW5iHI5ffzh0nkXHuPFSJqYbyuzYBEHRQanbWEcbmt++tel3hU+
         +ztWpaF8cd++RU3cMmNJuHjLXyWx0wMyMDTiYEtgWT23RoErVT4GjNkylNlOIe2BtyVY
         kkE9DRafc6aXOaLTISXxTZoq38C0j4JLxpsmPMYmlDO3aXGEsYU7YINCJZpOnk6uE767
         6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710428328; x=1711033128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vdS7iEv6DKEi+jrBH8CsMMrnKrsgDuFpBcBnlox9NU=;
        b=NqhZRQ2NIjD8bfSjrdLjDJ6IJgFQ63c5j0fj/GAh7JJ4ISxBGKCmV4gx1vXgnOtDmc
         dJiPWlGq0JfierAiRl9iOwlxIprfKO4rM9cy3J7DWGbPbpt8Na9ZWFw8rn4CfrDo7CXY
         v8Z35ykmCb0WqUu+Kw2+/+FYlUW6nHHIAmFZPMkg+dmp3jk6uVKTufmk4yjfZhxACzXP
         4Sz044gRlyaIwas6V5KoeGcFa/73I+h8PZLTtif2vnVP8o/hyuzhJ1KkgNLDFe/s6fVd
         ut0jRjU3J2wgY1rMc/PWdiyaQU4l9pgdtmOlXIkI5UCBDY8p9yLyQ/Rvcdc929YZU1wa
         VMCA==
X-Gm-Message-State: AOJu0YwJYdI/7xI1bbL5sIrajewi0uVkC+ENndET4MVYefHod7hyAj08
	VDrj6d3GnV+Q5bx5VecAMpWopdwgYAYk+AKhiPF3Kqg2Kc8W65hz6AL3lDzax28=
X-Google-Smtp-Source: AGHT+IH8EOYBu3bU0nzab5soZjGgJIvDY7z8PqyJjNkBPQcD/7hqog/d37ou8s0aD9Gpf7qkSg41VQ==
X-Received: by 2002:a05:6402:3895:b0:568:24dd:3ec6 with SMTP id fd21-20020a056402389500b0056824dd3ec6mr1216196edb.19.1710428327375;
        Thu, 14 Mar 2024 07:58:47 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-49-82.cust.vodafonedsl.it. [188.217.49.82])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7cf09000000b0056671c5c1a1sm786330edy.80.2024.03.14.07.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:58:46 -0700 (PDT)
Date: Thu, 14 Mar 2024 15:58:44 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	sakari.ailus@linux.intel.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Message-ID: <ZfMQpPyRrLAiRk6I@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>

Hi Umang,

On Thu, Mar 14, 2024 at 06:51:04PM +0530, Umang Jain wrote:
> Hi Tommaso,
> 
> On 11/03/24 5:05 pm, Tommaso Merciai wrote:
> > Hi Umang,
> > Thanks for the patch.
> > 
> > On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
> > > Drop dev_err() and use the dev_err_probe() helper on probe path.
> > > 
> > > No functional changes intended.
> > > 
> > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
> > >   1 file changed, 32 insertions(+), 32 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index e17ef2e9d9d0..acd27e2ef849 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
> > >   	if (ctrl_hdlr->error) {
> > >   		ret = ctrl_hdlr->error;
> > > -		dev_err(&client->dev, "%s control init failed (%d)\n",
> > > -			__func__, ret);
> > > +		dev_err_probe(&client->dev, ret,
> > > +			      "%s control init failed\n",
> > > +			      __func__);
> > >   		goto error;
> > >   	}
> > > @@ -1025,15 +1026,15 @@ static int imx219_identify_module(struct imx219 *imx219)
> > >   	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > >   	if (ret) {
> > > -		dev_err(&client->dev, "failed to read chip id %x\n",
> > > -			IMX219_CHIP_ID);
> > > -		return ret;
> > > +		return dev_err_probe(&client->dev, ret,
> > > +				     "failed to read chip id %x\n",
> > > +				     IMX219_CHIP_ID);
> > >   	}
> > I think you can remove also here the curve brakets we don't need that
> > anymore.
> 
> I think multi-line single statement like this one, is better with { ... }
> and is actually preferred?

Yep, some driver is using your pattern some other not.
I'm curious about the truth :) (for my education :))

> 
> I actually got a review-comment about this long ago(don't remember when) in
> a non-related, kernel patch series.
> 
> I'll leaving this upto maintainers probably

Oks, thanks for sharing!

Regards,
Tommaso

> > 
> > >   	if (val != IMX219_CHIP_ID) {
> > > -		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
> > > -			IMX219_CHIP_ID, val);
> > > -		return -EIO;
> > > +		return dev_err_probe(&client->dev, -EIO,
> > > +				     "chip id mismatch: %x!=%llx\n",
> > > +				     IMX219_CHIP_ID, val);
> > >   	}
> > ditto
> > 
> > >   	return 0;
> > > @@ -1048,35 +1049,36 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> > >   	int ret = -EINVAL;
> > >   	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > > -	if (!endpoint) {
> > > -		dev_err(dev, "endpoint node not found\n");
> > > -		return -EINVAL;
> > > -	}
> > > +	if (!endpoint)
> > > +		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> > >   	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > > -		dev_err(dev, "could not parse endpoint\n");
> > > +		dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
> > >   		goto error_out;
> > >   	}
> > >   	/* Check the number of MIPI CSI2 data lanes */
> > >   	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> > >   	    ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> > > -		dev_err(dev, "only 2 or 4 data lanes are currently supported\n");
> > > +		dev_err_probe(dev, -EINVAL,
> > > +			      "only 2 or 4 data lanes are currently supported\n");
> > >   		goto error_out;
> > >   	}
> > >   	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
> > >   	/* Check the link frequency set in device tree */
> > >   	if (!ep_cfg.nr_of_link_frequencies) {
> > > -		dev_err(dev, "link-frequency property not found in DT\n");
> > > +		dev_err_probe(dev, -EINVAL,
> > > +			      "link-frequency property not found in DT\n");
> > >   		goto error_out;
> > >   	}
> > >   	if (ep_cfg.nr_of_link_frequencies != 1 ||
> > >   	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
> > >   	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> > > -		dev_err(dev, "Link frequency not supported: %lld\n",
> > > -			ep_cfg.link_frequencies[0]);
> > > +		dev_err_probe(dev, -EINVAL,
> > > +			      "Link frequency not supported: %lld\n",
> > > +			      ep_cfg.link_frequencies[0]);
> > >   		goto error_out;
> > >   	}
> > > @@ -1108,30 +1110,27 @@ static int imx219_probe(struct i2c_client *client)
> > >   	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
> > >   	if (IS_ERR(imx219->regmap)) {
> > > -		ret = PTR_ERR(imx219->regmap);
> > > -		dev_err(dev, "failed to initialize CCI: %d\n", ret);
> > > -		return ret;
> > > +		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
> > > +				     "failed to initialize CCI\n");
> > >   	}
> > ditto
> > 
> > >   	/* Get system clock (xclk) */
> > >   	imx219->xclk = devm_clk_get(dev, NULL);
> > >   	if (IS_ERR(imx219->xclk)) {
> > > -		dev_err(dev, "failed to get xclk\n");
> > > -		return PTR_ERR(imx219->xclk);
> > > +		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
> > > +				     "failed to get xclk\n");
> > >   	}
> > ditto
> > 
> > >   	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> > >   	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> > > -		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > -			imx219->xclk_freq);
> > > -		return -EINVAL;
> > > +		return dev_err_probe(dev, -EINVAL,
> > > +				     "xclk frequency not supported: %d Hz\n",
> > > +				     imx219->xclk_freq);
> > >   	}
> > ditto
> > 
> > >   	ret = imx219_get_regulators(imx219);
> > > -	if (ret) {
> > > -		dev_err(dev, "failed to get regulators\n");
> > > -		return ret;
> > > -	}
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> > >   	/* Request optional enable pin */
> > >   	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > @@ -1183,20 +1182,21 @@ static int imx219_probe(struct i2c_client *client)
> > >   	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
> > >   	if (ret) {
> > > -		dev_err(dev, "failed to init entity pads: %d\n", ret);
> > > +		dev_err_probe(dev, ret, "failed to init entity pads\n");
> > >   		goto error_handler_free;
> > >   	}
> > >   	imx219->sd.state_lock = imx219->ctrl_handler.lock;
> > >   	ret = v4l2_subdev_init_finalize(&imx219->sd);
> > >   	if (ret < 0) {
> > > -		dev_err(dev, "subdev init error: %d\n", ret);
> > > +		dev_err_probe(dev, ret, "subdev init error\n");
> > >   		goto error_media_entity;
> > >   	}
> > >   	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
> > >   	if (ret < 0) {
> > > -		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
> > > +		dev_err_probe(dev, ret,
> > > +			      "failed to register sensor sub-device\n");
> > >   		goto error_subdev_cleanup;
> > >   	}
> > > -- 
> > > 2.43.0
> > Thanks & Regards,
> > Tommaso
> > 
> > > 
> 

