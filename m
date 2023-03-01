Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A0D6A696D
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 10:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjCAJEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 04:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjCAJEn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 04:04:43 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFCA7287
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 01:04:42 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id oj5so8694653pjb.5
        for <linux-media@vger.kernel.org>; Wed, 01 Mar 2023 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L8tn/v4aC2ukEl0jonB4oe0ZECIANi8VW58t3+cYdus=;
        b=ZrrzLbNzuFqJ1Qm1WsDrm7SmRVdW2i6BRFAKgIfedUQcQ43CKj/IiGCVpRVQu8OkjN
         F4qGw8sJCk4CKMbsuylpcHbSuyLl0BpffF7GlJv4O3Ix5crYwnARr5Kr0oAQzTwgbCTB
         83ff7P1WqThaYcCriNbMD85FbXE1HV+tu+wYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8tn/v4aC2ukEl0jonB4oe0ZECIANi8VW58t3+cYdus=;
        b=bWIOMpBCOFVetKiB+FzhBlvFwylye3QKbo2WagOkxHpSVtwP3PEZnJrqLyB6a4/Plp
         gtdUdYVPbqsn4pNM3bzma4uRcHpqnXsbUyl4TuOW0qjuZAEUhKn0J3wnRtxTapDhpC2z
         eiemm7JMQ8ch3cIb9hIGLC1nvGvg193DrbbrIUUmHY92VH8xig9VdEeeXq2zHWVd6JBh
         jeWTVUKP0SjBHzhVGH1IyWb0wPr2qpAwjS0ISAesgqIYyi60lTC4MXARiCOdutZXRd3V
         eEiI3NTyDr9mXPo28XdE73rgw7iAYNJN89syq3BblXH2kS+ki0q+2bIpomM2/5uCH545
         zUJw==
X-Gm-Message-State: AO0yUKWXaIqe9FJ//yhzMqj5MuAtMDpNLzM1kDH0yUOItbnJLY3E0wQq
        kd3bO/Sn4BamtBbYkdqmOHq8yeK2bp8V7q2E
