Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA21A8F29
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392167AbgDNXcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731539AbgDNXcT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:32:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0492AC061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:32:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67DB4521;
        Wed, 15 Apr 2020 01:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586907137;
        bh=5PtzAoHwr84Vphd6PKtG66eA71b4itiSC8Li5RgYJ/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSpbMAvjrKLHGKErjvYc/y/2FE1N4v+lKTtp6OAghviE29Cu3ZjVyjQhz6bxqdvng
         GtOOHf1l9nA29dL9ZYSyuVXWDZ0BBN1gP8dFGr1XQR29jLhnx5Zqt6sgPRVPhKYIMg
         IjHhLBOERiShM0cImP0IqkeQ9fAldu7FrFzvnI6I=
Date:   Wed, 15 Apr 2020 02:32:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 15/17] media: imx: Create missing links from CSI-2
 receiver
Message-ID: <20200414233205.GD28533@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-16-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-16-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:54PM -0800, Steve Longerbeam wrote:
> The entities external to the i.MX6 IPU and i.MX7 now create the links
> to their fwnode-endpoint connected entities in their notifier bound
> callbacks. Which means imx_media_create_of_links() and
> imx_media_create_csi_of_links() are no longer needed and are removed.
> 
> However there is still one case in which imx-media needs to create
> fwnode-endpoint based links at probe completion. The v4l2-async framework
> does not allow multiple subdevice notifiers to contain a duplicate
> subdevice in their asd_list. Only the first subdev notifier that discovers
> and adds that one subdevice to its asd_list will receive a bound callback
> for it. Other subdevices that also have firmware endpoint connections to
> this duplicate subdevice will not have it in their asd_list, and thus will
> never receive a bound callback for it. In the case of imx-media, the one
> duplicate subdevice in question is the i.MX6 MIPI CSI-2 receiver.
> 
> Until there is a solution to that problem, rewrite imx_media_create_links()
> to add the missing links from the CSI-2 receiver to the CSIs and CSI muxes.
> The function is renamed imx_media_create_csi2_links().
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
> Changes in v3:
> - call a local imx-media utility imx_media_create_fwnode_pad_links().
> Changes in v2:
> - this is a rewrite of v1 "media: imx: Use media_create_fwnode_links for
>   external links", which only adds the missing CSI-2 receiver links.
> ---
>  .../staging/media/imx/imx-media-dev-common.c  |  46 +++----
>  drivers/staging/media/imx/imx-media-of.c      | 114 ------------------
>  drivers/staging/media/imx/imx-media.h         |   4 -
>  3 files changed, 17 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index 66b505f7e8df..f7ad3cbbeec2 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -30,41 +30,31 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
>  }
>  
>  /*
> - * Create the media links for all subdevs that registered.
> + * Create the missing media links from the CSI-2 receiver.
>   * Called after all async subdevs have bound.
>   */
> -static int imx_media_create_links(struct v4l2_async_notifier *notifier)
> +static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
>  {
> -	struct imx_media_dev *imxmd = notifier2dev(notifier);
> -	struct v4l2_subdev *sd;
> +	struct v4l2_subdev *sd, *csi2 = NULL;
>  
>  	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
> -		switch (sd->grp_id) {
> -		case IMX_MEDIA_GRP_ID_IPU_VDIC:
> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRP:
> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRPENC:
> -		case IMX_MEDIA_GRP_ID_IPU_IC_PRPVF:
> -			/*
> -			 * links have already been created for the
> -			 * sync-registered subdevs.
> -			 */
> -			break;
> -		case IMX_MEDIA_GRP_ID_IPU_CSI0:
> -		case IMX_MEDIA_GRP_ID_IPU_CSI1:
> -		case IMX_MEDIA_GRP_ID_CSI:
> -			imx_media_create_csi_of_links(imxmd, sd);
> -			break;
> -		default:
> -			/*
> -			 * if this subdev has fwnode links, create media
> -			 * links for them.
> -			 */
> -			imx_media_create_of_links(imxmd, sd);
> +		if (sd->grp_id == IMX_MEDIA_GRP_ID_CSI2) {
> +			csi2 = sd;
>  			break;
>  		}
>  	}
> +	if (!csi2)
> +		return;
>  
> -	return 0;
> +	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
> +		/* skip if not a CSI or a video mux */
> +		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
> +		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
> +		    sd->entity.function != MEDIA_ENT_F_VID_MUX)

This is a bit dangerous, as the external source connected to the CSI-2
receiver could be a video mux. How about assigning a group id to the
internal mux, as done in the "[PATCH 2/2] media: staging/imx: Don't
create links between external entities" patch that I've posted, and
checking the group id here ?

