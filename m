Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CF765D1C3
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234162AbjADLtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjADLtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:49:14 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201F8BB4
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:49:10 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so26073991pjq.1
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 03:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtp1Qy4qs9YpsaZtgRbzyStVbOo6HU1DNmQkijlbg/4=;
        b=OidFBdQgrv2o6FeMHoGuZDquB9swWS1DF4+KtVdzx7glD33kfbXo4+PhwIHRxegOho
         4I5+w6Pc/yMOaiANr47RkIXnzBNy282UKbggUSzZ0RUV9xsT+vAKJA4V9YMRTQs/EYYH
         Mvu7yHw/UiSGInFUPpdF4EzNu6QM9UHvQuqIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qtp1Qy4qs9YpsaZtgRbzyStVbOo6HU1DNmQkijlbg/4=;
        b=yrQrafGF8WBe+JDGmLOghCOVwdNcia6iYv0ZTV4zG1vZCiRUKmBrGUWlkal7s+cpeQ
         5sPEQmXNBsPt6S3F9aYHIeLJ9ajDIq2k2HP4VMXlUcM68ogONVrfOhgrDJALzPRqvfVm
         CkYMTTNWNVOVidH2xce5PBH3B/aQeFA+MR8vTEKbq/lPQPdH8Sk/nf7qRlxnZVyguDAk
         Xg7GhVWfg84T7UY/x0RiXVTVc9Ut/y/glgKcZ46pIgjOEeizxDCo9rltoZx4NHZk2J8p
         uSdCQ4dPoU9HTENi+Uq9FfBYoD8aBbXXBRzOtV0C6m/9s+Yhx53bKHXMDugV+fKcpyaa
         FjRA==
X-Gm-Message-State: AFqh2koB5gQVzyAft0Et0jJmHmo0tDXA4ErbcK3/0CdY5BUHK7J82soC
        sVUNyJpCeosf90ed94H3ZK5X9KK9h4xUMvIBWVE=
X-Google-Smtp-Source: AMrXdXuNCfls+raCX9KHgmZAoDd1ZpHfVbh5Fd/APZeDtR0VHQgzAR3FMOxFrZmrum41arNV9vZ23A==
X-Received: by 2002:a17:902:edc3:b0:191:4389:f8f5 with SMTP id q3-20020a170902edc300b001914389f8f5mr42983918plk.34.1672832949248;
        Wed, 04 Jan 2023 03:49:09 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b0017d97d13b18sm24032627pln.65.2023.01.04.03.49.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 03:49:08 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id h192so17211719pgc.7
        for <linux-media@vger.kernel.org>; Wed, 04 Jan 2023 03:49:08 -0800 (PST)
X-Received: by 2002:a65:5b81:0:b0:49c:5d81:b628 with SMTP id
 i1-20020a655b81000000b0049c5d81b628mr1429613pgr.213.1672832948059; Wed, 04
 Jan 2023 03:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20230104111944.962-1-laurent.pinchart@ideasonboard.com> <20230104111944.962-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230104111944.962-2-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 4 Jan 2023 12:48:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCvXswgV07dsauhXRLGdub8QcLMtHSTs7RvJZPcznoc3vw@mail.gmail.com>
Message-ID: <CANiDSCvXswgV07dsauhXRLGdub8QcLMtHSTs7RvJZPcznoc3vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Remove format descriptions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
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

On Wed, 4 Jan 2023 at 12:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The V4L2 core fills format description on its own in v4l_fill_fmtdesc(),
can we s/fills/overwrites/ ?
> there's no need to manually set the descriptions in the driver. This
> prepares for removal of the format descriptions from the uvc_fmts table.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
With or without my nits:
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v1:
>
> - Don't replace %pUl with %p4cc when the format is unknown
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 25 ++++++++++++-------------
>  drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
>  drivers/media/usb/uvc/uvcvideo.h   |  2 --
>  3 files changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 72c025d8e20b..9852d6f63ae8 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -228,6 +228,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_format_desc *fmtdesc;
>         struct uvc_frame *frame;
>         const unsigned char *start = buffer;
> +       char fmtname[12] = { 0, };
>         unsigned int width_multiplier = 1;
>         unsigned int interval;
>         unsigned int i, n;
> @@ -252,14 +253,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 fmtdesc = uvc_format_by_guid(&buffer[5]);
>
>                 if (fmtdesc != NULL) {
> -                       strscpy(format->name, fmtdesc->name,
> -                               sizeof(format->name));
>                         format->fcc = fmtdesc->fcc;
>                 } else {
>                         dev_info(&streaming->intf->dev,
>                                  "Unknown video format %pUl\n", &buffer[5]);
> -                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> -                               &buffer[5]);
>                         format->fcc = 0;
>                 }
>
> @@ -271,8 +268,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                  */
>                 if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
>                         if (format->fcc == V4L2_PIX_FMT_YUYV) {
> -                               strscpy(format->name, "Greyscale 8-bit (Y8  )",
> -                                       sizeof(format->name));
>                                 format->fcc = V4L2_PIX_FMT_GREY;
>                                 format->bpp = 8;
>                                 width_multiplier = 2;
> @@ -313,7 +308,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               strscpy(format->name, "MJPEG", sizeof(format->name));
>                 format->fcc = V4L2_PIX_FMT_MJPEG;
>                 format->flags = UVC_FMT_FLAG_COMPRESSED;
>                 format->bpp = 0;
> @@ -331,13 +325,13 @@ static int uvc_parse_format(struct uvc_device *dev,
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
> @@ -347,8 +341,8 @@ static int uvc_parse_format(struct uvc_device *dev,
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
> @@ -376,7 +370,12 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 return -EINVAL;
>         }
>
> -       uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
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
> index ed2525e7e2a5..727fafb47c1f 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -661,8 +661,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>         fmt->flags = 0;
>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> -       strscpy(fmt->description, format->name, sizeof(fmt->description));
> -       fmt->description[sizeof(fmt->description) - 1] = 0;
>         fmt->pixelformat = format->fcc;
>         return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ae0066eceffd..cb504b9d7ec9 100644
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
