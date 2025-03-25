Return-Path: <linux-media+bounces-28662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B985CA6EC02
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 09:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9D563AC180
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 08:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1181DB34C;
	Tue, 25 Mar 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CzQYtn4C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675D11B4234
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742893021; cv=none; b=jb8+GolSfp74rSebxtj9HhGuViKX1pruE2F0DjQl7K1MbnRqU3TAZRnUO1VePxeMpygo3yF7upnpbBlrfqCZdsZc566BnVrjEUeFyIB7WtX4olIJVANnHU8NkUUbNuR65fRGfSM+jIFUavlnJIcjqLBKiHMTF0uqL+nYgw2SXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742893021; c=relaxed/simple;
	bh=vshuMyCYFLJDvNpL15NUMHq/rID0RlGfkcQcA8Uhlf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5QtAj8ngq/JKpSdPn+rMGQYK+k6Tyvo01k6J+5M9FDlXm3dmQDd2be0RiR4ypvafmOt76liNiwEOzZaARA9potb2S0hYhrVCIXogaA+y9wywDJHK6NyFozTIqiAphifQEi0ywQR9jSJ5ouZxCdE/cG8Zy6x0GAnBpAVwTB/VFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CzQYtn4C; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso51885071fa.3
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742893017; x=1743497817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pekDRC5ZiCfjtVPCurs814x3fMwzvDjR3anDXf5w15E=;
        b=CzQYtn4CUAFPz+Vlgl7EyeMkCq0HY4n25vcD5VrspQUwOctGoYOwllnr5Qc3d4apg/
         Ec08bTvQbc2E/06MJLI7iWrHQq/rhg/R5EgcQqWQy8FKwYs2MCooKBz4RQ3t1SQvqWhk
         TUQ3DZJtqNu9OLpGrxa6IJxtedi3WyjRgqpBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742893017; x=1743497817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pekDRC5ZiCfjtVPCurs814x3fMwzvDjR3anDXf5w15E=;
        b=sfpOmgW6AbjICXvZPobwQkp5RqZKaPjgcTRS00Z5Xqj08vnKdDN4kE6Jm85l7uyYJO
         Cs+q+mel5giFfvXOW72XexFHdvdM5Otd/KPTkdUcNk0fazjLPi9loPUxPub0jC+HdIWt
         U0isf+dMe66mP2kGyyDLomE6/AmCVjDtmlwyUSC05bcTb2+AozEm1f4qzjekhL9Q5ltn
         X/X6k9i//xryZdYs/bvN+5aHRknuQQ4uyYYQnSi9dX+30nrXTUaC8GdDozZud+9MoZee
         v52eJ2QZetOIpwlaaruq13hO8BQxxGUF0nDSLHbPGHmz8csRtEDa7X2a5JaZKyu6s+1F
         LP+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqqGRtMPKoOhbzstujzU5VQTFi/QMHpPIlhLus3TdAq0/PHX7i3lu6bAa57RSMVcSUJmKNSdRsers/9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKX2WK7MUe2Yc4F6h2B+uMWxkl0BJIy5L+kI3CDAsExqDQ0sXc
	vn5yC+mlnnKPEZuavoZ8NZ+tgSeXS9MzR4CFoNU1VcQU/BUQ/qGiNxzGcy8BjNZC6wTSV/HMIQk
	=
X-Gm-Gg: ASbGncuIqeMdpte2xfxajur/5krCebvshHKm+TceVLgzoAPTXrQ6GObYnACwG2oA4IT
	Y3A4XMoFXYUbRhODO2Nf1eaGYyNiNf/XMY3/PEALsxC3pIrRKbhZS2D7pfSPQlN/DszbgZrOlxM
	3zfcw2usV3iJj2yMUzjdrgxDw6QzWKl47vtXPF1lEPFQuUBzT6KxWDu8HF8m8J4n5/GJY0dcEfj
	0ZY6314gnLpygn97vdLOIYLRd2cwr2EvM3/7wxTD3Y9IjFHkP5OY/a8uI31i5wggUzT7NjxL8W3
	JIdbeLlAFRpGwK6EQQ5X+zMnZRDBOTOwl90LyRJ2IhJVLcPPOnL0dx4AkOm39BR2USTK2IYe1Ke
	NW6sTp4o=
X-Google-Smtp-Source: AGHT+IE1sBbHrprwg1rEgZedWWRYzPg1F92bvA43fTYTpFoSsRcPK8+wCWQkzOJCL+Zfwin65LNg/Q==
X-Received: by 2002:a2e:9087:0:b0:30b:f924:357c with SMTP id 38308e7fff4ca-30d7e223dd1mr52582941fa.15.1742893017305;
        Tue, 25 Mar 2025 01:56:57 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c181asm17235371fa.14.2025.03.25.01.56.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 01:56:56 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b159c84cso5979196e87.3
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 01:56:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXfpxxVAUynIzTfZxHNZUvM/qddtQQopeyk9uSegjkEZRrSTUKDjTiVoR0XCYF2EFA/nNWSPlzFU5NSg==@vger.kernel.org
X-Received: by 2002:a05:6512:3401:b0:545:56c:36c7 with SMTP id
 2adb3069b0e04-54ad64f58a6mr6508739e87.41.1742893015961; Tue, 25 Mar 2025
 01:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
In-Reply-To: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 25 Mar 2025 09:56:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
X-Gm-Features: AQ5f1Jp8blAGxVvtPz5mzFh1PiUzr5gC4lO_rNwm9J5fxVQkAwlMwA1GEUsRJ4M
Message-ID: <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has 0 pads
To: gshahrouzi@gmail.com
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel

On Tue, 25 Mar 2025 at 08:55, <gshahrouzi@gmail.com> wrote:
>
> >From 307209d175be0145e36b9cf95944e2e62afeab11 Mon Sep 17 00:00:00 2001
> From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> Date: Mon, 24 Mar 2025 19:45:55 -0400
> Subject: [PATCH] media: Fix invalid link creation when source entity has 0
>  pads
>
> This patch addresses the warning triggered in the media_create_pad_link()
> function, specifically related to the check WARN_ON(source_pad >=
> source->num_pads). The fix proposed adds an additional check to ensure that
> source->num_pads is non-zero before proceeding with the
> media_create_pad_link() function.
>
> Reported-by: syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=701fc9cc0cb44e2b0fe9
I cannot reach that URL
> Tested-by: syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com
> Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
Shouldn't it be? :
Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each entity")

> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index cc68dd24eb42..5397ce76c218 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -43,7 +43,7 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
>                 source = (UVC_ENTITY_TYPE(remote) == UVC_TT_STREAMING)
>                        ? (remote->vdev ? &remote->vdev->entity : NULL)
>                        : &remote->subdev.entity;
> -               if (source == NULL)
> +               if (source == NULL || source->num_pads == 0)
Shouldn't source->num_pads be the same as remote->num_pads?

Are you sure that your kernel does not contain?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=41ddb251c68ac75c101d3a50a68c4629c9055e4c

Regards!

>                         continue;
>
>                 remote_pad = remote->num_pads - 1;
> --
> 2.43.0
>


-- 
Ricardo Ribalda

