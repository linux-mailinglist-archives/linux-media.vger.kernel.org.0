Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14D32FC0D8
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730469AbhASUVg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbhASSxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:53:08 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8D3C061574
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:52:19 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 5F2A31F45271
Subject: Re: [PATCH v2 04/14] media: exynos4-is: Use
 v4l2_async_notifier_add_fwnode_remote_subdev
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
 <20210118015258.3993-5-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <79a74c16-47d7-1833-1625-6590cb29d5e4@collabora.com>
Date:   Tue, 19 Jan 2021 15:52:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-5-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 1/17/21 10:52 PM, Ezequiel Garcia wrote:
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
> ---
>  drivers/media/platform/exynos4-is/media-dev.c | 25 +++++++++++--------
>  drivers/media/platform/exynos4-is/media-dev.h |  2 +-
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
> index e636c33e847b..de26ecdcfe81 100644
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
> @@ -418,10 +419,11 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	pd->mux_id = (endpoint.base.port - 1) & 0x1;
>  
>  	rem = of_graph_get_remote_port_parent(ep);
> -	of_node_put(ep);
>  	if (rem == NULL) {
>  		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
>  							ep);
> +		of_node_put(rem);

rem is NULL here.

Regards,
Helen

> +		of_node_put(ep);
>  		return 0;
>  	}
>  
> @@ -450,6 +452,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
>  	 * checking parent's node name.
>  	 */
>  	np = of_get_parent(rem);
> +	of_node_put(rem);
>  
>  	if (of_node_name_eq(np, "i2c-isp"))
>  		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
> @@ -458,20 +461,19 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
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
> @@ -1381,7 +1383,8 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
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
