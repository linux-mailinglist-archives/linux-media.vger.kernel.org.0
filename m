Return-Path: <linux-media+bounces-20585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B09B6167
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 12:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774B01C215F4
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBB61E47D7;
	Wed, 30 Oct 2024 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufAlKkUA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1283156F54;
	Wed, 30 Oct 2024 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287543; cv=none; b=k+7aYQWQiyXLMrI3cNIfeS+mLZOk5Wy5EitAG1edoEogD+Q4VlzHBxkCpQ33DZrISoq0qT7YKdq40+uz0IiQS0PvklpFgAcf4M5hLfQkh6r1hlE5c7HpbpHGb/0XOHvRydbbJ3YO/enZ2N6+bq0maxrQRC6d5zpNRvLRJI5r6AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287543; c=relaxed/simple;
	bh=pNa+VsBVYyKIrBAGRVMBxaWvEJvSkXNDNmc5rWOx9YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwDY1MNcTSm2dAH6x75cIBc4GN+zpftioRWMyaPjStUhJ9Qud8imzp/g7WNV0psUQdyFItZPEOwdRXThn0EqFpNJHG0sr79UGO5vQhBtAkfdVkNhgdH3CPKsvBFNBZtYB6JMQDKotGMZtpyg/RLokDWcPC5RKVyh1pLBF/5xMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufAlKkUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D551C4CEE7;
	Wed, 30 Oct 2024 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730287543;
	bh=pNa+VsBVYyKIrBAGRVMBxaWvEJvSkXNDNmc5rWOx9YM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ufAlKkUAhCGPj/auQF6rHYED8CFspclfKoB94a1VTC1cJGnkDFMT5ORqK1lWTv88e
	 9Bfo/G9Q3nAb9Jm1YTxj7vB3xiaf9lxaWm1MSxQ2iVKPyPNv3z3Fg7HRhu0oPP8Snc
	 Nm86ZopAxQki9Opnce+PwMKtlI8HHFRPAX4LyHRuA3emzRrTYMnpSj1vASCxQ/ilce
	 UyJS8lRdMuEfhgZjZLh8eCyeXgHgwoJu39VQaexeHGLpUe9JdpCptuB/XCHiD+e2HW
	 hgKaYwWK7v0fmg4yIOI52e5Yf9uQl3ac9miMUAodgpxmMSD0xVCUDEMqti6D3JSxes
	 lKyHUwCbnoaeA==
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84fd057a993so2061402241.3;
        Wed, 30 Oct 2024 04:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOizf2QYypZvFWcmBxuhRgOSD7TFIU26MkD+/tQl9G2S2AGdGlFQYU2cB3rv+prYbxsI5xupRfz2EeTwc=@vger.kernel.org, AJvYcCWBJI2qFYFV1Z6g6jnII0hICKkAsA0uDSuMK/RHCrZpYlBfUEoiJ2eCZzTinmKXzzR7Ngpw7SfpyD9Gj98=@vger.kernel.org, AJvYcCXwFrbfebpP70uvtUdq4Jd7s6KGeL4n0HREM4bstjVeQmT0efgwQSrusG+kkE6i7cKZjA7fAbhsVPovbHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiL23V+uQ90dD4QEZeTLObjlWnpn45iUK5bHYuQ+tK9IQYVpRw
	IJp+35w8jE1LZoq1lkKCv5qDZo2zjrVhzg8wpuTuo2LRaeXlmrtL/5JCdkS96u4CLfUthXQVfRN
	4+30xjDI6TDmUvHq9zdPH5b+43k4=
X-Google-Smtp-Source: AGHT+IFcj4ArYSXy6RowfeL0PKK8BGT1Y7OSex/rX6l5UUiTFAxTX0iZ0k+liK3/QVIlTGgMUBgbDIP+9OeBwQ9oGPI=
X-Received: by 2002:a05:6102:943:b0:4a5:ba3b:665e with SMTP id
 ada2fe7eead31-4a8cfb8287emr14789540137.13.1730287542275; Wed, 30 Oct 2024
 04:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu> <20241021-imx214-v2-1-fbd23e99541e@apitzsch.eu>
In-Reply-To: <20241021-imx214-v2-1-fbd23e99541e@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Wed, 30 Oct 2024 12:25:25 +0100
X-Gmail-Original-Message-ID: <CAPybu_0o+csbkyS7bbMUjB+VSUwj2DK_STy=wubCT_frH0DzgA@mail.gmail.com>
Message-ID: <CAPybu_0o+csbkyS7bbMUjB+VSUwj2DK_STy=wubCT_frH0DzgA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] media: i2c: imx214: Fix link frequency
To: git@apitzsch.eu
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre

On Mon, Oct 21, 2024 at 12:14=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
> The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
> IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
> which works out as 384MPix/s. (The 8 is 4 lanes and DDR.)
>
> Parsing the PLL registers with the defined 24MHz input. We're in single
> PLL mode, so MIPI frequency is directly linked to pixel rate.  VTCK ends
> up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.  Section 5.3
> "Frame rate calculation formula" says "Pixel rate
> [pixels/s] =3D VTPXCK [MHz] * 4", so 120 * 4 =3D 480MPix/s, which basical=
ly
> agrees with my number above.
>
> 3.1.4. MIPI global timing setting says "Output bitrate =3D OPPXCK * reg
> 0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
> frequency of 600MHz due to DDR.
> That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR.
>
I think your calculations are correct and the value should be 600M...
but if we land this change, there will be boards that will stop
working until they update their dts.
Not sure if we allow that.

Can we move this change to the last one of the series and add something lik=
e:

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 2aca3d88a0a7..8b4ded4cb5ce 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1281,13 +1281,9 @@ static int imx214_parse_fwnode(struct device
*dev, struct imx214 *imx214)
                if (bus_cfg.link_frequencies[i] =3D=3D IMX214_DEFAULT_LINK_=
FREQ)
                        break;

-       if (i =3D=3D bus_cfg.nr_of_link_frequencies) {
-               dev_err_probe(dev, -EINVAL,
-                             "link-frequencies %d not supported,
Please review your DT\n",
+       if (i =3D=3D bus_cfg.nr_of_link_frequencies)
+               dev_warn(dev, "link-frequencies %d not supported,
Please review your DT. Continuing anyway\n",
                              IMX214_DEFAULT_LINK_FREQ);
-               ret =3D -EINVAL;
-               goto done;
-       }



> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 4962cfe7c83d62425aeccb46a400fa93146f14ea..5d411452d342fdb177619cd1c=
9fd9650d31089bb 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -24,7 +24,7 @@
>  #define IMX214_MODE_STREAMING          0x01
>
>  #define IMX214_DEFAULT_CLK_FREQ        24000000
> -#define IMX214_DEFAULT_LINK_FREQ 480000000
> +#define IMX214_DEFAULT_LINK_FREQ 600000000
>  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10=
)
>  #define IMX214_FPS 30
>  #define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
>
> --
> 2.47.0
>
>

