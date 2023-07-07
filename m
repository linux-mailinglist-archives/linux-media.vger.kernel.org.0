Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B79874B4FF
	for <lists+linux-media@lfdr.de>; Fri,  7 Jul 2023 18:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGGQNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jul 2023 12:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGGQNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jul 2023 12:13:46 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ACA1FD9
        for <linux-media@vger.kernel.org>; Fri,  7 Jul 2023 09:13:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992b2249d82so261789166b.1
        for <linux-media@vger.kernel.org>; Fri, 07 Jul 2023 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688746423; x=1691338423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywSqzI74cjHUE6KeQH1mU8Jcokh/l7Hn6rSfzQMd2ww=;
        b=ADH2m4xehwtx31+2MZvm4dqWoTx1lDYpxdPq+YnrTnHiwXLmgvwli5mQYyQ6koEcWy
         sR272ygEiP3zMJBeMxxRQpCN3rbPV50Et5Hy4mJxg1o9RgqJWH4w71hO9CKZ/zFiM/33
         Hoeozw4jm0ap9OYREFYqCaUjII6pQxu4DJQnGjOwh6uMYN70XRseA1xg5K4a8n3NUjr0
         VHd2oDKsdfTKhhYEIWDTROpMTCYEPXcRPzHIRJwoUSYEMfo3eziOgsy6EtgUEOMG4g1/
         TV6o2vkNKn3d5zF+fgRr++Qz+ZspvSv1BmdwjcFrqz+ucejiiZXfJ5VYG3pxsn2Ppl3T
         +KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688746423; x=1691338423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywSqzI74cjHUE6KeQH1mU8Jcokh/l7Hn6rSfzQMd2ww=;
        b=RMP5Ka1fv8B0uFJbn5uF+Fu7XPWo8IX7z9T+fPbLwcjmjL5kwvydvOAl8XYHLXdoKR
         IuH9+yElbTq9w5EfV+mZ1kbyAFijYM0Whmx8PfLX/7B9/Zl4sR5hY93I9btyC5/xnfcV
         U0sBbCmE41h3Z4kq93929gJg+n8xe4Nny6BNSXCUz7GJIBcp13G/DQb1f9n7dTg70I3a
         ZTXbEVMx8Rk34na61zXNDez0BEJBJds7i7aMv4JjT2Q5DCUneDmE4yE5hdIOip628T9C
         MA8TC6PXyN1GhMjsY8KT58p5yW36iS+w3am3fNsD+bnXc4y581K4skYrYJAzPgYbwGa1
         7pJA==
X-Gm-Message-State: ABy/qLbP6Wl6Jb5yRdDKhkv65ZaYzf0C1DcyISTRmkpl3L8d+u91baqp
        OzuyL2eJvNwNw/g1f6hHhyDuu8nqzeHDcA==
X-Google-Smtp-Source: APBJJlEgtmBORa9GT8x1nEFBNCtRPYuBJewN20a4kFifKYFDSNBGeD02k4wbqiNGn6bOqEkP82haLg==
X-Received: by 2002:a17:906:8150:b0:992:aab0:533a with SMTP id z16-20020a170906815000b00992aab0533amr4277029ejw.67.1688746422909;
        Fri, 07 Jul 2023 09:13:42 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-106.cust.vodafonedsl.it. [188.217.59.106])
        by smtp.gmail.com with ESMTPSA id dc15-20020a170906c7cf00b00992e51fecfbsm2374306ejb.64.2023.07.07.09.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 09:13:42 -0700 (PDT)
Date:   Fri, 7 Jul 2023 18:13:40 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <ZKg5tJDz+y/LKZVN@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
 <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ni2n6flcaxap64dff7hdwmhzfdbbyklxx376xx44wforssu3jm@4yv4xj4caohr>
 <ZKQs8WWKfIGx9znI@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <7iefffm7r5pn4dwjgyxq5cz265wsvgawtnj55i3kq3gkvzb6co@vfcmdidj646w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7iefffm7r5pn4dwjgyxq5cz265wsvgawtnj55i3kq3gkvzb6co@vfcmdidj646w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jul 04, 2023 at 05:00:24PM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jul 04, 2023 at 04:30:09PM +0200, Tommaso Merciai wrote:
