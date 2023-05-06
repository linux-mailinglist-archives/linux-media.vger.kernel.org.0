Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4E56F8FA3
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjEFHId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjEFHIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:08:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAE344A0
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:08:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 769672D8;
        Sat,  6 May 2023 09:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683356902;
        bh=tBP6yqBqRPWdW3X3Kir7PhkzAOQIVrow3uZ7wumGgbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RgUX7w+uej614J8AwqoNcBPlWRlkDB22Iv0Zah8osTEbC5t9BV3KiPUzAfE+3++/D
         dgxRv8NWqriO2GeQgd0+NH1XRniTwERpdwbqVF71wxecfhqSmka6BpNXs16x2vuPBL
         aMXKBGmV0I6mDKviixEJ0Ae3kNq8QpvgZZbGKo58=
Date:   Sat, 6 May 2023 10:08:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: uvcvideo: Don't expose unsupported formats to
 userspace
Message-ID: <20230506070837.GA30711@pendragon.ideasonboard.com>
References: <20230420100750.10463-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCvo4oX2DmdXApofiJybCrf+Dhj4-jtmUnmU+UfgUw0fhA@mail.gmail.com>
 <20230501120129.GB21559@pendragon.ideasonboard.com>
 <CANiDSCug07u1kHPm0Q1dHrTo_zZRqsHRKn42sFXpFjqkjAansg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCug07u1kHPm0Q1dHrTo_zZRqsHRKn42sFXpFjqkjAansg@mail.gmail.com>
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

