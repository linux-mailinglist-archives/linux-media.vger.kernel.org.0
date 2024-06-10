Return-Path: <linux-media+bounces-12862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B3902352
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405CA1F277E7
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5559014E2E8;
	Mon, 10 Jun 2024 13:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR64bmM+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112091411D7;
	Mon, 10 Jun 2024 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718027795; cv=none; b=Td/BoxqHHw0EevRJnM6Id/0+Re4ISZsCwFwvxSGepiBtMLXZokxWtkutfmpXymHl8SsDfsGVORdv99ONavE7bBjf8AUWca2Xa96kKn5ZKo/EtUVsw2oKwCUciJrAro1MWCXHk/dNVaGbaOcsdjlPSBYXlgIeNX9kBWQhtBK353I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718027795; c=relaxed/simple;
	bh=cL4zYHOUTrROgPJMTGHdIkSCW0JMb4J3yiWWX+7hroE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=meYiUdX7He3DTepCOfOJ0kbvm7/tSrrwEM89B5NYGSllFArUyqndT1tyEKDMpYa4kTD/UBU2WdamDReHAOseoc15F45n4wPxfDO1YlFxO51orVIG4pwYj55Qk7C9MnNPXD3TrHvJqFtlmz5EiH/IdmVYB9qWRj1GInn1X2cVSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR64bmM+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so494477466b.1;
        Mon, 10 Jun 2024 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718027792; x=1718632592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aKiRdG6IE0dAu5/ML0DRkz7ioaoUbf9nHeDRsbZ/6cg=;
        b=KR64bmM+1CLMhzKb9oqmw/GqeVwcX4XEVknJyfBu3AQA6H/9F/YrmaWgp+AspnhZrE
         wflqtCIqwLxOL4Kstjf6ZmpD/hwrS+ULGK9cgfHlstMWu2ppKGAl5WFpdf26hD9BBwHi
         i1E5G/i0TrMBe6Hdbpnx79tyfXmUx7ZjJGeGfQYikiqJXpo8UOuok6XM1oBJAh0usY0H
         3Y1c/8lCa/Bb6nz8MEtCu3Y8g4XuhSIFGdIEytqv8JlXWVfKtnqs2PwhrFClCsL0Opj/
         EJ959NRhvPF4GOZMOAt8NVBQiqu/MS3sRrnJTT8+tnt8nhYuJn/NpZQVF3ZqAuuWFwfs
         ruKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718027792; x=1718632592;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKiRdG6IE0dAu5/ML0DRkz7ioaoUbf9nHeDRsbZ/6cg=;
        b=YY6GjyVh/xMRo6q0bv1Sk0odB+K8YyARvGCj0qEFw+HHEQu95b568/VWvjuBAyOzur
         9MXsZEebdd8WiAc9/mMZfdlh7BrN9AVSfh/x75lcKDCyTp6POfLK5M2LXLjQ9qp9CAZK
         BpXP7pxP9+BHvZsJ9JB4FQCp3eKCFkqrWLBWBLov4GoYJexUXvdy0Ca3WIHoXtesIcoI
         /ReASP9/EaiWI5irdCYX593WF4cHbe5/iPPwsQ5UeDvUsIw+xcXaFNj+g0mTUBd25wxf
         8f07EoR2GvKv77oxuTQUZQ/fCT17Lpdm1Wf/Mk6CpkGZ6y1RQvebhEoinOkG2Idkq5eO
         5f9A==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9g/uNIaSX21CpyVVnHfN81mH0n1dbddvElLXyuE+2P1MdOG6wCRwZ6Piw9ew8F2K4GcLKi+mQrz8ydDbQWm0OqZs+vlVBsG2+EUfL78iUOL529k12sByXIMU9udCErpWjbylwGPIIkB2WqkwbafaqPGNveCBG7FOl/Ir9qrzxeQTzk1w
X-Gm-Message-State: AOJu0YwkLPB59IntwEViVEsRZwCUhhgVIrNw+3i0jABnjxc0Ma2Pn/Jn
	miWYKH3X9nv0hzZ43KH1i3Nk7Ry8sWwY9tc/KPr4CTiVLEs9NYk=
X-Google-Smtp-Source: AGHT+IEaCfhpaGaeNvro0IJoqapFgXHDI0HHYONRa7o82dj+8EDsxBZg7VHJktoUt9EW7H6Z824NaQ==
X-Received: by 2002:a17:906:285a:b0:a6f:1f18:2b72 with SMTP id a640c23a62f3a-a6f1f182ccamr169363966b.0.1718027792023;
        Mon, 10 Jun 2024 06:56:32 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:efc5:4499:36c1:811e? ([2a02:810b:f40:4600:efc5:4499:36c1:811e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f200ce38esm122278266b.92.2024.06.10.06.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 06:56:31 -0700 (PDT)
Message-ID: <aa475252-701c-4d1a-b495-8079dfd01a86@gmail.com>
Date: Mon, 10 Jun 2024 15:56:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: media: rockchip,vpu: Document RK3128
 compatible
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240523185633.71355-1-knaerzche@gmail.com>
 <20240523185633.71355-2-knaerzche@gmail.com> <3639993.hdfAi7Kttb@diego>
 <20240528083747.z55laxnmioorzaru@basti-XPS-13-9310>
Content-Language: en-US
In-Reply-To: <20240528083747.z55laxnmioorzaru@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 28.05.24 um 10:37 schrieb Sebastian Fricke:
> Hey Heiko,
>
> On 28.05.2024 10:19, Heiko Stübner wrote:
>> Am Donnerstag, 23. Mai 2024, 20:56:31 CEST schrieb Alex Bee:
>>> The integration for this SoC is similar to RK3066/RK3188.
>>>
>>> Document it's compatible.
>>>
>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>
>> Media people, can you apply this patch alone from the series?
>
> Yes, will do got this on my list already :).
>
is there anything holding you back from applying this? It's really only the
bindings which go though the media tree (i.e. this patch) and it has
been acked and reviewed some weeks ago. It'd be great if we could add the
vpu to the SoC DT before 6.11 merge window opens but the addition depends
on the compatible to be documented. Please let me know if there's anything
left to do for me.

Alex
>>
>> Thanks
>> Heiko
>
> Regards,
> Sebastian
>
>>
>>> ---
>>>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml 
>>> b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> index c57e1f488895..d1b47b14ca57 100644
>>> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
>>> @@ -26,7 +26,9 @@ properties:
>>>            - rockchip,rk3568-vpu
>>>            - rockchip,rk3588-av1-vpu
>>>        - items:
>>> -          - const: rockchip,rk3188-vpu
>>> +          - enum:
>>> +              - rockchip,rk3128-vpu
>>> +              - rockchip,rk3188-vpu
>>>            - const: rockchip,rk3066-vpu
>>>        - items:
>>>            - const: rockchip,rk3228-vpu
>>>
>>
>>
>>
>>
>>

