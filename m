Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBC35F7958
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJGOBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiJGOBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:01:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98F146863
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:01:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B638BBE;
        Fri,  7 Oct 2022 16:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665151272;
        bh=V8tu43TrK4y2kM5k5ak3q8lvrLLNm62Uj02eWzwy31E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GbL9dQc0ysl11gGXyiRnbrs+YP8rh8R1lI4hGL9vB3fRkSUB/rlzGQvUrRzru5pzA
         j6nAotYKGuWmYrOgWJOezDfI6it1nSlaQTE02BAR71j3wFDeh9Sqa50kf7Cuo3EmoQ
         teHD7AGtXKoNI5aTkTEfiVhoERGFT5SYxOOfVVqE=
Date:   Fri, 7 Oct 2022 17:01:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
Message-ID: <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com>
References: <20221005190613.394277-1-jacopo@jmondi.org>
 <20221005190613.394277-6-jacopo@jmondi.org>
 <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 06, 2022 at 04:10:10PM +0100, Dave Stevenson wrote:
> On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> >
> > Add support for V4L2_CID_LINK_FREQ which currently reports a single
> > hard-coded frequency which depends on the fixed pixel clock.
> >
> > This will change in the next patches where the pixel rate will be
> > computed from the desired link_frequency.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
> divided by 4 lanes, and DDR.
> 
> > ---
> >  drivers/media/i2c/ar0521.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 21649aecf442..c5410b091654 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
> >         "vaa",          /* Analog (2.7V) supply */
> >  };
> >
> > +static const s64 ar0521_link_frequencies[] = {
> > +       184000000,
> > +};
> > +
> >  struct ar0521_ctrls {
> >         struct v4l2_ctrl_handler handler;
> >         struct v4l2_ctrl *ana_gain;
> > @@ -104,6 +108,7 @@ struct ar0521_ctrls {
> >         };
> >         struct v4l2_ctrl *pixrate;
> >         struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *link_freq;
> >         struct v4l2_ctrl *test_pattern;
> >  };
> >
> > @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> >                                             65535, 1, 360);
> >
> > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > +                                       0, ar0521_link_frequencies);
> > +
> 
> Admittedly there is only one entry, but did you want to make it a read
> only control? With no case for it in s_ctrl, you'll get errors thrown
> from the control handler framework.

I'd make it writable even if there's a single entry, so that userspace
won't need special logic. It will also prepare for support of multiple
entries in the future.

> >         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> >                                         V4L2_CID_TEST_PATTERN,
> >                                         ARRAY_SIZE(test_pattern_menu) - 1,

-- 
Regards,

Laurent Pinchart
