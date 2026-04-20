Return-Path: <linux-media+bounces-59174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yITCDph05mnKwgEAu9opvQ
	(envelope-from <linux-media+bounces-59174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 20:46:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D06024330A4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 20:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F202300D1E2
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 18:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757503B961B;
	Mon, 20 Apr 2026 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3+69Izc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A43B7B6B
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776710795; cv=none; b=XX+iVcd1RZuV7SGR7+4g7MSJUmSZUWPKacXOuE2qL+jjBFgVobAwyjqngFdjkyl7Tvnx4I4NhArcsxXAFrTVztX0Kpc2gqnkCsYqLZedIz35G5QVBiO7LnLU2uSKrINzB39TTo81yUrAHkoNPpsywuvP1cmixMqsB512y2Rf8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776710795; c=relaxed/simple;
	bh=VpRgKJeSIi71N68Y8739/SSGUB0UtkEq444ON+o5OIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IlpGjIaklTDT15BBdXagDR7Ac+uOtYba9GKO2T9GoP/n7MfBVCdzcqWemkA4RR7fnY+DiTHGYUgqXgJyV+5iglxwpxac+UPylsvnMTi87EwAEiuQ5cw/ZjzbUBoWS6j0EPAYdlzWJoFMEyKMgYZ3UXh0NECVD04DZLQ0RZglLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3+69Izc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so44014325e9.3
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776710788; x=1777315588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezihBkKIq5plwA46K/OnSuM6XnDLOuxbdyvhSHTGX08=;
        b=K3+69Izc/oqxkYECb2dmIUOFbPwNN6ojsgRXcEh6XsAPLiIyL+rvsK5fhHT+WujyPQ
         U1wmzNwoQSBi3kmLTxiH6LvfvOvymWmUmCRdQ/lxfB31h0lhDqpaEKK30t75ulBX5M3j
         X2hI8S7LLqZYfQBt49UcroekMB1t4bgaQGHsEz82piMwcgJPo9XfMjzsGa6CGFrNKJ67
         jIUsGjUCV2OErr7tz993CDEGJQdI5d2cx7nWSfpqte1eS3Zb9GHc4/n1CjpKh0+2dlpf
         J1vhXr/xVm0xuxmCsbqedgCdPpzceFD0zLfXgNge3zwLBVUqOMYvPYYMV0HryjXPdxqf
         Bp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776710788; x=1777315588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezihBkKIq5plwA46K/OnSuM6XnDLOuxbdyvhSHTGX08=;
        b=Bn6o7FuOujdZM62R+QZd4DVmCyv+rOn1I2Udij6RGC+xBm2BsSqETmbrEfuRqhj7RQ
         Ion6DS6JudlwkuZIM+CVAOXirEI/m24uKAo1GO+Pf1AL2Hv3r3HV3BJqTRwUiEZ/dVl2
         sm9O1sC5H+d0uep7ChERp1gqGjfDhl/kz7dF2U7erppHUCNOrYOVhKmcXCzfbm8Z6Js8
         QODuZT1PPkzkmrEC3xxI/D0wube9NlOjquIhWahv/qxoTpFySuOfiwprDaPJ/3YXG2aP
         WiqS6WZHmFhF5YT22ttog6cUkXJO3uI3D/X3Iy7FZUFaZDi9UxR9eyHAHwChjkbgoIBN
         D3ig==
X-Forwarded-Encrypted: i=1; AFNElJ+svXP2LBeCRlwHDsZcD2SD+bHzYgroNw9i4vzlgqFffVVPjTQal4KiVokrF+hI0aBFLNmoGB5wRVKEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7uNxl6jaPCHpnuf8DwmQAavo9tXHHh1pKgX2f7SIht6w3HLk5
	FFooAX4Yd+KwNe1hMoHDUQWzpyM2WMBTj41wbFaaFOuDlH1T4qshnAb0jLQdm8mE
X-Gm-Gg: AeBDieud7FpI9rM0odjWqkOKLkgT03CuRrGJEOv8/7QiIoOWvXzEwilPW9nMoUn81l9
	q3pbFCWZCAJK/WmnX2UUoJSh28EPivTXn6sN2rx2w4Q+krhEfaklFxomz2XM8VdYLEFZDCAqAEn
	9h0iJ924tBmk2S2YGa2NljJ2OxtqJ88GIDvELu0M8LfnpExN/Hw2oHtAs2usMp4+Psya146oBGZ
	e8Ilymb4bIvtzKgKQIFA9GM7O0+hoOvZ8GWBrlNfZphfIb6IM+PF0D2W6m4KlG/QGCINoopIavz
	OVpgXB5mF7F8xF+SrV4tUqAQ7oi/vMJkvkNoIvNnu4RLRkiHgluflu6dna0kYviwuloDVzCLTGR
	KoP/VpwwdT3LwoFnAa6kG/+KKJU2kXVeiRwWd8kDm07nnL/EmNmeWIU/tObNf5Ocvg7Z74Bcldb
	ZbKv53fYNPp1qkut7oeEfaaHJ6Vah5jLmFtpRwIPMszIkIcFTyauHUvKrIC3zkIWle9ZC0+Ajhg
	qP3ZdMVcAOZsQ==
X-Received: by 2002:a05:600c:34c7:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-4891c32266amr75494475e9.15.1776710787807;
        Mon, 20 Apr 2026 11:46:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm95937205e9.9.2026.04.20.11.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:46:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 19:46:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Agalakov Daniil <ade@amicon.ru>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jacopo Mondi
 <jacopo+renesas@jmondi.org>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Roman Razov
 <rrv@amicon.ru>
Subject: Re: [PATCH] media: i2c: ov5640: Fix potential integer overflow in
 sysclk calculation
Message-ID: <20260420194624.695dbae0@pumpkin>
In-Reply-To: <20260420154007.2877949-1-ade@amicon.ru>
References: <20260420154007.2877949-1-ade@amicon.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-59174-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,jmondi.org,vger.kernel.org,linuxtesting.org,amicon.ru];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D06024330A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 20 Apr 2026 18:39:50 +0300
Agalakov Daniil <ade@amicon.ru> wrote:

