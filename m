Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD71460F0EC
	for <lists+linux-media@lfdr.de>; Thu, 27 Oct 2022 09:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbiJ0HKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 03:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiJ0HKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 03:10:31 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231EB5AA2E
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 00:10:17 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id ED02A60003;
        Thu, 27 Oct 2022 07:10:13 +0000 (UTC)
Date:   Thu, 27 Oct 2022 09:10:11 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 07/10] media: ar0521: Adjust exposure and blankings
 limits
Message-ID: <20221027071011.dvqakh3gqvchyuwn@uno.localdomain>
References: <20221022092015.208592-1-jacopo@jmondi.org>
 <20221022092015.208592-8-jacopo@jmondi.org>
 <CAPY8ntD0LkV0GbSwdp-FKGow-=w7KPqhN7RHG-ORtw-j5kBXKg@mail.gmail.com>
 <CAPY8ntCefSfzu1sqYWDiTOFThB69XNaTtdtvErTiP-7V_+m9ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCefSfzu1sqYWDiTOFThB69XNaTtdtvErTiP-7V_+m9ug@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, Oct 25, 2022 at 06:45:41PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> Sorry for the two part review and delay.
>
> On Mon, 24 Oct 2022 at 18:47, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Jacopo
> >
> > On Sat, 22 Oct 2022 at 11:20, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > Adjust the control limits for V4L2_CID_VBLANK, V4L2_CID_HBLANK and
> > > V4L2_CID_EXPOSURE when a new format is applied to the sensor.
> > >
> > > Also update the exposure control when a new blanking value is applied.
> > >
> > > Also change the controls initialization to use valid values for the
> > > default format.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ar0521.c | 79 ++++++++++++++++++++++++++++----------
> > >  1 file changed, 59 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index 2310346f11d5..854f4ccd9c3d 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -40,7 +40,8 @@
> > >
> > >  #define AR0521_WIDTH_BLANKING_MIN     572u
> > >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> > > -#define AR0521_TOTAL_WIDTH_MIN      2968u
> > > +#define AR0521_TOTAL_HEIGHT_MAX     65535u /* max_frame_lenght_lines */
> >
> > s/max_frame_lenght_lines/max_frame_length_lines
> >
> > > +#define AR0521_TOTAL_WIDTH_MAX      65532u /* max_line_lenght_pck */
> >
> > s/max_line_lenght_pck /max_line_length_pck
> >
> > >
> > >  #define AR0521_ANA_GAIN_MIN            0x00
> > >  #define AR0521_ANA_GAIN_MAX            0x3f
> > > @@ -125,8 +126,6 @@ struct ar0521_dev {
> > >         struct v4l2_mbus_framefmt fmt;
> > >         struct ar0521_ctrls ctrls;
> > >         unsigned int lane_count;
> > > -       u16 total_width;
> > > -       u16 total_height;
> > >         struct {
> > >                 u16 pre;
> > >                 u16 mult;
> > > @@ -483,7 +482,8 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
> > >                           struct v4l2_subdev_format *format)
> > >  {
> > >         struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > > -       int ret = 0;
> > > +       int exposure_max, exposure_val;
> > > +       int max_vblank, max_hblank;
> > >
> > >         ar0521_adj_fmt(&format->format);
> > >
> > > @@ -494,33 +494,64 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
> > >
> > >                 fmt = v4l2_subdev_get_try_format(sd, sd_state, 0 /* pad */);
> > >                 *fmt = format->format;
> > > -       } else {
> > > -               sensor->fmt = format->format;
> > > -               ar0521_calc_mode(sensor);
> > > +
> > > +               mutex_unlock(&sensor->lock);
> > > +
> > > +               return 0;
> > >         }
> > >
> > > +       sensor->fmt = format->format;
> > > +       ar0521_calc_mode(sensor);
> > > +
> > > +       /*
> > > +        * Update the exposure and blankings limits. Blankings are also reset
> > > +        * to the minimum.
> > > +        */
> > > +       max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
> > > +       __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > > +                                sensor->ctrls.hblank->minimum,
> > > +                                max_hblank, sensor->ctrls.hblank->step,
> > > +                                sensor->ctrls.hblank->minimum);
> >
> > __v4l2_ctrl_modify_range does return an error code. Is there any value
> > in checking it?
> > The only time I've really seen it return an error is when the code is
> > messed up and the default provided is out of range, but that would be
> > a driver bug and not something caused by userspace.
> >
> > It looks like the rest of the code is correct, but I haven't had time
> > to follow it completely. I'll try and do that tomorrow.
> >
> >   Dave
> >
> > > +       __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.hblank->minimum);
> > > +
> > > +       max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
> > > +       __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > > +                                sensor->ctrls.vblank->minimum,
> > > +                                max_vblank, sensor->ctrls.vblank->step,
> > > +                                sensor->ctrls.vblank->minimum);
> > > +       __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.vblank->minimum);
> > > +
> > > +       exposure_max = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN - 4;
> > > +       exposure_val = min(sensor->ctrls.exposure->val, exposure_max);
> > > +       __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > +                                sensor->ctrls.exposure->minimum,
> > > +                                exposure_max, sensor->ctrls.exposure->step,
> > > +                                exposure_val);
> > > +       __v4l2_ctrl_s_ctrl(sensor->ctrls.exposure, exposure_val);
>
> I've stared at this and tried to work it through several times over,
> and I can't convince myself the behaviour over the default value for
> this control is correct.
>
> At start of day you create the control with a default value of 360.
> Magic number picked from somewhere.

