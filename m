Return-Path: <linux-media+bounces-18994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CC798D414
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 15:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE554284586
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 13:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C181D043E;
	Wed,  2 Oct 2024 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2+xei8C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28341D041C;
	Wed,  2 Oct 2024 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874767; cv=none; b=kiY4GfTwmI7p4MKQiLZs4fzagjYpNkzyhEizr7GECjQA72Q7Ci45gz4I3X3DF4moLkJE1Vez3xANZCPMAodw0tDwL7WsABa+1WuG0cNlMCF5y1CPmfk4dv9OfV4vGwiN1JHen2KvqNcvESwDu62i5E9F86bnW3h1vDWh2ZF2u+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874767; c=relaxed/simple;
	bh=NqFXoVWA+2PZO9loa8Rwx9/wjtZ+IWsb6KU7PUwlAa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdhG9snwsig6MVP6ZnC8Wuzvb94+Syht69GYP7d/prtJ9+nGNFOFsFnr2tKZW0O0jczVdFmbN3Y0bymNWY4Q0bSsygdsjxN63z/ddHfaVX1nQ3qRs2cmpTGwmdSu2wlJuALdVYcF8InMdWlMv6F9KzdzfVsoZC24H8H0Wd054eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2+xei8C; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso1626545a12.0;
        Wed, 02 Oct 2024 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727874764; x=1728479564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wUXazfyRhSUrNjSKKHSEO3IW81fhmdgLhhpJA5b0Q9M=;
        b=Q2+xei8CsrcGUimfAWAAq9OP5zI/XpTjMCEzdEUR33vZnBQ14vS2MxNH0Z2X5rbCk/
         7EkDpfuVB95I/vjhW4xMPnrsgaxlHvk8mnC5vrKErRDrds8kYidmXYNB3D7iBGySatNR
         OemNk1Jk00wyxNVv+N+8ZsI4+LOd/+Vh71PSeeiNIm2e4uW9kL4d9F04+LpRvZQ7cR0U
         reEpOmu9MN1q46hvVYiCUgSsP7hZ3gPlNh4eD/tcJgJBWK1skCA3pHJbCL9rXd4ZI7NM
         X9vbfaKEwS7wANf+525wsVOXwS/A8i7bh6ULcZENtr1A7dXnMELtc9j6PZCt2ju+eUgN
         qrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874764; x=1728479564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUXazfyRhSUrNjSKKHSEO3IW81fhmdgLhhpJA5b0Q9M=;
        b=K+5f4/fXwQIDXaAVfmWUQb66A9wn7amlD31Nt9xYGPvdJxjB+C4aMpymbykIcnwzbc
         2PKEAtK/jnS2AIkZwQQusO0/nM6we0yaoUHAUOGy8Nmilbqcgj4/sKo9swmEOtuHYnQS
         6gUGAwUOfqPCRniV54d73FWJEha7wAu12f2RptfwfL+a4zWILwqvQTe24m1LprC3IrPN
         0iTHu5+X0maZTIEdtaqQr/E4D28tfvCtCBg3gVIney3BrRLCn91GB6kBvOd3yLE1AOlP
         0YEmSCkVEfeomntRspTwDfaduuzrqj1sgb8x2GfNTaY+W9hgc443vAtFxXzyHcOI2urn
         prdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvARxTaMOIsukhLTKaCQ1d7qcPz4NqEVeCVrKJgyqypVmWyvwz8P4YGV2QR2DqamIHz8ncjZAPpvLQR50=@vger.kernel.org, AJvYcCXA8kj+nbgHfI6jWjZQMgGfM/micCknh6hMYJwfuVKeqC+4cDpBrT4I4nhdgwtjEr1qsLAXHgX/D5QQXhcY@vger.kernel.org, AJvYcCXoRj2lal+CjOJwB2By5VP7SIXQ9p4CxtDXFWNXsPe8j+eW/vvtoOSSLQj6gHRrhCmpP8EjG9eDsDzb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0UAAcIM86ErA5jQQNLis0fHZteWE3OEVj0iM08fQhQnsANvRk
	rhyunVMNvaYGboT6oI+alBXis93waGBDaKzq9OwyjFN6VblujEf3cTKEyA==
X-Google-Smtp-Source: AGHT+IGiDf4kHlCB1lHtKfJV660SX4ZBQOywQCXDwuelwkZ5JRfajwvG+c8yIPwJoIuAy5Jv8NZsoQ==
X-Received: by 2002:a05:6402:4498:b0:5c8:84d6:c995 with SMTP id 4fb4d7f45d1cf-5c8b1b72680mr2188251a12.25.1727874763930;
        Wed, 02 Oct 2024 06:12:43 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405b19sm7528031a12.11.2024.10.02.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 06:12:41 -0700 (PDT)
Message-ID: <dbe0927e-2d7b-4a32-a155-206566d543a8@gmail.com>
Date: Wed, 2 Oct 2024 15:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU max
 item count
To: Krzysztof Kozlowski <krzk@kernel.org>, Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bin Liu <bin.liu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241001113052.3124869-1-fshao@chromium.org>
 <20241001113052.3124869-4-fshao@chromium.org>
 <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/10/2024 08:16, Krzysztof Kozlowski wrote:
> On Tue, Oct 01, 2024 at 07:27:21PM +0800, Fei Shao wrote:
>> On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
>> can be assigned with a local arbiter (LARB) which has a maximum of 32
>> ports for MediaTek's IOMMU infrastructure. That means there can be at
>> most 32 items in the iommus property in theory.
>>
>> Instead of relaxing the max item count every time a newly introduced
>> device tree hits the limit, bump the number to 32 as an one-time effort.
>>
>> On the other hand, all existing and foreseeable JPEG decoder nodes at
>> this point have at least 2 IOMMUs, so set minItems to 2 accordingly.
>>
>> Signed-off-by: Fei Shao <fshao@chromium.org>
>> ---
>> It's not in the upstream tree yet, but the upcoming MT8188 DT will have
>> 6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.
>>
>> Changes in v2:
>> New patch.
>>
> 
> I do not see any user of this in this patchset.
> 

I'm not sure I understand you: the binding describes the hardware. If it can 
have up to 32 ports, then this should be reflected in the binding.

Regards,
Matthias


