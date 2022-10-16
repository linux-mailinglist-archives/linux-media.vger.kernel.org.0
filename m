Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B035FFCFB
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 03:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiJPBxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Oct 2022 21:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiJPBxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Oct 2022 21:53:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEB43686C
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 18:53:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A14C30A;
        Sun, 16 Oct 2022 03:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665885213;
        bh=4Li8Krzuko7zJWSyHX3Ah8ThtkckdDSQQAOp16tGr0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KJSj0R+RW76YkSW3t3cIYH84lRjltkITiyUcZFt+vF+rf1uWTs6db8YOdSbBRRbtw
         9Lk7y+BZQHY0qVegr/VODgE/EmhaIe97iDSYujWK91GfEcLBkMzsEdhN4/FrhQQN6Q
         ZsfOYlxbI/SHI0sdW7aj9xX9uIn7R8CADq7aSy0w=
Date:   Sun, 16 Oct 2022 04:53:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
Message-ID: <Y0tkBvcufgwSe/AT@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-6-jacopo@jmondi.org>
 <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
 <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com>
 <CAPY8ntCh4UFT5swHvwPj7xz8wPH3MJB-aJjEd9bCgXVubRyp5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCh4UFT5swHvwPj7xz8wPH3MJB-aJjEd9bCgXVubRyp5w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 07, 2022 at 03:26:55PM +0100, Dave Stevenson wrote:
> On Fri, 7 Oct 2022 at 15:01, Laurent Pinchart wrote:
> > On Thu, Oct 06, 2022 at 04:10:10PM +0100, Dave Stevenson wrote:
> > > On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> > > >
> > > > Add support for V4L2_CID_LINK_FREQ which currently reports a single
> > > > hard-coded frequency which depends on the fixed pixel clock.
> > > >
> > > > This will change in the next patches where the pixel rate will be
> > > > computed from the desired link_frequency.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > >
> > > Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
> > > divided by 4 lanes, and DDR.
> > >
> > > > ---
> > > >  drivers/media/i2c/ar0521.c | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > > index 21649aecf442..c5410b091654 100644
> > > > --- a/drivers/media/i2c/ar0521.c
> > > > +++ b/drivers/media/i2c/ar0521.c
> > > > @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
> > > >         "vaa",          /* Analog (2.7V) supply */
> > > >  };
> > > >
> > > > +static const s64 ar0521_link_frequencies[] = {
> > > > +       184000000,
> > > > +};
> > > > +
> > > >  struct ar0521_ctrls {
> > > >         struct v4l2_ctrl_handler handler;
> > > >         struct v4l2_ctrl *ana_gain;
> > > > @@ -104,6 +108,7 @@ struct ar0521_ctrls {
> > > >         };
> > > >         struct v4l2_ctrl *pixrate;
> > > >         struct v4l2_ctrl *exposure;
> > > > +       struct v4l2_ctrl *link_freq;
> > > >         struct v4l2_ctrl *test_pattern;
> > > >  };
> > > >
> > > > @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > > >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> > > >                                             65535, 1, 360);
> > > >
> > > > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > > > +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > > > +                                       0, ar0521_link_frequencies);
> > > > +
> > >
> > > Admittedly there is only one entry, but did you want to make it a read
> > > only control? With no case for it in s_ctrl, you'll get errors thrown
> > > from the control handler framework.
> >
> > I'd make it writable even if there's a single entry, so that userspace
> > won't need special logic. It will also prepare for support of multiple
> > entries in the future.
> 
> Do you really see a situation where userspace will be configuring link
> frequency instead of DT / ACPI?
> A quick search seems to imply that only 1 current driver supports a
> r/w link frequency - mt9v032. That would imply that having a
> controllable link frequency would require the special logic in
> userspace.

Looking at the mainline kernel only, the N9, N950 and Librem5 all
specify multiple link frequencies, and so does the sdm845-db845c
development board.

This indeed requires specific logic in userspace, and to be honest, I
haven't really thought about how it would be implemented. Sakari has
more experience than me here, he may be able to shed some light.

> I'm always very cautious about drivers that are linking PIXEL_RATE and
> LINK_FREQ - most of the sensors are tending to have 2 (or more) PLLs,
> and there is a FIFO between the image sensor (PIXEL_RATE) and the MIPI
> block (LINK_FREQ). imx290 is certainly wrong (pixel rate does not
> change with mode, but link freq does), and I'm fairly certain that
> ov7251 is as well (pixel rate is 48MPix/s whether at 240 or 319.2MHz
> link frequency). Patches coming soon for both.

That's a good point, different link frequencies may or may not result in
different pixel rates.

> > > >         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> > > >                                         V4L2_CID_TEST_PATTERN,
> > > >                                         ARRAY_SIZE(test_pattern_menu) - 1,

-- 
Regards,

Laurent Pinchart
