Return-Path: <linux-media+bounces-14441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3491D880
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 812E9B20AE7
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217735F876;
	Mon,  1 Jul 2024 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ7RqkvS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400F39855;
	Mon,  1 Jul 2024 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719817478; cv=none; b=vGVgHOsPtyRTi3Vf/bjLd8Do6pnl8zlJemOAsiyNkHyY/05YSOUuAKjCFNfygsNakqAIiCa1VNJaRlVDASORn45sqmGKK/HSx9zg0s2siz+2KGdKrRYLgVRUsTwI+PMu/0CsJR128rC99v5ADuKCK6FCtNl/Oegau5vbWzPP2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719817478; c=relaxed/simple;
	bh=ZVNeIOclJphd58de4jUI3OWTreNozc8NrBRes9tysDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dikKTlCQngR0Bw/mVWqJEl+gR89BJ40Gx+mRdMRZ3Gh0L6wRV/Tdzx86PJxdI6lteL1HXidgp/zQBGzM80EV06BP11E9WASBMkkXT+h0D8IfXRQZ/QxeEUozamzgfOObLqCvBvLV5U8Qc2QV/NjkLP0G7Ty7uWpDPRmR6lVMzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQ7RqkvS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso2897946a12.2;
        Mon, 01 Jul 2024 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719817475; x=1720422275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwSfrpxQyPVfecsgTjUoECa/tLr4s2BPZtc7XBxYR6A=;
        b=JQ7RqkvSMU0wpwLrn8wOqVsFXlKa93JYoVhtAtgFiVIPeDWYGi9hmWhdnuOVXo907a
         IPiegu7zv42E1kRY4VQf0NMLv1nog1uNTwqWb7cpAgDRsSRDwTw/9vnL+/zEEdHbmvKy
         AcJKiaSMZq0DgK9p8pI9YskQsnm+BoLXqzLks/uHMt59o0IfWAqHyndSnrekn00zF7G5
         Y85yC9z7c5rMe1FHLoIAAd5Ar+HS5nL8xE4SFILaL1mCQUYXAM2dAaZfHxty+YHiRB3J
         SmSMmcZlBTuXUipI0dcCnUmF9YNw20XOQ51Ad2XaQv8vumY4i//IH2NsAj7K540EuyY2
         4cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817475; x=1720422275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwSfrpxQyPVfecsgTjUoECa/tLr4s2BPZtc7XBxYR6A=;
        b=TUgD0mDh/A2zo7fK6Ij8QJA5XyZNrQr9wqncFAuMxgvFYDRsZ67wVePgE3efC/iste
         Pi/oq5OhvtuYzGlgRLUevFrXNhuJGgQ9Pny2i0wmFjjj7dH+624FkVGvlG9CE/mESB9V
         0mTvXlZc/WUC+T9bFZBVIW0U9j9v1H9K/mU4pk7kCWz3G/sc1aHgPxZ+SsqmRi8kiaaD
         0FbnwoJ4f8hSXL2eAwu2ni2THCXEQ8Z3Gp1eLVmU+gL7czSLI2SMhHekzYnlbAaQHwdf
         OWN6ZVX1VtXdBh0fPa8XmBP6ICuZDW7StuPHmyYpN9mv6OJbmsUdSSGj4wMQNFCA0h+J
         DOWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZVi+RBxHhQ4kAtzjHFq2AT+3n0UjUHyT743CExZfYKWPGe/pbspSs4dt+xtq8DUNEM13so6KK+Q11Ll84n6BULlhYTqCC5zM6ZVg4kjLRNV6SB7ltDFre14AOhDV/O1UH6+sMxITYBYs=
X-Gm-Message-State: AOJu0YyZNMWO6b5QIl+gWh7RPsANAWI1wF/FJesIEauFsMJOFEpw2REz
	/mebhMnLP3O8SWawDoA/K4G2dQ2uPxcWyxdUNbQbhH/E8dY2a9dJ