On Mon, May 01, 2023 at 03:22:16PM +0200, Ricardo Ribalda wrote:
> On Mon, 1 May 2023 at 14:01, Laurent Pinchart wrote:
> > On Mon, May 01, 2023 at 01:44:11PM +0200, Ricardo Ribalda wrote:
> > > Hi Laurent
> > >
> > > I agree with the intent of the patch but am not sure that this will work.
> > >
> > > Regards!
> > >
> > > On Thu, 20 Apr 2023 at 12:07, Laurent Pinchart wrote:
> > > >
> > > > When the uvcvideo driver encounters a format descriptor with an unknown
> > > > format GUID, it creates a corresponding struct uvc_format instance with
> > > > the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
> > > > Remove format descriptions"), the driver relies on the V4L2 core to
> > > > provide the format description string, which the V4L2 core can't do
> > > > without a valid 4CC. This triggers a WARN_ON.
> > > >
> > > > As a format with a zero 4CC can't be selected, it is unusable for
> > > > applications. Ignore the format completely without creating a uvc_format
> > > > instance, which fixes the warning.
> > > >
> > > > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
> > > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index de64c9d789fd..25b8199f4e82 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
> > > >                 /* Find the format descriptor from its GUID. */
> > > >                 fmtdesc = uvc_format_by_guid(&buffer[5]);
> > > >
> > > > -               if (fmtdesc != NULL) {
> > > > -                       format->fcc = fmtdesc->fcc;
> > > > -               } else {
> > > > +               if (!fmtdesc) {
> > > > +                       /*
> > > > +                        * Unknown video formats are not fatal errors, the
> > > > +                        * caller will skip this descriptor.
> > > > +                        */
> > > >                         dev_info(&streaming->intf->dev,
> > > >                                  "Unknown video format %pUl\n", &buffer[5]);
> > > > -                       format->fcc = 0;
> > > > +                       return 0;
> > > >                 }
> > > >
> > > > +               format->fcc = fmtdesc->fcc;
> > > >                 format->bpp = buffer[21];
> > > >
> > > >                 /*
> > > > @@ -689,6 +692,8 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> > > >                                 &interval, buffer, buflen);
> > >
> > > For devices with unknown formats streaming->nformats will not be
> > > valid, it will be higher than the actual formats on
> > > streaming->formats.
> >
> > Indeed. I think this could be handled quite simply:
> 
> We will still be overallocating. I guess it is not a big deal...
> 
> But what about a helper function.  I think it will be less hacky
> 
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..b49c2b911d03 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -483,6 +483,33 @@ static int uvc_parse_format(struct uvc_device *dev,
>         return buffer - start;
>  }
> 
> +static bool is_valid_format(unsigned char *buffer, unsigned int buflen)
> +{
> +       if (buflen < 2)
> +               return false;
> +
> +       switch (buffer[2]) {
> +       case UVC_VS_FORMAT_UNCOMPRESSED:
> +       case UVC_VS_FORMAT_MJPEG:
> +       case UVC_VS_FORMAT_DV:
> +       case UVC_VS_FORMAT_FRAME_BASED:
> +       {
> +               const struct uvc_format_desc *fmtdesc;
> +
> +               if (buflen < 6)

Not the right length.

> +                       return false;
> +               fmtdesc = uvc_format_by_guid(&buffer[5]);

This isn't quite right for MJPEG and DV.

Honestly, I'm not sure I would bother. We're overallocating only for
devices that expose non-supported formats. That's a very small minority
of devices, the extra memory is quite small, and we should instead add
support for those formats anyway.

> +               if (!fmtdesc)
> +                       return false;
> +               return true;
> +       }
> +       default:
> +               break;
> +       }
> +
> +       return false;
> +}
> +
>  static int uvc_parse_streaming(struct uvc_device *dev,
>         struct usb_interface *intf)
>  {
> @@ -613,19 +640,15 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> 
>         /* Count the format and frame descriptors. */
>         while (_buflen > 2 && _buffer[1] == USB_DT_CS_INTERFACE) {
> -               switch (_buffer[2]) {
> -               case UVC_VS_FORMAT_UNCOMPRESSED:
> -               case UVC_VS_FORMAT_MJPEG:
> -               case UVC_VS_FORMAT_FRAME_BASED:
> +               if (is_valid_format(_buffer, _buflen))
>                         nformats++;
> -                       break;
> 
> +               switch (_buffer[2]) {
>                 case UVC_VS_FORMAT_DV:
>                         /*
>                          * DV format has no frame descriptor. We will create a
>                          * dummy frame descriptor with a dummy frame interval.
>                          */
> -                       nformats++;
>                         nframes++;
>                         nintervals++;
>                         break;
> @@ -679,11 +702,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> 
>         /* Parse the format descriptors. */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> -               switch (buffer[2]) {
> -               case UVC_VS_FORMAT_UNCOMPRESSED:
> -               case UVC_VS_FORMAT_MJPEG:
> -               case UVC_VS_FORMAT_DV:
> -               case UVC_VS_FORMAT_FRAME_BASED:
> +               if (!is_valid_format(buffer, buflen)) {
>                         format->frame = frame;
>                         ret = uvc_parse_format(dev, streaming, format,
>                                 &interval, buffer, buflen);
> @@ -692,13 +711,6 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> 
>                         frame += format->nframes;
>                         format++;
> -
> -                       buflen -= ret;
> -                       buffer += ret;
> -                       continue;
> -
> -               default:
> -                       break;
>                 }
> 
>                 buflen -= buffer[0];
> 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index d966d003632b..cc6608eb3ab9 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -679,7 +679,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >         interval = (u32 *)&frame[nframes];
> >
> >         streaming->formats = format;
> > -       streaming->nformats = nformats;
> > +       streaming->nformats = 0;
> >
> >         /* Parse the format descriptors. */
> >         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> > @@ -695,6 +695,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
> >                         if (!ret)
> >                                 break;
> >
> > +                       streaming->nformats++;
> >                         frame += format->nframes;
> >                         format++;
> >
> > What do you think ? I can submit a v2 with this change.
> >
> > > >                         if (ret < 0)
> > > >                                 goto error;
> > > > +                       if (!ret)
> > > > +                               break;
> > > >
> > > >                         frame += format->nframes;
> > > >                         format++;

-- 
Regards,

Laurent Pinchart
