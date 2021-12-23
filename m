Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229A347E809
	for <lists+linux-media@lfdr.de>; Thu, 23 Dec 2021 20:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhLWTKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Dec 2021 14:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236259AbhLWTKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Dec 2021 14:10:04 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DFFC061401
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 11:10:04 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id f5so25001839edq.6
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWeO8NP8v5E5zUlHq5t/wKxLy6NSHQhAIjoiIwb3K9k=;
        b=JQiiYIZrNtqInGMhwtn3ZjG0zbNsjPlJCa5DVGoIeSQqGgYHiBNhKQKoLkRtddQQPX
         bhDRWKT8zVCfn6OOOOWIQVEgAuU2xp7BUQrkCCvvFwMle3GVxE1gFBIxpB9eELg1GFTB
         2LFLyjZt6x17Q6Uq4p1Nv4XMC1kIBIzH5EkaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWeO8NP8v5E5zUlHq5t/wKxLy6NSHQhAIjoiIwb3K9k=;
        b=WeTKr+KZDhWL6PUSsmJXd20/rdFp2h7BNFOkv74rG1TT5t2jj5mJpqKICDh4bjgdWd
         nU5S0B6AgWDWgJGJfbdGbAVRSXjmGnnnpX2OHWcjJ/t3L/43F4WC96SkbQBkuVOBJ4jH
         kcYKmUoxUar3dIbFya2+5CjtSG395mBPYupUiqyzfL6r3OMBPX/THNFu34AIlyJJcUV3
         aBOi4eFn7xy60/deXGrJoM7FgyPStlB5qvoQV1uIjrks8tb//p0AUfs+Gjo2y67eOz8y
         iM6HCHBIEgJ+l/ODf5DQS3QZUkezlMJ74aLPt/QqoKlmZVvck9ePVmTSdA2peGRk1g7v
         Zs7Q==
X-Gm-Message-State: AOAM5326yYYTdRrb8rmXEupv7flTbL+0OkPOYYILZcRMgfneuMv8lWo9
        zKfuzeYUx5ZcUkp38GduVULDcJ7nFXXGlI9l
X-Google-Smtp-Source: ABdhPJwYXOC1m2IcfFbJn+AQs4pj+T4UqPJM3fgUIw5uiAGU8gm1Y1MTIXqp6OwsaRDpulW5/2D2vA==
X-Received: by 2002:a17:906:5502:: with SMTP id r2mr1824006ejp.627.1640286602586;
        Thu, 23 Dec 2021 11:10:02 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id ho9sm2000369ejc.86.2021.12.23.11.10.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 11:10:02 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id o20so24946477eds.10
        for <linux-media@vger.kernel.org>; Thu, 23 Dec 2021 11:10:01 -0800 (PST)
X-Received: by 2002:a17:906:6848:: with SMTP id a8mr2820960ejs.40.1640286601417;
 Thu, 23 Dec 2021 11:10:01 -0800 (PST)
MIME-Version: 1.0
References: <06c00e24-cdad-8776-9fc1-2c0f3db5af9a@selasky.org>
In-Reply-To: <06c00e24-cdad-8776-9fc1-2c0f3db5af9a@selasky.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 23 Dec 2021 20:09:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com>
Message-ID: <CANiDSCtB=mu6wtZxkck3E0GnJT7OOVXKDe+yzEFK+ygsDwoxKg@mail.gmail.com>
Subject: Re: [PATCH] Make sure we parse really received data.
To:     Hans Petter Selasky <hps@selasky.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your patch

On Thu, 23 Dec 2021 at 16:42, Hans Petter Selasky <hps@selasky.org> wrote:
>
> Hi,
>
> USB control requests may return less data than we ask for.
> Found using valgrind and webcamd on FreeBSD.

If the usb control request returns less data, then the checks for
ret!=size will trigger.

Am I missing something obvious?

Best regards


>
> ==15522== Conditional jump or move depends on uninitialised value(s)
> ==15522==    at 0x662EF4: uvc_fixup_video_ctrl (uvc_video.c:135)
> ==15522==    by 0x662EF4: uvc_get_video_ctrl (uvc_video.c:297)
> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
> ==15522==  Uninitialised value was created by a heap allocation
> ==15522==    at 0x4853844: malloc (in
> /usr/local/libexec/valgrind/vgpreload_memcheck-amd64-freebsd.so)
> ==15522==    by 0x3BC8A4: kmalloc (linux_func.c:1807)
> ==15522==    by 0x662C8C: uvc_get_video_ctrl (uvc_video.c:229)
> ==15522==    by 0x6640B0: uvc_video_init (uvc_video.c:2078)
> ==15522==    by 0x65E79D: uvc_register_video (uvc_driver.c:2258)
> ==15522==    by 0x65E79D: uvc_register_terms (uvc_driver.c:2300)
> ==15522==    by 0x65E79D: uvc_register_chains (uvc_driver.c:2321)
> ==15522==    by 0x65E79D: uvc_probe (uvc_driver.c:2463)
> ==15522==    by 0x3C8F46: usb_linux_probe_p (linux_usb.c:449)
> ==15522==    by 0x75B4B2: main (webcamd.c:1021)
>
> Signed-off-by: Hans Petter Selasky <hps@selasky.org>
> ---
>   drivers/media/usb/uvc/uvc_video.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c
> b/drivers/media/usb/uvc/uvc_video.c
> index 9f37eaf28ce7..6233703f9a50 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -258,7 +258,11 @@ static int uvc_get_video_ctrl(struct uvc_streaming
> *stream,
>                         query == UVC_GET_DEF)
>                 return -EIO;
>
> -       data = kmalloc(size, GFP_KERNEL);
> +       /*
> +        * Make sure we parse really received data
> +        * by allocating a zeroed buffer.
> +        */
> +       data = kzalloc(size, GFP_KERNEL);
>         if (data == NULL)
>                 return -ENOMEM;
>
> --
> 2.34.1



-- 
Ricardo Ribalda
