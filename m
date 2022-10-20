Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A38F605EC6
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 13:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiJTLXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 07:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbiJTLXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 07:23:49 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC4111CB4E
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 04:23:43 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 43DEFC000A;
        Thu, 20 Oct 2022 11:23:39 +0000 (UTC)
Date:   Thu, 20 Oct 2022 13:23:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: ar0521: Set maximum resolution to 2592x1944
Message-ID: <20221020112337.5umwzgqkgam36ygu@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-4-jacopo@jmondi.org>
 <CAPY8ntBgHm6KTpH6GBLiMtdRt1vAE4ne0EMq5N+x0CJJ9yU9+A@mail.gmail.com>
 <Y0AkY6o6spakYJD3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0AkY6o6spakYJD3@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, Oct 07, 2022 at 04:06:43PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 06, 2022 at 03:57:16PM +0100, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Wed, 5 Oct 2022 at 20:06, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > Change the largest visibile resolution to 2592x1944, which corresponds
> > > to the active pixel array area size. Take into account the horizontal
> > > and vertical limits when programming the visible sizes to skip
> > > dummy/inactive pixels.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ar0521.c | 23 +++++++++++++++++------
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index 581f5e42994d..2b19ba898ce8 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -28,10 +28,17 @@
> > >  #define AR0521_PIXEL_CLOCK_MIN  (168 * 1000 * 1000)
> > >  #define AR0521_PIXEL_CLOCK_MAX  (414 * 1000 * 1000)
> > >
> > > +#define AR0521_NATIVE_WIDTH            2604u
> > > +#define AR0521_NATIVE_HEIGHT           1964u
> > > +#define AR0521_MIN_X_ADDR_START                4u
> > > +#define AR0521_MIN_Y_ADDR_START                4u
> > > +#define AR0521_MAX_X_ADDR_END          2603u
> > > +#define AR0521_MAX_Y_ADDR_END          1963u
> >
> > The register list I have (downloaded from OnSemi today) states that
> > y_addr_max is 0x07a3, or 1955, readable from register 0x1186.
>
> And it also states, in the documentation of y_addr_start, that legal
> values are [0, 2463]. Who do we trust ? :-) [0, 2463] sounds like a copy
> & paste mistake to me. Another data point is from the developer guide,
> which states on the first page that the maximum values for x_addr_start
> and y_addr_start are 2603 and 1963 respectively. 2603 matches the
> documentation of x_addr_max.
>
> It would be useful to dump the limits registers (0x1000 - 0x1300).
>
Here you go

[   36.805434] Register integration_time_capabilities = 1
[   36.811658] Register coarse_integration_time_min = 0
[   36.817713] Register coarse_integration_time_max_margin = 0
[   36.824373] Register digital_gain_capability = 1
[   36.830049] Register digital_gain_min = 100
[   36.835322] Register digital_gain_max = 7fc
[   36.840582] Register digital_gain_step = 4
[   36.845733] Register min_pre_pll_clk_div = 1
[   36.851068] Register max_pre_pll_clk_div = 40
[   36.856495] Register min_pll_mult = 20
[   36.861300] Register max_pll_mult = 180
[   36.866198] Register min_vt_sys_clk_div = 1
[   36.871449] Register max_vt_sys_clk_div = 10
[   36.876708] Register min_vt_pix_clk_div = 4
[   36.881947] Register max_vt_pix_clk_div = 10
[   36.887281] Register min_frame_lenght_lines = 30
[   36.892967] Register max_frame_lenght_lines = ffff
[   36.898834] Register min_line_lenght_pck = be0
[   36.904358] Register max_line_lenght_pck = fffc
[   36.909946] Register min_line_blanking_pck = f0
[   36.915539] Register min_frame_blanking_lines = 1c
[   36.921413] Register min_op_sys_clk_div = 1
[   36.926659] Register max_op_sys_clk_div = 10
[   36.932028] Register min_op_pix_clk_div = 6
[   36.937266] Register max_op_pix_clk_div = a
[   36.942530] Register x_addr_min = 0
[   36.947085] Register y_addr_min = 0
[   36.951636] Register x_addr_max = a2b
[   36.956364] Register y_addr_max = 7a3
[   36.961081] Register min_even_inc = 1
[   36.965808] Register max_even_inc = 1
[   36.970536] Register min_odd_inc = 1
[   36.975192] Register max_odd_inc = 7
[   36.979839] Register scaling_capabilities = 2
[   36.985269] Register scaler_m_min = 10
[   36.990086] Register scaler_m_max = 80
[   36.994909] Register scaler_n_min = 10
[   36.999730] Register scaler_n_max = 10
[   37.004550] Register compression_capabilities = 1

