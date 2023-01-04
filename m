Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B067B65D0CD
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 11:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjADKi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 05:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238902AbjADKh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 05:37:57 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F461EC59
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 02:37:46 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id w3so3842646ply.3
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFRwieoDiGzsGHlEUyxneskvd7JnCIM1URPR/9Z/W6E=;
        b=mIz/6t4rkau8tRaP3gJr6pFLVNImHTncoMHEapj8ixl4Dpqok6RxD5hZmnqv+5l2AY
         NZuUHBuqQv1UmrYODfVmzw1sk6STBS+ZzQ+iVX2mP04pXMRkoOomsjJeM3TyTsu3fIVc
         WfWH7J6X9whQ5/q3BZuVBaMmqZpyLCHhNbAlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFRwieoDiGzsGHlEUyxneskvd7JnCIM1URPR/9Z/W6E=;
        b=MgvmVDDlPDRoOxsdVCZekJ3KbHjbSIJZbx2hbpWv90zAKhZk4X5iVjtd/Emoh5XxsA
         9d42AjAX0PcSFQjmszIS4IRMB0zrZjeAZt0qX2tqPGqYgoOM6a3IBgl/YIXzHREqyURd
         79iaqv3zCjzA+vPp0zGTNQXkWpkZLgGQ3r8++WXsxLirEL8LYC+FLXMABkn3gwDFB8oC
         R45YiGoiWP0CM93xXW9SyPWzvUJyZTU7cBtYuvPnWxQ6eFfIuE2O9OF6vDGZd3NdiP30
         uZVov8WeZ1SDSRaUZXkP8ETWZtMnp1Avt1rlxmyMiidMCR3+aIANJs+++yIhzm2ceOC5
         jdMg==
X-Gm-Message-State: AFqh2koJdOLh2nE+IxhrXF2xvsF36fm14mGxWtliBClyHtOpRndh4MA7
        N2ttqRyihlH92CTx9LjzuZrNnCeUqUvaRnWnMho=
X-Google-Smtp-Source: AMrXdXt3bE9BKH6yTOj2+lSs4rkbisYhO88VExbKiUlSYdNG5hGSXUJ6D185W5nP+ol7iKMXMNARmQ==
X-Received: by 2002:a17:903:2c5:b0:192:cf35:3ff8 with SMTP id s5-20020a17090302c500b00192cf353ff8mr9716303plk.21.1672828666032;
        Wed, 04 Jan 2023 02:37:46 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709029a0900b001898ee9f723sm23971099plp.2.2023.01.04.02.37.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 02:37:45 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so31410483pjg.5
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 02:37:45 -0800 (PST)
X-Received: by 2002:a17:902:f682:b0:186:9cf4:e53b with SMTP id
 l2-20020a170902f68200b001869cf4e53bmr2412538plg.50.1672828664730; Wed, 04 Jan
 2023 02:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20221228014200.20462-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20221228014200.20462-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Jan 2023 11:37:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCspM4GpF9xrizBMBRTMQKkK+yqGoDYgu=s0f+g3j4qm-g@mail.gmail.com>
Message-ID: <CANiDSCspM4GpF9xrizBMBRTMQKkK+yqGoDYgu=s0f+g3j4qm-g@mail.gmail.com>
Subject: Re: [PATCH v1] media: uvcvideo: Remove format descriptions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
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

On Wed, 28 Dec 2022 at 02:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The V4L2 core fills format description on its own in v4l_fill_fmtdesc(),
Maybe make more explicit the rewrite, always fills
> there's no need to manually set the descriptions in the driver. This
> prepares for removal of the format descriptions from the uvc_fmts table.
>
With or without the nits:

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>
> Michael, I'd like to merge this before the "[PATCH v2 5/5] usb: uvc: use
> v4l2_fill_fmtdesc instead of open coded format name" patch you have
> submitted, if that's OK with you. It removes the need to call
> v4l2_fill_fmtdesc() in that patch, which will also allow dropping
> "[PATCH v2 4/5] media: v4l2: move v4l_fill_fmtdesc to common
> v4l2_fill_fmtdesc function" in that series. I think we can schedule all
> of that for v6.3.
>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++--------------
>  drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
>  drivers/media/usb/uvc/uvcvideo.h   |  2 --
>  3 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 8132a5c3bc33..6de3d55daf36 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -227,6 +227,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_format_desc *fmtdesc;
>         struct uvc_frame *frame;
>         const unsigned char *start = buffer;
> +       char fmtname[12] = { 0, };
What about
char fmtname[] = "\0SDL-DV 60Hz"; /* Longest possible string. */

