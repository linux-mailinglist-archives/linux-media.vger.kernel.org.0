Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7E7A4E6D
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjIRQRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjIRQRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:17:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022A9211F
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:03:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D6B11DD2;
        Mon, 18 Sep 2023 15:28:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695043709;
        bh=rLPnMUTqBu4DfXCUnsTE866lD1cBtCW87ySVIOaU9kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MychjZfsu4M4xEJZYA4kT1vJ4wFQKrFR7JAOSvtU5tdf0CGnMD1kvksMQ0iRxBWUg
         ZyOgKLCBl/e6hUA50+LzQceFjiFDL7qtZN5s159bdRmUVeIjgBx93+TyF8AA39712t
         pjNk3DLbnyZVV91hgk6F3G2AqKTLYVnoiZza53MU=
Date:   Mon, 18 Sep 2023 16:30:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 10/12] media: v4l: subdev: Clear frame descriptor
 before get_frame_desc
Message-ID: <20230918133017.GF28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-11-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-11-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:36PM +0300, Sakari Ailus wrote:
> Clear frame descriptor before calling transmitter's get_frame_desc() op.
> Also remove the corresponding memset() calls from drivers.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ds90ub913.c              | 2 --
>  drivers/media/i2c/ds90ub953.c              | 2 --
>  drivers/media/i2c/ds90ub960.c              | 2 --
>  drivers/media/platform/nxp/imx-mipi-csis.c | 2 --
>  drivers/media/v4l2-core/v4l2-subdev.c      | 9 +++++++++
>  5 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index 4bfa3b3cf619..8e9ebed09f64 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -362,8 +362,6 @@ static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	if (ret)
>  		return ret;
>  
> -	memset(fd, 0, sizeof(*fd));
> -
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index dc394e22a42c..644022312833 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -499,8 +499,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	if (ret)
>  		return ret;
>  
> -	memset(fd, 0, sizeof(*fd));
> -
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(sd);
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 8ba5750f5a23..b8f3e5ca03ef 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2786,8 +2786,6 @@ static int ub960_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	if (!ub960_pad_is_source(priv, pad))
>  		return -EINVAL;
>  
> -	memset(fd, 0, sizeof(*fd));
> -
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  
>  	state = v4l2_subdev_lock_and_get_active_state(&priv->sd);
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 16f19a640130..aac9cffe503c 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1114,8 +1114,6 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>  	fd->num_entries = 1;
>  
> -	memset(entry, 0, sizeof(*entry));
> -
>  	entry->flags = 0;
>  	entry->pixelcode = csis_fmt->code;
>  	entry->bus.csi2.vc = 0;
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b92348ad61f6..7b087be3ff4f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -306,6 +306,14 @@ static int call_set_selection(struct v4l2_subdev *sd,
>  	       sd->ops->pad->set_selection(sd, state, sel);
>  }
>  
> +static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_frame_desc *fd)
> +{
> +	memset(fd, 0, sizeof(*fd));
> +
> +	return sd->ops->pad->get_frame_desc(sd, pad, fd);
> +}

I like the operation wrappers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  static inline int check_edid(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_edid *edid)
>  {
> @@ -431,6 +439,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>  	.set_edid		= call_set_edid,
>  	.dv_timings_cap		= call_dv_timings_cap,
>  	.enum_dv_timings	= call_enum_dv_timings,
> +	.get_frame_desc		= call_get_frame_desc,
>  	.get_mbus_config	= call_get_mbus_config,
>  };
>  

-- 
Regards,

Laurent Pinchart
