Return-Path: <linux-media+bounces-36320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87299AEE223
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C0B33A5703
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF08228DF3C;
	Mon, 30 Jun 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TQAoN6PW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9428CF43
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296557; cv=none; b=slSwWgHG/w3CAKwYQgzkMz7RHnkwn/cxddcmJ64BygrU1+ZDErk99Rq3a9vRbCWeHriefZmAZ5wKDuxMpwZkCG+zb1VeSDBbLYEHUIxVRiOOfNlcIcTNnSYPOoj+qAdMDWxWUG0J08sHK8btYlpNA+uvxkF5yL8IqPXqmEikvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296557; c=relaxed/simple;
	bh=qUjuLTmNcbaEXQsGgwDbeTL7U1+S0S4WiD49WjSD3hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvGj228UXvv0mosGCsdwHP/6tqRyRGZEV/PrHTwv0czGQLcAjnD3v7eRylOAB/yAf+mAvxB+9fppjnhZc7Nxpq2B0vNb5Wku7rNUF5/RS5AqjUN+aAbwHGoCwzNjfnLQ80r85GQAkR9Z2eOI46ZfS7tIfxJXlu7dL2tTnfyDJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TQAoN6PW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so2616770e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751296554; x=1751901354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1AOLwFTOE5XzMvxlxFognU3FkvdviGhVUSRhoNGQGM=;
        b=TQAoN6PWYOwSesONO36GPRP21VgQrpH3wl3WIVvFbDUaF4qTe40uHgKeVJ5pjCgAZ6
         HlqjnF5kDC61oBwxX4ZO18IihrIzsioGYOGfmFvQFF7IQBhcw1sokX/Unviphc0O/TLT
         dKZuuvJ1AZF7eeYljvFCNa0hzndEwbVIc+LAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296554; x=1751901354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1AOLwFTOE5XzMvxlxFognU3FkvdviGhVUSRhoNGQGM=;
        b=JWDKwkzLUVYCmbv/0Vz4JQQia9AzQ5ffOYV4hncgXiCErzznrRrHzdiEBqHeDw7zcr
         1S+Lzm36h3NPiOAhXeuseE+9yhOAuEIr1IJGstUKOx7C4HMUInHTFRqzEunpbiEqMA69
         C8o6K88X8rxVa1xOjphKRzPGTkCbujJVrgYm6hfOs4OqJ8Y9+qt1FhMZXKOv5r7jKXNU
         ZdZezNxsPQBawSouxNqEFUVyJOPKPeatBecKGDDBpC5wm6O7u1SGIuORl4Z4KVSAIlZ+
         d84Wtq+FoF8PIDkgHgKdteB+XMQeI/5TZAB+DEZiFTwbVsFLZPKII3PV6WftTBoOSBFn
         9mHg==
X-Forwarded-Encrypted: i=1; AJvYcCUpODwWxkQaT+E3PAHAsTRktgxtM3WRrzF6pDaTcHYvwYbavRQx6ngeBNiphfD1sRVrfYc0Wzm9RIQsJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJYdSmnn+63CGszOVvkf+p2tMrK4vsTugWSzigBSIVb4Pd+JnH
	sYs4SMHT4SmUbojIxXr39VhxEDyKSiw5fJ7WHrktyIt5R7QWcRD2ADwCr/BbZCv5ojPwkfQRJdh
	zOMTy+Q==
X-Gm-Gg: ASbGncsdwm1k/J5jhbAgFwxLbv1RDqRV8vt7RqJ975jUgeZNRM0R4GkEHr683EtyQJ1
	QzQu2Fd56Pr6WWY1bUTk/CwMLgkklJD41DqQd9hjh5FOk1Ty+SGruY13oHXobt6e0jOf6anw9/M
	EvPxG0OOlRW7hyLEdV9NMhogYaTTdk2uvqvp8F/4o1dmWkN4t1uGbx9MWvnQzIRFx0QkljtOYek
	z9nUU1InAV2e730WQ7a34NFEqTjtJhgwINgjej8XjIhxdIw6oiuxc4iTpeFFx0tWHi7A+w+Jkcr
	MfbI1vuSuOgyRoOK2lH5K+nJXzK3OSToFc4nQRggv4z+YAGBiy77q0vTWzIs1t9rNms4QubjXk2
	EZ4jLIWE5jDMrqiSFTzFuLJEY
X-Google-Smtp-Source: AGHT+IEyqmUd0HTjwS0/cuTUgNrgXqCEvY/R+JOx3gyAojRSLVWuSKhfdlmituHnR2wEWtPoik8lBA==
X-Received: by 2002:a05:6512:340f:b0:554:f9cc:bea5 with SMTP id 2adb3069b0e04-5550b9e4a95mr3915201e87.34.1751296553446;
        Mon, 30 Jun 2025 08:15:53 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73a4sm1474980e87.106.2025.06.30.08.15.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:15:53 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10594812so2616732e87.1
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 08:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZ69spKNd0fTQO6QuWSr1HMJ/oM6QTUix2jE782lROh3X6mUKtnGlDjQ4EwT4E1+pPxRWx2vb47L/pQg==@vger.kernel.org
X-Received: by 2002:a05:6512:3d1d:b0:553:2f8c:e631 with SMTP id
 2adb3069b0e04-5550b860cc9mr4540604e87.9.1751296552162; Mon, 30 Jun 2025
 08:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com>
In-Reply-To: <20250630150107.23421-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 17:15:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
X-Gm-Features: Ac12FXygYZhncua2VSpYRf_F0i2gDNxE8CXtvpMAoS-xI7uTpLX06TMihRMBcX8
Message-ID: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Desdes

How did you trigger this build warning? I believe we use C11

https://www.kernel.org/doc/html/latest/process/programming-language.html


Regards!

On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This fixes the following compilation failure: "error: =E2=80=98for=E2=80=
=99 loop
> initial declarations are only allowed in C99 or C11 mode"
>
> Cc: stable@vger.kernel.org
> Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
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
>         list_for_each_entry(entity, &handle->chain->dev->entities, list) =
{
> -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i) {
> +               for (i =3D 0; i < entity->ncontrols; ++i) {
>                         if (entity->controls[i].handle !=3D handle)
>                                 continue;
>                         uvc_ctrl_set_handle(handle, &entity->controls[i],=
 NULL);
> --
> 2.49.0
>
>


--=20
Ricardo Ribalda

