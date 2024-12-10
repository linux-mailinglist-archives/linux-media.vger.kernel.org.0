Return-Path: <linux-media+bounces-23019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12669EAD50
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AAA2896B9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BF423DEA9;
	Tue, 10 Dec 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/E/OdtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68378F2B
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733824601; cv=none; b=Rw9RTDYOfauliZTx8xEQRouBqCoXbYn3RkHIGH5ILXH3JLjHyG1Y35zSua9OXJi6Nxf9ZbUzysVwcKtzo2rs/gSZ4QZ1eR2Qnr5hmuFouuoJSp8S3/R/dUwKodUv2XF83YSuSL/Ty6c1RlnihWv65Wl6YvvJT7THLJC2ODtvWsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733824601; c=relaxed/simple;
	bh=C6dLWR01cRv8FPjeu3uMmdCJ92SNjbws/Q2KoohADSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFCyfGPUSi0FCqhEMMLXHjbNKIeL99ROafABLn+3v5KH1R/Sykhr1F/yyonfI9QNdtBAzAlG6h718RB+iMNLsW5T71Eq9qthWJ2eoIWMbs6KE9rZ8bQu0gWEoAhDTsHK+ijugJVHVX/PYJgNYnz2bI0V7fICbQ/9J3wLL+QZLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/E/OdtD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa692211331so291016366b.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733824598; x=1734429398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eB4R97+dFiQJvfWzO4gzWibCc3j87hwW/JO+idp2Qys=;
        b=n/E/OdtDLL9hzTqffXDMLovfS8g4iJNRICqaVcxMo/VIFPvbIaC6ADZsKkHIFPFP6d
         H6mM7Ag+qWPDsro0iJ3XbcmVt3tbxBhLrXwiesncFmdcZMVHsQwRPpDb4ppLAfwGJlYy
         aO3B0kNRBaUglM/gubvcbNt/mMlOWyXrX79CtTPNcLnZnBHjWbbRTfu9voac5/88SjRo
         4VmT7dL6NGwMNSBw+VZDg2SqzF7NEzdYjagKqzWta8pHe5TFcsZG19fZoHgQwUrK7QDP
         tMxcKqMo5haDmth5WgMqs5uqrw3/lQgdbrJzVUtzOdnPyuBaVFGTIjbibVtfxDwZugLy
         DQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733824598; x=1734429398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB4R97+dFiQJvfWzO4gzWibCc3j87hwW/JO+idp2Qys=;
        b=rAzUdHE05okikV5ncJR0LFjhuIhTsEd+qXWRudHR/6Lc77p7NZmVy25zDG+mh+0Znv
         lEcH7zGvlzpmp6ntC38Ci4/YPrc2iwcuhOGLIwUb0QQ70k7+4gtP3ZHFw82WQYXYEDMz
         D27hRCefgTboj1Za9y7VQ/Qo3n5prdQblOtbQZu9Wb+03XzEmIsu+SB3ldFxIMPE2/+z
         xGY3pwtdF2Q2i/rM1jclluuQEnMHcf5pxpRCIaIKlHX+nJnQNwTk1i+ulQvl3O7nCKlC
         9ihqHfTijY6VFiYak3k0yU8HBHDjNl8MJrK7rAps6acobaUSBY4uruRYU1wz6houl9M+
         ttXg==
X-Forwarded-Encrypted: i=1; AJvYcCXlCvL/u1P/sKMbMQfxv+dRBPonYKpERbTwAVPDhiDc10IdEa7qBYkNqWp3G7HCAPTxZ945p5sNsMhndA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSbv5JF2ISTUzc17BPFFS8XL6bU5Fe+zxohEZbbXp4jd9QkEe
	jH69wijuhYCAxmRH06JhfB/EUWhBzGDz3Y/6mC6UTSvMkFMeGhUtaR+W+1DXf0rWK7xs/5aTtYz
	DK4OYnbbo5JQApcyU0kYsKXD+JVY0COlcS9NeRA==
X-Gm-Gg: ASbGnctDlS2YcVMcYIVmiYYAEgSTHGb5Sa0PoGWtbaC3Np0HC1oOAk2cSIHctgRPVk5
	Y5/8L35qA2phvzsq82hma4rXz8Olwb0o85AU=
X-Google-Smtp-Source: AGHT+IF2Cs6izMr0EPP8N4VEwRkQaw+ITA2b5QjAYykMlPPNbijyGbmHJi1bx5RG8uxupuDZsjfmD96K8rOQcz6jL7Y=
X-Received: by 2002:a17:907:3d93:b0:aa6:9dcf:e273 with SMTP id
 a640c23a62f3a-aa6a00715b0mr264787866b.12.1733824597988; Tue, 10 Dec 2024
 01:56:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-qcom-video-iris-v7-0-05c6bdead47b@quicinc.com> <20241209-qcom-video-iris-v7-9-05c6bdead47b@quicinc.com>
In-Reply-To: <20241209-qcom-video-iris-v7-9-05c6bdead47b@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 10:56:27 +0100
Message-ID: <CAEvtbut6e=08fP68fjUjb29YvV7ieJ7jXdVdCG+XA80fVnAd_Q@mail.gmail.com>
Subject: Re: [PATCH v7 09/28] media: iris: implement reqbuf ioctl with vb2_queue_setup
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

> +#define HFI_SESSION_ERROR_BEGIN                        0x04000000
> +#define HFI_ERROR_UNKNOWN_SESSION              0x04000001
> +#define HFI_ERROR_MAX_SESSIONS                 0x04000002
> +#define HFI_ERROR_FATAL                                0x04000003
> +#define HFI_ERROR_INVALID_STATE                        0x04000004
> +#define HFI_ERROR_INSUFFICIENT_RESOURCES       0x04000005
> +#define HFI_ERROR_BUFFER_NOT_SET               0x04000006
> +#define HFI_SESSION_ERROR_END                  0x04FFFFFF

I am running this set on x1e. During tests with fluster I often see
error code 0x04000008

[  103.787979] qcom-iris aa00000.video-codec: session error received
0x4000008: unknown

Seems worthwhile to add this one, and maybe other missing error codes
as well, here and to iris_hfi_gen2_handle_session_error() below.

regards
Stefan Schmidt

