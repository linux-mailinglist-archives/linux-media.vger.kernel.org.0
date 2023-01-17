Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1DE266E021
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 15:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjAQORM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 09:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjAQORJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 09:17:09 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A671432529
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:17:06 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id y5so23566278pfe.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aDTL9Kaue3i/xfLvAvfmxRs04BQuznVxLnFhBwgoow=;
        b=bmurv468a0MtgUCmrXa/0S6tLsGlCu0UUrGq+fceNhVjntcMz9PbZGoO8KHEjN5pnF
         2Rg0sBU+wIiF1ZyTy3i7mArb6GPOJDlSJZkqlpIL0Tf2z9BEMk1IaQ2TqCPuf896nRBl
         C+64f8o3UxalTJ7b8BKl7Wbyo6vkRJRBwf4mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aDTL9Kaue3i/xfLvAvfmxRs04BQuznVxLnFhBwgoow=;
        b=aloh4A05f4q6ZL/mKZw/BmJsynZa0yXhA0xjQG2/DjE76FraguxFSOomJ3uN3+juPe
         ClvstCzu0WApRIAedR8hvyDCIYnFeR4dj/y4Rx+WsUrLmdXE1h1Pw0WgHwO16mWGUcE1
         bZKjPZ2/ZaU8QjsleoAI+V3SY2n1tEarQZGE1naR2CNg15f8/pooF8Xttt+oi8fW2Fwt
         sJWl0vvZPeuw2DByZyebuZcy/wXCE4iMWjijnb2G7EgSQjsxdiFZ2NDKd2hOgSOofMOI
         95n591lkaQhxJHo5DJsiTS7cb6Hk1kKeE4LbK1mUulXJqgvqj0SV4V20vYIbuwaEHsBS
         AaMA==
X-Gm-Message-State: AFqh2krY/O7phgSdJTWpms0vkLqsTd+m7o7kV92bvdOk/NTMpMUWRIh7
        SIeVL1pxrKuAssLx+IA+bq7lTuEgoJjKDobp
X-Google-Smtp-Source: AMrXdXvMMnN40a2XEF+ogRjYUQdi4PKghoJ5ykYPsLeshbdd9s24GeVYJoVY6q+Pop7z368cwUrVcQ==
X-Received: by 2002:a62:4e8d:0:b0:58d:b8f8:5e2f with SMTP id c135-20020a624e8d000000b0058db8f85e2fmr4214285pfb.10.1673965025942;
        Tue, 17 Jan 2023 06:17:05 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id g8-20020aa79f08000000b0058d928374f2sm4998701pfr.20.2023.01.17.06.17.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:17:05 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id 7so22063415pga.1
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 06:17:05 -0800 (PST)
X-Received: by 2002:a63:2447:0:b0:4be:c5ec:93e1 with SMTP id
 k68-20020a632447000000b004bec5ec93e1mr210343pgk.213.1673965024403; Tue, 17
 Jan 2023 06:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20230116160455.27723-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230116160455.27723-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 17 Jan 2023 15:16:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCsa3M6cnNX6jFHddXAsJ7TM78rhKSUN-WC91LtPVZovFw@mail.gmail.com>
Message-ID: <CANiDSCsa3M6cnNX6jFHddXAsJ7TM78rhKSUN-WC91LtPVZovFw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Work around too little video controls size
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Giuliano Lotta <giuliano.lotta@gmail.com>
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

Just minor nipitks.

