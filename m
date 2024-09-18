Return-Path: <linux-media+bounces-18394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA297C0F3
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 22:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DFFD282CEE
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355CF1CA6BB;
	Wed, 18 Sep 2024 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lT3O5tDP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AB1CA6B3
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692095; cv=none; b=NQvcM3rjXzYdBsNJcfjWdtIwc6riDIYFtpyO0BMcTCGSJlNRT12GmLE+/VERO64kaaZqCo15i/nyiLkZvaaUE/Fq+Q7b+t37cBiXgaUtAncTlz4bxCpq0OJwV9lPGbegeUyCO3C8j9jFLqkbPxHCVUSvlNiyNV6YNpWtL7LPApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692095; c=relaxed/simple;
	bh=6UN6WjABf07CyU6TFC2J2BSTHNwWSypggqsto2IffQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIut8Q7owWaO/eOaexD44zMyw3dt6mHQmbMIx0wUdleiQXqqudfUOrMYrQJXvZlYoIIM5IZW6pCRqlnV5s87C/wTO/VMLRObsM7R/uz8JK036JVjjFo0oKSB9VCoDFT59H+s4Scsxs8uxI3KInfQKXgjvvJEN7G65Rhur3pO7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lT3O5tDP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-206bd1c6ccdso1953625ad.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726692093; x=1727296893; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WarlL4l/d02jyzg0PpXFDhsFouDnqnsry6bmfec5QHc=;
        b=lT3O5tDPuW9URXZfmPvzZkGatRoEwmweuIXsuPfI6LK5dVBashO67Lobeg2et/ewxW
         FrQPvDgIHSaNU8fFZO6SSUUkMTta1TQyX47dsNphPn32LF3BhggxjSd8VELi0V0hHKNb
         J3/Fq/FJmICIOvZB99grsPZuCNnOusl+e7SWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726692093; x=1727296893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WarlL4l/d02jyzg0PpXFDhsFouDnqnsry6bmfec5QHc=;
        b=NoPaClymNrDUfAxyl5IQ9Yuq2U3I4WpAF353Ls5Sl8OBjpoTJecro6exSlmPSBgN7W
         bubG13jVNgy7C051obgkkOuXWYP6xHTUqreMwgrylAQHtC03hQTWcL2GJu5NunIaYvTz
         SG6MTIHHiRqas/6L2psFEsauEPddhCiudkjJ3NqJW4BTA9fITr4LwXt3HncvSJVooGDF
         ZmLDSxG5fxYkB4U7PIfTd6VHekS++7HolG+4MVPeTrKJCI7dgvYjMoP2CDQSbz/+nJ8t
         b6KWZibmz3JPt6n36pL5vxjqp6gm35y+OWs/2+Kf/Wk09f/ifudSW8LyNB7bEKMaId9D
         EFbA==
X-Gm-Message-State: AOJu0YxLhA2P/AZe5VeOd32wyxtUDHuU56hGgGs4LdLppsc/zpCSP1G8
	ETmQcq3UvYb3z9/9ayPq1a9mSOHsX7RWk8BXFL2aRcS08NojxINidb9P7315Mb6bsfh9vzIRmsY
	=
X-Google-Smtp-Source: AGHT+IFlEsf8G0e4ZIuvl13p0i0PfTQRY29xpaXnoyY9DhZrtDXVJvxSDYVJKMBTwM/md7apJ4uhAg==
X-Received: by 2002:a17:903:189:b0:203:74fe:4ee0 with SMTP id d9443c01a7336-20782b69cc6mr255784535ad.53.1726692092794;
        Wed, 18 Sep 2024 13:41:32 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079471a2e6sm69338765ad.240.2024.09.18.13.41.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 13:41:32 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71971d20a95so68448b3a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:41:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad3:b0:717:88b6:6b1e with SMTP id
 d2e1a72fcca58-71936adf416mr29731679b3a.18.1726692091261; Wed, 18 Sep 2024
 13:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918180540.10830-1-dg@cowlark.com>
In-Reply-To: <20240918180540.10830-1-dg@cowlark.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 22:41:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCt9JhutZJzc7sERTWSk4220QXm464yx1J0vr-LSm6ciUQ@mail.gmail.com>
Message-ID: <CANiDSCt9JhutZJzc7sERTWSk4220QXm464yx1J0vr-LSm6ciUQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Sept 2024 at 20:06, David Given <dg@cowlark.com> wrote:
>
> This media format is used by the NXP Semiconductors 1fc9:009b chipset,
> used by the Kaiweets KTI-W02 infrared camera.
>
> Signed-off-by: David Given <dg@cowlark.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> ---
>  drivers/media/common/uvc.c | 4 ++++
>  include/linux/usb/uvc.h    | 3 +++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index c54c2268f..c12d58932 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -96,6 +96,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_RGBP,
>                 .fcc            = V4L2_PIX_FMT_RGB565,
>         },
> +       {
> +               .guid           = UVC_GUID_FORMAT_D3DFMT_R5G6B5,
> +               .fcc            = V4L2_PIX_FMT_RGB565,
> +       },
>         {
>                 .guid           = UVC_GUID_FORMAT_BGR3,
>                 .fcc            = V4L2_PIX_FMT_BGR24,
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 88d96095b..01c3b2f45 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -140,6 +140,9 @@
>  #define UVC_GUID_FORMAT_D3DFMT_L8 \
>         {0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_D3DFMT_R5G6B5 \
> +       {0x7b, 0xeb, 0x36, 0xe4, 0x4f, 0x52, 0xce, 0x11, \
> +        0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70}
>  #define UVC_GUID_FORMAT_KSMEDIA_L8_IR \
>         {0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> --
> 2.45.2
>
>


-- 
Ricardo Ribalda

