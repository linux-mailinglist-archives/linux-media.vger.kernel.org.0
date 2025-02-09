Return-Path: <linux-media+bounces-25844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CBBA2DA96
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 04:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFA8B165C5E
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 03:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27D5175BF;
	Sun,  9 Feb 2025 03:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1rwP4aI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB94CA6F
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071906; cv=none; b=RStsnKi69zbxcVBJN+5z2YS7F+0bneTfppB0keJMfk5m/e093Tr1nXjqMemkfzCx5wt/GjGDhmN1dGD09R7x4DfkMSsPGTTLddcLavgE9RjchnXdmOSCCU4eH50TdHnb7ZNIqVpCPZnL/85/5ylD+aeZ3a/CSf5V5FaVyflIMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071906; c=relaxed/simple;
	bh=Hae1ExZWDnlPr0rzzdPuklPQlkbJMftjetjwMM1H+Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afP7j3vVUThTYhg8IYVvtB5tNkUnxo3SiTLQlErt7MNggEw3mqoNJD+73vyOYhUR66PioMkapIXYTT9B8SPcQHc1O7Y3PGYfkDIXXcY+IxnB1t6I0GkrnwiU9TTgS6hwtYDvKLp17Z3eHOsHNOA8lJg2OJSMWvKkc9b3ebUnxLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1rwP4aI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30738a717ffso29896561fa.0
        for <linux-media@vger.kernel.org>; Sat, 08 Feb 2025 19:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071902; x=1739676702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
        b=P1rwP4aIWBYxHBHChbTbhoJpIXQhhJvIqu63xSXt++PoLhSOgX3f1sX5tNh+6kWH5/
         +/8EIx/dPICJvu96CN3ARHuMcHjjtWj+gbqzdGfffD7j3Ei+UUOvx1DNjogyJw8h3Zvu
         m9r4lmZL2Y4xqCDFvQQRrCvQhheIzEb/ajZNNxYbEnSKhAm1rhZoTs846VaWqA9ea41F
         BokjCzO8ZTuLIWp8G0rbH0HGJhPubXJh5YjVgFRevzQepUaguZ8yiaWZaUDPbhM8gRcE
         698tkHfMPHhavEb5wwPia2UQnlzjnqnkRohhX73XmafSUBuFISs/guFnvx3YCMJELlsb
         Hsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071902; x=1739676702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
        b=uuPgOhesN5wlZuTLf5fQBstwqN+AoZTF2JX4HyM44Y2JHeWCnr9aFowmZDGAyGodhb
         YkXoNOgaAq260Nztu4hVaYrZ01+ILP0QjqM53BgWWf503/v60hSXVvlsJSDATay+nyW1
         E+mBlCAEK6Q08GDrVrDZfLhsQkK0W9hQCoG5zfC3OWJUDKVTcfuQ/pK8zLzQr2OtuPoU
         7098qgckZEuqNb289SrCO7mBQpr5lWIQsaiP1JYbZx3Fv8VPOooskzmGPflhdPsNiGAl
         aZNwqjIb8u99GWwyfOXwWiPj6ZcPvtdeg5lcBZGc2GdoUcpIFxN+Gm+OQcfo+50gXorY
         zFPw==
X-Forwarded-Encrypted: i=1; AJvYcCVTrtHjuVBgsAmhWooxJ8S5e0atrQ17O8DOQbeL5AqBhUfb0gpnJqMdMCQKxGIKm1Rq6EhwUgwR9uuVyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3xgjWr8lx8XsglCkSafLgwP7oXCdsUhhcOrystFpujnaEqm+
	xec2pKzqd+SGx5LeZBb/5en10vnL5RcMrVBVxzCgQt1xgUNCegiX0/vrgtbsCXw=
X-Gm-Gg: ASbGnct5vzJochynvKFbcTDkZ9CF3cndJskN/KcpWAroN3eyY/ebA4+ZGKos6VFXCEM
	JfZWYMSooKDNeCLdXYNzPI9YmScRU+luQEcVnIkyE4dYO5CwPUfQEz94H6PMWMNba4rrgA0nOnc
	CvNU39EhOEWUURVMoJGt/1QDoYlNdbw0zEkekHbXkbvy7HeNKLW4RSzT0i4h4/ictuy4plEPhkY
	mao4RAO990pK69xOwHrJcvbo1Kke+WoUaGN5klhCUdh+SMKuMrSHmkSCm6yUlH7tlBg3OqsPqO3
	Q9MG4JFsBsKf6RaZpPHQouvRt9IudEJ4e9wTdlz+hQ7qPAebJ9o2y9lYRXNbPpkBM2qaYEM=
X-Google-Smtp-Source: AGHT+IFiG9OlyfSDN9Gbzge8HDkG084NNv3XQuhDjBxeTaCVWE6puHcqHZdRNWTexmpMoVSUwZacRg==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id 38308e7fff4ca-308860edd40mr21033071fa.22.1739071902274;
        Sat, 08 Feb 2025 19:31:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ec25911csm21241fa.57.2025.02.08.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:31:41 -0800 (PST)
Date: Sun, 9 Feb 2025 05:31:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/3] drm/i2c: tda998x: move under
 drivers/gpu/drm/bridge
Message-ID: <qd7stwkjqqwrozddbllgz7brme5udfnncaltpacmxgemvj34vd@fdqtyokt7ktv>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>

On Mon, Jan 13, 2025 at 11:53:43AM +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
> on-die on the TDA9989 and TDA19989 chips.
> 
> Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
> drivers/gpu/drm/bridge/.
> 
> Note: In a comment for v2 Hans has acked merging these patches through
> drm-misc(-next) with no additional immutable branch.
> 
> Note to RMK: I didn't change that, but I'd like to propose to use
> drm-misc tree for this bridge.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Dropped irrelevant sentence from the tda9998 commit message (Hans)
> - Link to v2: https://lore.kernel.org/r/20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org
> 
> Changes in v2:
> - Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
> - Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
>   (Laurent)
> - Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org
> 
> ---
> Dmitry Baryshkov (3):
>       drm/i2c: tda998x: drop support for platform_data
>       media: cec: move driver for TDA9950 from drm/i2c
>       drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge

Dear drm-misc maintainers, is it okay to apply the patchset?

Hans previously (in response to v2 cover letter) acked mergine of the
CEC patch without additional immutable branch.

-- 
With best wishes
Dmitry

