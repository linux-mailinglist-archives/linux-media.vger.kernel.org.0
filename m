Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5778279C146
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjILAqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 20:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjILAp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 20:45:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB3313F545
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 17:35:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF7C212F;
        Mon, 11 Sep 2023 23:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694469399;
        bh=QDRoYOOj+YpVw9J8pVxrBILAJyVHFzNdRZsIwQK+pGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MUtwX+M+aQ3Y3N9uSRNBze6pTyi0hXTpW970kf74XmVaT+5+BY7qTrKnwRlDiPvtW
         e9kioEyYLqYnmWktPbO1v4Jfc/PUyCdnC5TgvawPjwmZx3bny5fZua2sEi2mQgqsN7
         k8H8behRWCab9BOxfg5DhDiDhUUJi+YMPwTcz/o0=
Date:   Tue, 12 Sep 2023 00:58:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] media: i2c: Drop ifdeffery from sensor drivers
Message-ID: <20230911215823.GB29317@pendragon.ideasonboard.com>
References: <20230911145636.29972-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911145636.29972-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 11, 2023 at 04:56:36PM +0200, Jacopo Mondi wrote:
> Since commit 7d3c7d2a2914 ("media: i2c: Add a camera sensor top level
> menu") the CONFIG_MEDIA_CONTROLLER and CONFIG_VIDEO_V4L2_SUBDEV_API are
> selected by the top-level VIDEO_CAMERA_SENSOR menu.
> 
> Remove all ifdefferies from camera sensor drivers to simplify the code.
> 
> Compile-tested only.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> ---
> 
>  drivers/media/i2c/mt9m111.c | 13 +------------
>  drivers/media/i2c/mt9v011.c |  6 ------
>  drivers/media/i2c/mt9v111.c | 14 --------------
>  drivers/media/i2c/ov2640.c  | 11 +----------
>  drivers/media/i2c/ov2659.c  | 16 +---------------
>  drivers/media/i2c/ov2685.c  | 12 ------------
>  drivers/media/i2c/ov5695.c  | 19 -------------------
>  drivers/media/i2c/ov7670.c  | 20 --------------------
>  drivers/media/i2c/ov772x.c  |  4 ----
>  drivers/media/i2c/ov7740.c  | 23 ++---------------------

I can't wait to see all these drivers converted to the subdev active
state API :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  10 files changed, 5 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index df8d9c9e6a96..1f44b72e8a70 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -244,9 +244,7 @@ struct mt9m111 {
>  	bool is_streaming;
>  	/* user point of view - 0: falling 1: rising edge */
>  	unsigned int pclk_sample:1;
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad pad;
> -#endif
>  };
> 
>  static const struct mt9m111_mode_info mt9m111_mode_data[MT9M111_NUM_MODES] = {
> @@ -527,13 +525,9 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
>  		return -EINVAL;
> 
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mf = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
>  		format->format = *mf;
>  		return 0;
> -#else
> -		return -EINVAL;
> -#endif
>  	}
> 
>  	mf->width	= mt9m111->width;
> @@ -1120,7 +1114,6 @@ static int mt9m111_s_stream(struct v4l2_subdev *sd, int enable)
>  static int mt9m111_init_cfg(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state)
>  {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *format =
>  		v4l2_subdev_get_try_format(sd, sd_state, 0);
> 
> @@ -1132,7 +1125,7 @@ static int mt9m111_init_cfg(struct v4l2_subdev *sd,
>  	format->ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT;
>  	format->quantization	= V4L2_QUANTIZATION_DEFAULT;
>  	format->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
> -#endif
> +
>  	return 0;
>  }
> 
> @@ -1315,13 +1308,11 @@ static int mt9m111_probe(struct i2c_client *client)
>  		return ret;
>  	}
> 
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	mt9m111->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	mt9m111->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&mt9m111->subdev.entity, 1, &mt9m111->pad);
>  	if (ret < 0)
>  		goto out_hdlfree;
> -#endif
> 
>  	mt9m111->current_mode = &mt9m111_mode_data[MT9M111_MODE_SXGA_15FPS];
>  	mt9m111->frame_interval.numerator = 1;
> @@ -1350,10 +1341,8 @@ static int mt9m111_probe(struct i2c_client *client)
>  	return 0;
> 
>  out_entityclean:
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	media_entity_cleanup(&mt9m111->subdev.entity);
>  out_hdlfree:
> -#endif
>  	v4l2_ctrl_handler_free(&mt9m111->hdl);
> 
>  	return ret;
> diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
> index 774861ba7747..37a634b92cd5 100644
> --- a/drivers/media/i2c/mt9v011.c
> +++ b/drivers/media/i2c/mt9v011.c
> @@ -49,9 +49,7 @@ MODULE_PARM_DESC(debug, "Debug level (0-2)");
> 
>  struct mt9v011 {
>  	struct v4l2_subdev sd;
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad pad;
> -#endif
>  	struct v4l2_ctrl_handler ctrls;
>  	unsigned width, height;
>  	unsigned xtal;
> @@ -483,9 +481,7 @@ static int mt9v011_probe(struct i2c_client *c)
>  	u16 version;
>  	struct mt9v011 *core;
>  	struct v4l2_subdev *sd;
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	int ret;
> -#endif
> 
>  	/* Check if the adapter supports the needed features */
>  	if (!i2c_check_functionality(c->adapter,
> @@ -499,14 +495,12 @@ static int mt9v011_probe(struct i2c_client *c)
>  	sd = &core->sd;
>  	v4l2_i2c_subdev_init(sd, c, &mt9v011_ops);
> 
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	core->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> 
>  	ret = media_entity_pads_init(&sd->entity, 1, &core->pad);
>  	if (ret < 0)
>  		return ret;
> -#endif
> 
>  	/* Check if the sensor is really a MT9V011 */
>  	version = mt9v011_read(sd, R00_MT9V011_CHIP_VERSION);
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index 1f7edc0f5b1a..f859b49e13bf 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -121,9 +121,7 @@ struct mt9v111_dev {
>  	u8 addr_space;
> 
>  	struct v4l2_subdev sd;
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>  	struct media_pad pad;
> -#endif
> 
>  	struct v4l2_ctrl *auto_awb;
>  	struct v4l2_ctrl *auto_exp;
> @@ -797,11 +795,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
>  {
>  	switch (which) {
>  	case V4L2_SUBDEV_FORMAT_TRY:
> -#if IS_ENABLED(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
> -#else
> -		return &sd_state->pads->try_fmt;
> -#endif
>  	case V4L2_SUBDEV_FORMAT_ACTIVE:
>  		return &mt9v111->fmt;
>  	default:
> @@ -987,11 +981,9 @@ static const struct v4l2_subdev_ops mt9v111_ops = {
>  	.pad	= &mt9v111_pad_ops,
>  };
> 
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>  static const struct media_entity_operations mt9v111_subdev_entity_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
> -#endif
> 
>  /* --- V4L2 ctrl --- */
>  static int mt9v111_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -1203,7 +1195,6 @@ static int mt9v111_probe(struct i2c_client *client)
> 
>  	v4l2_i2c_subdev_init(&mt9v111->sd, client, &mt9v111_ops);
> 
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>  	mt9v111->sd.flags	|= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	mt9v111->sd.entity.ops	= &mt9v111_subdev_entity_ops;
>  	mt9v111->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> @@ -1212,7 +1203,6 @@ static int mt9v111_probe(struct i2c_client *client)
>  	ret = media_entity_pads_init(&mt9v111->sd.entity, 1, &mt9v111->pad);
>  	if (ret)
>  		goto error_free_entity;
> -#endif
> 
>  	ret = mt9v111_chip_probe(mt9v111);
>  	if (ret)
> @@ -1225,9 +1215,7 @@ static int mt9v111_probe(struct i2c_client *client)
>  	return 0;
> 
>  error_free_entity:
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&mt9v111->sd.entity);
> -#endif
> 
>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&mt9v111->ctrls);
> @@ -1245,9 +1233,7 @@ static void mt9v111_remove(struct i2c_client *client)
> 
>  	v4l2_async_unregister_subdev(sd);
> 
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&sd->entity);
> -#endif
> 
>  	v4l2_ctrl_handler_free(&mt9v111->ctrls);
> 
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index bb6c9863a546..ba96b98ff080 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -293,9 +293,7 @@ struct ov2640_win_size {
> 
>  struct ov2640_priv {
>  	struct v4l2_subdev		subdev;
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	struct media_pad pad;
> -#endif
>  	struct v4l2_ctrl_handler	hdl;
>  	u32	cfmt_code;
>  	struct clk			*clk;
> @@ -922,13 +920,9 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
>  		return -EINVAL;
> 
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
>  		format->format = *mf;
>  		return 0;
> -#else
> -		return -EINVAL;
> -#endif
>  	}
> 
>  	mf->width	= priv->win->width;
> @@ -1005,7 +999,6 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
>  static int ov2640_init_cfg(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *sd_state)
>  {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *try_fmt =
>  		v4l2_subdev_get_try_format(sd, sd_state, 0);
>  	const struct ov2640_win_size *win =
> @@ -1019,7 +1012,7 @@ static int ov2640_init_cfg(struct v4l2_subdev *sd,
>  	try_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	try_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>  	try_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> -#endif
> +
>  	return 0;
>  }
> 
> @@ -1239,13 +1232,11 @@ static int ov2640_probe(struct i2c_client *client)
>  		ret = priv->hdl.error;
>  		goto err_hdl;
>  	}
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	priv->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&priv->subdev.entity, 1, &priv->pad);
>  	if (ret < 0)
>  		goto err_hdl;
> -#endif
> 
>  	ret = ov2640_video_probe(client);
>  	if (ret < 0)
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 5429bd2eb053..2c3dbe164eb6 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1031,7 +1031,6 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
>  	dev_dbg(&client->dev, "ov2659_get_fmt\n");
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		struct v4l2_mbus_framefmt *mf;
> 
>  		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
> @@ -1039,9 +1038,6 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
>  		fmt->format = *mf;
>  		mutex_unlock(&ov2659->lock);
>  		return 0;
> -#else
> -		return -EINVAL;
> -#endif
>  	}
> 
>  	mutex_lock(&ov2659->lock);
> @@ -1113,10 +1109,8 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
>  	mutex_lock(&ov2659->lock);
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
>  		*mf = fmt->format;
> -#endif
>  	} else {
>  		s64 val;
> 
> @@ -1306,7 +1300,6 @@ static int ov2659_power_on(struct device *dev)
>   * V4L2 subdev internal operations
>   */
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static int ov2659_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> @@ -1319,7 +1312,6 @@ static int ov2659_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> 
>  	return 0;
>  }
> -#endif
> 
>  static const struct v4l2_subdev_core_ops ov2659_subdev_core_ops = {
>  	.log_status = v4l2_ctrl_subdev_log_status,
> @@ -1338,7 +1330,6 @@ static const struct v4l2_subdev_pad_ops ov2659_subdev_pad_ops = {
>  	.set_fmt = ov2659_set_fmt,
>  };
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static const struct v4l2_subdev_ops ov2659_subdev_ops = {
>  	.core  = &ov2659_subdev_core_ops,
>  	.video = &ov2659_subdev_video_ops,
> @@ -1348,7 +1339,6 @@ static const struct v4l2_subdev_ops ov2659_subdev_ops = {
>  static const struct v4l2_subdev_internal_ops ov2659_subdev_internal_ops = {
>  	.open = ov2659_open,
>  };
> -#endif
> 
>  static int ov2659_detect(struct v4l2_subdev *sd)
>  {
> @@ -1489,15 +1479,12 @@ static int ov2659_probe(struct i2c_client *client)
> 
>  	sd = &ov2659->sd;
>  	client->flags |= I2C_CLIENT_SCCB;
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> -	v4l2_i2c_subdev_init(sd, client, &ov2659_subdev_ops);
> 
> +	v4l2_i2c_subdev_init(sd, client, &ov2659_subdev_ops);
>  	sd->internal_ops = &ov2659_subdev_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>  		     V4L2_SUBDEV_FL_HAS_EVENTS;
> -#endif
> 
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	ov2659->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sd->entity, 1, &ov2659->pad);
> @@ -1505,7 +1492,6 @@ static int ov2659_probe(struct i2c_client *client)
>  		v4l2_ctrl_handler_free(&ov2659->ctrls);
>  		return ret;
>  	}
> -#endif
> 
>  	mutex_init(&ov2659->lock);
> 
> diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> index 303793e1f97d..de0d34e43969 100644
> --- a/drivers/media/i2c/ov2685.c
> +++ b/drivers/media/i2c/ov2685.c
> @@ -547,7 +547,6 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
>  	return ret;
>  }
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static int ov2685_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct ov2685 *ov2685 = to_ov2685(sd);
> @@ -563,7 +562,6 @@ static int ov2685_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> 
>  	return 0;
>  }
> -#endif
> 
>  static int __maybe_unused ov2685_runtime_resume(struct device *dev)
>  {
> @@ -660,11 +658,9 @@ static const struct v4l2_subdev_ops ov2685_subdev_ops = {
>  	.pad	= &ov2685_pad_ops,
>  };
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static const struct v4l2_subdev_internal_ops ov2685_internal_ops = {
>  	.open = ov2685_open,
>  };
> -#endif
> 
>  static const struct v4l2_ctrl_ops ov2685_ctrl_ops = {
>  	.s_ctrl = ov2685_set_ctrl,
> @@ -833,17 +829,13 @@ static int ov2685_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_power_off;
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	ov2685->subdev.internal_ops = &ov2685_internal_ops;
>  	ov2685->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -#endif
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	ov2685->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ov2685->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&ov2685->subdev.entity, 1, &ov2685->pad);
>  	if (ret < 0)
>  		goto err_power_off;
> -#endif
> 
>  	ret = v4l2_async_register_subdev(&ov2685->subdev);
>  	if (ret) {
> @@ -858,9 +850,7 @@ static int ov2685_probe(struct i2c_client *client)
>  	return 0;
> 
>  err_clean_entity:
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&ov2685->subdev.entity);
> -#endif
>  err_power_off:
>  	__ov2685_power_off(ov2685);
>  err_free_handler:
> @@ -877,9 +867,7 @@ static void ov2685_remove(struct i2c_client *client)
>  	struct ov2685 *ov2685 = to_ov2685(sd);
> 
>  	v4l2_async_unregister_subdev(sd);
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&sd->entity);
> -#endif
>  	v4l2_ctrl_handler_free(&ov2685->ctrl_handler);
>  	mutex_destroy(&ov2685->mutex);
> 
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index 3023b7254167..8d1c3a673c23 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -821,9 +821,7 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.height = mode->height;
>  	fmt->format.field = V4L2_FIELD_NONE;
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
> -#endif
>  	} else {
>  		ov5695->cur_mode = mode;
>  		h_blank = mode->hts_def - mode->width;
> @@ -849,13 +847,8 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
> 
>  	mutex_lock(&ov5695->mutex);
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
>  							  fmt->pad);
> -#else
> -		mutex_unlock(&ov5695->mutex);
> -		return -EINVAL;
> -#endif
>  	} else {
>  		fmt->format.width = mode->width;
>  		fmt->format.height = mode->height;
> @@ -1048,7 +1041,6 @@ static int __maybe_unused ov5695_runtime_suspend(struct device *dev)
>  	return 0;
>  }
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static int ov5695_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct ov5695 *ov5695 = to_ov5695(sd);
> @@ -1068,18 +1060,15 @@ static int ov5695_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> 
>  	return 0;
>  }
> -#endif
> 
>  static const struct dev_pm_ops ov5695_pm_ops = {
>  	SET_RUNTIME_PM_OPS(ov5695_runtime_suspend,
>  			   ov5695_runtime_resume, NULL)
>  };
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static const struct v4l2_subdev_internal_ops ov5695_internal_ops = {
>  	.open = ov5695_open,
>  };
> -#endif
> 
>  static const struct v4l2_subdev_video_ops ov5695_video_ops = {
>  	.s_stream = ov5695_s_stream,
> @@ -1322,17 +1311,13 @@ static int ov5695_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_power_off;
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	sd->internal_ops = &ov5695_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -#endif
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	ov5695->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sd->entity, 1, &ov5695->pad);
>  	if (ret < 0)
>  		goto err_power_off;
> -#endif
> 
>  	ret = v4l2_async_register_subdev_sensor(sd);
>  	if (ret) {
> @@ -1347,9 +1332,7 @@ static int ov5695_probe(struct i2c_client *client)
>  	return 0;
> 
>  err_clean_entity:
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&sd->entity);
> -#endif
>  err_power_off:
>  	__ov5695_power_off(ov5695);
>  err_free_handler:
> @@ -1366,9 +1349,7 @@ static void ov5695_remove(struct i2c_client *client)
>  	struct ov5695 *ov5695 = to_ov5695(sd);
> 
>  	v4l2_async_unregister_subdev(sd);
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	media_entity_cleanup(&sd->entity);
> -#endif
>  	v4l2_ctrl_handler_free(&ov5695->ctrl_handler);
>  	mutex_destroy(&ov5695->mutex);
> 
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index 2f55491ef571..85bf745c0bad 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -217,9 +217,7 @@ struct ov7670_devtype {
>  struct ov7670_format_struct;  /* coming later */
>  struct ov7670_info {
>  	struct v4l2_subdev sd;
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	struct media_pad pad;
> -#endif
>  	struct v4l2_ctrl_handler hdl;
>  	struct {
>  		/* gain cluster */
> @@ -1108,9 +1106,7 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
>  		struct v4l2_subdev_format *format)
>  {
>  	struct ov7670_info *info = to_state(sd);
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *mbus_fmt;
> -#endif
>  	int ret;
> 
>  	if (format->pad)
> @@ -1120,11 +1116,9 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
>  		ret = ov7670_try_fmt_internal(sd, &format->format, NULL, NULL);
>  		if (ret)
>  			return ret;
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>  						      format->pad);
>  		*mbus_fmt = format->format;
> -#endif
>  		return 0;
>  	}
> 
> @@ -1148,18 +1142,12 @@ static int ov7670_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_format *format)
>  {
>  	struct ov7670_info *info = to_state(sd);
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *mbus_fmt;
> -#endif
> 
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>  		format->format = *mbus_fmt;
>  		return 0;
> -#else
> -		return -EINVAL;
> -#endif
>  	} else {
>  		format->format = info->format;
>  	}
> @@ -1720,7 +1708,6 @@ static void ov7670_get_default_format(struct v4l2_subdev *sd,
>  	format->field = V4L2_FIELD_NONE;
>  }
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static int ov7670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct v4l2_mbus_framefmt *format =
> @@ -1730,7 +1717,6 @@ static int ov7670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> 
>  	return 0;
>  }
> -#endif
> 
>  /* ----------------------------------------------------------------------- */
> 
> @@ -1766,11 +1752,9 @@ static const struct v4l2_subdev_ops ov7670_ops = {
>  	.pad = &ov7670_pad_ops,
>  };
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static const struct v4l2_subdev_internal_ops ov7670_subdev_internal_ops = {
>  	.open = ov7670_open,
>  };
> -#endif
> 
>  /* ----------------------------------------------------------------------- */
> 
> @@ -1861,10 +1845,8 @@ static int ov7670_probe(struct i2c_client *client)
>  	sd = &info->sd;
>  	v4l2_i2c_subdev_init(sd, client, &ov7670_ops);
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	sd->internal_ops = &ov7670_subdev_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> -#endif
> 
>  	info->clock_speed = 30; /* default: a guess */
> 
> @@ -1977,13 +1959,11 @@ static int ov7670_probe(struct i2c_client *client)
>  			       V4L2_EXPOSURE_MANUAL, false);
>  	v4l2_ctrl_cluster(2, &info->saturation);
> 
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	info->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	info->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&info->sd.entity, 1, &info->pad);
>  	if (ret < 0)
>  		goto hdl_free;
> -#endif
> 
>  	v4l2_ctrl_handler_setup(&info->hdl);
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 386d69c8e074..7618b58a7ad0 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -433,9 +433,7 @@ struct ov772x_priv {
>  	struct mutex			  lock;
>  	int				  power_count;
>  	int				  streaming;
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad pad;
> -#endif
>  	enum v4l2_mbus_type		  bus_type;
>  };
> 
> @@ -1488,13 +1486,11 @@ static int ov772x_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto error_gpio_put;
> 
> -#ifdef CONFIG_MEDIA_CONTROLLER
>  	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	priv->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&priv->subdev.entity, 1, &priv->pad);
>  	if (ret < 0)
>  		goto error_gpio_put;
> -#endif
> 
>  	priv->cfmt = &ov772x_cfmts[0];
>  	priv->win = &ov772x_win_sizes[0];
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index dffdb475e433..78d04ce68971 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -83,9 +83,7 @@
> 
>  struct ov7740 {
>  	struct v4l2_subdev subdev;
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	struct media_pad pad;
> -#endif
>  	struct v4l2_mbus_framefmt format;
>  	const struct ov7740_pixfmt *fmt;  /* Current format */
>  	const struct ov7740_framesize *frmsize;
> @@ -807,9 +805,7 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
>  	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
>  	const struct ov7740_pixfmt *ovfmt;
>  	const struct ov7740_framesize *fsize;
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *mbus_fmt;
> -#endif
>  	int ret;
> 
>  	mutex_lock(&ov7740->mutex);
> @@ -822,11 +818,10 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
>  		ret = ov7740_try_fmt_internal(sd, &format->format, NULL, NULL);
>  		if (ret)
>  			goto error;
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> +
>  		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>  						      format->pad);
>  		*mbus_fmt = format->format;
> -#endif
>  		mutex_unlock(&ov7740->mutex);
>  		return 0;
>  	}
> @@ -851,26 +846,18 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_format *format)
>  {
>  	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	struct v4l2_mbus_framefmt *mbus_fmt;
> -#endif
> -	int ret = 0;
> 
>  	mutex_lock(&ov7740->mutex);
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>  		format->format = *mbus_fmt;
> -		ret = 0;
> -#else
> -		ret = -EINVAL;
> -#endif
>  	} else {
>  		format->format = ov7740->format;
>  	}
>  	mutex_unlock(&ov7740->mutex);
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static const struct v4l2_subdev_pad_ops ov7740_subdev_pad_ops = {
> @@ -899,7 +886,6 @@ static void ov7740_get_default_format(struct v4l2_subdev *sd,
>  	format->field = V4L2_FIELD_NONE;
>  }
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  static int ov7740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  {
>  	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
> @@ -916,7 +902,6 @@ static int ov7740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  static const struct v4l2_subdev_internal_ops ov7740_subdev_internal_ops = {
>  	.open = ov7740_open,
>  };
> -#endif
> 
>  static int ov7740_probe_dt(struct i2c_client *client,
>  			   struct ov7740 *ov7740)
> @@ -1094,18 +1079,14 @@ static int ov7740_probe(struct i2c_client *client)
>  	sd = &ov7740->subdev;
>  	v4l2_i2c_subdev_init(sd, client, &ov7740_subdev_ops);
> 
> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>  	sd->internal_ops = &ov7740_subdev_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> -#endif
> 
> -#if defined(CONFIG_MEDIA_CONTROLLER)
>  	ov7740->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  	ret = media_entity_pads_init(&sd->entity, 1, &ov7740->pad);
>  	if (ret)
>  		return ret;
> -#endif
> 
>  	ret = ov7740_set_power(ov7740, 1);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
