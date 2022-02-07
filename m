Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD54AC773
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 18:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236786AbiBGR3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 12:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237933AbiBGRW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 12:22:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FFEC0401D6
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 09:22:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1187B340;
        Mon,  7 Feb 2022 18:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644254545;
        bh=14gqg/qcNOJzP4hn41ISdRZ5vndX3u3pU7PNheMGWxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C3O1Lmnffx7fKxQ9cGarunlhC8iJGPlzZ0G3rnbDzolduAloD3GbVcjH1A9dv1ny2
         +c42ODtEDDRzC2qKvAfusLOYoRaWK/OFCLkm6DNEKoD9C2ot8umNxc2aO1ncCYsbDA
         hQWEEgOxHhvFHiJnmwqTMz98zpjkCAOi/IOMUces=
Date:   Mon, 7 Feb 2022 19:22:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 11/21] media: ov5640: Add VBLANK control
Message-ID: <YgFVThA5jlFMOqVl@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-12-jacopo@jmondi.org>
 <Yfr5I16pxs84Vcx2@pendragon.ideasonboard.com>
 <20220207150912.fcejkbj6xllifptm@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207150912.fcejkbj6xllifptm@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 07, 2022 at 04:09:12PM +0100, Jacopo Mondi wrote:
> On Wed, Feb 02, 2022 at 11:35:31PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 31, 2022 at 03:32:35PM +0100, Jacopo Mondi wrote:
> > > Add the VBLANK control which allows to select the duration of the
> > > frame vertical blankings and allows to control the framerate.
> > >
> > > The VBLANK control also modifies the exposure time range, which cannot
> > > exceed the maximum frame length.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 50 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index b2961e8e07c3..6eeb50724195 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -31,6 +31,10 @@
> > >
> > >  #define OV5640_LINK_RATE_MAX	490000000U
> > >
> > > +/* FIXME: not documented. */
> > > +#define OV5640_MIN_VBLANK	24
> > > +#define OV5640_MAX_VTS		1968
> > > +
> > >  #define OV5640_DEFAULT_SLAVE_ID 0x3c
> > >
> > >  #define OV5640_REG_SYS_RESET02		0x3002
> > > @@ -267,6 +271,7 @@ struct ov5640_ctrls {
> > >  	struct v4l2_ctrl *pixel_rate;
> > >  	struct v4l2_ctrl *link_freq;
> > >  	struct v4l2_ctrl *hblank;
> > > +	struct v4l2_ctrl *vblank;
> > >  	struct {
> > >  		struct v4l2_ctrl *auto_exp;
> > >  		struct v4l2_ctrl *exposure;
> > > @@ -2531,6 +2536,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> > >  	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> > >  	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> > >  	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> > > +	s64 exposure_val, exposure_max;
> > >  	unsigned int hblank;
> > >  	unsigned int i = 0;
> > >  	u32 pixel_rate;
> > > @@ -2586,6 +2592,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> > >  	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > >  				 hblank, hblank, 1, hblank);
> > >
> > > +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > > +				 OV5640_MIN_VBLANK,
> > > +				 OV5640_MAX_VTS - mode->crop.height, 1,
> > > +				 mode->vblank_def);
> > > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, mode->vblank_def);
> > > +
> > > +	exposure_max = mode->crop.height + mode->vblank_def - OV5640_MIN_VBLANK;
> >
> > There's typically a fixed margin of a few lines between the maximum
> > exposure and the total vertical size, but that's usually smaller than
> > the minimum vblank value. Are you sure OV5640_MIN_VBLANK is right here ?
> 
> Section "4.6.2 manual exposure control" of the datasheet reports
> some hints about how to enlarge the total frame size to accomodate the
> desired exposure.
> 
> It is not totally clear to me how though. The maximum exposure time
> seems to be limited not only by VTS, but by
> (VTS + [0x350Cd,0x350d]).
> 
> The 0x350c/d registers are said to:
> 
> In auto exposure mode, the extra exposure values (larger than 1 frame)
> in registers 0x350C/0x350D automatically change. In manual exposure
> mode, these registers will not automatically change. The manually set
> exposure in registers 0x3500~0x3502 must be less than the maximum
> exposure value in {0x380E, 0x380F} + {0x350C,0x350D}
> 
> 
> with:
> - 0x350c,0x350d = PK_VTS
> - 0x380e,0x380f = VTS
> 
> I have no idea how manual exposure works with this sensor, as I see
> 0x350c only being read and never programmed.
> 
> This anyway does not suggest any margin between VTS+PK_VTS but rahter
> that the exposure time can be larger than VTS which doesn't make much
> sense to me (maybe I should just consider 'real VTS' = VTS + PK_VTS).

