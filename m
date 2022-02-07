Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1FC4AC473
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbiBGPyy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377538AbiBGPsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 10:48:02 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788FAC0401CF
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 07:48:01 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D3BD1BF208;
        Mon,  7 Feb 2022 15:47:55 +0000 (UTC)
Date:   Mon, 7 Feb 2022 16:49:03 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/21] media: ov5640: Limit format to FPS in DVP mode only
Message-ID: <20220207154903.bm5qxvtf7srlmcut@uno.localdomain>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-4-jacopo@jmondi.org>
 <YfsH1ME0ThYXkJGY@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfsH1ME0ThYXkJGY@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 03, 2022 at 12:38:12AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Jan 31, 2022 at 03:44:43PM +0100, Jacopo Mondi wrote:
> > In MIPI mode the frame rate control is performed by adjusting the
> > frame blankings and the s_frame_interval function is not used anymore.
> >
> > Only check for the per-mode supported frame rate in DVP mode and do not
> > restrict MIPI mode.
>
> This certainly aligns better with how the sensor driver is supposed to
> operate. I however wonder why you don't do so in DVP mode too. Is it for
> backward-compatibility ? If so a comment would be useful.

yes, and mostly because DVP mode seems to work well and I didn't want
to change the way subdev is operated for DVP users.

I would be more than happy to remove frame_interval completely.

>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/media/i2c/ov5640.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index ae22300b9655..ec46e16223af 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -1845,8 +1845,13 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
> >  	     (mode->crop.width != width || mode->crop.height != height)))
> >  		return NULL;
> >
> > -	/* Check to see if the current mode exceeds the max frame rate */
> > -	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
> > +	/*
> > +	 * Check to see if the current mode exceeds the max frame rate.
> > +	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
> > +	 * mode controls framerate by setting blankings.
> > +	 */
> > +	if (!ov5640_is_mipi(sensor) &&
> > +	    ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
> >  		return NULL;
> >
> >  	return mode;
>
> --
> Regards,
>
> Laurent Pinchart
