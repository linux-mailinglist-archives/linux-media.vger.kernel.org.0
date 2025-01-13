Return-Path: <linux-media+bounces-24698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD31A0BA27
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 15:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 151543A8624
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DA822C9EF;
	Mon, 13 Jan 2025 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPO8LK3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8F923A0EC
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779358; cv=none; b=NDjE2JwTNtNkW1iDrKi/q/QMlE8vYZJO6IjcLDCOYEvwnquMVsw9XA++6jFHghr3TPdZBpRDcfiGmOmWxfnQBkrwDj8g8C8zSJiaN+UFScaWxoOAaDYU673tsGozkd5A7UAWSTwxC1p8YyM4YmN8iuvvkxhtywGCg8voAbuW/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779358; c=relaxed/simple;
	bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDfAzCL6LWB0TiNJDuZnyXYcP+xa1/wUE4eopxVnf6Thf7tfUhwghYajOnh7EJVMmxwmRkmU3WLjP45lbe/+gpJx9SdH5s26Th1/UhBkGNvxYk1PntYFE+5UYJZUyczoc0ylgWYyN7oMisi64HAa0SWR4ElSiI7xbhHR8XePHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPO8LK3Z; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a6bso19046091fa.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736779353; x=1737384153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=pPO8LK3ZHzhtuzWp7Qv6FslshKIVbUM9moWsnJxDXjErWmnt9WSQFmRanC8GmWavj2
         VWSa5I9ZVwtm4vnlKG4WwMGhGfKi3CzMScEtVkKmfOKeesesTBqZFAxtt1BeLKekdl4t
         sdJPeCGdFJG54YLJWLf5zKoCe9cKY0Zr3sjpenN5V6Df8/zklwLsDIi9euf3priKIIpe
         p5OmycaxzSZdxrf+N0k6b/ZuVxWIOaj+8tCAfx9tDzB/srwOxSuri2oPWS2Olu9b0oai
         2Aq7zlEGugacFCP/BEON1yX5ScuMAaPeduSXKL/J1140IHm2vRqiTPhN3x/zRCEQOdle
         fTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779353; x=1737384153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7W2mhWlK4BTLc7JxE1Pn3ZSLtHFOTiBo+aWyoKQ1jUU=;
        b=h3Lzy/BtlU4Gzbp6Elw+yEKwPDwaVfTREdhBNxNzqPOC3rG8c3vWV4F+/6s8uWZmec
         Vt4BIP57ySWgg9u/86MqEfynO5HzbVdfM8HjXXVapdUBtk6bu0WakeoRIz3C58C/b0X5
         lZZGt9h+YFsKstLvItJnhNNCjkxtBOVIkj9qql23Fj+UQBx0n8VxgdIfiLwowa3Q6IYZ
         F1l/Xt3QdX4SD8SsDQ/aviLqBh5qaEsj5ZULdGCqfLBV0uQLrJqrz4Y0IXnjTv4WrVce
         5q2T4gVGsSAK2Zii9tDnAJgf43lsKl9lDCAWMOTBtHg5nK254ssuJWbaElQbdpieE5XA
         RE9w==
X-Forwarded-Encrypted: i=1; AJvYcCWFAibFT9udQWqm/zn6QuIIYAGH5ZwVAwOfLlrd5svepC8QxrcaYSnuiJE9zvOJOw0+KnDaOZM1BwcuHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvgzjz1ciH7SSJFNYlNyTh8E3bKaBVlW5D27AandI3bSzuQNm8
	JvNAS4Gg6EfWG3ogPY/4q4Jobr6qDwNpB2TYp9/Nn2NZT6/g40NOU+cex+hhMaASb5uhuI9EaU+
	JR0MStOkC71zTkCtcMpfVKCYw1SsPsqjC+TR+cQ==
X-Gm-Gg: ASbGncvaCLoTKg6JPSSvV92r569l5h3HWXA+bzOVvZIJle0ghnDRm/ZbLMsnWFUwgkj
	T51FlOGQnPJw9pS7S+6tLkWTeL7mBOsWFtW08
X-Google-Smtp-Source: AGHT+IENOE2ll5qeBQdJ80yylesb06tRQDSUG+UU61Vm3q3uDxQQ0+DlCXsReKBTut8XEJ7ObVreQKDUPla+i1+OZQk=
X-Received: by 2002:a2e:bea4:0:b0:302:4135:7d99 with SMTP id
 38308e7fff4ca-305f455e7b4mr69133281fa.4.1736779353384; Mon, 13 Jan 2025
 06:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-fpc202-v5-0-a439ab999d5a@bootlin.com> <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
In-Reply-To: <20250108-fpc202-v5-9-a439ab999d5a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:42:22 +0100
X-Gm-Features: AbW1kvaddZgkHI_ZE8MDKIDy3uHycNLLq64wY8GBa-n8x8phy3UrJ9DEp0n2mjk
Message-ID: <CACRpkdYgJ_rbrTWh0HS-F8DJJ6u48uqr-zQ555o3Q4mYnFhjXg@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] misc: add FPC202 dual port controller driver
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 5:14=E2=80=AFPM Romain Gantois
<romain.gantois@bootlin.com> wrote:

> The TI FPC202 dual port controller serves as a low-speed signal aggregato=
r
> for common port types such as SFP, QSFP, Mini-SAS HD, and others.
>
> It aggregates GPIO and I2C signals across two downstream ports, acting as
> both a GPIO controller and an I2C address translator for up to two logica=
l
> devices per port.
>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

From a GPIO point of view this looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

