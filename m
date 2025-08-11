Return-Path: <linux-media+bounces-39429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86328B209B5
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 15:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23495426556
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B87F2DCF6C;
	Mon, 11 Aug 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ojjnhV8s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5C2D8379
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917840; cv=none; b=HzH9+FaKnIct3VupysKDeVoDjxwlJqOfydHv3pvMPxmR3hEqaf/p1Mjef38l+aPI8f58ARt1KthO+2gyueZReGNjIjK99Ta/cW5DweedafVI82ijXaYYDx4ofd8V7vLlW/t8clt6mVdDyUADOZYDYBmKix6J5wYzv1F28PJyB/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917840; c=relaxed/simple;
	bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqOT7HU0VumjmdCQaM+EM6ACssesCkWsNTQS7GnDAk8drgTHw0iUCP/pQEIbi5Odpb1c3OocF2z/Bx8ZbVrxMg8etiXQayis6mSlcVg9BJX140yP2vnpqaOH+RTdX+Dm7/+fw8YBXVsIDQtASUfLWXtg4yf4fQw1yGCB4ZOhgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ojjnhV8s; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso3644413b3a.1
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 06:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754917837; x=1755522637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=ojjnhV8sG5RePBCOlfNn+HKKrpovehYP/8l1sr0vNYpFHhYyNj9xWMV43bJeaTo+kp
         pGJmmwo0JTwJGp+EMoH+TiRmSHHwCWtSKYf/ADQ+n41Fq7MLbvF4puoYKzMZIfAb5Yr5
         rfyUeS8+hBywvWWe45et8EVilsYHrox7Ct03tWZtWfpes3F5MB7MSmpvGYu3l/KMy0Lm
         Xz5nZcHYvM5pMpkmNGOifNAmrO7N485x8Dy3qu1/BQr+p2mpzG31DunBz5mKNnrnKK8W
         RdKVIPz8XNIoKoiGQOe1wq9OXTmtM2HvY5MHwnIuZgNfLGAMI4k+PY6m2DfBQiYd+C7+
         Xhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917837; x=1755522637;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdcvZYKwitUcECgcbI2UhLZ6metpTwEak9n/5y6m0SA=;
        b=SihHmuVpRVbD5aJ9sdAPTZ4h+tPm9knlEShV3S9E2DVLa9EkdjxBDzHgu/eWB5Thyh
         HA/e1KdppDLM8Z+t3wl977nZy03uVOCmb2pzJkKNqJEvc7bs3hFAdSuYriWmy3dgnb14
         RQ+Q1mGU+yWnXY65QsPLAxKCi2zBBdS64lMxVqTgqBoCsGZGDO96n6FvIrCIA59lj5HZ
         5XJW51VYHgVhjQwyKjg1m1rGDXPH+22FXu1wSHFzcjmhorGsS6z/da5KwLzMAAlrrJy3
         GvWjHF9aqbm6tIuFTgmhPlLJg03Ez8rZ0Oed0RUCG+eCG1mUmUetPnIR53mjlpZLEv/k
         +03g==
X-Forwarded-Encrypted: i=1; AJvYcCWzxVjDUnSduaBe/oU4VjXf14Pk0A4j284xw7ejrB85GCJaMBhLs8QJHYK9UbSvY3opR09RpIU1mmFwrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+dEtdYhi2L3DlzaPxRnjZtmgblwEbSBfRwAn8tTZ8FXOPLuP
	bEJxX3MtOzWRW4xUH0OXPBO+dbPVWOTRPagBZoWvyc2m9b3YJD/T4kSANK64M6kKrlHlspuyUvF
	qLNBCN/ZSw3NHzLYLdzUBbMQMyiAK5wMbMC4uOjsBDg==
X-Gm-Gg: ASbGncuhzhTJjEXQ3FCIR6Ijosrb2+rPRfP8Rt/Tx3uN1UDkJg1K1COWFMrsf4Mo/Io
	Al5e4enyFnpYoeG+Ubnr6GJ72BH6D2c0jzUMlOq6x1OQBzs7s/07SqZkDncZMyhw9lTo7UewI5U
	IeTqVXGIZ6x71UiathAtxgVYfDpZGBp8IkamaWyTAp5werYSPcbtFp4P9FuHBoH72z7C0oXNL5S
	jDyvdLqiU+vdGnPm2OrmyQhj3EC0U1z0fPQAi0=
X-Google-Smtp-Source: AGHT+IEgMvtsNpCEbzm+bQO3Dq6oVeggGu7qnt+f1HYUPfLnzNmxpfjIx2ohdBUK5XJ+fhQGIjFsq0lNMPvywZaOZwE=
X-Received: by 2002:a17:903:32cb:b0:240:96a:b812 with SMTP id
 d9443c01a7336-242c203d030mr203994295ad.24.1754917837398; Mon, 11 Aug 2025
 06:10:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 06:10:31 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org>
Date: Mon, 11 Aug 2025 06:10:31 -0700
X-Gm-Features: Ac12FXxi-t7kK_6HIDwsxWJsHZcp5BcOM26Y8X32Zi2av6pcVu6UuipKim4OtEQ
Message-ID: <CAMRc=MeyW8gtG_hsLWytCpufQRmg3s5QZenxCvP3MNGmaoo2cA@mail.gmail.com>
Subject: Re: [PATCH 00/21] gpiolib: fence off legacy interfaces
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	patches@opensource.cirrus.com, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-sound@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Aug 2025 17:17:44 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Commit 678bae2eaa81 ("gpiolib: make legacy interfaces optional") was
> merged for linux-6.17, so now it is possible to use the legacy interfaces
> conditionally and eventually have the support left out of the kernel
> whenever it is not needed.
>
> I created six patches to force-enable CONFIG_GPIOLIB_LEGACY on the
> few (mostly ancient) platforms that still require this, plus a set of
> patches to either add the corresponding Kconfig dependencies that make
> the device drivers conditional on that symbol, or change them to no
> longer require it.
>
> The final patch ends up turning the Kconfig symbol off by default,
> which of course depends on everything else getting merged first to avoid
> build errors.
>
> I would suggest that patches 1-20 can just get merged through the
> respective maintainer trees independently when they are deemed ready,
> and the final patch can wait another merge window.
>

Oh, not at all, I'm fine sending a second PR late into the merge window to
get that done in a single cycle.

Thanks for doing this, awesome work!

Bartosz

