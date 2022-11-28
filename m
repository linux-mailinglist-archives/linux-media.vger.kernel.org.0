Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC463ACB0
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 16:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiK1Pd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 10:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbiK1Pd4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 10:33:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64A8BEC
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 07:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669649634; x=1701185634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BP++InAh3vUijTo/m0+HfWVNJ6nFmXcoW/cRvNUV4dE=;
  b=hnJst3tGcwTimEgJ5aXNXt0sg4kDo3ogZDGimPUS5GbPhmK0LtDY6Qqc
   EFFBqtTyBrYSSzYojnuEJy3CiyjC9+j3N0SWQKbqtElsKT2ThndX7CzR2
   e5MX/JrkF8S6n1f3B6hmOZWC/ucGYxRk8LKIkwjSaBgFMLvoByRH1NYd8
   cJ8YYemQ8y3yf1L5gsz/6PzjZqDGnT+a/BUwmZx30fOxlMJG2FKQFKhWZ
   7J3Qc+R5xNTdmrzzHpUedGwPJHA1O8H/T9HQeMuMeq58j4RmwdyZErlig
   JpY2fN+VgDmLGiOeqKOBW7DyDod1G0T16JrFtScRTqhfSVfuEFdfNIeqH
   w==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665439200"; 
   d="scan'208";a="27621191"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Nov 2022 16:33:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 28 Nov 2022 16:33:52 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 28 Nov 2022 16:33:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669649632; x=1701185632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BP++InAh3vUijTo/m0+HfWVNJ6nFmXcoW/cRvNUV4dE=;
  b=AoHEdHZ8gjsHygPkYeqZrW2YLgdZG9JKaNeuXLGVV8d4nuW7hgGitqzH
   wNsYdzA8XEdpr0UEBrg83iUY0rer7GG5x+ML9g//rsCUQxp4laJaWoa+U
   P2qaiz5d5HQR22L8hwnaLXUcdoh9b288w5qiYPcjmhO9NNnZ/ZBERQgwF
   H4u/DW6r47ymVirgOSmNraYH3M7MoTNS8eosyeyd3XMNLwz+uxIe4s1Lx
   WY0ktKmpoomDMbpEDVj4j9fe8BB06Ii95rDvQ8kt3QhETl/uj/FhYVECN
   GNXO79SOTAetJ5wED8RP+ynmwp/iEEWckqjLp6rixLpk86c1YruahCg7I
   w==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665439200"; 
   d="scan'208";a="27621190"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Nov 2022 16:33:52 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 05B0C280056;
        Mon, 28 Nov 2022 16:33:52 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 11/15] media: i2c: imx290: Use V4L2 subdev active state
