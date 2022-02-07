Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85684AC343
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242587AbiBGP2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442906AbiBGPKM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 10:10:12 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F0AC03FED0
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 07:08:11 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 97684E0006;
        Mon,  7 Feb 2022 15:08:05 +0000 (UTC)
Date:   Mon, 7 Feb 2022 16:09:12 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/21] media: ov5640: Add VBLANK control
Message-ID: <20220207150912.fcejkbj6xllifptm@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-12-jacopo@jmondi.org>
 <Yfr5I16pxs84Vcx2@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yfr5I16pxs84Vcx2@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Feb 02, 2022 at 11:35:31PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jan 31, 2022 at 03:32:35PM +0100, Jacopo Mondi wrote:
> > Add the VBLANK control which allows to select the duration of the
> > frame vertical blankings and allows to control the framerate.
> >
> > The VBLANK control also modifies the exposure time range, which cannot
> > exceed the maximum frame length.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 50 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index b2961e8e07c3..6eeb50724195 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -31,6 +31,10 @@
> >
> >  #define OV5640_LINK_RATE_MAX	490000000U
> >
> > +/* FIXME: not documented. */
> > +#define OV5640_MIN_VBLANK	24
> > +#define OV5640_MAX_VTS		1968
> > +
> >  #define OV5640_DEFAULT_SLAVE_ID 0x3c
> >
> >  #define OV5640_REG_SYS_RESET02		0x3002
> > @@ -267,6 +271,7 @@ struct ov5640_ctrls {
> >  	struct v4l2_ctrl *pixel_rate;
> >  	struct v4l2_ctrl *link_freq;
> >  	struct v4l2_ctrl *hblank;
> > +	struct v4l2_ctrl *vblank;
> >  	struct {
> >  		struct v4l2_ctrl *auto_exp;
> >  		struct v4l2_ctrl *exposure;
> > @@ -2531,6 +2536,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> >  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> >  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> >  	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> > +	s64 exposure_val, exposure_max;
> >  	unsigned int hblank;
> >  	unsigned int i = 0;
> >  	u32 pixel_rate;
> > @@ -2586,6 +2592,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> >  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> >  				 hblank, hblank, 1, hblank);
> >
> > +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > +				 OV5640_MIN_VBLANK,
> > +				 OV5640_MAX_VTS - mode->crop.height, 1,
> > +				 mode->vblank_def);
> > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, mode->vblank_def);
> > +
> > +	exposure_max = mode->crop.height + mode->vblank_def - OV5640_MIN_VBLANK;
>
> There's typically a fixed margin of a few lines between the maximum
> exposure and the total vertical size, but that's usually smaller than
> the minimum vblank value. Are you sure OV5640_MIN_VBLANK is right here ?
>

Section "4.6.2 manual exposure control" of the datasheet reports
some hints about how to enlarge the total frame size to accomodate the
desired exposure.

It is not totally clear to me how though. The maximum exposure time
seems to be limited not only by VTS, but by
(VTS + [0x350Cd,0x350d]).

The 0x350c/d registers are said to:

In auto exposure mode, the extra exposure values (larger than 1 frame)
in registers 0x350C/0x350D automatically change. In manual exposure
mode, these registers will not automatically change. The manually set
exposure in registers 0x3500~0x3502 must be less than the maximum
exposure value in {0x380E, 0x380F} + {0x350C,0x350D}


with:
- 0x350c,0x350d = PK_VTS
- 0x380e,0x380f = VTS

I have no idea how manual exposure works with this sensor, as I see
0x350c only being read and never programmed.

This anyway does not suggest any margin between VTS+PK_VTS but rahter
that the exposure time can be larger than VTS which doesn't make much
sense to me (maybe I should just consider 'real VTS' = VTS + PK_VTS).

Anyway, being aware of such margins being usually required, I used the
min VBLANK value. Which is also not documented but I experimentally
tried to progressively shrink until capture did not break.

Should I remove it from the above calculation ?

> > +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> > +			     (s64)sensor->ctrls.exposure->minimum,
> > +			     (s64)exposure_max);
> > +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > +				 sensor->ctrls.exposure->minimum,
> > +				 exposure_max, 1, exposure_val);
> > +
> >  	return 0;
> >  }
> >
> > @@ -2958,6 +2978,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
> >  			      (BIT(2) | BIT(1)) : 0);
> >  }
> >
> > +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> > +{
> > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > +
> > +	/* Update the VTOT timing register value. */
> > +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> > +				  mode->crop.height + value);
> > +}
> > +
> >  static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > @@ -2988,10 +3017,22 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> >  	int ret;
> >
> >  	/* v4l2_ctrl_lock() locks our own mutex */
> >
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_VBLANK:
> > +		/* Update the exposure range to the newly programmed vblank. */
> > +		unsigned int max = mode->crop.height + ctrl->val - OV5640_MIN_VBLANK;
> > +
> > +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > +					 sensor->ctrls.exposure->minimum,
> > +					 max, sensor->ctrls.exposure->step, max);
>
> Should the default be set to mode->vblank_def ?
>

It should!

> > +		break;
> > +	}
> > +
> >  	/*
> >  	 * If the device is not powered up by the host driver do
> >  	 * not apply any controls to H/W at this time. Instead
> > @@ -3031,6 +3072,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_VFLIP:
> >  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> >  		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> > +		break;
> >  	default:
> >  		ret = -EINVAL;
> >  		break;
> > @@ -3050,6 +3094,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
> >  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
> >  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > +	unsigned int max_vblank;
> >  	unsigned int hblank;
> >  	int ret;
> >
> > @@ -3073,6 +3118,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
> >  					  hblank, 1, hblank);
> >
> > +	max_vblank = OV5640_MAX_VTS - mode->crop.height;
> > +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > +					  OV5640_MIN_VBLANK, max_vblank,
> > +					  1, mode->vblank_def);
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
>
> --
> Regards,
>
> Laurent Pinchart
