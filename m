Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33DC150FFCD
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 15:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350376AbiDZOBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 10:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351308AbiDZOBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 10:01:43 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AB918E0CC
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 06:58:33 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BE26AFF803;
        Tue, 26 Apr 2022 13:58:25 +0000 (UTC)
Date:   Tue, 26 Apr 2022 15:58:24 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 16/27] media: ov5640: Add VBLANK control
Message-ID: <20220426135824.hl5dsrzllauczuy7@uno.localdomain>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-17-jacopo@jmondi.org>
 <3b2e09d0-8524-3b3e-0ace-47fdbd36bec7@foss.st.com>
 <20220411154233.ibmxehvhvw6jcud5@uno.localdomain>
 <bff75be4-e567-1310-21a3-659e1d2155fe@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bff75be4-e567-1310-21a3-659e1d2155fe@foss.st.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues

On Tue, Apr 26, 2022 at 02:53:12PM +0200, Hugues FRUCHET - FOSS wrote:
> Hi Jacopo,
>
> On 4/11/22 5:42 PM, Jacopo Mondi wrote:
> > Hi Hugues,
> >
> > On Thu, Apr 07, 2022 at 06:25:32PM +0200, Hugues FRUCHET - FOSS wrote:
> > > Hi Jacopo,
> > >
> > > Patch proposed below to support framerate change both with frame interval
> > > setting and vblank control.
> > >
> > > On 2/24/22 10:43 AM, Jacopo Mondi wrote:
> > > > Add the VBLANK control which allows to select the duration of the
> > > > frame vertical blankings and allows to control the framerate.
> > > >
> > > > The VBLANK control also modifies the exposure time range, which cannot
> > > > exceed the maximum frame length.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >    drivers/media/i2c/ov5640.c | 52 ++++++++++++++++++++++++++++++++++++++
> > > >    1 file changed, 52 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > > index 5419c7236348..665a8bcebf09 100644
> > > > --- a/drivers/media/i2c/ov5640.c
> > > > +++ b/drivers/media/i2c/ov5640.c
> > > > @@ -36,6 +36,10 @@
> > > >    #define OV5640_PIXEL_ARRAY_WIDTH	2592
> > > >    #define OV5640_PIXEL_ARRAY_HEIGHT	1944
> > > > +/* FIXME: not documented. */
> > > > +#define OV5640_MIN_VBLANK	24
> > > > +#define OV5640_MAX_VTS		1968
> > >
> > > Not enough to support 1024x768@15fps (vblank=2607):
> > > +#define OV5640_MAX_VTS		3375 /* 1024x768@15fps, vblank=2607 */
> >
> > I guess this applies to all modes, as 1024x768 has the same htot and
> > vtot as lower resolution modes (just an higher default frame rate as
> > it proved to be more stable for high-freq capture in my testing).
> >
> > Indeed to slow FPS down either blankings are enlarged or the pixel
> > rate is reduced. I reported in the cover letter that to increase the
> > frame rate (for example VGA@60Hz) the pixel rate should be increased.
> >
> > As the pixel rate is a RO control, we should allow userspace to
> > control LINK_FREQ, which is now registered as read-only to do so.
> >
> > -------------- From cover letter ----------------------------------------
> >
> > To enable higher FPS the LINK_FREQ control should be made writable to increase
> > the pixel rate (default for 640x480 is 48MHz)
> >
> >    640x480 YUYV 60 FPS (pixel_rate = 96 Mhz)
> >
> >          $ yavta -f YUYV -s 640x480 -c100 --skip 7 /dev/video0
> >          ...
> >          9 (1) [-] any 10 614400 B 57.098649 57.098667 59.995 fps ts mono/EoF
> >          10 (2) [-] any 11 614400 B 57.115314 57.115332 60.006 fps ts mono/EoF
> >
> > --------------------------------------------------------------------------
> >
> > To achive slower FPS, the pixel rate can be reduced. In example, to
> > get 1024x768@15FPS let's reduce the pixel clock to 48Mhz in the driver
> > (default is 96)
> >
> > ---------------------------------------------------------------------------
> >
> >          vblank = (10^6/15) * 48 / hblank - height)
> >                 = 919
> >
> >          # v4l2-ctl -d /dev/v4l-subdev4 -c 0x009e0901=919
> >          # v4l2-ctl -l -d /dev/v4l-subdev4
> >                ...
> >                vertical_blanking 0x009e0901 (int)    : min=24 max=2895 step=1 default=520 value=919
> >                ...
> >                pixel_rate 0x009f0902 (int64)  : min=48000000 max=168000000 step=1 default=48000000 value=48000000 flags=read-only
> >                ...
> >
> >          # yavta..
> >          0 (0) [-] any 0 1572864 B 197.054072 197.054091 20.519 fps ts mono/EoF
> >          1 (1) [-] any 1 1572864 B 197.120665 197.120683 15.017 fps ts mono/EoF
> >          2 (2) [-] any 2 1572864 B 197.187260 197.187278 15.016 fps ts mono/EoF
> >          3 (3) [-] any 3 1572864 B 197.253854 197.253873 15.016 fps ts mono/EoF
> >          4 (0) [-] any 4 1572864 B 197.320449 197.320469 15.016 fps ts mono/EoF
> >          5 (1) [-] any 5 1572864 B 197.387044 197.387068 15.016 fps ts mono/EoF
> >          6 (2) [-] any 6 1572864 B 197.453636 197.453659 15.017 fps ts mono/EoF
> >          7 (3) [-] any 7 1572864 B 197.520232 197.520257 15.016 fps ts mono/EoF
> > ---------------------------------------------------------------------------
> >
> > Hence I think the real solution would be to make LINK_FREQ
> > controllable by userspace to enlarge the number of achievable
> > configurations. I thought it was safer to make LINK_FREQ writable on
> > top, but can be fast-tracked if desired.
> >
> > Ofc enlarging VBLANK max is an option as well, unfortunately I haven't
> > found documented anywhere what the max value is, and depending on the
> > mode I've seen contradictory results.
>
>
> My opinion is that we cannot continue this way increasing more and more
> complexity on application side...

