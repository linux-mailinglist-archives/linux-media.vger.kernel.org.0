Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8626F3192
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjEANil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 09:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjEANik (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 09:38:40 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B91CA2
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 06:38:39 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b46186c03so2923287b3a.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682948318; x=1685540318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MSJWT7lvmfvzWH63TxV6x/8iCdXVLSBoqZ3ficZ3C8s=;
        b=KCGYD7vXecv0OwO4pE0tATGrcoe329dta6let0vVZWHYD7Bxum2Ez47R1Vg/+vIRDg
         DDUT0rl2heEbhPjCn8FefFZOJ2buVaLBu5F1LjJitbLiZlua4A6Tv45mebr5RCRSXIH6
         qrJZrRM0/bvvv1y8UE5foqmFwq1pUdwfJS1SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682948318; x=1685540318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSJWT7lvmfvzWH63TxV6x/8iCdXVLSBoqZ3ficZ3C8s=;
        b=Coaq+1qQLD3UU3Znd+UCxmjyDu+dH5F0Lg8TVqiXVUWIK2xGDxlBzc6/DcWWdCYXF/
         f/fxxZGGdfDSSGwtNFQHAVhi30dpjUiU5+em1F32CiVsopTIow6qZ9kwyU5+/HMJKmIO
         ujW1bFdio2CeL77oQUuUUaWDNZzjq8/+iPbLM8EPTN0PSKvw0OXAIB0iknfWYgO82xwX
         4iAGiHvpWS02V5jht6gk2Ob2/Jm0FZxqp0J8DGSR8TuabVq8j/y3amH1U5J2EQk4PGai
         ALQ0gL03EJfZUj73OllIuTu5itvXk49N18sDWvQM+bRbgfDutxhcw4qUVG/qxVhkGC4k
         MWLA==
X-Gm-Message-State: AC+VfDyr3SFEU1puaMLXbsFUHA4MQEsOHJ2L3oaxpbheBPm5V9CybmMH
        OlraMUvhyhXimuxd4alxSrGgL+RYNS3y6EI17sS9Lg==
X-Google-Smtp-Source: ACHHUZ58QEghSd3XDMV9Pa56pgB2AKHoFORaBK6Izti+BDA/VDFQV0SzpdvD50slKzC5xWg2pkya0A==
X-Received: by 2002:a05:6a21:7893:b0:f2:c2a3:3b4 with SMTP id bf19-20020a056a21789300b000f2c2a303b4mr16788995pzc.41.1682948318591;
        Mon, 01 May 2023 06:38:38 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id gw13-20020a17090b0a4d00b002470b9503desm19241273pjb.55.2023.05.01.06.38.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 06:38:38 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aad6f2be8eso19281245ad.3
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 06:38:38 -0700 (PDT)
X-Received: by 2002:a17:903:32d0:b0:1aa:f6c3:bd39 with SMTP id
 i16-20020a17090332d000b001aaf6c3bd39mr3912356plr.20.1682948317516; Mon, 01
 May 2023 06:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com> <20230420100958.10631-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230420100958.10631-3-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 1 May 2023 15:38:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCtwPcm9ie5XC=Kdfs96BDpey17g10R7yNmCTeBYL=FFLg@mail.gmail.com>
Message-ID: <CANiDSCtwPcm9ie5XC=Kdfs96BDpey17g10R7yNmCTeBYL=FFLg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] media: uvcvideo: Rename uvc_format 'frame' field
 to 'frames'
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

