Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99D14C26F0
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 10:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiBXI7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 03:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbiBXI73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 03:59:29 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8D61520F2
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 00:58:59 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2E1141BF212;
        Thu, 24 Feb 2022 08:58:53 +0000 (UTC)
Date:   Thu, 24 Feb 2022 09:58:52 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 16/27] media: ov5640: Add VBLANK control
Message-ID: <20220224085852.xzzycn3kyiwl3byz@uno.localdomain>
References: <20220223145603.121603-1-jacopo@jmondi.org>
 <20220223145603.121603-17-jacopo@jmondi.org>
 <YhaXtyHqVY00WWpn@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhaXtyHqVY00WWpn@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Wed, Feb 23, 2022 at 10:23:19PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Wed, Feb 23, 2022 at 03:55:52PM +0100, Jacopo Mondi wrote:
> > Add the VBLANK control which allows to select the duration of the
> > frame vertical blankings and allows to control the framerate.
> >
> > The VBLANK control also modifies the exposure time range, which cannot
> > exceed the maximum frame length.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 57 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index bf84f32436b1..134129fc13ae 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -36,6 +36,10 @@
> >  #define OV5640_PIXEL_ARRAY_WIDTH	2592
> >  #define OV5640_PIXEL_ARRAY_HEIGHT	1944
> >
> > +/* FIXME: not documented. */
> > +#define OV5640_MIN_VBLANK	24
> > +#define OV5640_MAX_VTS		1968
> > +
> >  #define OV5640_DEFAULT_SLAVE_ID 0x3c
> >
> >  #define OV5640_LINK_RATE_MAX		490000000U
> > @@ -321,6 +325,7 @@ struct ov5640_ctrls {
> >  	struct v4l2_ctrl *pixel_rate;
> >  	struct v4l2_ctrl *link_freq;
> >  	struct v4l2_ctrl *hblank;
> > +	struct v4l2_ctrl *vblank;
> >  	struct {
> >  		struct v4l2_ctrl *auto_exp;
> >  		struct v4l2_ctrl *exposure;
> > @@ -2693,6 +2698,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> >  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> >  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> >  	const struct ov5640_timings *timings;
> > +	s64 exposure_val, exposure_max;
> >  	unsigned int hblank;
> >  	unsigned int i = 0;
> >  	u32 pixel_rate;
> > @@ -2751,6 +2757,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> >  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> >  				 hblank, hblank, 1, hblank);
> >
> > +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > +				 OV5640_MIN_VBLANK,
> > +				 OV5640_MAX_VTS - mode->height, 1,
> > +				 timings->vblank_def);
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
> > +
> > +	exposure_max = timings->crop.height + timings->vblank_def - 4;
> > +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> > +			     (s64)sensor->ctrls.exposure->minimum,
>
> No need for casting here.
>
> Do you need 64-bit values here? The control value is a signed 32-bit
> number.

I need the cast, exposure->minimum is an s64 while exposure->val is an s32.
I'll cast everything to (s32) though

        struct v4l2_ctrl {
                ...
                s64 minimum, maximum, default_value;
                ...
                s32 val;
                ...
        };

>
> > +			     (s64)exposure_max);
> > +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > +				 sensor->ctrls.exposure->minimum,
> > +				 exposure_max, 1, exposure_val);
> > +
> >  	return 0;
> >  }
> >
> > @@ -3123,6 +3143,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
> >  			      (BIT(2) | BIT(1)) : 0);
> >  }
> >
> > +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> > +{
> > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > +
> > +	/* Update the VTOT timing register value. */
> > +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> > +				  mode->height + value);
> > +}
> > +
> >  static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > @@ -3153,10 +3182,29 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > +	const struct ov5640_timings *timings;
> > +	unsigned int exp_max;
> >  	int ret;
> >
> >  	/* v4l2_ctrl_lock() locks our own mutex */
> >
> > +	if (ov5640_is_csi2(sensor))
> > +		timings = &mode->csi2_timings;
> > +	else
> > +		timings = &mode->dvp_timings;
>
> Could you use ov5640_timings() here?
>

I should indeed

Thanks
  j

> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_VBLANK:
> > +		/* Update the exposure range to the newly programmed vblank. */
> > +		exp_max = mode->height + ctrl->val - 4;
> > +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > +					 sensor->ctrls.exposure->minimum,
> > +					 exp_max, sensor->ctrls.exposure->step,
> > +					 timings->vblank_def);
> > +		break;
> > +	}
> > +
> >  	/*
> >  	 * If the device is not powered up by the host driver do
> >  	 * not apply any controls to H/W at this time. Instead
> > @@ -3196,6 +3244,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_VFLIP:
> >  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> >  		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> > +		break;
> >  	default:
> >  		ret = -EINVAL;
> >  		break;
> > @@ -3216,6 +3267,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
> >  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> >  	const struct ov5640_timings *timings;
> > +	unsigned int max_vblank;
> >  	unsigned int hblank;
> >  	int ret;
> >
> > @@ -3241,6 +3293,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
> >  					  hblank, 1, hblank);
> >
> > +	max_vblank = OV5640_MAX_VTS - mode->height;
> > +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > +					  OV5640_MIN_VBLANK, max_vblank,
> > +					  1, timings->vblank_def);
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > --
> > 2.35.0
> >
>
> --
> Sakari Ailus
