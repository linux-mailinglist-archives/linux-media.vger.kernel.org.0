Return-Path: <linux-media+bounces-36463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30357AF0356
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 21:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879F71C062D8
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DD628314E;
	Tue,  1 Jul 2025 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I2v5m+Ji"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F7281370
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396765; cv=none; b=nr68X9QvcOX+KnKjTHBA0PT+Sp+mJswJVyzo6rcmlGZGRgzlkyeql877DY6DQUR0tyU3EgoeNFOn0v0o668SKpQ581j04enUtZmQ/GMWvZOBHvhSL5dO8lGO+ILq8lsrQBpSJV+R/P93QMKWeyMdc1WHirUJ+DRHFvKUF5PHk+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396765; c=relaxed/simple;
	bh=p6/XqN280IkAJFF5P5KHzujwv+QUHuSl4ozM3BoRZsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9mIJm2ijy5ESPdTmZOOQ49QVoowjrSDbgLRUJsdwyf0T7nIg5yLQhAZwS9gJ+mv+HjGbGXX6HpoYGFzx7dQE5mvSYtOJWFt3fLOVbZxFXaJsILQ666MBTLbcUYhMTjG37l4tSJNQ4Rvswg6CRH1aR6RPF5LCvxQG0rUsT53/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I2v5m+Ji; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b7123edb9so37512791fa.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751396761; x=1752001561; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OztRvSb6DKrNM/Q8mdgSvvCpah/vYheo31tsm4TiWc4=;
        b=I2v5m+Ji7xFQUugmN0p/pepc9+u7v3a/OsE2YvLtOsgnHYt/vcVoPL8l13eCbhKF26
         HmABKuug5JPJoWmG2vInJF0I6Bh0r3YFT4kd0lYxVVP8DS5aWwtTNInbACTTl745wWSU
         u8WuFzBr6QLW82JsFioD56OlsUqabtqB41Ed4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396761; x=1752001561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OztRvSb6DKrNM/Q8mdgSvvCpah/vYheo31tsm4TiWc4=;
        b=Wu0rS1aKC+2LQl3gwHuC2UL0L6A5Q8zEHRvX4BeInW59AKFz8ULSZ1Vh5Ywf+S13qe
         uNDo+Gf+ucp0C26uS5rfjeZc9EP0u1UVeoOHT8HV5TtmSgzYedt7tYo9IMCSHBYAqpVY
         x5CwC0pHj4Mu+d6seYnvAPdIXdH3Fwy7IYKFyZf3pRqbdUQKh/flfT1RewW0o3cu1epF
         D3cysdL8JnN2hKKyhhEVEHg6McLN9nIBQrrRNuJeaa0OcIPh4di2+y1rAGQcLOzbFVq3
         I8VFJNsc31qFXaZ+muxiusJNp2oZrW8KuFtFxfpII5ob4w+A0+LzGJcYHJ3fjrHXg/iy
         w0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYmNa07f4RpW4foCfIwC2icIaXQL64VKp6BqYRnyZY10UnCyhXT8sxpokslpbQArkjaxl1vXwRT9eDCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJob0R8UOibXHGWclDeaT6kbAiQ3jqUdORCA6d0S1yOvptrRe1
	pPiD0ob733nl+hTnwZN0zmfqOuI3rSw5xcjnLEPNZsDnEJzpY576YxJcawPn3hLoEkxHq+8m/LN
	UtWXiFw==
X-Gm-Gg: ASbGncvs/frkxjol/vXOMkQHOml15FQbwqLmuxo3sr+ikoC5007gifr/dEy+8ZvMv6S
	AtcNk6CVEtnbZcov6Bi/8pA+5TVw7vGc2ZbVX8zECUcC8GwVSE8DLmDmqTafykfXC1UlraMpa0C
	fY3H5IXjPOCkcOwp9l0MA5iCiTW0HccvTNUB8Ua6afy8bv8Fs3/beoyEte4oTbxRucJ9ft9SW9l
	h4FkdzKe6Rj3CZ53X+mWvA5GuKlc/C0onVFu0VGF1rctZrT7qD1eJ7371ziJkbzdkiMGfAnGYWk
	NgcKtwjy18b+IYMy0P7Psx/o6xb1WLPThaO0uh31q9/L1Rgh7HvBrb3VDyJfR2tl/U04taAFjaY
	Qgv+lth6VsXJ5hv5zA3MEcPNM
X-Google-Smtp-Source: AGHT+IHHctRURb4qw5w2kyPnvNuw1TwTN+hUWntlOKWNJK4cfLliXnz38BX72Yzl6ESOSTnkPfLE3A==
X-Received: by 2002:a05:651c:40cc:b0:32c:4306:5a94 with SMTP id 38308e7fff4ca-32e000d7a87mr463171fa.37.1751396761224;
        Tue, 01 Jul 2025 12:06:01 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec5deasm17870531fa.58.2025.07.01.12.06.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:06:00 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5550dca1241so3652075e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 12:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjEfV1CmHSZOcho2U1usyq+0iHsEIwuCpQy2QKmww/c2Ua/V4PoDhuSbDdpGYajOjjN1htRTJGySecuA==@vger.kernel.org
X-Received: by 2002:a05:6512:1046:b0:553:d573:cd6b with SMTP id
 2adb3069b0e04-556282b48bdmr32743e87.10.1751396759656; Tue, 01 Jul 2025
 12:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701172556.117872-1-desnesn@redhat.com>
In-Reply-To: <20250701172556.117872-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 21:05:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMwyPo2ZDnBP84oRXEON_1Lda3oWh_5YZ0aTh4kDc3DQ@mail.gmail.com>
X-Gm-Features: Ac12FXyehtMimSZE5IfsufDIGL7kQPuiODqwi6T9oMoHxqi-PVf6QJ_fyL41l3Q
Message-ID: <CANiDSCvMwyPo2ZDnBP84oRXEON_1Lda3oWh_5YZ0aTh4kDc3DQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 19:27, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle
>
> Cc: stable@kernel.org
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..532615d8484b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
> +       unsigned int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>                 return;
>
>         list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> -               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> +               for (i = 0; i < entity->ncontrols; ++i) {
>                         if (entity->controls[i].handle != handle)
>                                 continue;
>                         uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> --
> 2.49.0
>
>


-- 
Ricardo Ribalda

