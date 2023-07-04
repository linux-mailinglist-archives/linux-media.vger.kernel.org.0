Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7192F746F63
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjGDLGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGDLGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:06:48 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C684DA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:06:47 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-783eef15004so1315823241.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688468806; x=1691060806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxTvWFpWOZSzB+g+0OX4tP//75Ps4vwO/wMAA/Rfy3A=;
        b=EbL+lb2R/eU/R+/aqnMmO7x22pulCKgyMRA01ri6X/AtP0bU09M3noF+LzzCCd6036
         TzXDOhkMAXF90efDi/Bms2M9SYmBWFscNGzGBvw9g0wPuH71PM0fFFe67YXZuK5qB/w7
         hvHAgI6j+bv0GLwcv3RR0fW/ytxhVDUpV1C6GmDHPwyqHWdOipuiY/Upxdlt76Y9pdIM
         hlHzyMFEXnBthYfUslDGqpn3B7SVhrnNn7AJ5zM4ZyNkg3/QHrGqI9gry3Xp7WtSyRx1
         1QYZdVfLhBSl5Qtr6ucRV+/o9Uby6lFjEWJNuChfthQeSJAEDmVkJcgZxXAM0O93xfcn
         jETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688468806; x=1691060806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxTvWFpWOZSzB+g+0OX4tP//75Ps4vwO/wMAA/Rfy3A=;
        b=fTGLhWW4OhN+9McckQ7WsNz1OMHu5/iPsU64CGfPqK9AGRWxe6xRuru4yq+Sm+R7JV
         auz6j+oFyM/DOXVC9Ij1T8vIuEqWlHIhZwpj6mVOzOpe1g3l1CH1WWT/u7UNj5Ny8k7J
         Buei8bSkPV+uBUC4CHQhtkuvG7ndZyvzi0qh2LYHqh7JcfgZjptdIw4bihop0nJW77Et
         AUknokjATQbWJ8eFIkA0tZww7LyTPk8fIboRGH0dCLvOzDlVSqqwgOIBp2eVDDAXazev
         NWly8m8HPsYaYdPzs/H4Jan71GRv66RGR1NlHtRkmWwe9jisSQEtSFdxndqR4/9UHvL2
         ocYg==
X-Gm-Message-State: ABy/qLaYJ0MHhb4UyGnaBZ+teGcAqlNnZqaC7TrHSGEr5ccQ0DUfUzNa
        M2VJKVzgG5ZpzRt+amFpEqkJJ2GCQj+6rj+gyST+DQ==
X-Google-Smtp-Source: APBJJlEPgWMzAPcomRefyVAOQQsTBKw9VnjEy4XUIs2D267+3Xv6OMLCndtdEFuzoxO/sJ1n/aiI48TKxYUuV75ZKBA=
X-Received: by 2002:a1f:5c0c:0:b0:47e:22fd:7b65 with SMTP id
 q12-20020a1f5c0c000000b0047e22fd7b65mr3312866vkb.14.1688468806483; Tue, 04
 Jul 2023 04:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com> <CAPY8ntCZs9N368-3R8HP0brG6FWXb0erSGt1pjTDEQkUFE4PgA@mail.gmail.com>
 <l6tu6ip4ta34h73e53pybyd74hywf7inwxumulp74kvoabqkiy@y7dquijsihb7>
In-Reply-To: <l6tu6ip4ta34h73e53pybyd74hywf7inwxumulp74kvoabqkiy@y7dquijsihb7>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 12:06:30 +0100
Message-ID: <CAPY8ntDO8S6RjiPZ3P2pw3QZ8TO191Os57yZH4ZWnQp4Fqxmcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jul 2023 at 11:28, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Dave
>
> On Tue, Jul 04, 2023 at 11:05:42AM +0100, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Document the suggested way to exposure controls for exposure and gain
> > > for camera sensor drivers.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index ee4a7fe5f72a..dfe8f35aecea 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > >  a flip can potentially change the output buffer content layout. Flips should
> > >  also be taken into account when enumerating and handling media bus formats
> > >  on the camera sensor source pads.
> > > +
> > > +Exposure and Gain Control
> > > +-------------------------
> > > +
> > > +Camera sensor drivers that allows applications to control the image exposure
> >
> > s/allows/allow
> >
> > > +and gain should do so by exposing dedicated controls to applications.
> > > +
> > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > +The control definition does not specify a unit to allow maximum flexibility
> > > +for multiple device types, but when used for camera sensor driver it should be
> >
> > s/driver/drivers
> >
> > > +expressed in unit of lines whenever possible.
> >
> > s/unit/units
> >
> > Possibly clarify that lines can be converted into units of time by
> > using V4L2_CID_PIXEL_RATE and (image width + V4L2_CID_HBLANK).
> >
>
> I think this might be useful yes. A few paragraph above the frame
> duration calculation formula is expressed as well, so I guess adding
> one for this is helpful too

Possibly just reference that paragraph then for computing the line period then.

> > > +
> > > +Camera sensor driver should try whenever possible to distinguish between the
> > > +analogue and digital gain control functions. Analogue gain is a multiplier
> > > +factor applied to all color channels on the pixel array before they get
> > > +converted in the digital domain. It should be be made controllable by
> > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > +specific gain code. Digital gain control is optional and should be exposed to
> > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> >
> > Something appears to be truncated here.
>
> Clearly a bad rebase. What I meant (I lost the original version) was
>
> Camera sensor drivers are discouraged from using ``V4L2_CID_GAIN``
> which doesn't allow to control the analogue and digital gain

as it doesn't allow differentiation of analogue vs digital gain

> components individually.
>
> How does this sound ?

Otherwise it sounds fine.

  Dave
