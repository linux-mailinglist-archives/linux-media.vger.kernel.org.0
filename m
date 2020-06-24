Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A94B3206E30
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 09:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390062AbgFXHts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 03:49:48 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34891 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390013AbgFXHtq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 03:49:46 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3E14E1BF210;
        Wed, 24 Jun 2020 07:49:39 +0000 (UTC)
Date:   Wed, 24 Jun 2020 09:53:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
Message-ID: <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>

 +Niklas, +Laurent

Niklas, Laurent, how does this play with CAP_IO_MC ?

Thanks
  j

> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
> ioctls for use via v4l2 subdevice node.
>
> This commit should probably not be pushed upstream, because the (old)
> idea of video inputs conflicts with the newer concept of establishing
> media links between src->sink pads.
>
> However it might make sense for some subdevices to support enum/get/set
> inputs. One example would be the analog front end subdevice for the
> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
> can be done without requiring the implementation of media entities that
> would define the analog source for which to establish a media link.
>
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
>  include/media/v4l2-subdev.h           | 11 +++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 6b989fe..73fbfe9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  			return -ENOTTY;
>  		return v4l2_querymenu(vfh->ctrl_handler, arg);
>
> +	case VIDIOC_ENUMINPUT:
> +		return v4l2_subdev_call(sd, video, enuminput, arg);
> +
> +	case VIDIOC_G_INPUT:
> +		return v4l2_subdev_call(sd, video, g_input, arg);
> +
> +	case VIDIOC_S_INPUT:
> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
> +
>  	case VIDIOC_G_CTRL:
>  		if (!vfh->ctrl_handler)
>  			return -ENOTTY;
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f7fe78a..6e1a9cd 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
>   * @g_input_status: get input status. Same as the status field in the
>   *	&struct &v4l2_input
>   *
> + * @enuminput: enumerate inputs. Should return the same input status as
> + *      @g_input_status if the passed input index is the currently active
> + *      input.
> + *
> + * @g_input: returns the currently active input index.
> + *
> + * @s_input: set the active input.
> + *
>   * @s_stream: used to notify the driver that a video stream will start or has
>   *	stopped.
>   *
> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
>  	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
>  	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
>  	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
>  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
>  	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
>  	int (*g_frame_interval)(struct v4l2_subdev *sd,
> --
> 2.7.4
>
