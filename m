Return-Path: <linux-media+bounces-14742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571A92B392
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 11:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760621F227CF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 09:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03523154C17;
	Tue,  9 Jul 2024 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLO5nzIJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4693154434;
	Tue,  9 Jul 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516833; cv=none; b=iijyvuB8Lt03j8/01XgIEoVFz3ijYRSS7gRYFaQ90zEEdZiV9CjpN11squsOgrLC2HyibayuE0w+/G40IDp2ma5WKGLSbFZwRc32kcoX9ODMQpj9C/oCWFNlQ3ttfHo8tj+Rj/7RLHpoCyV/5hn9MSAQwzoFmB8zs1fwjHfFPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516833; c=relaxed/simple;
	bh=KW72D7hav3AsK5ikoKtbzZ2csQuu3qd4rgncp5nJL+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngvu0sMPjm/zdSjK5gLtf3vTlvZqAburL8U/gSCQuw3a8DHTs+qIKA8Vmse+R1GLDjIjaxxX6zqXSYoh2fFqDo2k4HkVbNjQiKbB/oYYUGqkvEwG+kG2mynJOpKJ+NlMEbrdqWHT2nXZDGpmfcCHHZbyD1KWY/FLf58DmN4Jx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLO5nzIJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a77bf336171so765559666b.1;
        Tue, 09 Jul 2024 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720516829; x=1721121629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dAxkqMxaMNpsmcS6THOuJoFLc+h20/WpSsVXIULLpGQ=;
        b=eLO5nzIJmy1YyXpBm7o0N4xvku5gOnTUYBgbedEVbIsjt8rsZ9IqGQOBAfoupbu+4X
         dFGjdob26uCAUm3L9Cs4q6z5qUVpgsIeLCJamalrgm2A173oyItYyMN/WnAOWQPl/mW/
         w5M5tUCofDNWdmsHhBUM00ntYU1iKptxsP4UfeWD1B8+gW/9Bga45fYJFKMzeUvjUnft
         8qQddMMhSAmZawTzXgUmuuIrFZg9AXZNPsM6BXyMKZ+S6EoX7gz7vjnC8It/B2f+TtvU
         vIt/7At6SJNIGOLrQiLakLyuaNByWqHQN+71n8sXp34XrJ2MBXIku+rBSIImG4Zyr6NO
         GDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720516829; x=1721121629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAxkqMxaMNpsmcS6THOuJoFLc+h20/WpSsVXIULLpGQ=;
        b=fvcGJcBof/tDPaCsl2dTRd7+jjNsP60Ld3ba5RKPb51vz/aNYDk5RXjaihYBlBXlJ1
         xdkasQZ58bEPxe+5AgN5adaGkb5ctAIKrEI6nWqYubq374JTHtIbATeW80TqajgpiRbE
         PC6b0pJbcrBOqfzp1miuabT28u30vrWGxbe9KBPRL6V3XCIG2NkaM+oOZX4icde43Ens
         GhC6MGHlu6D/SSConF7eejVMQcZj+CFltGbPWYPmnO6vH5C9AGaq7TSXRroVhZMIfw/z
         e5wK0QkTqsVOfYydXM7Qfnfkwew7UEluDcQCsvzZgDBYwZXFtxLZL+DF/VruY2eaqxcz
         ZCeg==
X-Forwarded-Encrypted: i=1; AJvYcCWqe/BUs1S191Ty5buh48fcp8WTc7gabsO3OSGYvnkPwrZRuisq9rfgqtUaXZdnefEqwj867/ahe1UsuHtIFWwkJJsEMZbhGNqoawLVkL9n2wj53gPSN1DTROpEODF+VEgpJWSOwxHPlY8=
X-Gm-Message-State: AOJu0YwpiRanIyFVYuibLX7kCLajUOC4ut17tcq0UDS4FqYjuhIkbwI/
	sh8MV2maGrLmJCliSOhOTdN8Op2btk3DIqC0eHPeTJik4YAqAlue
