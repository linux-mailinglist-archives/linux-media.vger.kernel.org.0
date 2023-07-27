Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51B765013
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjG0Jnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbjG0JnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:43:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D383581
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:42:50 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-250.net.vodafone.it [5.91.19.250])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 455AD4A9;
        Thu, 27 Jul 2023 11:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690450909;
        bh=J761nHIdwzWmcAbqa5O2oKZduxnn8nYdk0EnKi7wZ/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rAdM8KChVAFKKMqBhRiPONUa/cnFWM1IaUw5BAX5NQnjco5CR6Wl5W/3e0t2mGYFN
         W0MPzUzrsRcoZrut31SCuodYugIyUWXsTZnfy3+/wIhhLBmo2BhBxFfEzkNLRZpGmZ
         LM/43JpsrPxVXHRtM2OvCAqD7k/zuMrOQ+bx/USs=
Date:   Thu, 27 Jul 2023 11:42:45 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera
 sensor
Message-ID: <wdhkxxokan2gk4m2b3gwro7d6j6ie4zhshfman456dhvjqokxm@67jcmm3bewgb>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
 <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
 <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Mon, Jul 17, 2023 at 10:24:21AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Jul 10, 2023 at 03:22:40PM +0200, Jacopo Mondi wrote:
> > Document the suggested way to exposure controls for exposure and gain
> > for camera sensor drivers.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index cd915ca119ea..67fe77b1edb9 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> >  a flip can potentially change the output buffer content layout. Flips should
> >  also be taken into account when enumerating and handling media bus formats
> >  on the camera sensor source pads.
> > +
> > +Exposure and Gain Control
> > +-------------------------
> > +
> > +Camera sensor drivers that allow applications to control the image exposure
> > +and gain should do so by exposing dedicated controls to applications.
> > +
> > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > +The control definition does not specify a unit to allow maximum flexibility
> > +for multiple device types, but when used for camera sensor drivers it should be
> > +expressed in unit of lines whenever possible.
>
> This part of the documentation applies to both raw and SoC cameras.
>
> Should the exposure unit be something more user-friendly for SoC cameras?

SoC cameras == YUV/RGB sensors ?

Are you thinking about using the actual exposure time for YUV/RGB
sensors ?

>
> We have two exposure controls now, V4L2_CID_EXPOSURE and
> V4L2_CID_EXPOSURE_ABSOLUTE. The former doesn't specity a unit whereas the

Apparently only 2 drivers in mainline register V4L2_CID_EXPOSURE_ABSOLUTE

> latter suggests the unit of 100 µs.
>
> As exposure is specific to cameras, I think at least a part of this should
> make it to the controls documentation. The UVC, for instance, uses
> EXPOSURE_ABSOLUTE.
>
> Could we document V4L2_CID_EXPOSURE is in lines (if possible)?

I would indeed be happy with something like "The suggested unit for
the control is lines"

>
> > +
> > +To convert lines into units of time, the total line length (visible and
> > +not visible pixels) has to be divided by the pixel rate::
> > +
> > +        line duration = total line length / pixel rate
> > +                      = (image width + horizontal blanking) / pixel rate
> > +
> > +Camera sensor driver should try whenever possible to distinguish between the
> > +analogue and digital gain control functions. Analogue gain is a multiplication
> > +factor applied to all color channels on the pixel array before they get
> > +converted into the digital domain. It should be made controllable by
>
> The analogue gain may not be linear. This depends on the sensor. I'd thus
> drop the wording related to multiplication factor.
>

I might have missed why the gain being linear or not has implications
on the fact it acts as a multiplication factor for the color
channels...

> > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > +specific gain code. Digital gain control is optional and should be exposed to
> > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > +discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
> > +analogue vs digital gain.
>
> --
> Kind regards,
>
> Sakari Ailus
