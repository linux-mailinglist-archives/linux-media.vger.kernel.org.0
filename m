Return-Path: <linux-media+bounces-42895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0FB8F315
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B0C189ABD7
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79122737F6;
	Mon, 22 Sep 2025 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="WEEjoJVd"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C6212578;
	Mon, 22 Sep 2025 06:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523773; cv=pass; b=kdKreszUUkg6V2gvww4bR9kV/spshSrnLjXBcyaUYhghnxBoRZIoZ1bVXwA8KOQl4uIRK/JOTxVyrsFemV4ZAsetfwn/il7eSKOUmGFfJ7hhDOooYPmj1E8a2tm5Z3QQm1CgIOzxZHXjQyoVQiS3WYMJdg8jMS87udc1ML1uOao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523773; c=relaxed/simple;
	bh=t59P1FuqM2ic6f4rFGdrKZoIBZ10VqzPnaSkib31Hps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H07lcLKFFGCChrmxyRJCwazu2QYJ9rplQlWGUPmtxfp7Pa8hJPFfT2kmhsoDsW+GOLmpOmRl/5CzdQw7F423OULnsmwFHUvrWe3oN3xnBqsk5eDgdv1eAidXtKvyYbDy+fq2P4MsK00IFKO8jQ2TGBT/I55OSeuQbBEjPqRQ6b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=WEEjoJVd; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cVYcm1p8bzyQK;
	Mon, 22 Sep 2025 09:49:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1758523768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu23B2J7b2A56Ul4JJXUbLHwY6TNh++dPK/zMyIBMg0=;
	b=WEEjoJVdBwwCayHJBLPJdNoFEAW4IbR1kcb2P++33rMnLG+qunU7aLcs7iGjM0qX2NHYxp
	EhUb3NmgPVaTg6SJhM4tVDPAjGEugpYJ00go8WJO/3yw3dfThsZTqq9VBWSChLQ6d5/FK6
	NHJ3c/iyggnw3wKo7JDdj/b/Ao66Edw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1758523768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qu23B2J7b2A56Ul4JJXUbLHwY6TNh++dPK/zMyIBMg0=;
	b=ZNYxOXMX192BGaQKrTn8H1Y9O2P5kTyWUb8VxPYRUGycx2Y1PS05oQ0MIdVnNZ4FqCX9kb
	fV0JmGyr6kRqHpKonn0Rp+nJhFyE768q3uEmXf5wIarYqBa1qexqcITQ6i3QCtYbG4ajMc
	TDwlnxkWKXb9bw2QpGB6lf1ZO8t50AE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1758523768; a=rsa-sha256; cv=none;
	b=SGLNt2dwI5NBADA5l6wnw15IsKqG6BHCpS7pGDWnWAOAUg9RsqjWOt4Z8aOOVpHNZoC+LF
	ORAEGm9wXJG1RGo6eYOCuVDXZ6NOXnmfrT/rQQUKI5HUbksqe5vmMNsiJJijw/pRdxEc7B
	iWygxQEJEQEnBQeU59pDNWeDFTkozdE=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 79790634C97;
	Mon, 22 Sep 2025 09:49:27 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:49:27 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] media: imx-mipi-csis: Store the number of
 data_lanes configured in dt
Message-ID: <aNDxd9rWjmgrVCd9@valkosipuli.retiisi.eu>
References: <20250915-mbus-config-active-lanes-v3-0-97a1282a410b@ideasonboard.com>
 <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-mbus-config-active-lanes-v3-2-97a1282a410b@ideasonboard.com>

Hi Isaac,

On Mon, Sep 15, 2025 at 02:18:34PM +0100, Isaac Scott wrote:
> The number of lanes actively used by a MIPI CSI transmitter may differ
> from that which is defined in device tree. To allow us to be able to set
> the number of configured lanes without changing the maximum lane count,
> store the number of lanes configured in device tree, and adjust the
> debug print to reflect the device tree value.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 2beb5f43c2c0..6afbedfe131e 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -313,6 +313,8 @@ struct mipi_csis_device {
>  	u32 hs_settle;
>  	u32 clk_settle;
>  
> +	unsigned int num_data_lanes;
> +
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
>  	struct dentry *debugfs_root;
> @@ -535,7 +537,7 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
>  	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
>  	val &= ~MIPI_CSIS_DPHY_CMN_CTRL_ENABLE;
>  	if (on) {
> -		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
> +		mask = (1 << (csis->num_data_lanes + 1)) - 1;

Please use 1U or BIT() for bit-shifted values.

>  		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
>  	}
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
> @@ -586,7 +588,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> -				       csis->bus.num_data_lanes * 2);
> +				       csis->num_data_lanes * 2);
>  	if (link_freq < 0) {
>  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
>  			(int)link_freq);
> @@ -631,7 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  				 const struct v4l2_mbus_framefmt *format,
>  				 const struct csis_pix_format *csis_fmt)
>  {
> -	int lanes = csis->bus.num_data_lanes;
> +	int lanes = csis->num_data_lanes;
>  	u32 val;
>  
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> @@ -1299,8 +1301,10 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>  	}
>  
>  	csis->bus = vep.bus.mipi_csi2;
> +	csis->bus.num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
> +	csis->num_data_lanes = csis->bus.num_data_lanes;
>  
> -	dev_dbg(csis->dev, "data lanes: %d\n", csis->bus.num_data_lanes);
> +	dev_dbg(csis->dev, "data lanes: %d\n", csis->num_data_lanes);
>  	dev_dbg(csis->dev, "flags: 0x%08x\n", csis->bus.flags);
>  
>  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> @@ -1498,7 +1502,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	}
>  
>  	dev_info(dev, "lanes: %d, freq: %u\n",
> -		 csis->bus.num_data_lanes, csis->clk_frequency);
> +		 csis->num_data_lanes, csis->clk_frequency);
>  
>  	return 0;
>  
> 

-- 
Regards,

Sakari Ailus

