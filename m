Return-Path: <linux-media+bounces-47956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566EAC978D0
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4254A3A52F8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5574310777;
	Mon,  1 Dec 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B1LE9m6L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F630F95E;
	Mon,  1 Dec 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594699; cv=none; b=B8hY3t5StsLqmAxcCz6YzuYdd+2NuZAwJ7GOo/ooPcNL7sMMBWCG/FY5uPDj/0XNCNdLdtxJESApKT10AtDqoSM810rgTdpsu6Yy9zgHPWxapRaUzwygPMminTmDM172zNKaOyQKKvEmUkrw073RCUb0dCr1DKSg6zxDjajiPe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594699; c=relaxed/simple;
	bh=+JPbTZdPJTbEDftl6B5rwSsD6NcqgePl8VHy8DbnFrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wo5wUrJOlmoDwyDQrrmRUr8TJ/08JE8pkfRT19V0kVjtVAlwKnaHFY4jIqLckxqANdShmbhpJroHx1VRXNnS4lnJ6UKLP4EpPw1DqDnoiOsYUR1Ss8q2SGmDyDpLlg48/YiVTAE5YQPK7toziVg/OJu3J8VIO6JdSlajCApyYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B1LE9m6L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8DD2161;
	Mon,  1 Dec 2025 14:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764594561;
	bh=+JPbTZdPJTbEDftl6B5rwSsD6NcqgePl8VHy8DbnFrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B1LE9m6LrDoidNxjlifUqvdvvCam4NabsFKKPLWfQl5teB6Or32wUvUI+Upwdu7jc
	 IzWUDRU3jEvdh2TkEVEwtlTpCRUq/KjbHP1wWIJ4NKq6aIvFfo6C+OYTRi8aa10qdE
	 ETqPUHny9ap92p4O/iJrk8ypOv9xCMI7vGMigQKw=
Message-ID: <a4bba302-8be2-4bbd-96c8-3a20472e0c12@ideasonboard.com>
Date: Mon, 1 Dec 2025 15:11:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/18] media: cadence: csi2rx: Support runtime PM
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
 <20251112115459.2479225-17-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20251112115459.2479225-17-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> From: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> Use runtime power management hooks to save power when CSI-RX is not in
> use.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/Kconfig       |   1 +
>  drivers/media/platform/cadence/cdns-csi2rx.c | 129 ++++++++++++-------
>  2 files changed, 83 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
> index 1aa608c00dbce..ea85ef82760e6 100644
> --- a/drivers/media/platform/cadence/Kconfig
> +++ b/drivers/media/platform/cadence/Kconfig
> @@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
>  config VIDEO_CADENCE_CSI2RX
>  	tristate "Cadence MIPI-CSI2 RX Controller"
>  	depends on VIDEO_DEV
> +	depends on PM
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 833bc134f17cb..6447c225ba354 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -337,11 +337,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
>  	if (csi2rx->error_irq >= 0)
> @@ -382,7 +377,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		if (ret) {
>  			dev_err(csi2rx->dev,
>  				"Failed to configure external DPHY: %d\n", ret);
> -			goto err_disable_pclk;
> +			return ret;
>  		}
>  	}
>  
> @@ -397,12 +392,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	 * hence the reference counting.
>  	 */
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> -		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
> -		if (ret)
> -			goto err_disable_pixclk;
> -
> -		reset_control_deassert(csi2rx->pixel_rst[i]);
> -
>  		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
>  			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
>  					  csi2rx->num_pixels[i]),
> @@ -415,30 +404,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>  	}
>  
> -	ret = clk_prepare_enable(csi2rx->sys_clk);
> -	if (ret)
> -		goto err_disable_pixclk;
> -
> -	reset_control_deassert(csi2rx->sys_rst);
> -
> -	clk_disable_unprepare(csi2rx->p_clk);
>  
>  	return 0;
> -
> -err_disable_pixclk:
> -	for (; i > 0; i--) {
> -		reset_control_assert(csi2rx->pixel_rst[i - 1]);
> -		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
> -	}
> -
> -	if (csi2rx->dphy) {
> -		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
> -		phy_power_off(csi2rx->dphy);
> -	}
> -err_disable_pclk:
> -	clk_disable_unprepare(csi2rx->p_clk);
> -
> -	return ret;
>  }
>  
>  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
> @@ -447,10 +414,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	u32 val;
>  	int ret;
>  
> -	clk_prepare_enable(csi2rx->p_clk);
> -	reset_control_assert(csi2rx->sys_rst);
> -	clk_disable_unprepare(csi2rx->sys_clk);
> -
>  	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>  
>  	for (i = 0; i < csi2rx->max_streams; i++) {
> @@ -465,14 +428,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>  
> @@ -548,10 +505,17 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  	 * enable the whole controller.
>  	 */
>  	if (!csi2rx->count) {
> +		ret = pm_runtime_resume_and_get(csi2rx->dev);
> +		if (ret < 0)
> +			return ret;
> +
>  		csi2rx_update_vc_select(csi2rx, state);
> +
>  		ret = csi2rx_start(csi2rx);
> -		if (ret)
> +		if (ret) {
> +			pm_runtime_put(csi2rx->dev);
>  			return ret;
> +		}
>  	}
>  
>  	/* Start streaming on the source */
> @@ -561,8 +525,10 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>  		dev_err(csi2rx->dev,
>  			"Failed to start streams %#llx on subdev\n",
>  			sink_streams);
> -		if (!csi2rx->count)
> +		if (!csi2rx->count) {
>  			csi2rx_stop(csi2rx);
> +			pm_runtime_put(csi2rx->dev);

Probably time to add 'goto' based error handling to this func... Maybe
in this patch, maybe as a separate patch before this.

 Tomi

> +		}
>  		return ret;
>  	}
>  
> @@ -589,8 +555,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>  	csi2rx->count--;
>  
>  	/* Let the last user turn off the lights. */
> -	if (!csi2rx->count)
> +	if (!csi2rx->count) {
>  		csi2rx_stop(csi2rx);
> +		pm_runtime_put(csi2rx->dev);
> +	}
>  
>  	return 0;
>  }
> @@ -1092,6 +1060,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
>  
> +	pm_runtime_enable(csi2rx->dev);
>  	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>  	if (ret < 0)
>  		goto err_free_state;
> @@ -1106,6 +1075,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  
>  err_free_state:
>  	v4l2_subdev_cleanup(&csi2rx->subdev);
> +	pm_runtime_disable(csi2rx->dev);
>  err_cleanup:
>  	v4l2_async_nf_unregister(&csi2rx->notifier);
>  	v4l2_async_nf_cleanup(&csi2rx->notifier);
> @@ -1124,9 +1094,73 @@ static void csi2rx_remove(struct platform_device *pdev)
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
> +	return 0;
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
> +	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id csi2rx_of_table[] = {
>  	{ .compatible = "starfive,jh7110-csi2rx" },
>  	{ .compatible = "cdns,csi2rx" },
> @@ -1141,6 +1175,7 @@ static struct platform_driver csi2rx_driver = {
>  	.driver	= {
>  		.name		= "cdns-csi2rx",
>  		.of_match_table	= csi2rx_of_table,
> +		.pm		= &csi2rx_pm_ops,
>  	},
>  };
>  module_platform_driver(csi2rx_driver);


