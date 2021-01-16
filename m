Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE172F8E60
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbhAPRja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:39:30 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:41648 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbhAPRja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 12:39:30 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id DA9803B3B53
        for <linux-media@vger.kernel.org>; Sat, 16 Jan 2021 16:08:03 +0000 (UTC)
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 25B00C0003;
        Sat, 16 Jan 2021 16:06:59 +0000 (UTC)
Date:   Sat, 16 Jan 2021 17:07:18 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 04/13] media: exynos4-is: Use
 v4l2_async_notifier_add_fwnode_remote_subdev
Message-ID: <20210116160718.3ogm3vx5j3mdpgii@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-5-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-5-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel

On Tue, Jan 12, 2021 at 10:23:30AM -0300, Ezequiel Garcia wrote:
> The use of v4l2_async_notifier_add_subdev is discouraged.
> Drivers are instead encouraged to use a helper such as
> v4l2_async_notifier_add_fwnode_remote_subdev.
>
> This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> should get a kmalloc'ed struct v4l2_async_subdev,
> removing some boilerplate code while at it.
>
> Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
> which handles the needed setup, instead of open-coding it.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 25 +++++++++----------
>  drivers/media/platform/exynos4-is/media-dev.h |  2 +-
>  2 files changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index e636c33e847b..196166a9a4e5 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/exynos4-is/media-dev.c
> @@ -401,6 +401,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	int index = fmd->num_sensors;
>  	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
>  	struct device_node *rem, *np;
> +	struct v4l2_async_subdev *asd;
>  	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
>  	int ret;
>
> @@ -418,7 +419,6 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
>
>  	rem = of_graph_get_remote_port_parent(ep);
> -	of_node_put(ep);

If you remove it from here, don't forget to put it in the here below
error path

>  	if (rem == NULL) {

>  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
>  							ep);
> @@ -450,6 +450,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	 * checking parent's node name.
>  	 */
>  	np = of_get_parent(rem);
> +	of_node_put(rem);

unrelated but good
>
>  	if (of_node_name_eq(np, "i2c-isp"))
>  		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
> @@ -457,21 +458,18 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  		pd->fimc_bus_type = pd->sensor_bus_type;
>  	of_node_put(np);
>
> -	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
> -		of_node_put(rem);

I think if you need to keep 'ep' around until the call to
v4l2_async_notifier_add_fwnode_remote_subdev() below, it should be put
here as you remove the above of_node_put(ep).

I wonder if registering the async subdev before parsing the endpoint
would make things simpler. Not required for this patch though.

> +	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor)))
>  		return -EINVAL;
> -	}
>
> -	fmd->sensor[index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	fmd->sensor[index].asd.match.fwnode = of_fwnode_handle(rem);
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +		&fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
>
> -	ret = v4l2_async_notifier_add_subdev(&fmd->subdev_notifier,
> -					     &fmd->sensor[index].asd);
> -	if (ret) {
> -		of_node_put(rem);
> -		return ret;
> -	}
> +	of_node_put(ep);
> +
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>
> +	fmd->sensor[index].asd = asd;
>  	fmd->num_sensors++;
>
>  	return 0;
> @@ -1381,7 +1379,8 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>
>  	/* Find platform data for this sensor subdev */
>  	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
> -		if (fmd->sensor[i].asd.match.fwnode ==
> +		if (fmd->sensor[i].asd &&

Is this needed ? If the subdev has bound the async subdev has been
allocated correctly, doesn't it ?

With the ep ref counting clarified
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j


> +		    fmd->sensor[i].asd->match.fwnode ==
>  		    of_fwnode_handle(subdev->dev->of_node))
>  			si = &fmd->sensor[i];
>
> diff --git a/drivers/media/platform/exynos4-is/media-dev.h b/drivers/media/platform/exynos4-is/media-dev.h
> index 9447fafe23c6..a3876d668ea6 100644
> --- a/drivers/media/platform/exynos4-is/media-dev.h
> +++ b/drivers/media/platform/exynos4-is/media-dev.h
> @@ -83,7 +83,7 @@ struct fimc_camclk_info {
>   */
>  struct fimc_sensor_info {
>  	struct fimc_source_info pdata;
> -	struct v4l2_async_subdev asd;
> +	struct v4l2_async_subdev *asd;
>  	struct v4l2_subdev *subdev;
>  	struct fimc_dev *host;
>  };
> --
> 2.29.2
>
