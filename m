Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E48B66C36D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjAPPQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:16:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjAPPQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:16:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED2823D95
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673881522; x=1705417522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S7fH61T/HEEfy/ll4W7/buKB20RQuXFBlBHDsJKajWs=;
  b=QDBg67tOEy9+bH8zbL5JMRKLwPDcZluaBXHjPD80T74aqifX3uY0+k8O
   aMw9WOyBIZj9wkfFmS9c0eQhwttqa3KmvDSPjNQ5ztsPHeZ3nR/BDvHBU
   EOY44d3PYfunlw06pGgkQnnE42SuZO1/zc+Gf4E9Om/E/V3UqWdBEg18h
   zdulKbu+hLoX5uNIfqLEwJpkgD9tR4W3ltyvyJ+DUz6ZDyjiNNCWSCst7
   M+F+uRpjn3nygzHxgBbbeFza+RNR3rlGBDSy49BFfssCEE/LGnlGvno9f
   XB9fpa/3FUf1P7M5/dzSvJ7KSh5JIoNQXZXHS3PS1OfbjMarp5HMD8W49
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,221,1669071600"; 
   d="scan'208";a="28455034"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 16:05:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 16:05:20 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 16:05:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673881520; x=1705417520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S7fH61T/HEEfy/ll4W7/buKB20RQuXFBlBHDsJKajWs=;
  b=fTqEovcx0znVQnqxUHl0FioTY3nfTWyhuTmSN0uO69hmRZS1fQWEqgf6
   GAXPUj76oCRhqmqEU7aS5W8crWi8tPzL91z3BOy6yIjKK7dT8JzpiKhV+
   1mRMOQZFUjW8yJT5JLWPum/kOn/h3II0QLX2wZiF2/7OpOQzyXWYhGYX/
   iEEZz4Mu//QhnvL6IlJKw/FUAehuH00RAlNfm4fKWYFdhCgRKbDQbgtpY
   MLZ0YRhKTKfvIfdlVwy6rlorAZqTXsHjsX4L1s/FQVsedTqO9XGiQu/p6
   oIt2P+0r6cOo2iysB8f2op4lIN9F4RUfvO0AB4MfDLwu+2pi9RfqIttAD
   A==;
X-IronPort-AV: E=Sophos;i="5.97,221,1669071600"; 
   d="scan'208";a="28455033"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 16:05:20 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 35072280056;
        Mon, 16 Jan 2023 16:05:20 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 11/17] media: i2c: imx290: Use V4L2 subdev active state
Date:   Mon, 16 Jan 2023 16:05:20 +0100
Message-ID: <2143483.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230116144454.1012-12-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com> <20230116144454.1012-12-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks for the update.

