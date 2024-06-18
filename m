Return-Path: <linux-media+bounces-13501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFE90C71C
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA518282DD0
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 10:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC51AB51F;
	Tue, 18 Jun 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKhujOM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFE14EC53;
	Tue, 18 Jun 2024 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718699300; cv=none; b=jhoiqIo1O4JcuhVMVJOOBnKVMQh9sXEtPua6cB+pxBa6lLamMxKekPis/oYVwZE/db83ORGO8yDCZcQRUsNiV6oHBQboqVbbAxwaxh9DduADOspfmOssDsiX/ouqyxtNFBhy8WOo5WqhrmCDGd0NatZPJuQZQ0iWndw0Im50T+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718699300; c=relaxed/simple;
	bh=fDuBcP24asbSAJrbRE20Sf3+CUeZSdW/nBC+/MiaXAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXfLBPco8D3hCyauSWdGXqy+BLD623bQxhTQ+bylzFQovtJWtR4DDHlmRYS0/KHFD1GeeYQ/fuViC8gSDMYVOHzSdEXx2UCaqoCLw0lGUvJtfis5X62kktc0MsZZH+vhosy4p6V1kiZ561tuxd2N0ghOY8U1+dgdoZ1zhY0pJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKhujOM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so780907266b.2;
        Tue, 18 Jun 2024 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718699297; x=1719304097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLTxPv/nsWe7Zfu/tZSlFHX0jN4s9uxiYT3UOnjGPnE=;
        b=BHKhujOMsSoSJDs16AquPldkxTKu1jVtTuT9aFENoKhQ4Str1oukaTPuDzJsTAg58n
         Hp1YuGw9UFYL1B9+8a6xznhplVNysrmSCZYCH0G7U3DbDDtl2CioeENH1kSSon8uVMvG
         rL0/qetDLIolOVx86l2/tN2xh1KDOCpNDNx+dwKHUWSRl/HUsnLdj7JzCco/Y9yDs6Qd
         twBGuErboaMtKLsMisnh6ZuSZHiA0H2oAAY01AucFFVuAZn7T5qVuEkmMMceeEPHgvXQ
         z0xF9/af1TJ70J//NjOvoIGPahiHEM3MYNH/gThBfMYoteb1LHBLv9epQ1AC/CQs85kk
         XZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699297; x=1719304097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLTxPv/nsWe7Zfu/tZSlFHX0jN4s9uxiYT3UOnjGPnE=;
        b=ZHSE2AgblgAw1BNoRzIX39FixwOeSllbz2ZyFb4wE5YSqM2GAoPkKEjpGNOooIQDy3
         PRbESpHCygWc+6uCxfndkW1cC/53HR2FcfWgM4zfER4S6TaC0XNPrxQJqj2po570LvTH
         UnGBiw5YaVLUOSgDDvHoBgOx14aRge4/ZTKmkTX8DZPLgFnnVtIcSJ5b+lsqwDM4Zqdr
         f2gcnTs+AvrPDTliHt9lru7IBwPPVFuB9nvycy/YLCqlUASogSMkpCxTetMYUZP2eOlT
         ahqLpDTxOL8zwEmQp+hJHyTwk/391crij4G52V8tWwSLFY+62oYCioFrxLo1uneQyGMx
         kHtw==
X-Forwarded-Encrypted: i=1; AJvYcCUQRbXRa0LAbn+GUiMi1CIekYXI0qNJ5zpi9fhIvqQ8jAEDxIin9ZmpfUc7ucadAgMr+Dp3T7IZoBZ16ZwA9LswjUzAgqELSHg1P0o2ybOWxOBCovEeVhBxxEWc+d/PUnj+Jda0pK3JznvWiwgptOeq4ktvgJGH08An/vbBYtwdfBSX5sg1
X-Gm-Message-State: AOJu0Yy+F74+1TkHAsKyNanEodfczxzJAWge1TgDXt7gHnYjP0r+fewd
	xBMFlQyLAskSADgjllxlLu6nCm+U+cMSwBEdjRhzWQWIJIRPCrM=
X-Google-Smtp-Source: AGHT+IHte2kNPklKy0uooT0+VxtXAAzQyiEKdtDQzWdgV/PwLMIcBTFXQgeo3rhoneTxxDcXK0uRew==
X-Received: by 2002:a17:906:5da:b0:a6f:5dfa:b27a with SMTP id a640c23a62f3a-a6f60d402b1mr699663966b.35.1718699296129;
        Tue, 18 Jun 2024 01:28:16 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:e5d5:17e7:54e8:5475? ([2a02:810b:f40:4600:e5d5:17e7:54e8:5475])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f99a09fe8sm47580966b.9.2024.06.18.01.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 01:28:15 -0700 (PDT)
Message-ID: <2e98128f-39f8-4800-91f6-c1cfa21fa0a6@gmail.com>
Date: Tue, 18 Jun 2024 10:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] media: hantro: Add RK3588 VEPU121
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar, frattaroli.nicolas@gmail.com,
 heiko@sntech.de, kernel@collabora.com, krzk+dt@kernel.org,
 linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, robh@kernel.org
References: <20240613135034.31684-5-sebastian.reichel@collabora.com>
 <20240617025022.25122-1-liujianfeng1994@gmail.com>
 <o6iccgurpi7sraq7plxaccz37i44te4jaqicnp2nqbke2qtskh@4kboulg3zywx>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <o6iccgurpi7sraq7plxaccz37i44te4jaqicnp2nqbke2qtskh@4kboulg3zywx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.06.24 um 13:30 schrieb Sebastian Reichel:
> Hi,
> 
> On Mon, Jun 17, 2024 at 10:50:22AM GMT, Jianfeng Liu wrote:
>> Hi Sebastian,
>>
>> Thu, 13 Jun 2024 15:48:45 +0200, Sebastian Reichel wrote:
>>> +	{ .compatible = "rockchip,rk3588-vepu121", .data = &rk3568_vpu_variant, },
>>
>> rk3568_vpu_variant is decoder's data, typo?
> 
> See first sentence of the commit message.
> 
I think, what Jianfeng meant, is that you are incorrectly using
rk3568_vpu_variant for the newly added "rockchip,rk3588-vepu121"
compatible: rk3568_vpu_variant is for the decoder (confusing, I know:
should actually be rk3568_vdpu_variant) - you want to use
rk3568_vepu_variant instead for it instead.

Alex
> -- Sebastian.
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip


