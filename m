Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FCB2F8DB8
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbhAPRFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:05:43 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:47512 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbhAPQep (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 11:34:45 -0500
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B79B43B3DBE
        for <linux-media@vger.kernel.org>; Sat, 16 Jan 2021 16:23:50 +0000 (UTC)
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8825D240006;
        Sat, 16 Jan 2021 16:22:47 +0000 (UTC)
Date:   Sat, 16 Jan 2021 17:23:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 05/13] media: st-mipid02: Use
 v4l2_async_notifier_add_fwnode_remote_subdev helpers
Message-ID: <20210116162306.sn3it2tz4plf3zos@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-6-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-6-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 12, 2021 at 10:23:31AM -0300, Ezequiel Garcia wrote:
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

I don't have hw to test this, but it looks good!
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

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
>  	}
>  	bridge->notifier.ops = &mipid02_notifier_ops;
> --
> 2.29.2
>
