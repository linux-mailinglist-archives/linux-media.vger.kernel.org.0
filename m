Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEC2702C7B
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241472AbjEOMQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241567AbjEOMQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:16:38 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC44E58
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:16:26 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3f392680773so45917271cf.0
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684152985; x=1686744985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3jRoFLpEphCslfhTHT5iJ8BhqxLIeAAp+162LOWmgg=;
        b=kiRm5CNaJCotXZz72cyshkOoxPSlMkJsKqX8jF2T8m0ZOS/XbO+8Bsg3BZCFOyXp0q
         7cpw0tp29TmLQ91rPF7cIsbZh2JevkWblU+MtEjfDKn+YxpBg90J0DbCfdf6RhyTAXl6
         zAls09exzkm/ygiTpLegtgs8riqJQ6RfgEoJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152985; x=1686744985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3jRoFLpEphCslfhTHT5iJ8BhqxLIeAAp+162LOWmgg=;
        b=B/F/hMtS4EFgagE+V+rWowmS7jElz5AWaEsPagq/y0wLlS0c+hwkP2tAEG0+4O64g1
         nUsd8nU1cNVXtGKGYQYVSSxF/25OSMzecEaxjoR3rFvzbT4T5L3eKq0TBmAy+xu6w/K9
         PxTowOz9jftDNifVN7mrXL2eor9lQWRJD1CMiTbRvIgkA0H+socpXKuptaKTIyAuQfqA
         0FgQsOHZQ05F5WeAGMS5y3Fm3KlHkgsZEfTJ/qG+dsVeJP6laRxdJDXcV8ab0uzf/d3c
         FdPdyeX282Jfqw1vMKXw+3TiIbvuFOFLzjTV5E4HBy1/fX6tXpu/XZeuVyruuX7rXkTQ
         B20A==
X-Gm-Message-State: AC+VfDxmgHSaxDEmao9FJxzSwxOz8zNs7sI8F+XnlsXGDWPmCamVRG7x
        O2ZX8d+fy3Je5qKpzuvNuV7st8/SaBocrnSS8SA=
X-Google-Smtp-Source: ACHHUZ5Tn1TPrAwybrm7uwb41XOsKHOXG3ToL9Y9UyYxtNsmioM38B+y2ShuGcNxjBiJS4ooz7HYkQ==
X-Received: by 2002:ac8:59ce:0:b0:3f5:2788:8adb with SMTP id f14-20020ac859ce000000b003f527888adbmr7174933qtf.7.1684152985323;
        Mon, 15 May 2023 05:16:25 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id e4-20020ac84904000000b003f1f87814a4sm4764014qtq.84.2023.05.15.05.16.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 05:16:24 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-61b79b93ac5so56626116d6.0
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:16:24 -0700 (PDT)
X-Received: by 2002:a05:6214:1c8e:b0:615:a18b:d5af with SMTP id
 ib14-20020a0562141c8e00b00615a18bd5afmr47200979qvb.35.1684152984193; Mon, 15
 May 2023 05:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com> <20230506071427.28108-5-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230506071427.28108-5-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 14:16:13 +0200
X-Gmail-Original-Message-ID: <CANiDSCteCqAz9Go3kt8FVmPDuXRbZ-rs7XsWx=yZNhwtLhq_sA@mail.gmail.com>
Message-ID: <CANiDSCteCqAz9Go3kt8FVmPDuXRbZ-rs7XsWx=yZNhwtLhq_sA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] media: uvcvideo: Reorganize format descriptor parsing
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
> Format descriptor parsing has grown over time and now mixes parsing of
> frame intervals with various quirk handling. Reorganize it to make the
> code easier to follow, by parsing frame intervals first, and then
> applying fixes and quirks. No functional change is intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 40 +++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9e597bbbfe07..446bd8ff128c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -405,8 +405,27 @@ static int uvc_parse_format(struct uvc_device *dev,
>                                 get_unaligned_le32(&buffer[17]);
>                         frame->bFrameIntervalType = buffer[21];
>                 }
> +
> +               /*
> +                * Copy the frame intervals.
> +                *
> +                * Some bogus devices report dwMinFrameInterval equal to
> +                * dwMaxFrameInterval and have dwFrameIntervalStep set to
> +                * zero. Setting all null intervals to 1 fixes the problem and
> +                * some other divisions by zero that could happen.
> +                */
>                 frame->dwFrameInterval = *intervals;
>
> +               for (i = 0; i < n; ++i) {
> +                       interval = get_unaligned_le32(&buffer[26+4*i]);
> +                       *(*intervals)++ = interval ? interval : 1;
> +               }
> +
> +               /*
> +                * Apply more fixes, quirks and workarounds to handle incorrect
> +                * or broken descriptors.
> +                */
> +
>                 /*
>                  * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
>                  * completely. Observed behaviours range from setting the
> @@ -420,27 +439,18 @@ static int uvc_parse_format(struct uvc_device *dev,
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
> -               /*
> -                * Make sure that the default frame interval stays between
> -                * the boundaries.
> -                */
> +               /* Clamp the default frame interval to the boundaries. */
>                 n -= frame->bFrameIntervalType ? 1 : 2;
>                 frame->dwDefaultFrameInterval =
>                         clamp(frame->dwDefaultFrameInterval,
>                               frame->dwFrameInterval[0],
>                               frame->dwFrameInterval[n]);
>
> +               /*
> +                * Some devices report frame intervals that are not functional.
> +                * If the corresponding quirk is set, restrict operation to the
> +                * first interval only.
> +                */
>                 if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
>                         frame->bFrameIntervalType = 1;
>                         frame->dwFrameInterval[0] =
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
