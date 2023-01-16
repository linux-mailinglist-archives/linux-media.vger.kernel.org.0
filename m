Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B2566C236
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjAPOch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjAPOcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:32:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BFC4C0CB
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:13:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74363802;
        Mon, 16 Jan 2023 15:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673878369;
        bh=JpETzi6oqwt9jK3MaLrwJFGCr0DukUwxNvcPmN8KXUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s18pfdoPv3NCk5XZiNcAlzq6wojE3YP0QPC5IOqnB/syvNNCqeLPyvjpEyfaWlLPd
         HHAERTRbS/zMvIKxBHQLkEVgyU9jkED7siNU8d5Sr03DYu1fc7mttseIjCJ0Q7YVIh
         csh+iRvwPQgqUJPHyO7Mnl2ZOKIwUhbQEib5HHE4=
Date:   Mon, 16 Jan 2023 16:12:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Giuliano Lotta <giuliano.lotta@gmail.com>,
        "kolbjorn@kodemaker.no" <kolbjorn@kodemaker.no>
Subject: Re: [PATCH] media: uvcvideo: Force UVC version to 1.0a for 0408:4035
Message-ID: <Y8VbYq48+gmmd4rD@pendragon.ideasonboard.com>
References: <20230115205210.20077-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvgxyRGw4EsGtGN5GxB_oCj2FpQgqr7tOUEyjwKSVRocA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Jan 16, 2023 at 02:05:28PM +0100, Ricardo Ribalda wrote:
> On Sun, 15 Jan 2023 at 21:52, Laurent Pinchart wrote:
> >
> > The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
> > implements UVC 1.0a as shown by the UVC probe control being 26 bytes
> > long. Force the UVC version for that device.
> 
> Don't we also want to include 4035:4033 ?

I've asked for the lsusb output for that device, I'll send a separate
patch when I get it.

> I am curious about the PowerLine Control (does it have one?) will it
> behave like 1.1 or 1.5

Good question. Hardcoding the version to 1.0a will not cause an error,
but may prevent the auto mode from being supported.

An alternative would be to automatically fall back to the UVC 1.0a video
probe and commit control when the size returned by GET_CUR differs from
the value expected from UVC 1.5. That would be a generic fix that won't
require quirks. What do you think ?

> Would it be possible to get the output with uvc_debug enabled?

I'll let you tell Giuliano how to provide that :-)

> > Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >
> > Giuliano, I believe you've successfully tested this patch. If so, could
> > you reply with a Tested-by tag ? Just copying the following in your
> > reply will do:
> >
> > Tested-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> >
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 1a186abeb4fa..742eeaff333e 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2429,6 +2429,17 @@ static const struct usb_device_id uvc_ids[] = {
> >           .bInterfaceSubClass   = 1,
> >           .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> >           .driver_info          = (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> > +       /* Quanta ACER HD User Facing */
> > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             = 0x0408,
> > +         .idProduct            = 0x4035,
> > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   = 1,
> > +         .bInterfaceProtocol   = UVC_PC_PROTOCOL_15,
> > +         .driver_info          = (kernel_ulong_t)&(const struct uvc_device_info){
> > +               .uvc_version = 0x010a,
> > +         } },
> >         /* LogiLink Wireless Webcam */
> >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> >
> > base-commit: fd957081cff04668f390c6f290bdcc7fc009a0f1

-- 
Regards,

Laurent Pinchart
