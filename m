Return-Path: <linux-media+bounces-15118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4C934F0F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B4C1F21964
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4335B1420DF;
	Thu, 18 Jul 2024 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a2pzK2hw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380513E8AE;
	Thu, 18 Jul 2024 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721312692; cv=none; b=E4qt1gdtziVm0jR2etL/hermmUCabCxgdWYjj17m+A3Q+Y7kLHyuOQXc4syY/inWBK/RC4HkSaMGgU4YVfO7VWdNaEMidiCI8WVts4jD629CugodvB6+S5T4b5RqdCuWl2Dakh7JLrRX5Z7etlQiqt21yVdUuVOuCGjtEp1z7Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721312692; c=relaxed/simple;
	bh=O7FXaGBiWPqHzYeOnlM/8Rm+nQSt/ekJVBYqHT0mREk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7gIzWLE4S/GaXClyq6O+2RRTONY6cLrWbitDuuq2K/3pf0D224dXW7lg5WEJZvtMZh+vFkwvG7ii/Pqis4xRqle8RB2PonWzFSpgN3af56j8o3wUrnLXksED1uxo1WuBsMeVJqxTqbNqlnRR1TBu/fyNZPo2dCUSRNKx+BlB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a2pzK2hw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-158-41.net.vodafone.it [5.91.158.41])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB22CC85;
	Thu, 18 Jul 2024 16:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721312643;
	bh=O7FXaGBiWPqHzYeOnlM/8Rm+nQSt/ekJVBYqHT0mREk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2pzK2hw1lawaibwPlDda1KMZQH3Dt5nXUKomWlaXzoJudKaSNNs+zX1Uu5TaE74a
	 HD2aahemjnkgBAF+P4v73gfziA+zDIgq4GRoSwt7G0nA8PgOgPbcgcCjGneOsHUBWR
	 eQj5/uQjpmcAJJfiVAOUyMZwZyHJetAsc/Falqtw=
Date: Thu, 18 Jul 2024 16:24:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/5] media: cadence: csi2rx: Support runtime PM
Message-ID: <rpbe5ebzu7e536qrruseffklmtvfkp5bbenjtx7enipm6y5gbr@wsjvomihwmv6>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240718032834.53876-2-changhuang.liang@starfivetech.com>

Hello Changhuang

On Wed, Jul 17, 2024 at 08:28:30PM GMT, Changhuang Liang wrote:
> Use runtime power management hooks to save power when CSI-RX is not in
> use.
>

The driver does not depend on PM afaict and the IP can be integrated in
different SoCs and not all of them might select PM.

Either make it depend on PM in Kconfig or manually enable the device during
probe (see the many examples of drivers manually enabling the device
in probe() then calling pm_runtime_set_active(), pm_runtime_enable()
and pm_request_idle()).

