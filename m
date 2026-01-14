Return-Path: <linux-media+bounces-50705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB01D1FBA0
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 225CA3014DE7
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FE62C11CF;
	Wed, 14 Jan 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mkcmw4CN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6626E71F;
	Wed, 14 Jan 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404327; cv=none; b=q/WZSL5di4VcKwGH6gyVMrc0+fIjlG7pn9Fd5wkCmMTHlitwZTnz6Ca0F4pHVrN1BRCUcLna2U/on3XiM3l2V1l34aHJ5I4+/u1cOEXnUGr5qnlMRDsb3zpq2cBEd48ZQNVwBIKkXC7zFCfPrPGQ5ScXGn9PsNepaUm8Eo3/YkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404327; c=relaxed/simple;
	bh=JEPgbnBV8NR9F2sgE2tsXfJ1BNyd6TZW9fi/HCqps7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5wicZAeMoxw9xAuGmqMvTmdJoGAgZk2SNp7+viseN5YmFdvQiyiVZQwMSVoeUuYBEWSeWDdjVzRHkXH7shMeZUT1e/DGOOayobAApQ5+7JEYA09CewKuyriYUcBfwufcj9+DPXoqL8pidfHbuySHeSVWXt5cVLcJ2kWq91yEzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mkcmw4CN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C5CE55C;
	Wed, 14 Jan 2026 16:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768404296;
	bh=JEPgbnBV8NR9F2sgE2tsXfJ1BNyd6TZW9fi/HCqps7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mkcmw4CNx6ZgM5tqEheZywLMQSh45oku6IexiwvnIpqBi+1miLLPvDlkSIWZ3EEkP
	 OdHsxftksYeytqG4rBG1XImfkEssGDt6waET0D8NS6BKyAwlZbMs/bMyO6ylK/zEjU
	 4pXcTytZwmie2bnlcg6zQqzx973oCsmx85+S3E1A=
Message-ID: <d5830999-cd0b-4328-886c-25abc37660e5@ideasonboard.com>
Date: Wed, 14 Jan 2026 17:25:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/19] media: cadence: csi2rx: Move to
 .enable/disable_streams API
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-8-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251230083220.2405247-8-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> The enable_streams() API in v4l2 supports passing a bitmask to enable
> each pad/stream combination individually on any media subdev. Use this
> API instead of  s_stream() API.
> 
> Implement the enable_stream and disable_stream hooks in place of the
> stream-unaware s_stream hook.
> 
> Remove the lock that was used to serialize stream starts/stops which
> is not required anymore since the v4l2-core serializes the
> enable/disable_streams() calls for the subdev.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 108 +++++++++----------
>  1 file changed, 54 insertions(+), 54 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 8c19f125da3e5..8e7af2da62262 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -125,12 +125,6 @@ struct csi2rx_priv {
>  	unsigned int			count;
>  	int				error_irq;
>  
> -	/*
> -	 * Used to prevent race conditions between multiple,
> -	 * concurrent calls to start and stop.
> -	 */
> -	struct mutex			lock;
> -
>  	void __iomem			*base;
>  	struct clk			*sys_clk;
>  	struct clk			*p_clk;
> @@ -268,20 +262,21 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>  	union phy_configure_opts opts = { };
>  	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> -	struct v4l2_subdev_format sd_fmt = {
> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad	= CSI2RX_PAD_SINK,
> -	};
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *framefmt;
>  	const struct csi2rx_fmt *fmt;
>  	s64 link_freq;
>  	int ret;
>  
> -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
> -					    &sd_fmt);
> -	if (ret < 0)
> -		return ret;
> +	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>  
> -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
> +	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
> +	if (!framefmt) {
> +		dev_err(csi2rx->dev, "Did not find active sink format\n");
> +		return -EINVAL;
> +	}
> +
> +	fmt = csi2rx_get_fmt_by_code(framefmt->code);
>  
>  	link_freq = v4l2_get_link_freq(src_pad,
>  				       fmt->bpp, 2 * csi2rx->num_lanes);
> @@ -401,16 +396,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  	reset_control_deassert(csi2rx->sys_rst);
>  
> -	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
> -	if (ret)
> -		goto err_disable_sysclk;
> -
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
>  	return 0;
>  
> -err_disable_sysclk:
> -	clk_disable_unprepare(csi2rx->sys_clk);
>  err_disable_pixclk:
>  	for (; i > 0; i--) {
>  		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> @@ -459,9 +448,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->p_rst);
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
> -	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
> -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> -
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  
> @@ -485,38 +471,56 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
> +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
>  	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> -	int ret = 0;
> -
> -	mutex_lock(&csi2rx->lock);
> -
> -	if (enable) {
> -		/*
> -		 * If we're not the first users, there's no need to
> -		 * enable the whole controller.
> -		 */
> -		if (!csi2rx->count) {
> -			ret = csi2rx_start(csi2rx);
> -			if (ret)
> -				goto out;
> -		}
> +	int ret;
>  
> -		csi2rx->count++;
> -	} else {
> -		csi2rx->count--;
> +	/*
> +	 * If we're not the first users, there's no need to
> +	 * enable the whole controller.
> +	 */
> +	if (!csi2rx->count) {
> +		ret = csi2rx_start(csi2rx);
> +		if (ret)
> +			return ret;
> +	}
>  
> -		/*
> -		 * Let the last user turn off the lights.
> -		 */
> +	/* Start streaming on the source */
> +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
> +					 BIT_U64(0));
> +	if (ret) {
> +		dev_err(csi2rx->dev,
> +			"Failed to start streams %d on subdev\n", 0);
>  		if (!csi2rx->count)
>  			csi2rx_stop(csi2rx);
> +		return ret;
>  	}
>  
> -out:
> -	mutex_unlock(&csi2rx->lock);
> -	return ret;
> +	csi2rx->count++;
> +	return 0;
> +}
> +
> +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> +
> +	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
> +					csi2rx->source_pad, BIT_U64(0))) {
> +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
> +	}
> +
> +	csi2rx->count--;
> +
> +	/* Let the last user turn off the lights. */
> +	if (!csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +
> +	return 0;
>  }
>  
>  static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
> @@ -611,10 +615,8 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>  	.enum_mbus_code	= csi2rx_enum_mbus_code,
>  	.get_fmt	= v4l2_subdev_get_fmt,
>  	.set_fmt	= csi2rx_set_fmt,
> -};
> -
> -static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
> -	.s_stream	= csi2rx_s_stream,
> +	.enable_streams         = csi2rx_enable_streams,
> +	.disable_streams        = csi2rx_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
> @@ -623,7 +625,6 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>  
>  static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
>  	.core		= &csi2rx_core_ops,
> -	.video		= &csi2rx_video_ops,
>  	.pad		= &csi2rx_pad_ops,
>  };
>  
> @@ -829,7 +830,6 @@ static int csi2rx_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, csi2rx);
>  	csi2rx->dev = &pdev->dev;
> -	mutex_init(&csi2rx->lock);
>  
>  	ret = csi2rx_get_resources(csi2rx, pdev);
>  	if (ret)


