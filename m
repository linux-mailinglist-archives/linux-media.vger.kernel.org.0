Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C432F8E55
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbhAPRgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:36:39 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:8403 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbhAPRgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 12:36:38 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 057A1240002;
        Sat, 16 Jan 2021 17:35:55 +0000 (UTC)
Date:   Sat, 16 Jan 2021 18:36:14 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 08/13] media: marvell-ccic: Use
 v4l2_async_notifier_add_{i2c,fwnode_remote}_subdev helpers
Message-ID: <20210116173614.p7qzkrj7n6bzuyp2@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-9-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-9-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 12, 2021 at 10:23:34AM -0300, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev is discouraged.
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

looks good, thanks
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

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
> --
> 2.29.2
>
