Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D237474A7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjGDPAd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjGDPAb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:00:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7411C10CC
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:00:30 -0700 (PDT)
Received: from ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0C276DF;
        Tue,  4 Jul 2023 16:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688482783;
        bh=NoJTu9R5jPIKbXQU9qt8MHizRqOwF03KO7+HBCOUbqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DC9ixET82uX4OR+r4f4nyeuRy7yS9NFlP/LbBnp5+qkIvSobo9XzYc95uWCiXkhSP
         djvZ40TfiTWSyYpqdIB5KgCBJ9HkUTvs30z97HKWifgSHZCUbODxMj/SeOsw9Qdco3
         Rzb6PjgAXrwInLWQz9jhR/NPue37lzDLPstnyxew=
Date:   Tue, 4 Jul 2023 17:00:24 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <7iefffm7r5pn4dwjgyxq5cz265wsvgawtnj55i3kq3gkvzb6co@vfcmdidj646w>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
 <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ni2n6flcaxap64dff7hdwmhzfdbbyklxx376xx44wforssu3jm@4yv4xj4caohr>
 <ZKQs8WWKfIGx9znI@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZKQs8WWKfIGx9znI@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tommaso

On Tue, Jul 04, 2023 at 04:30:09PM +0200, Tommaso Merciai wrote:
> Hi Jacopo,
>
> On Tue, Jul 04, 2023 at 04:05:44PM +0200, Jacopo Mondi wrote:
> > Hi Tommaso
> >
> > On Tue, Jul 04, 2023 at 03:51:43PM +0200, Tommaso Merciai wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Jul 03, 2023 at 10:29:10PM +0200, Jacopo Mondi wrote:
> > > > Document the suggested way to exposure controls for exposure and gain
> > > > for camera sensor drivers.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > ---
> > > >  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index ee4a7fe5f72a..dfe8f35aecea 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > >  a flip can potentially change the output buffer content layout. Flips should
> > > >  also be taken into account when enumerating and handling media bus formats
> > > >  on the camera sensor source pads.
> > > > +
> > > > +Exposure and Gain Control
> > > > +-------------------------
> > > > +
> > > > +Camera sensor drivers that allows applications to control the image exposure
> > > > +and gain should do so by exposing dedicated controls to applications.
> > > > +
> > > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > > +The control definition does not specify a unit to allow maximum flexibility
> > > > +for multiple device types, but when used for camera sensor driver it should be
> > >
> > > > +expressed in unit of lines whenever possible.
> > >
> > > Same comment here.
> >
> > I might have missed what other comment you are referring to :)
>
> Sorry, I'm referring to your comment:
>
> "I think this might be useful yes. A few paragraph above the frame
> duration calculation formula is expressed as well, so I guess adding
> one for this is helpful too"
>

Ah ok, see v2 for that

> >
> > >
> > > Can you add formula/references about this point I think you are referring on "tline" units (maybe I'm completely wrong :) ),
> >
> > Is "tline" the line duration ? If that's the case then no, I am
> > referring to the number of lines, not their duration.
>
> Ok. Thanks, need to find some docs regarding this units :'(
> For this I think having some good reference/formula here would help users to find the
> corrispective value into the sensor datasheet.
>

I'm still not sure if you're talking about the formula to convert from
a time duration to the number of lines as Dave suggested (which I
added in v2) or a formula to convert from the number of lines provided
by userspace as the value of the V4L2_CID_EXPOSURE control to the
actual value to be set in the sensor's registers that control the
exposure time. If you're referring to the latter I'm afraid this is
device specific and putting any example here might actually be
mis-leading. As far as I can tell the sensors I had dealt with,
internally represents the exposure control in number of lines or
fractions of lines. Doing the conversion in the driver is usually
trivial (I'm sure there are devices where this is less trivial of
course).

Did I get your question right or am I still missing something ?

> I just proved this to you :)
>
> Regards,
> Tommaso
>
> >
> > > but to be honest checking also the some sensors datasheet I don't find to much infos about this units.
> > > Would be really helpfull to add some details on this point.
> > >
> > > > +
> > > > +Camera sensor driver should try whenever possible to distinguish between the
> > > > +analogue and digital gain control functions. Analogue gain is a multiplier
> > > > +factor applied to all color channels on the pixel array before they get
> > > > +converted in the digital domain. It should be be made controllable by
> > > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > > +specific gain code. Digital gain control is optional and should be exposed to
> > > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > > > --
> > >
> > > This part looks good to me.
> > >
> > > Thanks,
> > > Tommaso
> > >
> > > > 2.40.1
> > > >
