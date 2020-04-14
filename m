Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968171A8F12
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392124AbgDNXY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731159AbgDNXYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:24:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCBEC061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:24:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 775B1521;
        Wed, 15 Apr 2020 01:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586906662;
        bh=dR+Ah6U0c8Fmo9NFBbhsHCnAN4O4zIcP6cdmkK/oDGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pCLclZrcjPuDHO4mi9T29xJ5ofkIMAnqWJLCL4/LSJftiFip4TNQEIklmt/UzqkzP
         lI6ewV4kc4iQ5W0Pw+QDZsWY75VHpBL/x2qqH7LT1YoxOISo49koG2gsM7TzkkkiRR
         dKDYnC8FxgzEXJ+G43U+en6ZzgTZVWFNPdbdgqwI=
Date:   Wed, 15 Apr 2020 02:24:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 14/17] media: imx: csi: Lookup upstream endpoint with
 imx_media_get_pad_fwnode
Message-ID: <20200414232410.GB28533@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-15-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-15-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:53PM -0800, Steve Longerbeam wrote:
> Fix the 1:1 port-id:pad-index assumption for the upstream subdevice, by
> searching the upstream subdevice's endpoints for one that maps to the
> pad's index. This is carried out by a new reverse mapping function
> imx_media_get_pad_fwnode().

This gets pretty inefficient :-S I think it's fine for now, but I
believe there's room for additional refactoring to avoid the need to get
the upstream endpoint in the first place.

> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-csi.c   | 22 ++++----------
>  drivers/staging/media/imx/imx-media-utils.c | 33 +++++++++++++++++++++
>  drivers/staging/media/imx/imx-media.h       |  1 +
>  drivers/staging/media/imx/imx7-media-csi.c  | 25 +++++-----------
>  4 files changed, 47 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 59ab1cf72841..0388d73e916c 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -164,7 +164,7 @@ static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
>  static int csi_get_upstream_endpoint(struct csi_priv *priv,
>  				     struct v4l2_fwnode_endpoint *ep)
>  {
> -	struct device_node *endpoint, *port;
> +	struct fwnode_handle *endpoint;
>  	struct media_entity *src;
>  	struct v4l2_subdev *sd;
>  	struct media_pad *pad;
> @@ -203,23 +203,13 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
>  	if (!pad)
>  		return -ENODEV;
>  
> -	sd = media_entity_to_v4l2_subdev(pad->entity);
> +	endpoint = imx_media_get_pad_fwnode(pad);
> +	if (IS_ERR(endpoint))
> +		return PTR_ERR(endpoint);
>  
> -	/*
> -	 * NOTE: this assumes an OF-graph port id is the same as a
> -	 * media pad index.
> -	 */
> -	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
> -	if (!port)
> -		return -ENODEV;
> -
> -	endpoint = of_get_next_child(port, NULL);
> -	of_node_put(port);
> -	if (!endpoint)
> -		return -ENODEV;
> +	v4l2_fwnode_endpoint_parse(endpoint, ep);
>  
> -	v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), ep);
> -	of_node_put(endpoint);
> +	fwnode_handle_put(endpoint);
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 87152bd9af22..61752c6b074d 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -1007,6 +1007,39 @@ imx_media_pipeline_video_device(struct media_entity *start_entity,
>  }
>  EXPORT_SYMBOL_GPL(imx_media_pipeline_video_device);
>  
> +/*
> + * Find a fwnode endpoint that maps to the given subdevice's pad.
> + * If there are multiple endpoints that map to the pad, only the
> + * first endpoint encountered is returned.
> + *
> + * On success the refcount of the returned fwnode endpoint is
> + * incremented.
> + */
> +struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad)
> +{
> +	struct fwnode_handle *endpoint;
> +	struct v4l2_subdev *sd;
> +
> +	if (!is_media_entity_v4l2_subdev(pad->entity))
> +		return ERR_PTR(-ENODEV);
> +
> +	sd = media_entity_to_v4l2_subdev(pad->entity);
> +
> +	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), endpoint) {
> +		int pad_idx = media_entity_get_fwnode_pad(&sd->entity,
> +							  endpoint,
> +							  pad->flags);
> +		if (pad_idx < 0)
> +			continue;
> +
> +		if (pad_idx == pad->index)
> +			return endpoint;
> +	}
> +
> +	return ERR_PTR(-ENODEV);
> +}
> +EXPORT_SYMBOL_GPL(imx_media_get_pad_fwnode);
> +
>  /*
>   * Turn current pipeline streaming on/off starting from entity.
>   */
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index f90a65ba4ced..5f23d852122f 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -205,6 +205,7 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
>  struct video_device *
>  imx_media_pipeline_video_device(struct media_entity *start_entity,
>  				enum v4l2_buf_type buftype, bool upstream);
> +struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
>  
>  struct imx_media_dma_buf {
>  	void          *virt;
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 88e21c13e420..9b31379611ac 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -439,9 +439,8 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
>  					  struct v4l2_fwnode_endpoint *ep,
>  					  bool skip_mux)
>  {
> -	struct device_node *endpoint, *port;
> +	struct fwnode_handle *endpoint;
>  	struct media_entity *src;
> -	struct v4l2_subdev *sd;
>  	struct media_pad *pad;
>  
>  	if (!csi->src_sd)
> @@ -463,29 +462,19 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
>  	if (!pad)
>  		return -ENODEV;
>  
> -	sd = media_entity_to_v4l2_subdev(pad->entity);
> -
>  	/* To get bus type we may need to skip video mux */
>  	if (skip_mux && src->function == MEDIA_ENT_F_VID_MUX) {
> -		src = &sd->entity;
> +		src = pad->entity;
>  		goto skip_video_mux;
>  	}
>  
> -	/*
> -	 * NOTE: this assumes an OF-graph port id is the same as a
> -	 * media pad index.
> -	 */
> -	port = of_graph_get_port_by_id(sd->dev->of_node, pad->index);
> -	if (!port)
> -		return -ENODEV;
> +	endpoint = imx_media_get_pad_fwnode(pad);
> +	if (IS_ERR(endpoint))
> +		return PTR_ERR(endpoint);
>  
> -	endpoint = of_get_next_child(port, NULL);
> -	of_node_put(port);
> -	if (!endpoint)
> -		return -ENODEV;
> +	v4l2_fwnode_endpoint_parse(endpoint, ep);
>  
> -	v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint), ep);
> -	of_node_put(endpoint);
> +	fwnode_handle_put(endpoint);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
