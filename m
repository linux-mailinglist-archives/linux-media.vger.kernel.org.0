Return-Path: <linux-media+bounces-25154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F6A19558
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1DC218815AE
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 15:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A622144D5;
	Wed, 22 Jan 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JaYGVMFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0F212FA0
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560105; cv=none; b=dgSHQHwHYe/FT2TsivGQinEfBJYxFMEjjErrQoEasuaO2MZWXvdwYXeJc5mZCdzju0fO5MBS0Mx/uxcliB0BT5Jb9TpPp/5Saaoj9Sx+prygePjuDCP2MiFvhM7sGFTlHNPdzsTaRFn6MbsjLW7u7sH2NzOQY10yjMbt7c3Cy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560105; c=relaxed/simple;
	bh=eQCIbiUut0TfzwczAQ/N0WWUfux5+s7N56bK9CS3YDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPucy8wrvq1IYopStv+c3zMg3aeby1Uw/K6ptnyUShS58LpIQNwH8K8FjrkekOwQQMZCddFs5DlADxrgZfsZHlfj5tBsQoPRw0uML289ABSoWFxyb9u+4Is6O8qCjPpHqEYhk3exXNjMpHcKLagtmPRQZz8y+erua+/HdDmaywo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JaYGVMFl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so10194541a12.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737560102; x=1738164902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KETFZDAQGSQnbUovzFtFDRDwmiXXoDslrFU0Gb7YR+E=;
        b=JaYGVMFl3Raj2zlK4D/gQf8zaHAZpkyfGYBmiLtX/NowETOSwWHKkIUODPK7x//HpK
         VqJhtrXY1kW5xYtVIw9DoDdEchevfTVTdQRbtFjscATm6Buv92zF5uRK+7V9XXzL23Z6
         frbIC2cf1LqQxLeL7fBLNgEUKF86ZNnHrmJi0D07KJJUfsGTlfIg63Lt9lkglci9wNR1
         6bUTs355QZmMzlXUaxkboemvDxPvWF6KPHWOOmzw37MZLhse5c8gRioB3l1eXkZmqxiK
         N4A4CyN6IhWDbKJFo8ETVlWpPbM9LaYVvU3veYcLLZjb4BerrpMhVzv3wZSwF6jY+zhm
         8jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560102; x=1738164902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KETFZDAQGSQnbUovzFtFDRDwmiXXoDslrFU0Gb7YR+E=;
        b=TC1HsEax4tk8TVXgE+AIqVOtEpf8DRdPyD6mrpNXktzLbqDpGObr3ufVKpjMyg59p6
         SxuI/pKXCqCKpqp49i2bGUklrFi1M4e2QYXk9S3YavExIxBFxok+Vm6u/AVlkuG8Q05I
         2KpWTegdDYdSnmG2sloThGY+zPjqqP2IFh5C3Mi2U6wpkjMOGJim5k3LUey4KDcAmXGg
         BFU8lk+k02k1Blf/50thprxKz/Q2pAj0Hs3vCL8dL6v4cMTTGAr7dfL6iqj68H/J0iOU
         NKGRSz6TeQhP7R3XSDCYJhJOY7pHf5wn6SOnNGrGPAlS63tuc2t03OdVV3RpF3p0fH38
         NUXA==
X-Forwarded-Encrypted: i=1; AJvYcCVQC/TsT+3/102X11Galw8anldp0LObBFvMA2cR9u5xbCPPmo6fHVJjCzZBNQREKCu78Hv7hE9Au0Ycnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpqjnkoYmscp2eloR4FCPhtjtPObfdL/1RGLJ+786xqAOKmZC
	WqqtvnlF0VR3kqGsHYvaqZhGB5BrhCFL3ezxlUvbOSEF2YtfU0bs2+jVEzPkpxxN5+B7Op/ZsVM
	UgTkWX0VbFvXCxgyhjFUCNjuuv42SGLrIf4Rqmw==
X-Gm-Gg: ASbGnctx24Yu5S7B6Rnyr1glkbGNkwwtUoE3cHWjjgFrzVzUa7LMS0HdsCQ9+FHxlTg
	9+vKFDz4zM6Hgabkd+0husP+r1nb3FQiA5aFDbA3iswHbVKYOmI4=
X-Google-Smtp-Source: AGHT+IGwSGuRD/aYqinEdtmQdp5BYDDbTOHN78QHSVfvtiNxdim4SnzdsQEwNiTQuEpXwt9E6iAQqX3BOkNBBgLF7Ec=
X-Received: by 2002:a05:6402:1ed4:b0:5d0:c697:1f02 with SMTP id
 4fb4d7f45d1cf-5db7d30092amr46020089a12.17.1737560101630; Wed, 22 Jan 2025
 07:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com> <Z3_kLJ6Oy6m9D_wU@hovoldconsulting.com>
In-Reply-To: <Z3_kLJ6Oy6m9D_wU@hovoldconsulting.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 22 Jan 2025 16:34:51 +0100
X-Gm-Features: AbW1kvag4BbczVkSjBV2npFACGiC0vGJEK4WnN3ayf4-upXO4df24_T52EvWn98
Message-ID: <CAEvtbuvHUF6tEiFOUUtqLh5hHf_Us+yA6TwtcmokM26v+QBLgg@mail.gmail.com>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
To: Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Johan,

On Thu, 9 Jan 2025 at 15:58, Johan Hovold <johan@kernel.org> wrote:
>
> [ +CC: Bjorn ]
>
> On Thu, Dec 12, 2024 at 05:21:22PM +0530, Dikshita Agarwal wrote:
> > Introduce support for Qualcomm new video acceleration hardware i.e.
> > iris, used for video stream decoding.
>
> > Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> > be unstable!" is seen during bootup.  It doesn't impact any video
> > usecase and is currently under discussion.
>
> This could be an indication that some resources are not described
> correctly and could potentially require both binding and driver changes
> to address.
>
> This is also something which could cause trouble later (e.g. during
> suspend) even if you manage to get the clock running after boot.
>
> Generally, you should not be introducing any new warnings; they are
> there to let you know that something is wrong.
>
> Where is this issue being discussed?
>
> I think we at least need a public analysis and understanding of the
> problem before merging this.

Taniya Das proposed a patchset to reconfigure PLL in the clk-alpha-pll
which allows the videocc-sm8550 driver to configure it correctly.
https://lore.kernel.org/linux-arm-msm/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/T/

I tested the Iris driver with this patchset and I am no longer seeing
the Lucid PLL latch failed warning.

regards
Stefan Schmidt

