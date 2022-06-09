Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FB354444B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 08:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbiFIGzL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 02:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbiFIGzK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 02:55:10 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA44C966F
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 23:55:09 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-fdfe64231dso7531375fac.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HpCxGtdFhjWfEbbeMy1eXzjQn0nQo2Cl315uTOMCM8=;
        b=TGFvZsd2tf/1ki5bwHh3orbjRsroziqV59PhwdCpkBBnGm3BextPsAgsy/nRqBbwPh
         7mb22cxNy3cFR2tRZn8xBQeRsuOgLXJG/bvzrV/9rE9ZYRd0csvN/ZFxyYARjpQG5M9m
         kZw8W8zYidg4CG9iFxjQOyx8G0AzyM3NWAW38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HpCxGtdFhjWfEbbeMy1eXzjQn0nQo2Cl315uTOMCM8=;
        b=KH0gOxYRNPwPWVUpQ5oDGXx2RnWoor+EUez19LrM/gKnzjSBf8wYuRH8QyWqHE9u3F
         WHofPUQMxOaUhv3s8Y06HsSqCxIv2BNXBvdCRmvXWdJMJ9MbN31cGqzcBKoHfl05aNVZ
         Te2SHmUPX8eXUGmQnbkNsFjj1L2hV07/XUe/hHsvJDGKuQDxKcnW1fmieZGv5EbpQE0W
         fiTvICh4MY/lBOKCZJAP0y0kQ1rp6DVFg5mG/XTaANxpuG/kJ3jA3rqU+Ye1/PyU//ag
         ROMlU7/03ev+VIDmFEMSrVoNhx0ZzzjrBPpj+I2R4FLD5G+jG/jeiIhopkGN60JXMF2Q
         /A4g==
X-Gm-Message-State: AOAM533G5DCMKV7/VIu9JNN/LiEyOmCy1lMNSFJV4emfG4VeD9D3V9jV
        O2lwYz/6sRe1y247ZoPtrXkr+7HkZNpemg==
X-Google-Smtp-Source: ABdhPJxzU8Bkv34zwBIE9104z+ZKLMNEJc9eX4JCwuKqs6FklOakPJMZqOurVICowZ4TqqKZ54WEAg==
X-Received: by 2002:a05:6870:c690:b0:f2:99d5:8398 with SMTP id cv16-20020a056870c69000b000f299d58398mr962494oab.128.1654757708543;
        Wed, 08 Jun 2022 23:55:08 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id gu23-20020a056870ab1700b000f5d765bc02sm10429767oab.8.2022.06.08.23.55.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 23:55:07 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-f2a4c51c45so29958838fac.9
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 23:55:07 -0700 (PDT)
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr866548oaq.223.1654757707162; Wed, 08
 Jun 2022 23:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
 <20220608065005.23014-4-laurent.pinchart@ideasonboard.com>
 <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com> <YqDVEptwfUf86Ipw@pendragon.ideasonboard.com>
In-Reply-To: <YqDVEptwfUf86Ipw@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 9 Jun 2022 08:54:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCteYePgP6qad84POE6NU2Dn20aAKUfFaxvLp0kPvwXqig@mail.gmail.com>
Message-ID: <CANiDSCteYePgP6qad84POE6NU2Dn20aAKUfFaxvLp0kPvwXqig@mail.gmail.com>
Subject: Re: [RFC PATCH v4 3/7] media: uvcvideo: Limit power line control for
 Quanta UVC Webcam
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Wed, 8 Jun 2022 at 18:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jun 08, 2022 at 02:12:22PM +0200, Ricardo Ribalda wrote:
> > On Wed, 8 Jun 2022 at 08:50, Laurent Pinchart wrote:
> > >
> > > From: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > The device does not implement the power line control correctly. Add a
> > > corresponding control mapping override.
> > >
> > > Bus 001 Device 003: ID 0408:3090 Quanta Computer, Inc. USB2.0 HD UVC WebCam
> > > Device Descriptor:
> > >   bLength                18
> > >   bDescriptorType         1
> > >   bcdUSB               2.00
> > >   bDeviceClass          239 Miscellaneous Device
> > >   bDeviceSubClass         2
> > >   bDeviceProtocol         1 Interface Association
> > >   bMaxPacketSize0        64
> > >   idVendor           0x0408 Quanta Computer, Inc.
> > >   idProduct          0x3090
> > >   bcdDevice            0.04
> > >   iManufacturer           3 Quanta
> > >   iProduct                1 USB2.0 HD UVC WebCam
> > >   iSerial                 2 0x0001
> > >   bNumConfigurations      1
>
> The full descriptors make the commit messages really long, should we
> include the device descriptor only ?

