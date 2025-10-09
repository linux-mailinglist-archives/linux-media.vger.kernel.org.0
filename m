Return-Path: <linux-media+bounces-44062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05204BC8497
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42BF74F8B28
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FC22D23BF;
	Thu,  9 Oct 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB+k4VwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB02D3EF8
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001792; cv=none; b=D6XmHfBsdcpXLQwMchVw7BJ/0vnUJ9icRBXRcte5JLedCO62jbUWl3+CqjbrhZ6eQtQlPBJG26Z+Y3ehuVVM6xfdQAnxs/cTH+/xeECNA6d1zLOHYnMVYaC5LyrTkMLZwG+bs07muPiOERITmrVVlb7HHhw8Mp8egyYDgC73f0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001792; c=relaxed/simple;
	bh=K+0Ba+82N8MCM6Hljp4i+icfg2zO2VJ6uwVVJphVHOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJB+Mk2aKgbQ3WrrzWvycPA2Jcdlx8GQoJY6WvHfj/NojqChuuUlIN3i7Ncy1FMLO7BW2nZ8JYKRJ7ClYw4A9UML8TF8+ZPHwvRTWqufsktpdmfHtVzu5AVZE8APKg7MVvHfQDsUIBHhRnv65KClNhhLr6l32giDGM9jd7fci6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB+k4VwO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e3117ea7a2so9677421cf.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760001789; x=1760606589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1yLxYHd/VAyHskeRRUQa8GUquaKhTgykXvAi3d9N/0=;
        b=bB+k4VwOVQBa5mR+4/X12ZqUrb675RI4N3qQ7ff0SWeeVLq4r0ZA+4tbK0rDtyPboD
         f7Y1hmg7RpTPUswXVzpcKWwL5rPz+QzBEu1wl8p13lJrhlzK0bPm4n/fyLoAkKzuWPiv
         xb+o5SB7hMMXGznBVBICIat61mNnD6EFWJS5XGgIsqjY1+nNFmAweNfHhYgnwz/YNE+P
         TBjuSutmj2vYkmiZB8t6rpzVTKES6tc1+JxCJpDtknmJpYEY1Oxop1plfgeNiFCGvhhD
         JrhxFryhMHti7GRB6IHolYBHFDYtw8rA8X91US4ouezma25K3ANblNGTR4u4+rdCFHtr
         rKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001789; x=1760606589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1yLxYHd/VAyHskeRRUQa8GUquaKhTgykXvAi3d9N/0=;
        b=i4GeqVJJE4RR3b65zDKvuKBpRSOJgxIBrS0uvTqrmtUMmRS80k+JOH5/lK+1xo9LoK
         wVBozFn776JsIt/4E4CqP7uiiHKG8OuvjWvD0Fh0li0QZ0JrR+cb3wypuWAQA6D2ZX0B
         1/1Rc12vhfV5an3Jaj9lAW+cOP0KKG2mNzRx36TVxgXpMJH5q9c7dGvDVOstlc0oIVjV
         UFOtucD/XJlH3OLI0cTuj96QYpXM380azwSTtBM2iR/ruw9gA/MA3pv9j7o1ku0+ERzv
         xw5Eth79c6GKOe0mJIO/bpOducBExwOb+RW7jyMtx7u6QOzkyReoRq/wBjqSLeu2rtXE
         oA/w==
X-Forwarded-Encrypted: i=1; AJvYcCVx48zksvPYCw8L6KbMSv8fM1j/80cwnyRbx2kSnLnuiUM7UnjDVxWO78S6n20bZy8i6DzAXHvbUPLBIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNudDkHwWQobFCWmFCqvBxe7C7PFlIn6prhVmJrMyCyhIUPAp4
	HrCW3+hGyFogjAct7/owf1DAcEvUgcskTI+wYkktFwKa7ZKWdCXSL3k37opYblTftKWlFEClI0T
	D0MpiWzDaqwpRaRcjFCaPY5er25AHOYLsC8Mj4qw=
