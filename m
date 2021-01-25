Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6493028E2
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 18:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730851AbhAYR34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 12:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731013AbhAYRX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 12:23:27 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE43FC061786
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 09:22:38 -0800 (PST)
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D89A51F4530E;
        Mon, 25 Jan 2021 17:22:29 +0000 (GMT)
Subject: Re: [PATCH v3 04/14] media: exynos4-is: Use
 v4l2_async_notifier_add_fwnode_remote_subdev
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
 <20210125132230.6600-19-sakari.ailus@linux.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3db05953-8213-9c3d-321a-5ae4abb6583f@collabora.com>
Date:   Mon, 25 Jan 2021 14:22:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125132230.6600-19-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/25/21 10:22 AM, Sakari Ailus wrote:
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The use of v4l2_async_notifier_add_subdev will be discouraged.
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
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 24 ++++++++++---------
>  drivers/media/platform/exynos4-is/media-dev.h |  2 +-
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index e636c33e847b..f4687b0cbd65 100644
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
> @@ -418,10 +419,10 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
>  
>  	rem = of_graph_get_remote_port_parent(ep);
> -	of_node_put(ep);
>  	if (rem == NULL) {
>  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
>  							ep);
> +		of_node_put(ep);
>  		return 0;
>  	}
>  
> @@ -450,6 +451,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	 * checking parent's node name.
>  	 */
>  	np = of_get_parent(rem);
> +	of_node_put(rem);
>  
>  	if (of_node_name_eq(np, "i2c-isp"))
>  		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
> @@ -458,20 +460,19 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	of_node_put(np);
>  
>  	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
> -		of_node_put(rem);
> +		of_node_put(ep);
>  		return -EINVAL;
>  	}
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
> @@ -1381,7 +1382,8 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>  
>  	/* Find platform data for this sensor subdev */
>  	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
> -		if (fmd->sensor[i].asd.match.fwnode ==
> +		if (fmd->sensor[i].asd &&
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
> 
