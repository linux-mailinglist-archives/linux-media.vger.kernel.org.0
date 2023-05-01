Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5386F3191
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 15:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjEANgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 09:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjEANgh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 09:36:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3F195
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 06:36:36 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64115e652eeso26756014b3a.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682948195; x=1685540195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f2Jl5fSh4aT8vtOxFgI7vaM6Ciwk5h/mm9D05bOYFrs=;
        b=gc4uHivexp42A1q9KL7MqdZIbh8ZznDCgKh1Tp24D16UjlZps0WSuFFqnON2BdIxxQ
         fGevYXRHWXdzrf9Mg+8OlfVbdt4f0jnKiIPggjQGVYXvaY9B8MkSrZW5/T8dZluMrapF
         4VVX0dQN8YtGcbg7zXDhCEv863GDz8T0DIFhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682948195; x=1685540195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2Jl5fSh4aT8vtOxFgI7vaM6Ciwk5h/mm9D05bOYFrs=;
        b=ZMk0xtgPkR9flbf2brPXalPGOnWzRkxSUweERXrN5zujkeLtCqkn2z2/kzsY2cdYHc
         clFGPM1Cn40mJYuSOhay+lH74zeKkGEVpzKWjLudyhlma2rlnWeN358dOGuD8c6NokBw
         EZq8jFIvoDtN6N0fOH0u/gkuvEQd4NImOGwJgRURYi579RH7B2GWVbssgQVkZKvnGhzb
         caQl+xDDYYTEciV5YDwWze18rmMkZ2PYK3qE+MugQBxZFMGl935bNPxD0+AlnmGY/8Ue
         /Mfn4H+qvSPjbnnHenuec/jjsrxHzfnjrTVgmYzxTNWLu+sYuZM+QyMhOM6rNyPMQYMk
         r62A==
X-Gm-Message-State: AC+VfDwZ4iAnAySITfF2/tdJTokBvTt+WgAh6gnT6wulrLrd+hj/g466
        vh3TOQB7cqvWDItzEbwAviDFIHbkBnYoaqcRUECUnA==
X-Google-Smtp-Source: ACHHUZ79wqaMsEyct7mFrNJRKNa6cM3DJGCihM0UmuNSH8bbZv5hK8uuNrL73v79IvZ2HlxuCHa1+Q==
X-Received: by 2002:a05:6a00:2407:b0:635:7fb2:2ab4 with SMTP id z7-20020a056a00240700b006357fb22ab4mr16187777pfh.6.1682948195443;
        Mon, 01 May 2023 06:36:35 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id 2-20020a621802000000b0063d24d5f9b6sm19982013pfy.210.2023.05.01.06.36.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 06:36:34 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64115e652eeso26755875b3a.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:36:34 -0700 (PDT)
X-Received: by 2002:a17:90b:f8f:b0:24d:e504:c475 with SMTP id
 ft15-20020a17090b0f8f00b0024de504c475mr7763482pjb.21.1682948194107; Mon, 01
 May 2023 06:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com> <20230420100958.10631-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230420100958.10631-2-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 15:36:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCuxzidaZ-vD4a4OvMUjCD=6=OE4m6P_oyvnpf830CeQ1g@mail.gmail.com>
Message-ID: <CANiDSCuxzidaZ-vD4a4OvMUjCD=6=OE4m6P_oyvnpf830CeQ1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] media: uvcvideo: Rename uvc_streaming 'format'
 field to 'formats'
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

On Thu, 20 Apr 2023 at 12:09, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The uvc_streaming 'format' field points to an array of formats. Rename
> it to 'formats' to make this clearer.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  4 ++--
>  drivers/media/usb/uvc/uvc_v4l2.c   | 16 ++++++++--------
>  drivers/media/usb/uvc/uvc_video.c  |  6 +++---
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  4 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 25b8199f4e82..77d4403b0b4f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -184,7 +184,7 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
>
>         usb_put_intf(stream->intf);
>
> -       kfree(stream->format);
> +       kfree(stream->formats);
>         kfree(stream->header.bmaControls);
>         kfree(stream);
>  }
> @@ -677,7 +677,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         frame = (struct uvc_frame *)&format[nformats];
>         interval = (u32 *)&frame[nframes];
>
> -       streaming->format = format;
> +       streaming->formats = format;
>         streaming->nformats = nformats;

Unrelated question:
For:
size = nformats * sizeof(*format) + nframes * sizeof(*frame)
     + nintervals * sizeof(*interval);
frame = (struct uvc_frame *)&format[nformats];
interval = (u32 *)&frame[nframes];

streaming->format = format;
streaming->nformats = nformats;

We are very lucky that (*format) (*frame) and (*interval) are cache
aligned right?

Maybe we should make 3 allocations?


>
>         /* Parse the format descriptors. */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..6960d7ebd904 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -235,7 +235,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>          * format otherwise.
>          */
>         for (i = 0; i < stream->nformats; ++i) {
> -               format = &stream->format[i];
> +               format = &stream->formats[i];
>                 if (format->fcc == fmt->fmt.pix.pixelformat)
>                         break;
>         }
> @@ -319,8 +319,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>          * accepted the requested format as-is.
>          */
>         for (i = 0; i < stream->nformats; ++i) {
> -               if (probe->bFormatIndex == stream->format[i].index) {
> -                       format = &stream->format[i];
> +               if (probe->bFormatIndex == stream->formats[i].index) {
> +                       format = &stream->formats[i];
>                         break;
>                 }
>         }
> @@ -708,7 +708,7 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>         fmt->index = index;
>         fmt->type = type;
>
> -       format = &stream->format[fmt->index];
> +       format = &stream->formats[fmt->index];
>         fmt->flags = 0;
>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> @@ -1256,8 +1256,8 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
>
>         /* Look for the given pixel format */
>         for (i = 0; i < stream->nformats; i++) {
> -               if (stream->format[i].fcc == fsize->pixel_format) {
> -                       format = &stream->format[i];
> +               if (stream->formats[i].fcc == fsize->pixel_format) {
> +                       format = &stream->formats[i];
>                         break;
>                 }
>         }
> @@ -1297,8 +1297,8 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>
>         /* Look for the given pixel format and frame size */
>         for (i = 0; i < stream->nformats; i++) {
> -               if (stream->format[i].fcc == fival->pixel_format) {
> -                       format = &stream->format[i];
> +               if (stream->formats[i].fcc == fival->pixel_format) {
> +                       format = &stream->formats[i];
>                         break;
>                 }
>         }
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index d4b023d4de7c..af540f435099 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -166,8 +166,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         }
>
>         for (i = 0; i < stream->nformats; ++i) {
> -               if (stream->format[i].index == ctrl->bFormatIndex) {
> -                       format = &stream->format[i];
> +               if (stream->formats[i].index == ctrl->bFormatIndex) {
> +                       format = &stream->formats[i];
>                         break;
>                 }
>         }
> @@ -2161,7 +2161,7 @@ int uvc_video_init(struct uvc_streaming *stream)
>          * available format otherwise.
>          */
>         for (i = stream->nformats; i > 0; --i) {
> -               format = &stream->format[i-1];
> +               format = &stream->formats[i-1];
>                 if (format->index == probe->bFormatIndex)
>                         break;
>         }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 50f171e7381b..9c8bea8d405c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -438,7 +438,7 @@ struct uvc_streaming {
>         enum v4l2_buf_type type;
>
>         unsigned int nformats;
> -       struct uvc_format *format;
> +       struct uvc_format *formats;
>
>         struct uvc_streaming_control ctrl;
>         struct uvc_format *def_format;
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
