Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4D559960C
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 09:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347019AbiHSH2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 03:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346404AbiHSH2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 03:28:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0496E18E1B
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 00:28:14 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oOwQH-0004O4-H0; Fri, 19 Aug 2022 09:28:05 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oOwQG-0006gI-Np; Fri, 19 Aug 2022 09:28:04 +0200
Date:   Fri, 19 Aug 2022 09:28:04 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org, akinobu.mita@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/4] media: mt9m111: fix subdev API usage
Message-ID: <20220819072804.j6qj2r2mqrzcdmsg@pengutronix.de>
References: <20220818144712.997477-1-m.felsch@pengutronix.de>
 <20220818144712.997477-2-m.felsch@pengutronix.de>
 <20220819071619.brhhbypmnt5pr2f7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819071619.brhhbypmnt5pr2f7@uno.localdomain>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 22-08-19, Jacopo Mondi wrote:
> Hi Marco
> 
> On Thu, Aug 18, 2022 at 04:47:10PM +0200, Marco Felsch wrote:
> > In case of I2C transfer failures the driver return failure codes which
> > are not allowed according the API documentation. Fix that by ignore the
> > register access failure codes.
> 
> I might have missed the reason why subdev ops are not allowed to
> fail..

Please see the links below:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-fmt.html?highlight=subdev_s_fmt#return-value
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-selection.html#return-value
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-ext-ctrls.html#return-value

There is e.g. no ENXIO error code allowed.

> Also you're here changing both subdev ops handler and function that handle
> controls if I'm not mistaken.

Yes I did that for the controls because the errors are incorrect there
as well. You're right, I forgot to mention this in the commit message.

