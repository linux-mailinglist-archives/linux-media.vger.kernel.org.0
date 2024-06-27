Return-Path: <linux-media+bounces-14263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583C491A971
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8501D1C21B2A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E427197A61;
	Thu, 27 Jun 2024 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Yg+iMzSC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5270197555
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499445; cv=none; b=o5DFEK7EB0bGpzC/7bctnksjFTNlOyRqC9uVfztCdqEL0IBjEQt/9JnkEi5ke6SRGbFKIOqQaacHV9ZswwT587zzJKMwciChzKwN1iWh3Ch04k/VoPW9Gya056m/I25vSnUYZuuy5hZlUD6k3rIzdtO5vWr5w0p+7fdQ5qZk40Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499445; c=relaxed/simple;
	bh=jmzPXdDCCAC/MKtSC/hAbXxVF+hdQgPtGYYUSJ9qKFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goGdzD72+bVxC9unPg49rNldUuybavB9tRMRaPCACgEadoKC8aWGQ/q3uNd0XahSzsw7VtUoKS25hIjVdiP/+Ii4NEfnUXVPjYx2YjCTORkniXPa1KO+PyvmG2EK+6LufsuFc0PbTcI7T3dEaVXpxWQNySzIYVNlv40IIE9Cdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Yg+iMzSC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4450292a50bso16221111cf.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1719499442; x=1720104242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ungb+QGWCHhRG8/rC+kh3S1uqFOhchzwGwHvUTFe9mI=;
        b=Yg+iMzSCQwSuq/W6BjVD2gwAHIAwfNwcmsSELjpQjOuSpOFVTweUr0kLJtDiltlR2b
         WEKhPzj5iyIkDZHqcMTH2m0ofqgIjeshYJIkYrc6tr75irN9XX1YZBMcalVjCvb7zIL8
         KS6QiQwnizzW6CKrGgNNv5+hGg+5RM5AwV42atnRdrqMeLHy7EATRp/aXd+cg+JrLDQI
         73BNGs8l/bp7Qz9cVdwmIgozao1/Sg5I8JOB6oFkwIHcPkHMh+F46J+WWpuNlvxLo4dX
         1+D9iI8tUW5/lhDVxNj/gn399Mk+ZVAgDdJHzP69wPU2rXBS3AqKBfCxRXjQjRmz0Edu
         otLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499442; x=1720104242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ungb+QGWCHhRG8/rC+kh3S1uqFOhchzwGwHvUTFe9mI=;
        b=sely03GqJpCmeWF57pekgekxgjXwxum7iNZGPXojIkKP/es/Vj2w5QdnQJgEjCa6nd
         XHj1EXsuVfNZtmMKY+A5JzAN3qnSwwlqWFZ6gRa5eAh8VwdUM4hI5iPcjeB35gcoEHks
         zuI7gX3Ul1Yiimkh4Zfu3ZAd9BhJ7rkF8rITFNPWj0yVUtmlldK+fd9+JKtpiTZn+h83
         Z7bHTkRRj2iKUDb0k5vH9w0QocgT5bG3OHzzEio63ksJbcsreAQiwcYz/7/WzF1a+1FK
         UuzdWe0r9YIYwbkzJk6t4Ylrol6vigM+waJxyTqiKit4ipG3Sn4/J5jglZn2woqD+iig
         wo9w==
X-Gm-Message-State: AOJu0YyAWPbyM9zf/TNpqweLS/90cX1twAxuLc0L4FRXIc8PXAKUi1Oc
	3tZKGPAEieBfzsqN0IFEqBo3044E7M038G31lIxJuZfpM/wMSOu+Eq9+MYDPn1AsZbgza/YpS/3
	GqshCtFFYIiawfK5jl2/iOtfy3/H3zzHj+ZnEqA==
X-Google-Smtp-Source: AGHT+IEzpRLuh4RpN/sl06JTcBFKKiVbQeGnTJtLTlMiSpKny6rCOuR+cbjRxc9nwSvbQMGKa5D5omUc/nEewH4WD6g=
X-Received: by 2002:ac8:5e10:0:b0:441:3ce:f012 with SMTP id
 d75a77b69052e-444d9214f5emr149992101cf.46.1719499442687; Thu, 27 Jun 2024
 07:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com> <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
From: David Plowman <david.plowman@raspberrypi.com>
Date: Thu, 27 Jun 2024 15:43:51 +0100
Message-ID: <CAHW6GYK3ZPwdYcsC1oHH-YSS26_4K0HqJLFq6zAGauNTQ7zcQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uapi: pisp_common: Add 32 bpp format test
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo

Yes, that looks right. The 32bpp format was a slightly later addition,
and so might have slipped through the net previously.

On Thu, 27 Jun 2024 at 15:31, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Add definition and test for 32-bits image formats to the pisp_common.h
> uAPI header.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Acked-by: David Plowman <david.plowman@raspberrypi.com>

Thanks!
David

>
> ---
> RPi: I found not traces of this in your BSP pisp_types.h header but
> these identifiers are used by libpisp and are part of the pisp_types.h
> header shipped with the library.
>
> https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/backend/backend_prepare.cpp#L374
> https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/common/pisp_types.h#L137
>
> in mainline, pisp_types.h has been absorbed by pisp_common.h so I'm
> adding it here (only PISP_IMAGE_FORMAT_bpp_32, as it's the only one used
> by libpisp).
>
> Could you ack/nack this patch please ?
> ---
> ---
>  include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
> index b2522e29c976..031fdaa4da69 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_common.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
> @@ -72,6 +72,8 @@ enum pisp_image_format {
>         PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
>         PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,
>
> +       PISP_IMAGE_FORMAT_BPP_32                 = 0x00100000,
> +
>         PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
>         PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
>         PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
> @@ -134,6 +136,7 @@ enum pisp_image_format {
>          PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
>  #define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
>         ((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
> +#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
>  #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
>         ((fmt) &                                                               \
>          (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
> --
> 2.45.2
>

