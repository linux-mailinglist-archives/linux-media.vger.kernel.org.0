Return-Path: <linux-media+bounces-30667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F705A95997
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3883B5E92
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9577B22A810;
	Mon, 21 Apr 2025 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t93k77Hq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1C1C5F37;
	Mon, 21 Apr 2025 22:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275659; cv=none; b=N8EPiIJVtJPWGTuFuH887PdmmbYGZYECNDnQdET3fW150rfTJ+g5wWP8rO9KrrhoAkYkWo4U6XIrkSqTboxj1kkX1A9hASF2hucWBLqdx+J9javpphdfb5k7/w4ApWS09h8IW0QTkZIvvv/+wcU8OMHSz8fCeHXoOYoxih+viCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275659; c=relaxed/simple;
	bh=ISgZT3bNbIOotrRxjJECrgOKtka2JRXXjDsas0DFx3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY2166PXNehaYCaHzkb5PtcHesHVu4S77kpHxlef7mP9B1I3vqlAB6hbzTXbbv0SOsICQuOfbgYdMiGEwdndNI8lZwYGP/tijqlK4wDtxTasfq3iAHeWxqwwJ0zQTQgwr73MnUjWlYrDOhzOZdzhf0x62q6O9msAPBeZ6UnHRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t93k77Hq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 614A7606;
	Tue, 22 Apr 2025 00:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745275528;
	bh=ISgZT3bNbIOotrRxjJECrgOKtka2JRXXjDsas0DFx3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t93k77HqWFdbXqD4g+wTh71Tmua1yI5aNBk3OgatXaLsyMoOO2SDe21UsewwhvJSu
	 1QQHkF62AWHJ0axZ+OSoZql/O1nTJz6opNm4qQaqYSsvwMZTaYlDfqJ87sHqJ9StDQ
	 RSNmhSRN7/c3TRyN/FuYJPZuxetbMfj6sIVJiXXE=
Date: Tue, 22 Apr 2025 01:47:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] media: rcar-isp: Rename base register variable
Message-ID: <20250421224733.GB17813@pendragon.ideasonboard.com>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421111240.789510-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Apr 21, 2025 at 01:12:39PM +0200, Niklas Söderlund wrote:
> Prepare for extending the driver to in addition to support the channel

s/support/supporting/

> selector (CS) also support the core ISP. The two different functions
> have different base addresses so the driver needs to distinguish between
> them.
> 
> Prepare for this by marking existing base address variable and
> read/write functions to make it clear it operates on the CS portion of

s/it operates/they operate/

> the driver. There is no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../media/platform/renesas/rcar-isp/csisp.c   | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 4bc89d4757fa..f36d43c2e0a2 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -159,7 +159,7 @@ enum rcar_isp_pads {
>  
>  struct rcar_isp {
>  	struct device *dev;
> -	void __iomem *base;
> +	void __iomem *csbase;
>  	struct reset_control *rstc;
>  
>  	enum rcar_isp_input csi_input;
> @@ -184,14 +184,14 @@ static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
>  	return container_of(n, struct rcar_isp, notifier);
>  }
>  
> -static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
> +static void risp_write_cs(struct rcar_isp *isp, u32 offset, u32 value)

Not sure what the other write function will be called, but I would have
called this risp_cs_write(). Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  {
> -	iowrite32(value, isp->base + offset);
> +	iowrite32(value, isp->csbase + offset);
>  }
>  
> -static u32 risp_read(struct rcar_isp *isp, u32 offset)
> +static u32 risp_read_cs(struct rcar_isp *isp, u32 offset)
>  {
> -	return ioread32(isp->base + offset);
> +	return ioread32(isp->csbase + offset);
>  }
>  
>  static int risp_power_on(struct rcar_isp *isp)
> @@ -245,31 +245,31 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  	if (isp->csi_input == RISP_CSI_INPUT1)
>  		sel_csi = ISPINPUTSEL0_SEL_CSI0;
>  
> -	risp_write(isp, ISPINPUTSEL0_REG,
> -		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
> +	risp_write_cs(isp, ISPINPUTSEL0_REG,
> +		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
>  
>  	/* Configure Channel Selector. */
>  	for (vc = 0; vc < 4; vc++) {
>  		u8 ch = vc + 4;
>  		u8 dt = format->datatype;
>  
> -		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> -		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
> -			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> -			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> -			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> -			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
> +		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
> +		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
> +			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
> +			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
> +			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
> +			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
>  	}
>  
>  	/* Setup processing method. */
> -	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> -		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> -		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> -		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
> +	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> +		      ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
>  
>  	/* Start ISP. */
> -	risp_write(isp, ISPSTART_REG, ISPSTART_START);
> +	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
>  
>  	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
>  					 BIT_ULL(0));
> @@ -284,7 +284,7 @@ static void risp_stop(struct rcar_isp *isp)
>  	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
>  
>  	/* Stop ISP. */
> -	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
> +	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
>  
>  	risp_power_off(isp);
>  }
> @@ -465,9 +465,9 @@ static const struct media_entity_operations risp_entity_ops = {
>  static int risp_probe_resources(struct rcar_isp *isp,
>  				struct platform_device *pdev)
>  {
> -	isp->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (IS_ERR(isp->base))
> -		return PTR_ERR(isp->base);
> +	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(isp->csbase))
> +		return PTR_ERR(isp->csbase);
>  
>  	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
>  

-- 
Regards,

Laurent Pinchart