X-Gm-Gg: ASbGnctbWQRLc6eaBCu7i3fNykoYOtfn7d7hZNNeO3sfkOBQ0YTLQ2vB4gSaZFAGPJi
	GYcD6G+L9SVW9+Le89fbKtwKezMt1W7TmcGMGK0W5EzL6INROCXTVHxcYoWw1c2GlVf0yjzGLTW
	O4mIvdu7W42ED6aHc4KwEl5w0bEx+iGAxp9CZ8wXt9LsdY4Y+fSzzTjNbLiCtVan0mL0ya8COtt
	EFlkNfSJFgky2/uDRGTrPs1OMKA2A==
X-Google-Smtp-Source: AGHT+IHHmFKNcM+qG9Ij/zlh4ibLVQGCbykaaPSVFBsTOpIrBepCkmbANHFLxNsngMgcNnn9CLc1ZxAdPI3vOGc/N3k=
X-Received: by 2002:a05:622a:1f8e:b0:4cb:7edc:352d with SMTP id
 d75a77b69052e-4e6ead4c8e6mr89182291cf.45.1760001789490; Thu, 09 Oct 2025
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
 <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
In-Reply-To: <CANiDSCst6-1g2vPSF4YnEbH6DFcz+WYEwGHc08kGyuH4OZ+adA@mail.gmail.com>
From: Angel4005 <ooara1337@gmail.com>
Date: Thu, 9 Oct 2025 12:22:57 +0300
X-Gm-Features: AS18NWApUVhTXfK1fYNZwTFX9vQpSs7WPswBmqDyPw72vdP87h0bwUP9SKVOsGU
Message-ID: <CAOzBiVv2yzmawqLk-womOJFpx_dAWW9z6EmSqxADyVOPHTaymw@mail.gmail.com>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken on
 recent kernels (including LTS)
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-uvc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you very much for your quick and helpful responses!

I confirm that the problem seems to be related to duplicate IDs in the
descriptor of my Grandstream GUV3100 device.

Unfortunately, I was unable to test the proposed patch, as kernel
building is beyond my current capabilities. I am not experienced in
such matters and do not want to risk the stability of my system.

The exact breaking point when the camera stopped working was found:

* Last known WORKING kernel (GOOD): 6.12.50-1-lts
* First known NON-WORKING kernel (BAD): 6.12.51-1-lts

I hope this information will help pinpoint the commit that caused the
regression.

Thank you very much for your help, guidance, and understanding!

=D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 09:55=
 Ricardo Ribalda <ribalda@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Angel
>
> Thank you very much for the detailed report.
>
> Your device has two entities with the same id:
> VideoControl Interface Descriptor:
>         bLength                31
>         bDescriptorType        36
>         bDescriptorSubtype      6 (EXTENSION_UNIT)
>         bUnitID                 4
>
>
> ideoControl Interface Descriptor:
>         bLength                 9
>         bDescriptorType        36
>         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
>         bTerminalID             4
>         wTerminalType      0x0101 USB Streaming
>         bAssocTerminal          0
>         bSourceID               3
>         iTerminal               0
>
> And that confuses the code. We have recently introduced a change that
> has probably triggered the regression
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/media/usb/uvc?id=3D0e2ee70291e64a30fe36960c85294726d34a103e
>
> Do you know the commercial name of the device and if it is available to b=
uy?
>
> Could you try this patch and let me know if it fixes the issue?
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c
> b/drivers/media/usb/uvc/uvc_driver.c
> index fa61f1d0ea2c..81937501fb0c 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -167,11 +167,23 @@ static struct uvc_entity
> *uvc_entity_by_reference(struct uvc_device *dev,
>
>  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, in=
t id)
>  {
> -       struct uvc_streaming *stream;
> +       struct uvc_streaming *stream, *last_entry;
> +       unsigned int count =3D 0;
>
>         list_for_each_entry(stream, &dev->streams, list) {
>                 if (stream->header.bTerminalLink =3D=3D id)
>                         return stream;
> +               count +=3D 1;
> +               last_entry =3D stream;
> +       }
> +
> +       /*
> +        * If the streaming entity has an invalid id, but it is the only
> +        * one available, use it.
> +        */
> +       if (count =3D=3D 1 && id =3D=3D UVC_INVALID_ENTITY_ID) {
> +               dev_err(&dev->intf->dev, "Heuristics triggered\n");
> +               return last_entry;
>         }
>
>         return NULL;
>
>
> Thanks

