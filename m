Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4DD266DB12
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbjAQKaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236313AbjAQK32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:29:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4057F279A7
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:28:44 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9588C10C;
        Tue, 17 Jan 2023 11:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673951322;
        bh=tIcIKfwObdteRGhJzWx6WzCE8Nvh8HJ88Cy4X1o2LNo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k6f6OyFl0gSWB2NvXJSO7CsHfiOhj/Jlp3eThUD5lxcwm7uZ2X+YYOCJAcUW/bKKs
         jrjGgqYYuD61QLsAc02za46DbouVHL3eXNB2fNw5y1Cjf5KglnjFRN2gP9X4bVVbA0
         DMnDLmXEApQ3ljLBRMoOW7xbcEsNwjXWN+nKWOHE=
Date:   Tue, 17 Jan 2023 11:28:39 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: imx258: Register H/V flip controls
Message-ID: <20230117102839.yg4jl6iuslut62ve@uno.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230117100603.51631-3-jacopo.mondi@ideasonboard.com>
 <Y8Z1qVTZo12tfVmi@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8Z1qVTZo12tfVmi@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Jan 17, 2023 at 10:17:13AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patch.
>
> On Tue, Jan 17, 2023 at 11:06:02AM +0100, Jacopo Mondi wrote:
> > Register controls for V4L2_CID_HFLIP and V4L2_CID_VFLIP.
> >
> > The controls are registered as read-only and enabled by default, as the
> > driver embeds a 180 degrees rotation in its programming sequences and
> > only supports that mode of operations.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx258.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index 3b560865b657..2e0a4ea76589 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -1151,6 +1151,7 @@ static int imx258_init_controls(struct imx258 *imx258)
> >  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
> >  	struct v4l2_fwnode_device_properties props;
> >  	struct v4l2_ctrl_handler *ctrl_hdlr;
> > +	struct v4l2_ctrl *vflip, *hflip;
> >  	s64 vblank_def;
> >  	s64 vblank_min;
> >  	s64 pixel_rate_min;
> > @@ -1158,7 +1159,7 @@ static int imx258_init_controls(struct imx258 *imx258)
> >  	int ret;
> >
> >  	ctrl_hdlr = &imx258->ctrl_handler;
> > -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -1174,6 +1175,17 @@ static int imx258_init_controls(struct imx258 *imx258)
> >  	if (imx258->link_freq)
> >  		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > +	/* The driver only supports one bayer order and flips by default. */
> > +	hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > +				  V4L2_CID_HFLIP, 1, 1, 1, 1);
> > +	if (hflip)
> > +		hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> > +				  V4L2_CID_VFLIP, 1, 1, 1, 1);
>
> This defaults the controls to 1, which suggests the image is upside down.
>
> The rotation property has been used to tell the driver the sensor is upside

Well the rotation property should tell userspace how the camera is
mounted, not to the driver how to compensate it ? There are several
reasons not to automatically compensate in the driver, mostly the fact
that the desired rotation to have the images in the "right"
orientation might require a transpose (as in example for 90 degrees or
270 degrees mounting rotations) which sensors cannot actually do.

I would rather inform userspace of the mounting rotation and the
sensor capabilities and have them decide how to compensate it.

> down, and this has also had the effect of reversing flip contron values so
> if they're disabled, the image is upright.

Ok, but why should the driver only accept a mounting rotation of 180
degrees ? If your sensor is mounted on a mobile device (as the
PinephonPro where this sensor is used) the phyisical mounting rotation
is actually 270 degrees.

Userspace will see that flips are not writable, the rotation to
compensate is 270 degrees, and will handle that as it like the most.

> See e.g. the CCS driver.
>
> I'd do the same here.
>
> > +	if (vflip)
> > +		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
> >  	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[1]);
> >  	/* By default, PIXEL_RATE is read only */
>
> --
> Kind regards,
>
> Sakari Ailus
