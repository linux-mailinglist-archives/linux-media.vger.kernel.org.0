Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4358E1A8EE5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731133AbgDNXHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:07:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634353AbgDNXHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:07:43 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BD2E521;
        Wed, 15 Apr 2020 01:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586905661;
        bh=rpJC17FhNnfUoS/OF2Ca3PZ4tHBSTTy4+Y3c+0/5HQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XqxLS6d2zx0Zfh875w987aRUvPmPjj8aZet4A40MXIXY1Adsk97hW3E3qyZUZWQo7
         FojZsCyir858pqvI3ef25MFDZte43qO46m98LYbuXRxlmulSmF6ufHzh2atvuJhQ5R
         VKk5QgWNO0gx12MV7l21YO+4ubjYpGP7YtzuCNno=
Date:   Wed, 15 Apr 2020 02:07:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 06/17] media: imx: mipi csi-2: Implement
 get_fwnode_pad op
Message-ID: <20200414230729.GC27621@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-7-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-7-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:45PM -0800, Steve Longerbeam wrote:
> Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
> CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
> maps port numbers and pad indexes 1:1.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index fdd763587e6c..8500207e5ea9 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
>  				      640, 480, 0, V4L2_FIELD_NONE, NULL);
>  }
>  
> +static int csi2_get_fwnode_pad(struct media_entity *entity,
> +			       struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct csi2_dev *csi2 = sd_to_dev(sd);
> +	struct fwnode_handle *csi2_ep;
> +
> +	/*
> +	 * If the endpoint is one of ours, return the endpoint's port
> +	 * number. This device maps port numbers and pad indexes 1:1.
> +	 */
> +	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
> +		if (endpoint->local_fwnode == csi2_ep) {
> +			struct fwnode_endpoint fwep;
> +			int ret;
> +
> +			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
> +
> +			fwnode_handle_put(csi2_ep);
> +
> +			return ret ? ret : fwep.port;
> +		}
> +	}
> +
> +	return -ENXIO;
> +}

As the 1:1 mapping is the common case, would it make sense to modify
media_entity_get_fwnode_pad() accordingly when .get_fwnode_pad is not
set ? The current behaviour is to return the first pad that matches the
requested direction, which could be preserved as a second-level fallback
if the 1:1 mapping doesn't give the right direction (but I'm not sure
there's a use case for that, the 1:1 mapping seems to be all we need if
there's no specific .get_fwnode_pad implementation).

> +
>  static const struct media_entity_operations csi2_entity_ops = {
>  	.link_setup = csi2_link_setup,
>  	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = csi2_get_fwnode_pad,
>  };
>  
>  static const struct v4l2_subdev_video_ops csi2_video_ops = {

-- 
Regards,

Laurent Pinchart
