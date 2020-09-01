Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A502591BB
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgIALc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 07:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgIALbo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 07:31:44 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234E6C061251
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 04:31:30 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id u6so574886ybf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2020 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4azl1Pqi34/KM3SUfHQrbAB4z0ey03RVAecsuKreq5M=;
        b=snGvfPzwW9rhNwrrYSkrDULDiO5BdR63aE1RkVlpa8cYCwjnqE66MWXXLkSSCwDl+1
         LO9o1FhuipndgnCJstkHUPsnaqKzG2gAQaAPSCQKnVvX7DdA1IPIMWfwSRBJauKT2Hti
         W6NmO8RZE7odYOpvRl+7kh51FZ/znyA0mTDmhuYUCobE6fJLrxpmApZkFx3Ywk6+L53X
         IKntmqo63YJYitm+9C+AW6rP8pBLKb0jQpiIo35ei3ReUQRkYfE0VUWH3RpPzSgxD8ur
         7mGKQOenMQ6H1wngaGa5fy88to8fBIpaWTdnuE6ljmXl3CaPGJDvZAtvCsuJYBpNkorT
         ZwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4azl1Pqi34/KM3SUfHQrbAB4z0ey03RVAecsuKreq5M=;
        b=o6uBpUJt8NWAUSZdUXEJtJGHt+tv+05oEOrJMZextyPH8CDpj34ZZS/h9MYopoRzDs
         AwNPJJyvcoBEPUi+/pfKAHLQA6QiJhUIOB2TVfg9TCkx+T7egopkPMzcp48x8Pl8yrVA
         SrEuY4mKojnHOZ9ziRbt6dmj+lqGjoRPGddxe1fc4pva/gvYkxcS7Cbef3x8bRdxOb4L
         q9UOsmQJTTc7ZGVnIclTAmLniN5S9wBKOPzHG9+uDacKJ3yeu0JoKPi88HZYDw3d1HM1
         nwYhsN9qmJbcXmm9Rjxpgnms01pOU8Dn3cYhTm/HeVSiGqr91+HC1KH+Wqcaj6uZGbFE
         BqWw==
X-Gm-Message-State: AOAM531NJhYevScFYG/RsE2OjhXx8g9dKM9bFOfe1QN7AW3pSAJz3vKf
        wTs8FLFH6YtO3t5Iu2023WYMF1F2o38QMG1Kils/eA==
X-Google-Smtp-Source: ABdhPJwF4OrqCSUd9mXlj8r1EOlnKx/dA9KK9jQxv47MCLREf8tafLhOIPQSl3zpBqWt9lZz8BA0MZDslSjPnbJq1Ss=
X-Received: by 2002:a5b:411:: with SMTP id m17mr2101536ybp.492.1598959888924;
 Tue, 01 Sep 2020 04:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200828032752.3229698-1-agoode@google.com>
