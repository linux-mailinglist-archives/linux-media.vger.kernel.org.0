Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC21BE156
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgD2Ojw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:39:52 -0400
Received: from mga14.intel.com ([192.55.52.115]:4377 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgD2Ojw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:39:52 -0400
IronPort-SDR: 95fgwkjshHfP8pWPL8EoiLw02GmPDR/AiFX79XHnM1OUoVyA1IMMWRaHLshwT6VM6pxPEq11n5
 lnCQcHcV/VUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:39:51 -0700
IronPort-SDR: BnVy39kzQ4RoUlSTsbT5tQ41pcER0ntvzkcmjQZE+sMBY/tM8Sx7mCUQiRAQ7+Sw/FJWxHV451
 +LkqtF6ahSXA==
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="293220203"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:39:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 58392202AE; Wed, 29 Apr 2020 17:39:46 +0300 (EEST)
Date:   Wed, 29 Apr 2020 17:39:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 03/23] media: v4l2-subdev: add
 v4l2_subdev_get_fwnode_pad_default
Message-ID: <20200429143946.GI9190@paasikivi.fi.intel.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
 <20200420003930.11463-4-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420003930.11463-4-slongerbeam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sun, Apr 19, 2020 at 05:39:10PM -0700, Steve Longerbeam wrote:
> Add a convenience function that can be used as the .get_fwnode_pad
> operation for subdevices that map port numbers and pad indexes 1:1.
> The function verifies the endpoint is owned by the subdevice, and if
> so returns the endpoint port number.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 25 +++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 17 +++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a376b351135f..d5b5cd7a6049 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -696,6 +696,31 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  };
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
> +
> +int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
> +				       struct fwnode_endpoint *endpoint)
> +{
> +	struct fwnode_handle *ep;
> +	struct v4l2_subdev *sd;
> +
> +	if (!is_media_entity_v4l2_subdev(entity))
> +		return -EINVAL;
> +
> +	sd = media_entity_to_v4l2_subdev(entity);
> +
> +	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), ep) {
> +		if (ep != endpoint->local_fwnode)
> +			continue;

If the purpose is just to check a given endpoint belongs to a device, could
it be done in a more simple way? E.g.:

	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
	fwnode_handle_put(fwnode);

	if (dev_fwnode(sd->dev) == fwnode)
		return endpoint->port;

	return -ENXIO;

> +
> +		fwnode_handle_put(ep);
> +
> +		return endpoint->port;
> +	}
> +
> +	return -ENXIO;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fwnode_pad_default);
> +
>  int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  				      struct media_link *link,
>  				      struct v4l2_subdev_format *source_fmt,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index a4848de59852..940181323427 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1027,6 +1027,23 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  
> +/**
> + * v4l2_subdev_get_fwnode_pad_default - Get pad number from a subdev fwnode
> + *                                      endpoint, assuming 1:1 port:pad
> + *
> + * @entity - Pointer to the subdev entity
> + * @endpoint - Pointer to a parsed fwnode endpoint
> + *
> + * This function can be used as the .get_fwnode_pad operation for
> + * subdevices that map port numbers and pad indexes 1:1. If the endpoint
> + * is owned by the subdevice, the function returns the endpoint port
> + * number.
> + *
> + * Returns the endpoint port number on success or a negative error code.
> + */
> +int v4l2_subdev_get_fwnode_pad_default(struct media_entity *entity,
> +				       struct fwnode_endpoint *endpoint);
> +
>  /**
>   * v4l2_subdev_link_validate_default - validates a media link
>   *

-- 
Kind regards,

Sakari Ailus
