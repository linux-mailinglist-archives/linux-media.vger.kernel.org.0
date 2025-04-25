Return-Path: <linux-media+bounces-31016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B1A9C286
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB85E17B37F
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A120C22FAC3;
	Fri, 25 Apr 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="stJOLVOW"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78A1EB182;
	Fri, 25 Apr 2025 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571445; cv=none; b=B/Zvp/6dGCbx7kgTPOiyrkHPN4Ax50B6CYXuo8iWWJ1zKzU7RI7eaIrMM9ZkAdhK367F9mnuWI3uN0dR8c9ahb8UL/IRwluXFukarl0rwNgxjUEqPrHY1UF2fN84VVndYUw5gKpHsTICVAMrM5IfR5T10IpjwDnZTRC+cBD2Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571445; c=relaxed/simple;
	bh=4OSoVjosSdcBjZotNu4R/Z3jYCJgRB1HOGSrMN18SeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cc8roQHzhjpXjYKNGmPbcZLifYH9SLXiYrC0ne6HlmoBcJdbokfwfvtz/6h5VUeOFhyPguNckjK/M8EUlpegb98dn4+mh58y/hP1Jt3KcYSMyfKfFIHSOXvmuQFtzfAIVX6WQs0ceqOwRPEeXNsV1R1xYiu81DDgQPNyT9T7gl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=stJOLVOW; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4ZkRYS5N69z1HSD;
	Fri, 25 Apr 2025 08:57:16 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4ZkRYS1rJ1z4Q;
	Fri, 25 Apr 2025 08:57:16 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=stJOLVOW;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1745571436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yf2aYlIcxVVGizSpVvZ8JYPJ5Jj59wgeBFtKAKlHX44=;
	b=stJOLVOWx5GkguUtGMLMoFigcK95Jw2D7GXH9p6YNilXkgZ2HaaZLEwbrqoupPitn80RuM
	DtsNM9E+wwEQl5IKo1LYO9efYKjLbE8/Av7y1g/VRID7JWJr3jbUyRdmG0xdM/7E/T6/xx
	+HgChgF7Tq9tMxY3JJxSzYrs+oxE8ViFevb2gboYpK76PKJc00vWzfdDjvK3malUPb8RtJ
	VL2rX4WDCpl9lFFECjL4FEY4lMYo7QJW1ncf09eBfDxaBd7xhN33KFPifK5OVZKOExbafR
	eSJDKo/zzwywnMYCh0CApxCGMxk0HQhSgs+w5m/VlBk7xmgf50sMbVXhgoSvPQ==
X-CM-Envelope: MS4xfGH9ubBhWtgw+qry96p0p2CY3MAqye7DnTYvFFgCU+PBQbprOMA8/jc/PvCT7GLQ/9y7TYUZl9I9bi4GLgODAMu4H+QFItiyxwBDkgn3acszxm8ZccrJ qWVoq3RzX8yvSYmPiMujJZPjuMgGifWBNb277zoeG02hBMW1bb3iohnm0nrI0aXmM7xmfxBZ3EWaFdrRXn9tWbQWGI8QH6Qo/HLt7C7O4wGUap0j0/WdH9AS KwQK+XFmnWgJrgHjQ5ds6KA/NvyrWfxrHWqh+DINtRusCrtoaETywDG6UdsRq2WTfWxr2j4fHEm28jSbtWyZwwOkcPyKHTcdJ8i6QJdTU0l/xidBUIHt4ljf kgy1GIQgTCU3lWqCG1g8eu3oxhtpj0I4wuzhJB9J5WK+nDcLjab9GQdTRUfmmZ8MxG24YqPDDVxLAofWtYelUJjHpDpNmu/9ofVtqihGMT/eA7Y4GBFU5MXe Z9DAsMrhyw1tQyrv7ADcHlNIarbpxXphHC5pfQ==
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=680b4e6c a=xVxOAnYOZqKVbrsbIgLjXQ==:117 a=xVxOAnYOZqKVbrsbIgLjXQ==:17 a=IkcTkHD0fZMA:10 a=xq3W2uTSAAAA:8 a=EuBBl-eGEdlqjvPoGpYA:9 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
Message-ID: <ab1cdc06-5fbd-420f-a917-cf9604772de1@jjverkuil.nl>
Date: Fri, 25 Apr 2025 10:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] media: platform: Add hardware sync wait to
 fimc_is_hw_change_mode()
To: Wentao Liang <vulab@iscas.ac.cn>, s.nawrocki@samsung.com,
 mchehab@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422021345.1940-1-vulab@iscas.ac.cn>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250422021345.1940-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 22/04/2025 04:13, Wentao Liang wrote:
> In fimc_is_hw_change_mode(), the function changes camera modes without
> waiting for hardware completion, risking corrupted data or system hangs
> if subsequent operations proceed before the hardware is ready.
> 
> Add fimc_is_hw_wait_intmsr0_intmsd0() after mode configuration, ensuring
> hardware state synchronization and stable interrupt handling.

Just for future reference: please don't resend. If it is in
https://patchwork.linuxtv.org/ then it will be picked up eventually.

Also, always add the driver name in the subject line, that makes it much easier
to identify who should pick up the patch.

Regards,

	Hans

> 
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
> index 366e6393817d..5f9c44e825a5 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-regs.c
> @@ -164,6 +164,7 @@ int fimc_is_hw_change_mode(struct fimc_is *is)
>  	if (WARN_ON(is->config_index >= ARRAY_SIZE(cmd)))
>  		return -EINVAL;
>  
> +	fimc_is_hw_wait_intmsr0_intmsd0(is);
>  	mcuctl_write(cmd[is->config_index], is, MCUCTL_REG_ISSR(0));
>  	mcuctl_write(is->sensor_index, is, MCUCTL_REG_ISSR(1));
>  	mcuctl_write(is->setfile.sub_index, is, MCUCTL_REG_ISSR(2));