In-Reply-To: <20200828032752.3229698-1-agoode@google.com>
From:   Adam Goode <agoode@google.com>
Date:   Tue, 1 Sep 2020 07:30:53 -0400
Message-ID: <CAOf41NnayTZKqZYeY4Eu8wES=E8UK6jWLCUoXw4JoF-rLax_NQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Convey full colorspace information to V4L2
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 27, 2020 at 11:28 PM Adam Goode <agoode@google.com> wrote:
>
> The Color Matching Descriptor has been present in USB cameras since
> the original version of UVC, but it has never been fully exposed
> in Linux.
>
> This change informs V4L2 of all of the UVC colorspace parameters:
> color primaries, transfer characteristics, and YCbCr encoding.
> videodev2.h doesn't have values for all the possible UVC color settings,
> so it is mapped as closely as possible.
>
> Additionally, this patch overrides the default setting for quantization
> for UVC MJPEG. By default, V4L2 assumes that MJPEG is full range encoded,
> which is not correct for UVC.
>
> JPEG itself does not specify YCbCr encoding information, this is
> left to some other metadata. For typical JPEG images (those that conform to
> JFIF, see https://www.w3.org/Graphics/JPEG/jfif3.pdf), the colorspace is
> specified as YCbCr CCIR 601 with full range. The use of this variant
> on the 601 standard in JFIF is the reason that V4L2 defaults to full range
> for JPEG.
>
> A JPEG image isn't a JFIF unless it contains an APP0 tag with 'JFIF', and
> the UVC standard is clear that APP0 is optional for its MJPEG payload.
> It does not mention JFIF at all. Moreover, it provides color metadata
> in the Color Matching Descriptor, all using limited range as of UVC 1.5.
>
> Note that web browsers such as Chrome and Firefox already ignore V4L2's
> quantization for USB devices and use the correct limited range, but
> other programs such as qv4l2 will incorrectly interpret the encoding of
> MJPEG from USB cameras without this change.
>
> Since there are many YUV and non-YUV formats supported by UVC cameras (but
> not mentioned in the official specifications), and the quantization is
> also not specified for these formats, I am not changing that behavior: all
> formats besides MJPEG will stay at V4L2_QUANTIZATION_DEFAULT as before.
>
> Signed-off-by: Adam Goode <agoode@google.com>
> ---
>
> Changes in v2:
>  - Apply quantization override only for MJPEG.
>  - Provide more comments and background information about JPEG vs JFIF.
>  - Explain the substitutions for xfer func and ycbcr encoding.
>
>  drivers/media/usb/uvc/uvc_driver.c | 87 ++++++++++++++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c   |  6 +++
>  drivers/media/usb/uvc/uvcvideo.h   |  6 ++-
>  3 files changed, 94 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 431d86e1c94b..4e530a4bf976 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -248,10 +248,10 @@ static struct uvc_format_desc *uvc_format_by_guid(const u8 guid[16])
>         return NULL;
>  }
>
> -static u32 uvc_colorspace(const u8 primaries)
> +static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>  {
> -       static const u8 colorprimaries[] = {
> -               0,
> +       static const enum v4l2_colorspace colorprimaries[] = {
> +               V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
>                 V4L2_COLORSPACE_SRGB,
>                 V4L2_COLORSPACE_470_SYSTEM_M,
>                 V4L2_COLORSPACE_470_SYSTEM_BG,
> @@ -262,7 +262,61 @@ static u32 uvc_colorspace(const u8 primaries)
>         if (primaries < ARRAY_SIZE(colorprimaries))
>                 return colorprimaries[primaries];
>
> -       return 0;
> +       return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> +}
> +
> +static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristics)
> +{
> +       /* V4L2 currently does not currently have definitions for all
> +        * possible values of UVC transfer characteristics. If
> +        * v4l2_xfer_func is extended with new values, the mapping
> +        * below should be updated.
> +        *
> +        * Substitutions are taken from the mapping given for
> +        * V4L2_XFER_FUNC_DEFAULT documented in videodev2.h.
> +        */
> +       static const enum v4l2_xfer_func xfer_funcs[] = {
> +               V4L2_XFER_FUNC_DEFAULT,    /* Unspecified */
> +               V4L2_XFER_FUNC_709,
> +               V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 M */
> +               V4L2_XFER_FUNC_709,        /* Substitution for BT.470-2 B, G */
> +               V4L2_XFER_FUNC_709,        /* Substitution for SMPTE 170M */
> +               V4L2_XFER_FUNC_SMPTE240M,
> +               V4L2_XFER_FUNC_NONE,
> +               V4L2_XFER_FUNC_SRGB,
> +       };
> +
> +       if (transfer_characteristics < ARRAY_SIZE(xfer_funcs))
> +               return xfer_funcs[transfer_characteristics];
> +
> +       return V4L2_XFER_FUNC_DEFAULT;  /* Reserved */
> +}
> +
> +static enum v4l2_ycbcr_encoding uvc_ycbcr_enc(const u8 matrix_coefficients)
> +{
> +       /* V4L2 currently does not currently have definitions for all
> +        * possible values of UVC matrix coefficients. If
> +        * v4l2_ycbcr_encoding is extended with new values, the
> +        * mapping below should be updated.
> +        *
> +        * Substitutions are taken from the mapping given for
> +        * V4L2_YCBCR_ENC_DEFAULT documented in videodev2.h.
> +        *
> +        * FCC is assumed to be close enough to 601.
> +        */
> +       static const enum v4l2_ycbcr_encoding ycbcr_encs[] = {
> +               V4L2_YCBCR_ENC_DEFAULT,  /* Unspecified */
> +               V4L2_YCBCR_ENC_709,
> +               V4L2_YCBCR_ENC_601,      /* Substitution for FCC */
> +               V4L2_YCBCR_ENC_601,      /* Substitution for BT.470-2 B, G */
> +               V4L2_YCBCR_ENC_601,
> +               V4L2_YCBCR_ENC_SMPTE240M,
> +       };
> +
> +       if (matrix_coefficients < ARRAY_SIZE(ycbcr_encs))
> +               return ycbcr_encs[matrix_coefficients];
> +
> +       return V4L2_YCBCR_ENC_DEFAULT;  /* Reserved */
>  }
>
>  /* Simplify a fraction using a simple continued fraction decomposition. The
> @@ -533,6 +587,29 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 strscpy(format->name, "MJPEG", sizeof(format->name));
>                 format->fcc = V4L2_PIX_FMT_MJPEG;
> +               /*
> +                * JPEG does not define a color encoding and relies on
> +                * external metadata for this purpose. The most common
> +                * metadata for this in JPEG is the JFIF
> +                * specification, which defines a full-range variant
> +                * of CCIR 601. Because of this, the default
> +                * quantization for JPEG images in V4L2 is full range.
> +                *
> +                * But while most JPEG files are JFIF (identified by
> +                * the presence of an APP0 tag starting with 'JFIF'),
> +                * MJPEG frames from UVC are typically not. The MJPEG
> +                * UVC standard declares APP0 tags as optional and
> +                * makes no mention of JFIF.
> +                *
> +                * For UVC MJPEG, the color encoding metadata comes
> +                * from the Color Matching descriptor, which uses the
> +                * standard limited range YCbCr encodings and not the
> +                * variant JFIF full range encoding.
> +                *
> +                * The default for JPEG in V4L2 is full range, so we need
> +                * to override the default here.
> +                */
> +               format->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>                 format->flags = UVC_FMT_FLAG_COMPRESSED;
>                 format->bpp = 0;
>                 ftype = UVC_VS_FRAME_MJPEG;
> @@ -704,6 +781,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 }
>
>                 format->colorspace = uvc_colorspace(buffer[3]);
> +               format->xfer_func = uvc_xfer_func(buffer[4]);
> +               format->ycbcr_enc = uvc_ycbcr_enc(buffer[5]);
>
>                 buflen -= buffer[0];
>                 buffer += buffer[0];
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 0335e69b70ab..8795f53a6306 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -253,6 +253,9 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>         fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
>         fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
>         fmt->fmt.pix.colorspace = format->colorspace;
> +       fmt->fmt.pix.xfer_func = format->xfer_func;
> +       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> +       fmt->fmt.pix.quantization = format->quantization;
>
>         if (uvc_format != NULL)
>                 *uvc_format = format;
> @@ -289,6 +292,9 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
>         fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
>         fmt->fmt.pix.sizeimage = stream->ctrl.dwMaxVideoFrameSize;
>         fmt->fmt.pix.colorspace = format->colorspace;
> +       fmt->fmt.pix.xfer_func = format->xfer_func;
> +       fmt->fmt.pix.ycbcr_enc = format->ycbcr_enc;
> +       fmt->fmt.pix.quantization = format->quantization;
>
>  done:
>         mutex_unlock(&stream->mutex);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 6ab972c643e3..e49cc671b0d3 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -272,6 +272,7 @@ struct uvc_format_desc {
>         char *name;
>         u8 guid[16];
>         u32 fcc;
> +       enum v4l2_quantization quantization;
>  };
>
>  /* The term 'entity' refers to both UVC units and UVC terminals.
> @@ -370,7 +371,10 @@ struct uvc_format {
>         u8 type;
>         u8 index;
>         u8 bpp;
> -       u8 colorspace;
> +       enum v4l2_colorspace colorspace;
> +       enum v4l2_xfer_func xfer_func;
> +       enum v4l2_ycbcr_encoding ycbcr_enc;
> +       enum v4l2_quantization quantization;
>         u32 fcc;
>         u32 flags;
>
> --
> 2.26.2
>

As mentioned elsewhere, the quantization change here is incorrect. I
will follow up with a new patch.


Adam