Regards,
  Marco

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/media/i2c/mt9m111.c | 116 ++++++++++++++++++++----------------
> >  1 file changed, 66 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> > index cdaf283e1309..53c4dac4e4bd 100644
> > --- a/drivers/media/i2c/mt9m111.c
> > +++ b/drivers/media/i2c/mt9m111.c
> > @@ -455,7 +455,7 @@ static int mt9m111_set_selection(struct v4l2_subdev *sd,
> >  	struct mt9m111 *mt9m111 = to_mt9m111(client);
> >  	struct v4l2_rect rect = sel->r;
> >  	int width, height;
> > -	int ret, align = 0;
> > +	int align = 0;
> >
> >  	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
> >  	    sel->target != V4L2_SEL_TGT_CROP)
> > @@ -481,14 +481,13 @@ static int mt9m111_set_selection(struct v4l2_subdev *sd,
> >  	width = min(mt9m111->width, rect.width);
> >  	height = min(mt9m111->height, rect.height);
> >
> > -	ret = mt9m111_setup_geometry(mt9m111, &rect, width, height, mt9m111->fmt->code);
> > -	if (!ret) {
> > -		mt9m111->rect = rect;
> > -		mt9m111->width = width;
> > -		mt9m111->height = height;
> > -	}
> >
> > -	return ret;
> > +	mt9m111_setup_geometry(mt9m111, &rect, width, height, mt9m111->fmt->code);
> > +	mt9m111->rect = rect;
> > +	mt9m111->width = width;
> > +	mt9m111->height = height;
> > +
> > +	return 0;
> >  }
> >
> >  static int mt9m111_get_selection(struct v4l2_subdev *sd,
> > @@ -558,7 +557,6 @@ static int mt9m111_set_pixfmt(struct mt9m111 *mt9m111,
> >  		MT9M111_OUTFMT_RGB444x | MT9M111_OUTFMT_RGBx444 |
> >  		MT9M111_OUTFMT_SWAP_YCbCr_C_Y_RGB_EVEN |
> >  		MT9M111_OUTFMT_SWAP_YCbCr_Cb_Cr_RGB_R_B;
> > -	int ret;
> >
> >  	switch (code) {
> >  	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > @@ -613,13 +611,13 @@ static int mt9m111_set_pixfmt(struct mt9m111 *mt9m111,
> >  	if (mt9m111->pclk_sample == 0)
> >  		mask_outfmt2 |= MT9M111_OUTFMT_INV_PIX_CLOCK;
> >
> > -	ret = mt9m111_reg_mask(client, context_a.output_fmt_ctrl2,
> > -			       data_outfmt2, mask_outfmt2);
> > -	if (!ret)
> > -		ret = mt9m111_reg_mask(client, context_b.output_fmt_ctrl2,
> > -				       data_outfmt2, mask_outfmt2);
> >
> > -	return ret;
> > +	mt9m111_reg_mask(client, context_a.output_fmt_ctrl2,
> > +			 data_outfmt2, mask_outfmt2);
> > +	mt9m111_reg_mask(client, context_b.output_fmt_ctrl2,
> > +			 data_outfmt2, mask_outfmt2);
> > +
> > +	return 0;
> >  }
> >
> >  static int mt9m111_set_fmt(struct v4l2_subdev *sd,
> > @@ -632,7 +630,6 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
> >  	const struct mt9m111_datafmt *fmt;
> >  	struct v4l2_rect *rect = &mt9m111->rect;
> >  	bool bayer;
> > -	int ret;
> >
> >  	if (mt9m111->is_streaming)
> >  		return -EBUSY;
> > @@ -681,16 +678,14 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
> >  		return 0;
> >  	}
> >
> > -	ret = mt9m111_setup_geometry(mt9m111, rect, mf->width, mf->height, mf->code);
> > -	if (!ret)
> > -		ret = mt9m111_set_pixfmt(mt9m111, mf->code);
> > -	if (!ret) {
> > -		mt9m111->width	= mf->width;
> > -		mt9m111->height	= mf->height;
> > -		mt9m111->fmt	= fmt;
> > -	}
> >
> > -	return ret;
> > +	mt9m111_setup_geometry(mt9m111, rect, mf->width, mf->height, mf->code);
> > +	mt9m111_set_pixfmt(mt9m111, mf->code);
> > +	mt9m111->width	= mf->width;
> > +	mt9m111->height	= mf->height;
> > +	mt9m111->fmt	= fmt;
> > +
> > +	return 0;
> >  }
> >
> >  static const struct mt9m111_mode_info *
> > @@ -786,14 +781,13 @@ static int mt9m111_s_register(struct v4l2_subdev *sd,
> >  static int mt9m111_set_flip(struct mt9m111 *mt9m111, int flip, int mask)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
> > -	int ret;
> >
> >  	if (flip)
> > -		ret = mt9m111_reg_set(client, mt9m111->ctx->read_mode, mask);
> > +		mt9m111_reg_set(client, mt9m111->ctx->read_mode, mask);
> >  	else
> > -		ret = mt9m111_reg_clear(client, mt9m111->ctx->read_mode, mask);
> > +		mt9m111_reg_clear(client, mt9m111->ctx->read_mode, mask);
> >
> > -	return ret;
> > +	return 0;
> >  }
> >
> >  static int mt9m111_get_global_gain(struct mt9m111 *mt9m111)
> > @@ -823,7 +817,9 @@ static int mt9m111_set_global_gain(struct mt9m111 *mt9m111, int gain)
> >  	else
> >  		val = gain;
> >
> > -	return reg_write(GLOBAL_GAIN, val);
> > +	reg_write(GLOBAL_GAIN, val);
> > +
> > +	return 0;
> >  }
> >
> >  static int mt9m111_set_autoexposure(struct mt9m111 *mt9m111, int val)
> > @@ -831,8 +827,11 @@ static int mt9m111_set_autoexposure(struct mt9m111 *mt9m111, int val)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
> >
> >  	if (val == V4L2_EXPOSURE_AUTO)
> > -		return reg_set(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOEXPO_EN);
> > -	return reg_clear(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOEXPO_EN);
> > +		reg_set(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOEXPO_EN);
> > +	else
> > +		reg_clear(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOEXPO_EN);
> > +
> > +	return 0;
> >  }
> >
> >  static int mt9m111_set_autowhitebalance(struct mt9m111 *mt9m111, int on)
> > @@ -840,8 +839,11 @@ static int mt9m111_set_autowhitebalance(struct mt9m111 *mt9m111, int on)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
> >
> >  	if (on)
> > -		return reg_set(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOWHITEBAL_EN);
> > -	return reg_clear(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOWHITEBAL_EN);
> > +		reg_set(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOWHITEBAL_EN);
> > +	else
> > +		reg_clear(OPER_MODE_CTRL, MT9M111_OPMODE_AUTOWHITEBAL_EN);
> > +
> > +	return 0;
> >  }
> >
> >  static const char * const mt9m111_test_pattern_menu[] = {
> > @@ -859,8 +861,9 @@ static int mt9m111_set_test_pattern(struct mt9m111 *mt9m111, int val)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(&mt9m111->subdev);
> >
> > -	return mt9m111_reg_mask(client, MT9M111_TPG_CTRL, val,
> > -				MT9M111_TPG_SEL_MASK);
> > +	mt9m111_reg_mask(client, MT9M111_TPG_CTRL, val, MT9M111_TPG_SEL_MASK);
> > +
> > +	return 0;
> >  }
> >
> >  static int mt9m111_set_colorfx(struct mt9m111 *mt9m111, int val)
> > @@ -877,9 +880,10 @@ static int mt9m111_set_colorfx(struct mt9m111 *mt9m111, int val)
> >
> >  	for (i = 0; i < ARRAY_SIZE(colorfx); i++) {
> >  		if (colorfx[i].id == val) {
> > -			return mt9m111_reg_mask(client, MT9M111_EFFECTS_MODE,
> > -						colorfx[i].value,
> > -						MT9M111_EFFECTS_MODE_MASK);
> > +			mt9m111_reg_mask(client, MT9M111_EFFECTS_MODE,
> > +					 colorfx[i].value,
> > +					 MT9M111_EFFECTS_MODE_MASK);
> > +			return 0;
> >  		}
> >  	}
> >
> > @@ -890,29 +894,41 @@ static int mt9m111_s_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct mt9m111 *mt9m111 = container_of(ctrl->handler,
> >  					       struct mt9m111, hdl);
> > +	int ret;
> >
> >  	switch (ctrl->id) {
> >  	case V4L2_CID_VFLIP:
> > -		return mt9m111_set_flip(mt9m111, ctrl->val,
> > -					MT9M111_RMB_MIRROR_ROWS);
> > +		ret = mt9m111_set_flip(mt9m111, ctrl->val,
> > +				       MT9M111_RMB_MIRROR_ROWS);
> > +		break;
> >  	case V4L2_CID_HFLIP:
> > -		return mt9m111_set_flip(mt9m111, ctrl->val,
> > -					MT9M111_RMB_MIRROR_COLS);
> > +		ret = mt9m111_set_flip(mt9m111, ctrl->val,
> > +				       MT9M111_RMB_MIRROR_COLS);
> > +		break;
> >  	case V4L2_CID_GAIN:
> > -		return mt9m111_set_global_gain(mt9m111, ctrl->val);
> > +		ret = mt9m111_set_global_gain(mt9m111, ctrl->val);
> > +		break;
> >  	case V4L2_CID_EXPOSURE_AUTO:
> > -		return mt9m111_set_autoexposure(mt9m111, ctrl->val);
> > +		ret = mt9m111_set_autoexposure(mt9m111, ctrl->val);
> > +		break;
> >  	case V4L2_CID_AUTO_WHITE_BALANCE:
> > -		return mt9m111_set_autowhitebalance(mt9m111, ctrl->val);
> > +		ret = mt9m111_set_autowhitebalance(mt9m111, ctrl->val);
> > +		break;
> >  	case V4L2_CID_TEST_PATTERN:
> > -		return mt9m111_set_test_pattern(mt9m111, ctrl->val);
> > +		ret = mt9m111_set_test_pattern(mt9m111, ctrl->val);
> > +		break;
> >  	case V4L2_CID_COLORFX:
> > -		return mt9m111_set_colorfx(mt9m111, ctrl->val);
> > +		ret = mt9m111_set_colorfx(mt9m111, ctrl->val);
> > +		break;
> >  	case V4L2_CID_PIXEL_RATE:
> > -		return 0;
> > +		ret = 0;
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> >  	}
> >
> > -	return -EINVAL;
> > +
> > +	return ret;
> >  }
> >
> >  static int mt9m111_suspend(struct mt9m111 *mt9m111)
> > --
> > 2.30.2
> >
> 
