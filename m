Return-Path: <linux-media+bounces-15754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B645946FD8
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 18:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A918F1F21430
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 16:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A87131BDF;
	Sun,  4 Aug 2024 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRO75MFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6928A953;
	Sun,  4 Aug 2024 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722789738; cv=none; b=Mh8Xtb3M4DGyO7hTzz9zg9ZKuwYynulyA67bsLMK3K9Hil3zwyBuYync8t3raPSrB+gSdT/+FhC7Dxz5DlmUv/upxNGSHD3rJrrB6mXhoOEtbhg4jGcwNpqDil3Vjg3q7nXrmQplPOIXKiYLf6zvoaP6QONexc+fq2hjeakMnB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722789738; c=relaxed/simple;
	bh=1v3LzsVOoWXnGOgAzeYqaYj3V8aHQRRnUTqbMoaEoSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwkRvwtJJXuX8edudBVGJovGMKIVV/hxNzLLmX97Bn01Q4IC/zuxuzcx6HDEuCI9rAnWBdGRC9uxqd0T1vf0xcRMPeCL7ANCAWlsZT1Po6S83d98qlfTDJB1BkZd5GurnKJ6Tmi3fwAA8Jokf/0rUVLI4wI2qmF8pnwyRKGlynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRO75MFU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42816ca797fso60312985e9.2;
        Sun, 04 Aug 2024 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722789735; x=1723394535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PmONzH0N6GHJK/evEMG5zaqLLbJAVtPmbQ/7DmQl0k=;
        b=gRO75MFUj7MNIOwQs9RK2ECGdABb+U1xKOPGclLezOKRXNR1iMkfS0BD/aRHK4WQ58
         rEW4a4/gZ7SIQULnjkv9o1cuPic5+Dy2UKc2mcMuz9QxQnkJN0AoR2Y4SsHUuqrLvFVV
         6syEhgL+YpsAVh2RbKpVJGgPTVOQ3AYZgBnMJCJca/VimO4Cg7kq4GDSL1hftkK9njB9
         MB9ommxHzQBh005Yo3ldTMPtk36wq6ikAIpe68HWeBWAA2iIZKMF2Dr33EDvLZYYsE8u
         jdyPVUwLx8TvACErr3ZYtxpI5ic3Cza4c3PPgG+v0/rGFtVcEbWhyax1l0fvrWjtBm9W
         VN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722789735; x=1723394535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PmONzH0N6GHJK/evEMG5zaqLLbJAVtPmbQ/7DmQl0k=;
        b=FgI2aUD208Dc/pmJ4m78jBwoU51HtlT3j/UvFR+jMhO1GUDxd9JPFHMeVhplGB0Im0
         HUOLaZ5DYfo+67U4XsT40TQPVijL+zb9TwO0zNYWkbLHajXw1+QenMy0OnfKBNTnIp9Z
         y1uJmL1O6nYxvS1gAIaqRN8/qtJB/v6NqsnjuO/gE9lZ5OfjAm+m/c3bYvanRDKyKCbF
         nvWzXsQegNfW0XvC4qbnVC0E/l8q/sLvIAAAeJPW3XsKnQhWXLs978ndwdCsSleST+Ej
         gIK/Q1iMnCIt0u3ksH1EpIl24AbajZmo3Fe8WtLuZonfzrwJPmsEhpMZBjglmSFkySfS
         xhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs2FbWJDe0wFh2IofHaTSjzb1wMEqgHsK30VL2CBsZA+FhsDIN3jLx39t7kd+7MPPM5BvNe2glNO7nwgUb8yzWtpdoMxLKxJ0QSNpTTSfQ2UJ4NOZ+BFQiSL3qGCPW87EWdle3uRNxoq8k30E+OA9Bw5k7rspk8PU2uFU4EzqDbKGaVzup
X-Gm-Message-State: AOJu0Yw2LGw3MDCJTCtcgNjvI4rt4PzBgN1gfjKnQMuo/GYSIBUNWwXj
	ILmwuQO/Pnp5hDKKysXQeFCcvjlmnHivpskVGfrgI6S6gpcxWFg=
X-Google-Smtp-Source: AGHT+IFqflsqzZhXnhI0XacoJn9GGWP851g5t/pGKC28fnPeseerjExCPtatHRdcqL0H+lp6KBCM9g==
X-Received: by 2002:a05:600c:1552:b0:426:6822:861 with SMTP id 5b1f17b1804b1-428e6b925c7mr60093145e9.36.1722789734425;
        Sun, 04 Aug 2024 09:42:14 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:c804:e7dc:33a0:15b0? ([2a02:810b:f40:4600:c804:e7dc:33a0:15b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb63f21sm166259275e9.29.2024.08.04.09.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 09:42:14 -0700 (PDT)
Message-ID: <8a5f1856-823b-4cf7-a9fa-1dc6b9b54cd2@gmail.com>
Date: Sun, 4 Aug 2024 18:42:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/3] Add VPU support for RK3128
To: Heiko Stuebner <heiko@sntech.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-media@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240523185633.71355-1-knaerzche@gmail.com>
 <171690893336.1899981.5081114224300578276.b4-ty@sntech.de>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <171690893336.1899981.5081114224300578276.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heiko

Am 28.05.24 um 17:09 schrieb Heiko Stuebner:
> On Thu, 23 May 2024 20:56:30 +0200, Alex Bee wrote:
>> Similar to most Rockchip SoCs RK312x have hantro G1 based decoder and a
>> hantro H1 based encoder with attached iommu.
>>
>> The existing drivers can be used as-is.
>>
>> Fluster scores:
>>    - FFmpeg:
>>      - H.264: 127/135
>>      - VP8:    59/61
>>    - GStreamer:
>>      - H.264: 129/135
>>      - VP8:    59/61
>>
>> [...]
> Applied, thanks!
>
> [2/3] soc: rockchip: grf: Set RK3128's vpu main clock
>        commit: b465223129f951d110e633a305085bd8430d7df0
I just noticed this patch didn't make it in 6.11-rc1. While it's not really
important for this patch as the media mainainters didn't manage to apply
the vpu bindings patch for 6.11 anyways, it looks like all commits of your
v6.11-armsoc/drivers aren't merged. I still haven't fully understand how
the SoC tree *really* works, but I couldn't find a PR for this branch [0].

Alex

[0]
https://patchwork.kernel.org/project/linux-soc/list/?submitter=24481&state=*
> Best regards,

