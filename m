Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B01474738D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjGDOFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjGDOFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:05:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CDFF2
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:05:49 -0700 (PDT)
Received: from ideasonboard.com (85-160-42-71.reb.o2.cz [85.160.42.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04E496DF;
        Tue,  4 Jul 2023 16:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688479504;
        bh=cIjhcDJVdDdinlPukCbEMmuKkfIwPWr6zU4WI0Vmr4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4pjJ70wKkvHeb0PlV6nw+Qyv9p1WgudkgtQkh0oW/eTmMAXCuXf1vTBTtsHynLyp
         hO1PEXSiq/ZKAEkfhPEBHySrv5XHmK/Tb4M8fvTbgp3QB/jtTzhP5jzgS87jv/9y+d
         Gtzo3rsslFBz6W4Y4B7T7LotwukAG4sutdnPAvCI=
Date:   Tue, 4 Jul 2023 16:05:44 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <ni2n6flcaxap64dff7hdwmhzfdbbyklxx376xx44wforssu3jm@4yv4xj4caohr>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
 <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
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

On Tue, Jul 04, 2023 at 03:51:43PM +0200, Tommaso Merciai wrote:
> Hi Jacopo,
>
> On Mon, Jul 03, 2023 at 10:29:10PM +0200, Jacopo Mondi wrote:
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
> > +and gain should do so by exposing dedicated controls to applications.
> > +
> > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > +The control definition does not specify a unit to allow maximum flexibility
> > +for multiple device types, but when used for camera sensor driver it should be
>
> > +expressed in unit of lines whenever possible.
>
> Same comment here.

I might have missed what other comment you are referring to :)

>
> Can you add formula/references about this point I think you are referring on "tline" units (maybe I'm completely wrong :) ),

Is "tline" the line duration ? If that's the case then no, I am
referring to the number of lines, not their duration.

> but to be honest checking also the some sensors datasheet I don't find to much infos about this units.
> Would be really helpfull to add some details on this point.
>
> > +
> > +Camera sensor driver should try whenever possible to distinguish between the
> > +analogue and digital gain control functions. Analogue gain is a multiplier
> > +factor applied to all color channels on the pixel array before they get
> > +converted in the digital domain. It should be be made controllable by
> > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > +specific gain code. Digital gain control is optional and should be exposed to
> > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > --
>
> This part looks good to me.
>
> Thanks,
> Tommaso
>
> > 2.40.1
> >