X-Google-Smtp-Source: AGHT+IGqvp0X9T5eWNDv9ibzrQXQZgHtwxfaE/qHHFOGBXqIbw9wLHDSmmGxyGk5DTESrlxEZMDblg==
X-Received: by 2002:a17:906:1350:b0:a6f:dc10:6534 with SMTP id a640c23a62f3a-a751449e587mr325342766b.34.1719817475009;
        Mon, 01 Jul 2024 00:04:35 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-11.cust.vodafonedsl.it. [2.39.142.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0652d8sm307094166b.98.2024.07.01.00.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:04:34 -0700 (PDT)
Date: Mon, 1 Jul 2024 09:04:31 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	20240627151806.3999400-2-tomm.merciai@gmail.com
Subject: Re: [PATCH 2/2] media: i2c: max96714: coding style fixes
Message-ID: <ZoJU/2Ai0Bl/08Vt@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com>
 <20240628-gmsl2-drivers-style-fixup-v1-2-a4bb49f4c7a1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-gmsl2-drivers-style-fixup-v1-2-a4bb49f4c7a1@collabora.com>

Hi Julien,

On Fri, Jun 28, 2024 at 02:29:28PM +0200, Julien Massot wrote:
> Coding style fixes suggested by Sakari during the
> driver review.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  drivers/media/i2c/max96714.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index c97de66631e0..c738908bf141 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -25,6 +25,7 @@
>  #define MAX96714_NPORTS     2
>  #define MAX96714_PAD_SINK   0
>  #define MAX96714_PAD_SOURCE 1
> +#define MAX96714_CSI_NLANES 4
>  
>  /* DEV */
>  #define MAX96714_REG13                 CCI_REG8(0x0d)
> @@ -724,8 +725,9 @@ static int max96714_init_tx_port(struct max96714_priv *priv)
>  	 * Unused lanes need to be mapped as well to not have
>  	 * the same lanes mapped twice.
>  	 */
> -	for (; lane < 4; lane++) {
> -		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
> +	for (; lane < MAX96714_CSI_NLANES; lane++) {
> +		unsigned int idx = find_first_zero_bit(&lanes_used,
> +						       MAX96714_CSI_NLANES);
>  
>  		val |= idx << (lane * 2);
>  		lanes_used |= BIT(idx);
> @@ -757,9 +759,7 @@ static int max96714_rxport_disable_poc(struct max96714_priv *priv)
>  static int max96714_parse_dt_txport(struct max96714_priv *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> -	struct v4l2_fwnode_endpoint vep = {
> -		.bus_type = V4L2_MBUS_CSI2_DPHY
> -	};
> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	struct fwnode_handle *ep_fwnode;
>  	u32 num_data_lanes;
>  	int ret;
> @@ -791,14 +791,14 @@ static int max96714_parse_dt_txport(struct max96714_priv *priv)
>  	}
>  
>  	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> -	if (num_data_lanes < 1 || num_data_lanes > 4) {
> +	if (num_data_lanes < 1 || num_data_lanes > MAX96714_CSI_NLANES) {
>  		dev_err(dev,
>  			"tx: invalid number of data lanes must be 1 to 4\n");
>  		ret = -EINVAL;
>  		goto err_free_vep;
>  	}
>  
> -	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
> +	priv->mipi_csi2 = vep.bus.mipi_csi2;
>  
>  err_free_vep:
>  	v4l2_fwnode_endpoint_free(&vep);

This Patch looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>

Note: 
I think we can fix also the following defines here, as a coding style
fixes. Maybe in another patch.

#define MAX96714_PATGEN_DE_CNT         CCI_REG16(0x25B)
#define MAX96714_PATGEN_CHKB_COLOR_A   CCI_REG24(0x25E)

I think hex numbers for regs must be lower case instead of upper case :)

Thanks & Regards,
Tommaso

> 
> -- 
> 2.45.2
> 

