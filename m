Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254F83EE745
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbhHQHdp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:33:45 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44067 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238067AbhHQHdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:33:44 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Aug 2021 03:33:44 EDT
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 83E37FF80A;
        Tue, 17 Aug 2021 07:33:09 +0000 (UTC)
Date:   Tue, 17 Aug 2021 09:33:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rcar-csi2: Serialize access to set_fmt and
 get_fmt
Message-ID: <20210817073357.ey2l4lecz5vv5cdy@uno.localdomain>
References: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
 <20210815024915.1183417-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210815024915.1183417-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sun, Aug 15, 2021 at 04:49:15AM +0200, Niklas Söderlund wrote:
> The access to the internal storage of the format rcar_csi2.mf should be
> serialized, extend the exciting lock mutex to also cover this.

truly an exciting lock mutex indeed! :D

>
> While at it document the mutex.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index a02573dbd5da4f62..2fdfdc38de424c72 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -370,9 +370,8 @@ struct rcar_csi2 {
>  	struct v4l2_subdev *remote;
>  	unsigned int remote_pad;
>
> +	struct mutex lock; /* Protects mf and stream_count. */
>  	struct v4l2_mbus_framefmt mf;
> -
> -	struct mutex lock;
>  	int stream_count;
>
>  	unsigned short lanes;
> @@ -725,6 +724,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>  	struct v4l2_mbus_framefmt *framefmt;
>
> +	mutex_lock(&priv->lock);
> +
>  	if (!rcsi2_code_to_fmt(format->format.code))
>  		format->format.code = rcar_csi2_formats[0].code;
>
> @@ -735,6 +736,8 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>  		*framefmt = format->format;
>  	}
>
> +	mutex_unlock(&priv->lock);
> +
>  	return 0;
>  }
>
> @@ -744,11 +747,15 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>
> +	mutex_lock(&priv->lock);
> +
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		format->format = priv->mf;
>  	else
>  		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
>
> +	mutex_unlock(&priv->lock);
> +
>  	return 0;
>  }
>
> --
> 2.32.0
>
