Return-Path: <linux-media+bounces-30888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C0A99D01
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 02:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 377BB7AD974
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C83F4ED;
	Thu, 24 Apr 2025 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds9mYSuN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D532701CE;
	Thu, 24 Apr 2025 00:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454538; cv=none; b=riHTteP+dAqa5a9aism2XAtL1w+kn0P9PrgjAmcTFV/5g8Soqo3rwGZJQbJuwCH52CLvUGjTXFJNxQTAPHvGrUZfXI5hopykvk5NBvpGyTI7ObDqsxSYA6h/t9boITNTIeYp7pGSTiRVxRS3WjZ7u29XDeLcdgt4EtPCOgvUE8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454538; c=relaxed/simple;
	bh=FCwThLR2mzTnoWJzKwd6wHQjmDFO8JlE7d1Mot5SddM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ubk5cZrEjf7U/AZPTxebW5Zj5wdM1cR/Z3Uwp0cH5yXMDJ5FurKpM+lq9YFaSfbByuv1S/qN2Gr1ZRVLPITIuWtmWZ4Xi0+CO4EfidDmMWL5J9wmAd4A8J/Lj43Ou8hcFylwNgYV+D7l9zXOZVUO1uNFx5OqmWzS8qEDdMCXE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds9mYSuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1909C4CEE2;
	Thu, 24 Apr 2025 00:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454537;
	bh=FCwThLR2mzTnoWJzKwd6wHQjmDFO8JlE7d1Mot5SddM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ds9mYSuNFdSDPOSvzWg04Kf0eh9Qg4axXsn2fhAovBufCucmjL7CoaTlQzC/XaiAl
	 JatmLE3jC8J51qJRjdzEBFi5/2V64wrWjyugTxS5FVxCoyTucN3RVNRXtMcaDH2kfT
	 PppbZqa649oy7zbkDBpaEkfjaC18IcZwtyaaW0ioLmYAhVK3vthGwaf5kQB54JFXHA
	 +6R2OjV1YQ2l3iyQ06g69jyU9cJ39Nj3Xg6x1BtivijtxEFc0YyGOdidv5KPQatFie
	 a23gxYo51v9HoJry//hQ/aR92P/kuBwK3LicWJHmKmchjSlkIbGcXgkXT7V+vokPBS
	 RhvEw2Qkxlpkw==
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so199874241.3;
        Wed, 23 Apr 2025 17:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwjjMsbVeTykYoN5bGXZ3tx/F6iB1yqtc3MmEuVoumrZeGUOgrVYMvYy9U2/4Qt/QWS9HmeuozKFiuCZs=@vger.kernel.org, AJvYcCW3OS3z+i/81SwemZvfjc9LqIWhqqYh6IwRAaS041PQMk2fTOdE1ylr7iOei0d4ccADHcFxZJodV2QgAts=@vger.kernel.org, AJvYcCWzAX+I96zuf2gTdw91ZDVaWNG/6xlcJ3tOeDHFZ3Aq7ACs1S+f3RqZtz0HgBqxUEsUgq6MFdjeS8OaNA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/v3uvRYi4EuA2fkS1bZ8NinfXFUF3b7ExSpInty6VZGWIJwAB
	4gD4gH9qsKA0xikupq7t9YnLbGv2wxmfV/FOiwHbplnvb84PLrLGuvf07uv10+mcoGnzAVTzd43
	lg6uuXKkO0O8Ek+zs+eOMcyc15ww=
X-Google-Smtp-Source: AGHT+IG1vCsGHbCso1wuq9MLYFXMOzqQdLzb3zNLaNBfG124jYdNNIqaE9q8ZRAuFr0JT5thAUpczpoTBf/XhaGN6do=
X-Received: by 2002:a05:6102:4187:b0:4c4:edfa:9634 with SMTP id
 ada2fe7eead31-4d38cb318e8mr932901137.1.1745454536814; Wed, 23 Apr 2025
 17:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
In-Reply-To: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
From: Ricardo Ribalda Delgado <ribalda@kernel.org>
Date: Thu, 24 Apr 2025 08:28:40 +0800
X-Gmail-Original-Message-ID: <CAPybu_0VwOTNOgLg3967fzBArg6tPTdWvHFMo6xBjjdnmx_+dQ@mail.gmail.com>
X-Gm-Features: ATxdqUEu__NyR5A6-EkCW4KJVHGAMQzXMgTPQnIq0buwTb8inxA2lStdrU6cz0w
Message-ID: <CAPybu_0VwOTNOgLg3967fzBArg6tPTdWvHFMo6xBjjdnmx_+dQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: i2c: imx214: Add support for more clock frequencies
To: git@apitzsch.eu
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:22=E2=80=AFAM Andr=C3=A9 Apitzsch via B4 Relay
<devnull+git.apitzsch.eu@kernel.org> wrote:
>
> The imx214 driver currently supports only a 24 MHz external clock. But
> there are devices, like Qualcomm-MSM8916-based phones, which cannot
> provide this frequency. To make the sensor usable by those devices, add
> support for additional clock frequencies.
>
> This series supersedes
> https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c0=
83c35@apitzsch.eu/
>
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Andr=C3=A9 Apitzsch (4):
>       media: i2c: imx214: Reorder imx214_parse_fwnode call
>       media: i2c: imx214: Prepare for variable clock frequency
>       media: i2c: imx214: Make use of CCS PLL calculator
>       media: i2c: imx214: Read clock frequency from device tree
>
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx214.c | 262 +++++++++++++++++++++++++++++++++++----=
------
>  2 files changed, 205 insertions(+), 58 deletions(-)
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250406-imx214_ccs_pll-e4aed0e9e532
>
> Best regards,
> --
> Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>
>

