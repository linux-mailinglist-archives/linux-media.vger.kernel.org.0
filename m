Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F632702E14
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 15:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242229AbjEON22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 09:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241949AbjEON21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 09:28:27 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE5819A6
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:28:25 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-757807cb299so484825585a.2
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684157305; x=1686749305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eVr0MGOtDC9ZiLk1VzuJVCvh40Kenk2n3OLqC56HbbE=;
        b=ijBj/yTzodU8uNPG1A/8JFqtg9LYJo/AS2aHR1a5f+dvMoomEjWNMIQibnxfGJ06p5
         nIklF7GjtL83wa7iOFJ9yY6JRQ9xf43tAsS0p9XjWV8kanTbOGUiSEuy32F/KnzovRX+
         WjlFtOlSD5OwZn4U2FnNSyEdX4Y9H7BV8LEy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157305; x=1686749305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVr0MGOtDC9ZiLk1VzuJVCvh40Kenk2n3OLqC56HbbE=;
        b=gm0TdwumqSTRr7MF+djPBYdUx9A4qj5WeCRKunQ9jpm6weSFH0U5c4YtNMcMQKntFY
         7I2FW8duXuqmtNe06M+nTKEzPj4Cv/j2wSk+BXiDy5t/sStdGMglzz/iCaM4xF3a1rtt
         mAJUM61pYRRh/2jiyt+64E1gGNalZdiBpHAFY+huS1Kxb9hsmw3xvtICcZi3cEeS6cPU
         VIOF/aHVQRWYzstHg61bfQQdJliNzikq5myLo8WU50Wf5tzRC8yj6GYlOB+PJNL+GGvV
         krpZYHBYhdZMli9JCz6MWZDSZLnC7aAFGE/KswoKYY3hLNhbLXt87YeoG1v1yF9kxIEl
         jB+A==
X-Gm-Message-State: AC+VfDxpM4sFHAgJjv733lZ2WVGKSpH+0QiFKR3hEEbIpCteDQdiWuR+
        Vy0sBRO/Qf4/aGlg8r81rPkbtdhAWl+LPvHy9mo=
X-Google-Smtp-Source: ACHHUZ4ff876GI5S6tQjGZ0SW92iQQt2RKAaOjzYYecm7YhN6NkOokmmk0Tb/txOOnPsIktY7OYJOA==
X-Received: by 2002:a05:622a:487:b0:3f5:3b0d:b41e with SMTP id p7-20020a05622a048700b003f53b0db41emr256056qtx.16.1684157304555;
        Mon, 15 May 2023 06:28:24 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id u3-20020ae9c003000000b0074df476504asm7250069qkk.61.2023.05.15.06.28.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 06:28:24 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-61b40562054so60908686d6.2
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:28:24 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:5f1:5f73:aed7 with SMTP id
 z14-20020a056214040e00b005f15f73aed7mr54967714qvx.27.1684157303526; Mon, 15
 May 2023 06:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com> <20230506071427.28108-7-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230506071427.28108-7-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 15:28:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSa2O4QcOn13HA1UJD_GsNL-Xzz9GmyU85re0S6N7ysg@mail.gmail.com>
