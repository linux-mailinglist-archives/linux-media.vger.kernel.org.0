Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5726600E6F
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 14:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiJQMAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 08:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiJQMAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 08:00:43 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CFE50189
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 05:00:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id ED68A2000A;
        Mon, 17 Oct 2022 12:00:20 +0000 (UTC)
Date:   Mon, 17 Oct 2022 14:00:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
Message-ID: <20221017120019.txjbiyak24dhzrmk@uno.localdomain>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-6-jacopo@jmondi.org>
 <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
 <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com>
 <CAPY8ntCh4UFT5swHvwPj7xz8wPH3MJB-aJjEd9bCgXVubRyp5w@mail.gmail.com>
 <20221017092424.hygkg26dpubti3ne@uno.localdomain>
 <CAPY8ntAw0Hj3kEUM4BNK9FdPK3b1=4jSST1YTVKd-zUDP0LqVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAw0Hj3kEUM4BNK9FdPK3b1=4jSST1YTVKd-zUDP0LqVw@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Mon, Oct 17, 2022 at 12:00:29PM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 17 Oct 2022 at 10:24, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Dave
> >
> > On Fri, Oct 07, 2022 at 03:26:55PM +0100, Dave Stevenson wrote:
> > > On Fri, 7 Oct 2022 at 15:01, Laurent Pinchart
> > > <laurent.pinchart@ideasonboard.com> wrote:
> > > >
> > > > On Thu, Oct 06, 2022 at 04:10:10PM +0100, Dave Stevenson wrote:
> > > > > On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> > > > > >
> > > > > > Add support for V4L2_CID_LINK_FREQ which currently reports a single
> > > > > > hard-coded frequency which depends on the fixed pixel clock.
> > > > > >
> > > > > > This will change in the next patches where the pixel rate will be
> > > > > > computed from the desired link_frequency.
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > >
> > > > > Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
> > > > > divided by 4 lanes, and DDR.
> > > > >
> > > > > > ---
> > > > > >  drivers/media/i2c/ar0521.c | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > > > > index 21649aecf442..c5410b091654 100644
> > > > > > --- a/drivers/media/i2c/ar0521.c
> > > > > > +++ b/drivers/media/i2c/ar0521.c
> > > > > > @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
> > > > > >         "vaa",          /* Analog (2.7V) supply */
> > > > > >  };
> > > > > >
> > > > > > +static const s64 ar0521_link_frequencies[] = {
> > > > > > +       184000000,
> > > > > > +};
> > > > > > +
> > > > > >  struct ar0521_ctrls {
> > > > > >         struct v4l2_ctrl_handler handler;
> > > > > >         struct v4l2_ctrl *ana_gain;
> > > > > > @@ -104,6 +108,7 @@ struct ar0521_ctrls {
> > > > > >         };
> > > > > >         struct v4l2_ctrl *pixrate;
> > > > > >         struct v4l2_ctrl *exposure;
> > > > > > +       struct v4l2_ctrl *link_freq;
> > > > > >         struct v4l2_ctrl *test_pattern;
> > > > > >  };
> > > > > >
> > > > > > @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > > > > >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> > > > > >                                             65535, 1, 360);
> > > > > >
> > > > > > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > > > > > +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > > > > > +                                       0, ar0521_link_frequencies);
> > > > > > +
> > > > >
> > > > > Admittedly there is only one entry, but did you want to make it a read
> > > > > only control? With no case for it in s_ctrl, you'll get errors thrown
> > > > > from the control handler framework.
> > > >
> > > > I'd make it writable even if there's a single entry, so that userspace
> > > > won't need special logic. It will also prepare for support of multiple
> > > > entries in the future.
> > >
> > > Do you really see a situation where userspace will be configuring link
> > > frequency instead of DT / ACPI?
> > > A quick search seems to imply that only 1 current driver supports a
> > > r/w link frequency - mt9v032. That would imply that having a
> > > controllable link frequency would require the special logic in
> > > userspace.
> > >
> >
> > Yes it does, but we need one way or another to allow userspace to
> > control the sampling frequency as extending (or shrinking) blankings
> > helps up to the point you reach their limits.
> >
> > I was never really fond of the idea that such action should go through
> > link frequency, which seems very much a parameter of the bus that
> > should be negotiated between the recv and the tx parts, rather than
> > being user configurable.
>
> Indeed - that's PIXEL_RATE, not LINK_FREQ.
>
> > > I'm always very cautious about drivers that are linking PIXEL_RATE and
> > > LINK_FREQ - most of the sensors are tending to have 2 (or more) PLLs,
> > > and there is a FIFO between the image sensor (PIXEL_RATE) and the MIPI
> > > block (LINK_FREQ). imx290 is certainly wrong (pixel rate does not
> > > change with mode, but link freq does), and I'm fairly certain that
> > > ov7251 is as well (pixel rate is 48MPix/s whether at 240 or 319.2MHz
> > > link frequency). Patches coming soon for both.
> >
> > The current definition of PIXEL_RATE indeed describes the sampling
> > frequency on the pixel array, which might or might not reflect the
> > output pixel rate. However most if not all usages of PIXEL_RATE I've
> > seen (and FTR the way it is used in libcamera) is to denote the output
> > pixel rate (ie it is used to compute the output timings given the line
> > length and frame height)
> >
> > I wonder
> >
> > 1) The current definition of PIXEL_RATE as the sampling rate on the
> > pixel array: what purposes does it serve ? Are there algorithms that
> > require to know the sampling rate in the analog domain ? Are there
> > implementations that treat PIXEL_RATE differently than the "pixel
> > output rate" ?
>
> Sampling rate on the array is the basis of using VBLANK and HBLANK to
> control frame rate. See documentation at [1]