Also, you might want to consider autosuspend delay. Autosuspend delay
avoids power cycling the interface by delaying suspend by a certain
amout of time, in case it resumed immediately.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 121 ++++++++++++-------
>  1 file changed, 80 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 6f7d27a48eff..981819adbb3a 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -211,11 +211,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	u32 reg;
>  	int ret;
>
> -	ret = clk_prepare_enable(csi2rx->p_clk);
> -	if (ret)
> -		return ret;
> -
> -	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
>
>  	reg = csi2rx->num_lanes << 8;
> @@ -253,7 +248,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		if (ret) {
>  			dev_err(csi2rx->dev,
>  				"Failed to configure external DPHY: %d\n", ret);
> -			goto err_disable_pclk;
> +			return ret;
>  		}
>  	}
>
> @@ -268,11 +263,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	 * hence the reference counting.
>  	 */
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> -		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
> -		if (ret)
> -			goto err_disable_pixclk;
> -
> -		reset_control_deassert(csi2rx->pixel_rst[i]);
>
>  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
>  		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> @@ -288,34 +278,18 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>  	}
>
> -	ret = clk_prepare_enable(csi2rx->sys_clk);
> -	if (ret)
> -		goto err_disable_pixclk;
> -
> -	reset_control_deassert(csi2rx->sys_rst);
>
>  	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
>  	if (ret)
> -		goto err_disable_sysclk;
> -
> -	clk_disable_unprepare(csi2rx->p_clk);
> +		goto err_phy_power_off;
>
>  	return 0;
>
> -err_disable_sysclk:
> -	clk_disable_unprepare(csi2rx->sys_clk);
> -err_disable_pixclk:
> -	for (; i > 0; i--) {
> -		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> -		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> -	}
> -
> +err_phy_power_off:
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  		phy_power_off(csi2rx->dphy);
>  	}
> -err_disable_pclk:
> -	clk_disable_unprepare(csi2rx->p_clk);
>
>  	return ret;
>  }
> @@ -326,10 +300,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	u32 val;
>  	int ret;
>
> -	clk_prepare_enable(csi2rx->p_clk);
> -	reset_control_assert(csi2rx->sys_rst);
> -	clk_disable_unprepare(csi2rx->sys_clk);
> -
>  	for (i = 0; i < csi2rx->max_streams; i++) {
>  		writel(CSI2RX_STREAM_CTRL_STOP,
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> @@ -342,14 +312,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  		if (ret)
>  			dev_warn(csi2rx->dev,
>  				 "Failed to stop streaming on pad%u\n", i);
> -
> -		reset_control_assert(csi2rx->pixel_rst[i]);
> -		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>  	}
>
> -	reset_control_assert(csi2rx->p_rst);
> -	clk_disable_unprepare(csi2rx->p_clk);
> -
>  	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
>  		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
>
> @@ -374,9 +338,15 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>  		 * enable the whole controller.
>  		 */
>  		if (!csi2rx->count) {
> +			ret = pm_runtime_resume_and_get(csi2rx->dev);
> +			if (ret < 0)
> +				goto out;
> +
>  			ret = csi2rx_start(csi2rx);
> -			if (ret)
> +			if (ret) {
> +				pm_runtime_put(csi2rx->dev);
>  				goto out;
> +			}
>  		}
>
>  		csi2rx->count++;
> @@ -386,8 +356,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>  		/*
>  		 * Let the last user turn off the lights.
>  		 */
> -		if (!csi2rx->count)
> +		if (!csi2rx->count) {
>  			csi2rx_stop(csi2rx);
> +			pm_runtime_put(csi2rx->dev);
> +		}
>  	}
>
>  out:
> @@ -707,6 +679,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
>
> +	pm_runtime_enable(csi2rx->dev);
>  	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>  	if (ret < 0)
>  		goto err_free_state;
> @@ -721,6 +694,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>
>  err_free_state:
>  	v4l2_subdev_cleanup(&csi2rx->subdev);
> +	pm_runtime_disable(csi2rx->dev);
>  err_cleanup:
>  	v4l2_async_nf_unregister(&csi2rx->notifier);
>  	v4l2_async_nf_cleanup(&csi2rx->notifier);
> @@ -739,9 +713,73 @@ static void csi2rx_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(&csi2rx->subdev);
>  	v4l2_subdev_cleanup(&csi2rx->subdev);
>  	media_entity_cleanup(&csi2rx->subdev.entity);
> +	pm_runtime_disable(csi2rx->dev);
>  	kfree(csi2rx);
>  }
>
> +static int csi2rx_runtime_suspend(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	unsigned int i;
> +
> +	reset_control_assert(csi2rx->sys_rst);
> +	clk_disable_unprepare(csi2rx->sys_clk);
> +
> +	for (i = 0; i < csi2rx->max_streams; i++) {
> +		reset_control_assert(csi2rx->pixel_rst[i]);
> +		clk_disable_unprepare(csi2rx->pixel_clk[i]);
> +	}
> +
> +	reset_control_assert(csi2rx->p_rst);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	return 0;
> +}
> +
> +static int csi2rx_runtime_resume(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +	unsigned int i;
> +	int ret;
> +
> +	ret = clk_prepare_enable(csi2rx->p_clk);
> +	if (ret)
> +		return ret;
> +
> +	reset_control_deassert(csi2rx->p_rst);
> +
> +	for (i = 0; i < csi2rx->max_streams; i++) {
> +		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
> +		if (ret)
> +			goto err_disable_pixclk;
> +
> +		reset_control_deassert(csi2rx->pixel_rst[i]);
> +	}
> +
> +	ret = clk_prepare_enable(csi2rx->sys_clk);
> +	if (ret)
> +		goto err_disable_pixclk;
> +
> +	reset_control_deassert(csi2rx->sys_rst);
> +
> +	return ret;

You can return 0 here

Thanks
   j

> +
> +err_disable_pixclk:
> +	for (; i > 0; i--) {
> +		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> +		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> +	}
> +
> +	reset_control_assert(csi2rx->p_rst);
> +	clk_disable_unprepare(csi2rx->p_clk);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops csi2rx_pm_ops = {
> +	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id csi2rx_of_table[] = {
>  	{ .compatible = "starfive,jh7110-csi2rx" },
>  	{ .compatible = "cdns,csi2rx" },
> @@ -756,6 +794,7 @@ static struct platform_driver csi2rx_driver = {
>  	.driver	= {
>  		.name		= "cdns-csi2rx",
>  		.of_match_table	= csi2rx_of_table,
> +		.pm		= &csi2rx_pm_ops,
>  	},
>  };
>  module_platform_driver(csi2rx_driver);
> --
> 2.25.1
>
>

