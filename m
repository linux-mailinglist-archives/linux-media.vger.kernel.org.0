Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1266F31DE
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 16:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjEAONN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 10:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjEAONL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 10:13:11 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5460A12D
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 07:13:10 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aae1bb61edso18235845ad.1
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682950389; x=1685542389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5fGc9iGWNOSJblGfFpahcKh9NP090JXXz63uPhxwjmI=;
        b=HmabJ34XyQILZT+GNp90rizgHE6SRJICMrJ3Sk3XQvxMNvVNvFwOfXOb7Txn/u8gvf
         yIIkUTiKZ5QqCGWLnhniwJ+OlJoxJebXNArmAfQFN1vMpqARR0JFZrFh26e47lcETB6w
         0SseNcs069b3N0rEvrBsjp37+BYD1XfwzrwlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682950389; x=1685542389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fGc9iGWNOSJblGfFpahcKh9NP090JXXz63uPhxwjmI=;
        b=ReLht2MYmi5+q5aa9LsJyOMc6TX/f77wraEfn0NMZjFZMHpl345hGicbgrIYlcEtyR
         g1VO7unJ630FuigvsMt3tL2B9LgqIhA0/+XP84ivzm9OXz/bCYbRLZKGagSQR03MNieX
         5JZPfNNKktDQFa6JzPWAS3CKyrdmuQSAPbTYCBvC+ZEf7YCVhXCtoxHZuInPnP9IZ0Ck
         GxRNY23Uzgt4hKhIZEoa3KYJtw+ccqVowE2C9XupWBnX7+gYKCxc/tJsOSmrz6As29/x
         +oh4uFXAvOkxjVIYS+ipNOxBc9NfNDGPlIw8MMbGdZx9gpDQYEOeBsc2YL4uwS3tih1C
         ORLg==
X-Gm-Message-State: AC+VfDzPwipoMnfwizCitKO0WqA+/CIizbjeOw8CodtuqRhWShLCVBu+
        WhBIxJksVhv1zpqXL3GJh74Dy4UoyYhWktHzzxCYQA==
X-Google-Smtp-Source: ACHHUZ7Fxhv315AZ0zC9cVxgMTy3niVzOq6vDF+cIe+pu6hDBxS9pnJZiSnd0XzqjCuFZQr+XerOBw==
X-Received: by 2002:a17:902:ea01:b0:1a6:fe25:412b with SMTP id s1-20020a170902ea0100b001a6fe25412bmr18224490plg.26.1682950389366;
        Mon, 01 May 2023 07:13:09 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id hg4-20020a17090b300400b0024decfb1ec2sm2796296pjb.30.2023.05.01.07.13.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 07:13:08 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-24df6bbf765so1196046a91.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 07:13:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8d:b0:246:61ae:2fbb with SMTP id
 my13-20020a17090b4c8d00b0024661ae2fbbmr15224632pjb.41.1682950387915; Mon, 01
 May 2023 07:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com> <20230420100958.10631-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230420100958.10631-4-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 16:12:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCt6Xq+jCA_ozqR5s7_H72DhZKqGNS8Ag5g-1eLWHkXOBQ@mail.gmail.com>
Message-ID: <CANiDSCt6Xq+jCA_ozqR5s7_H72DhZKqGNS8Ag5g-1eLWHkXOBQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] media: uvcvideo: Constify formats, frames and intervals
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 20 Apr 2023 at 12:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The formats, frames and intervals stored in the uvc_streaming structure
> are not meant to change after being parsed at probe time. Make them
> const to prevent unintended modifications, and adapt the probe code
> accordingly to use non-const pointers during parsing.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 38 +++++++++++++++---------------
>  drivers/media/usb/uvc/uvc_v4l2.c   | 31 ++++++++++++------------
>  drivers/media/usb/uvc/uvc_video.c  |  8 +++----
>  drivers/media/usb/uvc/uvcvideo.h   | 12 +++++-----
>  4 files changed, 45 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 16a6ab437c6a..efc7a36a892e 100644
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
> @@ -370,7 +372,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>          */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>                buffer[2] == ftype) {
> -               frame = &format->frames[format->nframes];
> +               frame = &frames[format->nframes];
>                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
>                         n = buflen > 25 ? buffer[25] : 0;
>                 else
> @@ -420,17 +422,6 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         frame->dwMaxVideoFrameBufferSize = format->bpp
>                                 * frame->wWidth * frame->wHeight / 8;
>
> -               /*
> -                * Some bogus devices report dwMinFrameInterval equal to
> -                * dwMaxFrameInterval and have dwFrameIntervalStep set to
> -                * zero. Setting all null intervals to 1 fixes the problem and
> -                * some other divisions by zero that could happen.
> -                */
> -               for (i = 0; i < n; ++i) {
> -                       interval = get_unaligned_le32(&buffer[26+4*i]);
> -                       *(*intervals)++ = interval ? interval : 1;
> -               }
> -
>                 /*
>                  * Make sure that the default frame interval stays between
>                  * the boundaries.
> @@ -443,8 +434,18 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
>                         frame->bFrameIntervalType = 1;
> -                       frame->dwFrameInterval[0] =
> -                               frame->dwDefaultFrameInterval;
> +                       (*intervals)[0] = frame->dwDefaultFrameInterval;
> +               }
> +
> +               /*
> +                * Some bogus devices report dwMinFrameInterval equal to
> +                * dwMaxFrameInterval and have dwFrameIntervalStep set to
> +                * zero. Setting all null intervals to 1 fixes the problem and
> +                * some other divisions by zero that could happen.
> +                */
> +               for (i = 0; i < n; ++i) {
> +                       interval = get_unaligned_le32(&buffer[26+4*i]);
> +                       *(*intervals)++ = interval ? interval : 1;
>                 }

Aren't we overwriting the previous quirk here?

>
>                 uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> @@ -687,8 +688,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
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
> index 7b4bf52da19d..e04e1e6f4cba 100644
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