With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			continue;
> +
> +		imx_media_create_fwnode_pad_links(csi2, sd);
> +	}
>  }
>  
>  /*
> @@ -196,9 +186,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
>  
>  	mutex_lock(&imxmd->mutex);
>  
> -	ret = imx_media_create_links(notifier);
> -	if (ret)
> -		goto unlock;
> +	imx_media_create_csi2_links(imxmd);
>  
>  	ret = imx_media_create_pad_vdev_lists(imxmd);
>  	if (ret)
> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> index 2d3efd2a6dde..82e13e972e23 100644
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -74,117 +74,3 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
> -
> -/*
> - * Create a single media link to/from sd using a fwnode link.
> - *
> - * NOTE: this function assumes an OF port node is equivalent to
> - * a media pad (port id equal to media pad index), and that an
> - * OF endpoint node is equivalent to a media link.
> - */
> -static int create_of_link(struct imx_media_dev *imxmd,
> -			  struct v4l2_subdev *sd,
> -			  struct v4l2_fwnode_link *link)
> -{
> -	struct v4l2_subdev *remote, *src, *sink;
> -	int src_pad, sink_pad;
> -
> -	if (link->local_port >= sd->entity.num_pads)
> -		return -EINVAL;
> -
> -	remote = imx_media_find_subdev_by_fwnode(imxmd, link->remote_node);
> -	if (!remote)
> -		return 0;
> -
> -	if (sd->entity.pads[link->local_port].flags & MEDIA_PAD_FL_SINK) {
> -		src = remote;
> -		src_pad = link->remote_port;
> -		sink = sd;
> -		sink_pad = link->local_port;
> -	} else {
> -		src = sd;
> -		src_pad = link->local_port;
> -		sink = remote;
> -		sink_pad = link->remote_port;
> -	}
> -
> -	/* make sure link doesn't already exist before creating */
> -	if (media_entity_find_link(&src->entity.pads[src_pad],
> -				   &sink->entity.pads[sink_pad]))
> -		return 0;
> -
> -	v4l2_info(sd->v4l2_dev, "%s:%d -> %s:%d\n",
> -		  src->name, src_pad, sink->name, sink_pad);
> -
> -	return media_create_pad_link(&src->entity, src_pad,
> -				     &sink->entity, sink_pad, 0);
> -}
> -
> -/*
> - * Create media links to/from sd using its device-tree endpoints.
> - */
> -int imx_media_create_of_links(struct imx_media_dev *imxmd,
> -			      struct v4l2_subdev *sd)
> -{
> -	struct v4l2_fwnode_link link;
> -	struct device_node *ep;
> -	int ret;
> -
> -	for_each_endpoint_of_node(sd->dev->of_node, ep) {
> -		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
> -		if (ret)
> -			continue;
> -
> -		ret = create_of_link(imxmd, sd, &link);
> -		v4l2_fwnode_put_link(&link);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(imx_media_create_of_links);
> -
> -/*
> - * Create media links to the given CSI subdevice's sink pads,
> - * using its device-tree endpoints.
> - */
> -int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
> -				  struct v4l2_subdev *csi)
> -{
> -	struct device_node *csi_np = csi->dev->of_node;
> -	struct device_node *ep;
> -
> -	for_each_child_of_node(csi_np, ep) {
> -		struct fwnode_handle *fwnode, *csi_ep;
> -		struct v4l2_fwnode_link link;
> -		int ret;
> -
> -		memset(&link, 0, sizeof(link));
> -
> -		link.local_node = of_fwnode_handle(csi_np);
> -		link.local_port = CSI_SINK_PAD;
> -
> -		csi_ep = of_fwnode_handle(ep);
> -
> -		fwnode = fwnode_graph_get_remote_endpoint(csi_ep);
> -		if (!fwnode)
> -			continue;
> -
> -		fwnode = fwnode_get_parent(fwnode);
> -		fwnode_property_read_u32(fwnode, "reg", &link.remote_port);
> -		fwnode = fwnode_get_next_parent(fwnode);
> -		if (is_of_node(fwnode) &&
> -		    of_node_name_eq(to_of_node(fwnode), "ports"))
> -			fwnode = fwnode_get_next_parent(fwnode);
> -		link.remote_node = fwnode;
> -
> -		ret = create_of_link(imxmd, csi, &link);
> -		fwnode_handle_put(link.remote_node);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(imx_media_create_csi_of_links);
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 5f23d852122f..5271b84bea9a 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -248,10 +248,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
>  /* imx-media-of.c */
>  int imx_media_add_of_subdevs(struct imx_media_dev *dev,
>  			     struct device_node *np);
> -int imx_media_create_of_links(struct imx_media_dev *imxmd,
> -			      struct v4l2_subdev *sd);
> -int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
> -				  struct v4l2_subdev *csi);
>  int imx_media_of_add_csi(struct imx_media_dev *imxmd,
>  			 struct device_node *csi_np);
>  

-- 
Regards,

Laurent Pinchart
