Return-Path: <linux-media+bounces-45123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BABF5DE6
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 12:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07A2A4EFE0C
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14E82ED848;
	Tue, 21 Oct 2025 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWqLQRTh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F8261B9A
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043662; cv=none; b=LkGKVxLMXqzYyBUX+8IdDubN3lA9P2dsLFWY0MrkHuUp0SmQaezjz5UOolomf5LCysfYlH//hiNtJyI9r58XHFbUJdiB+FItPdZQsW9inxzxhZxXCrfSLhwuQxPq+RQRIXy4+eoo5dphGjQNrWVhMRm0zthtoekNdOmWGhnRA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043662; c=relaxed/simple;
	bh=KY8k4nF64QEkqmy8wovcrxZNfcYQnDFhLdMboWwvqjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qGoydqShj6Mjq5d8VkxmgIrXbVjAov3BwZh8CHugXjX7t9RvboSC1ADXfsRM6mK4cAgi9GsUGdv2RhOodolK5zL2sRiNPXcthMdv6GdS1KEpySCHeJHLT8M/7Inb0wmvs+03IboR6v7Glr+UCatT669hxwt28TxhSK1DEpzRsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWqLQRTh; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018e9f902so3158321241.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761043659; x=1761648459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Xs/eUdQtWZwGGmABaXwPLNP+gh3Pns6jIW82WHCxmU=;
        b=VWqLQRTh3voCfdAX76sAVEwunYGgmbfB8xaI6uDcnyBci7jRsTmoWSZ8dD0+5bEthS
         0eIQUPPHKcnyKGI2qBhyGhOMsZNkJn83CpIt24COjehxE/fuMTVucHLDjt4ZJM4bK1Yq
         +eRayaWhfO8MmuBupZdaJ6AB+bqxM+1HfgynUkDoqXd3RuTDS2uXQ2pX2hm2+3onj0s2
         XLSixj0phHFR0wkjq/b9cU3kjDjOKdVuejoHjAdc6bDfymnmoYl7KaphK3hRKNNqzb5o
         9EkKPeTWP/L3783fpkNBOBw5vx1d6vXigvN7VSr9LhtJt+qsTxWciDe7Q4wU/blPozK+
         sHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043659; x=1761648459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Xs/eUdQtWZwGGmABaXwPLNP+gh3Pns6jIW82WHCxmU=;
        b=haOsHFNdpI0cJsxTLJSybehqnKcj87kWd9p9Nx4ZWTyphh/DShL2P/yFHsz/zCoOXF
         jcFm7leqz0LzWVpYV77+SzZvXqOJCyTLhZaITAZshxCb9UCIWnC2lMxrfhKtIOQ0pplK
         6qKlhiwxKZk9R/wi7/7RrABL2fhPp+Ht+7NtLw3zWBNavTTrWRl9IPSyP5ndirxQ2GcM
         70zjMK+wqsNveIkaa22kuDrTuEEOEbOBYp/Ghhx2KROu3B5nTt7xJ/kGtntsSb476E32
         jz/NtGGnF7zSppTy1GIjNIIUoikYe/6d12EUvYLZSE1Kmh1r2FVo0w1qLL9uJoLQSASG
         GeiA==
X-Forwarded-Encrypted: i=1; AJvYcCWUuln9o5NnFeYni5uKGqr9lxGbjcEu9RVID0vPY13Inz+OZ+5q9ENTAKZl5jsVXIFfBKYnuF9pPR/0rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Uh5QB6ERoBKRF1F4a/Jqih8R6ScBfpoJdIrQCsaD6TEvfhNG
	N/hwNje7sn4WjS+2LhpJs+/uPTf86JDH1p/Wj2o2amgBTlOilU+FpIkMsw/gvoNkxD5zQMc1Yev
	fBxIsFd4No7H3uPgLe0lECkQ5kUZSluI=
X-Gm-Gg: ASbGncswbv4xIEKmkfMUwzzJuNFeiuV28+ORamockZEOOBip2HEFqhQW3/hvAzweQhA
	OGGBw/ChIs2L2d01W0NEN98r36+ZAzb3vfmbJS3BQF/1AlSdbjjVlLVgkv1abzilJmuRnhHPuBw
	ncxUb0vxVJAWHq3irF3as+JJ4Hi6anAdexxJoN2Ax0eYOhs/oU39hhdTsMDj3viJM1fyUl8/ATA
	GIi7ohrrx+a0HSnvAw6L1NSO24i1LiDsQty8LZfEKgqF+fcua2srQioZTxAiE+/sSIAQPJ66uLj
	YcciR3zlbjjE0pj4OxqJz/mfyeGIB2FToH02Xtks9hLbwlM=
X-Google-Smtp-Source: AGHT+IHjOFVe1O3tzFMP0gIYtx24HziWgzB3Gjmf9Kpo5gAt5z3gqUWF8osLugzeNby1AvQDK8RZVGBJJaUvMp2ukaM=
X-Received: by 2002:a05:6102:3e8e:b0:5ba:4f5c:874e with SMTP id
 ada2fe7eead31-5d7dd6d6684mr5462466137.31.1761043659295; Tue, 21 Oct 2025
 03:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015133642.3dede646.michal.pecio@gmail.com>
In-Reply-To: <20251015133642.3dede646.michal.pecio@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 21 Oct 2025 12:47:23 +0200
X-Gm-Features: AS18NWBtKNtvNmDcTFIqNnPFoGF6drRttrc9akQyRbVQmrOOvK9ecsEJNzeSKcQ
Message-ID: <CAPybu_0O10SsPp4G8SfcsbCP5k1gXQJ5Hmhw4kMFTZguEZ7iBQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Return queued buffers on
 start_streaming() failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal

It seems that the device was disconnected while doing streamon. That
caused uvc_pm_get() to fail and exit without returning the buffers.

Your patch is not going to help to fix:
xhci_hcd 0000:09:00.0: HC died; cleaning up
usb 13-2: USB disconnect, device number 2

But it is fixing an issue. thanks :)

On Wed, Oct 15, 2025 at 1:36=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> Return buffers if streaming fails to start due to uvc_pm_get() error.
>
> This bug may be responsible for a warning I got running
>
>     while :; do yavta -c3 /dev/video0; done
>
> on an xHCI controller which failed under this workload.
> I had no luck reproducing this warning again to confirm.
>
> xhci_hcd 0000:09:00.0: HC died; cleaning up
> usb 13-2: USB disconnect, device number 2
> WARNING: CPU: 2 PID: 29386 at drivers/media/common/videobuf2/videobuf2-co=
re.c:1803 vb2_start_streaming+0xac/0x120
>
> Fixes: 7dd56c47784a ("media: uvcvideo: Remove stream->is_streaming field"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uv=
c_queue.c
> index 790184c9843d..f49c538618bc 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -177,7 +177,7 @@ static int uvc_start_streaming_video(struct vb2_queue=
 *vq, unsigned int count)
>
>         ret =3D uvc_pm_get(stream->dev);
>         if (ret)
> -               return ret;
> +               goto return_buffers;
>
>         queue->buf_used =3D 0;
>
> @@ -187,6 +187,7 @@ static int uvc_start_streaming_video(struct vb2_queue=
 *vq, unsigned int count)
>
>         uvc_pm_put(stream->dev);
>
> +return_buffers:
>         uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
>
>         return ret;
> --
> 2.48.1
>


--
Ricardo Ribalda