Date:   Mon, 28 Nov 2022 16:33:53 +0100
Message-ID: <3706399.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Y336zY4cgMpHLD8k@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <2540630.Lt9SDvczpP@steina-w> <Y336zY4cgMpHLD8k@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, 23. November 2022, 11:49:49 CET schrieb Laurent Pinchart:
> Hi Alexander,
> 
> On Wed, Nov 23, 2022 at 09:42:10AM +0100, Alexander Stein wrote:
> > Am Dienstag, 22. November 2022, 23:32:46 CET schrieb Laurent Pinchart:
> > > Use the V4L2 subdev active state API to store the active format. This
> > > simplifies the driver not only by dropping the imx290 current_format
> > > field, but it also allows dropping the imx290 lock, replaced with the
> > > state lock.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > 
> > >  drivers/media/i2c/imx290.c | 139 +++++++++++++++----------------------
> > >  1 file changed, 56 insertions(+), 83 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 848de4c90d3b..cd2154983341 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -177,12 +177,12 @@ struct imx290 {
> > > 
> > >  	struct clk *xclk;
> > >  	struct regmap *regmap;
> > >  	u8 nlanes;
> > > 
> > > -	u8 bpp;
> > > 
> > >  	struct v4l2_subdev sd;
> > >  	struct media_pad pad;
> > > 
> > > -	struct v4l2_mbus_framefmt current_format;
> > > +
> > > 
> > >  	const struct imx290_mode *current_mode;
> > > 
> > > +	u8 bpp;
> > > 
> > >  	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
> > >  	struct gpio_desc *rst_gpio;
> > > 
> > > @@ -192,8 +192,6 @@ struct imx290 {
> > > 
> > >  	struct v4l2_ctrl *pixel_rate;
> > >  	struct v4l2_ctrl *hblank;
> > >  	struct v4l2_ctrl *vblank;
> > > 
> > > -
> > > -	struct mutex lock;
> > > 
> > >  };
> > >  
> > >  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> > > 
> > > @@ -524,14 +522,15 @@ static int imx290_set_black_level(struct imx290
> > > *imx290, black_level >> (16 - imx290->bpp), err);
> > > 
> > >  }
> > > 
> > > -static int imx290_write_current_format(struct imx290 *imx290)
> > > +static int imx290_setup_format(struct imx290 *imx290,
> > > +			       const struct v4l2_mbus_framefmt *format)
> > > 
> > >  {
> > >  
> > >  	const struct imx290_regval *regs;
> > >  	unsigned int num_regs;
> > >  	unsigned int bpp;
> > >  	int ret;
> > > 
> > > -	switch (imx290->current_format.code) {
> > > +	switch (format->code) {
> > > 
> > >  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > >  		regs = imx290_10bit_settings;
> > >  		num_regs = ARRAY_SIZE(imx290_10bit_settings);
> > > 
> > > @@ -564,12 +563,17 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > > 
> > >  {
> > >  
> > >  	struct imx290 *imx290 = container_of(ctrl->handler,
> > >  	
> > >  					     struct imx290, ctrls);
> > > 
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_subdev_state *state;
> > > 
> > >  	int ret = 0;
> > >  	
> > >  	/* V4L2 controls values will be applied only when power is already 
up
> > >  	*/
> > >  	if (!pm_runtime_get_if_in_use(imx290->dev))
> > >  	
> > >  		return 0;
> > > 
> > > +	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +
> > > 
> > >  	switch (ctrl->id) {
> > >  	
> > >  	case V4L2_CID_ANALOGUE_GAIN:
> > >  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
> > > 
> > > @@ -646,11 +650,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >  	int ret;
> > >  	
> > >  	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> > > 
> > > -	if (ret < 0)
> > > +	if (ret)
> > 
> > This is an unrelated change.
> 
> I'll drop it.
> 
> > >  		return ret;
> > >  	
> > >  	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> > > 
> > > -	imx290->ctrls.lock = &imx290->lock;
> > > 
> > >  	/*
> > >  	
> > >  	 * The sensor has an analog gain and a digital gain, both controlled
> > > 
> > > @@ -715,11 +718,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >  		return ret;
> > >  	
> > >  	}
> > > 
> > > -	mutex_lock(imx290->ctrls.lock);
> > > -	imx290_ctrl_update(imx290, &imx290->current_format,
> > > -			   imx290->current_mode);
> > > -	mutex_unlock(imx290->ctrls.lock);
> > > -
> > > 
> > >  	return 0;
> > >  
> > >  }
> > > 
> > > @@ -728,8 +726,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > > 
> > >   */
> > >  
> > >  /* Start streaming */
> > > 
> > > -static int imx290_start_streaming(struct imx290 *imx290)
> > > +static int imx290_start_streaming(struct imx290 *imx290,
> > > +				  struct v4l2_subdev_state *state)
> > > 
> > >  {
> > > 
> > > +	const struct v4l2_mbus_framefmt *format;
> > > 
> > >  	int ret;
> > >  	
> > >  	/* Set init register settings */
> > > 
> > > @@ -742,7 +742,8 @@ static int imx290_start_streaming(struct imx290
> > > *imx290) }
> > > 
> > >  	/* Apply the register values related to current frame format */
> > > 
> > > -	ret = imx290_write_current_format(imx290);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +	ret = imx290_setup_format(imx290, format);
> > > 
> > >  	if (ret < 0) {
> > >  	
> > >  		dev_err(imx290->dev, "Could not set frame format\n");
> > >  		return ret;
> > > 
> > > @@ -762,7 +763,7 @@ static int imx290_start_streaming(struct imx290
> > > *imx290) return ret;
> > > 
> > >  	/* Apply customized values from user */
> > > 
> > > -	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > > +	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> > 
> > Why is it safe to ignore the lock now? There is no user-specified lock for
> > imx290->ctrls.lock, but instead imx290->ctrls._lock is set, no?
> 
> That's because the control handler and subdev state lock are the same.
> The imx290_start_streaming() function starts by calling
> v4l2_subdev_lock_and_get_active_state(), which takes the lock, so we
> must not lock again with v4l2_ctrl_handler_setup().

v4l2_subdev_lock_and_get_active_state() is called in imx290_set_stream, not 
imx290_start_streaming.
But while holding this lock imx290_start_streaming() is called. Okay, looks 
good.

> > >  	if (ret) {
> > >  	
> > >  		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> > >  		return ret;
> > > 
> > > @@ -791,39 +792,32 @@ static int imx290_stop_streaming(struct imx290
> > > *imx290) static int imx290_set_stream(struct v4l2_subdev *sd, int
> > > enable)
> > > 
> > >  {
> > >  
> > >  	struct imx290 *imx290 = to_imx290(sd);
> > > 
> > > +	struct v4l2_subdev_state *state;
> > > 
> > >  	int ret = 0;
> > > 
> > > +	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > +
> > > 
> > >  	if (enable) {
> > >  	
> > >  		ret = pm_runtime_resume_and_get(imx290->dev);
> > >  		if (ret < 0)
> > > 
> > > -			goto unlock_and_return;
> > > +			goto unlock;
> > > 
> > > -		ret = imx290_start_streaming(imx290);
> > > +		ret = imx290_start_streaming(imx290, state);
> > > 
> > >  		if (ret) {
> > >  		
> > >  			dev_err(imx290->dev, "Start stream failed\n");
> > >  			pm_runtime_put(imx290->dev);
> > > 
> > > -			goto unlock_and_return;
> > > +			goto unlock;
> > > 
> > >  		}
> > >  	
> > >  	} else {
> > >  	
> > >  		imx290_stop_streaming(imx290);
> > >  		pm_runtime_put(imx290->dev);
> > >  	
> > >  	}
> > > 
> > > -unlock_and_return:
> > > -
> > > +unlock:
> > > +	v4l2_subdev_unlock_state(state);
> > > 
> > >  	return ret;
> > >  
> > >  }
> > > 
> > > -static struct v4l2_mbus_framefmt *
> > > -imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> > > *state, -		      u32 which)
> > > -{
> > > -	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > -		return &imx290->current_format;
> > > -	else
> > > -		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
> > > -}
> > > -
> > > 
> > >  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
> > >  
> > >  				 struct v4l2_subdev_state *sd_state,
> > >  				 struct v4l2_subdev_mbus_code_enum 
*code)
> > > 
> > > @@ -858,23 +852,6 @@ static int imx290_enum_frame_size(struct
> > > v4l2_subdev
> > > *sd, return 0;
> > > 
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
> > > 
> > >  static int imx290_set_fmt(struct v4l2_subdev *sd,
> > >  
> > >  			  struct v4l2_subdev_state *sd_state,
> > >  			  struct v4l2_subdev_format *fmt)
> > > 
> > > @@ -884,8 +861,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	struct v4l2_mbus_framefmt *format;
> > >  	unsigned int i;
> > > 
> > > -	mutex_lock(&imx290->lock);
> > > -
> > > 
> > >  	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
> > >  	
> > >  				      imx290_modes_num(imx290), width, 
height,
> > >  				      fmt->format.width, fmt-
> > >
> > >format.height);
> > >
> > > @@ -903,7 +878,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	fmt->format.code = imx290_formats[i].code;
> > >  	fmt->format.field = V4L2_FIELD_NONE;
> > > 
> > > -	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> > > +	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > 
> > >  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >  	
> > >  		imx290->current_mode = mode;
> > > 
> > > @@ -914,8 +889,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > 
> > >  	*format = fmt->format;
> > > 
> > > -	mutex_unlock(&imx290->lock);
> > > -
> > > 
> > >  	return 0;
> > >  
> > >  }
> > > 
> > > @@ -923,14 +896,11 @@ static int imx290_get_selection(struct v4l2_subdev
> > > *sd, struct v4l2_subdev_state *sd_state,
> > > 
> > >  				struct v4l2_subdev_selection *sel)
> > >  
> > >  {
> > > 
> > > -	struct imx290 *imx290 = to_imx290(sd);
> > > 
> > >  	struct v4l2_mbus_framefmt *format;
> > >  	
> > >  	switch (sel->target) {
> > >  	case V4L2_SEL_TGT_CROP: {
> > > 
> > > -		format = imx290_get_pad_format(imx290, sd_state, sel-
>which);
> > > -
> > > -		mutex_lock(&imx290->lock);
> > > +		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > 
> > >  		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
> > >  		
> > >  			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - 
format->height) / 2;
> > > 
> > > @@ -939,7 +909,6 @@ static int imx290_get_selection(struct v4l2_subdev
> > > *sd,
> > > 
> > >  		sel->r.width = format->width;
> > >  		sel->r.height = format->height;
> > > 
> > > -		mutex_unlock(&imx290->lock);
> > > 
> > >  		return 0;
> > >  	
> > >  	}
> > > 
> > > @@ -968,11 +937,13 @@ static int imx290_get_selection(struct v4l2_subdev
> > > *sd, static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
> > > 
> > >  				  struct v4l2_subdev_state *sd_state)
> > >  
> > >  {
> > > 
> > > -	struct v4l2_subdev_format fmt = { 0 };
> > > -
> > > -	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY :
> > > V4L2_SUBDEV_FORMAT_ACTIVE; -	fmt.format.width = 1920;
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
> > > @@ -987,7 +958,7 @@ static const struct v4l2_subdev_pad_ops
> > > imx290_pad_ops = { .init_cfg = imx290_entity_init_cfg,
> > > 
> > >  	.enum_mbus_code = imx290_enum_mbus_code,
> > >  	.enum_frame_size = imx290_enum_frame_size,
> > > 
> > > -	.get_fmt = imx290_get_fmt,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > > 
> > >  	.set_fmt = imx290_set_fmt,
> > >  	.get_selection = imx290_get_selection,
> > >  
> > >  };
> > > 
> > > @@ -1004,20 +975,12 @@ static const struct media_entity_operations
> > > imx290_subdev_entity_ops = { static int imx290_subdev_init(struct imx290
> > > *imx290)
> > > 
> > >  {
> > >  
> > >  	struct i2c_client *client = to_i2c_client(imx290->dev);
> > > 
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	struct v4l2_subdev_state *state;
> > > 
> > >  	int ret;
> > > 
> > > -	/*
> > > -	 * Initialize the frame format. In particular, imx290->current_mode
> > > -	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() 
call
> > > -	 * below relies on these fields.
> > > -	 */
> > > -	imx290_entity_init_cfg(&imx290->sd, NULL);
> > > -
> > > -	ret = imx290_ctrl_init(imx290);
> > > -	if (ret < 0) {
> > > -		dev_err(imx290->dev, "Control initialization error %d\n", 
ret);
> > > -		return ret;
> > > -	}
> > > +	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> > > +	imx290->bpp = imx290_formats[0].bpp;
> > > 
> > >  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > >  	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > 
> > > @@ -1032,6 +995,22 @@ static int imx290_subdev_init(struct imx290
> > > *imx290)
> > > 
> > >  		return ret;
> > >  	
> > >  	}
> > > 
> > > +	ret = imx290_ctrl_init(imx290);
> > > +	if (ret < 0) {
> > > +		dev_err(imx290->dev, "Control initialization error %d\n", 
ret);
> > > +		media_entity_cleanup(&imx290->sd.entity);
> > > +		return ret;
> > > +	}
> > > +
> > > +	imx290->sd.state_lock = imx290->ctrls.lock;
> > > +
> > > +	v4l2_subdev_init_finalize(&imx290->sd);
> > > +
> > > +	state = v4l2_subdev_lock_and_get_active_state(&imx290->sd);
> > > +	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > +	imx290_ctrl_update(imx290, format, imx290->current_mode);
> > > +	v4l2_subdev_unlock_state(state);
> > 
> > Do you need to check for state == NULL here?
> 
> No, v4l2_subdev_lock_and_get_active_state() can only return NULL if the
> subdev driver doesn't have an active state, and
> v4l2_subdev_init_finalize() guarantees it has one.

I see, but that is only true if v4l2_subdev_init_finalize()/
__v4l2_subdev_init_finalize() does not return an error. AFAICS it's possible 
due to memory allocation failure or pad init_cfg() fails.

Regards,
Alexander

> > > +
> > > 
> > >  	return 0;
> > >  
> > >  }
> > > 
> > > @@ -1268,12 +1247,10 @@ static int imx290_probe(struct i2c_client
> > > *client)
> > > 
> > >  	if (ret)
> > >  	
> > >  		return ret;
> > > 
> > > -	mutex_init(&imx290->lock);
> > > -
> > > 
> > >  	/* Initialize and register subdev. */
> > >  	ret = imx290_subdev_init(imx290);
> > >  	if (ret)
> > > 
> > > -		goto err_mutex;
> > > +		return ret;
> > > 
> > >  	ret = v4l2_async_register_subdev(&imx290->sd);
> > >  	if (ret < 0) {
> > > 
> > > @@ -1305,8 +1282,6 @@ static int imx290_probe(struct i2c_client *client)
> > > 
> > >  err_subdev:
> > >  	imx290_subdev_cleanup(imx290);
> > > 
> > > -err_mutex:
> > > -	mutex_destroy(&imx290->lock);
> > > 
> > >  	return ret;
> > >  
> > >  }
> > > 
> > > @@ -1319,8 +1294,6 @@ static void imx290_remove(struct i2c_client
> > > *client)
> > > 
> > >  	v4l2_async_unregister_subdev(sd);
> > >  	imx290_subdev_cleanup(imx290);
> > > 
> > > -	mutex_destroy(&imx290->lock);
> > > -
> > > 
> > >  	pm_runtime_disable(imx290->dev);
> > >  	if (!pm_runtime_status_suspended(imx290->dev))
> > >  	
> > >  		imx290_power_off(imx290->dev);




