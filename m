Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11313028BE
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 18:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbhAYRXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 12:23:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32842 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731012AbhAYRX1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 12:23:27 -0500
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 139701F45377;
        Mon, 25 Jan 2021 17:22:32 +0000 (GMT)
Subject: Re: [PATCH v3 05/14] media: st-mipid02: Use
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
 <20210125132230.6600-20-sakari.ailus@linux.intel.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2e9d2224-fd75-aa20-ff3f-fa1e06a75231@collabora.com>
Date:   Mon, 25 Jan 2021 14:22:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125132230.6600-20-sakari.ailus@linux.intel.com>
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
>  drivers/media/i2c/st-mipid02.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index 003ba22334cd..42549b3a62a0 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -92,7 +92,6 @@ struct mipid02_dev {
>  	u64 link_frequency;
>  	struct v4l2_fwnode_endpoint tx;
>  	/* remote source */
> -	struct v4l2_async_subdev asd;
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_subdev *s_subdev;
>  	/* registers */
> @@ -844,6 +843,7 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  {
>  	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	struct i2c_client *client = bridge->i2c_client;
> +	struct v4l2_async_subdev *asd;
>  	struct device_node *ep_node;
>  	int ret;
>  
> @@ -875,18 +875,17 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>  	bridge->rx = ep;
>  
>  	/* register async notifier so we get noticed when sensor is connected */
> -	bridge->asd.match.fwnode =
> -		fwnode_graph_get_remote_port_parent(of_fwnode_handle(ep_node));
> -	bridge->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> +	v4l2_async_notifier_init(&bridge->notifier);
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +					&bridge->notifier,
> +					of_fwnode_handle(ep_node),
> +					sizeof(*asd));
>  	of_node_put(ep_node);
>  
> -	v4l2_async_notifier_init(&bridge->notifier);
> -	ret = v4l2_async_notifier_add_subdev(&bridge->notifier, &bridge->asd);
> -	if (ret) {
> +	if (IS_ERR(asd)) {
>  		dev_err(&client->dev, "fail to register asd to notifier %d",
> -			ret);
> -		fwnode_handle_put(bridge->asd.match.fwnode);
> -		return ret;
> +			PTR_ERR(asd));
> +		return PTR_ERR(asd);
>  	}
>  	bridge->notifier.ops = &mipid02_notifier_ops;
>  
> 
