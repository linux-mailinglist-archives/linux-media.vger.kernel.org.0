Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2DF66C220
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjAPOX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232646AbjAPOXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:23:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DE339B99
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:08:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5D5A802;
        Mon, 16 Jan 2023 15:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673878074;
        bh=USgFwkv7nVIVE3inZfq0q2sM9RuiyY2MOUHCl2g/lY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ghLs5pFnLYZvEv4KmGgmef6ruNdamLGNoazNJHIjob9vzWAZLTk4f0mOP8UZedKZq
         zbYMtYWY/jZszXSMBSp/70juCI3a8ERe8KS3Yy/Bz3taSlDW95gNlR4lluqb9vZSY/
         eWryY/rujfTuUqHy114pOFiDnczYfiYpJl3chrtk=
Date:   Mon, 16 Jan 2023 16:07:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 11/17] media: i2c: imx290: Use V4L2 subdev active state
Message-ID: <Y8VaOhLXkeweTFAH@pendragon.ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-11-laurent.pinchart@ideasonboard.com>
 <3717160.kQq0lBPeGt@steina-w>
 <Y8U7+sFca3LQCZ1D@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8U7+sFca3LQCZ1D@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Mon, Jan 16, 2023 at 01:58:50PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 16, 2023 at 12:04:34PM +0100, Alexander Stein wrote:
