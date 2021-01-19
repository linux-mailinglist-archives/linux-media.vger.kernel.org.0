Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC972FC0CF
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbhASUUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:20:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33818 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbhASSyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:54:19 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5082B1F452D6
Subject: Re: [PATCH v2 09/14] media: pxa-camera: Use
 v4l2_async_notifier_add_*_subdev
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-10-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <31b6c340-df7b-384d-7318-2216f342fcc4@collabora.com>
Date:   Tue, 19 Jan 2021 15:53:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-10-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev will be discouraged.
> Drivers are instead encouraged to use a helper such as
> v4l2_async_notifier_add_fwnode_remote_subdev.
> 
> This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> should get a kmalloc'ed struct v4l2_async_subdev.
> 
> Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
> or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
> the needed setup, instead of open-coding it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>


> ---
>  drivers/media/platform/pxa_camera.c | 53 ++++++++++++-----------------
>  1 file changed, 21 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> index 8cfa39108162..6d39a0aca99c 100644
> --- a/drivers/media/platform/pxa_camera.c
> +++ b/drivers/media/platform/pxa_camera.c
> @@ -655,8 +655,6 @@ struct pxa_camera_dev {
>  	const struct pxa_camera_format_xlate *current_fmt;
>  	struct v4l2_pix_format	current_pix;
>  
> -	struct v4l2_async_subdev asd;
> -
>  	/*
>  	 * PXA27x is only supposed to handle one camera on its Quick Capture
>  	 * interface. If anyone ever builds hardware to enable more than
> @@ -2189,11 +2187,11 @@ static int pxa_camera_resume(struct device *dev)
>  }
>  
>  static int pxa_camera_pdata_from_dt(struct device *dev,
> -				    struct pxa_camera_dev *pcdev,
> -				    struct v4l2_async_subdev *asd)
> +				    struct pxa_camera_dev *pcdev)
>  {
>  	u32 mclk_rate;
> -	struct device_node *remote, *np = dev->of_node;
> +	struct v4l2_async_subdev *asd;
> +	struct device_node *np = dev->of_node;
>  	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
>  	int err = of_property_read_u32(np, "clock-frequency",
>  				       &mclk_rate);
> @@ -2245,13 +2243,12 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
>  	if (ep.bus.parallel.flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  		pcdev->platform_flags |= PXA_CAMERA_PCLK_EN;
>  
> -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	remote = of_graph_get_remote_port_parent(np);
> -	if (remote)
> -		asd->match.fwnode = of_fwnode_handle(remote);
> -	else
> -		dev_notice(dev, "no remote for %pOF\n", np);
> -
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +				&pcdev->notifier,
> +				of_fwnode_handle(np),
> +				sizeof(*asd));
> +	if (IS_ERR(asd))
> +		err = PTR_ERR(asd);
>  out:
>  	of_node_put(np);
>  
> @@ -2286,18 +2283,23 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (IS_ERR(pcdev->clk))
>  		return PTR_ERR(pcdev->clk);
>  
> +	v4l2_async_notifier_init(&pcdev->notifier);
>  	pcdev->res = res;
> -
>  	pcdev->pdata = pdev->dev.platform_data;
>  	if (pcdev->pdata) {
> +		struct v4l2_async_subdev *asd;
> +
>  		pcdev->platform_flags = pcdev->pdata->flags;
>  		pcdev->mclk = pcdev->pdata->mclk_10khz * 10000;
> -		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
> -		pcdev->asd.match.i2c.adapter_id =
> -			pcdev->pdata->sensor_i2c_adapter_id;
> -		pcdev->asd.match.i2c.address = pcdev->pdata->sensor_i2c_address;
> +		asd = v4l2_async_notifier_add_i2c_subdev(
> +				&pcdev->notifier,
> +				pcdev->pdata->sensor_i2c_adapter_id,
> +				pcdev->pdata->sensor_i2c_address,
> +				sizeof(*asd));
> +		if (IS_ERR(asd))
> +			err = PTR_ERR(asd);
>  	} else if (pdev->dev.of_node) {
> -		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev, &pcdev->asd);
> +		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
>  	} else {
>  		return -ENODEV;
>  	}
> @@ -2389,23 +2391,11 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (err)
>  		goto exit_deactivate;
>  
> -	v4l2_async_notifier_init(&pcdev->notifier);
> -
> -	err = v4l2_async_notifier_add_subdev(&pcdev->notifier, &pcdev->asd);
> -	if (err) {
> -		fwnode_handle_put(pcdev->asd.match.fwnode);
> -		goto exit_free_v4l2dev;
> -	}
> -
> -	pcdev->notifier.ops = &pxa_camera_sensor_ops;
> -
> -	if (!of_have_populated_dt())
> -		pcdev->asd.match_type = V4L2_ASYNC_MATCH_I2C;
> -
>  	err = pxa_camera_init_videobuf2(pcdev);
>  	if (err)
>  		goto exit_notifier_cleanup;
>  
> +	pcdev->notifier.ops = &pxa_camera_sensor_ops;
>  	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
>  	if (err)
>  		goto exit_notifier_cleanup;
> @@ -2413,7 +2403,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	return 0;
>  exit_notifier_cleanup:
>  	v4l2_async_notifier_cleanup(&pcdev->notifier);
> -exit_free_v4l2dev:
>  	v4l2_device_unregister(&pcdev->v4l2_dev);
>  exit_deactivate:
>  	pxa_camera_deactivate(pcdev);
> 
