Return-Path: <linux-media+bounces-47492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902AC74148
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id F36B22F767
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB88633A000;
	Thu, 20 Nov 2025 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kifh7efI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE4337BA7;
	Thu, 20 Nov 2025 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763643634; cv=none; b=E9SaRmZDq65rsgUtqW+lHd+e/rzK2qnEjv8apaBgg5ZnliljctaAJZfFa3os/g8kMX+G9obl3qHoJERR1ZI+gJeXnI3oqiQAoKRdOQS5CcdNkQdl0UN/iOyOGoJ0r0ZvV3vkW6r51c3h9tzzzo0ed1WEVa2Axgd30K/Uhj621Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763643634; c=relaxed/simple;
	bh=gyoTl5qD5y3arXwfutjUQ1stfHI7hUjmbQ7klhhBZjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2dU/k5CFpz8CPs9hHl1lWzfSWiMolN/CS3tjZ31vU/6MXgLeH8pdsJyxVT4T9WwEtfqY7NinJ2REc/dKhgiz9qnPohUsmTQQ4/8p/XXsUfLuBKIgNulSqyVLRcVh3GXfqhHQZNWZ1JbaVYM12563f68df2Kd9Jk/cDvz95Ttfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kifh7efI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA0BEB5;
	Thu, 20 Nov 2025 13:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763643504;
	bh=gyoTl5qD5y3arXwfutjUQ1stfHI7hUjmbQ7klhhBZjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kifh7efIAmO7yyC9uri6hC1zR6qoZP+VmeCCuEesKkj/lfHeKh6zJYx7PEE77iyJt
	 szZqB/ZkLDNmhwlCkHuERGQMqIGLo8ILleobUrCApQ4pqudnEabH8fn1vlcRE9dKsg
	 wt/wtcmF2P/NwdwzA1ZZPpbZ10WB72OcAh0f+LSc=
Message-ID: <810d566f-af2e-4a19-af39-2abcc558aa6b@ideasonboard.com>
Date: Thu, 20 Nov 2025 15:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/18] media: cadence: csi2rx: Move to
 .enable/disable_streams API
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-8-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251112115459.2479225-8-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 13:54, Rishikesh Donadkar wrote:
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
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 8c19f125da3e5..34da81893308b 100644
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
> +					 BIT(0));

The stream mask is u64, so better use BIT_U64. It doesn't matter here,
but before you know it, you have switched BIT(0) to BIT(foo->bar), and
someone sets bar to 34 and it's broken...

Yes, I see this being changed later, to variable set with BIT_ULL()
(that could be changed to BIT_U64). Nevertheless, better use the correct
macro.

But a bigger issue is if this and patches 6 and 8 are correct or could
be improved.

I think in this one you remove s_stream from cdns-csi2. But the j7
csi2rx is still calling s_stream, so it would fail with this patch. In
patch 8 you switch j7 csi2rx from s_stream to enable_streams. But in
patch 6 you added mutex, locking and s_stream to j7 csi2rx, and in patch
8 you remove that.

Maybe the end result is fine, but it all does feel messy. I think the
patches we should have are:

- Use v4l2_subdev_enable_streams() in j7-csi2rx instead of calling
s_stream. v4l2_subdev_enable_streams() will work with either .s_stream
and .enable_stream in cdns-csi2rx

- Patch 7 (with BIT_64()) to convert cdns-csi2rx

- Patches 6 and 8 combined. You're essentially adding a new subdev, just
do it right from the start with .enable_streams, state, etc., instead of
mutex and s_stream which are removed two patches later.

 Tomi

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
> +					csi2rx->source_pad, BIT(0))) {
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


