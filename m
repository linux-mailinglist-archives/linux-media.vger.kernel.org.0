Return-Path: <linux-media+bounces-11753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789B8CC8F2
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 00:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B325D1F21973
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 22:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D21146D67;
	Wed, 22 May 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIou0Jad"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04242078
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 22:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416247; cv=none; b=YGYrto+iyTmjS7iGGcjVj4ciEIc0nOFBxyvshMVgFi9oFBWnNen0Lgwk654N+EaFFHP6F9LrOnXoygr6cXI1AkmRxjG2ph32i9PoZzZbIUnBNELJJvDbLipNLwAhC8rc/TztvoOVCKsW3zuyfeFlm3s8sV2teooefPZU/X4vi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416247; c=relaxed/simple;
	bh=//b3G9sO2gtB09XWop8ljHzV1PwbXxvr5BFI95w+WaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDYLorCGmpL+83wcpnFIgJsmo+R5VkidbCOEL43l0JEcbQAfK9inilnJ4U9tDGL3nOWTIMxOvZGouMiDcqxIJeRutLIZIVrPCwlsMpABKnf6+dC8OpfRR8JIXA40M4Tl5njcVVVhQAyOsKpyS8ytE4lEX7uuqI3Fx/LVoGG6W/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIou0Jad; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e716e302bdso50340111fa.1
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416243; x=1717021043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=pIou0JadJtTNVc97IdoU3ZGq1C2v/ewz3yNmZK2cC9hBj05YsUHzvEaDTXYYNTxk0u
         7uxABa1eRUkFaQQkaKn6e/AjX7hv1/+jZuiEDDILImpcG2cFF3Vke7+25sz4BmzMraEZ
         hSy4Iux9b2ie1k5QsCUqSWcoejGizUQn873MX5sOfLyyoPNnMZInavJ9R1cLCQfZVVIt
         Vw0zZTYDFRo9wmtCXu3+1BvpSbHsrZwYYrBsTyCCOFgatcHf9fMkyosPDQl1AySLMcdM
         MHDQFgXrWyE9EmvoQr8p6T77aoslLtaPLHllS9pPqxMV/TC8OgmV6hy7u1YppiF6woAw
         RzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416243; x=1717021043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKjPVo1pobuPoRvHj1uEO1HEyVXXDgMeLw2a17VZbrU=;
        b=H+0eQeKu75JArD1R470F2CVmoFFoOeI3+QWpjsVNlIiiq+sjAyZlOEQUYRZU3g4iKW
         WQWi9hw33HcRhr017wqGRr0Zyk2nKtd+XKfJdDXSoLODRIYCRK2/48f/abe7nEQZzuSw
         s4VbXYEPIx+gyMj579IEsFd92Wx7mZ/li/ySWwEC8a1Gc9ZTxx/mBTM2vitg22SJYE4o
         DsFqcKyig/SgDCZMsL7fAJT4x15yDGKgTPeeKSmTeCCk/rw47NDChUn/5SkjGJPOike/
         bRjJIpI74ghg1fmRMbNTRBQGS9eX6VmAh+SEJiVUdbHnTP4ywECcH5PrXbrSxUcjqQ/Y
         RsOg==
X-Forwarded-Encrypted: i=1; AJvYcCV3E3FTfiCNWYQozGkAAEsvsqti7tZzgV3HRfg/f+tcxsAhID9XPx2tuhYAQIxRHQnSjZ4oQv4NOrilAUp6S9gyxlCw4qgSX8nvLDk=
X-Gm-Message-State: AOJu0Yy4xxhYIJ+F4e8e+nRGTz3FeJ2U2opmil0QU0fWhm9z11D1ndiE
	036AH1svL6MRk0zfem6kU7bAkZwo/MtiAG7NMUMCd/0jnk/EF2bM5XP5oEOaUdg=
X-Google-Smtp-Source: AGHT+IHfhjtR8bEAU54UWtngodjp97JPGUmwO1OM74aRntp9IkGMZ3Yej1SUNJLq9vHd0wtc+li0YA==
X-Received: by 2002:ac2:4c95:0:b0:523:72b8:8002 with SMTP id 2adb3069b0e04-526be315f14mr1967940e87.30.1716416243518;
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8b66sm5075515e87.195.2024.05.22.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:17:23 -0700 (PDT)
Date: Thu, 23 May 2024 01:17:21 +0300
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v14 04/28] drm/connector: hdmi: Create an HDMI sub-state
Message-ID: <zeg3lwkgc36lheoh3wdieexta2roqhhx74crxtw7dygdffkgzn@fwkfx2ixhu4q>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-4-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:37PM +0200, Maxime Ripard wrote:
> The next features we will need to share across drivers will need to
> store some parameters for drivers to use, such as the selected output
> format.
> 
> Let's create a new connector sub-state dedicated to HDMI controllers,
> that will eventually store everything we need.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/Kconfig                 |  7 +++++
>  drivers/gpu/drm/display/Makefile                |  2 ++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 41 +++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_state_helper.h     | 16 ++++++++++
>  include/drm/drm_connector.h                     |  7 +++++
>  5 files changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

