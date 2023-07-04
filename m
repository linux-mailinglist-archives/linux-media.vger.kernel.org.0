Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13680746EA2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 12:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGDK21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 06:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjGDK20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 06:28:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412EAE59
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 03:28:05 -0700 (PDT)
Received: from ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D7B8D4A;
        Tue,  4 Jul 2023 12:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688466438;
        bh=jaKMe/dFAwBwBP5dxqsIa4pzkD3PyVQDumhQcN7jHUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RHff87+Tl0+UNjw7B/yzRFBh/EsSDhZj3HcIyVNXOD3Sx2q5plPUa+e8OLwN7v/fv
         IAanAVKD//sNZEfQGIrKl9jVDXNE4ugmJfoAp4W2BQA0n4KfJbHuC34CYJ2ePb025T
         YvEnr67iDJwB5zT3AlpFaJ1PB2D+9h1zLj5/xsDo=
Date:   Tue, 4 Jul 2023 12:27:59 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <l6tu6ip4ta34h73e53pybyd74hywf7inwxumulp74kvoabqkiy@y7dquijsihb7>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
 <CAPY8ntCZs9N368-3R8HP0brG6FWXb0erSGt1pjTDEQkUFE4PgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCZs9N368-3R8HP0brG6FWXb0erSGt1pjTDEQkUFE4PgA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, Jul 04, 2023 at 11:05:42AM +0100, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Document the suggested way to exposure controls for exposure and gain
> > for camera sensor drivers.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > index ee4a7fe5f72a..dfe8f35aecea 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> >  a flip can potentially change the output buffer content layout. Flips should
> >  also be taken into account when enumerating and handling media bus formats
> >  on the camera sensor source pads.
> > +
> > +Exposure and Gain Control
> > +-------------------------
> > +
> > +Camera sensor drivers that allows applications to control the image exposure
>
> s/allows/allow
>
> > +and gain should do so by exposing dedicated controls to applications.
> > +
> > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > +The control definition does not specify a unit to allow maximum flexibility
> > +for multiple device types, but when used for camera sensor driver it should be
>
> s/driver/drivers
>
> > +expressed in unit of lines whenever possible.
>
> s/unit/units
>
> Possibly clarify that lines can be converted into units of time by
> using V4L2_CID_PIXEL_RATE and (image width + V4L2_CID_HBLANK).
>

I think this might be useful yes. A few paragraph above the frame
duration calculation formula is expressed as well, so I guess adding
one for this is helpful too

> > +
> > +Camera sensor driver should try whenever possible to distinguish between the
> > +analogue and digital gain control functions. Analogue gain is a multiplier
> > +factor applied to all color channels on the pixel array before they get
> > +converted in the digital domain. It should be be made controllable by
> > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > +specific gain code. Digital gain control is optional and should be exposed to
> > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
>
> Something appears to be truncated here.

Clearly a bad rebase. What I meant (I lost the original version) was

Camera sensor drivers are discouraged from using ``V4L2_CID_GAIN``
which doesn't allow to control the analogue and digital gain
components individually.

How does this sound ?

>
>   Dave
>
> > --
> > 2.40.1
> >