Without digressing too much on matters of principle, I understand that
simple applications might be frustrated as they would just be happy
with a preview at fixed FPS.

Unfortunately more complex use cases need to control the most
intimate parameters of how the capture system work and an operating
system should enable applications to fully exploit the hw capabilities
instead of limiting them for sake of simplicity. That's where a
camera stack helps abstracting away the most complex details for
simple applications and at the same time allow the more complex ones to
be realized.

> As far as I have understood well, LINK_FREQ control has been introduced in
> order that CSI receivers be informed of the frequency of link so pixels
> sampling goes well, what is the point to expose such hardware setting to
> application ?

What about the example above ? One link freq can accommodate a certain
set of operating modes, not all of them. If that's fine with some
sensors, one which supports formats with bpp in the range of [8-24] and
resolutions that could freely scale in the [8,8] - [2592-1944] range cannot
be expected to be operated in full without changing some of its
operational parameters.

>
> For this exact point of 15fps, driver can solve it itself by selecting a
> lower link frequency if vblank is not in the admissible range.
>

Isn't it simpler, once you know the desired format, resolution
and frame duration, compute the precise configuration of your system,
instead of implementing complex heuristics in kernel space ?

If all drivers have to implement such heuristics we'll end up
with most of them doing the same thing but slightly differently. I
wouldn't be happy about this if I were to maintain the drivers.

In this case the adjustment you proposed is not that complex, but
again pushes for moving complexity to the drivers. I think we should
move in the other direction instead :)

To get there, there need to be consensus and motivation to get past
the idea a complex camera system can be operated in full with a single
gstreamer/yavta command line.

> Another option is to continue to use frame interval control, and that solve
> also the VGA@60fps.
>

You know my opinion about frame_interval. It simply doesn't allow
precise frame duration handling unless drivers are instrumented to
support a lot of different configurations, generally by defining some
more fixed modes (something we have to live with for existing drivers
but something that not be encouraged for new ones imho).

Let's hear from others as well on this!

Thanks
   j

