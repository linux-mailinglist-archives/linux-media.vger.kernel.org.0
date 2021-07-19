Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3838D3CD45D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 14:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhGSL3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 07:29:15 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:48363 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbhGSL3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 07:29:14 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 404BC10000A;
        Mon, 19 Jul 2021 12:09:51 +0000 (UTC)
Date:   Mon, 19 Jul 2021 14:10:39 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Remove unneeded mutex for get_fmt
 and set_fmt
Message-ID: <20210719121039.gj6nc26nyk3lnmw3@uno.localdomain>
References: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708095550.682465-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Jul 08, 2021 at 11:55:50AM +0200, Niklas Söderlund wrote:
> There is no need to protect 'cfg_fmt' in get_fmt() and set_fmt() as the
> core protects these callbacks. As this is the only usage of the mutex it
> can be removed.

You know, I tried chasing where the vdev->lock used to protect the
subdev's ioctl is set for mex9286 and I wasn't able to find it.

Please validate my understanding:

- The lock used by the core to protect the set/get format subdev ioctl
  is the one in subdev_do_ioctl_lock()

  static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
  {
          struct video_device *vdev = video_devdata(file);
          struct mutex *lock = vdev->lock;

- the max9286 video subdevice node is registered (on R-Car) by
  __v4l2_device_register_subdev_nodes() called by the root notifier
  complete() callback

- The video_device created by __v4l2_device_register_subdev_nodes()
  doesn't initialize any lock

What am I missing ?

Thanks
   j

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/i2c/max9286.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 1aa2c58fd38c5d2b..b1d11a50d6e53ecc 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -18,7 +18,6 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-mux.h>
>  #include <linux/module.h>
> -#include <linux/mutex.h>
>  #include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
> @@ -173,9 +172,6 @@ struct max9286_priv {
>
>  	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
>
> -	/* Protects controls and fmt structures */
> -	struct mutex mutex;
> -
>  	unsigned int nsources;
>  	unsigned int source_mask;
>  	unsigned int route_mask;
> @@ -768,9 +764,7 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
>  	if (!cfg_fmt)
>  		return -EINVAL;
>
> -	mutex_lock(&priv->mutex);
>  	*cfg_fmt = format->format;
> -	mutex_unlock(&priv->mutex);
>
>  	return 0;
>  }
> @@ -796,9 +790,7 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
>  	if (!cfg_fmt)
>  		return -EINVAL;
>
> -	mutex_lock(&priv->mutex);
>  	format->format = *cfg_fmt;
> -	mutex_unlock(&priv->mutex);
>
>  	return 0;
>  }
> @@ -1259,8 +1251,6 @@ static int max9286_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>
> -	mutex_init(&priv->mutex);
> -
>  	priv->client = client;
>  	i2c_set_clientdata(client, priv);
>
> --
> 2.32.0
>