X-Google-Smtp-Source: AGHT+IFPVayPFrdRE6mKVlEq/flNx6L0/Z5xyUW0aofzopL8uL/sbiVbC92umTqnaHOCs/5KdrX7wQ==
X-Received: by 2002:a17:906:e20f:b0:a6f:dd93:7ffb with SMTP id a640c23a62f3a-a780d205b62mr113823766b.1.1720516829086;
        Tue, 09 Jul 2024 02:20:29 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-11.cust.vodafonedsl.it. [2.39.142.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc6c0sm61755466b.44.2024.07.09.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 02:20:28 -0700 (PDT)
Date: Tue, 9 Jul 2024 11:20:26 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	20240627151806.3999400-2-tomm.merciai@gmail.com
Subject: Re: [PATCH v2 1/2] media: i2c: max96717: coding style fixes
Message-ID: <Zo0A2nVMQt49G0U3@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240701-gmsl2-drivers-style-fixup-v2-0-6b02bd6c1e41@collabora.com>
 <20240701-gmsl2-drivers-style-fixup-v2-1-6b02bd6c1e41@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-gmsl2-drivers-style-fixup-v2-1-6b02bd6c1e41@collabora.com>

Hi Julien,
Sorry for delay on reviewing/testing this.

On Mon, Jul 01, 2024 at 11:31:42AM +0200, Julien Massot wrote:
> Coding style fixes suggested by Sakari during the
> driver review.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/i2c/max96717.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 859a439b64d9..4e85b8eb1e77 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -25,6 +25,7 @@
>  #define MAX96717_PORTS      2
>  #define MAX96717_PAD_SINK   0
>  #define MAX96717_PAD_SOURCE 1
> +#define MAX96717_CSI_NLANES 4
>  
>  #define MAX96717_DEFAULT_CLKOUT_RATE	24000000UL
>  
> @@ -495,7 +496,6 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
>  				   u64 streams_mask)
>  {
>  	struct max96717_priv *priv = sd_to_max96717(sd);
> -	struct device *dev = &priv->client->dev;
>  	u64 sink_streams;
>  	int ret;
>  
> @@ -516,11 +516,8 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
>  		ret = v4l2_subdev_enable_streams(priv->source_sd,
>  						 priv->source_sd_pad,
>  						 sink_streams);
> -		if (ret) {
> -			dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> -				sink_streams);
> +		if (ret)
>  			goto stop_csi;
> -		}
>  	}
>  
>  	priv->enabled_source_streams |= streams_mask;
> @@ -530,6 +527,7 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
>  stop_csi:
>  	if (!priv->enabled_source_streams)
>  		max96717_start_csi(priv, false);
> +
>  	return ret;
>  }
>  
> @@ -769,11 +767,8 @@ max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
>  						 unsigned long rate)
>  {
> -	unsigned int i, idx;
> -	unsigned long diff_new, diff_old;
> -
> -	diff_old = U32_MAX;
> -	idx = 0;
> +	unsigned int i, idx = 0;
> +	unsigned long diff_new, diff_old = U32_MAX;
>  
>  	for (i = 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
>  		diff_new = abs(rate - max96717_predef_freqs[i].freq);
> @@ -860,8 +855,7 @@ static int max96717_register_clkout(struct max96717_priv *priv)
>  	struct clk_init_data init = { .ops = &max96717_clk_ops };
>  	int ret;
>  
> -	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out",
> -			      dev_name(dev));
> +	init.name = kasprintf(GFP_KERNEL, "max96717.%s.clk_out", dev_name(dev));
>  	if (!init.name)
>  		return -ENOMEM;
>  
> @@ -944,8 +938,9 @@ static int max96717_init_csi_lanes(struct max96717_priv *priv)
>  	 * Unused lanes need to be mapped as well to not have
>  	 * the same lanes mapped twice.
>  	 */
> -	for (; lane < 4; lane++) {
> -		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
> +	for (; lane < MAX96717_CSI_NLANES; lane++) {
> +		unsigned int idx = find_first_zero_bit(&lanes_used,
> +						       MAX96717_CSI_NLANES);
>  
>  		val |= idx << (lane * 2);
>  		lanes_used |= BIT(idx);
> @@ -999,9 +994,7 @@ static int max96717_hw_init(struct max96717_priv *priv)
>  static int max96717_parse_dt(struct max96717_priv *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> -	struct v4l2_fwnode_endpoint vep = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY
> -	};
> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	struct fwnode_handle *ep_fwnode;
>  	unsigned char num_data_lanes;
>  	int ret;
> @@ -1019,11 +1012,11 @@ static int max96717_parse_dt(struct max96717_priv *priv)
>  		return dev_err_probe(dev, ret, "Failed to parse sink endpoint");
>  
>  	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> -	if (num_data_lanes < 1 || num_data_lanes > 4)
> +	if (num_data_lanes < 1 || num_data_lanes > MAX96717_CSI_NLANES)
>  		return dev_err_probe(dev, -EINVAL,
>  				     "Invalid data lanes must be 1 to 4\n");
>  
> -	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
> +	priv->mipi_csi2 = vep.bus.mipi_csi2;
>  
>  	return 0;
>  }
> 
> -- 
> 2.45.2
> 

Patch looks good to me. I tested this on my gmsl2 alvium and all is working fine.

Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks & Regards,
Tommaso