Am Montag, 16. Januar 2023, 15:44:48 CET schrieb Laurent Pinchart:
> Use the V4L2 subdev active state API to store the active format. This
> simplifies the driver not only by dropping the imx290 current_format
> field, but it also allows dropping the imx290 lock, replaced with the
> state lock.
> 
> The lock check in imx290_ctrl_update() can be dropped as
> imx290_set_fmt() can't be called anywmore with which set to ACTIVE
> before controls are initialized.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes since v2:
> 
> - Test for V4L2_CTRL_FLAG_READ_ONLY
> 
> Changes since v1:
> 
> - Remove lock check from imx290_ctrl_update()
> - Drop unrelated change
> - Fix error handling in imx290_subdev_init()
> - Handle errors from v4l2_subdev_init_finalize()
> - Return immediately from imx290_set_ctrl() for read-only controls
> - Call v4l2_subdev_cleanup()
> ---
>  drivers/media/i2c/imx290.c | 159 ++++++++++++++++---------------------
>  1 file changed, 70 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index c1d18ec51e41..74b9a7110709 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -177,12 +177,12 @@ struct imx290 {
>  	struct clk *xclk;
>  	struct regmap *regmap;
>  	u8 nlanes;
> -	u8 bpp;
> 
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
> -	struct v4l2_mbus_framefmt current_format;
> +
>  	const struct imx290_mode *current_mode;
> +	u8 bpp;
> 
>  	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
>  	struct gpio_desc *rst_gpio;
> @@ -192,8 +192,6 @@ struct imx290 {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
> -
> -	struct mutex lock;
>  };
> 
>  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> @@ -524,13 +522,14 @@ static int imx290_set_black_level(struct imx290
> *imx290, black_level >> (16 - imx290->bpp), err);
>  }
> 
> -static int imx290_write_current_format(struct imx290 *imx290)
> +static int imx290_setup_format(struct imx290 *imx290,
> +			       const struct v4l2_mbus_framefmt *format)
>  {
>  	const struct imx290_regval *regs;
>  	unsigned int num_regs;
>  	int ret;
> 
> -	switch (imx290->current_format.code) {
> +	switch (format->code) {
>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
>  		regs = imx290_10bit_settings;
>  		num_regs = ARRAY_SIZE(imx290_10bit_settings);
> @@ -561,12 +560,26 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx290 *imx290 = container_of(ctrl->handler,
>  					     struct imx290, ctrls);
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
> 
> +	/*
> +	 * Return immediately for controls that don't need to be applied to 
the
> +	 * device. Those controls are modified in imx290_ctrl_update(), 
which
> +	 * is called at probe time before runtime PM is initialized, so we
> +	 * can't proceed to the pm_runtime_get_if_in_use() call below.
> +	 */
> +	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> +		return 0;
> +
>  	/* V4L2 controls values will be applied only when power is already 
up */
>  	if (!pm_runtime_get_if_in_use(imx290->dev))
>  		return 0;
> 
> +	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
> +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_ANALOGUE_GAIN:
>  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
> @@ -592,6 +605,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  					       &ret);
>  		}
>  		break;
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -625,13 +639,6 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode-
>link_freq_index];
>  	u64 pixel_rate;
> 
> -	/*
> -	 * This function may be called from imx290_set_fmt() before controls
> -	 * get created by imx290_ctrl_init(). Return immediately in that 
case.
> -	 */
> -	if (!imx290->ctrls.lock)
> -		return;
> -
>  	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
>  	pixel_rate = link_freq * 2 * imx290->nlanes;
>  	do_div(pixel_rate, imx290->bpp);
> @@ -653,7 +660,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  		return ret;
> 
>  	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> -	imx290->ctrls.lock = &imx290->lock;
> 
>  	/*
>  	 * The sensor has an analog gain and a digital gain, both controlled
> @@ -718,10 +724,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  		return ret;
>  	}
> 
> -	mutex_lock(imx290->ctrls.lock);
> -	imx290_ctrl_update(imx290, imx290->current_mode);
> -	mutex_unlock(imx290->ctrls.lock);
> -
>  	return 0;
>  }
> 
> @@ -730,8 +732,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>   */
> 
>  /* Start streaming */
> -static int imx290_start_streaming(struct imx290 *imx290)
> +static int imx290_start_streaming(struct imx290 *imx290,
> +				  struct v4l2_subdev_state *state)
>  {
> +	const struct v4l2_mbus_framefmt *format;
>  	int ret;
> 
>  	/* Set init register settings */
> @@ -744,7 +748,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
> }
> 
>  	/* Apply the register values related to current frame format */
> -	ret = imx290_write_current_format(imx290);
> +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> +	ret = imx290_setup_format(imx290, format);
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "Could not set frame format\n");
>  		return ret;
> @@ -764,7 +769,7 @@ static int imx290_start_streaming(struct imx290 *imx290)
> return ret;
> 
>  	/* Apply customized values from user */
> -	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> +	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {
>  		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
>  		return ret;
> @@ -793,39 +798,32 @@ static int imx290_stop_streaming(struct imx290
> *imx290) static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct imx290 *imx290 = to_imx290(sd);
> +	struct v4l2_subdev_state *state;
>  	int ret = 0;
> 
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +
>  	if (enable) {
>  		ret = pm_runtime_resume_and_get(imx290->dev);
>  		if (ret < 0)
> -			goto unlock_and_return;
> +			goto unlock;
> 
> -		ret = imx290_start_streaming(imx290);
> +		ret = imx290_start_streaming(imx290, state);
>  		if (ret) {
>  			dev_err(imx290->dev, "Start stream failed\n");
>  			pm_runtime_put(imx290->dev);
> -			goto unlock_and_return;
> +			goto unlock;
>  		}
>  	} else {
>  		imx290_stop_streaming(imx290);
>  		pm_runtime_put(imx290->dev);
>  	}
> 
> -unlock_and_return:
> -
> +unlock:
> +	v4l2_subdev_unlock_state(state);
>  	return ret;
>  }
> 
> -static struct v4l2_mbus_framefmt *
> -imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> *state, -		      u32 which)
> -{
> -	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return &imx290->current_format;
> -	else
> -		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
> -}
> -
>  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum 
*code)
> @@ -860,23 +858,6 @@ static int imx290_enum_frame_size(struct v4l2_subdev
> *sd, return 0;
>  }
> 
> -static int imx290_get_fmt(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *fmt)
> -{
> -	struct imx290 *imx290 = to_imx290(sd);
> -	struct v4l2_mbus_framefmt *framefmt;
> -
> -	mutex_lock(&imx290->lock);
> -
> -	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
> -	fmt->format = *framefmt;
> -
> -	mutex_unlock(&imx290->lock);
> -
> -	return 0;
> -}
> -
>  static int imx290_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *fmt)
> @@ -886,8 +867,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *format;
>  	unsigned int i;
> 
> -	mutex_lock(&imx290->lock);
> -
>  	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
>  				      imx290_modes_num(imx290), width, 
height,
>  				      fmt->format.width, fmt-
>format.height);
> @@ -905,7 +884,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.code = imx290_formats[i].code;
>  	fmt->format.field = V4L2_FIELD_NONE;
> 
> -	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx290->current_mode = mode;
> @@ -916,8 +895,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> 
>  	*format = fmt->format;
> 
> -	mutex_unlock(&imx290->lock);
> -
>  	return 0;
>  }
> 
> @@ -925,14 +902,11 @@ static int imx290_get_selection(struct v4l2_subdev
> *sd, struct v4l2_subdev_state *sd_state,
>  				struct v4l2_subdev_selection *sel)
>  {
> -	struct imx290 *imx290 = to_imx290(sd);
>  	struct v4l2_mbus_framefmt *format;
> 
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP: {
> -		format = imx290_get_pad_format(imx290, sd_state, sel-
>which);
> -
> -		mutex_lock(&imx290->lock);
> +		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> 
>  		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
>  			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - 
format->height) / 2;
> @@ -941,7 +915,6 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
>  		sel->r.width = format->width;
>  		sel->r.height = format->height;
> 
> -		mutex_unlock(&imx290->lock);
>  		return 0;
>  	}
> 
> @@ -970,11 +943,13 @@ static int imx290_get_selection(struct v4l2_subdev
> *sd, static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
>  				  struct v4l2_subdev_state *sd_state)
>  {
> -	struct v4l2_subdev_format fmt = { 0 };
> -
> -	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : 
V4L2_SUBDEV_FORMAT_ACTIVE;
> -	fmt.format.width = 1920;
> -	fmt.format.height = 1080;
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.format = {
> +			.width = 1920,
> +			.height = 1080,
> +		},
> +	};
> 
>  	imx290_set_fmt(subdev, sd_state, &fmt);
> 
> @@ -989,7 +964,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops =
> { .init_cfg = imx290_entity_init_cfg,
>  	.enum_mbus_code = imx290_enum_mbus_code,
>  	.enum_frame_size = imx290_enum_frame_size,
> -	.get_fmt = imx290_get_fmt,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = imx290_set_fmt,
>  	.get_selection = imx290_get_selection,
>  };
> @@ -1008,18 +983,8 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	struct i2c_client *client = to_i2c_client(imx290->dev);
>  	int ret;
> 
> -	/*
> -	 * Initialize the frame format. In particular, imx290->current_mode
> -	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() 
call
> -	 * below relies on these fields.
> -	 */
> -	imx290_entity_init_cfg(&imx290->sd, NULL);
> -
> -	ret = imx290_ctrl_init(imx290);
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "Control initialization error %d\n", 
ret);
> -		return ret;
> -	}
> +	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> +	imx290->bpp = imx290_formats[0].bpp;
> 
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
>  	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> @@ -1031,15 +996,37 @@ static int imx290_subdev_init(struct imx290 *imx290)
>  	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "Could not register media entity\n");
> -		v4l2_ctrl_handler_free(&imx290->ctrls);
>  		return ret;
>  	}
> 
> +	ret = imx290_ctrl_init(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Control initialization error %d\n", 
ret);
> +		goto err_media;
> +	}
> +
> +	imx290->sd.state_lock = imx290->ctrls.lock;
> +
> +	ret = v4l2_subdev_init_finalize(&imx290->sd);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "subdev initialization error %d\n", 
ret);
> +		goto err_ctrls;
> +	}
> +
> +	imx290_ctrl_update(imx290, imx290->current_mode);
> +
>  	return 0;
> +
> +err_ctrls:
> +	v4l2_ctrl_handler_free(&imx290->ctrls);
> +err_media:
> +	media_entity_cleanup(&imx290->sd.entity);
> +	return ret;
>  }
> 
>  static void imx290_subdev_cleanup(struct imx290 *imx290)
>  {
> +	v4l2_subdev_cleanup(&imx290->sd);
>  	media_entity_cleanup(&imx290->sd.entity);
>  	v4l2_ctrl_handler_free(&imx290->ctrls);
>  }
> @@ -1270,12 +1257,10 @@ static int imx290_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
> 
> -	mutex_init(&imx290->lock);
> -
>  	/* Initialize and register subdev. */
>  	ret = imx290_subdev_init(imx290);
>  	if (ret)
> -		goto err_mutex;
> +		return ret;
> 
>  	ret = v4l2_async_register_subdev(&imx290->sd);
>  	if (ret < 0) {
> @@ -1298,8 +1283,6 @@ static int imx290_probe(struct i2c_client *client)
> 
>  err_subdev:
>  	imx290_subdev_cleanup(imx290);
> -err_mutex:
> -	mutex_destroy(&imx290->lock);
> 
>  	return ret;
>  }
> @@ -1312,8 +1295,6 @@ static void imx290_remove(struct i2c_client *client)
>  	v4l2_async_unregister_subdev(sd);
>  	imx290_subdev_cleanup(imx290);
> 
> -	mutex_destroy(&imx290->lock);
> -
>  	pm_runtime_disable(imx290->dev);
>  	if (!pm_runtime_status_suspended(imx290->dev))
>  		imx290_power_off(imx290->dev);




