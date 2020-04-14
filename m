Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFF21A8EFA
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392075AbgDNXQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:16:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392078AbgDNXQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:16:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AFA4521;
        Wed, 15 Apr 2020 01:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586906189;
        bh=qP9bJbJTuVpZIETojJlWnMts7BNlfBySxSvJbNRzino=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cBPe5lm6jrONMiC683fPBIP4ZWYvgMUkDR65EEvK8nw0vLPidO5+2ZA+nAmv4GaYb
         uqzcLKdJUmf6dEaXWkmU6EPlTZ9aXaXdqiW+85CW3t4VG8BGmi73QbJJGkQiXxcxiB
         GHK0Z/CVIPS2i1YecYfqCY0Oos+IlUojMDSJyahk=
Date:   Wed, 15 Apr 2020 02:16:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 09/17] media: video-mux: Create media links in bound
 notifier
Message-ID: <20200414231617.GE27621@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-10-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-10-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:48PM -0800, Steve Longerbeam wrote:
> Implement a notifier bound op to register media links from the remote
> sub-device's source pad(s) to the video-mux sink pad(s).
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
> Changes in v3:
> - this version does the work inline. The previous version called
>   a media_create_fwnode_links() which is removed in v3.
> ---
>  drivers/media/platform/video-mux.c | 92 ++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index f446ada82176..3991b1ea671c 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -36,6 +36,12 @@ static const struct v4l2_mbus_framefmt video_mux_format_mbus_default = {
>  	.field = V4L2_FIELD_NONE,
>  };
>  
> +static inline struct video_mux *
> +notifier_to_video_mux(struct v4l2_async_notifier *n)
> +{
> +	return container_of(n, struct video_mux, notifier);
> +}
> +
>  static inline struct video_mux *v4l2_subdev_to_video_mux(struct v4l2_subdev *sd)
>  {
>  	return container_of(sd, struct video_mux, subdev);
> @@ -360,6 +366,90 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
>  	.video = &video_mux_subdev_video_ops,
>  };
>  
> +static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct video_mux *vmux = notifier_to_video_mux(notifier);
> +	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
> +	struct fwnode_handle *sd_fwnode = dev_fwnode(sd->dev);
> +	struct fwnode_handle *vmux_ep;

There doesn't seem to be anything in this function that is specific to
the video_mux driver. I think it would make sense to turn it into a
generic helper that creates links between two subdevs based on their
fwnode connections.

I also wonder if it wouldn't be more efficient to create links at
complete() time instead of bound() time, in which case the helper would
create all links for a given subdevice, not links between two specific
subdevices (or maybe all links for a given pad direction, to be able to
remove the existing link check below).

> +
> +	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
> +		struct fwnode_handle *remote_ep, *sd_ep;
> +		struct media_pad *src_pad, *sink_pad;
> +		struct fwnode_endpoint fwep;
> +		int src_idx, sink_idx, ret;
> +		bool remote_ep_belongs;
> +
> +		ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
> +		if (ret)
> +			continue;
> +
> +		/* only create links to the vmux sink pads */
> +		if (fwep.port >= vmux->subdev.entity.num_pads - 1)
> +			continue;
> +
> +		sink_idx = fwep.port;
> +		sink_pad = &vmux->subdev.entity.pads[sink_idx];
> +
> +		remote_ep = fwnode_graph_get_remote_endpoint(vmux_ep);
> +		if (!remote_ep)
> +			continue;
> +
> +		/*
> +		 * verify that this remote endpoint is owned by the
> +		 * sd, in case the sd does not check for that in its
> +		 * .get_fwnode_pad operation or does not implement it.
> +		 */
> +		remote_ep_belongs = false;
> +		fwnode_graph_for_each_endpoint(sd_fwnode, sd_ep) {
> +			if (sd_ep == remote_ep) {
> +				remote_ep_belongs = true;
> +				fwnode_handle_put(sd_ep);
> +				break;
> +			}
> +		}
> +		if (!remote_ep_belongs)
> +			continue;
> +
> +		src_idx = media_entity_get_fwnode_pad(&sd->entity, remote_ep,
> +						      MEDIA_PAD_FL_SOURCE);
> +		fwnode_handle_put(remote_ep);
> +
> +		if (src_idx < 0)
> +			continue;
> +
> +		src_pad = &sd->entity.pads[src_idx];
> +
> +		/* skip this link if it already exists */
> +		if (media_entity_find_link(src_pad, sink_pad))
> +			continue;

Have you encountered this in practice ? If we only create links for sink
pads this shouldn't happen.

> +
> +		ret = media_create_pad_link(&sd->entity, src_idx,
> +					    &vmux->subdev.entity,
> +					    sink_idx, 0);
> +		if (ret) {
> +			dev_err(vmux->subdev.dev,
> +				"%s:%d -> %s:%d failed with %d\n",
> +				sd->entity.name, src_idx,
> +				vmux->subdev.entity.name, sink_idx, ret);
> +			fwnode_handle_put(vmux_ep);
> +			return ret;
> +		}
> +
> +		dev_dbg(vmux->subdev.dev, "%s:%d -> %s:%d\n",
> +			sd->entity.name, src_idx,
> +			vmux->subdev.entity.name, sink_idx);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations video_mux_notify_ops = {
> +	.bound = video_mux_notify_bound,
> +};
> +
>  static int video_mux_async_register(struct video_mux *vmux,
>  				    unsigned int num_input_pads)
>  {
> @@ -397,6 +487,8 @@ static int video_mux_async_register(struct video_mux *vmux,
>  		}
>  	}
>  
> +	vmux->notifier.ops = &video_mux_notify_ops;
> +
>  	ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
>  						  &vmux->notifier);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