On Thu, 20 Apr 2023 at 12:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The uvc_format 'frame' field points to an array of frames. Rename it to
> 'frames' to make this clearer.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  8 ++++----
>  drivers/media/usb/uvc/uvc_v4l2.c   | 32 +++++++++++++++---------------
>  drivers/media/usb/uvc/uvc_video.c  |  6 +++---
>  drivers/media/usb/uvc/uvcvideo.h   |  2 +-
>  4 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 77d4403b0b4f..16a6ab437c6a 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -339,8 +339,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 ftype = 0;
>
>                 /* Create a dummy frame descriptor. */
> -               frame = &format->frame[0];
> -               memset(&format->frame[0], 0, sizeof(format->frame[0]));
> +               frame = &format->frames[0];
> +               memset(&format->frames[0], 0, sizeof(format->frames[0]));
>                 frame->bFrameIntervalType = 1;
>                 frame->dwDefaultFrameInterval = 1;
>                 frame->dwFrameInterval = *intervals;
> @@ -370,7 +370,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>          */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>                buffer[2] == ftype) {
> -               frame = &format->frame[format->nframes];
> +               frame = &format->frames[format->nframes];
>                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
>                         n = buflen > 25 ? buffer[25] : 0;
>                 else
> @@ -687,7 +687,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                 case UVC_VS_FORMAT_MJPEG:
>                 case UVC_VS_FORMAT_DV:
>                 case UVC_VS_FORMAT_FRAME_BASED:
> -                       format->frame = frame;
> +                       format->frames = frame;
>                         ret = uvc_parse_format(dev, streaming, format,
>                                 &interval, buffer, buflen);
>                         if (ret < 0)
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 6960d7ebd904..e7261b2543cb 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -255,14 +255,14 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>         maxd = (unsigned int)-1;
>
>         for (i = 0; i < format->nframes; ++i) {
> -               u16 w = format->frame[i].wWidth;
> -               u16 h = format->frame[i].wHeight;
> +               u16 w = format->frames[i].wWidth;
> +               u16 h = format->frames[i].wHeight;
>
>                 d = min(w, rw) * min(h, rh);
>                 d = w*h + rw*rh - 2*d;
>                 if (d < maxd) {
>                         maxd = d;
> -                       frame = &format->frame[i];
> +                       frame = &format->frames[i];
>                 }
>
>                 if (maxd == 0)
> @@ -331,8 +331,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>                         probe->bFormatIndex);
>
>         for (i = 0; i < format->nframes; ++i) {
> -               if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
> -                       frame = &format->frame[i];
> +               if (probe->bFrameIndex == format->frames[i].bFrameIndex) {
> +                       frame = &format->frames[i];
>                         break;
>                 }
>         }
> @@ -501,19 +501,19 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
>         for (i = 0; i < format->nframes && maxd != 0; i++) {
>                 u32 d, ival;
>
> -               if (&format->frame[i] == stream->cur_frame)
> +               if (&format->frames[i] == stream->cur_frame)
>                         continue;
>
> -               if (format->frame[i].wWidth != stream->cur_frame->wWidth ||
> -                   format->frame[i].wHeight != stream->cur_frame->wHeight)
> +               if (format->frames[i].wWidth != stream->cur_frame->wWidth ||
> +                   format->frames[i].wHeight != stream->cur_frame->wHeight)
>                         continue;
>
> -               ival = uvc_try_frame_interval(&format->frame[i], interval);
> +               ival = uvc_try_frame_interval(&format->frames[i], interval);
>                 d = abs((s32)ival - interval);
>                 if (d >= maxd)
>                         continue;
>
> -               frame = &format->frame[i];
> +               frame = &format->frames[i];
>                 probe.bFrameIndex = frame->bFrameIndex;
>                 probe.dwFrameInterval = ival;
>                 maxd = d;
> @@ -1266,10 +1266,10 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
>
>         /* Skip duplicate frame sizes */
>         for (i = 0, index = 0; i < format->nframes; i++) {
> -               if (frame && frame->wWidth == format->frame[i].wWidth &&
> -                   frame->wHeight == format->frame[i].wHeight)
> +               if (frame && frame->wWidth == format->frames[i].wWidth &&
> +                   frame->wHeight == format->frames[i].wHeight)
>                         continue;
> -               frame = &format->frame[i];
> +               frame = &format->frames[i];
>                 if (index == fsize->index)
>                         break;
>                 index++;
> @@ -1307,9 +1307,9 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
>
>         index = fival->index;
>         for (i = 0; i < format->nframes; i++) {
> -               if (format->frame[i].wWidth == fival->width &&
> -                   format->frame[i].wHeight == fival->height) {
> -                       frame = &format->frame[i];
> +               if (format->frames[i].wWidth == fival->width &&
> +                   format->frames[i].wHeight == fival->height) {
> +                       frame = &format->frames[i];
>                         nintervals = frame->bFrameIntervalType ?: 1;
>                         if (index < nintervals)
>                                 break;
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index af540f435099..34c781b7dee2 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -176,8 +176,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>                 return;
>
>         for (i = 0; i < format->nframes; ++i) {
> -               if (format->frame[i].bFrameIndex == ctrl->bFrameIndex) {
> -                       frame = &format->frame[i];
> +               if (format->frames[i].bFrameIndex == ctrl->bFrameIndex) {
> +                       frame = &format->frames[i];
>                         break;
>                 }
>         }
> @@ -2179,7 +2179,7 @@ int uvc_video_init(struct uvc_streaming *stream)
>          * descriptor is not found, use the first available frame.
>          */
>         for (i = format->nframes; i > 0; --i) {
> -               frame = &format->frame[i-1];
> +               frame = &format->frames[i-1];
>                 if (frame->bFrameIndex == probe->bFrameIndex)
>                         break;
>         }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9c8bea8d405c..7b4bf52da19d 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -265,7 +265,7 @@ struct uvc_format {
>         u32 flags;
>
>         unsigned int nframes;
> -       struct uvc_frame *frame;
> +       struct uvc_frame *frames;
>  };
>
>  struct uvc_streaming_header {
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
