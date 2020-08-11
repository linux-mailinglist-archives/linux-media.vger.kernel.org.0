Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEB24226C
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 00:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgHKWTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 18:19:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34922 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgHKWTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 18:19:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26FCA9A8;
        Wed, 12 Aug 2020 00:19:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597184390;
        bh=2dF4WRa3/ccznVwifQHQmaT/mmZBzeHSq2p48vYM0+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DQqiZU5+PrqIy8HpGRL/Ml8fz7trb6uc4oWeQXWfWIOL9IiF/5IPoGwXm0ZhVMpXm
         qynWkUFY7oayl6MJ9TNQ2CLkNGsSG5ar0llqb85vhnRsXCfOK2OmMQDfYFGQ2G5OGB
         FdrjdfGDQuPilfcFaNKIRQibdwBq9CgK6NcpiMWw=
Date:   Wed, 12 Aug 2020 01:19:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] v4l: async: Use endpoint node, not device node, for
 fwnode match
Message-ID: <20200811221936.GA22031@pendragon.ideasonboard.com>
References: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
 <20200807111619.3664763-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200807111619.3664763-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas and Sakari,

Thank you for the patch.

On Fri, Aug 07, 2020 at 01:16:18PM +0200, Niklas Söderlund wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> V4L2 async framework can use both device's fwnode and endpoints's fwnode
> for matching the async sub-device with the sub-device. In order to proceed
> moving towards endpoint matching assign the endpoint to the async
> sub-device.
> 
> As most async sub-device drivers (and the related hardware) only supports
> a single endpoint, use the first endpoint found. This works for all
> current drivers --- we only ever supported a single async sub-device per
> device to begin with.
> 
> For async devices that have no endpoints, continue to use the fwnode
> related to the device. This includes e.g. lens devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 8 ++++++--
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c851881..f3b0338718e0f0a9 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -758,8 +758,12 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	 * (struct v4l2_subdev.dev), and async sub-device does not
>  	 * exist independently of the device at any point of time.
>  	 */
> -	if (!sd->fwnode && sd->dev)
> -		sd->fwnode = dev_fwnode(sd->dev);
> +	if (!sd->fwnode && sd->dev) {
> +		sd->fwnode = fwnode_graph_get_next_endpoint(
> +			dev_fwnode(sd->dev), NULL);
> +		if (!sd->fwnode)
> +			sd->fwnode = dev_fwnode(sd->dev);

dev_fwnode() returns a borrowed reference, while
fwnode_graph_get_next_endpoint() returns a new reference. This will
cause a reference count issue, one way or another.

Otherwise, I think the change is good.

> +	}
>  
>  	mutex_lock(&list_lock);
>  
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index a4c3c77c1894648e..79706129e28b668a 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -815,7 +815,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
>  
>  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	asd->match.fwnode =
> -		fwnode_graph_get_remote_port_parent(endpoint);
> +		fwnode_graph_get_remote_endpoint(endpoint);
>  	if (!asd->match.fwnode) {
>  		dev_dbg(dev, "no remote endpoint found\n");
>  		ret = -ENOTCONN;

-- 
Regards,

Laurent Pinchart