X-Google-Smtp-Source: AK7set+kU47aNtkwrT5BejJr6WX5O57dRMPdovFtlL9ZMEYr7Ivt1MaVBLCF3Q9ngkVthgQQgHUpmA==
X-Received: by 2002:a17:903:1250:b0:19a:9406:b234 with SMTP id u16-20020a170903125000b0019a9406b234mr6776658plh.45.1677661481625;
        Wed, 01 Mar 2023 01:04:41 -0800 (PST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902a3c600b0019cb6222691sm7906302plb.133.2023.03.01.01.04.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 01:04:41 -0800 (PST)
Received: by mail-pl1-f182.google.com with SMTP id z2so13250621plf.12
        for <linux-media@vger.kernel.org>; Wed, 01 Mar 2023 01:04:40 -0800 (PST)
X-Received: by 2002:a17:90a:668d:b0:230:80d7:2158 with SMTP id
 m13-20020a17090a668d00b0023080d72158mr2307984pjj.4.1677661480192; Wed, 01 Mar
 2023 01:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20221101-instal-v1-0-d13d1331c4b5@chromium.org> <Y6z55cXTt5yXjIZj@pendragon.ideasonboard.com>
In-Reply-To: <Y6z55cXTt5yXjIZj@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 1 Mar 2023 10:04:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCvbQ7uMgoxDsXDOphjANNZ2EuoV-Dra+wtT9LLL6USstQ@mail.gmail.com>
Message-ID: <CANiDSCvbQ7uMgoxDsXDOphjANNZ2EuoV-Dra+wtT9LLL6USstQ@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

We are back to this issue.


On Thu, 29 Dec 2022 at 03:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Dec 02, 2022 at 05:48:52PM +0100, Ricardo Ribalda wrote:
> > When the device suspends, it keeps power-cycling.
> >
> > The user notices it because the LED constanct oscillate between
> > blue (ready) and no LED (off).
> >
> > <6>[95202.128542] usb 3-3-port4: attempt power cycle
> > <6>[95206.070120] usb 3-3.4: new high-speed USB device number 49 using xhci_hcd
> > <6>[95206.212027] usb 3-3.4: New USB device found, idVendor=2e1a, idProduct=4c01, bcdDevice= 2.00
> > <6>[95206.212044] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=<Serial: 1>
> > <6>[95206.212050] usb 3-3.4: Product: Insta360 Link
> > <6>[95206.212075] usb 3-3.4: Manufacturer: Amba
> > <7>[95206.214862] usb 3-3.4: GPIO lookup for consumer privacy
> > <7>[95206.214866] usb 3-3.4: using lookup tables for GPIO lookup
> > <7>[95206.214869] usb 3-3.4: No GPIO consumer privacy found
> > <6>[95206.214871] usb 3-3.4: Found UVC 1.10 device Insta360 Link (2e1a:4c01)
> > <3>[95206.217113] usb 3-3.4: Failed to query (GET_INFO) UVC control 14 on unit 1: -32 (exp. 1).
> > <3>[95206.217733] usb 3-3.4: Failed to query (GET_INFO) UVC control 16 on unit 1: -32 (exp. 1).
> > <4>[95206.223544] usb 3-3.4: Warning! Unlikely big volume range (=32767), cval->res is probably wrong.
> > <4>[95206.223554] usb 3-3.4: [9] FU [Mic Capture Volume] ch = 1, val = -32768/-1/1
> > <6>[95210.698990] usb 3-3.4: USB disconnect, device number 49
> > <6>[95211.963090] usb 3-3.4: new high-speed USB device number 50 using xhci_hcd
> > <6>[95212.657061] usb 3-3.4: new full-speed USB device number 51 using xhci_hcd
> > <3>[95212.783119] usb 3-3.4: device descriptor read/64, error -32
> > <3>[95213.015076] usb 3-3.4: device descriptor read/64, error -32
> > <6>[95213.120358] usb 3-3-port4: attempt power cycle
> >
> > Bus 001 Device 009: ID 2e1a:4c01 Amba Insta360 Link
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x2e1a
> >   idProduct          0x4c01
> >   bcdDevice            2.00
> >   iManufacturer           1 Amba
> >   iProduct                2 Insta360 Link
> >   iSerial                 0
> >   bNumConfigurations      1
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > media: uvcvideo: Disable autosuspend for Insta360
> >
> > The device does not handle properly the USB suspend and makes it barely usable.
>
> Isn't this best handled with a quirk in the USB core ? Autosuspend is a
> device feature, not an interface feature, so if the USB sound driver is
> loaded but uvcvideo isn't, the kernel may still attempt to autosuspend
> the device.
>

Seems like USB_QUIRK_NO_AUTOSUSPEND was gone for a long time

https://lore.kernel.org/lkml/20071115064457.GU19218@kroah.com/

under the assumption that autosuspend was off by default and user
space should only enable autosuspend on the devices that support it
(if I understand it correctly).

There are two other quirks still available: USB_QUIRK_RESET_RESUME and
USB_QUIRK_DISCONNECT_SUSPEND, but they do not seem to work for this
device (Yunke, thanks for looking into this)

If we are explicitly enabling autosuspend on the driver, shouldn't we
make sure that the device supports it?

Regards!

> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++++++-
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 215fb483efb0..ad95c7599863 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2223,7 +2223,9 @@ static int uvc_probe(struct usb_interface *intf,
> >       }
> >
> >       uvc_dbg(dev, PROBE, "UVC device initialized\n");
> > -     usb_enable_autosuspend(udev);
> > +     if (!(dev->quirks & UVC_QUIRK_DISABLE_AUTOSUSPEND))
> > +             usb_enable_autosuspend(udev);
> > +
> >       return 0;
> >
> >  error:
> > @@ -2967,6 +2969,15 @@ static const struct usb_device_id uvc_ids[] = {
> >         .bInterfaceSubClass   = 1,
> >         .bInterfaceProtocol   = 0,
> >         .driver_info          = (kernel_ulong_t)&uvc_quirk_force_y8 },
> > +     /* Insta360 Link */
> > +     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             = 0x2e1a,
> > +       .idProduct            = 0x4c01,
> > +       .bInterfaceClass      = USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   = 1,
> > +       .bInterfaceProtocol   = 0,
> > +       .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> >       /* GEO Semiconductor GC6500 */
> >       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index df93db259312..47c86c7c6346 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -74,6 +74,7 @@
> >  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT      0x00000400
> >  #define UVC_QUIRK_FORCE_Y8           0x00000800
> >  #define UVC_QUIRK_FORCE_BPP          0x00001000
> > +#define UVC_QUIRK_DISABLE_AUTOSUSPEND        0x00002000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
> >
> > ---
> > base-commit: 23758867219c8d84c8363316e6dd2f9fd7ae3049
> > change-id: 20221101-instal-9a77ba1cc448
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
