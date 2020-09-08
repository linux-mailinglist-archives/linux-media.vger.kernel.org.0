Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCC4261CFE
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732233AbgIHT3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbgIHP7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:59:53 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F0FC0617A3
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 08:53:56 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id p6so11562655ybk.10
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMKNLrzDF7/sPPEU8y1v2n71gknBmnCmkI9dRZPe674=;
        b=tBb9RkBT7PkAZehXVkxlLKQ2DjH/kenKlBga9GRbuu7F0OeOyC+9Zl11tM2QpNlVDB
         xI4fS0ucuz3JCcJSUuTBaAJdW4RCLW505trAdJp59wF2jThAwWora+hTDxyPcoTpFZA3
         mp5Q0KhKBXV9HPDb7cZWgGxhDeIBIuwjqUBlHcoHraklkr09Psgr5q+9dutdu1sHtyHy
         rxGY79ETynm25Hc3tDaWsx+STSN8YCyXo9ho28BRnrS986TZduTIuYYvV14dD55EhWSu
         En3xhVaHbWkPOSCLBs6TxGq2Mn1RQvCFnsuA1vKfwzzmNPnmAvQ7AT5Q8GVIrHMLu2eL
         fhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMKNLrzDF7/sPPEU8y1v2n71gknBmnCmkI9dRZPe674=;
        b=LvyNR2QFFQoovtllpTwijr9dZ6xToA4biLq5XBG2sS4f99zz/MEUJaLfVmnBRit8wT
         00MghM3WxKt7t61b4mxbFDwmYW8x3NKY9BusabuUfOP92VynQ3eGlXofJ5m7d33RG9T+
         6ZcFp/RZAnSHBL67vajG5cedCpH/IYJpDo3zCgqbF/BxDtT/mx2/eELlXixYOs07qjde
         XbtNhyon/ER6TcJaZL2ObYr8X1EWlSixYCYn2Ym4pY8FOGUcqXmmfXS6ChhctAryfzRS
         4w1zq/bLPzW7NqDnpvWUX7FjGTjtjyxRtFlLoN7dcoKYbj3ySx4ahvcWFkk57MIRAFnz
         pOKg==
X-Gm-Message-State: AOAM531cC80D0V0jzmQjPk12TnHs7uTz8H/T7PgCyG8jUutsrUlZtabA
        vI2dmvtLsJRZf3y7pPjZfWA/0u6fGZb/eodxtEEW4A==
X-Google-Smtp-Source: ABdhPJzdMvfsa/IlOorKdDsqGAkDpoCCXep7yMjMOixUz2SkSrRlufjMRSvxarr/is9WvT0a5ZfKEk54011eZf6t4Po=
X-Received: by 2002:a25:5f4c:: with SMTP id h12mr364293ybm.97.1599580434228;
 Tue, 08 Sep 2020 08:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200828032752.3229698-1-agoode@google.com> <20200902200617.1720599-1-agoode@google.com>
 <20200904030336.GG9369@pendragon.ideasonboard.com>
In-Reply-To: <20200904030336.GG9369@pendragon.ideasonboard.com>
From:   Adam Goode <agoode@google.com>
Date:   Tue, 8 Sep 2020 11:53:15 -0400
Message-ID: <CAOf41NnpkXATUNay+EPucFg7Nx8=rfLta+TZsRrknZiq3Gegxg@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Convey full colorspace information to V4L2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 3, 2020 at 11:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> Thank you for the patch.
>
> On Wed, Sep 02, 2020 at 04:06:17PM -0400, Adam Goode wrote:
> > The Color Matching Descriptor has been present in USB cameras since
> > the original version of UVC, but it has never been fully exposed
> > in Linux.
> >
> > This change informs V4L2 of all of the UVC colorspace parameters:
> > color primaries, transfer characteristics, and YCbCr encoding.
> > videodev2.h doesn't have values for all the possible UVC color settings,
> > so it is mapped as closely as possible.
> >
> > Signed-off-by: Adam Goode <agoode@google.com>
> > ---
> >
> > Changes in v3:
> >  - Remove quantization changes completely.
> >
> >  drivers/media/usb/uvc/uvc_driver.c | 64 ++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  4 ++
> >  drivers/media/usb/uvc/uvcvideo.h   |  4 +-
> >  3 files changed, 67 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 431d86e1c94b..8682c7ad6949 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
> >       return NULL;
> >  }
> >
> > -static u32 uvc_colorspace(const u8 primaries)
> > +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
> >  {
> > -     static const u8 colorprimaries[] = {
> > -             0,
> > +     static const enum v4l2_colorspace colorprimaries[] = {
> > +             V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> >               V4L2_COLORSPACE_SRGB,
> >               V4L2_COLORSPACE_470_SYSTEM_M,
> >               V4L2_COLORSPACE_470_SYSTEM_BG,
> > @@ -262,7 +262,61 @@ static u32 uvc_colorspace(const u8 primaries)
> >       if (primaries < ARRAY_SIZE(colorprimaries))
> >               return colorprimaries[primaries];
> >
> > -     return 0;
> > +     return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> > +}
> > +
> > +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
> > +{
> > +     /* V4L2 currently does not currently have definitions for all
>
> A single "currently" should be enough :-) I'll fix this when applying.

Thank you! I was fixating too much on the present :)


>
> > +      * possible values of UVC transfer characteristics. If
> > +      * v4l2_xfer_func is extended with new values, the mapping
> > +      * below should be updated.
> > +      *
> > +      * Substitutions are taken from the mapping given for
> > +      * V4L2_XFER_FUNC_DEFAULT documented in videodev2.h.
> > +      */
> > +     static const enum v4l2_xfer_func xfer_funcs[] = {
> > +             V4L2_XFER_FUNC_DEFAULT,    /* Unspecified */
> > +             V4L2_XFER_FUNC_709,
> > +             V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 M */
> > +             V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 B, G */
> > +             V4L2_XFER_FUNC_709,        /* Substitution for SMPTE 170M */
> > +             V4L2_XFER_FUNC_SMPTE240M,
> > +             V4L2_XFER_FUNC_NONE,
> > +             V4L2_XFER_FUNC_SRGB,
> > +     };
> > +
> > +     if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
> > +             return xfer_funcs[transfer_characteristics];
> > +
> > +     return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
> > +}
> > +
> > +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
> > +{
> > +     /* V4L2 currently does not currently have definitions for all
>
> Same here.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +      * possible values of UVC matrix coefficients. If
> > +      * v4l2_ycbcr_encoding is extended with new values, the
> > +      * mapping below should be updated.
> > +      *
> > +      * Substitutions are taken from the mapping given for
> > +      * V4L2_YCBCR_ENC_DEFAULT documented in videodev2.h.
> > +      *
> > +      * FCC is assumed to be close enough to 601.
> > +      */
> > +     static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
> > +             V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
> > +             V4L2_YCBCR_ENC_709,
> > +             V4L2_YCBCR_ENC_601,      /* Substitution for FCC */
> > +             V4L2_YCBCR_ENC_601,      /* Substitution for BT.470-2 B, G */
> > +             V4L2_YCBCR_ENC_601,
> > +             V4L2_YCBCR_ENC_SMPTE240M,
> > +     };
> > +
> > +     if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
> > +             return ycbcr_encs[matrix_coefficients];
> > +
> > +     return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
> >  }
> >
> >  /* Simplify a fraction using a simple continued fraction decomposition. The
> > @@ -704,6 +758,8 @@ static int uvc_parse_format(struct uvc_device *dev,
> >               }
> >
> >               format->colorspace = uvc_colorspace(buffer[3]);
> > +             format->xfer_func = uvc_xfer_func(buffer[4]);
> > +             format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
> >
> >               buflen -= buffer[0];
> >               buffer += buffer[0];
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 0335e69b70ab..dee65e89d6c2 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -253,6 +253,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
> >       fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
> >       fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
> >       fmt->fmt.pix.colorspace = format->colorspace;
> > +     fmt->fmt.pix.xfer_func = format->xfer_func;
> > +     fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> >
> >       if (uvc_format != NULL)
> >               *uvc_format = format;
> > @@ -289,6 +291,8 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
> >       fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
> >       fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
> >       fmt->fmt.pix.colorspace = format->colorspace;
> > +     fmt->fmt.pix.xfer_func = format->xfer_func;
> > +     fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> >
> >  done:
> >       mutex_unlock(&stream->mutex);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 6ab972c643e3..eb5f3ffc0222 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -370,7 +370,9 @@ struct uvc_format {
> >       u8 type;
> >       u8 index;
> >       u8 bpp;
> > -     u8 colorspace;
> > +     enum v4l2_colorspace colorspace;
> > +     enum v4l2_xfer_func xfer_func;
> > +     enum v4l2_ycbcr_encoding ycbcr_enc;
> >       u32 fcc;
> >       u32 flags;
> >
>
> --
> Regards,
>
> Laurent Pinchart
