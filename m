Return-Path: <linux-media+bounces-21079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF79C0E2D
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 19:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE5B1C20922
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C47F21733C;
	Thu,  7 Nov 2024 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wu8dSztW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C321731C
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731005919; cv=none; b=OrD+cCXfN8Id0DKRlh3w2iBvTmyhwXk1lf0RS16ADt6SqRQrrJ0owmyBDpXmJO+23RyswngL4vsInpDH7y+WT0WebehF1rShBhOpX9XfPWGO5RtGXPxbrte738I1JXqg3y1tEdlwSNy5L4q4NUi3OhZOGPpRWKhOyBvlUGoDMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731005919; c=relaxed/simple;
	bh=aL0FXBlXDct4mACCqYhWpP+MI/ndaBFJ3rorOft7Fmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjXHhJahsSp+0R1pUpDja4J2P0GdWcsjE5dwjicN4QRmkMfkV1ttcXdQaOvJv0vEt/V2a0rmZeOye1LN8OAkRjQLRxIFMhJqJb+PcGJaWstdNyNcy+FBl2TsPn60dSXQR1EB99s8JWNA+fIQS4A6jFkJT65kN0m7Ouh67lN4drQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wu8dSztW; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbd57cc35bso20756266d6.1
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 10:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731005916; x=1731610716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sAnikxqMhFBWiIpiSOaJWJGT3hN3HyySsAKToxV5iU=;
        b=wu8dSztWoEF/wfRoyUpmflmHOzW4LQaLmtEaq9NAJwq0/5fN32P7kV6FFm3N4QUNnl
         2Z9IHhzccYP1Y1AYHZSGtzFUCt4pIQzopftgnNjrfY021C+EoLCC55jnZKWwkvbpef4h
         k5DLmInVeJk/JnTO1sV+0U36tUahQxHaZUEw+BauMNCoyOBWLEZdIQMcE2l35ozFcSc+
         RZAPedtxX86KOC437mNt+fF4DJvat5aMsPcHkeujxS7Hx6XqhlTcgRdKKQkU4rZN/8BD
         59l4dHys/SvYP9xKnPMOi30KxBeEQk+H2cwDoS4RCWO3r6IZj+kY6jlG+BxkE44mttfz
         6Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731005916; x=1731610716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sAnikxqMhFBWiIpiSOaJWJGT3hN3HyySsAKToxV5iU=;
        b=gEXHQU9Zac7wbQBlUPb4NCg0DG1zcy+HkGlQafTXuWZzcPF2ljbZ5itxfo/ZFREcIu
         TMVHtx/msA26FdB3dQIF6cYkU6IHdbbShWKhO6xoLMtwP9cM5+LqjFp5bnuaaJz6+Asl
         7XY10w1hA36WSR3xs/Dhx9lpU5ycinEhbNGi6kGogSa/qB+5PYitlXKKe1ZyAN4ewfcA
         U9W+MJSnITgQiQ0PoRwt3goupxMvFB2ZmlG/jxMcoxwVSC9P3+PldfJioHDYdsWydhvR
         lZfzsUTflD82rzSDXAO74RkzRKlRWZUq2xbHNiSpSTz9fuI5h3+1GaZ17QnjPkgUEUfJ
         lBVw==
X-Gm-Message-State: AOJu0YyJnD2cnLMqy+FH3BtPXNDz13PmGKaAndRpp/09xm2WB6QPzZWp
	5hxjXLs9VOdzoclnz1x0gshAdqUBpkUNZQDowJ+5zN4BX/C5Cu8bleENHCScrGeP5P0SKOLHW3T
	+uakpNdaQiTaOVz5cZIQZ06rfunztjUoeHSfM
X-Google-Smtp-Source: AGHT+IEL3YTEibXOOjCza4SyzjeJ5wPQeVMm4qvgpwi8UhRXZp2OsHnVG8RCSe8MEB6QuMB5uPYZ7qsqNNiwgDUr6Zg=
X-Received: by 2002:a05:6214:3a0a:b0:6cb:49d2:c700 with SMTP id
 6a1803df08f44-6d39d66ff06mr8893846d6.22.1731005914224; Thu, 07 Nov 2024
 10:58:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107142204.1182969-1-bsevens@google.com> <20241107142204.1182969-3-bsevens@google.com>
 <20241107164556.GE31474@pendragon.ideasonboard.com>
