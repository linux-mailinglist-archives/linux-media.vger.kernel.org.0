Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302B3747420
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjGDOaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjGDOaO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:30:14 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E850E49
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:30:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99384a80af7so123077766b.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688481012; x=1691073012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjsiBHJi7PqMhH944FWCg4X3i1Fw3A+B9jw+HCG5J2Q=;
        b=hLy5cPOH1vfSThR/mN6/Jlpp1yp/z0El0/sJ/Mke6VKCKS6Qt6wksCRcabBscfBuMP
         uFxpka8fL15btQrWg1pWNNhYi88TOtc3mkotgx2+cdDvG1IWDLVwoQTDYCAbZZL1JQQh
         d6v/zPmZ0oaIm862aHERznifeReUi4uC6K3TRShhF3h99GyU5ZMWlgs1Ydf3B30tff40
         lsRcOHlgoAJM8uIH2GtDVM9F1gxHeYXjWLK5tMpFU7ZN/6hzQMFjUkvE8h7kUTdA/nEY
         s7yt6RDX8D/5E1HI29fYYNsMbad14SJPawV/piD/iEIHPJtbuCwWIwoJwFoB+iDfucVe
         jz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688481012; x=1691073012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjsiBHJi7PqMhH944FWCg4X3i1Fw3A+B9jw+HCG5J2Q=;
        b=H9+rwR/+cJO2UsCzG9fQQnObvHJe+X9UEwLIgs7/UB7hIemVr6ALzv74j3OswYFiXk
         M5TH/CcSP+uEaLP+viiAX2VdC88Rfi/KQtIR7cF6IMZoBt3KIspm/Hcx4kyo0Sizm3RP
         L3VjajTBBaqj5b+EtBQ2qcJzaIkc7z+4mHdXzKOFnOgOXOGXOb3x58dU93ijSXgtwQID
         KF4XyqSF3kTEZOwsUghu8M/AsvX7tE1W3Y3UqaJB+UHdxhviX81KgIiH+0A2O0OwPpIY
         SmY8w/Fw5yQwLmQxSlJI2HoovZYGuVKgHb7VA5TiprSJAZjsq+Lna6a/95KWyazWz4xO
         kE6w==
X-Gm-Message-State: AC+VfDwPPdhK/CtlhsoKwAXe2dT7xgz6WhGQJFguEVL9qE2QMavUReD7
        D8WJmlUo1WhHcErXtiPLhkM=
X-Google-Smtp-Source: APBJJlE2MmmE+f4Xy/3kSBFENmWjReuOnosp9OOPxwvT6ejZv3V8xQkkohY6pelvxg4+5P6nBptGsw==
X-Received: by 2002:a17:906:86d9:b0:971:484:6391 with SMTP id j25-20020a17090686d900b0097104846391mr7588551ejy.20.1688481011461;
        Tue, 04 Jul 2023 07:30:11 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-106.cust.vodafonedsl.it. [188.217.59.106])
        by smtp.gmail.com with ESMTPSA id d5-20020aa7d685000000b0051e0fc8254asm2587913edr.28.2023.07.04.07.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:30:11 -0700 (PDT)
Date:   Tue, 4 Jul 2023 16:30:09 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Documentation: v4l: Exposure/gain for camera sensor
Message-ID: <ZKQs8WWKfIGx9znI@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-3-jacopo.mondi@ideasonboard.com>
 <ZKQj78i94MecEfDe@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ni2n6flcaxap64dff7hdwmhzfdbbyklxx376xx44wforssu3jm@4yv4xj4caohr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ni2n6flcaxap64dff7hdwmhzfdbbyklxx376xx44wforssu3jm@4yv4xj4caohr>
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

On Tue, Jul 04, 2023 at 04:05:44PM +0200, Jacopo Mondi wrote:
> Hi Tommaso
> 
> On Tue, Jul 04, 2023 at 03:51:43PM +0200, Tommaso Merciai wrote:
> > Hi Jacopo,
> >
> > On Mon, Jul 03, 2023 at 10:29:10PM +0200, Jacopo Mondi wrote:
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
> > > +and gain should do so by exposing dedicated controls to applications.
> > > +
> > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > +The control definition does not specify a unit to allow maximum flexibility
> > > +for multiple device types, but when used for camera sensor driver it should be
> >
> > > +expressed in unit of lines whenever possible.
> >
> > Same comment here.
> 
> I might have missed what other comment you are referring to :)

Sorry, I'm referring to your comment:

"I think this might be useful yes. A few paragraph above the frame
duration calculation formula is expressed as well, so I guess adding
one for this is helpful too"

> 
> >
> > Can you add formula/references about this point I think you are referring on "tline" units (maybe I'm completely wrong :) ),
> 
> Is "tline" the line duration ? If that's the case then no, I am
> referring to the number of lines, not their duration.

Ok. Thanks, need to find some docs regarding this units :'(
For this I think having some good reference/formula here would help users to find the
corrispective value into the sensor datasheet.

I just proved this to you :)

Regards,
Tommaso

> 
> > but to be honest checking also the some sensors datasheet I don't find to much infos about this units.
> > Would be really helpfull to add some details on this point.
> >
> > > +
> > > +Camera sensor driver should try whenever possible to distinguish between the
> > > +analogue and digital gain control functions. Analogue gain is a multiplier
> > > +factor applied to all color channels on the pixel array before they get
> > > +converted in the digital domain. It should be be made controllable by
> > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > +specific gain code. Digital gain control is optional and should be exposed to
> > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > > --
> >
> > This part looks good to me.
> >
> > Thanks,
> > Tommaso
> >
> > > 2.40.1
> > >
