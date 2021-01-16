Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4FF2F8E44
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbhAPRXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:23:33 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42755 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbhAPRXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 12:23:33 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3EAA540003;
        Sat, 16 Jan 2021 17:22:49 +0000 (UTC)
Date:   Sat, 16 Jan 2021 18:23:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 07/13] media: cdns-csi2rx: Use
 v4l2_async_notifier_add_fwnode_remote_subdev helpers
Message-ID: <20210116172308.mzmclkinth33u4bq@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-8-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112132339.5621-8-ezequiel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Tue, Jan 12, 2021 at 10:23:33AM -0300, Ezequiel Garcia wrote:
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

Seems good!
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index be9ec59774d6..7d299cacef8c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -81,7 +81,6 @@ struct csi2rx_priv {
>  	struct media_pad		pads[CSI2RX_PAD_MAX];
>
>  	/* Remote source */
> -	struct v4l2_async_subdev	asd;
>  	struct v4l2_subdev		*source_subdev;
>  	int				source_pad;
>  };
> @@ -362,6 +361,7 @@ static int csi2rx_get_resources(struct csi2rx_priv *csi2rx,
>  static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  {
>  	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
> +	struct v4l2_async_subdev *asd;
>  	struct fwnode_handle *fwh;
>  	struct device_node *ep;
>  	int ret;
> @@ -395,17 +395,13 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  		return -EINVAL;
>  	}
>
> -	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
> -	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -	of_node_put(ep);
> -
>  	v4l2_async_notifier_init(&csi2rx->notifier);
>
> -	ret = v4l2_async_notifier_add_subdev(&csi2rx->notifier, &csi2rx->asd);
> -	if (ret) {
> -		fwnode_handle_put(csi2rx->asd.match.fwnode);
> -		return ret;
> -	}
> +	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi2rx->notifier,
> +							   fwh, sizeof(*asd));
> +	of_node_put(ep);
> +	if (IS_ERR(asd))
> +		return PTR_ERR(asd);
>
>  	csi2rx->notifier.ops = &csi2rx_notifier_ops;
>
> --
> 2.29.2
>