>         unsigned int width_multiplier = 1;
>         unsigned int interval;
>         unsigned int i, n;
> @@ -251,14 +252,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 fmtdesc = uvc_format_by_guid(&buffer[5]);
>
>                 if (fmtdesc != NULL) {
> -                       strscpy(format->name, fmtdesc->name,
> -                               sizeof(format->name));
>                         format->fcc = fmtdesc->fcc;
>                 } else {
>                         dev_info(&streaming->intf->dev,
> -                                "Unknown video format %pUl\n", &buffer[5]);
> -                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> -                               &buffer[5]);
> +                                "Unknown video format %p4cc\n", &buffer[5]);
>                         format->fcc = 0;
>                 }
>
> @@ -270,8 +267,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                  */
>                 if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
>                         if (format->fcc == V4L2_PIX_FMT_YUYV) {
> -                               strscpy(format->name, "Greyscale 8-bit (Y8  )",
> -                                       sizeof(format->name));
>                                 format->fcc = V4L2_PIX_FMT_GREY;
>                                 format->bpp = 8;
>                                 width_multiplier = 2;
> @@ -312,7 +307,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               strscpy(format->name, "MJPEG", sizeof(format->name));
>                 format->fcc = V4L2_PIX_FMT_MJPEG;
>                 format->flags = UVC_FMT_FLAG_COMPRESSED;
>                 format->bpp = 0;
> @@ -330,13 +324,13 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 switch (buffer[8] & 0x7f) {
>                 case 0:
> -                       strscpy(format->name, "SD-DV", sizeof(format->name));
> +                       strscpy(fmtname, "SD-DV", sizeof(fmtname));
>                         break;
>                 case 1:
> -                       strscpy(format->name, "SDL-DV", sizeof(format->name));
> +                       strscpy(fmtname, "SDL-DV", sizeof(fmtname));
>                         break;
>                 case 2:
> -                       strscpy(format->name, "HD-DV", sizeof(format->name));
> +                       strscpy(fmtname, "HD-DV", sizeof(fmtname));
>                         break;
>                 default:
>                         uvc_dbg(dev, DESCR,
> @@ -346,8 +340,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> -                       sizeof(format->name));
> +               strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
> +                       sizeof(fmtname));
>
>                 format->fcc = V4L2_PIX_FMT_DV;
>                 format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
> @@ -375,7 +369,12 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 return -EINVAL;
>         }
>
> -       uvc_dbg(dev, DESCR, "Found format %s\n", format->name);

What about simply:

uvc_dbg(dev, DESCR, "Found format %p4cc %s\n", &format->fcc, fmtname);

Even when format->fcc is zero, specially in uvc_dbg is nice to have that info.

Thanks!


> +       if (format->fcc) {
> +               if (fmtname[0])
> +                       uvc_dbg(dev, DESCR, "Found format %s\n", fmtname);
> +               else
> +                       uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
> +       }
>
>         buflen -= buffer[0];
>         buffer += buffer[0];
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4d4c33b6dfb..dcd178d249b6 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -660,8 +660,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>         fmt->flags = 0;
>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> -       strscpy(fmt->description, format->name, sizeof(fmt->description));
> -       fmt->description[sizeof(fmt->description) - 1] = 0;
>         fmt->pixelformat = format->fcc;
>         return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 84326991ec36..cd5861cae3b0 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -262,8 +262,6 @@ struct uvc_format {
>         u32 fcc;
>         u32 flags;
>
> -       char name[32];
> -
>         unsigned int nframes;
>         struct uvc_frame *frame;
>  };
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
