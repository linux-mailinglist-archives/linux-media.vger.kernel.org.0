Return-Path: <linux-media+bounces-44148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 34339BCBE0B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 09:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D5E1835324F
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 07:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C54B27281E;
	Fri, 10 Oct 2025 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQhguH/w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74324466D;
	Fri, 10 Oct 2025 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760080267; cv=none; b=S8C/yULO8Yr5WHSTPsxxwnKdsK8tuDoQpGeF2wr12FtA9Daxvu22B2TmokWIXwA22sN5jX2A6bDgaaUlflUTAt2zchs1okBgbaY8xIjPOhpeWmHci84ygSR5zQu0XnVxB1kx7ixM0pCVLY8V3KRsBeAOloBjFIVsGWNwtcEVTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760080267; c=relaxed/simple;
	bh=WnOn2RWfJZ+5mfrH3gFi/22D2gFBJVtPFdAeLDWJtpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDV+7to7V/e7nd3Di/n0GCXcsREZpie1kt6wRDWDuthJJn8WK+eTmdLvuZBHD6idACnRf0l6Pvgxlt9G7XCKu15/97oduM4CEJoWZ3KKUSk/IOkRJHoXS907wUqhRJ1+YhvF0w1i0zeyKI3wOP6dwvmwUxLnWEM5ljQ9NGa7reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQhguH/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25E8C4CEF1;
	Fri, 10 Oct 2025 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760080266;
	bh=WnOn2RWfJZ+5mfrH3gFi/22D2gFBJVtPFdAeLDWJtpI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tQhguH/wuDdCKXd7Tt8gZQY96Xzw1IoCX83ATx74aOZdjBcxe0+HS6wzI4t1YxWWQ
	 +ot1SQtQKU2N4XPXMfNAQMv5YKGq6fkYImAOGZR+kCHtvAUbvO8jyslZu7Wsz0hBN+
	 2K41pGWSWMly+xb1pz+4nbxy3hK9XImf4TWb5QyWpXbVgQM8srF3bLFfDspYOqrJBI
	 xdPSyl0KxYUh0o85ROWAwnd/Si6MKzY4PdN2SGzQWWJDdFV8l6fbynrFI9r2N3a+7a
	 8B/m3m1WDf5lLcq79a6Y/Tfc9jDqRKIpHNJ2MhYOofzzrV6/5cvjN2wYpSoyL3hYHh
	 ZHsENQ8xead0Q==
Date: Fri, 10 Oct 2025 08:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org, Malcolm
 Priestley <tvboxspy@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, Petr
 Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: radio: si470x: Fix DRIVER_AUTHOR macro
 definition
Message-ID: <20251010081046.07c37df2@sal.lan>
In-Reply-To: <20251010030610.3032147-2-kees@kernel.org>
References: <20251010030348.it.784-kees@kernel.org>
	<20251010030610.3032147-2-kees@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu,  9 Oct 2025 20:06:08 -0700
Kees Cook <kees@kernel.org> escreveu:

> The DRIVER_AUTHOR macro incorrectly included a semicolon in its
> string literal definition. Right now, this wasn't causing any real
> problem, but coming changes to the MODULE_INFO() macro make this more
> sensitive. Specifically, when used with MODULE_AUTHOR(), this created
> syntax errors during macro expansion:
>=20
>     MODULE_AUTHOR(DRIVER_AUTHOR);
>=20
> expands to:
>=20
>     MODULE_INFO(author, "Joonyoung Shim <jy0922.shim@samsung.com>";)
>                                                                   ^
>                                                        syntax error
>=20
> Remove the trailing semicolon from the DRIVER_AUTHOR definition.
> Semicolons should only appear at the point of use, not in the macro
> definition.
>=20
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Kees Cook <kees@kernel.org>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> Cc: Hans Verkuil <hverkuil@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Cc: <linux-media@vger.kernel.org>
> ---
>  drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/medi=
a/radio/si470x/radio-si470x-i2c.c
> index cdd2ac198f2c..3932a449a1b1 100644
> --- a/drivers/media/radio/si470x/radio-si470x-i2c.c
> +++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
> @@ -10,7 +10,7 @@
> =20
> =20
>  /* driver definitions */
> -#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>";
> +#define DRIVER_AUTHOR "Joonyoung Shim <jy0922.shim@samsung.com>"
>  #define DRIVER_CARD "Silicon Labs Si470x FM Radio"
>  #define DRIVER_DESC "I2C radio driver for Si470x FM Radio Receivers"
>  #define DRIVER_VERSION "1.0.2"

