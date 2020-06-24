Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98ECD2070CF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 12:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388570AbgFXKIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 06:08:16 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56213 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388197AbgFXKIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 06:08:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o2K7jtJvmx3Ajo2KAjiqc8; Wed, 24 Jun 2020 12:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592993292; bh=+qt7HSOZFbWaG4XJYDTjnPTe3YUioxC7/TOQF9HvO/s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GmG/iigA30dc+VHvIoqZgRdORTDUAxmgYracXCbljfS35kNlavcscqJjngxMMsDHB
         W4VOy2OzcoFQukHkly4VwsiI9+49DWhUnkJWygdG/HT6uJwLYxHs2Ry5dToaP9Gtle
         rJO6wGOCDpdyOuKZEScoHZNitYc9YPx/oMSof3r56hYWgPIj0XMeeQLWmktFIWfU6c
         H3BZ0hHkkud15AXGcs6dZHWZ8XnDoFnnN+vtuyUEMM+0UQMv5bQztL/0pp/Tu7Yain
         3dE9IRIPD6uEzt8q/wW2lZKD7Cl5p2HEIHUMp/nO3jApYsSfTmJBQPeWHd06AEaeGW
         0ElCJ9sJV+CHg==
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
To:     Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Michael Rodin <mrodin@de.adit-jv.com>, efriedrich@de.adit-jv.com,
        erosca@de.adit-jv.com
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <32cdf1a3-1353-d3e9-66b6-82ced163d8f8@xs4all.nl>
Date:   Wed, 24 Jun 2020 12:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEzhWNachN9thnW603RU1zwWw7Y6lMeMWgVmQ1fyXAjBezjMK2S5XHtBjG1FKI87//0WbR8ajesRLrWX8u9NP+LGi7SlM+aocSY5n7N/3vYdFCTNa1SR
 RC8c5dM+m0Dl3em+ZHHQfkq5B+2seB5svFDONBGfVxurxYxfz+mB1ovWnvU6nG2zUgrjpmUDzx8Rgz0r4ffOB9wpdLC76oKeYmEr8jwND89xCCgEZpTtLUjt
 3++8Pqod7/dFwbBETHSLnAz4ArOdF+rkKHWY1A+J6/5175F5Rmr6PINYuw0dReVd2dfiA7nJWu9TDc6XJKMdUjhsB23UafyAR3/JMAEoFYnzGsN7Rdy7MQ5k
 21TGCLmS8iuy7qg3wCvIkZFbmtpb55+in48oCuPvTXHPnVv96rF4HG/qIKNMsIb30e9Bgnbnz3cgnjvXy7g8qFkT/0HyKIb+uhxk1gf/W5JtoZWoWcD9STMO
 cSIiJP5lTIV61p0KKCc1yfmdmqJ59HQtVb8Engfty1DM7IjTSu7pP9jaxV4xUC7Mu1mHJ22jaP/9yf705Abm4cPYy/WHwxhUtJyqT9irMVV8+DyB64VAbrPR
 i8Uu5dgh8sxD12DPU1MiW7NijM3q9t23SF/lwf7JrFHVGMjA1MQpUw9g92SFAG7UNzaG84/tmW7LYyYxRntbq7HX
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 12:00, Ramzi BEN MEFTAH wrote:
> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> 
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

Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

This doesn't work: these ioctls refer to physical inputs on a backplane
of a device. But subdevices have no idea about that. This is high-level
information that is typically only known to a bridge driver based on
board information.

For PCI/USB drivers this comes from card definitions in the driver itself.

For platform drivers this should come from the device tree, but this hasn't
been fully implemented yet.

So if this is something that you want to implement, then look at:

Documentation/devicetree/bindings/display/connector/hdmi-connector.txt

and add this to the DT for your board, and implement code to query this
in the platform driver.

Regards,

	Hans

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
> 

