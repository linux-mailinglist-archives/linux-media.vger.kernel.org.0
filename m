Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321B27A4EB7
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjIRQZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjIRQZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:25:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4858F76B0
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:19:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBEF880F;
        Mon, 18 Sep 2023 15:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695045072;
        bh=vTW7YH2T2/j1ZL6wCJUcJl1tJIPUG5vtLbqew/kR4sQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y32SOt3O3PRngg46EF7FR4Tut++mIPGQwpWDwgPlFYi2DIu8HQoShTVRod8yyiiCZ
         cjj9m59Pi+gKIgVSR9Uem1fLP5/tE+OP/CdHkrva3+LcT1AiowxU8QVyXnBFERjz6N
         VlNzvr+st5eXm5qyNNATVMWQki6//eRS4iYLNxO8=
Date:   Mon, 18 Sep 2023 16:53:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 05/12] media: ccs: Switch to init_cfg
Message-ID: <20230918135300.GI28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:31PM +0300, Sakari Ailus wrote:
> Use init_cfg() instead of manually setting up defaults during probe and
> file handle open.

I don't think you touch probe time in this patch. That's fine, it's
addressed in the next patch, so with the commit message updated,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 3fed071b65ab..db461b0e49c8 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2945,7 +2945,6 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
>  }
>  
>  static const struct v4l2_subdev_ops ccs_ops;
> -static const struct v4l2_subdev_internal_ops ccs_internal_ops;
>  static const struct media_entity_operations ccs_entity_ops;
>  
>  static int ccs_register_subdev(struct ccs_sensor *sensor,
> @@ -3076,13 +3075,12 @@ static void ccs_create_subdev(struct ccs_sensor *sensor,
>  	if (ssd == sensor->src)
>  		return;
>  
> -	ssd->sd.internal_ops = &ccs_internal_ops;
>  	ssd->sd.owner = THIS_MODULE;
>  	ssd->sd.dev = &client->dev;
>  	v4l2_set_subdevdata(&ssd->sd, client);
>  }
>  
> -static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +static int ccs_init_cfg(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state)
>  {
>  	struct ccs_subdev *ssd = to_ccs_subdev(sd);
>  	struct ccs_sensor *sensor = ssd->sensor;
> @@ -3092,9 +3090,9 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  
>  	for (i = 0; i < ssd->npads; i++) {
>  		struct v4l2_mbus_framefmt *try_fmt =
> -			v4l2_subdev_get_try_format(sd, fh->state, i);
> +			v4l2_subdev_get_try_format(sd, sd_state, i);
>  		struct v4l2_rect *try_crop =
> -			v4l2_subdev_get_try_crop(sd, fh->state, i);
> +			v4l2_subdev_get_try_crop(sd, sd_state, i);
>  		struct v4l2_rect *try_comp;
>  
>  		ccs_get_native_size(ssd, try_crop);
> @@ -3107,7 +3105,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  		if (ssd == sensor->pixel_array)
>  			continue;
>  
> -		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
> +		try_comp = v4l2_subdev_get_try_compose(sd, sd_state, i);
>  		*try_comp = *try_crop;
>  	}
>  
> @@ -3123,6 +3121,7 @@ static const struct v4l2_subdev_video_ops ccs_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
> +	.init_cfg = ccs_init_cfg,
>  	.enum_mbus_code = ccs_enum_mbus_code,
>  	.get_fmt = ccs_get_format,
>  	.set_fmt = ccs_set_format,
> @@ -3148,11 +3147,6 @@ static const struct media_entity_operations ccs_entity_ops = {
>  static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
>  	.registered = ccs_registered,
>  	.unregistered = ccs_unregistered,
> -	.open = ccs_open,
> -};
> -
> -static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
> -	.open = ccs_open,
>  };
>  
>  /* -----------------------------------------------------------------------------

-- 
Regards,

Laurent Pinchart