Message-ID: <CANiDSCvSa2O4QcOn13HA1UJD_GsNL-Xzz9GmyU85re0S6N7ysg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] media: uvcvideo: Constify formats, frames and intervals
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 6 May 2023 at 09:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The formats, frames and intervals stored in the uvc_streaming structure
> are not meant to change after being parsed at probe time. Make them
> const to prevent unintended modifications, and adapt the probe code
> accordingly to use non-const pointers during parsing.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++--------
>  drivers/media/usb/uvc/uvc_v4l2.c   | 31 +++++++++++++++---------------
>  drivers/media/usb/uvc/uvc_video.c  |  8 ++++----
>  drivers/media/usb/uvc/uvcvideo.h   | 12 ++++++------
>  4 files changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 11e4fa007f3f..b68fa7d17e41 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -221,7 +221,8 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
>
>  static int uvc_parse_format(struct uvc_device *dev,
>         struct uvc_streaming *streaming, struct uvc_format *format,
> -       u32 **intervals, unsigned char *buffer, int buflen)
> +       struct uvc_frame *frames, u32 **intervals, unsigned char *buffer,
> +       int buflen)
>  {
>         struct usb_interface *intf = streaming->intf;
>         struct usb_host_interface *alts = intf->cur_altsetting;
> @@ -235,6 +236,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>         format->type = buffer[2];
>         format->index = buffer[3];
> +       format->frames = frames;
>
>         switch (buffer[2]) {
>         case UVC_VS_FORMAT_UNCOMPRESSED:
> @@ -339,8 +341,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 ftype = 0;
>
>                 /* Create a dummy frame descriptor. */
> -               frame = &format->frames[0];
> -               memset(&format->frames[0], 0, sizeof(format->frames[0]));
> +               frame = &frames[0];
> +               memset(frame, 0, sizeof(*frame));
>                 frame->bFrameIntervalType = 1;
>                 frame->dwDefaultFrameInterval = 1;
>                 frame->dwFrameInterval = *intervals;
> @@ -372,7 +374,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>                buffer[2] == ftype) {
>                 unsigned int maxIntervalIndex;
>
> -               frame = &format->frames[format->nframes];
> +               frame = &frames[format->nframes];
>                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
>                         n = buflen > 25 ? buffer[25] : 0;
>                 else
> @@ -455,8 +457,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>                  */
>                 if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
>                         frame->bFrameIntervalType = 1;
> -                       frame->dwFrameInterval[0] =
> -                               frame->dwDefaultFrameInterval;
> +                       (*intervals)[0] = frame->dwDefaultFrameInterval;
>                 }
>
>                 uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> @@ -701,8 +702,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                 case UVC_VS_FORMAT_MJPEG:
>                 case UVC_VS_FORMAT_DV:
>                 case UVC_VS_FORMAT_FRAME_BASED:
> -                       format->frames = frame;
> -                       ret = uvc_parse_format(dev, streaming, format,
> +                       ret = uvc_parse_format(dev, streaming, format, frame,
>                                 &interval, buffer, buflen);
>                         if (ret < 0)
>                                 goto error;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index e7261b2543cb..5ac2a424b13d 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -161,7 +161,7 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>   * the Video Probe and Commit negotiation, but some hardware don't implement
>   * that feature.
>   */
> -static u32 uvc_try_frame_interval(struct uvc_frame *frame, u32 interval)
> +static u32 uvc_try_frame_interval(const struct uvc_frame *frame, u32 interval)
>  {
>         unsigned int i;
>
> @@ -210,10 +210,11 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
>
>  static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>         struct v4l2_format *fmt, struct uvc_streaming_control *probe,
> -       struct uvc_format **uvc_format, struct uvc_frame **uvc_frame)
> +       const struct uvc_format **uvc_format,
> +       const struct uvc_frame **uvc_frame)
>  {
> -       struct uvc_format *format = NULL;
> -       struct uvc_frame *frame = NULL;
> +       const struct uvc_format *format = NULL;
> +       const struct uvc_frame *frame = NULL;
>         u16 rw, rh;
>         unsigned int d, maxd;
>         unsigned int i;
> @@ -363,8 +364,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  static int uvc_v4l2_get_format(struct uvc_streaming *stream,
>         struct v4l2_format *fmt)
>  {
> -       struct uvc_format *format;
> -       struct uvc_frame *frame;
> +       const struct uvc_format *format;
> +       const struct uvc_frame *frame;
>         int ret = 0;
>
>         if (fmt->type != stream->type)
> @@ -398,8 +399,8 @@ static int uvc_v4l2_set_format(struct uvc_streaming *stream,
>         struct v4l2_format *fmt)
>  {
>         struct uvc_streaming_control probe;
> -       struct uvc_format *format;
> -       struct uvc_frame *frame;
> +       const struct uvc_format *format;
> +       const struct uvc_frame *frame;
>         int ret;
>
>         if (fmt->type != stream->type)
> @@ -465,8 +466,8 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>  {
>         struct uvc_streaming_control probe;
>         struct v4l2_fract timeperframe;
> -       struct uvc_format *format;
> -       struct uvc_frame *frame;
> +       const struct uvc_format *format;
> +       const struct uvc_frame *frame;
>         u32 interval, maxd;
>         unsigned int i;
>         int ret;
> @@ -697,7 +698,7 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
>  static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>                               struct v4l2_fmtdesc *fmt)
>  {
> -       struct uvc_format *format;
> +       const struct uvc_format *format;
>         enum v4l2_buf_type type = fmt->type;
>         u32 index = fmt->index;
>
> @@ -1249,8 +1250,8 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
>  {
>         struct uvc_fh *handle = fh;
>         struct uvc_streaming *stream = handle->stream;
> -       struct uvc_format *format = NULL;
> -       struct uvc_frame *frame = NULL;
> +       const struct uvc_format *format = NULL;
> +       const struct uvc_frame *frame = NULL;
>         unsigned int index;
>         unsigned int i;
>
> @@ -1289,8 +1290,8 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>  {
>         struct uvc_fh *handle = fh;
>         struct uvc_streaming *stream = handle->stream;
> -       struct uvc_format *format = NULL;
> -       struct uvc_frame *frame = NULL;
> +       const struct uvc_format *format = NULL;
> +       const struct uvc_frame *frame = NULL;
>         unsigned int nintervals;
>         unsigned int index;
>         unsigned int i;
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 34c781b7dee2..28dde08ec6c5 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -137,8 +137,8 @@ static const struct usb_device_id elgato_cam_link_4k = {
>  static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         struct uvc_streaming_control *ctrl)
>  {
> -       struct uvc_format *format = NULL;
> -       struct uvc_frame *frame = NULL;
> +       const struct uvc_format *format = NULL;
> +       const struct uvc_frame *frame = NULL;
>         unsigned int i;
>
>         /*
> @@ -2100,8 +2100,8 @@ int uvc_video_resume(struct uvc_streaming *stream, int reset)
>  int uvc_video_init(struct uvc_streaming *stream)
>  {
>         struct uvc_streaming_control *probe = &stream->ctrl;
> -       struct uvc_format *format = NULL;
> -       struct uvc_frame *frame = NULL;
> +       const struct uvc_format *format = NULL;
> +       const struct uvc_frame *frame = NULL;
>         struct uvc_urb *uvc_urb;
>         unsigned int i;
>         int ret;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index bb0773637171..6fb0a78b1b00 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -251,7 +251,7 @@ struct uvc_frame {
>         u32 dwMaxVideoFrameBufferSize;
>         u8  bFrameIntervalType;
>         u32 dwDefaultFrameInterval;
> -       u32 *dwFrameInterval;
> +       const u32 *dwFrameInterval;
>  };
>
>  struct uvc_format {
> @@ -265,7 +265,7 @@ struct uvc_format {
>         u32 flags;
>
>         unsigned int nframes;
> -       struct uvc_frame *frames;
> +       const struct uvc_frame *frames;
>  };
>
>  struct uvc_streaming_header {
> @@ -438,12 +438,12 @@ struct uvc_streaming {
>         enum v4l2_buf_type type;
>
>         unsigned int nformats;
> -       struct uvc_format *formats;
> +       const struct uvc_format *formats;
>
>         struct uvc_streaming_control ctrl;
> -       struct uvc_format *def_format;
> -       struct uvc_format *cur_format;
> -       struct uvc_frame *cur_frame;
> +       const struct uvc_format *def_format;
> +       const struct uvc_format *cur_format;
> +       const struct uvc_frame *cur_frame;
>
>         /*
>          * Protect access to ctrl, cur_format, cur_frame and hardware video
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