360 was there already, and I agree it would make more sense to use the
register default value of 0x70

>
> When the mode is changed, the default is changed to be the current
> value (not the current default) clipped by the max permitted based on
> height & VBLANK.
> Why should the default change based on the current value? If 360 was
> the default at start of day, shouldn't it continue to be the default
> (assuming it is in range)?
>
> __v4l2_ctrl_modify_range would reset the current value to the default
> if the new maximum limit is lower than current, so that bit is almost
> handled for you.
>
> It's only the def value passed in to __v4l2_ctrl_modify_range that I
> think is my only issue.
>

I agree the default doesn't need to be changed. To be honest, I'm not
even sure how the default value should be interpreted for userspace,
but if we there report the register defualt value I agree it should
not be changed when a new mode is applied.

Thanks
  j

> > > +
> > >         mutex_unlock(&sensor->lock);
> > > -       return ret;
> > > +
> > > +       return 0;
> > >  }
> > >
> > >  static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
> > >  {
> > >         struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> > >         struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > > +       int exp_max;
> > > +       int exp_val;
> > >         int ret;
> > >
> > >         /* v4l2_ctrl_lock() locks our own mutex */
> > >
> > >         switch (ctrl->id) {
> > > -       case V4L2_CID_HBLANK:
> > >         case V4L2_CID_VBLANK:
> > > -               sensor->total_width = sensor->fmt.width +
> > > -                       sensor->ctrls.hblank->val;
> > > -               sensor->total_height = sensor->fmt.width +
> > > -                       sensor->ctrls.vblank->val;
> > > -               break;
> > > -       default:
> > > -               ret = -EINVAL;
> > > +               exp_max = sensor->fmt.height + ctrl->val - 4;
> > > +               exp_val = min(sensor->ctrls.exposure->val, exp_max);
> > > +               __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> > > +                                        sensor->ctrls.exposure->minimum,
> > > +                                        exp_max, sensor->ctrls.exposure->step,
> > > +                                        exp_val);
>
> Same here. Should the advertised default value for exposure change
> based on VBLANK setting?
>
>   Dave
>
> > >                 break;
> > >         }
> > >
> > > @@ -584,6 +615,7 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > >         const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
> > >         struct ar0521_ctrls *ctrls = &sensor->ctrls;
> > >         struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > > +       int max_vblank, max_hblank, exposure_max;
> > >         int ret;
> > >
> > >         v4l2_ctrl_handler_init(hdl, 32);
> > > @@ -604,11 +636,17 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > >                                                 -512, 511, 1, 0);
> > >         v4l2_ctrl_cluster(3, &ctrls->gain);
> > >
> > > +       /* Initialize blanking limits using the default 2592x1944 format. */
> > > +       max_hblank = AR0521_TOTAL_WIDTH_MAX - AR0521_WIDTH_MAX;
> > >         ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
> > > -                                         AR0521_WIDTH_BLANKING_MIN, 4094, 1,
> > > +                                         AR0521_WIDTH_BLANKING_MIN,
> > > +                                         max_hblank, 1,
> > >                                           AR0521_WIDTH_BLANKING_MIN);
> > > +
> > > +       max_vblank = AR0521_TOTAL_HEIGHT_MAX - AR0521_HEIGHT_MAX;
> > >         ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> > > -                                         AR0521_HEIGHT_BLANKING_MIN, 4094, 2,
> > > +                                         AR0521_HEIGHT_BLANKING_MIN,
> > > +                                         max_vblank, 2,
> > >                                           AR0521_HEIGHT_BLANKING_MIN);
> > >         v4l2_ctrl_cluster(2, &ctrls->hblank);
> > >
> > > @@ -618,9 +656,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > >                                            AR0521_PIXEL_CLOCK_MAX, 1,
> > >                                            AR0521_PIXEL_CLOCK_RATE);
> > >
> > > -       /* Manual exposure time */
> > > +       /* Manual exposure time: max exposure time = visible + blank - 4 */
> > > +       exposure_max = AR0521_HEIGHT_MAX + AR0521_HEIGHT_BLANKING_MIN - 4;
> > >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> > > -                                           65535, 1, 360);
> > > +                                           exposure_max, 1, 360);
> > >
> > >         v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > >                                ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > > --
> > > 2.37.3
> > >
