Return-Path: <linux-media+bounces-26096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F6A3326A
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 23:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5DA164B18
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 22:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A36B204590;
	Wed, 12 Feb 2025 22:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJ5tsehz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F07203706
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739399061; cv=none; b=HsCc/Q4Fjvys3P+6WX3UlAHju8thUMkR6/7DbyI9UhwcaDHJBqa21zIcrR9OWt630jvgRLwsQfqzc+ffmd15yp5e9ytFK50g0AybecEiwea7Oyn/y+tu7fM0xJ0ojOKwD1k4letcQr3hj+H00bpSGvEzTgNe6n8OwuPIyN2v/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739399061; c=relaxed/simple;
	bh=5y/tgsaLquT36eDgvZ3fW9Uidq26vHDDKgSZ/y9JSL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgKHjOgi04wZ/toK4BubSHCqZuoxPEJxcmr3s59FkNUB08jBKR7zXdRQ3vFeGV8vphmR20B3QeRD5iBYDG5wvePyQ6Gc1xPSBmf0c0YHzhj08uRsZsLV9gHLksoVUOC3GJqITBS8/F7hfiU3Jb73NBfGfnolzO1LvUOuQz+1Owo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJ5tsehz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3076262bfc6so2416011fa.3
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739399058; x=1740003858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu/vYpK5EdDCessSAfsc81pUNCu3XRPo/EhuZMObYC8=;
        b=kJ5tsehzFYWrNTpI3SApLy71AcU5tQnrtgv7A5a6gAR65Fmr1P3Zy6/MJEQLLNxcVr
         PuYwxtmoxeqGQsWQ01n5jOIb82IAOwATTzZ4raOCenQOUyRWR1KA+1IPuSZnuj/zKwEq
         7+e7nAc00awmy/uSmNZoXNHo06uzXJQkt5SsTRheH6U+UyNKTeyh8cj+SkadOwME2JAr
         HbSSMoLqo75eo8nUEQOY2NpQdlE+QAbQtA0qdnnVPhHQqJQT3Z+iK1pEzoFAOM/EkaD0
         2rJlE+iV12GrMtVmRLPTtZXhKBTtc5KLCGaY+CKsM9DkRio8g+oXzPpOkdszom4PFX9/
         sOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739399058; x=1740003858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu/vYpK5EdDCessSAfsc81pUNCu3XRPo/EhuZMObYC8=;
        b=ojoY2X4/GnQBzyZTXHTImNrFo1e5LFKNSCF+hhSEnkfpNh96ol1PcItDwor57tWYMs
         uxTzvIq9OkREmogkWdO0cPYUePacSdrmM1lOrvU2ChR7xyDFyjljRQu1+ZGN6I1ZHKAC
         7hp+GRkKhsGy9cCtfCrDseA0wdMB0QjQ8bYi7M2+WBI59EyDowfrAM5gQU0+hnTsyQsT
         5MmREoebrl8ZNJgJRgeczh4jCyrD90JTMDjhN0eO5F9yRTzfu/Sl2ONCsPi4lPDheYFv
         IkFJJJbTE6mH0H7oHWbxTML5sCR0D3OFCqO8iMjiawVwe2nUmjep2XYimzCIpBLKl77K
         Hzng==
X-Forwarded-Encrypted: i=1; AJvYcCUzMCx7qaXKqK9zpjFFI6U7/pMcR6aunEdOtFoZuu8LIfnJjDfu32MrlMIT+fKNjOcS7etfgwPxJgpWYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmwXvClybfhn2/Nf8BTDeUb5Tl+fPBXCXQAuG4GUpqStHXoIk
	Y5MCjYAy5odqO9jypX5e+L0V42oBpOoUTh1IxZHS+Dio4MuMyj93RUx/Cm6oK64=
X-Gm-Gg: ASbGnct+mifAo43RWIt+LwCqTF6FBYZMmyTSrx4eruSaTeZyELvEU47Bpe1mCvEuUqw
	vJUZS+iBp4q/qanRRmYB7M85d0GflYfRysi0OerNaXq6Sf/rszeKA3VziJ56ZhLvCbIi54rBsOQ
	OHuBHZ8WoDS9bPOuMOPsxtt7NkaEECuq8SDmCWNPRrCAVzBuV5h4rN2rzEL3C/2HxBFjth9BzBY
	+d3v/3qALhR0LXoVPfzMkJghX9VmumiXBLA2Vl9D64dvUUli+FnekFbj/pteyDmtcHtGcu2z09A
	hLlEDHmemi1uB/vdEUdGSOvFYgNyomR1o5bpL4SSr3hsSc7jBSgXRtv3lm8=
X-Google-Smtp-Source: AGHT+IEllG8xsPecNgr5L5f8FoBGVvz0RiYrsFEd203BKL9JYmw0NxRW3Sco6Y7CdnjBxXidfEeaWA==
X-Received: by 2002:a2e:bc83:0:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-3090dd56bd0mr4718971fa.22.1739399057615;
        Wed, 12 Feb 2025 14:24:17 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100c6415sm150411fa.6.2025.02.12.14.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:24:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Thu, 13 Feb 2025 00:24:13 +0200
Message-ID: <173939904858.578381.4749501592256297365.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 13 Jan 2025 11:53:43 +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
> on-die on the TDA9989 and TDA19989 chips.
> 
> Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
> drivers/gpu/drm/bridge/.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/i2c: tda998x: drop support for platform_data
      commit: b7c5169ab9ddc3432161412bc2de28111306fbb3
[2/3] media: cec: move driver for TDA9950 from drm/i2c
      commit: caa6f4a75e9f8eaebd814a9c2d1602e0926f473d
[3/3] drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
      commit: 325ba852d148434c5bcb06d513af1933a7f77b70

Best regards,
-- 
With best wishes
Dmitry