> >
> > Thanks
> >     j
> >
> > >
> > >
> > > > +
> > > >    #define OV5640_DEFAULT_SLAVE_ID 0x3c
> > > >    #define OV5640_LINK_RATE_MAX		490000000U
> > > > @@ -321,6 +325,7 @@ struct ov5640_ctrls {
> > > >    	struct v4l2_ctrl *pixel_rate;
> > > >    	struct v4l2_ctrl *link_freq;
> > > >    	struct v4l2_ctrl *hblank;
> > > > +	struct v4l2_ctrl *vblank;
> > > >    	struct {
> > > >    		struct v4l2_ctrl *auto_exp;
> > > >    		struct v4l2_ctrl *exposure;
> > > > @@ -2697,6 +2702,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> > > >    	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
> > > >    	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
> > > >    	const struct ov5640_timings *timings;
> > > > +	s32 exposure_val, exposure_max;
> > > >    	unsigned int hblank;
> > > >    	unsigned int i = 0;
> > > >    	u32 pixel_rate;
> > > > @@ -2755,6 +2761,19 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
> > > >    	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > > >    				 hblank, hblank, 1, hblank);
> > > > +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
> > > > +				 OV5640_MAX_VTS - mode->height, 1,
> > > > +				 timings->vblank_def);
> > > > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
> > > > +
> > > > +	exposure_max = timings->crop.height + timings->vblank_def - 4;
> > > > +	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
> > > > +			       sensor->ctrls.exposure->minimum,
> > > > +			       exposure_max);
> > > > +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > > +				 sensor->ctrls.exposure->minimum,
> > > > +				 exposure_max, 1, exposure_val);
> > > > +
> > >
> > > +	vblank = timings->vblank_def;
> > > +
> > > +	if (sensor->current_fr != timings->def_fps) {
> > > +		/* Compute the blanking according to the required framerate */
> > > +
> > > +		int fie_num = sensor->frame_interval.numerator;
> > > +		int fie_denom = sensor->frame_interval.denominator;
> > > +
> > > +		vblank = ((fie_num * pixel_rate / fie_denom) / timings->htot) -
> > > +			 mode->height;
> > > +	}
> > > +
> > >   	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
> > >   				 OV5640_MAX_VTS - mode->height, 1,
> > > -				 timings->vblank_def);
> > > -	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
> > > +				 vblank);
> > > +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
> > >
> > > -	exposure_max = timings->crop.height + timings->vblank_def - 4;
> > > +	exposure_max = timings->crop.height + vblank - 4;
> > >   	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
> > >   			       sensor->ctrls.exposure->minimum,
> > >   			       exposure_max);
> > >
> > >
> > >
> > > @@ -3606,8 +3636,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev
> > > *sd,
> > >   		sensor->current_mode = mode;
> > >   		sensor->pending_mode_change = true;
> > >
> > > -		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > -					 ov5640_calc_pixel_rate(sensor));
> > > +		ov5640_update_pixel_rate(sensor);
> > >   	}
> > >   out:
> > >   	mutex_unlock(&sensor->lock);
> > >
> > >
> > > Added def_fps (default framerate) in order to known when using vblank_def
> > > and when computing it from frame interval:
> > >
> > >
> > > @@ -383,6 +383,8 @@ struct ov5640_timings {
> > >   	u32 vblank_def;
> > >   	/* DVP only; ignored in MIPI mode. */
> > >   	u32 max_fps;
> > > +	/* CSI-2 only; default fps for default blanking */
> > > +	u32 def_fps;
> > >   };
> > >
> > > @@ -719,6 +722,7 @@ static const struct ov5640_mode_info
> > > ov5640_mode_data[OV5640_NUM_MODES] = {
> > >   			},
> > >   			.htot		= 1600,
> > >   			.vblank_def	= 878,
> > > +			.def_fps	= OV5640_30_FPS
> > > [...]
> > > @@ -1108,6 +1120,7 @@ static const struct ov5640_mode_info
> > > ov5640_mode_data[OV5640_NUM_MODES] = {
> > >   			},
> > >   			.htot		= 2844,
> > >   			.vblank_def	= 24,
> > > +			.def_fps	= OV5640_15_FPS
> > >   		},
> > >
> > >
> > > >    	return 0;
> > > >    }
> > > > @@ -3127,6 +3146,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
> > > >    			      (BIT(2) | BIT(1)) : 0);
> > > >    }
> > > > +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> > > > +{
> > > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > > > +
> > > > +	/* Update the VTOT timing register value. */
> > > > +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> > > > +				  mode->height + value);
> > > > +}
> > > > +
> > > >    static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > > >    {
> > > >    	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > > > @@ -3157,10 +3185,25 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > > >    {
> > > >    	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > > >    	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > > > +	const struct ov5640_mode_info *mode = sensor->current_mode;
> > > > +	const struct ov5640_timings *timings;
> > > > +	unsigned int exp_max;
> > > >    	int ret;
> > > >    	/* v4l2_ctrl_lock() locks our own mutex */
> > > > +	switch (ctrl->id) {
> > > > +	case V4L2_CID_VBLANK:
> > > > +		/* Update the exposure range to the newly programmed vblank. */
> > > > +		timings = ov5640_timings(sensor, mode);
> > > > +		exp_max = mode->height + ctrl->val - 4;
> > > > +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > > +					 sensor->ctrls.exposure->minimum,
> > > > +					 exp_max, sensor->ctrls.exposure->step,
> > > > +					 timings->vblank_def);
> > > > +		break;
> > > > +	}
> > > > +
> > > >    	/*
> > > >    	 * If the device is not powered up by the host driver do
> > > >    	 * not apply any controls to H/W at this time. Instead
> > > > @@ -3200,6 +3243,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > > >    	case V4L2_CID_VFLIP:
> > > >    		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> > > >    		break;
> > > > +	case V4L2_CID_VBLANK:
> > > > +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> > > > +		break;
> > > >    	default:
> > > >    		ret = -EINVAL;
> > > >    		break;
> > > > @@ -3220,6 +3266,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > > >    	struct ov5640_ctrls *ctrls = &sensor->ctrls;
> > > >    	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > > >    	const struct ov5640_timings *timings;
> > > > +	unsigned int max_vblank;
> > > >    	unsigned int hblank;
> > > >    	int ret;
> > > > @@ -3245,6 +3292,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > > >    	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
> > > >    					  hblank, 1, hblank);
> > > > +	max_vblank = OV5640_MAX_VTS - mode->height;
> > > > +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > > > +					  OV5640_MIN_VBLANK, max_vblank,
> > > > +					  1, timings->vblank_def);
> > > > +
> > > >    	/* Auto/manual white balance */
> > > >    	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> > > >    					   V4L2_CID_AUTO_WHITE_BALANCE,
> > > >
> > >
> > > Hugues.
>
> Best regards,
>
> Hugues.
