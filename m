Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 394E34D8620
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 14:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241976AbiCNNld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 09:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241979AbiCNNlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 09:41:32 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067A84614A
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 06:40:21 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id AED3440003;
        Mon, 14 Mar 2022 13:40:18 +0000 (UTC)
Date:   Mon, 14 Mar 2022 14:40:17 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6/6] media: i2c: ov5670: Add .get_selection() support
Message-ID: <20220314134017.jp2z3de72rmebo2g@uno.localdomain>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-7-jacopo@jmondi.org>
 <Yi4DYNpdEGkfEUR4@pendragon.ideasonboard.com>
 <20220314133017.7m65hqr4zipwaghc@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314133017.7m65hqr4zipwaghc@uno.localdomain>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One correction

On Mon, Mar 14, 2022 at 02:30:17PM +0100, Jacopo Mondi wrote:
> On Sun, Mar 13, 2022 at 04:44:48PM +0200, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Thu, Mar 10, 2022 at 02:08:29PM +0100, Jacopo Mondi wrote:
> > > From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > >
> > > The ov5670 driver's v4l2_subdev_pad_ops currently does not include
> > > .get_selection() - add support for that callback.
> > >
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5670.c | 64 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > index c9f69ffef210..1fa0d632c536 100644
> > > --- a/drivers/media/i2c/ov5670.c
> > > +++ b/drivers/media/i2c/ov5670.c
> > > @@ -70,6 +70,15 @@
> > >  #define OV5670_REG_VALUE_16BIT		2
> > >  #define OV5670_REG_VALUE_24BIT		3
> > >
> > > +/* Pixel Array */
> > > +
> > > +#define OV5670_NATIVE_WIDTH		2624
> > > +#define OV5670_NATIVE_HEIGHT		1980
> > > +#define OV5670_ACTIVE_START_TOP		8
> > > +#define OV5670_ACTIVE_START_LEFT	16
> > > +#define OV5670_ACTIVE_WIDTH		2592
> > > +#define OV5670_ACTIVE_HEIGHT		1944
> > > +
> > >  /* Initial number of frames to skip to avoid possible garbage */
> > >  #define OV5670_NUM_OF_SKIP_FRAMES	2
> > >
> > > @@ -2491,6 +2500,59 @@ static const struct v4l2_subdev_core_ops ov5670_core_ops = {
> > >  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > >  };
> > >
> > > +static void
> > > +__ov5670_get_pad_crop(struct ov5670 *sensor,
> > > +		      struct v4l2_subdev_state *state, unsigned int pad,
> > > +		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
> > > +{
> > > +	const struct ov5670_mode *mode = sensor->cur_mode;
> > > +
> > > +	switch (which) {
> > > +	case V4L2_SUBDEV_FORMAT_TRY:
> > > +		*r = *v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
> >
> > Where is the try crop rectangle initialized ?
> >
>
> I'll implement init_cfg
>
> > > +		break;
> > > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > > +		r->height = mode->height;
> > > +		r->width = mode->width;
> > > +		r->top = (OV5670_NATIVE_HEIGHT - mode->height) / 2;
> > > +		r->left = (OV5670_NATIVE_WIDTH - mode->width) / 2;
> >
> > There's a comment above stating
> >
> > /*
> >  * OV5670 sensor supports following resolutions with full FOV:
> >  * 4:3  ==> {2592x1944, 1296x972, 648x486}
> >  * 16:9 ==> {2560x1440, 1280x720, 640x360}
> >  */
> >
> > so this doesn't look right.
> >
>
> You're right, all modes are obtained by subsampling the full pixel
> array, so this is not right.
>
> Using Figure 4.2 as a reference, all the modes in the driver use:
>
>         H_crop_start = 0x0c
>         V_crop_start = 0x04
>         H_crop_end = 0xa33 (2611)
>         V_crop_end = 0x733 (1843)

This should be
         V_crop_end = 0x7a3 (1955)

>
> So I think the crop rectangle can be hardcoded for all modes to:
>
>         .left = 12
>         .top = 4
>         .width = 2600
>         .height = 1840

          .height = 1952

Which seems more likely :)

>
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static int ov5670_get_selection(struct v4l2_subdev *subdev,
> > > +				struct v4l2_subdev_state *state,
> > > +				struct v4l2_subdev_selection *sel)
> > > +{
> > > +	struct ov5670 *sensor = to_ov5670(subdev);
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		mutex_lock(&sensor->mutex);
> > > +			__ov5670_get_pad_crop(sensor, state, sel->pad,
> > > +					      sel->which, &sel->r);
> >
> > Wrong indentation.
> >
>
> Thought that was intentional from Jean-Michel to highlight the
> critical section, but I can re-indent back.
>
> Thanks
>    j
>
> > > +		mutex_unlock(&sensor->mutex);
> > > +		break;
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = OV5670_NATIVE_WIDTH;
> > > +		sel->r.height = OV5670_NATIVE_HEIGHT;
> > > +		break;
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +		sel->r.top = OV5670_ACTIVE_START_TOP;
> > > +		sel->r.left = OV5670_ACTIVE_START_LEFT;
> > > +		sel->r.width = OV5670_ACTIVE_WIDTH;
> > > +		sel->r.height = OV5670_ACTIVE_HEIGHT;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct v4l2_subdev_video_ops ov5670_video_ops = {
> > >  	.s_stream = ov5670_set_stream,
> > >  };
> > > @@ -2500,6 +2562,8 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
> > >  	.get_fmt = ov5670_get_pad_format,
> > >  	.set_fmt = ov5670_set_pad_format,
> > >  	.enum_frame_size = ov5670_enum_frame_size,
> > > +	.get_selection = ov5670_get_selection,
> > > +	.set_selection = ov5670_get_selection,
> > >  };
> > >
> > >  static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops = {
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
