Return-Path: <linux-media+bounces-37860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42DB073E7
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 12:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C106171139
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 10:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861862EE991;
	Wed, 16 Jul 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iAczRcn9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFD62BE62B
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662895; cv=none; b=vDwKZ9nrvMSaSeZn6qyue0iblAELS3lDNHYVS/RuIo+6xCD2Gb385PHnJH9x3ZF7w7FyKVPbfe+hJ1FQzgiertFhiQOBjo2R25RdhFjIL+VIZU40b41nUg0v8NSso5QMS5BKRsNVl2ucFg8VtB/ZQckcvL+b+K8lclkPWAn9gWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662895; c=relaxed/simple;
	bh=DNmv/eI8E+rZjqUfydwpJ8YZTNZlX89YEv+vI3nDVoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbJxSn4M1DaWpcKiKpOBRgi8Rw4PoNuy5Plez2pvZo5rVGuxoqPE5QCZj2R89IkEGnnGGFrDZV76H4Ag6CvjJpM+I9V68onLY6vCSmUacpnLj8qDr9VRjoWPjpQI06A9/+ZX0f7D9ocbZKrp3wAsyzE/t/K9CxJW4xRaKo1ln58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iAczRcn9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55a10c74f31so3527276e87.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752662891; x=1753267691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgHKHXFPX69m/nlI0xyOh9UmhqUmiqOzgwapvGEJ3Ns=;
        b=iAczRcn9VW9GwJZCBjD6q1m9nR3ShRljPP+z1wcAjFMUoJDootspe45avT9j9jB7L8
         vOB7oa7UuHFJH5WkcXVZeg2awdNaBPxlopv+QrGemH2bAMHFeqxRK2kkcN4nSWfvX9Gw
         zn8/SS5A0aBsi5dHZBAstU4V7S14ZltyUwYjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662891; x=1753267691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgHKHXFPX69m/nlI0xyOh9UmhqUmiqOzgwapvGEJ3Ns=;
        b=QcbFQEOE3AAekjL+C2RAB8GpqYLtT3YDqlQa87WrQtZqeckNKff1CDvzKgvZpdIjLF
         EvJPpIoikf/5cp85kQcQ+taKf6YZCg8iiPMsyJQ2ugXlW3OGHzIfknQJm1e16eGiFBQl
         2n5g+M240OtrdyG5IMA+eSJ1aqZxLupuxTKKPp+qW5z0gnH+tIvPkiXue5Qe5Wi4HXUg
         JkzeKpyGiPn7HX2NuC8UZu7Hcq5ra2gEs71ZgiZXB3iDi2yvZQ+Uh7wWEY9vzGaww3R4
         XYrpUD6R6aICHKbtKaSuzDetyguJVYcfzkszETJe/yqKNOzkQ3codwcpHN2bfFd/8fzr
         03Rw==
X-Gm-Message-State: AOJu0YzkYRgJOu1exXdp4UCj70Ne+EdYTsrRAb5aifpjB9wnyVBrAeN5
	ffjR9hTRYblP/NrWJUt3iG6Js6MiAfMXNlxCvNaY05vyJyLlxf2hMlgovIinlO2gfw954YPC1xu
	e+CD2ew==
X-Gm-Gg: ASbGnctn4V9lXcoDpaq8KKZpMqycNotX7pNH2Omqh4UUI9sWTv088VZJxdtr7x676E4
	PYyRsoj0byzpg4EY2YuRZJ6OCdjcj7Bnqn8qD33HjkFxAiLoV08p/lCLHfAO9mI4x0HHARQZ1rI
	d58RRVRsWTkpS4oQWZ9Co4NsuzD3r9uC76nr62Ve3cjvAuiRDJwmKmqjbpv/CncwrTWmrnJFBOA
	Z/rWzHj1HPyZuJuGKdNiKNwmPUJgX3oOlernagKmirkuuBgaHQmhXxDckpVXIyiQYmLrQFJMgEz
	5mTvXdhIiJLWp3DdUyhviL160v1Jv5/PQ/FKR4Ij0vOE2Bj/POXTIk5nz07qBTuezPez21QmErr
	XONKkxooKrKCkc7ozf4qpQrjwieRVqIQ7O4J6+MKHdJlOPdH12sLQPms+fOpFJYyW
X-Google-Smtp-Source: AGHT+IH7aeIiSIP7p6w4e5NDRJw37VnvlXIpEUUYrzsY9TDtYrY4HCjZJSXRDkL03EBBL1MZjyem+A==
X-Received: by 2002:a05:6512:1282:b0:553:d17a:d01d with SMTP id 2adb3069b0e04-55a23eec1c9mr771885e87.14.1752662891256;
        Wed, 16 Jul 2025 03:48:11 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60700sm2588897e87.149.2025.07.16.03.48.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:48:10 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b31afa781so49660171fa.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:48:10 -0700 (PDT)
X-Received: by 2002:a2e:8852:0:b0:32b:3dd6:299e with SMTP id
 38308e7fff4ca-3308f5dee89mr5763941fa.21.1752662890112; Wed, 16 Jul 2025
 03:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com> <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250715185254.6592-3-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Jul 2025 12:47:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSyi9RQedMTn4u0kCu4MvAQ3x=f52Yh=v=8wAeadGi=g@mail.gmail.com>
X-Gm-Features: Ac12FXwYqzErTOHWH7VP3OZvmGubomsDLZvS2y06kXzmbCUAVuJn9IrlJ9V0oxM
Message-ID: <CANiDSCvSyi9RQedMTn4u0kCu4MvAQ3x=f52Yh=v=8wAeadGi=g@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Add missing curly braces
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

If you use a linter we could add it to media-ci to make sure that the
code follows your style.

On Tue, 15 Jul 2025 at 20:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The uvc_meta_v4l2_try_format() function is missing curly braces on an
> outer for loop statement to comply with the driver coding style. Add
> them.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index b68bfb2d47df..386b04a3a102 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -67,11 +67,12 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>         if (format->type != vfh->vdev->queue->type)
>                 return -EINVAL;
>
> -       for (unsigned int i = 0; i < dev->nmeta_formats; i++)
> +       for (unsigned int i = 0; i < dev->nmeta_formats; i++) {
>                 if (dev->meta_formats[i] == fmt->dataformat) {
>                         fmeta = fmt->dataformat;
>                         break;
>                 }
> +       }
>
>         memset(fmt, 0, sizeof(*fmt));
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

