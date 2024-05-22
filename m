Return-Path: <linux-media+bounces-11752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE18CC8ED
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 00:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FD291C21B94
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64688146A80;
	Wed, 22 May 2024 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2VICQAB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851A42078
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 22:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416216; cv=none; b=UkPg49OLIkK+cPzpbqWeH8tgmnnPHa0SM10WT2O75ESLInTKxGXE5Ib4U3K+6GKxc7EFC216ZUzVv82jqTfLRIGSPSzIBbO93LdxGNb9zQnNOCly33SH/7WfQnM9T1cC/t+gxtwUAgqH5lk7+FjkaqEI5IvWbGrvwhAzsDMgKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416216; c=relaxed/simple;
	bh=So3o6Lg7+fY/3iQje4qLIfCyvlQ2gYJIGQIhupPwnWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugj63b4srHQKa5FfIxgmsVbLsGQ3q1MHPmwrx6FwIAkacMNO8IyxQuTt+94QCUqXnF3OrMkkv1DPVPTb52/m2a8LGRSBQo2pbS6dyqYqBHGDRBmaonzuNu+YtVdp0arvYCIvPAWNBHQd/bKQwZWe2U7g2BArfko36ZLlYPWcgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2VICQAB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52327368e59so7860271e87.1
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 15:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416213; x=1717021013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
        b=G2VICQABaCvlbV4KV/AwyDTtfxDQiuCyvZRRK+rsmO0JRkOcu4+wYEs2l7zUs6VoV7
         FeN1fQza9en2sIm4JhfZTWSyK6XIScOQktqy8xrcOrZ6wSfixJeiKM29U6Yj3u/0W885
         ibSvNXsKLbpEMwl02R9mS0XWTPaS99PiMPpOyINjxmLHIXPYqoxlmJa967MMD6zskDL7
         NI2ZNcF+OjBi6Z3AEpM33y1HmSLZMxxafQzJdlWptX5Sje63PWK5oOqPSOd2EusZ2Ech
         bjCqg1fhrhe2G4e4Xqi1GHMxiqWb6dFbf4ju3QgdRD6NLrupyF6Z44qiPdoaf4nv+S76
         5ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416213; x=1717021013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOv8Z9OuvrouyMMtf2t9ALTmfVkIrc4vJ4mhIPjt+Xw=;
        b=cYYJCijWic+MJTeqBGfWaAdin4GSP8udoCdW5i92rc1Nw2lcfcXMxkFjvoU/uGG5bX
         mKA/nTGIOHJR8R4MKGIPYlrbd4Dthvz64uUExZPOhm/aHU0XeqboquZRig2IUlZ+xisl
         ZAkHCm98a/gI1yw3fFMCnXINH9IMnXb/WQeLzpAjfiEHX6Q6YgaKVgi/j1+ZMOCg4x/f
         RBecuXkir+gcnF8VUl2HBmSfGxy7RCAoUAXUVyC/Emwsc+7SXAlNTIqFdKMKtgi/EYTR
         kssSaeVpu9ZvCD+2sTTbInI+7wmrkfUlqP0PfC+NBix/Shaoyl0g6K9UvzZIutLtsqeI
         dWhw==
X-Forwarded-Encrypted: i=1; AJvYcCXMwwKECkBgfsJI4uGdr/1Uwq0YUb369bD0Npy/0lfqi+TQGz5eDvuT5OkqQZENYD4iFQ36FIPlSkmrR9PjMMUUoqDBs3f0CE9Hmio=
X-Gm-Message-State: AOJu0YyntfxRXJouTXlkqgnN6S5XiYdXps4JpoF/lIleRU+l1cZeHH9a
	V601lugToQc0qfqoo8C1p+46arKj0GFfEfoXXeTExm6WJIYTiC9PTfpxgYJ5X7E=
X-Google-Smtp-Source: AGHT+IEuFGymLQfp5rTalVoB9wZNPMs9O3YdvgJXkOez5hZ61Aob79NQskger3tI6SZIHM2Dj+fRCw==
X-Received: by 2002:ac2:5ec6:0:b0:523:8a79:ed62 with SMTP id 2adb3069b0e04-526bed9e8famr2047667e87.3.1716416213020;
        Wed, 22 May 2024 15:16:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5238f6fee2csm2840002e87.181.2024.05.22.15.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:16:52 -0700 (PDT)
Date: Thu, 23 May 2024 01:16:51 +0300
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 03/28] drm/tests: connector: Add tests for
 drmm_connector_hdmi_init
Message-ID: <ex52reilea7p7fkayf47cuewa4cpuaxpq2ezr7f6cvflmpugc5@bbeo6uvs32kj>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-3-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:36PM +0200, Maxime Ripard wrote:
> We just introduced a new initialization function for our connectors, so
> let's build a kunit test suite for it as well.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

