Return-Path: <linux-media+bounces-26970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF3EA447AC
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B117C17C83E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 17:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679D219DF64;
	Tue, 25 Feb 2025 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C04iSjW1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB6D192590;
	Tue, 25 Feb 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503429; cv=none; b=FFk+hXCLez3HOy68KyYkumGHzz/kiGjlekiSKNCe9+yCY6IL7ozVrbXwn6QntJy7JZ7hOQcVAjHhHBYwR8UgK0gXMRyzlHFmi5LUkmfTMNqcLLN20wzSDnwuJgw4WtmiyHjBy1DdyJtcZVuARALR96tfCtX1Y6/N4Kbay+EcBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503429; c=relaxed/simple;
	bh=ERQwZnsyoQHMKJY3CYdQrCBoN9md4r7dtDwmZmlQpRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqVimSUU/R3mFe4q7Yct1ZzZEM0NcMpqkGKjhAOChWhczXx+Onx52CIrhLaqA1OiVBFGvhovSI0aSNoUdhqn3F6c5ZnffOCiAS4EyVXGtA50T+sbH1bjzIqbAlB94IfIa+MVBHsNATgxdzmuot06jykqNwmIgQM7bTehfzklyLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C04iSjW1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30761be8fa7so54588081fa.2;
        Tue, 25 Feb 2025 09:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740503426; x=1741108226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgyP5e7xOUTpkQRETAnA3jifh9ceyBbmwJiNbPRBD18=;
        b=C04iSjW11PpkyyUDTEsKFYFKEEdJlalrzqY1cOVTUXulicuWVsSa+LCAGbaEZh/rJ3
         lcO2u3qi8tPTpzy2LdSYeW+FrWjVeq+uB3kbaE4KdBWBSwtUgedKrScOOEKd+ZuNyaVZ
         ENBc5Uk/bT97uZo6U3v49rmBxfxk718Oae/5IjNl4S2Zty0rzhcNLoLwjp9lgkGXjRlg
         CLNDqwaGRYfR+85QNOS1DqA8TECfOuZK6kL4klnB5Ys5k6GKiAizSQbmiqiux3rGwrk8
         VC/ohjQk9kuMpNVImKHrh5adfZinJ1fKrJNeoahG5xdT1Il1deGO6hI9iAs1oLLjCN4A
         OdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503426; x=1741108226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgyP5e7xOUTpkQRETAnA3jifh9ceyBbmwJiNbPRBD18=;
        b=XuHYgJLUzcyPcFe5Ck6ITlfhS2L2NfQ28wqoTJrynd3ACWEG4WY6JRWZ9NcJyXA6cz
         Ndf5X4hwNAk6eStCaqKIa0wu28vjZYbIrk0UTFyec4R/PaNBQoE41KepCTMjvSZkla7m
         TeVm4JG2Aw2eEn0DiyyVWB3uxFYUubYMKMmbihAkakYkWabpv0ySq5TMdLjG6+jNHOuO
         pTLbGSSXLUbT+Hinq8t/ZhWgfF1fThW6dX1wCL08ZGGWS/rBvHe2X1FEYXM6iXzHAd3f
         smnF1EjQDBO/fTL9O4pfYsY4U82DaDilFKaUXOZauszXVLoZ/q3l2COWlTi7nqxQ+L+i
         Ryfw==
X-Forwarded-Encrypted: i=1; AJvYcCV2WwXEvtgMaEuYihcTUoVOWpXF31dIQHbu/xfYcH77g5+Y0/thVZUbEPIYuZo7ULUBAIYiQRqCdzVEFWVSbsqNWKw=@vger.kernel.org, AJvYcCWiPgUt3P1KYRsvfBCSMprES5N6/DB0TzEbsv4a9pI6Q5HWOnUGtD7A6l8SW5nBv1g27Q2JxkuuocvppQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv/lkBm2yptOIckH5XPYT+pGjy2MbWR4r1iPiseS1itRqIhZBa
	7h9UcKj6BX4is8hcs0y8dmarYPEdhegzZnBd+dhy/2xoQkeSuGHZqenuPw==
X-Gm-Gg: ASbGncuJeI3T5fQPJjdNm3/1CbX7ixoHfn/UsowkS5RW8a/VQ+NmFwXMCBpDjZ4r8Xz
	yTQK+TAzv0rvtcIYXB43AmCuMsvH0eDq9c2uN/44kh40mZCweLq3dTXk/BC+A7EXCTfsFe2z+qz
	vDbrNbV89H0ZxVrKC0pE1ucOpN+blNTtNstubHkwO9MzJwl2ZdaVILLZYjyiDeZnQM2/UtNlM0u
	4omMiXHrO891CEIHUNvkAqcboyK7UUiUWzDzCxaJCrp9yQj7GW8BnunhykOpNdE9CrovBw/5J1D
	9UxMKdQzrzmwKT/HKZMfNw1hNz+zn/XHiP/WcoD145sE7RRs7JYlTsVbTwyrO1P/OQBoZsfjLnM
	S+5oyFfs=
X-Google-Smtp-Source: AGHT+IF3Vp9P32MjQngfYLkStg04hGRZaKV13OwL27k3Cdmw2AdlXT4Wapr5xuF4c/2i9fwe/6luaQ==
X-Received: by 2002:a2e:98d5:0:b0:309:d7f:f156 with SMTP id 38308e7fff4ca-30b7915f64cmr3301411fa.13.1740503425858;
        Tue, 25 Feb 2025 09:10:25 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4291:201c:341d:2759:437f:4b85? ([2a00:1fa0:4291:201c:341d:2759:437f:4b85])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819f4a99sm2742881fa.52.2025.02.25.09.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:10:24 -0800 (PST)
Message-ID: <12d6d0dc-bef2-45be-af42-393276a4c7ea@gmail.com>
Date: Tue, 25 Feb 2025 20:10:21 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: vsp1: Clean FRE interrupt status
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
 <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250224-v4h-iif-v2-2-0305e3c1fe2d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 11:19 PM, Jacopo Mondi wrote:

> The VSPX generates "FRame End" (FRE) interrutps, one for each
> buffer transferred to the ISP.
> 
> Even if the FRE interrupt is not enabled, it is reported as active
> in the interrupt status register.
> 
> Make sure to clean it when handling the interrupt.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index d13e9b31aa7cff8610ea196ae4de88ab22e44e0f..17ace4c6844d19aaafc27e79f016cc05091372bf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -69,7 +69,8 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>  				i, wpf->entity.pipe->underrun_count);
>  		}
>  
> -		if (status & VI6_WPF_IRQ_STA_DFE) {
> +		if (status & VI6_WPF_IRQ_STA_DFE ||
> +		    status & VI6_WPF_IRQ_STA_FRE) {

   Maybe:

		if (status & (VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE)) {

[...]

MBR, Sergey


