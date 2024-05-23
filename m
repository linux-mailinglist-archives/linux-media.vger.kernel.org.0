Return-Path: <linux-media+bounces-11796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DE8CD050
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 12:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CE0B1C22002
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EA11411C6;
	Thu, 23 May 2024 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/A2nphT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FEF13D521
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459884; cv=none; b=mhFLT4xr0x61JfhV7VH3EebdDYjDFKdYkrpiQriayxOhFxvtRODqzFphMlvgwtP7I/Vc+jmNESv/1Jxb8t+oExccaFMoUSQfdPKNFxwd/7ESDUsgsGs0IM7WmFSdGP0vOv7xiybeCKfHcFW+TagnWLCoveWmzM8QDWAcDU+y7Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459884; c=relaxed/simple;
	bh=GesYYDL0RueRfZ/lYstvElMRwIUq1iDUssl+48qnt7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW+8Wk7JYlvScLYDSfo0XWG87/3YHKeKKVKG2zorHvjIStqLC7NFumSK6yQJzHaQhIFLocuFAgD9b0ZxKuWf793Zfi2NvE6/WBpV1xFecFDMzLRI7raKTstJO+7MMfJ0VFKVT5VJIObz/lwTFTCWDNZGquROE6AbNb7MhfZymlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/A2nphT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f174e316eso7029732e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459881; x=1717064681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=M/A2nphTN23OyaAeWYrIVzB+X4D1yAzAtE3o6ReRfZMqpBKpl/Vx059axdTTv0xtXL
         izwm8xbNIslKXCy7Ci2pu6fd90hHxRx9UNDxMMZXTU9O53OKe3Ev7qTdJQ0jGu3MFRJ7
         +wxKlSEeZyaZYIdYqyQGM9Hg7RW/P6xG+9dc482Df3bP/XChFL8jtBe1jC53vUfYP03K
         OqrUe1G73bt89Cc/IosJCwJX4qfB1TGMKGmKfdlMEayJeup8uiWgqhmYgpbadiX2WKEk
         eQlMwOafMO8mRzJJ1oyMVXqzn+mNPqOYNRUoQmH8aP3zFh2eX4SPYv+xjRJHXP1MJqYV
         lq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459881; x=1717064681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTs4KhPH145/AJRmP8+6lMsBop1Ixgucc2xC1shylpk=;
        b=rGLl3KNA0t30YmCFf09nPUunOQfddTaOaAe2f/9Xl4WVzAk7ZMVC33p+QNe9sXrKVp
         CV0rheO0GriMLuySOgjchfE4y5Z7eTNjeOY8LYHrUrdBo7PjMFYq1Dr9nZzZnINbseW+
         9hn4VGtbqHeRYy+NhCHajJV5ck5vc8EWX7q3+mvgpa/nckPAZ++cu97JyYuo/lD1XjDj
         /e6eu5gm3aKniXOJYdonnpWHv4Hu3nXHjUj2XCodyfEhMrgtSctJVvPJy6xKJHZFqZAM
         SCbpHgzGsh2LZd20GQ+072HN6gjUUNchXLl3jMVczn9zxtWO/BXBWK9gAsH6Lcj1R/XI
         AmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAMRAuCN1EwrhBVGc41iY188SYrSrBBeQcbBymycsWxMyzl1sEYoUERQKmESi19Ye8Hbz0qCuIiI0tW2/8BwTBK/HawW4RGf1b8MY=
X-Gm-Message-State: AOJu0YzYb1qdeqAHl2yIAZr+2vwBiKjw88HYtxVxHkO+9B372ndA0Z8P
	26S13f61sx+OwVojcg+px8Z7XxY5rXTWXj4e0yoDWkkf4WbX80WOdDF8iS3+hYA=
X-Google-Smtp-Source: AGHT+IFh8tvpeC+TwvjC1fPxZfM+UwuyED0DKgyl3oWL27XorJPrG1npFHJwvig7HdSlbfPLtqhR9Q==
X-Received: by 2002:a05:6512:3141:b0:521:9207:189d with SMTP id 2adb3069b0e04-526c121522amr2191728e87.65.1716459880614;
        Thu, 23 May 2024 03:24:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad526sm5387014e87.54.2024.05.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:24:39 -0700 (PDT)
Date: Thu, 23 May 2024 13:24:38 +0300
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
Subject: Re: [PATCH v14 19/28] drm/connector: hdmi: Add RGB Quantization
 Range to the connector state
Message-ID: <evhxta7gk6mogntoafibz7kxcgziikrhitrjg45t3p3lhify2k@uwwdo6i4bqbx>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-19-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:52PM +0200, Maxime Ripard wrote:
> HDMI controller drivers will need to figure out the RGB range they need
> to configure based on a mode and property values. Let's expose that in
> the HDMI connector state so drivers can just use that value.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                    |  1 +
>  include/drm/drm_connector.h                     |  6 +++++
>  3 files changed, 36 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

