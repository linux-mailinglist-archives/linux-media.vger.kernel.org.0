Return-Path: <linux-media+bounces-25397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA47A21AE2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 11:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133321885194
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A076C1ABEC1;
	Wed, 29 Jan 2025 10:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gD5QubpI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089061AA1F6
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145940; cv=none; b=pV5KPLbdicNijzywu7y8+nnlBiKkWkjkwbcUBt3wcmjJV7HcbKNo7Gl9R2eypA4wDZwsfnMa3C54e/Q8nbtC3+o7nHvzhY+1r3LIMa7Z4gIyIKL7Pg3Vvm70/ZLcbg+gA/gN6GfP56SSByYDL3KxesCtfSQ0VBr1RJrXd0FxU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145940; c=relaxed/simple;
	bh=kl82VmWgXppX5VJ/EtJ0shYPRk3gaL/s/bAIlojjAn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkXVAL4LePKiaB6kKh6I9WyTdrlAU+klwLTtczduu3xviRqV8Kx18Gx9LNHObGb+gbSFE3Vqw5UZuPH/RtZ9rl+CSE6GDTZgKo/fLcfTYE3g5Mois+DTPtZd7hUULTnkClGPCzfrTIAEuft7S0tMqDoSLEFYuoxVRj60+100Huo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gD5QubpI; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30219437e63so5685741fa.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 02:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738145936; x=1738750736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CD7Rzq+gMDi5MyNxNk1w+uvvwKV4G+Zwfd1XSHVS6cQ=;
        b=gD5QubpIJriyPuzkYP3rbiSgvl3pcQQu6ttqpp2zJc9Nids9jUuo5LKNZKLt/cgqXa
         mmQ0B4MR8t9LM9SX1GP0W99ImefruNHrCvWHjoEo4QU3JUed0P6xqWpC1TDpU8P7IX0O
         2KMZtxEipy7xrYkBAcsE2votRRb4nDZXm2NjRMU/6g5pTWl1PxtTkaTmJBZzaRF8HL1U
         T0/HzzTaVKsyyYZQqAI6agGDCQHSyFtG9jLjCAYhPCtXxZiM8WAQHOyVDom5qEucjyjW
         hVTYly6pmkRnbXJwNhmoqfjrKz3y6ZnFvr+tiZLSLhVYuQbflkFM6qWNx9bbzGB5CS3g
         rGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738145936; x=1738750736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD7Rzq+gMDi5MyNxNk1w+uvvwKV4G+Zwfd1XSHVS6cQ=;
        b=S1oiAUeGBVQlQmNFqH+I5Es3gccG4WlZ+JPCBOoY3W8oJkDPhkSgGuRtf8lIpSPVsY
         HCu3OIErJ6SXBMv8v08vza10A24WOD1YXfzgPAT3OLCFRc6w1MCjyAQHd2eE4eb6B6b8
         OJLR5FVyIAF1apQQ1aCMNFJJb4NlH/gGLTMDuQuXLLc1yJZ/wqGNmlypDIgNwmgUCVu5
         wSSxUhGd1NOxt3db7/ZclkzbXh72BlcLJv22if/9byXm3Qry21Gr1787dKQqC+95hzeY
         8tCOZ7o71/DUktFUBqxdDSrZdZ6THiL4Atse8DttXTAYlAzMKCKHKcbiA1+9Tsja7jzl
         nXYA==
X-Forwarded-Encrypted: i=1; AJvYcCVlMa8hZcSVT5pOBWjJRQafv+xVamCgoLUM4RtgGL91ptrzVexIP40Kn4jbAZQ8W5Zy/37O3ZsQ2bZlAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtH803Kf12HONCFaM/1lj1n+/iu9atqqUAYPPk1i+0XqYKyNYk
	2eh5ABA9uPsAgMnqddpcSHQJtg2gml4m03IzIlcav9iuxoDoEr4ztZ6aXrLbh7O4t8aTH4E80zP
	SOGw=
X-Gm-Gg: ASbGnctYaGGsiOPMOIEVXD4tBG2XAOSRL2V9KZoYwDngl2kEuBaU4ju2ZhDdzZSaXaY
	EndF6e5LxLoiVdHd0u3KU9coS00x+Bz8VkaPYRYWOOjANJn7BbY2VIbJRnbX6ixQvftK1IcnikD
	DunI2GYrOeu6mV+ZYEO2xepxVKNjbwmKCBN/oM6qTFcnrec+E8frRd3Rof0SdxossCu14jAFeCa
	ZAbv+D2GYbeVt2ll0DFzPG1Hz31izRZAQuYg7CFYt2ifCb0ocLcHIoRLMs1V1FVPR/G9cHXsfCK
	15bDBSTKiq5DOHtD9075CCoTtrgJXRbcIUhgoRaYUtLoUPyT5vourri3kV/v/epi34LhpQ0=
X-Google-Smtp-Source: AGHT+IF9jHoLDnvcnghnxUeU87YKSzZMeWIi2QDM6j19kDW5g68ullXD1rILsMSfpCm/ZndoF2lP+g==
X-Received: by 2002:ac2:4158:0:b0:542:8d53:5eab with SMTP id 2adb3069b0e04-543e4a71be8mr680136e87.6.1738145935932;
        Wed, 29 Jan 2025 02:18:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822f85esm1949177e87.53.2025.01.29.02.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:18:54 -0800 (PST)
Date: Wed, 29 Jan 2025 12:18:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Farblos <farblos@vodafonemail.de>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Message-ID: <idv2nm3dextozwfjyj7shq4gf7nbbat3fup2zixg5jwya7hi4m@a4g2kfxla4pi>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>

On Wed, Jan 29, 2025 at 10:51:48AM +0100, Hans Verkuil wrote:
> If the hotplug detect of a display is low for longer than one second
> (configurable through drm_dp_cec_unregister_delay), then the CEC adapter
> is unregistered since we assume the display was disconnected. If the
> HPD went low for less than one second, then we check if the properties
> of the CEC adapter have changed, since that indicates that we actually
> switch to new hardware and we have to unregister the old CEC device and
> register a new one.
> 
> Unfortunately, the test for changed properties was written poorly, and
> after a new CEC capability was added to the CEC core code the test always
> returned true (i.e. the properties had changed).
> 
> As a result the CEC device was unregistered and re-registered for every
> HPD toggle. If the CEC remote controller integration was also enabled
> (CONFIG_MEDIA_CEC_RC was set), then the corresponding input device was
> also unregistered and re-registered. As a result the input device in
> /sys would keep incrementing its number, e.g.:
> 
> /sys/devices/pci0000:00/0000:00:08.1/0000:e7:00.0/rc/rc0/input20
> 
> Since short HPD toggles are common, the number could over time get into
> the thousands.
> 
> While not a serious issue (i.e. nothing crashes), it is not intended
> to work that way.
> 
> This patch changes the test so that it only checks for the single CEC
> capability that can actually change, and it ignores any other
> capabilities, so this is now safe as well if new caps are added in
> the future.
> 
> With the changed test the bit under #ifndef CONFIG_MEDIA_CEC_RC can be
> dropped as well, so that's a nice cleanup.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: Farblos <farblos@vodafonemail.de>
> ---
> Jens (aka Farblos), can you test this patch?
> ---
>  drivers/gpu/drm/display/drm_dp_cec.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

