Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3B945F1CE
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 17:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236327AbhKZQ3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 11:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbhKZQ1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 11:27:08 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE7CC0619E6
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 08:14:48 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id o4so9351125pfp.13
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LmXcykHjcDxReHC8KVVXYIFulm9zhgJErLAIIaZdKFs=;
        b=V2aAIhzpPtizx5kUWWqsDwM8AGMReBhZjWk2H4gMznGacuVLwuVEP315xVEnPbgqUW
         NWcuCYIuiU4/7x+V25DJYiG13HrdH3jWljM0CYjOLZ4JLgiOCmykfiSGaKJaro7AGm8B
         dm75q82lEF3di2l+Sn/QKcaQVk+Yco0fXGfWscdM6jvx9oEpLmJmbNNgIy+39anF8SKe
         Q33myt7xI9hwpORA0MXFaJlZvwWQeS6pfUT30j5ZVg94EgcAESOovmzDrx36R0lGEBGc
         4/LO5d/w/V+9/OmL2I8tJqy1T6FJEb9P1vfhbfy0O7k05pjKQPuQNIrJNH+YLaaKl+V/
         3uYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LmXcykHjcDxReHC8KVVXYIFulm9zhgJErLAIIaZdKFs=;
        b=1xX7PMa3/KV3AVgwUQ1OquAHkijlETLxvp64+ccln5z/t7DQFrkKa3Q/xgh5ek3MCK
         zABT/i1qnSeogf1oVQLx0MA1YR2hSgTDC/eZCCNyDwer+VSaGmXLrQliDSgk0E+IZRnx
         v39cEXTo+9nXxfC8qVYmmVOtqBxQWSkuJIjIABFzRGsACUoPb3HWHZDV+3O61VI6m+DC
         3ps8GcdDTyhGzJq15pzm8FE2B7i9ry+9D3pmc1he2dhwu9rKFvkNYmwKpwqYWvqpQPup
         qYlISfSPzoJ0W1rYVlMxvNgP4+nHlWoHahmGs9Tu6EDjGvHsBv5IB29+7sCYnFXglt9G
         9+Nw==
X-Gm-Message-State: AOAM532dVLmhHFeDqhYAqAO4677ZaKYs0y4fuUQnF48bZS+6JlrGUAnR
        40rvgkqCfogGcznpX7dOX6HdJ/0kbcNIeQzQ+RE=
X-Google-Smtp-Source: ABdhPJxEV+upaX/HHM6jvEsrW3V39ucqATdWAmPcuDVO1XxFyhLsR/tvQEn6xbk/KnlkkObvK4VdFKyRtIkt85nNNgQ=
X-Received: by 2002:a63:e06:: with SMTP id d6mr22405191pgl.449.1637943288082;
 Fri, 26 Nov 2021 08:14:48 -0800 (PST)
MIME-Version: 1.0
References: <0d3ee0aa-0f1f-4670-a5cc-8dd982e2e3b0@xs4all.nl>
In-Reply-To: <0d3ee0aa-0f1f-4670-a5cc-8dd982e2e3b0@xs4all.nl>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 26 Nov 2021 17:14:31 +0100
Message-ID: <CAPybu_0Z_Sa1OqVWVhK0RmPchxH1Z=N_BDZft66Bd-uBxpMTBQ@mail.gmail.com>
Subject: Re: [PATCH] uvc: fix sequence counting
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans

What if we make something like:

#define UVC_STREAM_FID_UNINITIALISED (UVC_STREAM_FID + 1)

and then use that define at the initialization and in decode_start() ?
I think it will be clearer than the current comparison.


Also you might want to wait to assign "stream->last_fid = fid;" until
line 1106, because otherwise the "Dropping payload" will be triggered
(I believe)

Thanks!

PS: You will get better response time if you email me at
ribalda@chromium.org , not much time recently for the personal email
:(





On Wed, Nov 24, 2021 at 11:49 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> When you start streaming from uvc, then the first buffer will
> have sequence number 0 and the second buffer has sequence number
> 2. Fix the logic to ensure proper monotonically increasing sequence
> numbers.
>
> The root cause is not setting last_fid when you start streaming
> and a new fid is found for the first time.
>
> This patch also changes the initial last_fid value from -1 to 0xff.
> Since last_fid is unsigned, it is better to stick to unsigned values.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 9f37eaf28ce7..8ba8d25e2c4a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1055,7 +1055,10 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>          * that discontinuous sequence numbers always indicate lost frames.
>          */
>         if (stream->last_fid != fid) {
> -               stream->sequence++;
> +               if (stream->last_fid > UVC_STREAM_FID)
> +                       stream->last_fid = fid;
> +               else
> +                       stream->sequence++;
>                 if (stream->sequence)
>                         uvc_video_stats_update(stream);
>         }
> @@ -1080,7 +1083,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>
>         /* Synchronize to the input stream by waiting for the FID bit to be
>          * toggled when the the buffer state is not UVC_BUF_STATE_ACTIVE.
> -        * stream->last_fid is initialized to -1, so the first isochronous
> +        * stream->last_fid is initialized to 0xff, so the first isochronous
>          * frame will always be in sync.
>          *
>          * If the device doesn't toggle the FID bit, invert stream->last_fid
> @@ -1111,7 +1114,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>          * last payload can be lost anyway). We thus must check if the FID has
>          * been toggled.
>          *
> -        * stream->last_fid is initialized to -1, so the first isochronous
> +        * stream->last_fid is initialized to 0xff, so the first isochronous
>          * frame will never trigger an end of frame detection.
>          *
>          * Empty buffers (bytesused == 0) don't trigger end of frame detection
> @@ -1895,7 +1898,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>         int ret;
>
>         stream->sequence = -1;
> -       stream->last_fid = -1;
> +       stream->last_fid = 0xff;
>         stream->bulk.header_size = 0;
>         stream->bulk.skip_payload = 0;
>         stream->bulk.payload_size = 0;
> --
> 2.33.0
>


--
Ricardo Ribalda