On Mon, 16 Jan 2023 at 17:04, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The size of the video probe & commit controls depends on the UVC
> protocol version. Some devices, namely the Quanta ACER HD User Facing
> (0408:4033 and 0408:4035), claim to support the UVC 1.5 protocol, but
> return only 26 bytes of data when queried with GET_CUR for those
> controls. This causes probing of the device to fail.
>
> Work around this non-compliance by lowering the size of the control when
> the device returns less data than expected, but still a valid size for
> one of the existing UVC versions. The size is cached and used for
> subsequent queries of the probe and commit controls.
>
> Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 48 +++++++++++++++++++------------
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  include/uapi/linux/usb/video.h    |  4 +++
>  3 files changed, 35 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 9634596f3dc7..23f3179a013f 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -272,24 +272,10 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         }
>  }
>
> -static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> -{
> -       /*
> -        * Return the size of the video probe and commit controls, which depends
> -        * on the protocol version.
> -        */
> -       if (stream->dev->uvc_version < 0x0110)
> -               return 26;
> -       else if (stream->dev->uvc_version < 0x0150)
> -               return 34;
> -       else
> -               return 48;
> -}
> -
>  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>         struct uvc_streaming_control *ctrl, int probe, u8 query)
>  {
> -       u16 size = uvc_video_ctrl_size(stream);
> +       u16 size = stream->ctrl_size;
>         u8 *data;
>         int ret;
>
> @@ -329,6 +315,20 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>                         "Enabling workaround.\n");
>                 ret = -EIO;
>                 goto out;
> +       } else if (ret < size &&

what about (ret != size) {
  switch (ret) {
   case UVC_STREAMING_CONTROL_SIZE_V1_0:
   case UVC_STREAMING_CONTROL_SIZE_V1_1:
   case UVC_STREAMING_CONTROL_SIZE_V1_5:
      printk(stream at vendor)
      stream->ctrl_size = ret;
      size = ret;
     break;
   default:
     printk(fatal error)
     return -EIO;
     break;
 }

}

> +                  (ret == UVC_STREAMING_CONTROL_SIZE_V1_0 ||
> +                   ret == UVC_STREAMING_CONTROL_SIZE_V1_1)) {
> +               /*
> +                * Some Quanta cameras (for instance 0408:4033 and 0408:4035)
> +                * advertise UVC 1.5 compliance but only returns 26 bytes of
> +                * data for the video probe and commit controls.
> +                */
> +               dev_warn(&stream->intf->dev,
> +                        "UVC non compliance: video control size %u < %u as required by UVC v%u.%02x. Enabling workaround.\n",
> +                        ret, size, stream->dev->uvc_version >> 8,
> +                        stream->dev->uvc_version & 0xff);
> +               stream->ctrl_size = ret;
> +               size = ret;
>         } else if (ret != size) {
>                 dev_err(&stream->intf->dev,
>                         "Failed to query (%u) UVC %s control : %d (exp. %u).\n",
> @@ -349,7 +349,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>         ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
>         ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
>
> -       if (size >= 34) {
> +       if (size >= UVC_STREAMING_CONTROL_SIZE_V1_1) {
>                 ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
>                 ctrl->bmFramingInfo = data[30];
>                 ctrl->bPreferedVersion = data[31];
> @@ -379,7 +379,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>         struct uvc_streaming_control *ctrl, int probe)
>  {
> -       u16 size = uvc_video_ctrl_size(stream);
> +       u16 size = stream->ctrl_size;
>         u8 *data;
>         int ret;
>
> @@ -399,7 +399,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>         put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
>         put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
>
> -       if (size >= 34) {
> +       if (size >= UVC_STREAMING_CONTROL_SIZE_V1_1) {
>                 put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
>                 data[30] = ctrl->bmFramingInfo;
>                 data[31] = ctrl->bPreferedVersion;
> @@ -2148,6 +2148,18 @@ int uvc_video_init(struct uvc_streaming *stream)
>
>         atomic_set(&stream->active, 0);
>
> +       /*
> +        * Set the probe & commit control size based on the UVC protocol
> +        * version. It may be overridden by uvc_get_video_ctrl() for devices
> +        * that don't comply with the UVC version they report.
> +        */
> +       if (stream->dev->uvc_version < 0x0110)
> +               stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_0;
> +       else if (stream->dev->uvc_version < 0x0150)
> +               stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_1;
> +       else
> +               stream->ctrl_size = UVC_STREAMING_CONTROL_SIZE_V1_5;
> +
>         /*
>          * Alternate setting 0 should be the default, yet the XBox Live Vision
>          * Cam (and possibly other devices) crash or otherwise misbehave if
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 72189249719e..151d8d27cbbc 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -441,6 +441,7 @@ struct uvc_streaming {
>         struct uvc_format *format;
>
>         struct uvc_streaming_control ctrl;
> +       unsigned int ctrl_size;
>         struct uvc_format *def_format;
>         struct uvc_format *cur_format;
>         struct uvc_frame *cur_frame;
> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
> index 6e8e572c2980..7cb7713db757 100644
> --- a/include/uapi/linux/usb/video.h
> +++ b/include/uapi/linux/usb/video.h
> @@ -454,6 +454,10 @@ struct uvc_streaming_control {
>         __u8  bMaxVersion;
>  } __attribute__((__packed__));
>
> +#define UVC_STREAMING_CONTROL_SIZE_V1_0                        26
> +#define UVC_STREAMING_CONTROL_SIZE_V1_1                        34
> +#define UVC_STREAMING_CONTROL_SIZE_V1_5                        48

Maybe a future improvement, convert this to a nice structure

> +
>  /* Uncompressed Payload - 3.1.1. Uncompressed Video Format Descriptor */
>  struct uvc_format_uncompressed {
>         __u8  bLength;
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
