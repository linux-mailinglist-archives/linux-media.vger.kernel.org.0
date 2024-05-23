Return-Path: <linux-media+bounces-11793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B58CD021
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0F62823DB
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2096313F011;
	Thu, 23 May 2024 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrYky5nl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3A13C9DC
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459446; cv=none; b=T7gHXO+rSTXSjKSwGgF0mj/z+/e69G6N8YvYomrBcuu1oTXwd3wX9zgDlygYqpfiMhMLsnFe/N8Yd7DLUGx1/uMe0jQjY8RiJ8dPNK1+UgUdaQYHcjfd1HyaAT+DSHtXm5dBRvw4DWArnx3J+ulbrtrPbwgeRrROG5y3H1EU2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459446; c=relaxed/simple;
	bh=VxArPR+4LU1aox0+YmS8YeLfjdTov1uipRKbrBd98BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA39XSnkFmwSW7N3vgufbjpIOhfadFA3SGjJz7cK9iFDDquOBsKVfOQaaBJwJZwHKV3k1zf8HiRgZetQzqgCGoC8DnRWKAKqBkgbHmUULYWcaNQ2wK+mhYN/VvoVGvzdB9UBMxFzXNNhizMSABb7lDKIga6W4JPPW3EzMlm1Pz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrYky5nl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5231efd80f2so8272350e87.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459443; x=1717064243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=mrYky5nlTcHVHJz/YJkMD+3f82gKVxSIWizyBGJkt1wWz/BOQXMinKD1/YeV3ncIjm
         WCGraQ7W+kV2bUJ07+lI+7nHmJXa1SQVhs3VuVRourkjtmekp0lkrdh/dh3js6HPAgy9
         FaxnZKtoNp9/wQdwyK17+vI2AT/6LQg+Qj305gMebrl5FtX/s0GZPhC8DE37U4oE1AMe
         dhtp18uOR+WFSlnj9lRqHDYmyYfeeijdKrZPULbKLw9V4QNVE5X+zF/WqBFvPDrPJfge
         LrncKnzK2feptacPjvO0wfXk3/zZM8ZusoL0UYq9uxBc5KVEBGPPUwoMZHEQVN4UGNpq
         +kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459443; x=1717064243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=catd98k/3yUatmu82Zmy59iowy3oo4xJ/XVe80Ivxzb0sSZGdS1BhZBZaDLykvyIfA
         iWF3V6rZUMA33f67TUt2vs2mPMS/jPY6wczeExcPvR5NGKH0kWfuv4gIByEanYwSs3Jn
         0jfn5SR3drdHobjL6uFNfGui+rAwnqqFAlJQh/2S5TYf67ipFSQer8fVaxqrQYmIiU3I
         y3k0Jp4GA3d34aNqrLDiWTreK5kRpRiXRZhDl847itiC9v4heDGwWNJxQQcD225dxiU9
         t0g5UnparBfJkowyJWUNXtuW9YWUp7N4CIe94iDPwkhrR19ea6UPgR3UxZe0kpTpoqYK
         Oa7g==
X-Forwarded-Encrypted: i=1; AJvYcCWG0yxDS/Mb7k3WM2d4fILdSkxt3v8SxA/qsNG0ghKT0rhiGraYlzQR2G5cGHM3ITjGWg21yL5joio7WYfyjQo3zgZ6e220SeaZNV8=
X-Gm-Message-State: AOJu0Yzi7/mWyXj15mLA0Tnz2lEfHRPEUzQ2QRjeC1MxXT2GAY0PyLva
	F8+9JvdXgItM4pDcDy9NGIGtkMEcj2urrNs8YjNGhjIaRr+RczMg/VqtnEc/LcM=
X-Google-Smtp-Source: AGHT+IHf7awBjw/9D/TT+Rgq+OAeb8dHAhP0xUpM418Uxoc/FOiPxZ31oJO7H7MbUzlhcOAfgCiNgA==
X-Received: by 2002:a19:f618:0:b0:523:89b0:b03f with SMTP id 2adb3069b0e04-526bf35ccf2mr2563834e87.28.1716459443132;
        Thu, 23 May 2024 03:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52812cf2e1bsm215911e87.254.2024.05.23.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:17:22 -0700 (PDT)
Date: Thu, 23 May 2024 13:17:20 +0300
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
Subject: Re: [PATCH v14 16/28] drm/tests: Add HDMI connector bpc and format
 tests
Message-ID: <7xvmyypalx7letzlyxoootpc2e7io5f2no3pu7jnmh36m4su44@6sewdztpjqfz>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:49PM +0200, Maxime Ripard wrote:
> The previous patch added the bpc and format an HDMI connector needs to
> be set up with for a given connector state.
> 
> Let's add a few tests to make sure it works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 509 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 160 +++++++
>  2 files changed, 669 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

