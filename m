Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54FF1A8F0F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392121AbgDNXWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731159AbgDNXWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:22:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0D5C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:22:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39518521;
        Wed, 15 Apr 2020 01:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586906529;
        bh=ysxYqg5QJxezoIZCWI7NnCcaCyuxYmqK1c4ApGuGlKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VOgntpqM3SL0ST5Z2BNnqNdQMCj19X8uxnNh41D/c3BmBmxRc5ivY390SzXxGy2My
         7m+FxA4SOBm8vTvxUuRp1hCFfSOyzxByH5Es2/LC0CoaoM0Xm4s1JJk/6suaaGDRqf
         b0PLDFaRoSRluOgsM2fudSrSLW54eq6wlt4hubNI=
Date:   Wed, 15 Apr 2020 02:21:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 08/17] media: imx: Add
 imx_media_create_fwnode_pad_link()
Message-ID: <20200414232157.GA28533@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-9-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-9-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:47PM -0800, Steve Longerbeam wrote:
> Add functions to create media links between a source and sink subdevice
> based on fwnode endpoint connections between them.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 91 +++++++++++++++++++++
>  drivers/staging/media/imx/imx-media.h       |  4 +
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 0788a1874557..87152bd9af22 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -729,6 +729,97 @@ void imx_media_grp_id_to_sd_name(char *sd_name, int sz, u32 grp_id, int ipu_id)
>  }
>  EXPORT_SYMBOL_GPL(imx_media_grp_id_to_sd_name);
>  
> +/*
> + * Look for and create a single fwnode link that connects a source
> + * subdevice to a sink pad.
> + */
> +int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
> +				     struct media_pad *sink)
> +{
> +	struct fwnode_handle *endpoint;
> +
> +	/* loop thru the source's fwnode endpoints */
> +	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
> +		struct fwnode_handle *remote_ep;
> +		int src_idx, sink_idx, ret;
> +		struct media_pad *src;
> +
> +		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
> +		if (!remote_ep)
> +			continue;
> +
> +		/*
> +		 * ask the sink entity to verify that this fwnode link
> +		 * actually does connect with the entity, and if so that
> +		 * it connects to its requested sink pad.
> +		 */
> +		sink_idx = media_entity_get_fwnode_pad(sink->entity,
> +						       remote_ep,
> +						       MEDIA_PAD_FL_SINK);
> +		fwnode_handle_put(remote_ep);
> +
> +		if (sink_idx < 0 || sink_idx != sink->index)
> +			continue;
> +
> +		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
> +						      endpoint,
> +						      MEDIA_PAD_FL_SOURCE);
> +		if (src_idx < 0)
> +			continue;
> +
> +		/*
> +		 * found the fwnode link that works, create the media
> +		 * link for it.
> +		 */
> +
> +		fwnode_handle_put(endpoint);
> +
> +		src = &src_sd->entity.pads[src_idx];
> +
> +		/* success if it already exists */
> +		if (media_entity_find_link(src, sink))
> +			return 0;
> +
> +		dev_dbg(src_sd->dev, "%s:%d -> %s:%d\n",
> +			src_sd->entity.name, src_idx,
> +			sink->entity->name, sink_idx);
> +
> +		ret = media_create_pad_link(&src_sd->entity, src_idx,
> +					    sink->entity, sink_idx, 0);
> +		if (ret)
> +			dev_err(src_sd->dev,
> +				"%s:%d -> %s:%d failed with %d\n",
> +				src_sd->entity.name, src_idx,
> +				sink->entity->name, sink_idx, ret);
> +
> +		return ret;
> +	}
> +
> +	return -ENXIO;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_link);
> +
> +int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
> +				      struct v4l2_subdev *sink_sd)
> +{
> +	int i;
> +
> +	for (i = 0; i < sink_sd->entity.num_pads; i++) {
> +		struct media_pad *pad = &sink_sd->entity.pads[i];
> +		int ret;
> +
> +		if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +			continue;
> +
> +		ret = imx_media_create_fwnode_pad_link(src_sd, pad);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_links);

As commented in 09/17, I think these should be core helpers.

> +
>  struct v4l2_subdev *
>  imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
>  				struct fwnode_handle *fwnode)
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 11861191324a..f90a65ba4ced 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -183,6 +183,10 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
>  				    struct ipu_image *image);
>  void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
>  				 u32 grp_id, int ipu_id);
> +int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
> +				     struct media_pad *sink);
> +int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
> +				      struct v4l2_subdev *sink_sd);
>  struct v4l2_subdev *
>  imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
>  				struct fwnode_handle *fwnode);

-- 
Regards,

Laurent Pinchart
