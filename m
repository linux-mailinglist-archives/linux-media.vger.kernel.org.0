Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A646EC77C
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 09:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbjDXHyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 03:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbjDXHyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 03:54:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC51719AE
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 00:54:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0F47D97;
        Mon, 24 Apr 2023 09:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682322872;
        bh=/6Z0mJsqKLB2DJniMrgvnZK3ddKWaii2PuJurN/XwS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N/q4VqOnBk1UAacAmq98olW5c9amws30N78uTdc69OsE88DJTf2GQDCGs+1mZm+i+
         Ys+B99Sqp2sSkDI69aq0v9+2n6SkD7m8St7bO9vVMrlKC0+vECd6nsIcjHa6WBxPnS
         t83lfUvH5CUDu7+MlCXDXgMX6HrIz/apaD/JpPJk=
Date:   Mon, 24 Apr 2023 10:54:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 6/8] media-ctl: Check for Streams API support
Message-ID: <20230424075454.GF4926@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230421124428.393261-7-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Apr 21, 2023 at 03:44:26PM +0300, Tomi Valkeinen wrote:
> Do two things:

That usually calls for two patches ;-) Or an explanation in the commit
message about why the two are combined.

> - Inform the kernel that we support streams with a call to
>   VIDIOC_SUBDEV_S_CLIENT_CAP
> 
> - Use the returns from VIDIOC_SUBDEV_S_CLIENT_CAP and
>   VIDIOC_SUBDEV_QUERYCAP to decide if streams are supported. If not,
>   fail in case the user tries to use streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/media-ctl/libv4l2subdev.c | 54 +++++++++++++++++++++++++++++++++
>  utils/media-ctl/mediactl-priv.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> index 9205cfa4..186708ff 100644
> --- a/utils/media-ctl/libv4l2subdev.c
> +++ b/utils/media-ctl/libv4l2subdev.c
> @@ -42,6 +42,12 @@
>  
>  int v4l2_subdev_open(struct media_entity *entity)
>  {
> +	struct v4l2_subdev_client_capability clientcap = {};
> +	struct v4l2_subdev_capability subdevcap = {};
> +	bool subdev_streams;
> +	bool client_streams;
> +	int ret;
> +
>  	if (entity->fd != -1)
>  		return 0;
>  
> @@ -54,6 +60,16 @@ int v4l2_subdev_open(struct media_entity *entity)
>  		return ret;
>  	}
>  
> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
> +	subdev_streams = !ret && (subdevcap.capabilities & V4L2_SUBDEV_CAP_STREAMS);
> +
> +	clientcap.capabilities = V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> +
> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &clientcap);
> +	client_streams = !ret && (clientcap.capabilities & V4L2_SUBDEV_CLIENT_CAP_STREAMS);
> +
> +	entity->supports_streams = subdev_streams && client_streams;
> +
>  	return 0;
>  }
>  
> @@ -74,6 +90,11 @@ int v4l2_subdev_get_format(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&fmt, 0, sizeof(fmt));
>  	fmt.pad = pad;
>  	fmt.stream = stream;
> @@ -99,6 +120,11 @@ int v4l2_subdev_set_format(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&fmt, 0, sizeof(fmt));
>  	fmt.pad = pad;
>  	fmt.stream = stream;
> @@ -127,6 +153,11 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&u.sel, 0, sizeof(u.sel));
>  	u.sel.pad = pad;
>  	u.sel.target = target;
> @@ -166,6 +197,11 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&u.sel, 0, sizeof(u.sel));
>  	u.sel.pad = pad;
>  	u.sel.stream = stream;
> @@ -210,6 +246,11 @@ int v4l2_subdev_set_routing(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
>  	if (ret == -1)
>  		return -errno;
> @@ -231,6 +272,9 @@ int v4l2_subdev_get_routing(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams)

No need for a debug message here ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		return -ENOTSUP;
> +
>  	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
>  	if (ret == -1 && errno != ENOSPC)
>  		return -errno;
> @@ -341,6 +385,11 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&ival, 0, sizeof(ival));
>  	ival.pad = pad;
>  	ival.stream = stream;
> @@ -364,6 +413,11 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!entity->supports_streams && stream) {
> +		media_dbg(entity->media, "Streams API not supported\n");
> +		return -ENOTSUP;
> +	}
> +
>  	memset(&ival, 0, sizeof(ival));
>  	ival.pad = pad;
>  	ival.stream = stream;
> diff --git a/utils/media-ctl/mediactl-priv.h b/utils/media-ctl/mediactl-priv.h
> index a0d3a55a..eb55e07e 100644
> --- a/utils/media-ctl/mediactl-priv.h
> +++ b/utils/media-ctl/mediactl-priv.h
> @@ -33,6 +33,7 @@ struct media_entity {
>  	struct media_link *links;
>  	unsigned int max_links;
>  	unsigned int num_links;
> +	bool supports_streams;
>  
>  	char devname[32];
>  	int fd;

-- 
Regards,

Laurent Pinchart
