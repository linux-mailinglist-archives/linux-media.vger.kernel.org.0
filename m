Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A9D5446C6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 10:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbiFII6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 04:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239963AbiFII51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 04:57:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3607E163286
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 01:57:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934346CF;
        Thu,  9 Jun 2022 10:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654765027;
        bh=q/gomSHDloupXK+WOgUD9UjfL8G/4EJ8bTP9ZWE+PKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EoEdJCGMp7z0XBTlIWNlFiMeZ3HqnPsX31zPd0XJ85JA5n85qDueErIUHwazm137b
         CTWevxrWZ5tiADL4Pd0KPXIzPCxJtMBERyvD2vMYti7Dqc/mzEcyPGZeAdeVHipHtm
         w+GF2VYzcSzZgMoxcQArmzHD39qtXuHtjlpI2KaI=
Date:   Thu, 9 Jun 2022 11:57:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: Re: [RFC PATCH v4 3/7] media: uvcvideo: Limit power line control for
 Quanta UVC Webcam
Message-ID: <YqG13RtTkRdH23l3@pendragon.ideasonboard.com>
References: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
 <20220608065005.23014-4-laurent.pinchart@ideasonboard.com>
 <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com>
 <YqDVEptwfUf86Ipw@pendragon.ideasonboard.com>
 <CANiDSCteYePgP6qad84POE6NU2Dn20aAKUfFaxvLp0kPvwXqig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCteYePgP6qad84POE6NU2Dn20aAKUfFaxvLp0kPvwXqig@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Jun 09, 2022 at 08:54:56AM +0200, Ricardo Ribalda wrote:
> On Wed, 8 Jun 2022 at 18:58, Laurent Pinchart wrote:
> > On Wed, Jun 08, 2022 at 02:12:22PM +0200, Ricardo Ribalda wrote:
> > > On Wed, 8 Jun 2022 at 08:50, Laurent Pinchart wrote:
> > > >
> > > > From: Ricardo Ribalda <ribalda@chromium.org>
> > > >
> > > > The device does not implement the power line control correctly. Add a
> > > > corresponding control mapping override.
> > > >
> > > > Bus 001 Device 003: ID 0408:3090 Quanta Computer, Inc. USB2.0 HD UVC WebCam
> > > > Device Descriptor:
> > > >   bLength                18
> > > >   bDescriptorType         1
> > > >   bcdUSB               2.00
> > > >   bDeviceClass          239 Miscellaneous Device
> > > >   bDeviceSubClass         2
> > > >   bDeviceProtocol         1 Interface Association
> > > >   bMaxPacketSize0        64
> > > >   idVendor           0x0408 Quanta Computer, Inc.
> > > >   idProduct          0x3090
> > > >   bcdDevice            0.04
> > > >   iManufacturer           3 Quanta
> > > >   iProduct                1 USB2.0 HD UVC WebCam
> > > >   iSerial                 2 0x0001
> > > >   bNumConfigurations      1
> >
> > The full descriptors make the commit messages really long, should we
> > include the device descriptor only ?
> 
> Fine with me, I thought you preferred the whole lsusb -v.

I usually request it, but it doesn't have to be in the commit message
:-)

> > [snip]
> >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v3:
> > > >
> > > > - Turn the power line quirk into a control mapping overrides array
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 31 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 31 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 6c86faecbea2..559d8a240f76 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2643,6 +2643,23 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> > > >   * Driver initialization and cleanup
> > > >   */
> > > >
> > > > +static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
> > > > +       { 1, "50 Hz" },
> > > > +       { 2, "60 Hz" },
> > > > +};
> > > > +
> > > > +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> > > > +       .id             = V4L2_CID_POWER_LINE_FREQUENCY,
> > > > +       .entity         = UVC_GUID_UVC_PROCESSING,
> > > > +       .selector       = UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > > > +       .size           = 2,
> > > > +       .offset         = 0,
> > > > +       .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > > +       .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > > > +       .menu_info      = power_line_frequency_controls_limited,
> > > > +       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> > > > +};
> > > > +
> > > >  static const struct uvc_device_info uvc_quirk_probe_minmax = {
> > > >         .quirks = UVC_QUIRK_PROBE_MINMAX,
> > > >  };
> > > > @@ -2673,6 +2690,20 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> > > >   * though they are compliant.
> > > >   */
> > > >  static const struct usb_device_id uvc_ids[] = {
> > > > +       /* Quanta USB2.0 HD UVC Webcam */
> > > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > > +         .idVendor             = 0x0408,
> > > > +         .idProduct            = 0x3090,
> > > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > > +         .bInterfaceSubClass   = 1,
> > > > +         .bInterfaceProtocol   = 0,
> > > > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > > > +               .mappings = (const struct uvc_control_mapping *[]) {
> > > > +                       &uvc_ctrl_power_line_mapping_limited,
> > > > +                       NULL, /* Sentinel */
> > > > +               },
> > > > +         } },
> > >
> > > What about: ?
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c
> > > b/drivers/media/usb/uvc/uvc_driver.c
> > > index b8df40546b29..ea8c8d572ef2 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -2660,6 +2660,13 @@ static const struct uvc_control_mapping
> > > uvc_ctrl_power_line_mapping_limited = {
> > >         .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> > >  };
> > >
> > > +static const struct uvc_device_info uvc_power_line_limited = {
> > > +       .mappings = (const struct uvc_control_mapping *[]) {
> > > +               &uvc_ctrl_power_line_mapping_limited,
> > > +               NULL, /* Sentinel */
> > > +       },
> > > +};
> > > +
> > >  static const struct uvc_device_info uvc_quirk_probe_minmax = {
> > >         .quirks = UVC_QUIRK_PROBE_MINMAX,
> > >  };
> > > @@ -2698,12 +2705,7 @@ static const struct usb_device_id uvc_ids[] = {
> > >           .bInterfaceClass      = USB_CLASS_VIDEO,
> > >           .bInterfaceSubClass   = 1,
> > >           .bInterfaceProtocol   = 0,
> > > -         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > > -               .mappings = (const struct uvc_control_mapping *[]) {
> > > -                       &uvc_ctrl_power_line_mapping_limited,
> > > -                       NULL, /* Sentinel */
> > > -               },
> > > -         } },
> > > +         .driver_info          = (kernel_ulong_t)&uvc_power_line_limited },
> >
> > Looks good to me. I'll do so.
> 
> Or I can do it if you are busy, just let me know what you prefer.

I'll send v5 shortly.

> btw, just want to state the obvious here, but with this approach we
> cannot quirk the device via modprobe.
> 
> What about a mixed approach?, where we leave the quirk, and then in
> uvc_ctrl_init_device we patch the mappings? This has also the benefit
> that we do not leak the mappings into the uvc_driver.c file

The trouble with quirks is that they don't scale, I don't want to see a
quirk per control.

> Let me know if you like it and then I send a new version
> 
> > > I can probably test it on real hw today
> >
> > Thank you.
> 
> By today I mean today :P
> 
> > > >         /* LogiLink Wireless Webcam */
> > > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart
