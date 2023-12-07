Return-Path: <linux-media+bounces-1823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A900808722
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1BE71F22401
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214AA39AD4;
	Thu,  7 Dec 2023 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ihbtWQ2s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660CCAA
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 03:56:27 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31C2D552;
	Thu,  7 Dec 2023 12:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701950144;
	bh=pW7I2RFtORvaM0I6S92l2LX0QawTzuJ15hRAT5sbWf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihbtWQ2sEK6/B5AW6Ie96ffE98+NgP9kvU3XQbR6Is+/YXXda3c3abg8ZsVGCQrDk
	 NZBZH2ZncOZBr+X6UZrp30q0W9l/Uo9z/Lvy5Q59ISYrp4lr4tb6Jf64X4/+01CQEh
	 QiwK5pReJPM9JY+GiQRTmUd/ogORzhYd0WKQnrkE=
Date: Thu, 7 Dec 2023 12:56:22 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Lee Jackson <lee.jackson@arducam.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add driver for OmniVision OV64A40
Message-ID: <nol5hclnu5f2ewugbparjsrggrt5flhxmimtipsdyzwrrsf7d2@nf6hzjzyxih2>
References: <20231206155900.123904-1-jacopo.mondi@ideasonboard.com>
 <20231206155900.123904-3-jacopo.mondi@ideasonboard.com>
 <CAPY8ntB9qWQQMRoVELczn_NJa2tP-=8zrH_s0zTSqgGu1YR+Kw@mail.gmail.com>
 <2hihggebhn7b7awj6dtgazjutgpc2cqwdrfyumuxoqgphefdqi@mo2kyol54j4f>
 <CAPY8ntBadRyihKFUcVNXXxrkbEL9LzMOxOyr3aZuc=7qBRXoVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBadRyihKFUcVNXXxrkbEL9LzMOxOyr3aZuc=7qBRXoVQ@mail.gmail.com>

Hi Dave

