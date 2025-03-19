Return-Path: <linux-media+bounces-28488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822ADA68F1C
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C283AC976
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B531D5142;
	Wed, 19 Mar 2025 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="efz+Tt1g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65241C4A24;
	Wed, 19 Mar 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394393; cv=none; b=qfKkpE0q+Tpv8s+yCjwtuqSxdCAbQqQcMZEBS1DbowsZYeilUMZNqDFKFGDv4QpXc2GzCrsmyLR010+6u4xAhOfw2zHgx7tNCn9zetx3oHPVXI9uRxPueke3mxd5WoP3UXpZTT1/4j3t1+NpfoPJWbZ1Rnk4mR84cMlhx2KMcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394393; c=relaxed/simple;
	bh=gqIbmHGTxyn2V9i/Kxgri5B47Lpi74E4k0HqYJz/OeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FiE0529/IKRBuZ1gu7IaTVCF3WfAqxPvURedq9KbIi12vFaOzB9uAiB3e7XSg5kl8uXyOnueO/TcL76uhgz/j2GJBxqNPUizek5twwO0gNel8PQgq3lzho0sdQNvOaBIwgt/repoFCv5pindptHWxIfJ7MS0nY8N0g0MBz4k61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=efz+Tt1g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8106955A;
	Wed, 19 Mar 2025 15:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742394287;
	bh=gqIbmHGTxyn2V9i/Kxgri5B47Lpi74E4k0HqYJz/OeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efz+Tt1grAye5+YY+0smxa/BebtxWADrCEiazIUgjMwwNBUj62zPDXMd2dWJEaH09
	 qI/FxAovpfJtdpyz+ZkfzeNkfbvssoA3ij6h4KJ+Q1pur82YqugFAC4mnaeDTxEKYU
	 KmgS0YLRoC5DsJ145KLoPMwvhLUch8RqJwe+NvKM=
Date: Wed, 19 Mar 2025 15:26:27 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 6/7] media: rcar-isp: Rename base register variable
Message-ID: <2zbhcqgvh62yfc6fsogfmmy5gsqy5shhnogusqgzhdttf4wwxb@f5o67ktogeiu>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:07PM +0100, Niklas Söderlund wrote:
> Prepare for extending the driver to in addition to support the channel
> selector (CS) also support the core ISP. The two different functions
> have different base addresses so the driver needs to distinguish between
> them.
>
> Prepare for this by marking existing base address variable and
> read/write functions to make it clear it operates on the CS portion of
> the driver. There is no functional change.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../media/platform/renesas/rcar-isp/csisp.c   | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index c515278e3be5..a86d2a9a4915 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -111,7 +111,7 @@ enum rcar_isp_pads {
>
>  struct rcar_isp {
>  	struct device *dev;
> -	void __iomem *base;
> +	void __iomem *csbase;
>  	struct reset_control *rstc;
>
>  	enum rcar_isp_input csi_input;
> @@ -137,14 +137,14 @@ static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
>  	return container_of(n, struct rcar_isp, notifier);
>  }
>
> -static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
> +static void risp_write_cs(struct rcar_isp *isp, u32 offset, u32 value)
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
> @@ -193,31 +193,31 @@ static int risp_start(struct rcar_isp *isp)
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
>  	ret = v4l2_subdev_call(isp->remote, video, s_stream, 1);
>  	if (ret)
> @@ -231,7 +231,7 @@ static void risp_stop(struct rcar_isp *isp)
>  	v4l2_subdev_call(isp->remote, video, s_stream, 0);
>
>  	/* Stop ISP. */
> -	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
> +	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
>
>  	risp_power_off(isp);
>  }
> @@ -419,9 +419,9 @@ static const struct media_entity_operations risp_entity_ops = {
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
> --
> 2.48.1
>
>

