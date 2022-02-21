Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A284BE9CD
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358193AbiBUMnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 07:43:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358150AbiBUMnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 07:43:04 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F378DE88
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 04:42:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E06561C0004;
        Mon, 21 Feb 2022 12:42:32 +0000 (UTC)
Date:   Mon, 21 Feb 2022 13:42:30 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 22/23] media: ov5640: Restrict sizes to mbus code
Message-ID: <20220221124230.zqxzlptmpmeq46j7@uno.localdomain>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210111044.152904-3-jacopo@jmondi.org>
 <YhI/E72moUnW66Mp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YhI/E72moUnW66Mp@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 20, 2022 at 03:16:03PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Feb 10, 2022 at 12:10:43PM +0100, Jacopo Mondi wrote:
> > The ov5640 driver supports different sizes for different mbus_codes.
> > In particular:
> >
> > - 8bpp modes: high resolution sizes (>= 1280x720)
> > - 16bpp modes: all sizes
> > - 24bpp modes: low resolutions sizes (< 1280x720)
> >
> > Restrict the frame sizes enumerations to the above constraints.
> >
> > While at it, make sure the fse->mbus_code parameter is valid, and return
> > -EINVAL if it's not.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5640.c | 20 +++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index f894570ac53c..81bf547a923e 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -3315,14 +3315,28 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
> >  				  struct v4l2_subdev_state *sd_state,
> >  				  struct v4l2_subdev_frame_size_enum *fse)
> >  {
> > +	u32 bpp = ov5640_code_to_bpp(fse->code);
> > +	unsigned int index = fse->index;
> > +
> >  	if (fse->pad != 0)
> >  		return -EINVAL;
> > -	if (fse->index >= OV5640_NUM_MODES)
> > +	if (!bpp)
> > +		return -EINVAL;
> > +
> > +	/* Only low-resolution modes are supported for 24bpp modes. */
>
> s/24bpp modes/24bpp formats/
>
>
> Do you think this is a limitation of the sensor, or an issue in the
> driver ? In the latter case, I'd write
>
> 	/* FIXME: High resolution modes don't work in 24bpp formats. */

I think it's expected. From register 0x4300 documentation:

YUV444/RGB888 (not available for full resolution)

So I would expect modes obtained by croppin the full pixel array do
not support RGB888. 1280x720 is said to be obtained by sub-sampling
(the ov5640 applies sub-sampling automatically) so it should be
possible to have it in 24bpp. Maybe it needs an higher pixel clock,
something that will be possible once LINK_FREQ is made adjustable

>
> > +	if (bpp == 24 && index >= OV5640_MODE_720P_1280_720)
> > +		return -EINVAL;
> > +
> > +	/* Only high-resolutions modes are supported for 8bpp formats. */
>
> And here
>
> 	/* FIXME: Low resolution modes don't work in 8bpp formats. */

This one puzzles me as well. The only explanation I have is again that
these modes need a -slower- pixel rate to comply with the CSI-2 link
frequency requirements. I can add a todo indeed.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +	if (bpp == 8)
> > +		index += OV5640_MODE_720P_1280_720;
> > +
> > +	if (index >= OV5640_NUM_MODES)
> >  		return -EINVAL;
> >
> > -	fse->min_width = ov5640_mode_data[fse->index].crop.width;
> > +	fse->min_width = ov5640_mode_data[index].crop.width;
> >  	fse->max_width = fse->min_width;
> > -	fse->min_height = ov5640_mode_data[fse->index].crop.height;
> > +	fse->min_height = ov5640_mode_data[index].crop.height;
> >  	fse->max_height = fse->min_height;
> >
> >  	return 0;
>
> --
> Regards,
>
> Laurent Pinchart
