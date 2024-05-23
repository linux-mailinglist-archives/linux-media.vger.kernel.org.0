Return-Path: <linux-media+bounces-11794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45D8CD042
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5D7FB229D2
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9B9140387;
	Thu, 23 May 2024 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yat3ExrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E013CF85
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459783; cv=none; b=fgW8OuL/GBuO/sAvAxz/oh94YpoS4jRSpmVKhSov4xbZUjHtXyj+OfOEjJWvr6EX8HoZYq75OSG0I0DqJbSplGFpU7xgq2EVsN6BqjoL+A8FbjABcLAoKnWigZIGRCC7mknS6SCLkQ7pfIneQdAcXo2JjepDhagLZ0sOSUYcCRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459783; c=relaxed/simple;
	bh=4FADG5CtgDgZ0nIGhxXBr21dhRNWj/4o2A+QCOzfNN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek+ZPuMOliOjf9apndXvV3tzpH77vBp2+yNgz1f9M9WB8bG3NWcEPN1ORZoSIcU3mIFtw7Sca46/NkQlWLOZUIcinxGdkumkhaEv+frPZkGG1ZdoxlGG63KSKTNOrXaT29X9j5zsGm7qKBhRgJm36GqyljPlGy8NJ26jXTwPSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yat3ExrS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso7703106e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459778; x=1717064578; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
        b=Yat3ExrSEVuOMZh0FORKuCGPXzLkvnVcrFPvqkYFywgyZBO9vhhptmjd41emHpzHlN
         nFWw4INv7hN/N8hF0FIvqY6U/xXaogMWBaMhZ/jYQNXtSbagWWMzWiK7xDBv+XEhEShc
         3E5yUQVoQ/ZgUGDmp8D7IjvrDlGLDPqULOFnWcvaolFaoyYCeUj55HsR9360Tis9Fhd5
         9ILn1hM7LodOsfOkyN3vgAlfXPmgLr0VR7lPmq2kgIcHMUd1WiSJtXKiOKQmM3xdP792
         JUw+OLRh1K9lxMo3lCWbEn2ETmSr8vg6vNv3oe9kn1oblxgXIAOHeKNi8rij6I6yAugP
         FTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459778; x=1717064578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHQzcgh+wt+86lDxNvmMSEbfCa2z01pUSJ+bgewkqHY=;
        b=MT2I0esxZ6yOyEutGaT7wqifqv5oN0Ct+jEVFHpDC/z52/XGVxoMsc3mo/A7VWNtU8
         YDPtWiY1baR16dBkwhND4yZMBzW+SADjR2EYfcfeO+mWvfQNHHlw54tsWlNAGaedEO4n
         lD7GkwZygm5NGAt5TbMCWaGDhCWDxmXOOYKbtJGFgWbWg/ROLcVQHmXQtveeRocxFrTq
         zdNLHTXn0yYuVxqGkP8x1yaosLjplqD6CSRq56LrTOR7c3QNnXPCJwfmsfhrodwe04RH
         xEIxBEpExTyKJmXjRGD/Ygin+ynwwCwRMkJPDaJTWKxLJUNJjN7SG7N9WVSYK+a76ReP
         8GnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Mlb8HAC4P6Wt1rt5nMLJ1LqxnRXefYR/wqB6MPVaT0rDQ0u11MGv5zP7SS5udoAEuYH2wICy58X30IFFYjD992fVsX7pVAeTD/w=
X-Gm-Message-State: AOJu0YwthzytuWDk1bqn8aPQAOEjE6KyCiiKTycNZ8+gMK1EA2fh+1Dc
	pi0PbS+kIDMoaOkYeBQYt7HsJFjGgxGR2hXFfZLKbCr+b4w7qBKulzJ0PeirS6E=
X-Google-Smtp-Source: AGHT+IGaIAjJQzrs40kJxNB7OiB13JCw7thzg4cpmesH+f4K6m+C9dDIXqqPiTDnb/PD63DiDWKJ5Q==
X-Received: by 2002:a05:6512:4cd:b0:51a:cc00:951b with SMTP id 2adb3069b0e04-526c0c544abmr2482181e87.49.1716459778462;
        Thu, 23 May 2024 03:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d90b2sm5326325e87.242.2024.05.23.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:22:57 -0700 (PDT)
Date: Thu, 23 May 2024 13:22:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> The i915 driver has a property to force the RGB range of an HDMI output.
> The vc4 driver then implemented the same property with the same
> semantics. KWin has support for it, and a PR for mutter is also there to
> support it.
> 
> Both drivers implementing the same property with the same semantics,
> plus the userspace having support for it, is proof enough that it's
> pretty much a de-facto standard now and we can provide helpers for it.
> 
> Let's plumb it into the newly created HDMI connector.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv            |  1 -
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
>  drivers/gpu/drm/drm_atomic.c                    |  2 +
>  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
>  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++++++++++++++++
>  include/drm/drm_connector.h                     | 36 ++++++++++
>  6 files changed, 133 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/kms-properties.csv b/Documentation/gpu/kms-properties.csv
> index 0f9590834829..caef14c532d4 100644
> --- a/Documentation/gpu/kms-properties.csv
> +++ b/Documentation/gpu/kms-properties.csv
> @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type,Property Values,Object attached,De
>  ,,“saturation”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,,“hue”,RANGE,"Min=0, Max=100",Connector,TBD
>  ,Virtual GPU,“suggested X”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an X offset for a connector
>  ,,“suggested Y”,RANGE,"Min=0, Max=0xffffffff",Connector,property to suggest an Y offset for a connector
>  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9"" }",Connector,TDB
> -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full"", ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:235 and CTM is set, the hardware will be programmed with the result of the multiplication of CTM by the limited range matrix to ensure the pixels normally in the range 0..1.0 are remapped to the range 16/255..235/255."

Should it still be defined as a generic property?

>  ,,“audio”,ENUM,"{ ""force-dvi"", ""off"", ""auto"", ""on"" }",Connector,TBD
>  ,SDVO-TV,“mode”,ENUM,"{ ""NTSC_M"", ""NTSC_J"", ""NTSC_443"", ""PAL_B"" } etc.",Connector,TBD
>  ,,"""left_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""right_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
>  ,,"""top_margin""",RANGE,"Min=0, Max= SDVO dependent",Connector,TBD
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 93cb30dba86e..888fe1fe9594 100644


[the rest LGTM]

-- 
With best wishes
Dmitry

