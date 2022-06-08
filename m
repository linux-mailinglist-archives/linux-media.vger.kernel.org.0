Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD2A543A11
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 19:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiFHRPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 13:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiFHRNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 13:13:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8905401BCA
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 09:58:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 841F3501;
        Wed,  8 Jun 2022 18:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654707479;
        bh=3+339reuVLCUeS+IyP9sSaiLKUJiTxa8hXQN9itP7Iw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dc+Y2A4AEzwPmRYixJTVaTJi6G/eMNW4DjyDV80dCo8fmp1Z0jhk4lgMo4Kbn1ly8
         M5fjI34tPC9x1U4FoFtoNy1+StIOB22R2QeJXIzseieszjLFmsaZUGE53Fdpq+FANa
         IcZ1kdtvzjeFzxyGzLGTZlLU35zVSbugt4Qri7oQ=
Date:   Wed, 8 Jun 2022 19:57:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: Re: [RFC PATCH v4 3/7] media: uvcvideo: Limit power line control for
 Quanta UVC Webcam
Message-ID: <YqDVEptwfUf86Ipw@pendragon.ideasonboard.com>
References: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
 <20220608065005.23014-4-laurent.pinchart@ideasonboard.com>
 <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCs5NKmR=-Efd=2kMXdwPvCeFk6AmVRZfAhJKdqpg78o=g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Wed, Jun 08, 2022 at 02:12:22PM +0200, Ricardo Ribalda wrote:
> On Wed, 8 Jun 2022 at 08:50, Laurent Pinchart wrote:
> >
> > From: Ricardo Ribalda <ribalda@chromium.org>
> >
> > The device does not implement the power line control correctly. Add a
> > corresponding control mapping override.
> >
> > Bus 001 Device 003: ID 0408:3090 Quanta Computer, Inc. USB2.0 HD UVC WebCam
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.00
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x0408 Quanta Computer, Inc.
> >   idProduct          0x3090
> >   bcdDevice            0.04
> >   iManufacturer           3 Quanta
> >   iProduct                1 USB2.0 HD UVC WebCam
> >   iSerial                 2 0x0001
> >   bNumConfigurations      1

The full descriptors make the commit messages really long, should we
include the device descriptor only ?

[snip]

> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v3:
> >
> > - Turn the power line quirk into a control mapping overrides array
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 31 ++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 6c86faecbea2..559d8a240f76 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2643,6 +2643,23 @@ MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> >   * Driver initialization and cleanup
> >   */
> >
> > +static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
> > +       { 1, "50 Hz" },
> > +       { 2, "60 Hz" },
> > +};
> > +
> > +static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
> > +       .id             = V4L2_CID_POWER_LINE_FREQUENCY,
> > +       .entity         = UVC_GUID_UVC_PROCESSING,
> > +       .selector       = UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > +       .size           = 2,
> > +       .offset         = 0,
> > +       .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > +       .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > +       .menu_info      = power_line_frequency_controls_limited,
> > +       .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
> > +};
> > +
> >  static const struct uvc_device_info uvc_quirk_probe_minmax = {
> >         .quirks = UVC_QUIRK_PROBE_MINMAX,
> >  };
> > @@ -2673,6 +2690,20 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
> >   * though they are compliant.
> >   */
> >  static const struct usb_device_id uvc_ids[] = {
> > +       /* Quanta USB2.0 HD UVC Webcam */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             = 0x0408,
> > +         .idProduct            = 0x3090,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = 0,
> > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > +               .mappings = (const struct uvc_control_mapping *[]) {
> > +                       &uvc_ctrl_power_line_mapping_limited,
> > +                       NULL, /* Sentinel */
> > +               },
> > +         } },
> 
> What about: ?
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index b8df40546b29..ea8c8d572ef2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2660,6 +2660,13 @@ static const struct uvc_control_mapping
> uvc_ctrl_power_line_mapping_limited = {
>         .menu_count     = ARRAY_SIZE(power_line_frequency_controls_limited),
>  };
> 
> +static const struct uvc_device_info uvc_power_line_limited = {
> +       .mappings = (const struct uvc_control_mapping *[]) {
> +               &uvc_ctrl_power_line_mapping_limited,
> +               NULL, /* Sentinel */
> +       },
> +};
> +
>  static const struct uvc_device_info uvc_quirk_probe_minmax = {
>         .quirks = UVC_QUIRK_PROBE_MINMAX,
>  };
> @@ -2698,12 +2705,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceClass      = USB_CLASS_VIDEO,
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
> -         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> -               .mappings = (const struct uvc_control_mapping *[]) {
> -                       &uvc_ctrl_power_line_mapping_limited,
> -                       NULL, /* Sentinel */
> -               },
> -         } },
> +         .driver_info          = (kernel_ulong_t)&uvc_power_line_limited },

Looks good to me. I'll do so.

> I can probably test it on real hw today

Thank you.

> >         /* LogiLink Wireless Webcam */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart
