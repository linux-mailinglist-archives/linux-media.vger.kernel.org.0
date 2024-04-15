Return-Path: <linux-media+bounces-9455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D48A5B91
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 21:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA831F24092
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 19:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6A015699F;
	Mon, 15 Apr 2024 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RlvpIQ3b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5119315667B
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210399; cv=none; b=m5JaChsIif3GCDeO+osFOunGtYFtnBeVZVEgVGRjkYoMEJzB2ZDCxi/gKfrgHz8oct+W4dcdjVALy6KcoE/9FI3yEctR3Qp7VuO2iARNuw4mSnkhGEQvfmNiVuZLiEKcRA8nGzZTYpDAwa2VZwHt+2FxCV9IZU67Nc5X9tTiAAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210399; c=relaxed/simple;
	bh=Wrz49eF/Rk+DO3mT0u2xESFR1/loV8PL7CrGkZ4QrJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSf2bWjgpNGTCMx2HFVSAox5QaPsmTDTuFvGlgQ+sBfI6rTV9AKg9LcxLVZLa7AYQPSKoM5ZFHtTq4g+3CO1fxeylWQFXHX++US8MVZLZwz3mC1AG5PgOTKuYlUemGoU9qZHVVvU6GrNDGRPhekMSQxhVyX53weN2JYpHt0c0WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RlvpIQ3b; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61aed4a91d6so777b3.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713210377; x=1713815177; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yFYrIz5i//JzIwujO4M8NU4SC+/3WKejNV+mGm4snLM=;
        b=RlvpIQ3bBR86xu6wPEjEwxY/vwofdUgur082sumFVDKcrdFLxHN5AH3PvQxdGmHKjf
         kF1lnBOmWd46Fnw43elLXguvXgN1OQcxJ2uuu+KnoKcuDZ09ZPGje+H7DIBXCnc39PU/
         1IJAV2p9T7PWo1b2qJwrQeeo26ab8HWZhNZC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210377; x=1713815177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFYrIz5i//JzIwujO4M8NU4SC+/3WKejNV+mGm4snLM=;
        b=vo3o2oUI3D7VSr2P2R2Ha7WJTXlmPbXpM5QLWID8nGSeo8BdoYKnCK1ZXfix6ePasz
         VGZB7zF0T7wsAoOZCuzSdI80TS88bKeKRGyy7ECdPaNwYfEpq+xjCjL6MlYoHyeGfW44
         J16hr8zj5FYXhvE91WTETjYGI7pU+3dEY6rg4694cT2g8Az65/dJPmdkQC7zvI6S1D5L
         PQbJoyST9PiArBziBK7xVRG3LNh+Rp3hGRHjiUAJha7HX/ftmkAFgMNp0kPahpSW1oxT
         4I1CcaXiuJDSJh/t4CoyVdjjmUhThKVtifxRZXvUyWL2EuasY7GCilYUiLaJHWjZmgmS
         ar6A==
X-Forwarded-Encrypted: i=1; AJvYcCUKwRNmInERnyqvM7t5t0Khnl1GbLUIHrkwM7rBSIuUUKG51lZfhVIbeVGUz5zn45EvLamJ+DUyKAeWe+nxeQLFhZeYO8IVWhW3t7Q=
X-Gm-Message-State: AOJu0YzjyUuPb4GWJTrlritVIvHBswl7kMm4kSVfsDtQaAq304TW7Fze
	yIF8PX0WcJD9IVeGbdt2/5OlLGT59T+PoDdk1RaSjysf2AEexl4Vhpf8d3/Fsgl0DCqHKfbJc5r
	WDg==
X-Google-Smtp-Source: AGHT+IEvcwkhmMnVoYCHMF3te5xhY/aW6En7lSqjO5HXSZ9BZfE0VGz3t1ahnYxBN3dFeOiMs4VzOQ==
X-Received: by 2002:a81:ff02:0:b0:618:94a6:6ca1 with SMTP id k2-20020a81ff02000000b0061894a66ca1mr5927056ywn.27.1713210377483;
        Mon, 15 Apr 2024 12:46:17 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id bt3-20020ad455c3000000b00696b117a325sm6541129qvb.108.2024.04.15.12.46.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:46:17 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-69b47833dc5so9651986d6.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:46:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkOExFoGqgQHnx/+6AcNsv0YaNf1Lg406W2E4qqYM+ukD/GhJWc7W1y0j+dLm6xsCLC6mIB2z4gxu83wjkLJioJ3M17QRwAHcqF4I=
X-Received: by 2002:a05:6214:5485:b0:69c:814c:48d with SMTP id
 lg5-20020a056214548500b0069c814c048dmr1591359qvb.39.1713210376419; Mon, 15
 Apr 2024 12:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240414190040.2255a0bc@foxbook>
In-Reply-To: <20240414190040.2255a0bc@foxbook>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 21:46:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCuYpuHABd7rcKGktXiOQEvuM2S6X3wP59ixCmWPV1fxRw@mail.gmail.com>
Message-ID: <CANiDSCuYpuHABd7rcKGktXiOQEvuM2S6X3wP59ixCmWPV1fxRw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix the bandwdith quirk on USB 3.x
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal

On Sun, 14 Apr 2024 at 19:00, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> The bandwidth fixup quirk doesn't know that SuperSpeed exists and has
> the same 8 service intervals per millisecond as High Speed, hence its
> calculations are wrong.
>
> Assume that all speeds from HS up use 8 intervals per millisecond.
>
> No further changes are needed, updated code has been confirmed to work
> with all speeds from FS to SS.
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

