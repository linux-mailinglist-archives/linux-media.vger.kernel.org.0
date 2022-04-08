Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F584F9A21
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 18:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbiDHQK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 12:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbiDHQKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 12:10:55 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036803568C3
        for <linux-media@vger.kernel.org>; Fri,  8 Apr 2022 09:08:49 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5E5711C000A;
        Fri,  8 Apr 2022 16:08:43 +0000 (UTC)
Date:   Fri, 8 Apr 2022 18:08:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 20/27] media: ov5640: Limit frame_interval to DVP mode
 only
Message-ID: <20220408160842.dzmexynrwgcn4o2q@uno.localdomain>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <20220224094313.233347-21-jacopo@jmondi.org>
 <586cf4f0-0579-4b7b-df3b-fd0c6d117e8e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <586cf4f0-0579-4b7b-df3b-fd0c6d117e8e@foss.st.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,
   thanks very much for testing

On Thu, Apr 07, 2022 at 06:25:25PM +0200, Hugues FRUCHET - FOSS wrote:
> Hi Jacopo,
>
> On 2/24/22 10:43 AM, Jacopo Mondi wrote:
> > In MIPI mode the frame rate control is performed by adjusting the
> > frame blankings and the s_frame_interval function is not used anymore.
> >
> > Only check for the per-mode supported frame rate in DVP mode and do not
> > restrict MIPI mode.
> >
> > Disallow enum/s/g_frame_interval if the chip is used in MIPI mode.
>
> This is breaking userspace which set framerate through media-ctl:
> media-ctl -d /dev/media0 --set-v4l2 "'ov5640
> 1-003c':0[fmt:JPEG_1X8/640x480@1/15 field:none]"
> because of unsupported framerate, all the rest is ignored (resolution and
> format).
>
> I can understand use of vblank to tune framerate but I would expect that
> compatibility with frame interval setting is kept, it's far more simple for
> an application to set the frame interval versus finding the right vblank to
> apply (not straightforward...)

I understand it might seem easier to state what FPS you want instead
of going through calculations, but I think the frame_interval ioctls
are actually mis-leading and should be discouraged for sensor drivers
(and consequentially for userspace).

frame_interval encourages driver developers to fix on a usually limited
set of supported modes, which limits the actual sensor capabilities to
a few pre-defined modes.

Drivers that support frame rate handling through frame_interval
usually do not expose configurable blankings, which has a direct
impact on the maximum achievable exposure time and should be in
control of userspace.

That said, I think it's maintainer's call to decide when moving to a
different API is considered a user-space breakage or not :)

>
> On my side I have reverted this patch and added support of both, see patch
> proposal in reply to [PATCH v5 16/27] media: ov5640: Add VBLANK control.
>
>
> >
> > While at it re-indent one function which whose parameters were wrongly
> > aligned.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/i2c/ov5640.c | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index baf368a39e0f..6b955163eb4d 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -2005,9 +2005,14 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
> >   	     (mode->width != width || mode->height != height)))
> >   		return NULL;
> > -	/* Check to see if the current mode exceeds the max frame rate */
> > +	/*
> > +	 * Check to see if the current mode exceeds the max frame rate.
> > +	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
> > +	 * mode controls framerate by setting blankings.
> > +	 */
> >   	timings = &mode->dvp_timings;
> > -	if (ov5640_framerates[fr] > ov5640_framerates[timings->max_fps])
> > +	if (!ov5640_is_csi2(sensor) &&
> > +	    ov5640_framerates[fr] > ov5640_framerates[timings->max_fps])
> >   		return NULL;
> >   	return mode;
> > @@ -3439,6 +3444,9 @@ static int ov5640_enum_frame_interval(
> >   	struct v4l2_fract tpf;
> >   	int ret;
> > +	if (ov5640_is_csi2(sensor))
> > +		return -EINVAL;
> > +
> >   	if (fie->pad != 0)
> >   		return -EINVAL;
> >   	if (fie->index >= OV5640_NUM_FRAMERATES)
> > @@ -3461,6 +3469,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
> >   {
> >   	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > +	if (ov5640_is_csi2(sensor))
> > +		return -EINVAL;
> > +
> >   	mutex_lock(&sensor->lock);
> >   	fi->interval = sensor->frame_interval;
> >   	mutex_unlock(&sensor->lock);
> > @@ -3475,6 +3486,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >   	const struct ov5640_mode_info *mode;
> >   	int frame_rate, ret = 0;
> > +	if (ov5640_is_csi2(sensor))
> > +		return -EINVAL;
> > +
> >   	if (fi->pad != 0)
> >   		return -EINVAL;
> >
