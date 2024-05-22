Return-Path: <linux-media+bounces-11751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312258CC8E7
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 00:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6219DB20C19
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 22:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C58811E0;
	Wed, 22 May 2024 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AORuNzjW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF57C081
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416138; cv=none; b=urUQH5yL2XCruc0hGs88KxHK6++Hu4B+fCA5HnEPLHPPDuw1E2nQoloxDTJRAVAaVJpjW83X1GnSNmJs1vZ5fQWqy3pv8pGAI63HZ9ryJ+cgo+EobGT5epChoXcW3fj0iDcS5xPNC4/jX+lc240oLmzNMJQ3W/s6XJ/sUiL2qPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416138; c=relaxed/simple;
	bh=Z5ybYhW+4mph3V5SHpXWp1q2xqKfqKBh7qVI+noB3io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1Ql1WWn37WULEH5Uj77d54XTzTZh7YKby/Cnn71kQs2AoYDgIdh90xDUXIsUftAPdGMObDIgWd/Yt+bh9es72h8SGt6QzqUTUlRVOomRuJAiWOY3C0/pzmalUdF0KpatB4OQOwope4XrGReCe3fl0tz79sNriwygqFok7rFa3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AORuNzjW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so44381831fa.3
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416135; x=1717020935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
        b=AORuNzjWMf7nXRLN0WDH8uiv9YyPjRAopPoF8QDLd72zMqOGliIaG3WWxPLeV5OSWs
         xrj/Ah+58muXVdVwJ4EnZCJs11OqUheyiW842Bh130qKutPephgK7TEWndO8pNAZ93Uy
         ohgHplGuDpdi9YcWfVsRBOQ6AausizJt0CHyRWGCOqovcKAZpgKMPNlm9b0z0tR46Phz
         zihhCNREc41GVRBSBpRNqnwuIeHXXxQJRv/f+z9dErV6Q6pw9+7wsQMvqz9+X7HwkfGm
         Ny3lXsiwnrf0sa9fXO+z0qSxdND8dcfMuWdmeYa+0UX4u7sGoMzbkmiXzBtglL5cA5ll
         vQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416135; x=1717020935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
        b=a9BU8zExtOfPR1M/IavQ7PrbarBEpY/WD1LmKycJcGZ5BhqUJskvRR2PAtSsgGf2tl
         GJeLvmIyhcZAH+ZXmSCqeKwqbdPQREAdB+ZE7ILv69Ex36n0ZpGM2Cgcbz53iWaDXPQI
         c5k5Fk94DFn6JG1w9XzQTZbi4BEMDPQJT6LpD9GAmEXMeptgPOwiO4f+0kbn5qaaHzxX
         BjAGLTy6p59TlahUd2UF2adwIfclTaVdPERV8PWnFmZX+moOPFUTuz1WeiXjzI1P6FSx
         eQ26L8EAI0i4m8OkGzQ28J+f50ETyz9aRXlJFDfU/ZUHTUP4xXcARiIHjqWeumkzqEp/
         7TQw==
X-Forwarded-Encrypted: i=1; AJvYcCU2VvbIsxYDtX3nd0c33Piajj8ahLt+PCAyekoIyEDCIPuYm/37dwYUDucjwv/HYTdNyo9kNbK2pl45b8stAS1myhoT0rANDTQ7w3U=
X-Gm-Message-State: AOJu0YyubYNQdw6vGEXL4KUsCtaUgcAHcxZuRXNt4DFCQGGM40WiUaZn
	/FJXNBC04CZL/U9r+BUCC+DBo8b6NXyb8C0H7ozPzTeUgGnUZ81JFnzEO+Jk8Ng=
X-Google-Smtp-Source: AGHT+IF/UTSqsmeasuf7NOT2sTbmOrMUL+I3W2MWiTAwWJ+7vs+IwOiiNIBy+wp79U/WJ252kb2Igw==
X-Received: by 2002:a2e:2c0c:0:b0:2e0:9646:8512 with SMTP id 38308e7fff4ca-2e94959d2d1mr19932501fa.31.1716416135049;
        Wed, 22 May 2024 15:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0bbc372sm41384461fa.8.2024.05.22.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:15:34 -0700 (PDT)
Date: Thu, 23 May 2024 01:15:33 +0300
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
Subject: Re: [PATCH v14 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Message-ID: <nxcom4wqbviqipongd3r4ao7w4ik4pntq3jejhmb4sr2ymb5vb@mtyeaxtxlmat>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:35PM +0200, Maxime Ripard wrote:
> We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
> sure a given property has been properly created. Let's export it for
> tests only.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_object.c | 1 +
>  1 file changed, 1 insertion(+)
> 

If this ever gets reposted, it might be better to move this just before
the patch 6 "drm/tests: Add output bpc tests", which actually uses this
function. Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