> > Hi Jacopo,
> >
> > On Tue, Jul 04, 2023 at 04:05:44PM +0200, Jacopo Mondi wrote:
> > > Hi Tommaso
> > >
> > > On Tue, Jul 04, 2023 at 03:51:43PM +0200, Tommaso Merciai wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Mon, Jul 03, 2023 at 10:29:10PM +0200, Jacopo Mondi wrote:
> > > > > Document the suggested way to exposure controls for exposure and gain
> > > > > for camera sensor drivers.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  .../driver-api/media/camera-sensor.rst        | 19 +++++++++++++++++++
> > > > >  1 file changed, 19 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > > index ee4a7fe5f72a..dfe8f35aecea 100644
> > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > @@ -189,3 +189,22 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > > >  a flip can potentially change the output buffer content layout. Flips should
> > > > >  also be taken into account when enumerating and handling media bus formats
> > > > >  on the camera sensor source pads.
> > > > > +
> > > > > +Exposure and Gain Control
> > > > > +-------------------------
> > > > > +
> > > > > +Camera sensor drivers that allows applications to control the image exposure
> > > > > +and gain should do so by exposing dedicated controls to applications.
> > > > > +
> > > > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > > > +The control definition does not specify a unit to allow maximum flexibility
> > > > > +for multiple device types, but when used for camera sensor driver it should be
> > > >
> > > > > +expressed in unit of lines whenever possible.
> > > >
> > > > Same comment here.
> > >
> > > I might have missed what other comment you are referring to :)
> >
> > Sorry, I'm referring to your comment:
> >
> > "I think this might be useful yes. A few paragraph above the frame
> > duration calculation formula is expressed as well, so I guess adding
> > one for this is helpful too"
> >
> 
> Ah ok, see v2 for that
> 
> > >
> > > >
> > > > Can you add formula/references about this point I think you are referring on "tline" units (maybe I'm completely wrong :) ),
> > >
> > > Is "tline" the line duration ? If that's the case then no, I am
> > > referring to the number of lines, not their duration.
> >
> > Ok. Thanks, need to find some docs regarding this units :'(
> > For this I think having some good reference/formula here would help users to find the
> > corrispective value into the sensor datasheet.
> >
> 

> I'm still not sure if you're talking about the formula to convert from
> a time duration to the number of lines as Dave suggested (which I
> added in v2) 

This one. I checked v2 thanks for the clarification!

Regards,
Tommaso


> or a formula to convert from the number of lines provided
> by userspace as the value of the V4L2_CID_EXPOSURE control to the
> actual value to be set in the sensor's registers that control the
> exposure time. If you're referring to the latter I'm afraid this is
> device specific and putting any example here might actually be
> mis-leading. As far as I can tell the sensors I had dealt with,
> internally represents the exposure control in number of lines or
> fractions of lines. Doing the conversion in the driver is usually
> trivial (I'm sure there are devices where this is less trivial of
> course).
> 
> Did I get your question right or am I still missing something ?
> 
> > I just proved this to you :)
> >
> > Regards,
> > Tommaso
> >
> > >
> > > > but to be honest checking also the some sensors datasheet I don't find to much infos about this units.
> > > > Would be really helpfull to add some details on this point.
> > > >
> > > > > +
> > > > > +Camera sensor driver should try whenever possible to distinguish between the
> > > > > +analogue and digital gain control functions. Analogue gain is a multiplier
> > > > > +factor applied to all color channels on the pixel array before they get
> > > > > +converted in the digital domain. It should be be made controllable by
> > > > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > > > +specific gain code. Digital gain control is optional and should be exposed to
> > > > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > > > > --
> > > >
> > > > This part looks good to me.
> > > >
> > > > Thanks,
> > > > Tommaso
> > > >
> > > > > 2.40.1
> > > > >
