Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DAE1A8EE6
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634353AbgDNXIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634356AbgDNXIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:08:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CD8C061A0C
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:08:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42C12521;
        Wed, 15 Apr 2020 01:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586905722;
        bh=yCtws6Bda5VvwF6TuYwlGcZmb4+agN/Vv2TYAsgLHkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JItPR3YLMjBPRW6X1N7GLp0Jxy5//tW3Cp66jSYpTwe7swAVwxR8HPzoy1vzEkFOy
         5Lzu3gH5FWgYKc4Qom3KGDAQQI6GEWgjHniSmdSYMfoE8g3dlCD9/fZVttZUUcjJZn
         wNug7/bEXUm0bq2aTKXc7aYbw0Hzwj8dXlk1FF3g=
Date:   Wed, 15 Apr 2020 02:08:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 07/17] media: video-mux: Implement get_fwnode_pad op
Message-ID: <20200414230830.GD27621@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-8-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-8-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:46PM -0800, Steve Longerbeam wrote:
> Implement get_fwnode_pad operation. If the endpoint is owned by the video
> mux, return the endpoint's port number. The video mux maps fwnode port
> numbers and pad indexes 1:1.

If you follow my suggestion from 06/17, this patch could be dropped.

> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/media/platform/video-mux.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index 7b6c96a29aa5..f446ada82176 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -94,9 +94,38 @@ static int video_mux_link_setup(struct media_entity *entity,
>  	return ret;
>  }
>  
> +static int video_mux_get_fwnode_pad(struct media_entity *entity,
> +				    struct fwnode_endpoint *endpoint)
> +{
> +	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
> +	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
> +	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
> +	struct fwnode_handle *vmux_ep;
> +
> +	/*
> +	 * If the endpoint is one of ours, return the endpoint's port
> +	 * number. This device maps port numbers and pad indexes 1:1.
> +	 */
> +	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
> +		if (endpoint->local_fwnode == vmux_ep) {
> +			struct fwnode_endpoint fwep;
> +			int ret;
> +
> +			ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
> +
> +			fwnode_handle_put(vmux_ep);
> +
> +			return ret ? ret : fwep.port;
> +		}
> +	}
> +
> +	return -ENXIO;
> +}
> +
>  static const struct media_entity_operations video_mux_ops = {
>  	.link_setup = video_mux_link_setup,
>  	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = video_mux_get_fwnode_pad,
>  };
>  
>  static int video_mux_s_stream(struct v4l2_subdev *sd, int enable)

-- 
Regards,

Laurent Pinchart
