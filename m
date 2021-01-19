Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494022FC0D2
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbhASUVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbhASSxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:53:23 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19640C061757
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:52:41 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E5EB51F45271
Subject: Re: [PATCH v2 05/14] media: st-mipid02: Use
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
 <20210118015258.3993-6-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3b78130d-b938-1769-9ec6-1c2f6a7c1e18@collabora.com>
Date:   Tue, 19 Jan 2021 15:52:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118015258.3993-6-ezequiel@collabora.com>
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
>  drivers/media/i2c/st-mipid02.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index 003ba22334cd..9e04ff02257c 100644
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
> @@ -875,17 +875,17 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
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
> +		ret = PTR_ERR(asd);
>  		dev_err(&client->dev, "fail to register asd to notifier %d",
>  			ret);
> -		fwnode_handle_put(bridge->asd.match.fwnode);
>  		return ret;

I would remove the assignment and just:
		return PTR_ERR(asd);

Regards,
Helen

>  	}
>  	bridge->notifier.ops = &mipid02_notifier_ops;
> 
