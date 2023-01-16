Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81AE66C26E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjAPOmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjAPOmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:42:10 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D233C2278D
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:19:35 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d3so30448315plr.10
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HiaNsyu4v4chIY9eqovT1CDhuf21Wxga6X1yd6sWaEk=;
        b=lFgCIOCzlqxIHadu6KtAh2pfPeuwf2uoEEhYV1TPlAELlEiHZXtb3rR+IBTrc/dmtb
         KXFZin5UCMi0z5PXoc7dAFmdBf9sbfb6ubzgCZyku29Lz9LTmzKgnKD3+T9iTtA0+dnL
         E/VwWUsfWeQ8ONpCO1odA3RoK8Z93vohsbyZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiaNsyu4v4chIY9eqovT1CDhuf21Wxga6X1yd6sWaEk=;
        b=lDODYqeOHV5l3jolQ8Q0LyztigSdMi4cPh3Bh+GHeTQ04crIRlQqcR5SAtMZVRngFB
         wLP4wGmUPW4yNwwMOh7UM8xp9ikF8cHZB0qhWz3u9Uk9oSA41T4NbcvgA7sVxEPbKbm0
         xhJuAFM7zFY3OsoaWP2EoyB9uMoilfEYiAG8/Hj4ktibGNqHtAGf+bz2mCPOEhu5k0Mg
         C3JCzUxKQt/t4Omv9Aef8Eccbl3HZ4qmnyHrZ75MCDNKesRy5C0odXaRBp51Bkeop8IV
         WjekyLRtppO8GLY3bWLFZgNvmr/Rr2RhkNYygnwSotINBjPtJeP2NaHibHdOsLxV4PsY
         jhYQ==
X-Gm-Message-State: AFqh2koEU/N+O0umq6GO91Qeiyours8ge7umYZaLKkBZiI6x0YbGX84Y
        6qNU5XsOuE7TBnA6m8gBLxUSq+ImgusOTDzLQJo=
X-Google-Smtp-Source: AMrXdXufSC+hjObhuwLBP7pYVfJTAnJ2/x4DXzMWPAiNs6aRxxFMzgG50ijsxw4yz30omDtoptWIwg==
X-Received: by 2002:a05:6a21:169b:b0:b8:ad30:717c with SMTP id np27-20020a056a21169b00b000b8ad30717cmr726709pzb.9.1673878775162;
        Mon, 16 Jan 2023 06:19:35 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id b2-20020a17090a7ac200b0022698aa22d9sm516628pjl.31.2023.01.16.06.19.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:19:34 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id 127so3782193pfe.4
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:19:34 -0800 (PST)
X-Received: by 2002:a63:1463:0:b0:4be:c5ec:93fd with SMTP id
 35-20020a631463000000b004bec5ec93fdmr783053pgu.63.1673878773821; Mon, 16 Jan
 2023 06:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com> <Y8VbYq48+gmmd4rD@pendragon.ideasonboard.com>
In-Reply-To: <Y8VbYq48+gmmd4rD@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 15:19:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCuDeCmSJB+daPBnUMc20Aev_+2VRo3Dn+UiyrzciQS7og@mail.gmail.com>
Message-ID: <CANiDSCuDeCmSJB+daPBnUMc20Aev_+2VRo3Dn+UiyrzciQS7og@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Giuliano Lotta <giuliano.lotta@gmail.com>,
        "kolbjorn@kodemaker.no" <kolbjorn@kodemaker.no>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Laurent

On Mon, 16 Jan 2023 at 15:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Jan 16, 2023 at 02:05:28PM +0100, Ricardo Ribalda wrote:
> > On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart wrote:
> > >
> > > The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> > > implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> > > long. Force the UVC version for that device.
> >
> > Don't we also want to include 4035:4033 ?
>
> I've asked for the lsusb output for that device, I'll send a separate
> patch when I get it.
>
> > I am curious about the PowerLine Control (does it have one?) will it
> > behave like 1.1 or 1.5
>
> Good question. Hardcoding the version to 1.0a will not cause an error,
> but may prevent the auto mode from being supported.
>
> An alternative would be to automatically fall back to the UVC 1.0a video
> probe and commit control when the size returned by GET_CUR differs from
> the value expected from UVC 1.5. That would be a generic fix that won't
> require quirks. What do you think ?

That sounds good to me, but we should print a warning. At least to
make the users aware that here be dragons.

>
> > Would it be possible to get the output with uvc_debug enabled?
>
> I'll let you tell Giuliano how to provide that :-)

sure, you just do:

sudo rmmod uvcvideo; sudo modprobe uvcvideo  trace=0xffffffff

and then when you run dmesg, there will be much more uvc output

>
> > > Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >
> > > Giuliano, I believe you've successfully tested this patch. If so, could
> > > you reply with a Tested-by tag ? Just copying the following in your
> > > reply will do:
> > >
> > > Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> > >
> > >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 1a186abeb4fa..742eeaff333e 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
> > >           .bInterfaceSubClass   = 1,
> > >           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > >           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> > > +       /* Quanta ACER HD User Facing */
> > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +         .idVendor             = 0x0408,
> > > +         .idProduct            = 0x4035,
> > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +         .bInterfaceSubClass   = 1,
> > > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > > +               .uvc_version = 0x010a,
> > > +         } },
> > >         /* LogiLink Wireless Webcam */
> > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > >
> > > base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
