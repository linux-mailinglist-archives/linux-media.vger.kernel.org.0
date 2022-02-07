Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E226B4AC514
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbiBGQHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:07:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443015AbiBGQGK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:06:10 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B34DC03FECE
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:06:05 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 3771B20010;
        Mon,  7 Feb 2022 16:05:59 +0000 (UTC)
Date:   Mon, 7 Feb 2022 17:07:07 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 21/21] media: ov5640: Adjust format to bpp in s_fmt
Message-ID: <20220207160707.5yzxfzbvv6nnowjy@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144556.129122-1-jacopo@jmondi.org>
 <20220131144556.129122-2-jacopo@jmondi.org>
 <YfsN1oL2wq5rYk+H@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfsN1oL2wq5rYk+H@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, Feb 03, 2022 at 01:03:50AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jan 31, 2022 at 03:45:56PM +0100, Jacopo Mondi wrote:
> > The ov5640 driver supports different sizes for different mbus_codes.
> > In particular:
> >
> > - 8bpp modes: high resolution sizes (>= 1280x720)
> > - 16bpp modes: all sizes
> > - 24bpp modes: low resolutions sizes (< 1280x720)
> >
> > Adjust the image sizes according to the above constraints.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 2978dabd1d54..49d0df80f71a 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -2529,6 +2529,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >  				   enum ov5640_frame_rate fr,
> >  				   const struct ov5640_mode_info **new_mode)
> >  {
> > +	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
> >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> >  	const struct ov5640_mode_info *mode;
> >  	int i;
> > @@ -2536,6 +2537,17 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >  	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
> >  	if (!mode)
> >  		return -EINVAL;
> > +
> > +	/*
> > +	 * Adjust mode according to bpp:
> > +	 * - 8bpp modes work for resolution >= 1280x720
> > +	 * - 24bpp modes work resolution < 1280x720
> > +	 */
> > +	if (bpp == 8 && mode->crop.width < 1280)
> > +		mode = &ov5640_mode_data[OV5640_MODE_720P_1280_720];
> > +	else if (bpp == 24 && mode->crop.width > 1024)
> > +		mode = &ov5640_mode_data[OV5640_MODE_XGA_1024_768];
>
> This is in line with patch 20/21, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> but I'm still not sure about the limitation for 8bpp.
>

Me neither. I had on my todo to test 8bpp with different pixel clock
rates to see if it makes any difference. If only 1080p and full res
were working I would have guessed it was because those are the only
modes obtained by cropping the full pixel array without any
subsampling being applied, but as 1280x720 works too....

One thinking I had was that the pixel_rate assigned to each mode where
too slow for an 8bpp mode and that the resulting CSI-2 frequencies
were consequentially below the minimum required ones, but I would have
to re-calculate to see if that's the case.

Anyway, as said in the cover letter, I have now assigned a pixel_rate
to each mode, regardless of the image format. As the same 'mode' in
24bpp or 8bpp requires different pixel rates, I think this first
approach is good, but to fully exploit all the modes the pixel_rate
should be controlled by userspace too, in function of the bpp (and the
number of data lanes). My understanding is that it should happen not
by changing PIXEL_RATE but rather LINK_FREQ. But with the latter being
a menu control (something I still don't get the reason for) there's a
limited number of combination that could be supported there...

We'll see, I would have been happy enough if 16bpp gets actually
fixed when it comes to frame durations, with 8bpp/24bpp being usable.

We can improve on top of an hopefully now more solid base.

> > +
> >  	fmt->width = mode->crop.width;
> >  	fmt->height = mode->crop.height;
> >
>
> --
> Regards,
>
> Laurent Pinchart
