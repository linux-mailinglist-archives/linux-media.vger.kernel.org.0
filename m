Return-Path: <linux-media+bounces-11781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5D8CCF74
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1CF61F23143
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085B013D296;
	Thu, 23 May 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCLSAXFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAE42040
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457191; cv=none; b=u1I3j07bhawdyZWt1jj6bp+90Islri+robdSgj4142//mN47W4IQFx6OfEpIQ+DMEY/d/xJW0wn1vTHwG8QThaU3voXgljWNyrCZsj0644ROd3IWKqVLM6wTQrUx/w2MPXVcwmXA9lsNXRytOLV49Mp1okieMutG1e1SlZvNAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457191; c=relaxed/simple;
	bh=pANZ9BOe7lIjdlZajVdcF6HeMjTV5Ks8Me0Z1rWXSv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwsyBMIDhV+GwPtjYnh+JUah7YU8y2JRGt7K9is6ckoCNtWkSiWd41Qe7fNek1W1dXEqSwnc4ii2sSs+D2Jo7BQ/By2AnPPesLjiKihwMBfeyhXxT6Zt1TC4Hy8DAtu+exUN2uIPjBsUPdwfZNpY6dvOR9D98LW6tVGMKhwjsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCLSAXFQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso8118076e87.1
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716457188; x=1717061988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
        b=eCLSAXFQ7bExLPPfCPtPAeQgqwoDoGfHQEDfg8YN/W4q96n96fa6EynxLFvwvaMD/T
         xjqq1vFWRl7M2pZPYldKTj7X504AfXLHT7Jtb6WuHa5DDZ3Bh6zR15LK8t78oPr4Ask+
         0gjl+P2BGsjVRP1bvP1QnqX+HWP6j/WYkICPrTeqGbhrpFx0mJHNM8gJzMTRJHzOFGZQ
         NxtYhVGEw/XYu0qAYobNJ21tj24znub/lJwQ9vUMSeS2M8DPArKSNz/3TvWWkefVoxNH
         e96g9WH2Jq9mxA8B1eKoMsE5NwHNvdv5xG5mcjmtNrPpznTODvTn7pvACUdHFgachYTi
         abrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457188; x=1717061988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
        b=Cwtd9LHl+iKyoZErC8vPlobBAmlGotdqiuqQWacXSSfkVuhJWir+hFNETWjyZl9nY0
         zXQSHqDthCTzfTwuneBbrWUZUck7ufb7cXhZwtiOLx0etIwI4BYocWcY6SRQrhtGHIbn
         ccg9xUrt5cHtq4zjqlIMgpx7v39ZEBKOufOtKeVfK6Mo71nKIdTPurILDuTx7M7QQO3U
         3Fb40XwXwWwYD19fwzZ9a460Rvn1fMdhu/sR8ltqSa3r0LDvs4pNarZ4l0wW2H97/PRw
         0hD5f+upYkCrxPOgapCd08LbdiUhqINjdaNaDtWbHkqb+B7LkdNKSG1WXcUBXRb2Wf0r
         vPsA==
X-Forwarded-Encrypted: i=1; AJvYcCUg1HU2E/erASlti5gL8KUwbvSCzwuD4loEfIC9wktvjPeUjd6SYoGrOmFp2magF10KDAJsaSdszAVOW4B8izcr79KMPD5b9kaGvtI=
X-Gm-Message-State: AOJu0Ywum5tPZ0rG7r1hNu5mWHAFgnxKGd8fZku+WaveqA6+BALUQR2l
	+XrX8NisQ3MhDco6byPbbmiQl30i3LFysRXRzqRgeQVAXvGPpZ5SiZkxz1UpKbg=
X-Google-Smtp-Source: AGHT+IHZxrSIuUr68retAsDGyT49V7Bjyk+0v3vLZlctFxxYj5K8ZOcu4gphFsf8YhaZBtcNl5CRiw==
X-Received: by 2002:a19:520a:0:b0:518:eef0:45c0 with SMTP id 2adb3069b0e04-526c0a68dcbmr3895711e87.48.1716457188090;
        Thu, 23 May 2024 02:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2c63sm5212392e87.278.2024.05.23.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:39:47 -0700 (PDT)
Date: Thu, 23 May 2024 12:39:46 +0300
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
Subject: Re: [PATCH v14 11/28] drm/connector: hdmi: Calculate TMDS character
 rate
Message-ID: <2drjirwwj3cwm4saboa5qnhwi7wev5gnilg24u7svz2iw3gtef@jainjgtog3uf>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:44PM +0200, Maxime Ripard wrote:
> Most HDMI drivers have some code to calculate the TMDS character rate,
> usually to adjust an internal clock to match what the mode requires.
> 
> Since the TMDS character rates mostly depends on the resolution, whether
> we need to repeat pixels or not, the bpc count and the format, we can
> now derive it from the HDMI connector state that stores all those infos
> and remove the duplication from drivers.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 67 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                       |  1 +
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  3 +
>  include/drm/drm_connector.h                        |  5 ++
>  4 files changed, 76 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