> The calculation of sysclk uses 32-bit arithmetic because
> sensor->xclk_freq is a 32-bit integer. The intermediate multiplication
> result can overflow 32 bits sysclk variable.
> 
> For example, with pll_prediv fixed at 3 (OV5640_PLL_PREDIV), xclk_freq
> set to its maximum of 54MHz (OV5640_XCLK_MAX) and a pll_mult value above
> 238 (the maximum value for pll_mult is 252, defined as
> OV5640_PLL_MULT_MAX), the result exceeds the 32-bit limit.
> 
> This overflow causes the 1GHz safety check to fail, as the truncated
> value fits within the 1GHz limit. Consequently, the function returns an
> incorrect frequency, leading to misconfiguration of the sensor.
> 
> Explicitly cast the first operand to u64 to ensure the entire expression
> is evaluated in 64-bit precision.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
> Signed-off-by: Agalakov Daniil <ade@amicon.ru>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 85ecc23b3587..04e5a683976a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1377,7 +1377,7 @@ static unsigned long ov5640_compute_sys_clk(struct ov5640_dev *sensor,
>  					    u8 pll_prediv, u8 pll_mult,
>  					    u8 sysdiv)
>  {
> -	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
> +	u64 sysclk = (u64)sensor->xclk_freq / pll_prediv * pll_mult;
>  
>  	/* PLL1 output cannot exceed 1GHz. */
>  	if (sysclk / 1000000 > 1000)

It would be much better to rework the test to avoid a 64bit divide
(which will fail to compile on 32bit).
Even the 'sysclk / 1000000 > 1000' test may fail to compile,
the compiler might convert it so the equivalent 'sysclk > 1000999999'
to avoid the division.
I don't know if that is the correct test - it doesn't match the comment.

You could do something like:
	u32 sysclk;
	if ((sensor->xclk_freq >> 8) * pll_mult > (2000000000 >> 8) * pll_prediv)
		/* output would be over 2GHz (or thereabouts) */
		...
	sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
	if (sysclk > 1000000000)
		/* output is over 1GHz */

	David


