Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9788F4AC67B
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiBGQxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390258AbiBGQqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:46:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8F3C0401D9
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:46:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8088340;
        Mon,  7 Feb 2022 17:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644252398;
        bh=DpHgH6jy7p4CcAloC7ijzhYYfRrmUq6lRlX7JWjtoG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmDJTUbcBOAk2kl7kQOzZEgsDOHXkmlglB00VALVVF1puLaK6imhBzDHZTyJEgY79
         0zodKuCPsJJvGE6V0gFmoih9W4wWrbwXjSd9WNZrezJrUnE1hVBvQSFIoJ4+1KfLBx
         sp5bAYxEwpqqcNMrYWNW4vHiZ4Ntt1qNbw8Pwxh0=
Date:   Mon, 7 Feb 2022 18:46:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 21/21] media: ov5640: Adjust format to bpp in s_fmt
Message-ID: <YgFM7KPTTrMLqZzO@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144556.129122-1-jacopo@jmondi.org>
 <20220131144556.129122-2-jacopo@jmondi.org>
 <YfsN1oL2wq5rYk+H@pendragon.ideasonboard.com>
 <20220207160707.5yzxfzbvv6nnowjy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207160707.5yzxfzbvv6nnowjy@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 07, 2022 at 05:07:07PM +0100, Jacopo Mondi wrote:
> On Thu, Feb 03, 2022 at 01:03:50AM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 31, 2022 at 03:45:56PM +0100, Jacopo Mondi wrote:
> > > The ov5640 driver supports different sizes for different mbus_codes.
> > > In particular:
> > >
> > > - 8bpp modes: high resolution sizes (>= 1280x720)
> > > - 16bpp modes: all sizes
> > > - 24bpp modes: low resolutions sizes (< 1280x720)
> > >
> > > Adjust the image sizes according to the above constraints.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 2978dabd1d54..49d0df80f71a 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -2529,6 +2529,7 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> > >  				   enum ov5640_frame_rate fr,
> > >  				   const struct ov5640_mode_info **new_mode)
> > >  {
> > > +	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
> > >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > >  	const struct ov5640_mode_info *mode;
> > >  	int i;
> > > @@ -2536,6 +2537,17 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> > >  	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
> > >  	if (!mode)
> > >  		return -EINVAL;
> > > +
> > > +	/*
> > > +	 * Adjust mode according to bpp:
> > > +	 * - 8bpp modes work for resolution >= 1280x720
> > > +	 * - 24bpp modes work resolution < 1280x720
> > > +	 */
> > > +	if (bpp == 8 && mode->crop.width < 1280)
> > > +		mode = &ov5640_mode_data[OV5640_MODE_720P_1280_720];
> > > +	else if (bpp == 24 && mode->crop.width > 1024)
> > > +		mode = &ov5640_mode_data[OV5640_MODE_XGA_1024_768];
> >
> > This is in line with patch 20/21, so
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > but I'm still not sure about the limitation for 8bpp.
> 
> Me neither. I had on my todo to test 8bpp with different pixel clock
> rates to see if it makes any difference. If only 1080p and full res
> were working I would have guessed it was because those are the only
> modes obtained by cropping the full pixel array without any
> subsampling being applied, but as 1280x720 works too....
> 
> One thinking I had was that the pixel_rate assigned to each mode where
> too slow for an 8bpp mode and that the resulting CSI-2 frequencies
> were consequentially below the minimum required ones, but I would have
> to re-calculate to see if that's the case.

That's something I considered too.

> Anyway, as said in the cover letter, I have now assigned a pixel_rate
> to each mode, regardless of the image format. As the same 'mode' in
> 24bpp or 8bpp requires different pixel rates, I think this first
> approach is good, but to fully exploit all the modes the pixel_rate
> should be controlled by userspace too, in function of the bpp (and the
> number of data lanes). My understanding is that it should happen not
> by changing PIXEL_RATE but rather LINK_FREQ. But with the latter being
> a menu control (something I still don't get the reason for) there's a
> limited number of combination that could be supported there...

That's correct, PIXEL_RATE is read-only while LINK_FREQ is read-write.

LINK_FREQ is a menu control because link frequencies need to be selected
with the whole system taken into consideration, to avoid EMC issues. The
possible link frequencies are thus expected to be specified in DT. I'm
not a big fan of this. While the concept make sense, it's confusing and
under-documented. We're especially missing documentation for sensor
driver developers.

> We'll see, I would have been happy enough if 16bpp gets actually
> fixed when it comes to frame durations, with 8bpp/24bpp being usable.
> 
> We can improve on top of an hopefully now more solid base.

Sure.

> > > +
> > >  	fmt->width = mode->crop.width;
> > >  	fmt->height = mode->crop.height;
> > >

-- 
Regards,

Laurent Pinchart
