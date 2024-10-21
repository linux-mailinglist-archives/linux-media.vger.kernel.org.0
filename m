Return-Path: <linux-media+bounces-19991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52F9A67BD
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 14:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 065491F21E71
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5F41F429E;
	Mon, 21 Oct 2024 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvHHPvks"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C061E571E
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512940; cv=none; b=RRwgHyCcl11aHKKSlbitwDJ0Or+qT3yW2pAGLdG/i5LU+Yn3cVEHsI53gb1z5nmfGFInQWXbzdDy+7inWZNr+HXs7y6opYKSM78WTv3tc0IsSY+x869qY4b0qXKN0pTP9yQ06j8z5W1o4tsqcxaT2k9Umhtugz/MVDsA3/tH5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512940; c=relaxed/simple;
	bh=ubniCwvujlyUXuESJ+QlEf9nz56jGqzEaECw2Ab5mVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDMsMyG2s01bAbu/ymdELxYgpm74uB8VWOyC1286k1hRimK0JRsv9KFvLkm5bMwPiNu6D1kk7gEeTOFFZFq6Bi4UvRPQDT8U9VE0Vd4K9WE7xJYsipK36SuIQduf2AnOC5z7gRtEYGBj022Q7OlrZUxzTgyEzqngDa4oOYa5KpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvHHPvks; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so60362351fa.0
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729512935; x=1730117735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
        b=rvHHPvkses1XqI9p3HHt+k8MomBAw29aI7JFnxRYtF3CcPzOf82nPnwY8v6ikZLZ20
         vh9xG2kNM0YDJC/6pgW00qjYxc0oVGQihSwljavjDX2YxNV3yeBlKHKpVTBtCxQrT0Vr
         K1PqW73E7ryxMH6KgMSGuNgCAldxjCZjnP9GzDL8pV1Cn0M0Tdkszu8n8o8PK8t/2QbY
         4X3RspUfVdMsqS16GQ/LM4f/Sk+nFEejVi1DQtHLixbvCj4TJfctWpICTcebFEHYWHO9
         XF1ABahq3A/0nlvMl3YhfUv7d9QL8ejPilJgZjmxkAw3KWTu3EcQjrdjSC/NCWiu87Vf
         2F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512935; x=1730117735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixvYPjSjHOI3A6bs62BEm+orBMViEbYtWgKUxWp9vmA=;
        b=Axxe1CXcW2JX2XtEaC5pTNcfjc2lHWWnzsvzVYSrLMQGMrCLH2yE5EYnp8sI8Sh6De
         EU0K+XV0yOPnxPY1E9D/xefCnZH6RruyxGjJ7wqbFZ/JNAF/ZfC5ltlJUr8IJrVrszv0
         jo6U0+wpeAl4y7Zi18OSCTz6mXHopcc79uUWFXX2Grupt+nggEIEAD7SKIyse6KajYDS
         Qa/Q1QUlhn0NJkqRUo/fnm4eiGfDAi0ZwfjJD8k+KQuYK1U4krwwB92UlJ0HbLgTyxs5
         fNLR2JRg9C0s/SwtKONt9scJCarAjLQTDLwPZ2McL1RCK8d12FKc1AK27J7bqqE0dkcc
         ENqw==
X-Forwarded-Encrypted: i=1; AJvYcCU9FAzDrZ1EYRX8yK+rWyNIQy2+Ky+f9mtqxDECjguksC6nb0TrgeQkFkHqJg4wesjelX92y41JLkpVuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW69MgdqTWPfYlzOc244WUNmOq5xRsXdCw/OZsIpuaCNfZBu12
	G285DwX5bwITMbqWSwZewsp8a6caQlJRWxrC8JznBEVY5SZmln1AeJB3XTukJ1M=
X-Google-Smtp-Source: AGHT+IEkcKoatMCDEuy5jqS04CW2sFmKYlfJWSMdE2NyRaxseViNDhyaFOJIPHQ/mBlzZ4JfzX+iAA==
X-Received: by 2002:a05:651c:2124:b0:2fa:d7ea:a219 with SMTP id 38308e7fff4ca-2fb8320f101mr78774851fa.37.1729512934612;
        Mon, 21 Oct 2024 05:15:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad60d95sm4785161fa.33.2024.10.21.05.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:15:33 -0700 (PDT)
Date: Mon, 21 Oct 2024 15:15:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 06/15] drm: of: Add
 drm_of_lvds_get_dual_link_pixel_order_sink()
Message-ID: <zaraulehid255ij3hs7hazd463ye4l5ju6sguoos243kda6552@lztoq22vzqyk>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-7-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:37PM +0800, Liu Ying wrote:
> drm_of_lvds_get_dual_link_pixel_order() gets LVDS dual-link source pixel
> order.  Similar to it, add it's counterpart function
> drm_of_lvds_get_dual_link_pixel_order_sink() to get LVDS dual-link sink
> pixel order.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  drivers/gpu/drm/drm_of.c | 76 ++++++++++++++++++++++++++++++++++------
>  include/drm/drm_of.h     |  9 +++++
>  2 files changed, 74 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

