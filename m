Return-Path: <linux-media+bounces-11777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6058CCECD
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A511D1F21A4E
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B9613D27A;
	Thu, 23 May 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBIkKc/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2474113CF93
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455557; cv=none; b=VpufV3NuGQ1S2+EU1LeeEVCk55rCp3Q0vlx2fJejENkTYUCwQ96K9bXdi+/A5XBLj6G8RZZGOK69dvjPsG5x+YrtmwIS/ZTCEzPcvmPNd9u9HOLRyWXTHU7tyX2GWgBJOmU3CRZEuRkQfk0PHHekgGu7KvLjXI+OvMAPPIGnuHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455557; c=relaxed/simple;
	bh=ua1ab30hbc2oLjmJi5p/l09P2vR0shXcHuLe8ZoBnaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1xB2L9//H2NR15rKZsp7JEJdiMmqevV/rRXW+mGvBQLkMan5qiNPJOMXEk8d11nV8RoTpk0H2ULYWnI9GC6q8nHRDuw73XTv/spIdIoi7NkXDfwI6OTl3sk8zbTu2UUnbOTPAFIRE352vm6+kooM6ufZCvdcURqJajplEgZUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBIkKc/u; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so48835491fa.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455554; x=1717060354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=CBIkKc/ueLGFzqk8JzZPjPm9nqrQpj/XZd8m5V2ab+7MdlauhtamJYKM45AI81/yeP
         nugIPoG7gYqisjezrxg5dQwTW8BuwLLWy5cXnPICUB3w/SMYAxsLJ7iB08US8kWFobWI
         2EODEUTkOhikG8312W+dxZsqgOh05/7hZwhdxz0fc9i/qg/FLu3DxMiEdD2z57JZ/p2o
         ZgPM0KsTzYaICHKCuVHj538clESqcavf0GXPjcR/fmP2J18k5xD+Jz4HItSr2zCSHCgg
         y+c3Jqk6Pu3qOZs57sKDzMqobW9pbA4VK6sEnle3wbaPAURJ6lI6gm0BrD9DvlESR0ve
         H2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455554; x=1717060354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeQACHVYvjXLcJmL0mtvqm0YtmyCm9cGr2iJkKX/fdc=;
        b=keepvGUb6CEvG64SVNm3vGiueGR8AkM2NrozMQJ87SzwkkxCIW2v5pc2YFcPD9BoBx
         U6uc0dJoFIwdwBGs49bG8ORh2OG6Sk35AqPFTmsgO/AgVraMoXnU8TqgDVmC9r0Za9pQ
         1uf99pyu5rj2OBruQg9l+sIqcEg2dt09oRd3rfAroHWH4w/Oej4b5kXUTemuVpEiyVXR
         66QPcBa9nv3sJMmena67RHHdfG7E7EmdfW7vU/sxyXr/79+rSrgUZaOPnONN5t8oIqy9
         /dK+67YVfJdf6BqkV/NucJKalkrvRXj6SLT7XLVUI4hfVVSQLAIQtr3luSwuoMO6YYdr
         izKA==
X-Forwarded-Encrypted: i=1; AJvYcCURznkTwB0VEdCaQvJgTwkqhJy63Btemg+jUVrUGO++479wGgtwUeCr23NBviXKMXw8yxQMHVwaXL4Ovai2YqcN44yjPzioKqdBlFE=
X-Gm-Message-State: AOJu0YyrYXxRWpFy3IjCcnynyDPqYDckjVJhI9ozY8IPYnum0aCnOthX
	e22QCAjRrRCqB9EA5kzfDv5CIchPRneMQDn+hWj7bqs5NjjIFJHU9DZEClZdyuA=
X-Google-Smtp-Source: AGHT+IFRp9kSkZyOBZ37uKA0zC3RicLR9A71BI+sImuk8bVozEkI6NVn6ruWTcgBILxGVWLUmvKCJg==
X-Received: by 2002:a2e:8797:0:b0:2da:9ed:9b43 with SMTP id 38308e7fff4ca-2e9494bdbcbmr26440181fa.31.1716455554344;
        Thu, 23 May 2024 02:12:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d15158c4sm41368191fa.73.2024.05.23.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:12:33 -0700 (PDT)
Date: Thu, 23 May 2024 12:12:32 +0300
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
Subject: Re: [PATCH v14 07/28] drm/connector: hdmi: Add support for output
 format
Message-ID: <dxqf6n2gaksc66rksmdcaky22nz226veex5q6mw4c6npsuobut@m3vuxyai3evm>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-7-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:40PM +0200, Maxime Ripard wrote:
> Just like BPC, we'll add support for automatic selection of the output
> format for HDMI connectors.
> 
> Let's add the needed defaults and fields for now.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  3 ++-
>  drivers/gpu/drm/drm_atomic.c                       |  2 ++
>  drivers/gpu/drm/drm_connector.c                    | 31 ++++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c         |  9 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 22 +++++++++++----
>  include/drm/drm_connector.h                        | 20 ++++++++++++++
>  6 files changed, 81 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

