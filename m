Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955D81A8EDA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634341AbgDNXCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:02:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37528 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731135AbgDNXCr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:02:47 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31E60521;
        Wed, 15 Apr 2020 01:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586905364;
        bh=D4oCYP094HHf7bhKII0QzkqJxN5ZMqr345CEafRo9Y4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YOT0WFsYw8kdefJhiiEbqkAlrcl2jP2N99jDrF2XhCjrhC3ANr3H9Hj1lTzrCeVXJ
         aso75zC4/OoSfXw87DUAMpI4XyHv1Zsj5RcMACsqVQ2AU913Hs5tSuDjPeICheOVdF
         q1V/psjcfK0Ky2J6jpKGIc4eQcBpfTUdR7JwinGM=
Date:   Wed, 15 Apr 2020 02:02:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 05/17] media: imx: csi: Implement get_fwnode_pad op
Message-ID: <20200414230232.GB27621@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-6-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-6-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:44PM -0800, Steve Longerbeam wrote:
> The CSI does not have a 1:1 relationship between fwnode port numbers and
> pad indexes. In fact the CSI fwnode device is itself a port which is the
> sink, containing only a single fwnode endpoint. Implement media_entity
> operation get_fwnode_pad to first verify the given endpoint is the CSI's
> sink endpoint, and if so return the CSI sink pad index.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-csi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index f409fca88dcf..35f2512ed2a9 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1827,9 +1827,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
>  		ipu_csi_put(priv->csi);
>  }
>  
> +/*
> + * The CSI has only one fwnode endpoint, at the sink pad. Verify the
> + * endpoint belongs to us, and return CSI_SINK_PAD.
> + */
> +static int csi_get_fwnode_pad(struct media_entity *entity,
> +			      struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct csi_priv *priv = v4l2_get_subdevdata(sd);
> +	struct fwnode_handle *csi_port = dev_fwnode(priv->dev);
> +	struct fwnode_handle *csi_ep;
> +	int ret;
> +
> +	csi_ep = fwnode_get_next_child_node(csi_port, NULL);
> +
> +	ret = endpoint->local_fwnode == csi_ep ? CSI_SINK_PAD : -ENXIO;
> +
> +	fwnode_handle_put(csi_ep);
> +
> +	return ret;
> +}
> +
>  static const struct media_entity_operations csi_entity_ops = {
>  	.link_setup = csi_link_setup,
>  	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = csi_get_fwnode_pad,
>  };
>  
>  static const struct v4l2_subdev_core_ops csi_core_ops = {

-- 
Regards,

Laurent Pinchart