On Thu, Dec 07, 2023 at 11:39:50AM +0000, Dave Stevenson wrote:
> On Thu, 7 Dec 2023 at 10:19, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Dave
> >
> > On Wed, Dec 06, 2023 at 04:36:47PM +0000, Dave Stevenson wrote:
> > > Hi Jacopo
> > >
> > > On Wed, 6 Dec 2023 at 15:59, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> > > >
> > > > Add a driver for the OmniVision OV64A40 image sensor.
> > > >
> > > > Co-developed-by: Lee Jackson <lee.jackson@arducam.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
>
> <snip>
>
> > > > +       /* Full resolution */
> > > > +       {
> > > > +               .width = 9248,
> > > > +               .height = 6944,
> > > > +               .timings_default = {
> > > > +                       /* 2.6 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 7072,
> > > > +                               .ppl = 4072,
> > > > +                       },
> > > > +                       /* 2 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 7072,
> > > > +                               .ppl = 5248,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_9248x6944),
> > > > +                       .regvals = ov64a40_9248x6944,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 0,
> > > > +                       .top = 0,
> > > > +                       .width = 9279,
> > > > +                       .height = 6975,
> > >
> > > As I just noted on our Github PR, odd numbers for width or height are
> > > unlikely to be correct as it shifts the image when flipped.
> >
> > I'm not 100% sure why they would cause issues: (ana_crop.left +
> > ana_crop.width) is only used to compute X_END, which counts from 0, so
> > using 9279 counts 9280 pixels ?
>
> In which case your "width" field isn't defining the width. The docs
> for v4l2_rect clearly state that the width field holds the "Width of
> the rectangle, in pixels." [1]
>
> Don't call a variable something it isn't - that's where we started on
> this as the driver was using the width field to hold X_END, and hence
> I queried a mode that appeared to have a crop that went off the
> sensor.
> My comment with regard to odd values is what tipped me off that
> something was strange with the values. If this sensor really did read
> out an odd number of pixels per line, then I would have accepted it.
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-overlay.html#c.v4l2_rect
>
> > >
> > > This came from the conversion of what were the start and end pixel
> > > values, so actually ov64a40_program_geometry wants to use
> > > anacrop->width + anacrop->left - 1
> > > and
> > > anacrop->height + anacrop->top - 1
> > > to get the same register values but with sane widths and heights.
> >
> > Or this is only about having width/height even here compensate it by
> > subtracting -1 in ov64a40_program_geometry() ?
>
> Yes, it's making the driver mode description actually match reality.
>
> As you say, for this mode you're programming X_START as 0 and X_END as
> 9279, that is a width of 9280 pixels, so the value in "width" should
> be 9280.
> The calculation in ov64a40_program_geometry therefore needs to
> subtract 1 when computing the _END register value.
>

Ah ok! thanks for clarifying! I thought I could have missed other
possible implications in the interactions with flips.

I'll make the rectangle's numbers even and subtract 1 when applying to
registers

Thanks
  j

>   Dave
>
> > >
> > >   Dave
> > >
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 17,
> > > > +                       .top = 16,
> > > > +                       .width = 9248,
> > > > +                       .height = 6944,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 1,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 1,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = false,
> > > > +                       .hbin = false,
> > > > +               },
> > > > +       },
> > > > +       /* Analogue crop + digital crop */
> > > > +       {
> > > > +               .width = 8000,
> > > > +               .height = 6000,
> > > > +               .timings_default = {
> > > > +                       /* 3.0 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 6400,
> > > > +                               .ppl = 3848,
> > > > +                       },
> > > > +                       /* 2.5 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 6304,
> > > > +                               .ppl = 4736,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_8000x6000),
> > > > +                       .regvals = ov64a40_8000x6000,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 624,
> > > > +                       .top = 472,
> > > > +                       .width = 8047,
> > > > +                       .height = 6031,
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 17,
> > > > +                       .top = 16,
> > > > +                       .width = 8000,
> > > > +                       .height = 6000,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 1,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 1,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = false,
> > > > +                       .hbin = false,
> > > > +               },
> > > > +       },
> > > > +       /* 2x2 downscaled */
> > > > +       {
> > > > +               .width = 4624,
> > > > +               .height = 3472,
> > > > +               .timings_default = {
> > > > +                       /* 10 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 3533,
> > > > +                               .ppl = 2112,
> > > > +                       },
> > > > +                       /* 7 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 3939,
> > > > +                               .ppl = 2720,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_4624_3472),
> > > > +                       .regvals = ov64a40_4624_3472,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 0,
> > > > +                       .top = 0,
> > > > +                       .width = 9279,
> > > > +                       .height = 6975,
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 9,
> > > > +                       .top = 8,
> > > > +                       .width = 4624,
> > > > +                       .height = 3472,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 3,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 1,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = true,
> > > > +                       .hbin = false,
> > > > +               },
> > > > +       },
> > > > +       /* Analogue crop + 2x2 downscale + digital crop */
> > > > +       {
> > > > +               .width = 3840,
> > > > +               .height = 2160,
> > > > +               .timings_default = {
> > > > +                       /* 20 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 2218,
> > > > +                               .ppl = 1690,
> > > > +                       },
> > > > +                       /* 15 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 2270,
> > > > +                               .ppl = 2202,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_3840x2160),
> > > > +                       .regvals = ov64a40_3840x2160,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 784,
> > > > +                       .top = 1312,
> > > > +                       .width = 7711,
> > > > +                       .height = 4351,
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 9,
> > > > +                       .top = 8,
> > > > +                       .width = 3840,
> > > > +                       .height = 2160,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 3,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 1,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = true,
> > > > +                       .hbin = false,
> > > > +               },
> > > > +       },
> > > > +       /* 4x4 downscaled */
> > > > +       {
> > > > +               .width = 2312,
> > > > +               .height = 1736,
> > > > +               .timings_default = {
> > > > +                       /* 30 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 1998,
> > > > +                               .ppl = 1248,
> > > > +                       },
> > > > +                       /* 25 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 1994,
> > > > +                               .ppl = 1504,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_2312_1736),
> > > > +                       .regvals = ov64a40_2312_1736,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 0,
> > > > +                       .top = 0,
> > > > +                       .width = 9279,
> > > > +                       .height = 6975,
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 5,
> > > > +                       .top = 4,
> > > > +                       .width = 2312,
> > > > +                       .height = 1736,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 3,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 3,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = true,
> > > > +                       .hbin = true,
> > > > +               },
> > > > +       },
> > > > +       /* Analogue crop + 4x4 downscale + digital crop */
> > > > +       {
> > > > +               .width = 1920,
> > > > +               .height = 1080,
> > > > +               .timings_default = {
> > > > +                       /* 60 FPS */
> > > > +                       [OV64A40_LINK_FREQ_456M_ID] = {
> > > > +                               .vts = 1397,
> > > > +                               .ppl = 880,
> > > > +                       },
> > > > +                       /* 45 FPS */
> > > > +                       [OV64A40_LINK_FREQ_360M_ID] = {
> > > > +                               .vts = 1216,
> > > > +                               .ppl = 1360,
> > > > +                       },
> > > > +               },
> > > > +               .reglist = {
> > > > +                       .num_regs = ARRAY_SIZE(ov64a40_1920x1080),
> > > > +                       .regvals = ov64a40_1920x1080,
> > > > +               },
> > > > +               .analogue_crop = {
> > > > +                       .left = 784,
> > > > +                       .top = 1312,
> > > > +                       .width = 7711,
> > > > +                       .height = 4351,
> > > > +               },
> > > > +               .digital_crop = {
> > > > +                       .left = 7,
> > > > +                       .top = 6,
> > > > +                       .width = 1920,
> > > > +                       .height = 1080,
> > > > +               },
> > > > +               .subsampling = {
> > > > +                       .x_odd_inc = 3,
> > > > +                       .x_even_inc = 1,
> > > > +                       .y_odd_inc = 3,
> > > > +                       .y_even_inc = 1,
> > > > +                       .vbin = true,
> > > > +                       .hbin = true,
> > > > +               },
> > > > +       },
> > > > +};
> > > > +
> > > > +struct ov64a40 {
> > > > +       struct device *dev;
> > > > +
> > > > +       struct v4l2_subdev sd;
> > > > +       struct media_pad pad;
> > > > +
> > > > +       struct regmap *cci;
> > > > +
> > > > +       struct ov64a40_mode *mode;
> > > > +
> > > > +       struct clk *xclk;
> > > > +
> > > > +       struct gpio_desc *reset_gpio;
> > > > +       struct regulator_bulk_data supplies[ARRAY_SIZE(ov64a40_supply_names)];
> > > > +
> > > > +       s64 *link_frequencies;
> > > > +       unsigned int num_link_frequencies;
> > > > +
> > > > +       struct v4l2_ctrl_handler ctrl_handler;
> > > > +       struct v4l2_ctrl *exposure;
> > > > +       struct v4l2_ctrl *link_freq;
> > > > +       struct v4l2_ctrl *vblank;
> > > > +       struct v4l2_ctrl *hblank;
> > > > +       struct v4l2_ctrl *vflip;
> > > > +       struct v4l2_ctrl *hflip;
> > > > +};
> > > > +
> > > > +static inline struct ov64a40 *sd_to_ov64a40(struct v4l2_subdev *sd)
> > > > +{
> > > > +       return container_of_const(sd, struct ov64a40, sd);
> > > > +}
> > > > +
> > > > +static const struct ov64a40_timings *
> > > > +ov64a40_get_timings(struct ov64a40 *ov64a40, unsigned int link_freq_index)
> > > > +{
> > > > +       s64 link_freq = ov64a40->link_frequencies[link_freq_index];
> > > > +       unsigned int timings_index = link_freq == OV64A40_LINK_FREQ_360M
> > > > +                                  ? OV64A40_LINK_FREQ_360M_ID
> > > > +                                  : OV64A40_LINK_FREQ_456M_ID;
> > > > +
> > > > +       return &ov64a40->mode->timings_default[timings_index];
> > > > +}
> > > > +
> > > > +static int ov64a40_program_geometry(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       struct ov64a40_mode *mode = ov64a40->mode;
> > > > +       struct v4l2_rect *anacrop = &mode->analogue_crop;
> > > > +       struct v4l2_rect *digicrop = &mode->digital_crop;
> > > > +       const struct ov64a40_timings *timings;
> > > > +       int ret = 0;
> > > > +
> > > > +       /* Analogue crop. */
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL0,
> > > > +                 anacrop->left, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL2,
> > > > +                 anacrop->top, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL4,
> > > > +                 anacrop->width + anacrop->left, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL6,
> > > > +                 anacrop->height + anacrop->top, &ret);
> > > > +
> > > > +       /* ISP windowing. */
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL10,
> > > > +                 digicrop->left, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL12,
> > > > +                 digicrop->top, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL8,
> > > > +                 digicrop->width, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLA,
> > > > +                 digicrop->height, &ret);
> > > > +
> > > > +       /* Total timings. */
> > > > +       timings = ov64a40_get_timings(ov64a40, ov64a40->link_freq->cur.val);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLC, timings->ppl, &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRLE, timings->vts, &ret);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int ov64a40_program_subsampling(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       struct ov64a40_subsampling *subsampling = &ov64a40->mode->subsampling;
> > > > +       int ret = 0;
> > > > +
> > > > +       /* Skipping configuration */
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL14,
> > > > +                 OV64A40_SKIPPING_CONFIG(subsampling->x_odd_inc,
> > > > +                                         subsampling->x_even_inc), &ret);
> > > > +       cci_write(ov64a40->cci, OV64A40_REG_TIMING_CTRL15,
> > > > +                 OV64A40_SKIPPING_CONFIG(subsampling->y_odd_inc,
> > > > +                                         subsampling->y_even_inc), &ret);
> > > > +
> > > > +       /* Binning configuration */
> > > > +       cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > > > +                       OV64A40_TIMING_CTRL_20_VBIN,
> > > > +                       subsampling->vbin ? OV64A40_TIMING_CTRL_20_VBIN : 0,
> > > > +                       &ret);
> > > > +       cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > > > +                       OV64A40_TIMING_CTRL_21_HBIN_CONF,
> > > > +                       subsampling->hbin ?
> > > > +                       OV64A40_TIMING_CTRL_21_HBIN_CONF : 0, &ret);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int ov64a40_start_streaming(struct ov64a40 *ov64a40,
> > > > +                                  struct v4l2_subdev_state *state)
> > > > +{
> > > > +       const struct ov64a40_reglist *reglist = &ov64a40->mode->reglist;
> > > > +       const struct ov64a40_timings *timings;
> > > > +       unsigned long delay;
> > > > +       int ret;
> > > > +
> > > > +       ret = pm_runtime_resume_and_get(ov64a40->dev);
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       ret = cci_multi_reg_write(ov64a40->cci, ov64a40_init,
> > > > +                                 ARRAY_SIZE(ov64a40_init), NULL);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       ret = cci_multi_reg_write(ov64a40->cci, reglist->regvals,
> > > > +                                 reglist->num_regs, NULL);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       ret = ov64a40_program_geometry(ov64a40);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       ret = ov64a40_program_subsampling(ov64a40);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       ret =  __v4l2_ctrl_handler_setup(&ov64a40->ctrl_handler);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       ret = cci_write(ov64a40->cci, OV64A40_REG_SMIA,
> > > > +                       OV64A40_REG_SMIA_STREAMING, NULL);
> > > > +       if (ret)
> > > > +               goto error_power_off;
> > > > +
> > > > +       /* Link frequency and flips cannot change while streaming. */
> > > > +       __v4l2_ctrl_grab(ov64a40->link_freq, true);
> > > > +       __v4l2_ctrl_grab(ov64a40->vflip, true);
> > > > +       __v4l2_ctrl_grab(ov64a40->hflip, true);
> > > > +
> > > > +       /* delay: max(4096 xclk pulses, 150usec) + exposure time */
> > > > +       timings = ov64a40_get_timings(ov64a40, ov64a40->link_freq->cur.val);
> > > > +       delay = DIV_ROUND_UP(4096, OV64A40_XCLK_FREQ / 1000 / 1000);
> > > > +       delay = max(delay, 150ul);
> > > > +
> > > > +       /* The sensor has an internal x4 multiplier on the line length. */
> > > > +       delay += DIV_ROUND_UP(timings->ppl * 4 * ov64a40->exposure->cur.val,
> > > > +                             OV64A40_PIXEL_RATE / 1000 / 1000);
> > > > +       fsleep(delay);
> > > > +
> > > > +       return 0;
> > > > +
> > > > +error_power_off:
> > > > +       pm_runtime_mark_last_busy(ov64a40->dev);
> > > > +       pm_runtime_put_autosuspend(ov64a40->dev);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int ov64a40_stop_streaming(struct ov64a40 *ov64a40,
> > > > +                                 struct v4l2_subdev_state *state)
> > > > +{
> > > > +       cci_update_bits(ov64a40->cci, OV64A40_REG_SMIA, BIT(0), 0, NULL);
> > > > +       pm_runtime_mark_last_busy(ov64a40->dev);
> > > > +       pm_runtime_put_autosuspend(ov64a40->dev);
> > > > +
> > > > +       __v4l2_ctrl_grab(ov64a40->link_freq, false);
> > > > +       __v4l2_ctrl_grab(ov64a40->vflip, false);
> > > > +       __v4l2_ctrl_grab(ov64a40->hflip, false);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_set_stream(struct v4l2_subdev *sd, int enable)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +       struct v4l2_subdev_state *state;
> > > > +       int ret;
> > > > +
> > > > +       state = v4l2_subdev_lock_and_get_active_state(sd);
> > > > +       if (enable)
> > > > +               ret = ov64a40_start_streaming(ov64a40, state);
> > > > +       else
> > > > +               ret = ov64a40_stop_streaming(ov64a40, state);
> > > > +       v4l2_subdev_unlock_state(state);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static const struct v4l2_subdev_video_ops ov64a40_video_ops = {
> > > > +       .s_stream = ov64a40_set_stream,
> > > > +};
> > > > +
> > > > +static u32 ov64a40_mbus_code(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       unsigned int index = ov64a40->hflip->val << 1 | ov64a40->vflip->val;
> > > > +
> > > > +       return ov64a40_mbus_codes[index];
> > > > +}
> > > > +
> > > > +static void ov64a40_update_pad_fmt(struct ov64a40 *ov64a40,
> > > > +                                  struct ov64a40_mode *mode,
> > > > +                                  struct v4l2_mbus_framefmt *fmt)
> > > > +{
> > > > +       fmt->code = ov64a40_mbus_code(ov64a40);
> > > > +       fmt->width = mode->width;
> > > > +       fmt->height = mode->height;
> > > > +       fmt->field = V4L2_FIELD_NONE;
> > > > +       fmt->colorspace = V4L2_COLORSPACE_RAW;
> > > > +       fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > > > +       fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> > > > +       fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> > > > +}
> > > > +
> > > > +static int ov64a40_init_cfg(struct v4l2_subdev *sd,
> > > > +                           struct v4l2_subdev_state *state)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +       struct v4l2_mbus_framefmt *format;
> > > > +       struct v4l2_rect *crop;
> > > > +
> > > > +       format = v4l2_subdev_state_get_format(state, 0);
> > > > +       ov64a40_update_pad_fmt(ov64a40, &ov64a40_modes[0], format);
> > > > +
> > > > +       crop = v4l2_subdev_state_get_crop(state, 0);
> > > > +       crop->top = OV64A40_PIXEL_ARRAY_TOP;
> > > > +       crop->left = OV64A40_PIXEL_ARRAY_LEFT;
> > > > +       crop->width = OV64A40_PIXEL_ARRAY_WIDTH;
> > > > +       crop->height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_enum_mbus_code(struct v4l2_subdev *sd,
> > > > +                                 struct v4l2_subdev_state *state,
> > > > +                                 struct v4l2_subdev_mbus_code_enum *code)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +
> > > > +       if (code->index)
> > > > +               return -EINVAL;
> > > > +
> > > > +       code->code = ov64a40_mbus_code(ov64a40);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_enum_frame_size(struct v4l2_subdev *sd,
> > > > +                                  struct v4l2_subdev_state *state,
> > > > +                                  struct v4l2_subdev_frame_size_enum *fse)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +       struct ov64a40_mode *mode;
> > > > +       u32 code;
> > > > +
> > > > +       if (fse->index >= ARRAY_SIZE(ov64a40_modes))
> > > > +               return -EINVAL;
> > > > +
> > > > +       code = ov64a40_mbus_code(ov64a40);
> > > > +       if (fse->code != code)
> > > > +               return -EINVAL;
> > > > +
> > > > +       mode = &ov64a40_modes[fse->index];
> > > > +       fse->min_width = mode->width;
> > > > +       fse->max_width = mode->width;
> > > > +       fse->min_height = mode->height;
> > > > +       fse->max_height = mode->height;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_get_selection(struct v4l2_subdev *sd,
> > > > +                                struct v4l2_subdev_state *state,
> > > > +                                struct v4l2_subdev_selection *sel)
> > > > +{
> > > > +       switch (sel->target) {
> > > > +       case V4L2_SEL_TGT_CROP:
> > > > +               sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > > > +
> > > > +               return 0;
> > > > +
> > > > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > +               sel->r.top = 0;
> > > > +               sel->r.left = 0;
> > > > +               sel->r.width = OV64A40_NATIVE_WIDTH;
> > > > +               sel->r.height = OV64A40_NATIVE_HEIGHT;
> > > > +
> > > > +               return 0;
> > > > +
> > > > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > > > +               sel->r.top = OV64A40_PIXEL_ARRAY_TOP;
> > > > +               sel->r.left = OV64A40_PIXEL_ARRAY_LEFT;
> > > > +               sel->r.width = OV64A40_PIXEL_ARRAY_WIDTH;
> > > > +               sel->r.height = OV64A40_PIXEL_ARRAY_HEIGHT;
> > > > +
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       return -EINVAL;
> > > > +}
> > > > +
> > > > +static int ov64a40_set_format(struct v4l2_subdev *sd,
> > > > +                             struct v4l2_subdev_state *state,
> > > > +                             struct v4l2_subdev_format *fmt)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +       struct v4l2_mbus_framefmt *format;
> > > > +       struct ov64a40_mode *mode;
> > > > +
> > > > +       mode = v4l2_find_nearest_size(ov64a40_modes,
> > > > +                                     ARRAY_SIZE(ov64a40_modes),
> > > > +                                     width, height,
> > > > +                                     fmt->format.width, fmt->format.height);
> > > > +
> > > > +       ov64a40_update_pad_fmt(ov64a40, mode, &fmt->format);
> > > > +
> > > > +       format = v4l2_subdev_state_get_format(state, 0);
> > > > +       if (ov64a40->mode == mode && format->code == fmt->format.code)
> > > > +               return 0;
> > > > +
> > > > +       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > +               const struct ov64a40_timings *timings;
> > > > +               int vblank_max, vblank_def;
> > > > +               int hblank_val;
> > > > +               int exp_max;
> > > > +
> > > > +               ov64a40->mode = mode;
> > > > +               *v4l2_subdev_state_get_crop(state, 0) = mode->analogue_crop;
> > > > +
> > > > +               /* Update control limits according to the new mode. */
> > > > +               timings = ov64a40_get_timings(ov64a40,
> > > > +                                             ov64a40->link_freq->cur.val);
> > > > +               vblank_max = OV64A40_VTS_MAX - mode->height;
> > > > +               vblank_def = timings->vts - mode->height;
> > > > +               __v4l2_ctrl_modify_range(ov64a40->vblank, OV64A40_VBLANK_MIN,
> > > > +                                        vblank_max, 1, vblank_def);
> > > > +               __v4l2_ctrl_s_ctrl(ov64a40->vblank, vblank_def);
> > > > +
> > > > +               exp_max = timings->vts - OV64A40_EXPOSURE_MARGIN;
> > > > +               __v4l2_ctrl_modify_range(ov64a40->exposure,
> > > > +                                        OV64A40_EXPOSURE_MIN, exp_max,
> > > > +                                        1, OV64A40_EXPOSURE_MIN);
> > > > +
> > > > +               hblank_val = timings->ppl * 4 - mode->width;
> > > > +               __v4l2_ctrl_modify_range(ov64a40->hblank,
> > > > +                                        hblank_val, hblank_val, 1, hblank_val);
> > > > +       }
> > > > +
> > > > +       *format = fmt->format;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
> > > > +       .init_cfg = ov64a40_init_cfg,
> > > > +       .enum_mbus_code = ov64a40_enum_mbus_code,
> > > > +       .enum_frame_size = ov64a40_enum_frame_size,
> > > > +       .get_fmt = v4l2_subdev_get_fmt,
> > > > +       .set_fmt = ov64a40_set_format,
> > > > +       .get_selection = ov64a40_get_selection,
> > > > +};
> > > > +
> > > > +static const struct v4l2_subdev_core_ops ov64a40_core_ops = {
> > > > +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > > +};
> > > > +
> > > > +static const struct v4l2_subdev_ops ov64a40_subdev_ops = {
> > > > +       .core = &ov64a40_core_ops,
> > > > +       .video = &ov64a40_video_ops,
> > > > +       .pad = &ov64a40_pad_ops,
> > > > +};
> > > > +
> > > > +static int ov64a40_power_on(struct device *dev)
> > > > +{
> > > > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +       int ret;
> > > > +
> > > > +       ret = clk_prepare_enable(ov64a40->xclk);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       ret = regulator_bulk_enable(ARRAY_SIZE(ov64a40_supply_names),
> > > > +                                   ov64a40->supplies);
> > > > +       if (ret) {
> > > > +               clk_disable_unprepare(ov64a40->xclk);
> > > > +               dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       gpiod_set_value_cansleep(ov64a40->reset_gpio, 0);
> > > > +
> > > > +       fsleep(5000);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_power_off(struct device *dev)
> > > > +{
> > > > +       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > > +       struct ov64a40 *ov64a40 = sd_to_ov64a40(sd);
> > > > +
> > > > +       gpiod_set_value_cansleep(ov64a40->reset_gpio, 1);
> > > > +       regulator_bulk_disable(ARRAY_SIZE(ov64a40_supply_names),
> > > > +                              ov64a40->supplies);
> > > > +       clk_disable_unprepare(ov64a40->xclk);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_link_freq_config(struct ov64a40 *ov64a40, int link_freq_id)
> > > > +{
> > > > +       s64 link_frequency;
> > > > +       int ret = 0;
> > > > +
> > > > +       /* Default 456MHz with 24MHz input clock. */
> > > > +       cci_multi_reg_write(ov64a40->cci, ov64a40_pll_config,
> > > > +                           ARRAY_SIZE(ov64a40_pll_config), &ret);
> > > > +
> > > > +       /* Decrease the PLL1 multiplier to obtain 360MHz mipi link frequency. */
> > > > +       link_frequency = ov64a40->link_frequencies[link_freq_id];
> > > > +       if (link_frequency == OV64A40_LINK_FREQ_360M)
> > > > +               cci_write(ov64a40->cci, OV64A40_PLL1_MULTIPLIER, 0x0078, &ret);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int ov64a40_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +       struct ov64a40 *ov64a40 = container_of(ctrl->handler, struct ov64a40,
> > > > +                                              ctrl_handler);
> > > > +       int pm_status;
> > > > +       int ret = 0;
> > > > +
> > > > +       if (ctrl->id == V4L2_CID_VBLANK) {
> > > > +               int exp_max = ov64a40->mode->height + ctrl->val
> > > > +                           - OV64A40_EXPOSURE_MARGIN;
> > > > +               int exp_val = min(ov64a40->exposure->cur.val, exp_max);
> > > > +
> > > > +               __v4l2_ctrl_modify_range(ov64a40->exposure,
> > > > +                                        ov64a40->exposure->minimum,
> > > > +                                        exp_max, 1, exp_val);
> > > > +       }
> > > > +
> > > > +       pm_status = pm_runtime_get_if_active(ov64a40->dev, true);
> > > > +       if (!pm_status)
> > > > +               return 0;
> > > > +
> > > > +       switch (ctrl->id) {
> > > > +       case V4L2_CID_EXPOSURE:
> > > > +               ret = cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_EXPO,
> > > > +                               ctrl->val, NULL);
> > > > +               break;
> > > > +       case V4L2_CID_ANALOGUE_GAIN:
> > > > +               ret = cci_write(ov64a40->cci, OV64A40_REG_MEC_LONG_GAIN,
> > > > +                               ctrl->val << 1, NULL);
> > > > +               break;
> > > > +       case V4L2_CID_VBLANK: {
> > > > +               int vts = ctrl->val + ov64a40->mode->height;
> > > > +
> > > > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_LOW, vts, &ret);
> > > > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_MID,
> > > > +                         (vts >> 8), &ret);
> > > > +               cci_write(ov64a40->cci, OV64A40_REG_TIMINGS_VTS_HIGH,
> > > > +                         (vts >> 16), &ret);
> > > > +               break;
> > > > +       }
> > > > +       case V4L2_CID_VFLIP:
> > > > +               ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_20,
> > > > +                                     OV64A40_TIMING_CTRL_20_VFLIP,
> > > > +                                     ctrl->val << 2,
> > > > +                                     NULL);
> > > > +               break;
> > > > +       case V4L2_CID_HFLIP:
> > > > +               ret = cci_update_bits(ov64a40->cci, OV64A40_REG_TIMING_CTRL_21,
> > > > +                                     OV64A40_TIMING_CTRL_21_HFLIP,
> > > > +                                     ctrl->val ? 0
> > > > +                                               : OV64A40_TIMING_CTRL_21_HFLIP,
> > > > +                                     NULL);
> > > > +               break;
> > > > +       case V4L2_CID_TEST_PATTERN:
> > > > +               ret = cci_write(ov64a40->cci, OV64A40_REG_TEST_PATTERN,
> > > > +                               ov64a40_test_pattern_val[ctrl->val], NULL);
> > > > +               break;
> > > > +       case V4L2_CID_LINK_FREQ:
> > > > +               ret = ov64a40_link_freq_config(ov64a40, ctrl->val);
> > > > +               break;
> > > > +       default:
> > > > +               dev_err(ov64a40->dev, "Unhandled control: %#x\n", ctrl->id);
> > > > +               ret = -EINVAL;
> > > > +               break;
> > > > +       }
> > > > +
> > > > +       if (pm_status > 0) {
> > > > +               pm_runtime_mark_last_busy(ov64a40->dev);
> > > > +               pm_runtime_put_autosuspend(ov64a40->dev);
> > > > +       }
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static const struct v4l2_ctrl_ops ov64a40_ctrl_ops = {
> > > > +       .s_ctrl = ov64a40_set_ctrl,
> > > > +};
> > > > +
> > > > +static int ov64a40_init_controls(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       int exp_max, hblank_val, vblank_max, vblank_def;
> > > > +       struct v4l2_ctrl_handler *hdlr = &ov64a40->ctrl_handler;
> > > > +       struct v4l2_fwnode_device_properties props;
> > > > +       const struct ov64a40_timings *timings;
> > > > +       int ret;
> > > > +
> > > > +       ret = v4l2_ctrl_handler_init(hdlr, 11);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > > > +                         OV64A40_PIXEL_RATE, OV64A40_PIXEL_RATE,  1,
> > > > +                         OV64A40_PIXEL_RATE);
> > > > +
> > > > +       ov64a40->link_freq =
> > > > +               v4l2_ctrl_new_int_menu(hdlr, &ov64a40_ctrl_ops,
> > > > +                                      V4L2_CID_LINK_FREQ,
> > > > +                                      ov64a40->num_link_frequencies - 1,
> > > > +                                      0, ov64a40->link_frequencies);
> > > > +
> > > > +       v4l2_ctrl_new_std_menu_items(hdlr, &ov64a40_ctrl_ops,
> > > > +                                    V4L2_CID_TEST_PATTERN,
> > > > +                                    ARRAY_SIZE(ov64a40_test_pattern_menu) - 1,
> > > > +                                    0, 0, ov64a40_test_pattern_menu);
> > > > +
> > > > +       timings = ov64a40_get_timings(ov64a40, 0);
> > > > +       exp_max = timings->vts - OV64A40_EXPOSURE_MARGIN;
> > > > +       ov64a40->exposure = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > > > +                                             V4L2_CID_EXPOSURE,
> > > > +                                             OV64A40_EXPOSURE_MIN, exp_max, 1,
> > > > +                                             OV64A40_EXPOSURE_MIN);
> > > > +
> > > > +       hblank_val = timings->ppl * 4 - ov64a40->mode->width;
> > > > +       ov64a40->hblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > > > +                                           V4L2_CID_HBLANK, hblank_val,
> > > > +                                           hblank_val, 1, hblank_val);
> > > > +       if (ov64a40->hblank)
> > > > +               ov64a40->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > +
> > > > +       vblank_def = timings->vts - ov64a40->mode->height;
> > > > +       vblank_max = OV64A40_VTS_MAX - ov64a40->mode->height;
> > > > +       ov64a40->vblank = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > > > +                                           V4L2_CID_VBLANK, OV64A40_VBLANK_MIN,
> > > > +                                           vblank_max, 1, vblank_def);
> > > > +
> > > > +       v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> > > > +                         OV64A40_ANA_GAIN_MIN, OV64A40_ANA_GAIN_MAX, 1,
> > > > +                         OV64A40_ANA_GAIN_DEFAULT);
> > > > +
> > > > +       ov64a40->hflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > > > +                                          V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > > +       if (ov64a40->hflip)
> > > > +               ov64a40->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > > > +
> > > > +       ov64a40->vflip = v4l2_ctrl_new_std(hdlr, &ov64a40_ctrl_ops,
> > > > +                                          V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > > +       if (ov64a40->vflip)
> > > > +               ov64a40->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > > > +
> > > > +       if (hdlr->error) {
> > > > +               ret = hdlr->error;
> > > > +               dev_err(ov64a40->dev, "control init failed: %d\n", ret);
> > > > +               goto error_free_hdlr;
> > > > +       }
> > > > +
> > > > +       ret = v4l2_fwnode_device_parse(ov64a40->dev, &props);
> > > > +       if (ret)
> > > > +               goto error_free_hdlr;
> > > > +
> > > > +       ret = v4l2_ctrl_new_fwnode_properties(hdlr, &ov64a40_ctrl_ops,
> > > > +                                             &props);
> > > > +       if (ret)
> > > > +               goto error_free_hdlr;
> > > > +
> > > > +       ov64a40->sd.ctrl_handler = hdlr;
> > > > +
> > > > +       return 0;
> > > > +
> > > > +error_free_hdlr:
> > > > +       v4l2_ctrl_handler_free(hdlr);
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int ov64a40_identify(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       int ret;
> > > > +       u64 id;
> > > > +
> > > > +       ret = cci_read(ov64a40->cci, OV64A40_REG_CHIP_ID, &id, NULL);
> > > > +       if (ret) {
> > > > +               dev_err(ov64a40->dev, "Failed to read chip id: %d\n", ret);
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       if (id != OV64A40_CHIP_ID) {
> > > > +               dev_err(ov64a40->dev, "chip id mismatch: %#llx\n", id);
> > > > +               return -ENODEV;
> > > > +       }
> > > > +
> > > > +       dev_dbg(ov64a40->dev, "OV64A40 chip identified: %#llx\n", id);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_parse_dt(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       struct v4l2_fwnode_endpoint v4l2_fwnode = {
> > > > +               .bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +       };
> > > > +       struct fwnode_handle *endpoint;
> > > > +       unsigned int i;
> > > > +       int ret;
> > > > +
> > > > +       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(ov64a40->dev),
> > > > +                                                 NULL);
> > > > +       if (!endpoint) {
> > > > +               dev_err(ov64a40->dev, "Failed to find endpoint\n");
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &v4l2_fwnode);
> > > > +       fwnode_handle_put(endpoint);
> > > > +       if (ret) {
> > > > +               dev_err(ov64a40->dev, "Failed to parse endpoint\n");
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       if (v4l2_fwnode.bus.mipi_csi2.num_data_lanes != 2) {
> > > > +               dev_err(ov64a40->dev, "Unsupported number of data lanes: %u\n",
> > > > +                       v4l2_fwnode.bus.mipi_csi2.num_data_lanes);
> > > > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       if (!v4l2_fwnode.nr_of_link_frequencies) {
> > > > +               dev_warn(ov64a40->dev, "no link frequencies defined\n");
> > > > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       if (v4l2_fwnode.nr_of_link_frequencies > 2) {
> > > > +               dev_warn(ov64a40->dev,
> > > > +                        "Unsupported number of link frequencies\n");
> > > > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       ov64a40->link_frequencies =
> > > > +               devm_kcalloc(ov64a40->dev, v4l2_fwnode.nr_of_link_frequencies,
> > > > +                            sizeof(v4l2_fwnode.link_frequencies[0]),
> > > > +                            GFP_KERNEL);
> > > > +       if (!ov64a40->link_frequencies)  {
> > > > +               v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +               return -ENOMEM;
> > > > +       }
> > > > +       ov64a40->num_link_frequencies = v4l2_fwnode.nr_of_link_frequencies;
> > > > +
> > > > +       for (i = 0; i < v4l2_fwnode.nr_of_link_frequencies; ++i) {
> > > > +               if (v4l2_fwnode.link_frequencies[i] != OV64A40_LINK_FREQ_360M &&
> > > > +                   v4l2_fwnode.link_frequencies[i] != OV64A40_LINK_FREQ_456M) {
> > > > +                       dev_err(ov64a40->dev,
> > > > +                               "Unsupported link frequency %lld\n",
> > > > +                               v4l2_fwnode.link_frequencies[i]);
> > > > +                       v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +                       return -EINVAL;
> > > > +               }
> > > > +
> > > > +               ov64a40->link_frequencies[i] = v4l2_fwnode.link_frequencies[i];
> > > > +       }
> > > > +
> > > > +       v4l2_fwnode_endpoint_free(&v4l2_fwnode);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int ov64a40_get_regulators(struct ov64a40 *ov64a40)
> > > > +{
> > > > +       struct i2c_client *client = v4l2_get_subdevdata(&ov64a40->sd);
> > > > +       unsigned int i;
> > > > +
> > > > +       for (i = 0; i < ARRAY_SIZE(ov64a40_supply_names); i++)
> > > > +               ov64a40->supplies[i].supply = ov64a40_supply_names[i];
> > > > +
> > > > +       return devm_regulator_bulk_get(&client->dev,
> > > > +                                      ARRAY_SIZE(ov64a40_supply_names),
> > > > +                                      ov64a40->supplies);
> > > > +}
> > > > +
> > > > +static int ov64a40_probe(struct i2c_client *client)
> > > > +{
> > > > +       struct ov64a40 *ov64a40;
> > > > +       u32 xclk_freq;
> > > > +       int ret;
> > > > +
> > > > +       ov64a40 = devm_kzalloc(&client->dev, sizeof(*ov64a40), GFP_KERNEL);
> > > > +       if (!ov64a40)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       ov64a40->dev = &client->dev;
> > > > +       v4l2_i2c_subdev_init(&ov64a40->sd, client, &ov64a40_subdev_ops);
> > > > +
> > > > +       ov64a40->cci = devm_cci_regmap_init_i2c(client, 16);
> > > > +       if (IS_ERR(ov64a40->cci)) {
> > > > +               dev_err(&client->dev, "Failed to initialize CCI\n");
> > > > +               return PTR_ERR(ov64a40->cci);
> > > > +       }
> > > > +
> > > > +       ov64a40->xclk = devm_clk_get(&client->dev, NULL);
> > > > +       if (IS_ERR(ov64a40->xclk))
> > > > +               return dev_err_probe(&client->dev, PTR_ERR(ov64a40->xclk),
> > > > +                                    "Failed to get clock\n");
> > > > +
> > > > +       xclk_freq = clk_get_rate(ov64a40->xclk);
> > > > +       if (xclk_freq != OV64A40_XCLK_FREQ) {
> > > > +               dev_err(&client->dev, "Unsupported xclk frequency %u\n",
> > > > +                       xclk_freq);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       ret = ov64a40_get_regulators(ov64a40);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       ov64a40->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > > > +                                                     GPIOD_OUT_LOW);
> > > > +       if (IS_ERR(ov64a40->reset_gpio))
> > > > +               return dev_err_probe(&client->dev, PTR_ERR(ov64a40->reset_gpio),
> > > > +                                    "Failed to get reset gpio\n");
> > > > +
> > > > +       ret = ov64a40_parse_dt(ov64a40);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       ret = ov64a40_power_on(&client->dev);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       ret = ov64a40_identify(ov64a40);
> > > > +       if (ret)
> > > > +               goto error_poweroff;
> > > > +
> > > > +       ov64a40->mode = &ov64a40_modes[0];
> > > > +
> > > > +       pm_runtime_set_active(&client->dev);
> > > > +       pm_runtime_get_noresume(&client->dev);
> > > > +       pm_runtime_enable(&client->dev);
> > > > +       pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > > > +       pm_runtime_use_autosuspend(&client->dev);
> > > > +
> > > > +       ret = ov64a40_init_controls(ov64a40);
> > > > +       if (ret)
> > > > +               goto error_poweroff;
> > > > +
> > > > +       /* Initialize subdev */
> > > > +       ov64a40->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE
> > > > +                         | V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > +       ov64a40->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > +
> > > > +       ov64a40->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > +       ret = media_entity_pads_init(&ov64a40->sd.entity, 1, &ov64a40->pad);
> > > > +       if (ret) {
> > > > +               dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
> > > > +               goto error_handler_free;
> > > > +       }
> > > > +
> > > > +       ov64a40->sd.state_lock = ov64a40->ctrl_handler.lock;
> > > > +       ret = v4l2_subdev_init_finalize(&ov64a40->sd);
> > > > +       if (ret < 0) {
> > > > +               dev_err(&client->dev, "subdev init error: %d\n", ret);
> > > > +               goto error_media_entity;
> > > > +       }
> > > > +
> > > > +       ret = v4l2_async_register_subdev_sensor(&ov64a40->sd);
> > > > +       if (ret < 0) {
> > > > +               dev_err(&client->dev,
> > > > +                       "failed to register sensor sub-device: %d\n", ret);
> > > > +               goto error_subdev_cleanup;
> > > > +       }
> > > > +
> > > > +       pm_runtime_mark_last_busy(&client->dev);
> > > > +       pm_runtime_put_autosuspend(&client->dev);
> > > > +
> > > > +       return 0;
> > > > +
> > > > +error_subdev_cleanup:
> > > > +       v4l2_subdev_cleanup(&ov64a40->sd);
> > > > +error_media_entity:
> > > > +       media_entity_cleanup(&ov64a40->sd.entity);
> > > > +error_handler_free:
> > > > +       v4l2_ctrl_handler_free(ov64a40->sd.ctrl_handler);
> > > > +error_poweroff:
> > > > +       ov64a40_power_off(&client->dev);
> > > > +       pm_runtime_set_suspended(&client->dev);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static void ov64a40_remove(struct i2c_client *client)
> > > > +{
> > > > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > +
> > > > +       v4l2_async_unregister_subdev(sd);
> > > > +       v4l2_subdev_cleanup(sd);
> > > > +       media_entity_cleanup(&sd->entity);
> > > > +       v4l2_ctrl_handler_free(sd->ctrl_handler);
> > > > +
> > > > +       pm_runtime_disable(&client->dev);
> > > > +       if (!pm_runtime_status_suspended(&client->dev))
> > > > +               ov64a40_power_off(&client->dev);
> > > > +       pm_runtime_set_suspended(&client->dev);
> > > > +}
> > > > +
> > > > +static const struct of_device_id ov64a40_of_ids[] = {
> > > > +       { .compatible = "ovti,ov64a40" },
> > > > +       { /* sentinel */ }
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, ov64a40_of_ids);
> > > > +
> > > > +static const struct dev_pm_ops ov64a40_pm_ops = {
> > > > +       SET_RUNTIME_PM_OPS(ov64a40_power_off, ov64a40_power_on, NULL)
> > > > +};
> > > > +
> > > > +static struct i2c_driver ov64a40_i2c_driver = {
> > > > +       .driver = {
> > > > +               .name = "ov64a40",
> > > > +               .of_match_table = ov64a40_of_ids,
> > > > +               .pm = &ov64a40_pm_ops,
> > > > +       },
> > > > +       .probe  = ov64a40_probe,
> > > > +       .remove = ov64a40_remove,
> > > > +};
> > > > +
> > > > +module_i2c_driver(ov64a40_i2c_driver);
> > > > +
> > > > +MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
> > > > +MODULE_DESCRIPTION("OmniVision OV64A40 sensor driver");
> > > > +MODULE_LICENSE("GPL");
> > > > --
> > > > 2.41.0
> > > >

