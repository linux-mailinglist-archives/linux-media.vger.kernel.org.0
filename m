Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D8C41AAC6
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 10:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhI1IoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 04:44:24 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:47889 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235918AbhI1IoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 04:44:23 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 218FC6000A;
        Tue, 28 Sep 2021 08:42:40 +0000 (UTC)
Date:   Tue, 28 Sep 2021 10:43:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2] media: rcar-vin: add G/S_PARM ioctls
Message-ID: <20210928084323.5vuhvkp6ev2emv2z@uno.localdomain>
References: <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
 <20210924135138.29950-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210924135138.29950-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello
  explicit Cc Hans, as I recall the usage of s/g_parm was deprecated
and discouraged in mainline.

Hans: Support for g/s_param is required by Nikita to maintain
compatibility with (out of tree?) subdevice drivers. Should we add it
to the mainline receiver driver ?

What other API should be used to control the subdevice framerate ?
Should it go through VIDIOC_SUBDEV_S_FRAME_INTERVAL instead ?

Thanks
   j

On Fri, Sep 24, 2021 at 04:51:38PM +0300, Nikita Yushchenko wrote:
> From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>
> This adds g/s_parm ioctls for parallel interface.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> Changes from v1:
> - use &vin->vdev to access vin's struct video_device
>
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index bdeff51bf768..a5bfa76fdac6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -527,6 +527,24 @@ static int rvin_s_selection(struct file *file, void *fh,
>  	return 0;
>  }
>
> +static int rvin_g_parm(struct file *file, void *priv,
> +		       struct v4l2_streamparm *parm)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	struct v4l2_subdev *sd = vin_to_source(vin);
> +
> +	return v4l2_g_parm_cap(&vin->vdev, sd, parm);
> +}
> +
> +static int rvin_s_parm(struct file *file, void *priv,
> +		       struct v4l2_streamparm *parm)
> +{
> +	struct rvin_dev *vin = video_drvdata(file);
> +	struct v4l2_subdev *sd = vin_to_source(vin);
> +
> +	return v4l2_s_parm_cap(&vin->vdev, sd, parm);
> +}
> +
>  static int rvin_g_pixelaspect(struct file *file, void *priv,
>  			      int type, struct v4l2_fract *f)
>  {
> @@ -743,6 +761,9 @@ static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
>  	.vidioc_g_selection		= rvin_g_selection,
>  	.vidioc_s_selection		= rvin_s_selection,
>
> +	.vidioc_g_parm			= rvin_g_parm,
> +	.vidioc_s_parm			= rvin_s_parm,
> +
>  	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
>
>  	.vidioc_enum_input		= rvin_enum_input,
> --
> 2.30.2
>