In-Reply-To: <20241107164556.GE31474@pendragon.ideasonboard.com>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Thu, 7 Nov 2024 19:58:22 +0100
Message-ID: <CAGCho0VcBO0aqyf3mc9M1Y=brNgg1ynURuzGie8Moyhf02cBHQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: uvcvideo: Refactor frame parsing code into
 a uvc_parse_frame function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review, Laurent.

On Thu, 7 Nov 2024 at 17:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Beno=C3=AEt,
>
> Thank you for the patch.
>
> On Thu, Nov 07, 2024 at 02:22:03PM +0000, Benoit Sevens wrote:
> > The ftype value does not change in the while loop so we can check it
> > before entering the while loop. Refactoring the frame parsing code into
> > a dedicated uvc_parse_frame function makes this more readable.
> >
> > Signed-off-by: Benoit Sevens <bsevens@google.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 228 ++++++++++++++++-------------
> >  1 file changed, 123 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index 13db0026dc1a..99f811ace5d6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -220,6 +220,117 @@ static struct uvc_streaming *uvc_stream_new(struc=
t uvc_device *dev,
> >   * Descriptors parsing
> >   */
> >
> > +static int uvc_parse_frame(struct uvc_device *dev, struct uvc_streamin=
g *streaming,
> > +             struct uvc_format *format, struct uvc_frame *frame, u32 *=
*intervals,
> > +             u8 ftype, int width_multiplier, const unsigned char *buff=
er, int buflen)
> > +{
> > +     struct usb_interface *intf =3D streaming->intf;
> > +     struct usb_host_interface *alts =3D intf->cur_altsetting;
>
> The intf variable is only used here, so you can write
>
>         struct usb_host_interface *alts =3D streaming->intf->cur_altsetti=
ng;
>
> > +     unsigned int i, n;
> > +     unsigned int interval;
> > +     unsigned int maxIntervalIndex;
>
> We usually sort variables in (more or less) decreasing line length order
> if nothing makes that inpractical.
>
> > +
> > +     if (ftype !=3D UVC_VS_FRAME_FRAME_BASED)
> > +             n =3D buflen > 25 ? buffer[25] : 0;
> > +     else
> > +             n =3D buflen > 21 ? buffer[21] : 0;
> > +
> > +     n =3D n ? n : 3;
> > +
> > +     if (buflen < 26 + 4*n) {
> > +             uvc_dbg(dev, DESCR,
> > +                     "device %d videostreaming interface %d FRAME erro=
r\n",
> > +                     dev->udev->devnum,
> > +                     alts->desc.bInterfaceNumber);
>
> We can now reflow the code as the indentation level has decreased, for in=
stance
>
>                         dev->udev->devnum, alts->desc.bInterfaceNumber);
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     frame->bFrameIndex =3D buffer[3];
> > +     frame->bmCapabilities =3D buffer[4];
> > +     frame->wWidth =3D get_unaligned_le16(&buffer[5])
> > +                   * width_multiplier;
> > +     frame->wHeight =3D get_unaligned_le16(&buffer[7]);
> > +     frame->dwMinBitRate =3D get_unaligned_le32(&buffer[9]);
> > +     frame->dwMaxBitRate =3D get_unaligned_le32(&buffer[13]);
> > +     if (ftype !=3D UVC_VS_FRAME_FRAME_BASED) {
> > +             frame->dwMaxVideoFrameBufferSize =3D
> > +                     get_unaligned_le32(&buffer[17]);
> > +             frame->dwDefaultFrameInterval =3D
> > +                     get_unaligned_le32(&buffer[21]);
> > +             frame->bFrameIntervalType =3D buffer[25];
> > +     } else {
> > +             frame->dwMaxVideoFrameBufferSize =3D 0;
> > +             frame->dwDefaultFrameInterval =3D
> > +                     get_unaligned_le32(&buffer[17]);
> > +             frame->bFrameIntervalType =3D buffer[21];
> > +     }
> > +
> > +     /*
> > +      * Copy the frame intervals.
> > +      *
> > +      * Some bogus devices report dwMinFrameInterval equal to
> > +      * dwMaxFrameInterval and have dwFrameIntervalStep set to
> > +      * zero. Setting all null intervals to 1 fixes the problem and
> > +      * some other divisions by zero that could happen.
> > +      */
> > +     frame->dwFrameInterval =3D *intervals;
> > +
> > +     for (i =3D 0; i < n; ++i) {
> > +             interval =3D get_unaligned_le32(&buffer[26+4*i]);
> > +             (*intervals)[i] =3D interval ? interval : 1;
> > +     }
> > +
> > +     /*
> > +      * Apply more fixes, quirks and workarounds to handle incorrect
> > +      * or broken descriptors.
> > +      */
> > +
> > +     /*
> > +      * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
> > +      * completely. Observed behaviours range from setting the
> > +      * value to 1.1x the actual frame size to hardwiring the
> > +      * 16 low bits to 0. This results in a higher than necessary
> > +      * memory usage as well as a wrong image size information. For
> > +      * uncompressed formats this can be fixed by computing the
> > +      * value from the frame size.
> > +      */
> > +     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> > +             frame->dwMaxVideoFrameBufferSize =3D format->bpp
> > +                     * frame->wWidth * frame->wHeight / 8;
> > +
> > +     /*
> > +      * Clamp the default frame interval to the boundaries. A zero
> > +      * bFrameIntervalType value indicates a continuous frame
> > +      * interval range, with dwFrameInterval[0] storing the minimum
> > +      * value and dwFrameInterval[1] storing the maximum value.
> > +      */
> > +     maxIntervalIndex =3D frame->bFrameIntervalType ? n - 1 : 1;
> > +     frame->dwDefaultFrameInterval =3D
> > +             clamp(frame->dwDefaultFrameInterval,
> > +                   frame->dwFrameInterval[0],
> > +                   frame->dwFrameInterval[maxIntervalIndex]);
> > +
> > +     /*
> > +      * Some devices report frame intervals that are not functional.
> > +      * If the corresponding quirk is set, restrict operation to the
> > +      * first interval only.
> > +      */
> > +     if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
> > +             frame->bFrameIntervalType =3D 1;
> > +             (*intervals)[0] =3D frame->dwDefaultFrameInterval;
> > +     }
> > +
> > +     uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> > +             frame->wWidth, frame->wHeight,
> > +             10000000 / frame->dwDefaultFrameInterval,
> > +             (100000000 / frame->dwDefaultFrameInterval) % 10);
> > +
> > +     *intervals +=3D n;
> > +
> > +     return buffer[0];
> > +}
> > +
> > +
> >  static int uvc_parse_format(struct uvc_device *dev,
> >       struct uvc_streaming *streaming, struct uvc_format *format,
> >       struct uvc_frame *frames, u32 **intervals, const unsigned char *b=
uffer,
> > @@ -231,9 +342,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>
> While at it, we can also merge the intf and alts variables here too.
>
> With this addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I can make all those small changes locally when applying the patch,
> unless you prefer submitting a new version yourself.

If you can do those changes on your side, that would be great, thanks!

>
> >       struct uvc_frame *frame;
> >       const unsigned char *start =3D buffer;
> >       unsigned int width_multiplier =3D 1;
> > -     unsigned int interval;
> >       unsigned int i, n;
> >       u8 ftype;
> > +     int ret;
> >
> >       format->type =3D buffer[2];
> >       format->index =3D buffer[3];
> > @@ -371,111 +482,18 @@ static int uvc_parse_format(struct uvc_device *d=
ev,
> >        * Parse the frame descriptors. Only uncompressed, MJPEG and fram=
e
> >        * based formats have frame descriptors.
> >        */
> > -     while (ftype && buflen > 2 && buffer[1] =3D=3D USB_DT_CS_INTERFAC=
E &&
> > -            buffer[2] =3D=3D ftype) {
> > -             unsigned int maxIntervalIndex;
> > -
> > -             frame =3D &frames[format->nframes];
> > -             if (ftype !=3D UVC_VS_FRAME_FRAME_BASED)
> > -                     n =3D buflen > 25 ? buffer[25] : 0;
> > -             else
> > -                     n =3D buflen > 21 ? buffer[21] : 0;
> > -
> > -             n =3D n ? n : 3;
> > -
> > -             if (buflen < 26 + 4*n) {
> > -                     uvc_dbg(dev, DESCR,
> > -                             "device %d videostreaming interface %d FR=
AME error\n",
> > -                             dev->udev->devnum,
> > -                             alts->desc.bInterfaceNumber);
> > -                     return -EINVAL;
> > -             }
> > -
> > -             frame->bFrameIndex =3D buffer[3];
> > -             frame->bmCapabilities =3D buffer[4];
> > -             frame->wWidth =3D get_unaligned_le16(&buffer[5])
> > -                           * width_multiplier;
> > -             frame->wHeight =3D get_unaligned_le16(&buffer[7]);
> > -             frame->dwMinBitRate =3D get_unaligned_le32(&buffer[9]);
> > -             frame->dwMaxBitRate =3D get_unaligned_le32(&buffer[13]);
> > -             if (ftype !=3D UVC_VS_FRAME_FRAME_BASED) {
> > -                     frame->dwMaxVideoFrameBufferSize =3D
> > -                             get_unaligned_le32(&buffer[17]);
> > -                     frame->dwDefaultFrameInterval =3D
> > -                             get_unaligned_le32(&buffer[21]);
> > -                     frame->bFrameIntervalType =3D buffer[25];
> > -             } else {
> > -                     frame->dwMaxVideoFrameBufferSize =3D 0;
> > -                     frame->dwDefaultFrameInterval =3D
> > -                             get_unaligned_le32(&buffer[17]);
> > -                     frame->bFrameIntervalType =3D buffer[21];
> > -             }
> > -
> > -             /*
> > -              * Copy the frame intervals.
> > -              *
> > -              * Some bogus devices report dwMinFrameInterval equal to
> > -              * dwMaxFrameInterval and have dwFrameIntervalStep set to
> > -              * zero. Setting all null intervals to 1 fixes the proble=
m and
> > -              * some other divisions by zero that could happen.
> > -              */
> > -             frame->dwFrameInterval =3D *intervals;
> > -
> > -             for (i =3D 0; i < n; ++i) {
> > -                     interval =3D get_unaligned_le32(&buffer[26+4*i]);
> > -                     (*intervals)[i] =3D interval ? interval : 1;
> > -             }
> > -
> > -             /*
> > -              * Apply more fixes, quirks and workarounds to handle inc=
orrect
> > -              * or broken descriptors.
> > -              */
> > -
> > -             /*
> > -              * Several UVC chipsets screw up dwMaxVideoFrameBufferSiz=
e
> > -              * completely. Observed behaviours range from setting the
> > -              * value to 1.1x the actual frame size to hardwiring the
> > -              * 16 low bits to 0. This results in a higher than necess=
ary
> > -              * memory usage as well as a wrong image size information=
. For
> > -              * uncompressed formats this can be fixed by computing th=
e
> > -              * value from the frame size.
> > -              */
> > -             if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> > -                     frame->dwMaxVideoFrameBufferSize =3D format->bpp
> > -                             * frame->wWidth * frame->wHeight / 8;
> > -
> > -             /*
> > -              * Clamp the default frame interval to the boundaries. A =
zero
> > -              * bFrameIntervalType value indicates a continuous frame
> > -              * interval range, with dwFrameInterval[0] storing the mi=
nimum
> > -              * value and dwFrameInterval[1] storing the maximum value=
.
> > -              */
> > -             maxIntervalIndex =3D frame->bFrameIntervalType ? n - 1 : =
1;
> > -             frame->dwDefaultFrameInterval =3D
> > -                     clamp(frame->dwDefaultFrameInterval,
> > -                           frame->dwFrameInterval[0],
> > -                           frame->dwFrameInterval[maxIntervalIndex]);
> > -
> > -             /*
> > -              * Some devices report frame intervals that are not funct=
ional.
> > -              * If the corresponding quirk is set, restrict operation =
to the
> > -              * first interval only.
> > -              */
> > -             if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
> > -                     frame->bFrameIntervalType =3D 1;
> > -                     (*intervals)[0] =3D frame->dwDefaultFrameInterval=
;
> > +     if (ftype) {
> > +             while (buflen > 2 && buffer[1] =3D=3D USB_DT_CS_INTERFACE=
 &&
> > +                    buffer[2] =3D=3D ftype) {
> > +                     frame =3D &frames[format->nframes];
> > +                     ret =3D uvc_parse_frame(dev, streaming, format, f=
rame, intervals, ftype,
> > +                                     width_multiplier, buffer, buflen)=
;
> > +                     if (ret < 0)
> > +                             return ret;
> > +                     format->nframes++;
> > +                     buflen -=3D ret;
> > +                     buffer +=3D ret;
> >               }
> > -
> > -             uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> > -                     frame->wWidth, frame->wHeight,
> > -                     10000000 / frame->dwDefaultFrameInterval,
> > -                     (100000000 / frame->dwDefaultFrameInterval) % 10)=
;
> > -
> > -             format->nframes++;
> > -             *intervals +=3D n;
> > -
> > -             buflen -=3D buffer[0];
> > -             buffer +=3D buffer[0];
> >       }
> >
> >       if (buflen > 2 && buffer[1] =3D=3D USB_DT_CS_INTERFACE &&
>
> --
> Regards,
>
> Laurent Pinchart

