Return-Path: <linux-media+bounces-24955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1CA16BD1
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7682F3A77BC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377BC1DF257;
	Mon, 20 Jan 2025 11:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GIApO9kK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA952770C
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737373988; cv=none; b=KpMyRKlwIk8hXuIjkPb/e/YxwCBFoyanlM4aNPM0ktM75EOq7FiuIVmrxNpV+NpvcDYEgUiFUCVfTplTAGh0GLfPhU2p6XwhCQEZOfLKWL2k1FUuoZEDvaxmGdDdUwjbymdVw7hmMGlvrqX1yxHD4DOO7YiVzz9bNCms7oFTe54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737373988; c=relaxed/simple;
	bh=4U/i8SNG/ev/aXJCHB43zVaEVbR+vSYVvQfwcPGi2q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKFnTo6pUE6yXSKnmWqVkqoTH6bBBxGSk6kQEgAqoBpCA25gFmSXWgyMstN1OkTQhiyf9p5SVCxNNw03hK2emMEa2erCKR7vdMADPExbZZSkA8/Tiy5AIBiaUOBr1Akqtl4KYSps4EUEGrpr63rh9tNi6hmXzjRb7feuNvq7gZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GIApO9kK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so4417553e87.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 03:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737373984; x=1737978784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DO1GSrxGRws6Il8fdUBsWvqH371/a7vsiRONpv3JYU=;
        b=GIApO9kK1RDDq5mp/QEjg+KVDQ6Z+dMhHz/6oyUZuD9KuSmVWyl4Nh1h6U1Anl+Bqp
         DirzFxLkSZI5GTp73Dw50kV1yHfrKhEYHYuLK4iFqYHIlSTLxrIM52OOzy6GD1GpNusK
         ZLrKM2azyNWejogSdChfcZ1/YflW6MOYdoUs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737373984; x=1737978784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DO1GSrxGRws6Il8fdUBsWvqH371/a7vsiRONpv3JYU=;
        b=BWYRqTXZ+jSZHodMeeqI/b4Bgrw0/CuHClNShyR0air2KKf1Sn44vcWZvMlUYFiea8
         26udGXJozN6BjcKSZ6EAkSGHEKjAt86rzuSed1tMWo7VHb73n86dKyvcMpEhRdYPuWjZ
         psFJDqvnQh2haXTUNu4xpYBvjCvEtIj+V3srHMzYMRb4y1/+xjI/qW89q4+GSjrfeRjt
         /bbtoy29qOhlT2MIL+o+nf86raYr8+5xXD5VJB3G5VYm/AUEUfMm+xcx1XGoPEGuHQpy
         z3hS6o0NB7xmnueF0mscApdcOE6DL7mg3PxGNl0W929AW76ubDppSnwOxg6aFjty4JwE
         /ZVw==
X-Gm-Message-State: AOJu0Yzwm8LMbZOgdjEaEBBuUemIHoFcEjs1B7asydMMTGkg7L44icPc
	egLOXrR8w8PXsECZQx5po399CSdgMngNXNR7Obfg27Wq2hoQlKqjULb7ffQmkbY64qEseJY6uWA
	=
X-Gm-Gg: ASbGnct2Soqfo8norLwc95B/7PP1tgC0DlvlZsS1ItqG2NsNtCoAsM9hOs5BWKj8X6M
	5HAGWxYRi4hzwhvLLyZ9ZEOLt/FYCXclVvP+j9aEq4vsdZP4PEnnCeS+raYuojh5dMcGF9rJ2iV
	oGTmpaw9NCapa+E7WzZ9jPsPuxyUKB34559FcnuQXsSCWEgdNRROEz5KLk3MgTKNwXxftx6FAuC
	RrhdxwagJpPs5sCFu8+z2yioHwUKEEKQan3w0nh/A26Llr/uoNBoXQlA4pi+GXTEUhBYiWh9bsn
	v3qjgKyfAfQjfHpbxXsP9Cc8479Ckm16
X-Google-Smtp-Source: AGHT+IGBEVVWJbOJ7ZYBHp80K6R9LCPY15PrnDR/LrhspS4e2Q1K3u7+rcjBgD5IHsqnCZlGIng0qw==
X-Received: by 2002:a19:ae0f:0:b0:542:29e5:7323 with SMTP id 2adb3069b0e04-5439c216b4amr3607762e87.5.1737373984238;
        Mon, 20 Jan 2025 03:53:04 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af062b3sm1319150e87.31.2025.01.20.03.53.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 03:53:02 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401b7f7141so4056375e87.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 03:53:02 -0800 (PST)
X-Received: by 2002:a05:6512:1312:b0:542:1b63:141b with SMTP id
 2adb3069b0e04-5439c2674d3mr4875698e87.32.1737373981571; Mon, 20 Jan 2025
 03:53:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br> <20250114200045.1401644-1-cascardo@igalia.com>
