Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF196B1562
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 23:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCHWnc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 17:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjCHWna (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 17:43:30 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1216B61533
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 14:43:24 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so4426440pjn.1
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 14:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678315403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oeSJi/JhqyhSZobbEu0GSssyICYVXoFtP/TkEhEwrxU=;
        b=OU03rvbfMFoPcQ41fqslYKhqz6FF+nZuikMi2ghtb+tJnnBS4pUcgzCSwygsq9sv2j
         cnqIcEiQhxUdcSG2WdKzHuRECBx6oifw6iF25nLA/WDHyYivAk3UavLgoBVo2HCqWPiq
         7MSzX+LuDwUMKe5D5R3NbRWRUhXAr6KI9e9DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678315403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeSJi/JhqyhSZobbEu0GSssyICYVXoFtP/TkEhEwrxU=;
        b=ly/2BHUFWoEFScup4z0MSsg9LqCh6SYdZJkK87zvTCWCzqIVbBoJInIgiF9xut8sGW
         G2KuTSBN0h9qloARl2VpIYYhHLWk6KTS+XWA482flSMR9/3BaUD8QJaewsB0IpQE0zOV
         w/IabncZkfeLQFJZXM0qqztp9jOdp5+7l6Njd6T1BA+k25/CpKm4MRAy/E4eghQBQqRo
         qYRCCvJ7FMaAQ38n5kifab09pa+saMHm3jfqnW66+ELdUol+rtdEf0EFyi2XWSPF2fXe
         7qVbw6oXPf53qJAeinq2f3OVCE367RnN+EDCOSLft89UT6kDwOv8BWWQZlA/xz4gUFIO
         STyQ==
X-Gm-Message-State: AO0yUKWE2jaZW/7Z5+/sWXxNJTwnCGA970jkTbBJNti9XWdTj3dFCkMS
        XCNGqiyRTi2KC9iPwwuY0+hNMFWAtYxnpTF3fyY=
X-Google-Smtp-Source: AK7set9RHe1MxY8nSACYMSxfl20KCgrFzdcrrOZPiN/TGAyKVPIQ3T/2a0kfTcWpgp5RzzfpYAu+Ww==
X-Received: by 2002:a17:902:b786:b0:19d:7a4:4073 with SMTP id e6-20020a170902b78600b0019d07a44073mr17214561pls.59.1678315403226;
        Wed, 08 Mar 2023 14:43:23 -0800 (PST)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902a60400b00198f73f9d54sm10252323plq.117.2023.03.08.14.43.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 14:43:22 -0800 (PST)
Received: by mail-pl1-f177.google.com with SMTP id i10so49765plr.9
        for <linux-media@vger.kernel.org>; Wed, 08 Mar 2023 14:43:22 -0800 (PST)
X-Received: by 2002:a17:90b:11c9:b0:22c:3ee1:db3b with SMTP id
 gv9-20020a17090b11c900b0022c3ee1db3bmr7358221pjb.3.1678315401399; Wed, 08 Mar
 2023 14:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20221101-instal-v1-0-d13d1331c4b5@chromium.org>
 <Y6z55cXTt5yXjIZj@pendragon.ideasonboard.com> <CANiDSCvbQ7uMgoxDsXDOphjANNZ2EuoV-Dra+wtT9LLL6USstQ@mail.gmail.com>
In-Reply-To: <CANiDSCvbQ7uMgoxDsXDOphjANNZ2EuoV-Dra+wtT9LLL6USstQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 8 Mar 2023 23:43:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCveK6QRbYM==XN9jggy8DHfS3QJawDWpFLy0jcmmHeduA@mail.gmail.com>
Message-ID: <CANiDSCveK6QRbYM==XN9jggy8DHfS3QJawDWpFLy0jcmmHeduA@mail.gmail.com>
Subject: Re: [PATCH RESEND] media: uvcvideo: Disable autosuspend for Insta360 Link
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yunke Cao <yunkec@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 1 Mar 2023 at 10:04, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> We are back to this issue.
>
>
> On Thu, 29 Dec 2022 at 03:22, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Fri, Dec 02, 2022 at 05:48:52PM +0100, Ricardo Ribalda wrote:
> > > When the device suspends, it keeps power-cycling.
> > >
> > > The user notices it because the LED constanct oscillate between
> > > blue (ready) and no LED (off).
> > >
> > > <6>[95202.128542] usb 3-3-port4: attempt power cycle
> > > <6>[95206.070120] usb 3-3.4: new high-speed USB device number 49 using xhci_hcd
> > > <6>[95206.212027] usb 3-3.4: New USB device found, idVendor=2e1a, idProduct=4c01, bcdDevice= 2.00
> > > <6>[95206.212044] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=<Serial: 1>
> > > <6>[95206.212050] usb 3-3.4: Product: Insta360 Link
> > > <6>[95206.212075] usb 3-3.4: Manufacturer: Amba
> > > <7>[95206.214862] usb 3-3.4: GPIO lookup for consumer privacy
> > > <7>[95206.214866] usb 3-3.4: using lookup tables for GPIO lookup
> > > <7>[95206.214869] usb 3-3.4: No GPIO consumer privacy found
> > > <6>[95206.214871] usb 3-3.4: Found UVC 1.10 device Insta360 Link (2e1a:4c01)
> > > <3>[95206.217113] usb 3-3.4: Failed to query (GET_INFO) UVC control 14 on unit 1: -32 (exp. 1).
> > > <3>[95206.217733] usb 3-3.4: Failed to query (GET_INFO) UVC control 16 on unit 1: -32 (exp. 1).
> > > <4>[95206.223544] usb 3-3.4: Warning! Unlikely big volume range (=32767), cval->res is probably wrong.
> > > <4>[95206.223554] usb 3-3.4: [9] FU [Mic Capture Volume] ch = 1, val = -32768/-1/1
> > > <6>[95210.698990] usb 3-3.4: USB disconnect, device number 49
> > > <6>[95211.963090] usb 3-3.4: new high-speed USB device number 50 using xhci_hcd
> > > <6>[95212.657061] usb 3-3.4: new full-speed USB device number 51 using xhci_hcd
> > > <3>[95212.783119] usb 3-3.4: device descriptor read/64, error -32
> > > <3>[95213.015076] usb 3-3.4: device descriptor read/64, error -32
> > > <6>[95213.120358] usb 3-3-port4: attempt power cycle
> > >
> > > Bus 001 Device 009: ID 2e1a:4c01 Amba Insta360 Link
> > > Device Descriptor:
> > >   bLength                18
> > >   bDescriptorType         1
> > >   bcdUSB               2.00
> > >   bDeviceClass          239 Miscellaneous Device
> > >   bDeviceSubClass         2
> > >   bDeviceProtocol         1 Interface Association
> > >   bMaxPacketSize0        64
> > >   idVendor           0x2e1a
> > >   idProduct          0x4c01
> > >   bcdDevice            2.00
> > >   iManufacturer           1 Amba
> > >   iProduct                2 Insta360 Link
> > >   iSerial                 0
> > >   bNumConfigurations      1
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > media: uvcvideo: Disable autosuspend for Insta360
> > >
> > > The device does not handle properly the USB suspend and makes it barely usable.
> >
> > Isn't this best handled with a quirk in the USB core ? Autosuspend is a
> > device feature, not an interface feature, so if the USB sound driver is
> > loaded but uvcvideo isn't, the kernel may still attempt to autosuspend
> > the device.
> >
>
> Seems like USB_QUIRK_NO_AUTOSUSPEND was gone for a long time
>
> https://lore.kernel.org/lkml/20071115064457.GU19218@kroah.com/
>
> under the assumption that autosuspend was off by default and user
> space should only enable autosuspend on the devices that support it
> (if I understand it correctly).
>
> There are two other quirks still available: USB_QUIRK_RESET_RESUME and
> USB_QUIRK_DISCONNECT_SUSPEND, but they do not seem to work for this
> device (Yunke, thanks for looking into this)
>
> If we are explicitly enabling autosuspend on the driver, shouldn't we
> make sure that the device supports it?
>

Alan, Greg, any idea about what is the best way to proceed here from a
USB perspective?

Thanks!

>
> > > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++++++-
> > >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> > >  2 files changed, 13 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 215fb483efb0..ad95c7599863 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2223,7 +2223,9 @@ static int uvc_probe(struct usb_interface *intf,
> > >       }
> > >
> > >       uvc_dbg(dev, PROBE, "UVC device initialized\n");
> > > -     usb_enable_autosuspend(udev);
> > > +     if (!(dev->quirks & UVC_QUIRK_DISABLE_AUTOSUSPEND))
> > > +             usb_enable_autosuspend(udev);
> > > +
> > >       return 0;
> > >
> > >  error:
> > > @@ -2967,6 +2969,15 @@ static const struct usb_device_id uvc_ids[] = {
> > >         .bInterfaceSubClass   = 1,
> > >         .bInterfaceProtocol   = 0,
> > >         .driver_info          = (kernel_ulong_t)&uvc_quirk_force_y8 },
> > > +     /* Insta360 Link */
> > > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +       .idVendor             = 0x2e1a,
> > > +       .idProduct            = 0x4c01,
> > > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +       .bInterfaceSubClass   = 1,
> > > +       .bInterfaceProtocol   = 0,
> > > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> > >       /* GEO Semiconductor GC6500 */
> > >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index df93db259312..47c86c7c6346 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -74,6 +74,7 @@
> > >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> > >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> > >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > > +#define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00002000
> > >
> > >  /* Format flags */
> > >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> > >
> > > ---
> > > base-commit: 23758867219c8d84c8363316e6dd2f9fd7ae3049
> > > change-id: 20221101-instal-9a77ba1cc448
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
