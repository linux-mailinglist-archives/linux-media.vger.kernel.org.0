Return-Path: <linux-media+bounces-18366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A297B72F
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D36EF1C21D39
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 04:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033D8139D1B;
	Wed, 18 Sep 2024 04:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DCsdeaVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68835588F
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726632273; cv=none; b=E6WcUKRbAFMP6PnXTpWSmnXnMASiaQQuZu6tOnQpOpLP0rTePRJCVuEhvfmXKFwSg5CmDLzvzpMmCIcrse7cc/hXYmoYFj29xTWLVI4RascH+Chk+5ayOB+dXdHt8Ap6m1tpnvq4Zw8Qkvwd4Kt+FhSBLtSfYV7gQlbSU1vJg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726632273; c=relaxed/simple;
	bh=640jxRXiS1ezLQvS/plHCnhscpnegsSgf8D95zSY5+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLFT1xVEFXMkIBJYdh2KBG+ThZrZxZG/5Mus88PWmKnXBbPMZnyVKnEqDXtQKrgLBvImGiues9afgOthpWtm5pBbZbiEve5/t3rG3vduYE0Iv1V7MlJWUj+f7Ta9qpDvMV1A5aBpK2T/3295riVqH+Kx5bj3GotLhz4gA8WyNXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DCsdeaVa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2054e22ce3fso68715335ad.2
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726632271; x=1727237071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ecw5UPngzJ/Evsb7A2JmHsWlCED4sGI+yq6GgmVVx2Q=;
        b=DCsdeaValZEf5uJkM+tHN/6CE3GBIn/HXvwHBpdvtWAbRAWxkdORv7YRlt2Qd49i2l
         iS3NBqkjTPufKudrI3l7YemShMBZVihUDnbnkNYXcn1HZ/ALL9ZE+d8j4+NeZ5L/qtZn
         gLTK4YyO/PFSwW+vD5nSj/WH9mowWFQNycwh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726632271; x=1727237071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecw5UPngzJ/Evsb7A2JmHsWlCED4sGI+yq6GgmVVx2Q=;
        b=HtNgpe8KAM6GPTmxFczMWbPPn6w0Xyn65fb6SxbJPfCs+ZHpdwNR6GbR5jubpxBDKF
         o31Irh6qL9CUjZtsomTwb/vnY8wJlqua3nohj6U9sqX/ktVcDk5SsYwdo/9AI/aEu0Ha
         zJYCafGl+osY4gNWHpzx9+Tw+mvGNLyYf/qlBuPkVUWUpu76UPp/9fgnQ91Ol3yDH6HT
         0gOBb8Kf6QcovNeDjwZ/nL29fe46cR1X8NYt81JMO73CQsfCx2z8eBB8t09QYMRQAGBP
         EjhnVh/yaq1fsXc16oxSzhGTzW0VFdP+7QxG/fdQSZwVOZBh+NJ0KeoZKVNtSdCXAc5v
         DqjA==
X-Gm-Message-State: AOJu0YzJpRU79TAbanWBIFRq6QGupaM24U8SulUmwSWpZd11K7iSVb0g
	uyCpSeB3v/jzGw+rR0Lxbz9gnNwxvxds8Tc6yEsW20hYZFL927zNhj8F0eY2mG3Db2dQ3/WotlY
	=
X-Google-Smtp-Source: AGHT+IEeFiey6Zr/GHGqD7iMegq8pUtX4PwyFvQnKsKWxY+GbuFPNLuI7gjKelwj4skq+hwtRUB10w==
X-Received: by 2002:a17:902:d50f:b0:1fd:9a23:90cc with SMTP id d9443c01a7336-2076e364281mr308689165ad.26.1726632270729;
        Tue, 17 Sep 2024 21:04:30 -0700 (PDT)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794731afasm56764185ad.272.2024.09.17.21.04.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 21:04:30 -0700 (PDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71788bfe60eso4759218b3a.1
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 21:04:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:c6c6:b0:1c4:9f31:ac9e with SMTP id
 adf61e73a8af0-1cf764c2648mr29927930637.42.1726632268896; Tue, 17 Sep 2024
 21:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917215728.50342-1-dg@cowlark.com>
In-Reply-To: <20240917215728.50342-1-dg@cowlark.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 06:04:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtOQt_fTYaXYss6SiO3jF21DZFvMRHvw48=fWaS3vjCeQ@mail.gmail.com>
Message-ID: <CANiDSCtOQt_fTYaXYss6SiO3jF21DZFvMRHvw48=fWaS3vjCeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: add support for the D3DFMT_R5G6B5 pixmap type
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"

Hi David

The CI is still a bit unhappy :)

On Tue, 17 Sept 2024 at 23:57, David Given <dg@cowlark.com> wrote:
>
> This media format is used by the NXP Semiconductors 1fc9:009b chipset,
> used by the Kaiweets KTI-W02 infrared camera.
>

You are missing a Signed-off-by: tag here. git will create it for you
if you use "git commit -s"

WARNING: ./0001-media-add-support-for-the-D3DFMT_R5G6B5-pixmap-type.patch:
Missing author David Given <dg@cowlark.com> Signed-off-by

https://gitlab.freedesktop.org/linux-media/users/patchwork/-/jobs/63726387

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

