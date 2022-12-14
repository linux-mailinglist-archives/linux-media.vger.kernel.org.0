Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 425DC64C6F7
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 11:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbiLNKUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 05:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237618AbiLNKUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 05:20:36 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7906413F0D
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 02:20:35 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 36so1644816pgp.10
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 02:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iSY/aifT2udZaI81Js8AwAoR9LvNMo+zaU5J3YgtXW8=;
        b=KA4HL+QcoDD5Lc5ElIT8KI/Vg12p5rvKSD4i9Tna33RKb/uI92YzjCNQYfEO/KeiJL
         dUrcTt014y4ZfYLkCEVuC0skbf/m1hewY9N8pg4IBEaARtfbL8MKK8G+R8CsjxRbYVMI
         hHwszrHy9si0riC+SbgX7/m0oDjAw/7GkGlmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSY/aifT2udZaI81Js8AwAoR9LvNMo+zaU5J3YgtXW8=;
        b=Ky8mfIBEzWQDDBVU899pA5hnaOaxbzrkTuIbHtodvVZalizT87iM3K/Up+nugsIWHg
         eUqjQ51WC0fe/5eBPs7INhwdOv8IjJp9SzGIKSbGf5meKCfyVaFvshTRbnLNvwNwkRDp
         NXY3b9uTNwzydITMus8XGvEjih/fbaW6Aj6g+jhsZjpD+xoxpXS1ZM/ha9b+p85Gewsr
         4c9Sph1dJfb/IH4RFVckqdqA/biMPOVaiwHDEkun4csMErR2E28bIo1LP9BxSoZ+WL5a
         8CaZnvA1Sdf2LWeWyWewJBcFFe1XJMqoTqBPCLMqhaIUsnqHv5l6eK/iOE6/CnvCLcdR
         uh8Q==
X-Gm-Message-State: ANoB5plvUvoHazy4E0OIduXCmlEDKj6zgGuOtTsh2jc4uZ74sod9q9yU
        4ru95lwA4uBlzxnDeVKwkRI1gkhcAZSSNV+3cQk=
X-Google-Smtp-Source: AA0mqf544EsTTgIMw3PCFBqU7uro+NY7cQqP/wmHISX9Fv1cNP1f4RNbX0of5QK1mzIA6T8Ol11IWw==
X-Received: by 2002:aa7:8147:0:b0:56e:9868:52fc with SMTP id d7-20020aa78147000000b0056e986852fcmr21481012pfn.25.1671013234766;
        Wed, 14 Dec 2022 02:20:34 -0800 (PST)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id v66-20020a626145000000b0057716769289sm9038306pfb.196.2022.12.14.02.20.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 02:20:33 -0800 (PST)
Received: by mail-pl1-f170.google.com with SMTP id l10so2835642plb.8
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 02:20:32 -0800 (PST)
X-Received: by 2002:a17:902:ce04:b0:174:af35:4b90 with SMTP id
 k4-20020a170902ce0400b00174af354b90mr79366094plg.8.1671013232099; Wed, 14 Dec
 2022 02:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
 <20221212194716.2995569-6-m.grzeschik@pengutronix.de> <6286e69b-4882-c75a-d3bd-44c88f421bfc@ideasonboard.com>
In-Reply-To: <6286e69b-4882-c75a-d3bd-44c88f421bfc@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 14 Dec 2022 11:20:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCvtULbNWY2AeZtHO2vP297uAZPAhFWvxuc0pXX89ArVxw@mail.gmail.com>
Message-ID: <CANiDSCvtULbNWY2AeZtHO2vP297uAZPAhFWvxuc0pXX89ArVxw@mail.gmail.com>
Subject: Re: [PATCH 5/5] usb: uvc: use v4l2_fill_fmtdesc instead of open coded
 format name
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan

On Wed, 14 Dec 2022 at 10:48, Dan Scally <dan.scally@ideasonboard.com> wrote:
>
> Hi Michael
>
> On 12/12/2022 19:47, Michael Grzeschik wrote:
> > Since we have the helper function v4l2_fill_fmtdesc, we can use this to
> > get the corresponding descriptive string for the pixelformat and set the
> > compressed flag. This patch is removing the redundant name field in
> > uvc_format_desc and makes use of v4l2_fill_fmtdesc instead.
> >
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
>
>
> The only thing that makes me wary about this one is that it will change
> the format names reported by the uvcvideo driver to userspace, since
> those returned by v4l2_fill_fmtdesc() are not the same as the ones being
> dropped from uvc_format_desc[]...are we sure that's not going to matter?

I would expect apps using the fourcc, not the string to select one
format or the other.

