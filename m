Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696B7702C26
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241676AbjEOMBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240521AbjEOMB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:01:27 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14A82D52
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 04:59:24 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-61b5a6865dfso98164376d6.3
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684151913; x=1686743913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=inUIP16sKIfLRgqpIL1L8tSlbjEEyKs1khZ6aC12pqQ=;
        b=TsD8vehhDGErYS7aRZonj/LpgfC/qAUL7q86JQwHOqNxcmtyRiqC71lkD6igozafUr
         1Zc+b78q9qDkxyXOWq/4dUzfAnzlsjf1WAzxR+FFKYnh77rkyj6pPSeaHGb+RdrczgIF
         NSq5cJngru1LZEDvIpUDEyygiyTvolPIEZY9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684151913; x=1686743913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inUIP16sKIfLRgqpIL1L8tSlbjEEyKs1khZ6aC12pqQ=;
        b=Eeuv28U4e2WgxTs3zVsz+CjgV+DvqK8N8QgBevnBewA0yWCCJHnCbCmE7R4lUKtbLm
         3uJHQWvzc7F7o24LpVesY/yyfPhxuzWROOkOPbF+xE8tHPzopLtFE7PvyZ1eIwIazIEr
         TlRqibC1Hjmt+O+MH+eUCbnb1/5vo2UadPTFoAnQFWm69aG7jgWAh5Kd47PtH1F07zoL
         Hu4jY284kFggzzcWBkjE2hy5hszb9+BeIudtwdK5kRyJjXA6KrGuRRLfWeeXyWKd/Z/I
         /e+x7sR1JPvqH0NU/EDcG8vEx4w5sJDyjVqryDIdcLljoWhxfE9wDvEriLs4wjTMgPZ8
         OjuA==
X-Gm-Message-State: AC+VfDxwfjiqlbwJRD17wKlwmDFF8wMTqofOTnCFsk+z/Wlu2ffzJUkw
        kCNXr4rALbYplIvOKZmHTLaSvvtfY4v1BD6xBPU=
X-Google-Smtp-Source: ACHHUZ5tG0BMC4JkF42QO7llUEtgEsAglWKb9P82mT99RNQLPaG9XSqF2gNY0cds9wUK0qR2TxetKg==
X-Received: by 2002:a05:6214:1c87:b0:621:599d:2fa0 with SMTP id ib7-20020a0562141c8700b00621599d2fa0mr25916069qvb.18.1684151913177;
        Mon, 15 May 2023 04:58:33 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id x16-20020a0cda10000000b0061b60afe381sm4826960qvj.85.2023.05.15.04.58.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 04:58:32 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7576eb88a46so856768785a.3
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 04:58:32 -0700 (PDT)
X-Received: by 2002:a05:6214:76a:b0:61c:c8d0:ebb0 with SMTP id
 f10-20020a056214076a00b0061cc8d0ebb0mr51650237qvz.14.1684151911585; Mon, 15
 May 2023 04:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230506065809.24645-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230506065809.24645-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 15 May 2023 13:58:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCtJktrVV_V5fGQXxHHhB+ksvbxfWEgy8RzsSwz=2GoMsg@mail.gmail.com>
Message-ID: <CANiDSCtJktrVV_V5fGQXxHHhB+ksvbxfWEgy8RzsSwz=2GoMsg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Don't expose unsupported formats to userspace
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

On Sat, 6 May 2023 at 08:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> When the uvcvideo driver encounters a format descriptor with an unknown
> format GUID, it creates a corresponding struct uvc_format instance with
> the fcc field set to 0. Since commit 50459f103edf ("media: uvcvideo:
> Remove format descriptions"), the driver relies on the V4L2 core to
> provide the format description string, which the V4L2 core can't do
> without a valid 4CC. This triggers a WARN_ON.
>
> As a format with a zero 4CC can't be selected, it is unusable for
> applications. Ignore the format completely without creating a uvc_format
> instance, which fixes the warning.
>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v1:
>
> - Fix streaming->nformats
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 4be6dfeaa295..8a9cfd5a0077 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -251,14 +251,17 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 /* Find the format descriptor from its GUID. */
>                 fmtdesc = uvc_format_by_guid(&buffer[5]);
>
> -               if (fmtdesc != NULL) {
> -                       format->fcc = fmtdesc->fcc;
> -               } else {
> +               if (!fmtdesc) {
> +                       /*
> +                        * Unknown video formats are not fatal errors, the
> +                        * caller will skip this descriptor.
> +                        */
>                         dev_info(&streaming->intf->dev,
>                                  "Unknown video format %pUl\n", &buffer[5]);
> -                       format->fcc = 0;
> +                       return 0;
>                 }
>
> +               format->fcc = fmtdesc->fcc;
>                 format->bpp = buffer[21];
>
>                 /*
> @@ -675,7 +678,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>         interval = (u32 *)&frame[nframes];
>
>         streaming->format = format;
> -       streaming->nformats = nformats;
> +       streaming->nformats = 0;
>
>         /* Parse the format descriptors. */
>         while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
> @@ -689,7 +692,10 @@ static int uvc_parse_streaming(struct uvc_device *dev,
>                                 &interval, buffer, buflen);
>                         if (ret < 0)
>                                 goto error;
> +                       if (!ret)
> +                               break;
>
> +                       streaming->nformats++;
>                         frame += format->nframes;
>                         format++;
>
>
> base-commit: 423f331364bfbcd1212b78ac9052894ff5213ac9
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
