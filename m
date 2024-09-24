Return-Path: <linux-media+bounces-18535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495D984F2E
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 01:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9901C232C6
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 23:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFFA189BA6;
	Tue, 24 Sep 2024 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ti7XWk60"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F891487DC
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 23:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727222149; cv=none; b=rGuZ/GXqbBpyahRDkak9GpEGXseC6ICTnRFWqCD/Byfe/ndj/ZmIcJNj3ZlPW1Knei0pwA0mq4UEJX+9ISOx7XEgAyVywiYEqZYpFv6Et1qHRahUlnYRXsbAUCUJhUgmq0xNBxAkgmKt461DrSrU1Eivy9kQ/6lLYFc/rmIbAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727222149; c=relaxed/simple;
	bh=8qMGtlt2pxwXAhZ+4Tw+EK8Eu1ysDl3vsj0r7m1amEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Os4GO4GV7aFOSiw8LNwOXGfnckruXfkHJ7AFjcpbBDaHBCVfrdaCWxzfS+/ZUQvmP4bb4emClJTzZHLF105jGpS1+p+7+dhPSRyeTX3ajz4Wyd+6tol1asgMiNOkiEly973eYqkR0gd1n45PfKtf76c70LK12bcrNCyXXvCcxEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ti7XWk60; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 86C9687E30;
	Wed, 25 Sep 2024 01:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727222145;
	bh=dbomtJYXiKaoi440SVB1UuVZhWAtiYvQbZT+gGCRQck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ti7XWk60bjqo8PqRY3EkOkH4OgZmkbkZIrd6r0b6AjgXjg940bQmP/WZRBOvLfL/8
	 K4UN8CYIYqWxBruNnqEPwhMUqHX2UlRZPDuj4X1vDryRhmJr1B6kVYl989mRr61Axq
	 yp0Qg7Bwy/vD9dh5p+wr1B5EZwl0clbiMRHiRb5Hnsdxx78m9WvZh6neM/mEjmwVyR
	 PDhcBoGMZF/Wi6tMDFl4bYnR6hncn+jVj8Guqr5CfD/V/nNaQxNE+KBAfjAlNIsvyC
	 +fc3qh9BY5Y4ZjdvpoLP4z0ih0n4BOFtLdMluh91U37MP4vy7EnbkeRmaUWT7BHpal
	 RlMWRF8qXP6mA==
Message-ID: <3c8cbf88-936a-44a6-ae8d-24d41677eb4d@denx.de>
Date: Wed, 25 Sep 2024 00:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: isl7998x: Enable VACTIVE and HDELAY
 shadow registers
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240713154242.107903-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240713154242.107903-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/13/24 5:41 PM, Marek Vasut wrote:
> The VACTIVE and HDELAY shadow registers must be enabled for per channel
> NTSC/PAL detection to work, enable them.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> ---
>   drivers/media/i2c/isl7998x.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index c7089035bbc10..5f8f11f7a2c1c 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -312,13 +312,13 @@
>   
>   static const struct reg_sequence isl7998x_init_seq_1[] = {
>   	{ ISL7998X_REG_P0_SHORT_DIAG_IRQ_EN, 0xff },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x1), 0x07 },
>   	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x1), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x2), 0x07 },
>   	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x2), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x3), 0x07 },
>   	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x3), 0x03 },
> -	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x00 },
> +	{ ISL7998X_REG_PX_DEC_SDT(0x4), 0x07 },
>   	{ ISL7998X_REG_PX_DEC_SHORT_DET_CTL_1(0x4), 0x03 },
>   	{ ISL7998X_REG_P5_LI_ENGINE_CTL, 0x00 },
>   	{ ISL7998X_REG_P0_SW_RESET_CTL, 0x1f, 10 },

Any news on these patches ?

