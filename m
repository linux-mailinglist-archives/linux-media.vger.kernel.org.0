Return-Path: <linux-media+bounces-31814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6EAABB50
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 09:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53F241C24FCA
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B21C22126B;
	Tue,  6 May 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HWkyACfU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF72BB04;
	Tue,  6 May 2025 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516238; cv=none; b=IdJcjR3knks2cP+P6XPChQjkWP2uCUdS7hzrTP07vVrU9beit6QmXRv5BehiCGjJ16qTWG8BlcVJidZLxUUIrR19F+BKFVU1Na66roPPtQAXqeM/vKlHkpf3je3qDubSb7Kklf8T0MQl90CjWIuJuHKxM7VEFM2bb5wyWdvKX5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516238; c=relaxed/simple;
	bh=oJRnZNf+3+zFWdbYSyxaJKItP4Dj36JV5wy9Hnu5Lok=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ld+n+BTOHnjaEn7dIJQ+lL6i97HTlk9cxhKfV42F7ETe2EZKzlMxuXfghINVnRh03UJa4ez2RXazHuy0TCRXYM7dCTYFun2kQPPAxlDAFGKu+jl6/PkBOkuMmGsaflwfx+V6nKd8IgjG9NlRHHRjHZd8Ju0UIsao+Tl+H0zl8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HWkyACfU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746516228;
	bh=oJRnZNf+3+zFWdbYSyxaJKItP4Dj36JV5wy9Hnu5Lok=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HWkyACfUF8s9gZwEJOWR7PGG3/h+kng2j2jHkVLEWLhMsDEgcfMw1D9mlGB4cu9e6
	 goHFFEsok38CLqn78AxBr0HycpiaiUIX7cF1rS0s1PF8OEfzAqMTutypiSD5GWIZmD
	 90AHRiACgCen6JH1BdiJTv18jclxhKIFBRHg1n2xBWvEF3/t8dAompfgh6JVLpdQaJ
	 O8NKUFBQAJBIr6K4nvP2MD/kyR+/HFdnsX3OO8Iu/S8HE+6GGkXyr6Z/q7J0q+CDtZ
	 KDqbVEX0vgjxQPDxTyWWzrZcnZ0vo5yA+5hAGBBHhe9W0W0TN+dinN+7xOPCCMsgC0
	 GFvBLas5rPMqA==
Received: from apertis-1.home (2a01cb0892f2D600c8F85Cf092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69E3917E0B46;
	Tue,  6 May 2025 09:23:48 +0200 (CEST)
Message-ID: <ebde0bfaa1f42a78dbd3e66eb92fc74bcfe7f7cc.camel@collabora.com>
Subject: Re: [PATCH v1 1/1] media: i2c: max96717: Drop unused field
 assignment
From: Julien Massot <julien.massot@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans Verkuil
	 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 06 May 2025 09:23:47 +0200
In-Reply-To: <20250331070152.3985520-1-andriy.shevchenko@linux.intel.com>
References: <20250331070152.3985520-1-andriy.shevchenko@linux.intel.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Sorry for the delay.

On Mon, 2025-03-31 at 10:01 +0300, Andy Shevchenko wrote:
> The driver is not using gpio_chip::of_xlate() callback and hence
> the of_gpio_n_cells assignment is unused. Drop it.
>=20
> With that done, remove unneeded OF dependency and extend compile
> test coverage.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0drivers/media/i2c/Kconfig=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/media/i2c/max96717.c | 1 -
> =C2=A02 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e45ba127069f..8889f154f22e 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1641,7 +1641,7 @@ config VIDEO_MAX96714
> =C2=A0
> =C2=A0config VIDEO_MAX96717
> =C2=A0	tristate "Maxim MAX96717 GMSL2 Serializer support"
> -	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
> +	depends on I2C && VIDEO_DEV && COMMON_CLK
> =C2=A0	select I2C_MUX
> =C2=A0	select MEDIA_CONTROLLER
> =C2=A0	select GPIOLIB
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 9259d58ba734..30c5ca0e817a 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -357,7 +357,6 @@ static int max96717_gpiochip_probe(struct max96717_pr=
iv *priv)
> =C2=A0	gc->direction_output =3D max96717_gpio_direction_out;
> =C2=A0	gc->set =3D max96717_gpiochip_set;
> =C2=A0	gc->get =3D max96717_gpiochip_get;
> -	gc->of_gpio_n_cells =3D 2;
> =C2=A0
> =C2=A0	/* Disable GPIO forwarding */
> =C2=A0	for (i =3D 0; i < gc->ngpio; i++)

Reviewed-by: Julien Massot <julien.massot@collabora.com>

Regards,
Julien