In-Reply-To: <20250114200045.1401644-1-cascardo@igalia.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 20 Jan 2025 12:52:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
X-Gm-Features: AbW1kvZnW2GCQZnZU6TD3Ts2_TZIPLyxaO_7qDIB9cXHVKWFbvMzYoMpFb3JuX4
Message-ID: <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Sikora <sikora.tomus@gmail.com>, 
	hverkuil-cisco@xs4all.nl, kernel-dev@igalia.com, mchehab@kernel.org, 
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 21:01, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
>
> This reverts commit 3dd075fe8ebbc6fcbf998f81a75b8c4b159a6195.
>
> Tomasz has reported that his device, Generalplus Technology Inc. 808 Camera,
> with ID 1b3f:2002, stopped being detected:
>
> $ ls -l /dev/video*
> zsh: no matches found: /dev/video*
> [    7.230599] usb 3-2: Found multiple Units with ID 5
>
> This particular device is non-compliant, having both the Output Terminal
> and Processing Unit with ID 5. uvc_scan_fallback, though, is able to build
> a chain. However, when media elements are added and uvc_mc_create_links
> call uvc_entity_by_id, it will get the incorrect entity,
> media_create_pad_link will WARN, and it will fail to register the entities.
>
> In order to reinstate support for such devices in a timely fashion,
> reverting the fix for these warnings is appropriate. A proper fix that
> considers the existence of such non-compliant devices will be submitted in
> a later development cycle.
>
> Reported-by: Tomasz Sikora <sikora.tomus@gmail.com>
> Fixes: 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero unique ID")
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

If we do not find another solution in a reasonable time I think we
should land this ASAP:

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>



> ---
>  drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++------------------
>  1 file changed, 27 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b3c8411dc05c..9febd2375636 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -775,27 +775,14 @@ static const u8 uvc_media_transport_input_guid[16] =
>         UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>
> -static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
> -                                              u16 id, unsigned int num_pads,
> -                                              unsigned int extra_size)
> +static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
> +               unsigned int num_pads, unsigned int extra_size)
>  {
>         struct uvc_entity *entity;
>         unsigned int num_inputs;
>         unsigned int size;
>         unsigned int i;
>
> -       /* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
> -       if (id == 0) {
> -               dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
> -               return ERR_PTR(-EINVAL);
> -       }
> -
> -       /* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
> -       if (uvc_entity_by_id(dev, id)) {
> -               dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
> -               return ERR_PTR(-EINVAL);
> -       }
> -
>         extra_size = roundup(extra_size, sizeof(*entity->pads));
>         if (num_pads)
>                 num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
> @@ -805,7 +792,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
>              + num_inputs;
>         entity = kzalloc(size, GFP_KERNEL);
>         if (entity == NULL)
> -               return ERR_PTR(-ENOMEM);
> +               return NULL;
>
>         entity->id = id;
>         entity->type = type;
> @@ -917,10 +904,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>                         break;
>                 }
>
> -               unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
> -                                           buffer[3], p + 1, 2 * n);
> -               if (IS_ERR(unit))
> -                       return PTR_ERR(unit);
> +               unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
> +                                       p + 1, 2*n);
> +               if (unit == NULL)
> +                       return -ENOMEM;
>
>                 memcpy(unit->guid, &buffer[4], 16);
>                 unit->extension.bNumControls = buffer[20];
> @@ -1029,10 +1016,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
> -                                           buffer[3], 1, n + p);
> -               if (IS_ERR(term))
> -                       return PTR_ERR(term);
> +               term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
> +                                       1, n + p);
> +               if (term == NULL)
> +                       return -ENOMEM;
>
>                 if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
>                         term->camera.bControlSize = n;
> @@ -1088,10 +1075,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return 0;
>                 }
>
> -               term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
> -                                           buffer[3], 1, 0);
> -               if (IS_ERR(term))
> -                       return PTR_ERR(term);
> +               term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
> +                                       1, 0);
> +               if (term == NULL)
> +                       return -ENOMEM;
>
>                 memcpy(term->baSourceID, &buffer[7], 1);
>
> @@ -1110,10 +1097,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> -                                           p + 1, 0);
> -               if (IS_ERR(unit))
> -                       return PTR_ERR(unit);
> +               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
> +               if (unit == NULL)
> +                       return -ENOMEM;
>
>                 memcpy(unit->baSourceID, &buffer[5], p);
>
> @@ -1133,9 +1119,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
> -               if (IS_ERR(unit))
> -                       return PTR_ERR(unit);
> +               unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
> +               if (unit == NULL)
> +                       return -ENOMEM;
>
>                 memcpy(unit->baSourceID, &buffer[4], 1);
>                 unit->processing.wMaxMultiplier =
> @@ -1162,10 +1148,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>                         return -EINVAL;
>                 }
>
> -               unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
> -                                           p + 1, n);
> -               if (IS_ERR(unit))
> -                       return PTR_ERR(unit);
> +               unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
> +               if (unit == NULL)
> +                       return -ENOMEM;
>
>                 memcpy(unit->guid, &buffer[4], 16);
>                 unit->extension.bNumControls = buffer[20];
> @@ -1305,10 +1290,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return dev_err_probe(&dev->udev->dev, irq,
>                                      "No IRQ for privacy GPIO\n");
>
> -       unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
> -                                   UVC_EXT_GPIO_UNIT_ID, 0, 1);
> -       if (IS_ERR(unit))
> -               return PTR_ERR(unit);
> +       unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
> +       if (!unit)
> +               return -ENOMEM;
>
>         unit->gpio.gpio_privacy = gpio_privacy;
>         unit->gpio.irq = irq;
> --
> 2.34.1
>


--
Ricardo Ribalda

