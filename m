Return-Path: <linux-media+bounces-44272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB8BD3266
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 15:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9B5DF34C064
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264152ECEAB;
	Mon, 13 Oct 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymHa93Am"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40BF2E88BD
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361156; cv=none; b=WpVrZMqtlz/aVt3Hs8I1t83pBgAkt5tCRMj02VFxT7QTEl8BL1gTp+47Qeb70u0/4/hlBFaU/bIkNfh0p7Emk+N6D+3t4bXJyTRW0ZesjjnX/TuUb+DahJW0ehSdPsq37HRt41LfChGrqH2KdiLT2EEiVl0EVQOvRb+6wy8FSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361156; c=relaxed/simple;
	bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePtVE8XOJunh2TrJ5c6VVkAxWZhFFTlFqp6RCZSDlh80iy11YZsPmSTEvHL9eFgq9l1dooyGolwHtqFiTBNAIM7voVurOPLsTt49DfUshm2KmbXjM4dgd3muqNIesREa97RdfHIbyIsR0tyiVxP5RESydn7W+tg6ANiKJBRrXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymHa93Am; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37634d352dfso29026011fa.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361152; x=1760965952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=ymHa93AmOHyeoIONqnse0WzUIiaL5YmZCK/9aCdAoMvu94TZJBsUKdt0NIgfIFaFRi
         ZT2Lb5nA4r9lgLM4hea1nolQBO4mlbMqnELea+rszXep+RF5/G/lLhreR94Raxh9Osge
         6TCkbRieIDbrgA6J69IlwVFBGToALIZo5yx6CdpeSqqA46h1Nn86HUgJQIiWzVEuolUd
         K6FvR7OK6rnPlCGmQdvbhkA9ynaibN2eVTiNS98MNquhhH2lQV2fk7LiE9aY7o8hB1Sd
         MU3MsWtrgnPKCDkmYpGWSgbVNwZnNgjtCvV++qflS0q0pyGq5XLvv6FmMHN+5at7stfb
         6F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361152; x=1760965952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=PJdo+O4a51MGgmrXDvlZLpDW0saeA/GIeciWS1hJJkd0jI9rN9tXopOabLppAtuyIm
         m2CRI2tGHVna4CfupZTBWA9j80ZCr2kBmu2rwm6UkHY0nCLcd41lnbxxpKkRbpg2h5qd
         GirPo/3Xtn/jEyDI8a8gGtij/6Aeg7wCMq+OJ+nqTWh5gBKWDMchLZedK1F5g69NR6GA
         8JE+vdvzPXoXx9hmfYEjBHsj2Kf5Ixeh1Z5z7jnjwULY9Jgk5wIiY2N9bNQ8TLcNV6y1
         JNWyT0ChCxaGChQj8vRb0bFkKAFFrGqEL4kVtFoIQluvw7mqFuMNAg/cUZhbrHD3Gyim
         25yw==
X-Forwarded-Encrypted: i=1; AJvYcCX5oKt31YK8cqKb+zpn5ydzfYqXyEKUaRZTJenkLl2w/zAjiGd94sG5XX/9hb+vSM6de/eZrDa0XOZMRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/X0xhHcK1yi21eqckFsxtB7kOSeJqh1RnPRQq1aZdzRYzT9yi
	ZlKEDQLcZggGLR3hh+xI9Wh4AeEYIjaogMKZhsps+xQ7TlVt1u0os6WdgscezbsyHaN+gAAWO5Q
	8o0GPQN21Q5KpVeKAEwQNlfWuc1iU/ZoqEAiSGS7Srw==
X-Gm-Gg: ASbGncsgLcQ1uUoDDZc97Dls1Wu6bk2ZK2FFvKdNr9HZkw3X3AzILFwdp4nRtA+02ZW
	2z3xsQdBMRaWWQw7hpxr/JTe1HPTS8u2EqEYmDAz+xYiMCHIx+xOieHW5sqWHw1BbazSxeWEuqx
	LDJVgeU/kcn58hx0K7fslFtyrQF+Zm+70JzwnLY5QMxPQrGTtP5jO0AL0L5KM23crsOCRphl1GN
	1FDy6+tulH5wdIfwY9Fef0Q5NmGL6hMLKbKdLz3
X-Google-Smtp-Source: AGHT+IFy7QQZzDisxgLU7RQiHqmGLbp9GU/ko5TeFOP01cdLTHtzWG4syZZ8PgjrdKymxne7+Wg23WBWjWeGpiwOdDo=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19705401fa.5.1760361151675; Mon, 13 Oct 2025
 06:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:12:20 +0200
X-Gm-Features: AS18NWB0Tr61DfHtPSZqpJT6vjMUO75ud5f5_b3M4zNOdVsqYQjTLusmQxbBsw4
Message-ID: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch looks like it can be applied independently from the rest,
can I get a review from Thierry or someone else at nVidia so I
can just apply it?

Yours,
Linus Walleij