My understanding, confirmed by your latest replies, is that the
sampling rate on the array != output frame rate because of the
different clocking trees, intermediate buffers etc, ...

>
> frame interval = (analogue crop width + horizontal blanking) *
>                  (analogue crop height + vertical blanking) / pixel rate
>

... hence it's not technically correct to uset he pixel rate to compute
the frame timings on the receiver side in this way ...

> This is NOT the pixel rate on the CSI link.

... but we would need something to represent the pixel output rate on
the bus (and on the receiver)


>
> Taking an example of IMX219 [2], section 9.1 shows the clock structure
> with 2 PLLs. PLL1 drives the pixel array (PIXEL_RATE). PLL2 drives the
> MIPI block (LINK_FREQ).
> There is a FIFO between the pixel array and MIPI, and therefore they
> can run at different rates.
>
> OV5647 is the same.
> IMX327/290/462 are the same, although FRSEL configures specific
> dividers for the PIXEL_RATE.
> OV9281 is the same (2 PLLs).
>
> In your case it does appear that LINK_FREQ and PIXEL_RATE are bound
> together. From the developer guide:
> "to reduce MIPI data rate, sensor pixel clock must be reduced as well"
>

Yes, AR0521 should be fine. Mine was a general digression on the two
controls we use handling frame rate.

> On AR0521 max frame interval is dictated by line_length_pck (0x0342)
> and frame_length_lines (0x0340), both of which are 16bit values.
> At your highest pixel rate of 414000000 I make that 10.37seconds per
> frame, or 0.09fps. So without altering link frequency, my calculations
> say you can do 0.09 to 60fps. Are you currently looking at use cases
> that need frame rates outside these limits? If not, why are you
> looking at changing the rate of anything?

Not really, I just enabled changing the pixel output rate as that's
something I was expecting to be "required".

You're right in this case the total line lenght and total frame height
can span up to 2^16-1 (according to the manual, I've not tested it
thought) but that's not true for all sensors (the OV ones
I interacted with usually have stricter limits) hence from an API
point of view I think we should consider changing the pixel rate as a
valid use case ?

>
> [1] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#raw-camera-sensors
> [2] https://github.com/rellimmot/Sony-IMX219-Raspberry-Pi-V2-CMOS/blob/master/RASPBERRY%20PI%20CAMERA%20V2%20DATASHEET%20IMX219PQH5_7.0.0_Datasheet_XXX.PDF
> [3] https://pdfcoffee.com/ov9281-datasheet-pdf-free.html section 2.8.
>
> > 2) LINK_FREQ is the closest control we have to express the output
> > pixel rate, but to me is very specific to the bus configuration and
> > does not express per se anything useful to userspace for computing
> > timings based on frame/lane sizes. The fact LINK_FREQ is a menu contol
> > reflects how much it relates to the HW configuration as it is assumed
> > to come from DT
>
> I'll agree - link frequency is IMHO near useless to userspace.
> It has a place for EMC compatibility, but I see that as coming from DT
> and the platform configuration, and not from userland.
>
> > Do we need an r/w PIXEL_OUTPUT_RATE control to replace
> > - LINK_FREQ for userspace to configure it
> > - PIXEL_RATE for userspace to read it
>
> No new control needed. Make PIXEL_RATE r/w, and make it modify the

PIXEL_RATE is ro by default, making it rw would require changing the
definition of the control itself:

drivers/media/v4l2-core/v4l2-ctrls-defs.c:      case V4L2_CID_PIXEL_RATE:
drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *type = V4L2_CTRL_TYPE_INTEGER64;
drivers/media/v4l2-core/v4l2-ctrls-defs.c-              *flags |= V4L2_CTRL_FLAG_READ_ONLY;

Which makes me think using it as the output pixel rate means abusing
its definition.

> pixel array clock configuration. AIUI Drivers are allowed to validate
> controls, therefore presumably you can make it lock to discrete values
> instead of a full range.
>

Indeed the control value can be adjusted!

> > LINK_FREQ should only be used in the tx/rx negotiation. It shall
> > vary according to PIXEL_OUTPUT_RATE, possibily in the options
> > specified in DTS (which are there because they have usually been
> > validated for RF emissions, that's my understanding at least).
> >
> > PIXEL_RATE will equally vary, if required, and algorithms that need to
> > know the sampling frequency in the analog domain will continue using
> > it.
> >
> > Or maybe the original idea was to have a pixel array entity and a
> > separate tx entity, each of them with different PIXEL_RATE control ?
>
> Pass over the original intent - I've not been involved in the V4L2
> side of things long enough to know that.
>
>   Dave
>
> > >
> > >   Dave
> > >
> > > > > >         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> > > > > >                                         V4L2_CID_TEST_PATTERN,
> > > > > >                                         ARRAY_SIZE(test_pattern_menu) - 1,
> > > >
> > > > --
> > > > Regards,
> > > >
> > > > Laurent Pinchart