> > Am Samstag, 14. Januar 2023, 18:17:56 CET schrieb Laurent Pinchart:
> > > Use the V4L2 subdev active state API to store the active format. This
> > > simplifies the driver not only by dropping the imx290 current_format
> > > field, but it also allows dropping the imx290 lock, replaced with the
> > > state lock.
> > > 
> > > The lock check in imx290_ctrl_update() can be dropped as
> > > imx290_set_fmt() can't be called anywmore with which set to ACTIVE
> > > before controls are initialized.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > > 
> > > - Remove lock check from imx290_ctrl_update()
> > > - Drop unrelated change
> > > - Fix error handling in imx290_subdev_init()
> > > - Handle errors from v4l2_subdev_init_finalize()
> > > - Return immediately from imx290_set_ctrl() for read-only controls
> > > - Call v4l2_subdev_cleanup()
> > > ---
> > >  drivers/media/i2c/imx290.c | 170 +++++++++++++++++--------------------
> > >  1 file changed, 80 insertions(+), 90 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index b01a627c8c03..94d23eea36be 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -177,12 +177,12 @@ struct imx290 {
> > >  	struct clk *xclk;
> > >  	struct regmap *regmap;
> > >  	u8 nlanes;
> > > -	u8 bpp;
> > > 
> > >  	struct v4l2_subdev sd;
> > >  	struct media_pad pad;
> > > -	struct v4l2_mbus_framefmt current_format;
> > > +
> > >  	const struct imx290_mode *current_mode;
> > > +	u8 bpp;
> > > 
> > >  	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
> > >  	struct gpio_desc *rst_gpio;
> > > @@ -192,8 +192,6 @@ struct imx290 {
> > >  	struct v4l2_ctrl *pixel_rate;
> > >  	struct v4l2_ctrl *hblank;
> > >  	struct v4l2_ctrl *vblank;
> > > -
> > > -	struct mutex lock;
> > >  };
> > > 
> > >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > > @@ -524,13 +522,14 @@ static int imx290_set_black_level(struct imx290
> > > *imx290, black_level >> (16 - imx290->bpp), err);
> > >  }
> > > 
> > > -static int imx290_write_current_format(struct imx290 *imx290)
> > > +static int imx290_setup_format(struct imx290 *imx290,
> > > +			       const struct v4l2_mbus_framefmt *format)
> > >  {
> > >  	const struct imx290_regval *regs;
> > >  	unsigned int num_regs;
> > >  	int ret;
> > > 
> > > -	switch (imx290->current_format.code) {
> > > +	switch (format->code) {
> > >  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > >  		regs = imx290_10bit_settings;
> > >  		num_regs = ARRAY_SIZE(imx290_10bit_settings);
> > > @@ -561,12 +560,31 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  {
> > >  	struct imx290 *imx290 = container_of(ctrl->handler,
> > >  					     struct imx290, ctrls);
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_subdev_state *state;
> > >  	int ret = 0;
> > > 
> > > +	/*
> > > +	 * Return immediately for controls that don't need to be applied to the
> > > +	 * device. This includes all controls modified in imx290_ctrl_update(),
> > > +	 * which is called at probe time before runtime PM is initialized, so
> > > +	 * we can't proceed to the pm_runtime_get_if_in_use() call below.
> > > +	 */
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_LINK_FREQ:
> > > +	case V4L2_CID_PIXEL_RATE:
> > > +	case V4L2_CID_VBLANK:
> > > +	case V4L2_CID_HBLANK:
> > > +		return 0;
> > > +	}
> > 
> > I don't like keeping the IDs synchronized in two functions. Isn't checking for 
> > 'ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY' enough?
> 
> It should be. I'll do so.
> 
> > On that side V4L2_CID_PIXEL_RATE is missing the read-only flag, no?
> 
> That's right. I'll add a patch in v3 to make it read-only.

Actually that's not needed, V4L2_CID_PIXEL_RATE is made read-only by the
control framework. See the v4l2_ctrl_fill() function (called by
v4l2_ctrl_new_std()) in drivers/media/v4l2-core/v4l2-ctrls-defs.c.

> > >  	/* V4L2 controls values will be applied only when power is already up */
> > >  	if (!pm_runtime_get_if_in_use(imx290->dev))
> > >  		return 0;
> > > 
> > > +	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +
> > >  	switch (ctrl->id) {
> > >  	case V4L2_CID_ANALOGUE_GAIN:
> > >  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
> > > @@ -592,6 +610,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  					       &ret);
> > >  		}
> > >  		break;
> > > +
> > >  	default:
> > >  		ret = -EINVAL;
> > >  		break;
> > > @@ -626,13 +645,6 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> > >  	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
> > >  	u64 pixel_rate;
> > > 
> > > -	/*
> > > -	 * This function may be called from imx290_set_fmt() before controls
> > > -	 * get created by imx290_ctrl_init(). Return immediately in that case.
> > > -	 */
> > > -	if (!imx290->ctrls.lock)
> > > -		return;
> > > -
> > >  	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> > >  	pixel_rate = link_freq * 2 * imx290->nlanes;
> > >  	do_div(pixel_rate, imx290->bpp);
> > > @@ -654,7 +666,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >  		return ret;
> > > 
> > >  	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> > > -	imx290->ctrls.lock = &imx290->lock;
> > > 
> > >  	/*
> > >  	 * The sensor has an analog gain and a digital gain, both controlled
> > > @@ -719,11 +730,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >  		return ret;
> > >  	}
> > > 
> > > -	mutex_lock(imx290->ctrls.lock);
> > > -	imx290_ctrl_update(imx290, &imx290->current_format,
> > > -			   imx290->current_mode);
> > > -	mutex_unlock(imx290->ctrls.lock);
> > > -
> > >  	return 0;
> > >  }
> > > 
> > > @@ -732,8 +738,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >   */
> > > 
> > >  /* Start streaming */
> > > -static int imx290_start_streaming(struct imx290 *imx290)
> > > +static int imx290_start_streaming(struct imx290 *imx290,
> > > +				  struct v4l2_subdev_state *state)
> > >  {
> > > +	const struct v4l2_mbus_framefmt *format;
> > >  	int ret;
> > > 
> > >  	/* Set init register settings */
> > > @@ -746,7 +754,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
> > > }
> > > 
> > >  	/* Apply the register values related to current frame format */
> > > -	ret = imx290_write_current_format(imx290);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +	ret = imx290_setup_format(imx290, format);
> > >  	if (ret < 0) {
> > >  		dev_err(imx290->dev, "Could not set frame format\n");
> > >  		return ret;
> > > @@ -766,7 +775,7 @@ static int imx290_start_streaming(struct imx290 *imx290)
> > >  		return ret;
> > > 
> > >  	/* Apply customized values from user */
> > > -	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > > +	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > >  	if (ret) {
> > >  		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> > >  		return ret;
> > > @@ -795,39 +804,32 @@ static int imx290_stop_streaming(struct imx290 *imx290)
> > >  static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> > >  {
> > >  	struct imx290 *imx290 = to_imx290(sd);
> > > +	struct v4l2_subdev_state *state;
> > >  	int ret = 0;
> > > 
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > 
> > Is there ever the case that state==NULL? If so you will deference a NULL 
> > pointer in v4l2_subdev_unlock_state() later on.
> 
> No, that can't happen, the driver calls v4l2_subdev_init_finalize() at
> probe time, so sd->active_state can't be NULL.
> 
> > >  	if (enable) {
> > >  		ret = pm_runtime_resume_and_get(imx290->dev);
> > >  		if (ret < 0)
> > > -			goto unlock_and_return;
> > > +			goto unlock;
> > > 
> > > -		ret = imx290_start_streaming(imx290);
> > > +		ret = imx290_start_streaming(imx290, state);
> > >  		if (ret) {
> > >  			dev_err(imx290->dev, "Start stream failed\n");
> > >  			pm_runtime_put(imx290->dev);
> > > -			goto unlock_and_return;
> > > +			goto unlock;
> > >  		}
> > >  	} else {
> > >  		imx290_stop_streaming(imx290);
> > >  		pm_runtime_put(imx290->dev);
> > >  	}
> > > 
> > > -unlock_and_return:
> > > -
> > > +unlock:
> > > +	v4l2_subdev_unlock_state(state);
> > >  	return ret;
> > >  }
> > > 
> > > -static struct v4l2_mbus_framefmt *
> > > -imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
> > > -		      u32 which)
> > > -{
> > > -	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > -		return &imx290->current_format;
> > > -	else
> > > -		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
> > > -}
> > > -
> > >  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> > >  				 struct v4l2_subdev_state *sd_state,
> > >  				 struct v4l2_subdev_mbus_code_enum *code)
> > > @@ -862,23 +864,6 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd
> > >  	return 0;
> > >  }
> > > 
> > > -static int imx290_get_fmt(struct v4l2_subdev *sd,
> > > -			  struct v4l2_subdev_state *sd_state,
> > > -			  struct v4l2_subdev_format *fmt)
> > > -{
> > > -	struct imx290 *imx290 = to_imx290(sd);
> > > -	struct v4l2_mbus_framefmt *framefmt;
> > > -
> > > -	mutex_lock(&imx290->lock);
> > > -
> > > -	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > > -	fmt->format = *framefmt;
> > > -
> > > -	mutex_unlock(&imx290->lock);
> > > -
> > > -	return 0;
> > > -}
> > > -
> > >  static int imx290_set_fmt(struct v4l2_subdev *sd,
> > >  			  struct v4l2_subdev_state *sd_state,
> > >  			  struct v4l2_subdev_format *fmt)
> > > @@ -888,8 +873,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > >  	struct v4l2_mbus_framefmt *format;
> > >  	unsigned int i;
> > > 
> > > -	mutex_lock(&imx290->lock);
> > > -
> > >  	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
> > >  				      imx290_modes_num(imx290), width, height,
> > >  				      fmt->format.width, fmt->format.height);
> > > @@ -907,7 +890,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > >  	fmt->format.code = imx290_formats[i].code;
> > >  	fmt->format.field = V4L2_FIELD_NONE;
> > > 
> > > -	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > > +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > 
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >  		imx290->current_mode = mode;
> > > @@ -918,8 +901,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	*format = fmt->format;
> > > 
> > > -	mutex_unlock(&imx290->lock);
> > > -
> > >  	return 0;
> > >  }
> > > 
> > > @@ -927,14 +908,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> > >  				struct v4l2_subdev_state *sd_state,
> > >  				struct v4l2_subdev_selection *sel)
> > >  {
> > > -	struct imx290 *imx290 = to_imx290(sd);
> > >  	struct v4l2_mbus_framefmt *format;
> > > 
> > >  	switch (sel->target) {
> > >  	case V4L2_SEL_TGT_CROP: {
> > > -		format = imx290_get_pad_format(imx290, sd_state, sel->which);
> > > -
> > > -		mutex_lock(&imx290->lock);
> > > +		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > 
> > >  		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > >  			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
> > > @@ -943,7 +921,6 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
> > >  		sel->r.width = format->width;
> > >  		sel->r.height = format->height;
> > > 
> > > -		mutex_unlock(&imx290->lock);
> > >  		return 0;
> > >  	}
> > > 
> > > @@ -972,11 +949,13 @@ static int imx290_get_selection(struct v4l2_subdev *sd
> > >  static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
> > >  				  struct v4l2_subdev_state *sd_state)
> > >  {
> > > -	struct v4l2_subdev_format fmt = { 0 };
> > > -
> > > -	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> > > -	fmt.format.width = 1920;
> > > -	fmt.format.height = 1080;
> > > +	struct v4l2_subdev_format fmt = {
> > > +		.which = V4L2_SUBDEV_FORMAT_TRY,
> > > +		.format = {
> > > +			.width = 1920,
> > > +			.height = 1080,
> > > +		},
> > > +	};
> > > 
> > >  	imx290_set_fmt(subdev, sd_state, &fmt);
> > > 
> > > @@ -991,7 +970,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
> > >  	.init_cfg = imx290_entity_init_cfg,
> > >  	.enum_mbus_code = imx290_enum_mbus_code,
> > >  	.enum_frame_size = imx290_enum_frame_size,
> > > -	.get_fmt = imx290_get_fmt,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > >  	.set_fmt = imx290_set_fmt,
> > >  	.get_selection = imx290_get_selection,
> > >  };
> > > @@ -1008,20 +987,12 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
> > >  static int imx290_subdev_init(struct imx290 *imx290)
> > >  {
> > >  	struct i2c_client *client = to_i2c_client(imx290->dev);
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_subdev_state *state;
> > >  	int ret;
> > > 
> > > -	/*
> > > -	 * Initialize the frame format. In particular, imx290->current_mode
> > > -	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
> > > -	 * below relies on these fields.
> > > -	 */
> > > -	imx290_entity_init_cfg(&imx290->sd, NULL);
> > > -
> > > -	ret = imx290_ctrl_init(imx290);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "Control initialization error %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> > > +	imx290->bpp = imx290_formats[0].bpp;
> > > 
> > >  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > >  	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > @@ -1033,15 +1004,40 @@ static int imx290_subdev_init(struct imx290 *imx290)
> > >  	ret = media_entity_pads_init(&imx290->sd.entity, 1, &imx290->pad);
> > >  	if (ret < 0) {
> > >  		dev_err(imx290->dev, "Could not register media entity\n");
> > > -		v4l2_ctrl_handler_free(&imx290->ctrls);
> > >  		return ret;
> > >  	}
> > > 
> > > +	ret = imx290_ctrl_init(imx290);
> > > +	if (ret < 0) {
> > > +		dev_err(imx290->dev, "Control initialization error %d\n", ret);
> > > +		goto err_media;
> > > +	}
> > > +
> > > +	imx290->sd.state_lock = imx290->ctrls.lock;
> > > +
> > > +	ret = v4l2_subdev_init_finalize(&imx290->sd);
> > > +	if (ret < 0) {
> > > +		dev_err(imx290->dev, "subdev initialization error %d\n", ret);
> > > +		goto err_ctrls;
> > > +	}
> > > +
> > > +	state = v4l2_subdev_lock_and_get_active_state(&imx290->sd);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +	imx290_ctrl_update(imx290, format, imx290->current_mode);
> > > +	v4l2_subdev_unlock_state(state);
> > > +
> > >  	return 0;
> > > +
> > > +err_ctrls:
> > > +	v4l2_ctrl_handler_free(&imx290->ctrls);
> > > +err_media:
> > > +	media_entity_cleanup(&imx290->sd.entity);
> > > +	return ret;
> > >  }
> > > 
> > >  static void imx290_subdev_cleanup(struct imx290 *imx290)
> > >  {
> > > +	v4l2_subdev_cleanup(&imx290->sd);
> > >  	media_entity_cleanup(&imx290->sd.entity);
> > >  	v4l2_ctrl_handler_free(&imx290->ctrls);
> > >  }
> > > @@ -1272,12 +1268,10 @@ static int imx290_probe(struct i2c_client *client)
> > >  	if (ret)
> > >  		return ret;
> > > 
> > > -	mutex_init(&imx290->lock);
> > > -
> > >  	/* Initialize and register subdev. */
> > >  	ret = imx290_subdev_init(imx290);
> > >  	if (ret)
> > > -		goto err_mutex;
> > > +		return ret;
> > > 
> > >  	ret = v4l2_async_register_subdev(&imx290->sd);
> > >  	if (ret < 0) {
> > > @@ -1300,8 +1294,6 @@ static int imx290_probe(struct i2c_client *client)
> > > 
> > >  err_subdev:
> > >  	imx290_subdev_cleanup(imx290);
> > > -err_mutex:
> > > -	mutex_destroy(&imx290->lock);
> > > 
> > >  	return ret;
> > >  }
> > > @@ -1314,8 +1306,6 @@ static void imx290_remove(struct i2c_client *client)
> > >  	v4l2_async_unregister_subdev(sd);
> > >  	imx290_subdev_cleanup(imx290);
> > > 
> > > -	mutex_destroy(&imx290->lock);
> > > -
> > >  	pm_runtime_disable(imx290->dev);
> > >  	if (!pm_runtime_status_suspended(imx290->dev))
> > >  		imx290_power_off(imx290->dev);

-- 
Regards,

Laurent Pinchart