It's quite confusing, as it doesn't tell what PK_VTS is. Note that in
the auto-focus application note, section "4.11.1 Shutter" says

  The shutter of OV5640 controls exposure time. The unit of shutter is
  line period. Shutter value has limitation for each resolution. The
  maximum shutter value is VTS(0x380e, 0x380f) - 4.

Furthermore, the OV5642 datasheet ([1]) has a slightly different
explanation:

  4.6.2 manual exposure control

  To manually change exposure value, you must first set both 0x3503[0]
  and 0x3503[2], where 0x3503[0] enables a manual exposure control and
  0x3503[2] enables manual frame length - the number of lines in each
  frame or maximum exposure time, which is defined by registers 0x350C
  and 0x350D. In auto exposure mode, the maximum exposure values in
  registers 0x350C/0x350D automatically change. In manual exposure mode,
  these registers will not automatically change. The manually set
  exposure in registers 0x3500~0x03502 must be less than the maximum
  exposure value in 0x350C/0x350D. The exposure value in registers
  0x3500~0x3502 is in units of line*16 - the low 4 bits (0x3502[3:0]) is
  the fraction of line, the maximum value in 0x350C/0x350D is in unit of
  line. If the manually set exposure value is less than one pre-defined
  frame period (e.g., 1/15 second in 15fps), there is no need to change
  0x350C/0x350D. If the exposure value needs to be set beyond the
  pre-defined frame period; in another words, if the frame period needs
  to be extended to extend exposure time, then the maximum frame value
  in 0x350C/0x350D needs to be set first, then the exposure can be set
  in registers 0x3500~0x3502 accordingly.

I know it's a different sensor, so the implementation could be
different, but the register addresses and names seem to match.

For what it's worth, "PK" could stand for "power keep" according to
table 7-5 in that document. I have no idea what that means though :-)

[1] https://www.uctronics.com/download/cam_module/OV5642DS.pdf

> Anyway, being aware of such margins being usually required, I used the
> min VBLANK value. Which is also not documented but I experimentally
> tried to progressively shrink until capture did not break.
> 
> Should I remove it from the above calculation ?

More research, experimentation and reverse engineering is likely
required to figure this out, but I think it's a bit out of scope.
Whatever we do now will likely be wrong somehow anyway, so you can pick
the option that you think is the most logical, and we'll fix that later
if/when needed.

> > > +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> > > +			     (s64)sensor->ctrls.exposure->minimum,
> > > +			     (s64)exposure_max);
> > > +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > +				 sensor->ctrls.exposure->minimum,
> > > +				 exposure_max, 1, exposure_val);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -2958,6 +2978,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
> > >  			      (BIT(2) | BIT(1)) : 0);
> > >  }
> > >
> > > +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> > > +{
> > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > > +
> > > +	/* Update the VTOT timing register value. */
> > > +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> > > +				  mode->crop.height + value);
> > > +}
> > > +
> > >  static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > >  {
> > >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > > @@ -2988,10 +3017,22 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > >  {
> > >  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > >  	int ret;
> > >
> > >  	/* v4l2_ctrl_lock() locks our own mutex */
> > >
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_VBLANK:
> > > +		/* Update the exposure range to the newly programmed vblank. */
> > > +		unsigned int max = mode->crop.height + ctrl->val - OV5640_MIN_VBLANK;
> > > +
> > > +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > +					 sensor->ctrls.exposure->minimum,
> > > +					 max, sensor->ctrls.exposure->step, max);
> >
> > Should the default be set to mode->vblank_def ?
> >
> 
> It should!
> 
> > > +		break;
> > > +	}
> > > +
> > >  	/*
> > >  	 * If the device is not powered up by the host driver do
> > >  	 * not apply any controls to H/W at this time. Instead
> > > @@ -3031,6 +3072,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > >  	case V4L2_CID_VFLIP:
> > >  		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> > >  		break;
> > > +	case V4L2_CID_VBLANK:
> > > +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> > > +		break;
> > >  	default:
> > >  		ret = -EINVAL;
> > >  		break;
> > > @@ -3050,6 +3094,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
> > >  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
> > >  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > > +	unsigned int max_vblank;
> > >  	unsigned int hblank;
> > >  	int ret;
> > >
> > > @@ -3073,6 +3118,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
> > >  					  hblank, 1, hblank);
> > >
> > > +	max_vblank = OV5640_MAX_VTS - mode->crop.height;
> > > +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > > +					  OV5640_MIN_VBLANK, max_vblank,
> > > +					  1, mode->vblank_def);
> > > +
> > >  	/* Auto/manual white balance */
> > >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> > >  					   V4L2_CID_AUTO_WHITE_BALANCE,

-- 
Regards,

Laurent Pinchart
