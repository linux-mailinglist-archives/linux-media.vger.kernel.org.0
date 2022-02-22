Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFE84BF2E7
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 08:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiBVHsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 02:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiBVHss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 02:48:48 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D6D91362
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 23:48:21 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B25CC24000B;
        Tue, 22 Feb 2022 07:48:07 +0000 (UTC)
Date:   Tue, 22 Feb 2022 08:48:06 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 01/23] media: ov5640: Add pixel rate to modes
Message-ID: <20220222074806.xlnjct7k5f2p565m@uno.localdomain>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-2-jacopo@jmondi.org>
 <YhIrq5dxI/ZNqaVz@pendragon.ideasonboard.com>
 <CAHCN7xLQwrHE=8=qOnPTv6S=wPwz2_Hofe3pq7VT_Lqj94Jfvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLQwrHE=8=qOnPTv6S=wPwz2_Hofe3pq7VT_Lqj94Jfvw@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

On Mon, Feb 21, 2022 at 02:14:43PM -0600, Adam Ford wrote:
> On Sun, Feb 20, 2022 at 5:53 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Thu, Feb 10, 2022 at 12:04:36PM +0100, Jacopo Mondi wrote:
> > > Add to each mode supported by the sensor the ideal pixel rate, as
> > > defined by Table 2.1 in the chip manual.
> > >
> > > The ideal pixel rate will be used to compute the MIPI CSI-2 clock tree.
> > >
>
> I tried this on my imx8mm at a variety of resolutions.  I don't have a
> functional display yet, so I couldn't test streaming to a screen, but
> I did capture images and encode them into an AVI. From what I can
> tell, the exposure seems to handle darker environments better now.

I noticed the same. Unfortunately I still have to clarify myself how
the auto-exposure target is handled, but yes I noticed the same.

> Maybe it's just a placebo effect.  If there are certain resolutions or
> formats you want me to test, let me know.
>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon-kit
>

Thanks for testing. I was about to send a v3 yesterday but I found out
I need to update all my testing scripts first. There's RGB888 which
has weird colors here, and I never tested JPEG. Do you happen to know
if it's working with this driver ?

Thanks!
   j

> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > >  drivers/media/i2c/ov5640.c | 44 +++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 41 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index db5a19babe67..01f4a075f86e 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -118,6 +118,29 @@ enum ov5640_frame_rate {
> > >       OV5640_NUM_FRAMERATES,
> > >  };
> > >
> > > +enum ov5640_pixel_rate_id {
> > > +     OV5640_PIXEL_RATE_168M,
> > > +     OV5640_PIXEL_RATE_148M,
> > > +     OV5640_PIXEL_RATE_124M,
> > > +     OV5640_PIXEL_RATE_96M,
> > > +     OV5640_PIXEL_RATE_48M,
> > > +     OV5640_NUM_PIXEL_RATES,
> > > +};
> > > +
> > > +/*
> > > + * The chip manual suggests 24/48/96/192 MHz pixel clocks.
> > > + *
> > > + * 192MHz exceeds the sysclk limits; use 168MHz as maximum pixel rate for
> > > + * full resolution mode @15 FPS.
> > > + */
> > > +static const u32 ov5640_pixel_rates[] = {
> > > +     [OV5640_PIXEL_RATE_168M] = 168000000,
> > > +     [OV5640_PIXEL_RATE_148M] = 148000000,
> > > +     [OV5640_PIXEL_RATE_124M] = 124000000,
> > > +     [OV5640_PIXEL_RATE_96M] = 96000000,
> > > +     [OV5640_PIXEL_RATE_48M] = 48000000,
> > > +};
> > > +
> > >  enum ov5640_format_mux {
> > >       OV5640_FMT_MUX_YUV422 = 0,
> > >       OV5640_FMT_MUX_RGB,
> > > @@ -189,6 +212,7 @@ struct reg_value {
> > >  struct ov5640_mode_info {
> > >       enum ov5640_mode_id id;
> > >       enum ov5640_downsize_mode dn_mode;
> > > +     enum ov5640_pixel_rate_id pixel_rate;
> > >       u32 hact;
> > >       u32 htot;
> > >       u32 vact;
> > > @@ -565,7 +589,9 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
> > >
> > >  /* power-on sensor init reg table */
> > >  static const struct ov5640_mode_info ov5640_mode_init_data = {
> > > -     0, SUBSAMPLING, 640, 1896, 480, 984,
> > > +     0, SUBSAMPLING,
> > > +     OV5640_PIXEL_RATE_96M,
> > > +     640, 1896, 480, 984,
> > >       ov5640_init_setting_30fps_VGA,
> > >       ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> > >       OV5640_30_FPS,
> > > @@ -574,51 +600,61 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
> > >  static const struct ov5640_mode_info
> > >  ov5640_mode_data[OV5640_NUM_MODES] = {
> > >       {OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_48M,
> > >        160, 1896, 120, 984,
> > >        ov5640_setting_QQVGA_160_120,
> > >        ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_QCIF_176_144, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_48M,
> > >        176, 1896, 144, 984,
> > >        ov5640_setting_QCIF_176_144,
> > >        ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_QVGA_320_240, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_48M,
> > >        320, 1896, 240, 984,
> > >        ov5640_setting_QVGA_320_240,
> > >        ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_VGA_640_480, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_48M,
> > >        640, 1896, 480, 1080,
> > >        ov5640_setting_VGA_640_480,
> > >        ARRAY_SIZE(ov5640_setting_VGA_640_480),
> > >        OV5640_60_FPS},
> > >       {OV5640_MODE_NTSC_720_480, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_96M,
> > >        720, 1896, 480, 984,
> > >        ov5640_setting_NTSC_720_480,
> > >        ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> > >       OV5640_30_FPS},
> > >       {OV5640_MODE_PAL_720_576, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_96M,
> > >        720, 1896, 576, 984,
> > >        ov5640_setting_PAL_720_576,
> > >        ARRAY_SIZE(ov5640_setting_PAL_720_576),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_XGA_1024_768, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_96M,
> > >        1024, 1896, 768, 1080,
> > >        ov5640_setting_XGA_1024_768,
> > >        ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_720P_1280_720, SUBSAMPLING,
> > > +      OV5640_PIXEL_RATE_124M,
> > >        1280, 1892, 720, 740,
> > >        ov5640_setting_720P_1280_720,
> > >        ARRAY_SIZE(ov5640_setting_720P_1280_720),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_1080P_1920_1080, SCALING,
> > > +      OV5640_PIXEL_RATE_148M,
> > >        1920, 2500, 1080, 1120,
> > >        ov5640_setting_1080P_1920_1080,
> > >        ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> > >        OV5640_30_FPS},
> > >       {OV5640_MODE_QSXGA_2592_1944, SCALING,
> > > +      OV5640_PIXEL_RATE_168M,
> > >        2592, 2844, 1944, 1968,
> > >        ov5640_setting_QSXGA_2592_1944,
> > >        ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> > > @@ -2743,6 +2779,7 @@ static const struct v4l2_ctrl_ops ov5640_ctrl_ops = {
> > >
> > >  static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  {
> > > +     const struct ov5640_mode_info *mode = sensor->current_mode;
> > >       const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
> > >       struct ov5640_ctrls *ctrls = &sensor->ctrls;
> > >       struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> > > @@ -2755,8 +2792,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >
> > >       /* Clock related controls */
> > >       ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > > -                                           0, INT_MAX, 1,
> > > -                                           ov5640_calc_pixel_rate(sensor));
> > > +                                   ov5640_pixel_rates[OV5640_NUM_PIXEL_RATES - 1],
> > > +                                   ov5640_pixel_rates[0], 1,
> > > +                                   ov5640_pixel_rates[mode->pixel_rate]);
> > >
> > >       /* Auto/manual white balance */
> > >       ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