Fine with me, I thought you preferred the whole lsusb -v.

>
> [snip]
>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v3:
> > >
> > > - Turn the power line quirk into a control mapping overrides array
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 31 ++++++++++++++++++++++++++++++
> > >  1 file changed, 31 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 6c86faecbea2..559d8a240f76 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2643,6 +2643,23 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> > >   * Driver initialization and cleanup
> > >   */
> > >
> > > +static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
> > > +       { 1, "50 Hz" },
> > > +       { 2, "60 Hz" },
> > > +};
> > > +
> > > +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> > > +       .id             = V4L2_CID_POWER_LINE_FREQUENCY,
> > > +       .entity         = UVC_GUID_UVC_PROCESSING,
> > > +       .selector       = UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > > +       .size           = 2,
> > > +       .offset         = 0,
> > > +       .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > +       .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > > +       .menu_info      = power_line_frequency_controls_limited,
> > > +       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> > > +};
> > > +
> > >  static const struct uvc_device_info uvc_quirk_probe_minmax = {
> > >         .quirks = UVC_QUIRK_PROBE_MINMAX,
> > >  };
> > > @@ -2673,6 +2690,20 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> > >   * though they are compliant.
> > >   */
> > >  static const struct usb_device_id uvc_ids[] = {
> > > +       /* Quanta USB2.0 HD UVC Webcam */
> > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +         .idVendor             = 0x0408,
> > > +         .idProduct            = 0x3090,
> > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +         .bInterfaceSubClass   = 1,
> > > +         .bInterfaceProtocol   = 0,
> > > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > > +               .mappings = (const struct uvc_control_mapping *[]) {
> > > +                       &uvc_ctrl_power_line_mapping_limited,
> > > +                       NULL, /* Sentinel */
> > > +               },
> > > +         } },
> >
> > What about: ?
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > b/drivers/media/usb/uvc/uvc_driver.c
> > index b8df40546b29..ea8c8d572ef2 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2660,6 +2660,13 @@ static const struct uvc_control_mapping
> > uvc_ctrl_power_line_mapping_limited = {
> >         .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> >  };
> >
> > +static const struct uvc_device_info uvc_power_line_limited = {
> > +       .mappings = (const struct uvc_control_mapping *[]) {
> > +               &uvc_ctrl_power_line_mapping_limited,
> > +               NULL, /* Sentinel */
> > +       },
> > +};
> > +
> >  static const struct uvc_device_info uvc_quirk_probe_minmax = {
> >         .quirks = UVC_QUIRK_PROBE_MINMAX,
> >  };
> > @@ -2698,12 +2705,7 @@ static const struct usb_device_id uvc_ids[] = {
> >           .bInterfaceClass      = USB_CLASS_VIDEO,
> >           .bInterfaceSubClass   = 1,
> >           .bInterfaceProtocol   = 0,
> > -         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > -               .mappings = (const struct uvc_control_mapping *[]) {
> > -                       &uvc_ctrl_power_line_mapping_limited,
> > -                       NULL, /* Sentinel */
> > -               },
> > -         } },
> > +         .driver_info          = (kernel_ulong_t)&uvc_power_line_limited },
>
> Looks good to me. I'll do so.

Or I can do it if you are busy, just let me know what you prefer.

btw, just want to state the obvious here, but with this approach we
cannot quirk the device via modprobe.

What about a mixed approach?, where we leave the quirk, and then in
uvc_ctrl_init_device we patch the mappings? This has also the benefit
that we do not leak the mappings into the uvc_driver.c file

Let me know if you like it and then I send a new version

Regards!

>
> > I can probably test it on real hw today
>
> Thank you.

By today I mean today :P

>
> > >         /* LogiLink Wireless Webcam */
> > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
