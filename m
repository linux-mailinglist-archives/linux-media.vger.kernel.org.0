Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F86702DFF
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 15:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242106AbjEONXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 09:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242229AbjEONWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 09:22:50 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F79270A
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:22:26 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-61b71b7803bso60789856d6.1
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684156945; x=1686748945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ih+ONeuLoQlofj5jBvFIq2LZeRGufL+gLK0QYElCanI=;
        b=VxsV0k9v7dCvwcviqdNaa8MPGJ7iLQzxtTJTSHRRyck3guwx/LtinsGQk2oYtGcrf1
         xqtAf1P1r999qziKTpphufIKr9/pSUCQGQa3/OQe8Ka96j7NxmvRzUTTw2uVBKCzZwsq
         S/GVBNSpKBt2ITPxxRi/6HMItqQlwNg7Syh48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156945; x=1686748945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih+ONeuLoQlofj5jBvFIq2LZeRGufL+gLK0QYElCanI=;
        b=QoBxWWOEY53aT+So8otfSUW/Lryug5QjuHce2T133z4bt/cPlMZpCy5hF3K97BnP4x
         wPvACLyymJQfMXdjeWdAL03wQo2nSZRXfix6jJzEIDyfETcHnMW//7hJgkQM2MHUA5Dm
         GKQvzN7a6q6Wypu+zlzO0PDGOWOWqufHkR0AfFMMhq0dmebl3o77Ll4PQdTBo+aXHcr9
         i/cnw91adTMmG5xxahkdHs8rYaW0QXxpa/Z424AIbpgx45IV1BbQTlkF7vxmwCA0tfS2
         UVoyTXM8MBuUXZij1fLmbK63x+fIE++ufv9fr7nrORgbbR3qPKS2KE1pxAe4g7IAQJ9P
         YKdw==
X-Gm-Message-State: AC+VfDw9zxQ1sCpIanGyXSIsWHlV0h8wsShNeA+AgmEO5Hmi4b3IT3PP
        ZUUDarnV/kPqn/t5behpYJnrSTeAxmzvKfua+gI=
X-Google-Smtp-Source: ACHHUZ5899y4IQGPJ/zSnqeS0kQjjzlPRScfitxV/0tWZ7eQEva7nFeXJRO+TNHZVIvuMm+MA6s2mw==
X-Received: by 2002:a05:6214:f2a:b0:5e0:7ecb:8ffb with SMTP id iw10-20020a0562140f2a00b005e07ecb8ffbmr53749634qvb.8.1684156945436;
        Mon, 15 May 2023 06:22:25 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id l18-20020a0ce512000000b006215c5bb2e9sm3463014qvm.70.2023.05.15.06.22.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 06:22:25 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-619bebafb65so60813836d6.0
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 06:22:24 -0700 (PDT)
X-Received: by 2002:a05:6214:c62:b0:623:7132:af03 with SMTP id
 t2-20020a0562140c6200b006237132af03mr987699qvj.42.1684156944338; Mon, 15 May
 2023 06:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com> <20230506071427.28108-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230506071427.28108-6-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 15:22:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCsLvcsym2nscNuw3oZsZvAnuWO8OD9PGk3==5Wn6oU2rw@mail.gmail.com>
Message-ID: <CANiDSCsLvcsym2nscNuw3oZsZvAnuWO8OD9PGk3==5Wn6oU2rw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] media: uvcvideo: Increment intervals pointer at
 end of parsing
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

Hi Laurent

On Sat, 6 May 2023 at 09:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The intervals pointer is incremented for each interval when parsing the
> format descriptor. This doesn't cause any issue as such, but gets in the
> way of constifying some pointers. Modify the parsing code to index the
> intervals pointer as an array and increment it in one go at end of
> parsing.
>
> Careful readers will notice that the maxIntervalIndex variable is set to
> 1 instead of n - 2 when bFrameIntervalType has a zero value. This is
> functionally equivalent, as n is equal to 3 in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 446bd8ff128c..11e4fa007f3f 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -370,6 +370,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>          */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
>                buffer[2] == ftype) {
> +               unsigned int maxIntervalIndex;
> +
>                 frame = &format->frames[format->nframes];
>                 if (ftype != UVC_VS_FRAME_FRAME_BASED)
>                         n = buflen > 25 ? buffer[25] : 0;
> @@ -418,7 +420,7 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 for (i = 0; i < n; ++i) {
>                         interval = get_unaligned_le32(&buffer[26+4*i]);
> -                       *(*intervals)++ = interval ? interval : 1;
> +                       (*intervals)[i] = interval ? interval : 1;
>                 }
>
>                 /*
> @@ -440,11 +442,11 @@ static int uvc_parse_format(struct uvc_device *dev,
>                                 * frame->wWidth * frame->wHeight / 8;
>
>                 /* Clamp the default frame interval to the boundaries. */
> -               n -= frame->bFrameIntervalType ? 1 : 2;
> +               maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;

Maybe it is worth mentioning that bFrameIntervalType == 0 is a
continuous interval. idex 0 is min and 1 is max.

>                 frame->dwDefaultFrameInterval =
>                         clamp(frame->dwDefaultFrameInterval,
>                               frame->dwFrameInterval[0],
> -                             frame->dwFrameInterval[n]);
> +                             frame->dwFrameInterval[maxIntervalIndex]);
>
>                 /*
>                  * Some devices report frame intervals that are not functional.
> @@ -463,6 +465,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>                         (100000000 / frame->dwDefaultFrameInterval) % 10);
>
>                 format->nframes++;
> +               *intervals += n;
> +
>                 buflen -= buffer[0];
>                 buffer += buffer[0];
>         }
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
