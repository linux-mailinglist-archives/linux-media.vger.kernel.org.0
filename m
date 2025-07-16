Return-Path: <linux-media+bounces-37861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA4B073F1
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 12:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB87F7A2E1F
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 10:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D2B2F2729;
	Wed, 16 Jul 2025 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VtHVQ74B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00002BE62B
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662956; cv=none; b=IE4guxdYt4+ylRlh0PpXxxqXFpboT8dQeTc2t3aPDDk+7AuNER1cV0BaBzUn32SMJUVflRHnVlGQ3NUk4oeeSPKxa2hI0uYBXmshijvglvg6X/aTmsRp+lkHA7XBbAHFWoUqW4YaRPl0Gm51FiQZoq+MAzT6pWnmarKBdBUh2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662956; c=relaxed/simple;
	bh=ex2tClw2ayUyj+HGbZvS98Cl8hIkQP3MACyhCTpaKo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqCrMairYEVKfWn90VIWigOAlr2RzWJmc5rrST653uDG2xe/27ZpNwx+rflfQk+v0Sjo/27UFyVwn0FlNWTlsdfCyXkfwRYY+7idIlHoW3g4ruuPsTHiFM2Qs283IpRapqBJ8Jdt5k0+xhUc+R+VzuTyPdp0pUsnoNBfa+VgHBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VtHVQ74B; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553e5df44f8so5761579e87.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752662953; x=1753267753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUkyIJpwOeN8ZEBp150EQ3xNePRvexME+ylR5u+Zvu4=;
        b=VtHVQ74BO4PonhUlCF6VbEy89rWQFro7cfy2ViLGdwZM8S6NoOT8JqJl/MoUACLrJi
         H7i/oCgRgIwjIx6ibzhLMoedSxK4ysq/TEr/8imodPEdH9dukn544b/OYcDSHczVzYoX
         hhriXskHHJGob+9rIIEXSpV6QBCycAcJGxZiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752662953; x=1753267753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUkyIJpwOeN8ZEBp150EQ3xNePRvexME+ylR5u+Zvu4=;
        b=iQHEpcA7HUwUdWRydS6pNTGFxKGAydLpkwgjXg89pR1bKxTq1Y+MH8MAKMFKyuGSk1
         DsxoIGdCnK6gtkkad1ISFnCeClKtXagsbWByQcMKKtp09f5lb2BNNTuqLmTxARvweYr/
         etk/9f3Bp8XwoPkudEOiu0sNlictI+LEd947vO7QSRNd18347Hxw6esf76LfVMVyy9XB
         +6gmWNM/ZpKkhUfsN463vtwicNXoPbsPil0OfRR0w3zugcF8v7kPaPYGjWyOQd2u9amf
         HEhpZegSdWKUigZDTR4HBKsvxP/WsAnvpXGGfKmkJLEiJXhZDy5WmPFJeEz0zEsTY7mL
         dhBw==
X-Gm-Message-State: AOJu0Yz98YTD26vTZy51hAkNpLamevWSVVw45Qkh0l2NBSZSWeIr5xzD
	exW79JQk+eG5G4BR8At6sRC7zOCZeiXvPlKAgm5Ix8Tx0hxQUdq+h7dEC/iQ5ipQHpMymCf828q
	jnMePRg==
X-Gm-Gg: ASbGncv9BJ/jcMQna0ykGQrWM3HDYLgDCmp5r8CmZ/2+H+0jBAcCEq1YxVfs32M4DFm
	lRB1/CfNUmUwvGUVmXd/z4iRFDl4u6EnA50jg5QaLKRHkMLs98FrZ8vmQ8FxsmYaBhR+T4Pz+lA
	TYnoCBXfaS7kz+d2E7uv2Fu4jP4sXp1D4UNFXYwaqIwdAYpRPqDH21lWosdtfOE3Fr4aDceonnX
	7xHIkDwcCrJoN2ir7FKjJYOhgdK+iN7QX4oZrVn+7k5xxpWcg0qSkMkBxSZM4fYrLhqCcAC9e9t
	aW/FlsjKpT4BXE0kBu1Kdl5oGZClh4hVGssKAhc88vFfle6nXLXhZrY2QiWfKUogzh/I5fc03ka
	1NNeOv/rtcaXDBWvWG+BtmIoxOlVzGn1jx0dxGWnBC0dpQv7Ml9E8VVX918nOeM3j
X-Google-Smtp-Source: AGHT+IHxu3vLktIFYGiK8K5z96o2nbqpaBo4j/r46RuIeI4W+aqytPLM5QC/jC3P9jEjDVhPbH3KTQ==
X-Received: by 2002:a05:6512:2508:b0:553:51a2:441b with SMTP id 2adb3069b0e04-55a23f0ceb4mr850835e87.4.1752662952795;
        Wed, 16 Jul 2025 03:49:12 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d32absm2608114e87.118.2025.07.16.03.49.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:49:12 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b43cce9efso50142771fa.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 03:49:12 -0700 (PDT)
X-Received: by 2002:a05:651c:19a9:b0:32a:91e6:1a26 with SMTP id
 38308e7fff4ca-3308f4c1383mr6151301fa.3.1752662951598; Wed, 16 Jul 2025
 03:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com> <20250715185254.6592-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250715185254.6592-2-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 16 Jul 2025 12:48:59 +0200
X-Gmail-Original-Message-ID: <CANiDSCuHpqLqX8dtV9puJffPwJk1LtWQc7gCR7qadbWSAEn+4Q@mail.gmail.com>
X-Gm-Features: Ac12FXzETnsyEjUNN_-oXlS6nJb0pKN6mK6eleUW1xbArFmSTEIjsPEbVI6TU0A
Message-ID: <CANiDSCuHpqLqX8dtV9puJffPwJk1LtWQc7gCR7qadbWSAEn+4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Drop unneeded memset() in meta
 device ioctl handlers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jul 2025 at 20:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The .vidioc_g_fmt_meta_cap() and .vidioc_enum_fmt_meta_cap() ioctl
> handlers for meta capture devices memset the ioctl argument structure to
> zero. This is unnecessary as the memory is already zeroed by the V4L2
> ioctl core. Drop the memset(), which, in uvc_meta_v4l2_enum_formats(),
> also allows further simplification as structure fields don't need to be
> saved and restored.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 229e08ff323e..b68bfb2d47df 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -49,8 +49,6 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
>         if (format->type != vfh->vdev->queue->type)
>                 return -EINVAL;
>
> -       memset(fmt, 0, sizeof(*fmt));
> -
>         fmt->dataformat = stream->meta.format;
>         fmt->buffersize = UVC_METADATA_BUF_SIZE;
>
> @@ -118,19 +116,14 @@ static int uvc_meta_v4l2_enum_formats(struct file *file, void *fh,
>         struct v4l2_fh *vfh = file->private_data;
>         struct uvc_streaming *stream = video_get_drvdata(vfh->vdev);
>         struct uvc_device *dev = stream->dev;
> -       u32 i = fdesc->index;
>
>         if (fdesc->type != vfh->vdev->queue->type)
>                 return -EINVAL;
>
> -       if (i >= dev->nmeta_formats)
> +       if (fdesc->index >= dev->nmeta_formats)
>                 return -EINVAL;
>
> -       memset(fdesc, 0, sizeof(*fdesc));
> -
> -       fdesc->type = vfh->vdev->queue->type;
> -       fdesc->index = i;
> -       fdesc->pixelformat = dev->meta_formats[i];
> +       fdesc->pixelformat = dev->meta_formats[fdesc->index];
>
>         return 0;
>  }
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

