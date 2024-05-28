Return-Path: <linux-media+bounces-12050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA88D114B
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 03:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93ED81F217AA
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 01:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7819D53B;
	Tue, 28 May 2024 01:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vu8PyfGX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A64C97
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858131; cv=none; b=hilrdYecBV6+zebnypY0PuGZNJksmJrHk7Y4ozEKHGD1hOkz5jzjCdPDKQ/JA8i9HtPp5GiUxnnBU0/VK+/spiu/9sY5pIs+DEZ7y9slBM2Mxgw3jd2N1olKManD233St1/ywV/BtG0vh7pt4dxAovx04tAUGN64aiEm2WhOMHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858131; c=relaxed/simple;
	bh=KOa3mB4OmQi59T0Ompo2h1ZmaG3aUD5FQbKMxzTpfs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umu/gldWgbnNqgWL/eW3RS0t98l/I9Aq2UyStkiZrhCe+F8dK21Hz06LgytxlnSx/3hBh1BMGmTcd8gE/A1y9yfBkmXDJBQW2syMDuZB5PnqJfj9eTBXJSJNEqRfqy3kcql+WSudcgIIT/swgHqE90Iz7UMpA6MixldiRpqA0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vu8PyfGX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso368811e87.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858127; x=1717462927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YyAxoHilgrk8yTu5a6z1lAdisdBZ34CZ+2kOXUlJDWg=;
        b=vu8PyfGX3OfyFAX/aeKK/pvTTaW8gVeR/WNL3U6EQ7UJgK6s6vcOcdGjkulVV1iFQh
         TlBCashbnFXD4y9JDGDB1KH8bcNaDk7kLptw5n4LVbBYJe3SD/FPdWPtUMUDjlomIVft
         ekV4A3JGGzlogrO+59bAVZyIo8mi7IbU314+PTvGgP1HWJHggJNWlQfvxsiuHYzTcNqj
         vL87anpWxpzmDOAVs3A4/a1MoymvhRzqw8puPHgWHASDzpAJRMjbcIqmsnRu0UF9PBtf
         pU84tQQEf4ptUgyF8nHqeRoukWqHy3wum9PMNtjDJ9zwJGIzvXbs6u8mbmByxuonjsll
         raWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858127; x=1717462927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyAxoHilgrk8yTu5a6z1lAdisdBZ34CZ+2kOXUlJDWg=;
        b=OJopauwa8gyrZawFvjCnNUU/aCBN+1y86AepRG9/78csnYOUvh14D3zDkgPUihaesP
         jQEEl3j+GXNNXS3ucluMGZBzXMwRjFUE06yTx6vkijxhQ5AoGgN7gpXDITQSLbLAWT7w
         0sHI+CGdE39prxqR/Ujg2lCHrcTP3vA1qnH2O4wmsALGnEv3IVQpewtDnriIAyT5kL5P
         /w8BeNUfTMYckOj4OMwuU4xncI/ldx+o0Y358dpz0pLA9hLBNyLIKratykohOl2Pt4mr
         +GcmYruYKUduOjk4ooDbeQ3RmDdUmZHT80wHSbkNK5VYDZAbAhXV381mKF+5a5XzyTZf
         fM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfasU3E15FCmTRJ73KPNZ4h28mjzWszJzFy8i2xz3AbixVJLnk1RvoCGFmgyDtNLVMJAhbjD+mctJ4j12kIkLlzyF7BVp/WHjQr+w=
X-Gm-Message-State: AOJu0Yz5ZGs/EzfZvTmAvSWKDz7EcDFfJqQZCr6zSnTZ8KXU5eOg47zI
	6uT+fGH4y48veaumuqB1parF8l/tCWySBlADwrm7OS2sHSbKDVq35kI1CA0qd8g=
X-Google-Smtp-Source: AGHT+IEQ1go2DE2vSmAmNQguv151cKtPHWKixqKjqFT5FdpVV7xbcj5tzLUBy3oX+M3iCDABhJj8OA==
X-Received: by 2002:a19:2d56:0:b0:51f:452f:927b with SMTP id 2adb3069b0e04-52966ca6423mr6095364e87.45.1716858126970;
        Mon, 27 May 2024 18:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e887a56sm819467e87.23.2024.05.27.18.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:02:06 -0700 (PDT)
Date: Tue, 28 May 2024 04:02:05 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v15 17/29] drm/doc: Remove unused Broadcast RGB Property
Message-ID: <pybexd4vummb2mgn3kgfc52hcbsk7nb6eumizsoschfbevgevd@4i53cplvtbtq>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-17-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-17-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:58:06PM +0200, Maxime Ripard wrote:
> The Broadcast RGB property has been documented as three separate entries
> so far, each with a different set of values.
> 
> The first one is pretty much the generic one: it's used by i915 and vc4,
> and is the one used by all the compositors.
> 
> The second one is used by the gma500 driver, and is a subset of the
> first one: it can have the values "Full" or "Limited 16:235", but lack
> the "Automatic" value.
> 
> The third one however isn't used by any driver and documents the values
> "off", "auto" and "on".
> 
> It's unclear where the last one comes from. It was first documented in
> commit 6c6a3996f2c5 ("Documentation: drm: describing drm properties
> exposed by various drivers") which adds a number of properties used by
> drivers, but without mentioning which driver was using what property.
> 
> Grepping at the 6c6a3996f2c5 commit however, it looks like no driver is
> actually using it, and a quick look at the entire kernel history doesn't
> show any match either.
> 
> At the time though, gma500 had an "audio" property used right next to
> Broadcast RGB that did have the "off", "auto" and "on" values in the
> same order.
> 
> As such, it was probably a copy/paste or scripting error back then, and
> there's never been such property used in the kernel.
> 
> Either way, it certainly hasn't been used in a decade or two so we can
> just get rid of it.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/kms-properties.csv | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