>
> >   drivers/media/common/uvc.c             | 37 --------------------------
> >   drivers/media/usb/uvc/uvc_driver.c     |  8 +++++-
> >   drivers/usb/gadget/function/uvc_v4l2.c |  6 +----
> >   include/linux/usb/uvc.h                |  1 -
> >   4 files changed, 8 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index a6787f1999becd..02de0dcad0f088 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -11,187 +11,150 @@
> >
> >   static const struct uvc_format_desc uvc_fmts[] = {
> >       {
> > -             .name           = "YUV 4:2:2 (YUYV)",
> >               .guid           = UVC_GUID_FORMAT_YUY2,
> >               .fcc            = V4L2_PIX_FMT_YUYV,
> >       },
> >       {
> > -             .name           = "YUV 4:2:2 (YUYV)",
> >               .guid           = UVC_GUID_FORMAT_YUY2_ISIGHT,
> >               .fcc            = V4L2_PIX_FMT_YUYV,
> >       },
> >       {
> > -             .name           = "YUV 4:2:0 (NV12)",
> >               .guid           = UVC_GUID_FORMAT_NV12,
> >               .fcc            = V4L2_PIX_FMT_NV12,
> >       },
> >       {
> > -             .name           = "MJPEG",
> >               .guid           = UVC_GUID_FORMAT_MJPEG,
> >               .fcc            = V4L2_PIX_FMT_MJPEG,
> >       },
> >       {
> > -             .name           = "YVU 4:2:0 (YV12)",
> >               .guid           = UVC_GUID_FORMAT_YV12,
> >               .fcc            = V4L2_PIX_FMT_YVU420,
> >       },
> >       {
> > -             .name           = "YUV 4:2:0 (I420)",
> >               .guid           = UVC_GUID_FORMAT_I420,
> >               .fcc            = V4L2_PIX_FMT_YUV420,
> >       },
> >       {
> > -             .name           = "YUV 4:2:0 (M420)",
> >               .guid           = UVC_GUID_FORMAT_M420,
> >               .fcc            = V4L2_PIX_FMT_M420,
> >       },
> >       {
> > -             .name           = "YUV 4:2:2 (UYVY)",
> >               .guid           = UVC_GUID_FORMAT_UYVY,
> >               .fcc            = V4L2_PIX_FMT_UYVY,
> >       },
> >       {
> > -             .name           = "Greyscale 8-bit (Y800)",
> >               .guid           = UVC_GUID_FORMAT_Y800,
> >               .fcc            = V4L2_PIX_FMT_GREY,
> >       },
> >       {
> > -             .name           = "Greyscale 8-bit (Y8  )",
> >               .guid           = UVC_GUID_FORMAT_Y8,
> >               .fcc            = V4L2_PIX_FMT_GREY,
> >       },
> >       {
> > -             .name           = "Greyscale 8-bit (D3DFMT_L8)",
> >               .guid           = UVC_GUID_FORMAT_D3DFMT_L8,
> >               .fcc            = V4L2_PIX_FMT_GREY,
> >       },
> >       {
> > -             .name           = "IR 8-bit (L8_IR)",
> >               .guid           = UVC_GUID_FORMAT_KSMEDIA_L8_IR,
> >               .fcc            = V4L2_PIX_FMT_GREY,
> >       },
> >       {
> > -             .name           = "Greyscale 10-bit (Y10 )",
> >               .guid           = UVC_GUID_FORMAT_Y10,
> >               .fcc            = V4L2_PIX_FMT_Y10,
> >       },
> >       {
> > -             .name           = "Greyscale 12-bit (Y12 )",
> >               .guid           = UVC_GUID_FORMAT_Y12,
> >               .fcc            = V4L2_PIX_FMT_Y12,
> >       },
> >       {
> > -             .name           = "Greyscale 16-bit (Y16 )",
> >               .guid           = UVC_GUID_FORMAT_Y16,
> >               .fcc            = V4L2_PIX_FMT_Y16,
> >       },
> >       {
> > -             .name           = "BGGR Bayer (BY8 )",
> >               .guid           = UVC_GUID_FORMAT_BY8,
> >               .fcc            = V4L2_PIX_FMT_SBGGR8,
> >       },
> >       {
> > -             .name           = "BGGR Bayer (BA81)",
> >               .guid           = UVC_GUID_FORMAT_BA81,
> >               .fcc            = V4L2_PIX_FMT_SBGGR8,
> >       },
> >       {
> > -             .name           = "GBRG Bayer (GBRG)",
> >               .guid           = UVC_GUID_FORMAT_GBRG,
> >               .fcc            = V4L2_PIX_FMT_SGBRG8,
> >       },
> >       {
> > -             .name           = "GRBG Bayer (GRBG)",
> >               .guid           = UVC_GUID_FORMAT_GRBG,
> >               .fcc            = V4L2_PIX_FMT_SGRBG8,
> >       },
> >       {
> > -             .name           = "RGGB Bayer (RGGB)",
> >               .guid           = UVC_GUID_FORMAT_RGGB,
> >               .fcc            = V4L2_PIX_FMT_SRGGB8,
> >       },
> >       {
> > -             .name           = "RGB565",
> >               .guid           = UVC_GUID_FORMAT_RGBP,
> >               .fcc            = V4L2_PIX_FMT_RGB565,
> >       },
> >       {
> > -             .name           = "BGR 8:8:8 (BGR3)",
> >               .guid           = UVC_GUID_FORMAT_BGR3,
> >               .fcc            = V4L2_PIX_FMT_BGR24,
> >       },
> >       {
> > -             .name           = "H.264",
> >               .guid           = UVC_GUID_FORMAT_H264,
> >               .fcc            = V4L2_PIX_FMT_H264,
> >       },
> >       {
> > -             .name           = "H.265",
> >               .guid           = UVC_GUID_FORMAT_H265,
> >               .fcc            = V4L2_PIX_FMT_HEVC,
> >       },
> >       {
> > -             .name           = "Greyscale 8 L/R (Y8I)",
> >               .guid           = UVC_GUID_FORMAT_Y8I,
> >               .fcc            = V4L2_PIX_FMT_Y8I,
> >       },
> >       {
> > -             .name           = "Greyscale 12 L/R (Y12I)",
> >               .guid           = UVC_GUID_FORMAT_Y12I,
> >               .fcc            = V4L2_PIX_FMT_Y12I,
> >       },
> >       {
> > -             .name           = "Depth data 16-bit (Z16)",
> >               .guid           = UVC_GUID_FORMAT_Z16,
> >               .fcc            = V4L2_PIX_FMT_Z16,
> >       },
> >       {
> > -             .name           = "Bayer 10-bit (SRGGB10P)",
> >               .guid           = UVC_GUID_FORMAT_RW10,
> >               .fcc            = V4L2_PIX_FMT_SRGGB10P,
> >       },
> >       {
> > -             .name           = "Bayer 16-bit (SBGGR16)",
> >               .guid           = UVC_GUID_FORMAT_BG16,
> >               .fcc            = V4L2_PIX_FMT_SBGGR16,
> >       },
> >       {
> > -             .name           = "Bayer 16-bit (SGBRG16)",
> >               .guid           = UVC_GUID_FORMAT_GB16,
> >               .fcc            = V4L2_PIX_FMT_SGBRG16,
> >       },
> >       {
> > -             .name           = "Bayer 16-bit (SRGGB16)",
> >               .guid           = UVC_GUID_FORMAT_RG16,
> >               .fcc            = V4L2_PIX_FMT_SRGGB16,
> >       },
> >       {
> > -             .name           = "Bayer 16-bit (SGRBG16)",
> >               .guid           = UVC_GUID_FORMAT_GR16,
> >               .fcc            = V4L2_PIX_FMT_SGRBG16,
> >       },
> >       {
> > -             .name           = "Depth data 16-bit (Z16)",
> >               .guid           = UVC_GUID_FORMAT_INVZ,
> >               .fcc            = V4L2_PIX_FMT_Z16,
> >       },
> >       {
> > -             .name           = "Greyscale 10-bit (Y10 )",
> >               .guid           = UVC_GUID_FORMAT_INVI,
> >               .fcc            = V4L2_PIX_FMT_Y10,
> >       },
> >       {
> > -             .name           = "IR:Depth 26-bit (INZI)",
> >               .guid           = UVC_GUID_FORMAT_INZI,
> >               .fcc            = V4L2_PIX_FMT_INZI,
> >       },
> >       {
> > -             .name           = "4-bit Depth Confidence (Packed)",
> >               .guid           = UVC_GUID_FORMAT_CNF4,
> >               .fcc            = V4L2_PIX_FMT_CNF4,
> >       },
> >       {
> > -             .name           = "HEVC",
> >               .guid           = UVC_GUID_FORMAT_HEVC,
> >               .fcc            = V4L2_PIX_FMT_HEVC,
> >       },
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 12b6ad0966d94a..af92e730bde7c7 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -251,7 +251,13 @@ static int uvc_parse_format(struct uvc_device *dev,
> >               fmtdesc = uvc_format_by_guid(&buffer[5]);
> >
> >               if (fmtdesc != NULL) {
> > -                     strscpy(format->name, fmtdesc->name,
> > +                     struct v4l2_fmtdesc fmt;
> > +
> > +                     fmt.pixelformat = fmtdesc->fcc;
> > +
> > +                     v4l2_fill_fmtdesc(&fmt);
> > +
> > +                     strscpy(format->name, fmt.description,
> >                               sizeof(format->name));
> >                       format->fcc = fmtdesc->fcc;
> >               } else {
> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > index 21e573e628f4e7..6e46fa1695f212 100644
> > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > @@ -374,14 +374,10 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >       if (!uformat)
> >               return -EINVAL;
> >
> > -     if (uformat->type != UVCG_UNCOMPRESSED)
> > -             f->flags |= V4L2_FMT_FLAG_COMPRESSED;
> > -
> >       fmtdesc = to_uvc_format(uformat);
> >       f->pixelformat = fmtdesc->fcc;
> >
> > -     strscpy(f->description, fmtdesc->name, sizeof(f->description));
> > -     f->description[strlen(fmtdesc->name) - 1] = 0;
> > +     v4l2_fill_fmtdesc(f);
> >
> >       return 0;
> >   }
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 227a03f252a5c0..e407a7b8a91c70 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -146,7 +146,6 @@
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >
> >   struct uvc_format_desc {
> > -     char *name;
> >       u8 guid[16];
> >       u32 fcc;
> >   };



-- 
Ricardo Ribalda