The most interesting things here are:

Register x_addr_min = 0
Register y_addr_min = 0
Register x_addr_max = a2b = 2603
Register y_addr_max = 7a3 = 1955

Which confirms the values reported in the registers description
instead of what's reported in the application guide

And these represents the min and max total width and height (visible
and blankings).

Register min_frame_lenght_lines = 30 = 48
Register max_frame_lenght_lines = ffff = 65535
Register min_line_lenght_pck = be0 = 3040
Register max_line_lenght_pck = fffc = 65532

Now, the driver uses as max_vblank the (y_addr_end - width) value (same goes
for hblank) where y_addr_end instead represents the -visible- pixels end address
not the total size.

I presume we should instead use the above reported maximum values,
which gives much more space for blankings...

This values instead

Register min_line_blanking_pck = f0 = 240
Register min_frame_blanking_lines = 1c = 28

Report the min H/VBLANK values (which are currently set to 572 and 38
in the driver).

How these
min_line_blanking_pck = f0 = 240
min_line_lenght_pck = be0 = 3040

play together is not clear to me yet as with a max visible width of
2592 and a min_total_width of 3040, the minimum allowed hblank should
be of at least 448 pixels. All the smaller resolutions should have a
larger blanking, if 3040 is actually the minimum required total width.

As this part is not clear, I would not modify this part, as it works
and matches the expected frame rate.


> > Otherwise this looks reasonable.
> >
> > > +
> > >  #define AR0521_WIDTH_MIN              8u
> > > -#define AR0521_WIDTH_MAX           2608u
> > > +#define AR0521_WIDTH_MAX           2592u
> > >  #define AR0521_HEIGHT_MIN             8u
> > > -#define AR0521_HEIGHT_MAX          1958u
> > > +#define AR0521_HEIGHT_MAX          1944u
> > >
> > >  #define AR0521_WIDTH_BLANKING_MIN     572u
> > >  #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
> > > @@ -208,13 +215,17 @@ static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> > >
> > >  static int ar0521_set_geometry(struct ar0521_dev *sensor)
> > >  {
> > > +       /* Center the image in the visible ouput window. */
> > > +       u16 x = clamp((AR0521_WIDTH_MAX - sensor->fmt.width) / 2,
> > > +                      AR0521_MIN_X_ADDR_START, AR0521_MAX_X_ADDR_END);
> > > +       u16 y = clamp(((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1,
> > > +                      AR0521_MIN_Y_ADDR_START, AR0521_MAX_Y_ADDR_END);
> > > +
> > >         /* All dimensions are unsigned 12-bit integers */
> > > -       u16 x = (AR0521_WIDTH_MAX - sensor->fmt.width) / 2;
> > > -       u16 y = ((AR0521_HEIGHT_MAX - sensor->fmt.height) / 2) & ~1;
> > >         __be16 regs[] = {
> > >                 be(AR0521_REG_FRAME_LENGTH_LINES),
> > > -               be(sensor->total_height),
> > > -               be(sensor->total_width),
> > > +               be(sensor->fmt.height + sensor->ctrls.vblank->val),
> > > +               be(sensor->fmt.width + sensor->ctrls.hblank->val),
> > >                 be(x),
> > >                 be(y),
> > >                 be(x + sensor->fmt.width - 1),
>
> --
> Regards,
>
> Laurent Pinchart
