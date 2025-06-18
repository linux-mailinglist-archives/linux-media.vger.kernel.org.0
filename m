Return-Path: <linux-media+bounces-35171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7FAADEC52
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7CEC16E5A4
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 12:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30D22E06C8;
	Wed, 18 Jun 2025 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udknWNOl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583D2820C5
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249618; cv=none; b=FAbnLpjfbN+1o5Qv3ElMBy9b2V8qsequB4GJhIz/XBdruYOcWblaEgCGjyEdf7blYmZX9B6kUKWBz97kzP/jl1kk2muBwEhO4M3dwEavorJIHHTccuoZ0+TGYk7mZWa4cuYAIP7JA/QV7HSqh5NEmeR9WeVzGCVmy3QlTvdTqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249618; c=relaxed/simple;
	bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFZT5ll6Vd4Vg/uA1y6KZI9ANzCAIovFtxjigU5LAxlrLAefL6JrNZHueMup3AL6nbj/Vi6zzVdo5seGkDQme+yb+3eHUav4uDAJkilUAAo42SlERDvUXYn/LTk+X/+nJUGZaHF5kwU9yDdJbtOJ24CIK0q+FpGoDB6EdMTd33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udknWNOl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32aabfd3813so60389721fa.3
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249614; x=1750854414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=udknWNOlq1p+HLe0dsmC4jceUTWZ6MbqLrM2DE+ll+5PtE55I+GjyiNrnmzOkplk6x
         dyHCCUSAq25RV6+dgbHFV5VlsIRFAyHnyfQvfJntB5MCjIewhBy3J9Zuj/SrC+csCSzf
         KK9PIvHrROUJBkRghh7JsFKj6434/Hw6KkQI7ZTzyTtIgul5uTsnlw0WoKWbyRtCijA4
         Ub0sYjgunMwypytL52brArI0HGCNrhijVoN+QU+qgYM5l8xrFHOX46i7H+3I/YAgx0Qe
         pIMQ4446kjKFRDnILNXosSSJBStRIl4LOBcWO8vzuCof4ORQr6IQjH8qVpYxwfmsSeDT
         mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249614; x=1750854414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeMY6ZvITBPQwHI52jDYCf35TLcxWMfuS+SdIkf7zyY=;
        b=kNo4QIG5c11uRPSeKxPyAPMLAPAiqS4HiDJG2dMY9Oox983cF7m5RkRnO1OgjnK58X
         EycyWLcE8JSGq7768AUqya8Df61sjsLvKGz5zCgk6gwXZeRdoxJjd+T6YL3TeGmM8ees
         fjrIxmIGhnp0z1mWJ1hLAvfB1ch9nqD+7qN1Vas7tlO1oJqrkhWF/vgy/YhOwISKkccZ
         OLyTZfLgROGZodIdoV0EQsE2DQZYKyAj1QhzPA58QJMJupI1ZME4Xn068B21zr+eJXH9
         VvZxlVt7VGbaTN2g2GttrAovGdwwhfNbk7crhVKScdKbvrebFBPB2PTa0gRck1o2LMHF
         IpzA==
X-Forwarded-Encrypted: i=1; AJvYcCUNKd+68E53DGYVaSt7VrdNS2sgC+p+Ftk9WbsgxZhPubjfQs2bI73+MGSZcWfiNIHczIuVaw9F4NH5Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVJNJQf0q/lileIiQF5KBH+f03ezf8p481yCD1RG6B6pAWHhF
	Og8LRr8Ys/ivX73LpHHf/4ZQ9mGQgtVNnOKQlnM9bG73KgFjCvKDZL2Ogs5v4EkqI8ET9r1OVds
	qUT9a7iAuBtvONAHWh130EH0Ro6ALP3UMxTaNPfVCXA==
X-Gm-Gg: ASbGncsuOwke1Ej/dAJvWyp6XCLk7aZQiHTXOOiBQDW8vjoG+zkHacfhEvXWUfXrnom
	lvgPf3HgOLBZOGCTaRWRnEnphMIccIWnOUV+pI54K7bsulpBjh+CefAJfYdGr9hNOdSu6La2Cx+
	qImE1/s2BLIOLbyRFADFzHXCKurCST9g319rt4rwlYqpw=
X-Google-Smtp-Source: AGHT+IGmpRGkPvcBAzQa2VYDunxKmHXXLzf37cM2KPcBdZgVLj8USxefk+Q+eVf5G/Wn/kDbl2XwzYwXpcHTfZnY1T0=
X-Received: by 2002:a05:651c:1101:b0:32b:82bf:cc55 with SMTP id
 38308e7fff4ca-32b82bfdff4mr2950681fa.31.1750249614434; Wed, 18 Jun 2025
 05:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:26:42 +0200
X-Gm-Features: AX0GCFslsN-cSw-dqPdU5r6A6ilGsRmidmHeaF2HfeRbo7EfHKHVSPh6Y3Xsvmo
Message-ID: <CACRpkdb0y9cBpxjefWpqj=S=0eXKZ_SeeKGKL5ePLNHkk_Wj8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
	Ismael Luceno <ismael@iodev.co.uk>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 9:18=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/media/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

