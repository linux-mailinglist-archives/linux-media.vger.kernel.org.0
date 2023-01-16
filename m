Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDF666C374
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjAPPTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbjAPPTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:19:08 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083CA55A4
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:11:34 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q5so3194671pjh.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h6dKgxMK9oRAstbOItFtNmy4Y2fAus4MbIdxjmQ7bgQ=;
        b=MAoLxyqGQMOuHq56/JCGN9rP61Sy2ukxz3qRkkQfoMUl3M9MpmeFfxNeHX96Tyg7Eq
         VJA4uD+xXFHpjY/FsJtXiLn1RcC4BfEJmwJcNBSP1Lte387O8EvDKCHacK/nXeW560CS
         pJxNZEIhONUxYNVZyrP/OBa/dfDNC6sSaSdnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6dKgxMK9oRAstbOItFtNmy4Y2fAus4MbIdxjmQ7bgQ=;
        b=4LwqPhAkbixbGnFl3U0QomL77+PlmH3+zyZjY1a91R6y5D7eQjp5AoeVE7XpquynpB
         JGJuOgNO0CwnYx3K9GGR+yJwqxF3fY9xFywS9oD/6449oXCyIMyuwYKhwFxt38lVqICG
         SePSmlXKp3hTNggANhK9o1JP6+SGwrUc2oSmX/44/3gaBVUJ9NwDgcQBVrUFPn1hlfma
         2thxtmwD2J5P5TJCa6B32LPQ6h1hsc7N4W30yr6AxgX9cRD1OQE9ZBMC9v8dyPrzvMOq
         q21KsrkiMFuYY/Ei3i+EySmh0hCC90lflLmyAyVmvGXmsd8XdiCtz37fpM7TcabKJNO5
         XpJA==
X-Gm-Message-State: AFqh2kprOcdJWvJulSyQLqzaMK2MUrksQemUi36lcY38cEded2qj5H1J
        0zUA43hw0vGOt6V/+vrNNAZGiwtfQuVUfFpJNaE=
X-Google-Smtp-Source: AMrXdXv9hiugl/bjRLkklXYdDvlsb0korAZ3V2PMoTovBSFBIv1V/n6z1MCiS8INexnE1Fe9qulBMA==
X-Received: by 2002:a05:6a20:a590:b0:ac:29b4:11bc with SMTP id bc16-20020a056a20a59000b000ac29b411bcmr26358120pzb.21.1673881893269;
        Mon, 16 Jan 2023 07:11:33 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id k36-20020a635a64000000b0048988ed9e4bsm15425771pgm.19.2023.01.16.07.11.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:11:32 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id h192so19854759pgc.7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:11:32 -0800 (PST)
X-Received: by 2002:a63:235e:0:b0:4cc:be65:dd9d with SMTP id
 u30-20020a63235e000000b004ccbe65dd9dmr337662pgm.520.1673881891753; Mon, 16
 Jan 2023 07:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com> <CA+DpmqZ+Jjk1ZTtJzSDGsmhAez0xZ2yWfDvuUrWCerNazjZCaQ@mail.gmail.com>
In-Reply-To: <CA+DpmqZ+Jjk1ZTtJzSDGsmhAez0xZ2yWfDvuUrWCerNazjZCaQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 16 Jan 2023 16:11:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCtz=xUxhb37M+PvfT4b4V_qpg9TN6yfacMZWMJ2QLTQSA@mail.gmail.com>
Message-ID: <CANiDSCtz=xUxhb37M+PvfT4b4V_qpg9TN6yfacMZWMJ2QLTQSA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
To:     Giuliano Lotta <giuliano.lotta@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
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

Hi Giuliano

On Mon, 16 Jan 2023 at 15:31, Giuliano Lotta <giuliano.lotta@gmail.com> wrote:
>
> Hi Ricardo,
> I have a  4035:4035 (not the 4035:4033 );
> if it may help , I  could manage to have the debug info from this camera.
>
> BUT to get uvc_debug enabled, which
> -specific #define adn/or variable
> -specific  c/h  file
>
> should we set ?

no need to change any code. Just do:

sudo rmmod uvcvideo; sudo modprobe uvcvideo  trace=0xffffffff

then get some frames

yavta --capture=3 /dev/video0


then run dmesg

Thanks!

>
> BR
> Giuliano
>
> Il giorno lun 16 gen 2023 alle ore 14:05 Ricardo Ribalda <ribalda@chromium.org> ha scritto:
> >
> > Hi Laurent
> >
> > On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> > > implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> > > long. Force the UVC version for that device.
> >
> > Don't we also want to include 4035:4033 ?
> >
> > I am curious about the PowerLine Control (does it have one?) will it
> > behave like 1.1 or 1.5
> >
> > Would it be possible to get the output with uvc_debug enabled?
> >
> > Regards!
> >
> >
> > >
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
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> > >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
