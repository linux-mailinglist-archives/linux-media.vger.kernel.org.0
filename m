Return-Path: <linux-media+bounces-14310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DD91B9A1
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0931F22970
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 08:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F201014900C;
	Fri, 28 Jun 2024 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z+352XB0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88623145B09;
	Fri, 28 Jun 2024 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562498; cv=none; b=P92grrP8DIHqIo4LMcy7wJx0bdEAJxxEeKWXw1aGpu9gL62hnjrV9snX1lRccVMHrPxylzNMZdLzpmsfPgn3+mUnhq9IwTSdwcDpx2iEzjxg/enR+9X/0kVguXZjpii6XFQcmVR9exKJ3hVxMGXJhfuJLOyW+EUX3SIED01OtTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562498; c=relaxed/simple;
	bh=GsQFwW5xhv7gF9zOCkJVn2YriC61dJ5VHnL/NS+aOAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7p0NR0UBrYEq6li2FSbkTgpJE1a4nSAs0pjJiuX6gUKmL3zmgBhmlc29gXte/6yiVq4YvBcsT7Tqul1tSnH5EHmtoOwPU7UaQUC3IDU/CSmVbw8YKxlCfUj9OJZUd/1A7nlC8JLVAVRICC4IP3NAY91FFzjbEckRGnoIUL/j4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z+352XB0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4198B674;
	Fri, 28 Jun 2024 10:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719562470;
	bh=GsQFwW5xhv7gF9zOCkJVn2YriC61dJ5VHnL/NS+aOAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z+352XB0edMxzHOzAd0lJ2HmEDHcqvxka67DLWaTRxZtRMKiq/5PgVzIrHZHYwU98
	 W7kcop0C0QzOA+PonXMQo0OQIeLpbPqNMLX2vrszy38s4t1deXylQgqGX1NS15jOYK
	 +Pfq5Fghfr4hSP/CZd5hPdRoARQzi6xrVKkmnjNQ=
Message-ID: <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
Date: Fri, 28 Jun 2024 11:14:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM
To: Jai Luthra <j-luthra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/06/2024 16:09, Jai Luthra wrote:
> From: Jayshri Pawar <jpawar@cadence.com>
> 
> Use runtime power management hooks to save power when CSI-RX is not in
> use. Also stop/start any in-progress streams, which might happen during
> a system suspend/resume cycle.
> 
> Signed-off-by: Jayshri Pawar <jpawar@cadence.com>
> Co-developed-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>   drivers/media/platform/cadence/cdns-csi2rx.c | 43 +++++++++++++++++++++++++++-
>   1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 6f7d27a48eff..751eadbe61ef 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -366,6 +366,12 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>   	int ret = 0;
>   
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(csi2rx->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	mutex_lock(&csi2rx->lock);
>   
>   	if (enable) {
> @@ -375,8 +381,10 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>   		 */
>   		if (!csi2rx->count) {
>   			ret = csi2rx_start(csi2rx);
> -			if (ret)
> +			if (ret) {
> +				pm_runtime_put(csi2rx->dev);
>   				goto out;
> +			}
>   		}
>   
>   		csi2rx->count++;
> @@ -388,6 +396,8 @@ static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>   		 */
>   		if (!csi2rx->count)
>   			csi2rx_stop(csi2rx);
> +
> +		pm_runtime_put(csi2rx->dev);
>   	}
>   
>   out:
> @@ -661,6 +671,29 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>   	return ret;
>   }
>   
> +static int csi2rx_suspend(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_stop(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +
> +	return 0;
> +}
> +
> +static int csi2rx_resume(struct device *dev)
> +{
> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> +
> +	mutex_lock(&csi2rx->lock);
> +	if (csi2rx->count)
> +		csi2rx_start(csi2rx);
> +	mutex_unlock(&csi2rx->lock);
> +	return 0;
> +}
> +

I don't think this looks correct. Afaik the runtime suspend/resume is 
not called on system suspend/resume. You could change the 
SET_RUNTIME_PM_OPS to use the same callbacks for runtime and system 
suspend, but I think that's a bad idea. Runtime suspend is not supposed 
to turn off the streaming. The driver is supposed to turn off the 
streaming, then call runtime_put, which would result in runtime suspend 
callback getting called.

  Tomi

>   static int csi2rx_probe(struct platform_device *pdev)
>   {
>   	struct csi2rx_priv *csi2rx;
> @@ -707,6 +740,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_cleanup;
>   
> +	pm_runtime_enable(csi2rx->dev);
>   	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>   	if (ret < 0)
>   		goto err_free_state;
> @@ -721,6 +755,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>   
>   err_free_state:
>   	v4l2_subdev_cleanup(&csi2rx->subdev);
> +	pm_runtime_disable(csi2rx->dev);
>   err_cleanup:
>   	v4l2_async_nf_unregister(&csi2rx->notifier);
>   	v4l2_async_nf_cleanup(&csi2rx->notifier);
> @@ -739,9 +774,14 @@ static void csi2rx_remove(struct platform_device *pdev)
>   	v4l2_async_unregister_subdev(&csi2rx->subdev);
>   	v4l2_subdev_cleanup(&csi2rx->subdev);
>   	media_entity_cleanup(&csi2rx->subdev.entity);
> +	pm_runtime_disable(csi2rx->dev);
>   	kfree(csi2rx);
>   }
>   
> +static const struct dev_pm_ops csi2rx_pm_ops = {
> +	SET_RUNTIME_PM_OPS(csi2rx_suspend, csi2rx_resume, NULL)
> +};
> +
>   static const struct of_device_id csi2rx_of_table[] = {
>   	{ .compatible = "starfive,jh7110-csi2rx" },
>   	{ .compatible = "cdns,csi2rx" },
> @@ -756,6 +796,7 @@ static struct platform_driver csi2rx_driver = {
>   	.driver	= {
>   		.name		= "cdns-csi2rx",
>   		.of_match_table	= csi2rx_of_table,
> +		.pm		= &csi2rx_pm_ops,
>   	},
>   };
>   module_platform_driver(csi2rx_driver);
> 


