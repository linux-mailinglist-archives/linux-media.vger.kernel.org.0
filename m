Return-Path: <linux-media+bounces-3675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13182D248
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 23:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438671C20921
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 22:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5C42C682;
	Sun, 14 Jan 2024 22:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iHFuwO69"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF091E506
	for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7831b3a48e7so506936285a.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705273134; x=1705877934; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2iTVIpbKVlC8H0chysMZc6EV/4AqAkJSrCj7qkuPnwg=;
        b=iHFuwO69jndp2CMZd1CqL+raZQluFiFrw7v2ZNtiC2ewhInvtTgNQm4ooxw7YC9l/y
         4ZJB2knsVhGP7FGvIYVNQhY+/PuRBPzZ3xBC8JM17M8D/XavHbWSlz75VbLfmI37eTfW
         lYAS7VUz73+5SywCN4mx5xaXMBOj84pLfutZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705273134; x=1705877934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iTVIpbKVlC8H0chysMZc6EV/4AqAkJSrCj7qkuPnwg=;
        b=B9Kbd9GidBXWAKzXHpk16lIQ//zyDLkd1W+M+fvaeb8n728dFdVnSzWPStsaEReYEz
         Fd2sFW8A5Hb4QEzqeO5Y/5tKdZhyZifBxJgrbu6o1Ks7OFMDW55i0BNXZheNdhjEppEm
         um5UllsHThnnigbIzSeoGBwoFdW+/OLakZWcvauVyFHhoafFpog6dFSaI1d4BL6wLXLF
         Om0FdYLbqGjzMWZjw6eiZdjudTVmkFdIrJJ1p8wUvyn6tzVIt+L5BASIP5UKsk9mXX3K
         HJr1I/pnyeyvqPA7L3rx1KHsRBULvGt8rjVZdO4XLsREMqB7pTGfbPIWwWAPxK7r5hmQ
         B1vg==
X-Gm-Message-State: AOJu0YzuhI+SfqEhjRI8D8xcn66XI1XuzYJBKhJmgXwO9wqwmisg5YQ0
	/ykklPetz5CBSJ5Y3+RKYXAIYnGvV2vRzZsmABXPWhxd+g==
X-Google-Smtp-Source: AGHT+IHRP1gfxs+I/NEz7rxWWP3cWthhemJGU+UYZtws/v+8XAc/LVnXL//mFd6bysAVqsE+VVid9g==
X-Received: by 2002:a0c:e10a:0:b0:681:5589:e8ce with SMTP id w10-20020a0ce10a000000b006815589e8cemr2545499qvk.41.1705273133886;
        Sun, 14 Jan 2024 14:58:53 -0800 (PST)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id w36-20020a05622a192400b004299f302a7csm3381529qtc.23.2024.01.14.14.58.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 14:58:53 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-681603c9047so1632566d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 14:58:53 -0800 (PST)
X-Received: by 2002:a05:6214:2261:b0:681:5bb8:e251 with SMTP id
 gs1-20020a056214226100b006815bb8e251mr1343756qvb.97.1705273132688; Sun, 14
 Jan 2024 14:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240114213518.03e22698@foxbook>
In-Reply-To: <20240114213518.03e22698@foxbook>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 14 Jan 2024 23:58:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCsS-Wg-2h-rcHvPjoem4h-pR1xOJST_EmNTdKum8grSSQ@mail.gmail.com>
Message-ID: <CANiDSCsS-Wg-2h-rcHvPjoem4h-pR1xOJST_EmNTdKum8grSSQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: extend the bandwdith quirk to USB 3.x
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal

Thanks for your patch.

Out of curiosity, what camera are you using? Could you also share the
patch with the quirk?

Thanks!

On Sun, 14 Jan 2024 at 21:35, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> The bandwidth fixup quirk which is needed to run certain buggy cameras
> doesn't know that SuperSpeed exists and has the same 8 service intervals
> per millisecond as High Speed; hence its calculations are badly wrong.
>
> Assume that all speeds from HS up use 8 intervals per millisecond.
>
> No further changes are required. Updated code has been confirmed to work
> properly with a SuperSpeed camera, as well as some High Speed ones.
>
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 28dde08ec6c5..4b86bef06a52 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -214,13 +214,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>                  * Compute a bandwidth estimation by multiplying the frame
>                  * size by the number of video frames per second, divide the
>                  * result by the number of USB frames (or micro-frames for
> -                * high-speed devices) per second and add the UVC header size
> -                * (assumed to be 12 bytes long).
> +                * high- and super-speed devices) per second and add the UVC
> +                * header size (assumed to be 12 bytes long).
>                  */
>                 bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
>                 bandwidth *= 10000000 / interval + 1;
>                 bandwidth /= 1000;
> -               if (stream->dev->udev->speed == USB_SPEED_HIGH)
> +               if (stream->dev->udev->speed >= USB_SPEED_HIGH)
>                         bandwidth /= 8;
>                 bandwidth += 12;
>
> --
> 2.43.0
>
>


-- 
Ricardo Ribalda

