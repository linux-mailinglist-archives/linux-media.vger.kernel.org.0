Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655F72FC0D7
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbhASUVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:21:15 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33770 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbhASSxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:53:36 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0A1471F45221
Subject: Re: [PATCH v2 07/14] media: marvell-ccic: Use
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
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20210118015258.3993-1-ezequiel@collabora.com>
 <20210118015258.3993-8-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <4e25e8b2-c6dd-da58-837b-99bb55ff9141@collabora.com>
Date:   Tue, 19 Jan 2021 15:52:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-8-ezequiel@collabora.com>
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
> should get a kmalloc'ed struct v4l2_async_subdev,
> removing some boilerplate code while at it.
> 
> Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
> or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
> the needed setup, instead of open-coding it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/platform/marvell-ccic/cafe-driver.c | 14 +++++++++++---
>  drivers/media/platform/marvell-ccic/mcam-core.c   | 10 ----------
>  drivers/media/platform/marvell-ccic/mcam-core.h   |  1 -
>  drivers/media/platform/marvell-ccic/mmp-driver.c  | 11 ++++++++---
>  4 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/cafe-driver.c b/drivers/media/platform/marvell-ccic/cafe-driver.c
> index 00f623d62c96..91d65f71be96 100644
> --- a/drivers/media/platform/marvell-ccic/cafe-driver.c
> +++ b/drivers/media/platform/marvell-ccic/cafe-driver.c
> @@ -489,6 +489,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  	int ret;
>  	struct cafe_camera *cam;
>  	struct mcam_camera *mcam;
> +	struct v4l2_async_subdev *asd;
>  
>  	/*
>  	 * Start putting together one of our big camera structures.
> @@ -546,9 +547,16 @@ static int cafe_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto out_pdown;
>  
> -	mcam->asd.match_type = V4L2_ASYNC_MATCH_I2C;
> -	mcam->asd.match.i2c.adapter_id = i2c_adapter_id(cam->i2c_adapter);
> -	mcam->asd.match.i2c.address = ov7670_info.addr;
> +	v4l2_async_notifier_init(&mcam->notifier);
> +
> +	asd = v4l2_async_notifier_add_i2c_subdev(&mcam->notifier,
> +					i2c_adapter_id(cam->i2c_adapter),
> +					ov7670_info.addr,
> +					sizeof(*asd));
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out_smbus_shutdown;
> +	}
>  
>  	ret = mccic_register(mcam);
>  	if (ret)
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index c012fd2e1d29..153277e4fe80 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -1866,16 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
>  	cam->pix_format = mcam_def_pix_format;
>  	cam->mbus_code = mcam_def_mbus_code;
>  
> -	/*
> -	 * Register sensor notifier.
> -	 */
> -	v4l2_async_notifier_init(&cam->notifier);
> -	ret = v4l2_async_notifier_add_subdev(&cam->notifier, &cam->asd);
> -	if (ret) {
> -		cam_warn(cam, "failed to add subdev to a notifier");
> -		goto out;
> -	}
> -
>  	cam->notifier.ops = &mccic_notify_ops;
>  	ret = v4l2_async_notifier_register(&cam->v4l2_dev, &cam->notifier);
>  	if (ret < 0) {
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/media/platform/marvell-ccic/mcam-core.h
> index b55545822fd2..f324d808d737 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.h
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.h
> @@ -151,7 +151,6 @@ struct mcam_camera {
>  	 */
>  	struct video_device vdev;
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *sensor;
>  
>  	/* Videobuf2 stuff */
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index 032fdddbbecc..40d9fc4a731a 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -180,6 +180,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct fwnode_handle *ep;
>  	struct mmp_camera_platform_data *pdata;
> +	struct v4l2_async_subdev *asd;
>  	int ret;
>  
>  	cam = devm_kzalloc(&pdev->dev, sizeof(*cam), GFP_KERNEL);
> @@ -238,10 +239,15 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	if (!ep)
>  		return -ENODEV;
>  
> -	mcam->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	mcam->asd.match.fwnode = fwnode_graph_get_remote_port_parent(ep);
> +	v4l2_async_notifier_init(&mcam->notifier);
>  
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&mcam->notifier,
> +							   ep, sizeof(*asd));
>  	fwnode_handle_put(ep);
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out;
> +	}
>  
>  	/*
>  	 * Register the device with the core.
> @@ -278,7 +284,6 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  	return 0;
>  out:
> -	fwnode_handle_put(mcam->asd.match.fwnode);
>  	mccic_shutdown(mcam);
>  
>  	return ret;
> 
