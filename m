Return-Path: <linux-media+bounces-12048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399E8D1142
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 03:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DA491F2175F
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 01:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DA98F6B;
	Tue, 28 May 2024 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNAc7+Tj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6316426
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858076; cv=none; b=BJtERAPGy7XqdhwThCBykJH7fjpVO6mKE6bHNb3GJmTUd/7+76bmzb/MoIVkxTr2qPl8eW5BigtVb+RL4F2/u29RjJGLVduHDpzYfsFYJLeGqdK4AeiQnQI6sGgnmj4bfpHm7C54GYr9RugItu9z6NF/J+3Pa355SNE+URa2hJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858076; c=relaxed/simple;
	bh=CvD3137K3jv+Zp0e+0UTpl4U+m05RFshYujcKh12WAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZtlymYTci+J7h2ugJNRgf3mqb8q000vBi3qeyAtmvZ3Nw5USwFqXv3RQMz/we3tB4Rp8hleqdQ1KiyEkx3f1LuPaGCmuLVpU8Pru4JubGDR3YdB2uazlqwwRiVNeJ2GlZ5a0F8sUAKOsec8YS6QHCCXRhULHBAuzrwFFvQhEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNAc7+Tj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso2341631fa.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 18:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858073; x=1717462873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=WNAc7+TjvJym6HVIxaKClsXnL+viUAagXPz+gGQ3bN33q81AbgL8f+WTZyD/NiACzq
         6bGE2L0JvXVVEvqfvtIU2ATwZrX/CogCdk+sXIXVgRYhBxZP1BuTEWY5Y0DIG2K46wQm
         BUnAFdLExaRUb18idlR7x8TYN3cvEDoojVR1D3Ne3uX2d0m4K5s8otim0IUMtL/LoiB3
         Dx/sLCT9xIdUFetA9WkkqXBznTX9s6I6eKpiWbuqOJVph2u819K+RtAx4faat3NtSw2s
         oXsBomGOu9rTN3OliQpCO9LysSlnhGjNeyS+jyZhOnrlj8rPwu/bsF2HQjEXH+s356kx
         YR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858073; x=1717462873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=s6+oBK9aRNFD1XKgqfeLKhgj2KDQ/knt5SGkkCvRCiwc7vO8FRn3/1CVruFwEUXETz
         ClgI4votja9c7HRV0iJHWdwtIK5JqM6CpkCBaWVFAybbqQLTWoCxKMwAf2AJObgq3yQF
         KgJQGLsS/b78C8qDxkhwWBTK7BZLvHSlMhAmmemiOqz3U8prSiIAQhe63eHqgrOqdzyk
         B/C7tmMQmqzPYYfpVteNS4DFrJAO2CbnUtbd8Sf3feXQRk0IoNPJUu8YLShhLw3wRg5i
         0M5hIqLg8Ee3SHIoQrr9VLwAhEqliMMy53ce6SQY422a4FfK1+3I+AiX0bJjmCC4N1Z/
         QLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSlzgUixnGaLQU/1RVjQ5n+mwPLzNryWLaieUKBO+kR45FaQJpY9sf8+z4CRMmJHt/JQPTuvyNEHRhWMbRoDV5xbUv9Qx0akXJd5k=
X-Gm-Message-State: AOJu0Yw4zCRvYYF7Hvo8BpI8e+zJ/idxx3OG9AhN6/ejj2OUltE2vzqU
	pdalDSsYNnCmGnKoAig6V5BGn5VDHlA6caTGhHTPEJFqGr8FVzK6gv6flLyUypU=
X-Google-Smtp-Source: AGHT+IHJTgREWZz1ERTKguUSrfa2uSdH6MWQOiMMxr9ZzLrg0bQtJ+SkJaUNtX+UKWWdzgu2vkTWKA==
X-Received: by 2002:a2e:9f16:0:b0:2e9:8197:eca5 with SMTP id 38308e7fff4ca-2e98197ee2emr15410431fa.0.1716858073013;
        Mon, 27 May 2024 18:01:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf23fc4sm21208521fa.134.2024.05.27.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:01:12 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:11 +0300
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
Subject: Re: [PATCH v15 10/29] drm/tests: Add HDMI TDMS character rate tests
Message-ID: <duizmokcym456fn7mpsfwrwsgazwy4q5nhtfoi5ih6ntmd75th@7yxduxya6j6k>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:57:59PM +0200, Maxime Ripard wrote:
> The previous patch added an helper to compute the TMDS character rate on
> an HDMI connector. Let's add a few tests to make sure it works as
> expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 300 +++++++++++++++++++++++++++++
>  1 file changed, 300 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

