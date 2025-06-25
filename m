Return-Path: <linux-media+bounces-35852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFFAE7B8C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 11:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BF7179B21
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 09:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC67289360;
	Wed, 25 Jun 2025 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttI+rNfW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51E285C83
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842541; cv=none; b=cS0mtqGSvDezyjqlO+S5/W/U4NjW/DY4UrYIctJbBk1ta2ej/DcFX+TMKnPnDSgV6LkdOv/r1AiKkBfE4tB7fiv3EafwW2dWdsDrrmczmkH5ibLhVvIs83WpXBz/F74d194WRKS0DaLgs/xEfpqkGTSei8gGly5pYL+OTK3EmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842541; c=relaxed/simple;
	bh=SPjJzVPV+Qw61kr8tRqa9j7vhVFDqQQe6iy++Z5TcJo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IBYqiml4/Peomn4UK5Vja879wIumeTzHcmMwW753hE3QoGNWfodruylYgzZOwVZJJQPjEep73CjGFoGGsMHilQkAzvGsNgSs3zTGev7/culOOjKVsR/RT7mfYHojBLIOHGgufVV4bC/HKMdDIkDByeN9hLIdMbo1jloSv9LkVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttI+rNfW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6075ca6d617so1323598a12.0
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750842537; x=1751447337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=;
        b=ttI+rNfWPgHtE6AYxgloNCNYlqmRCBWg5sTpVmuTAsVPUjeDMIK0ZoXME8PVnQSgVa
         SYBb7lyfOuGu+3sKsKMI8pZv6QYXW+K8+1tGFcDgb1gkiTI39YkaPfpdy3XlkQ7HHaKJ
         jk2+yxFBIdqsSEGHQDVe0/gzeDPmUhLh2rmVkhNb24QO6OPcn0XWYkdksnP3PbJG2OYI
         dp4l45w7xDtFFkbv18D3Gkwhb0wAP9/Hzf6rYeWqMjKySd5iZsFORKji2ArXZDB5YRiC
         qhhniRoEgNFAZSnpnSSAPLFiT9zZtKbfub1grAXiqOKfT3hBWG9whrPBcobnku/Rfze8
         MOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842537; x=1751447337;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4YFkttBOfdkPL3gGKS/49o6M91DhM3gW4Sii1oRBm4=;
        b=Bou4YQwQKBUw0eD2K7UeEZk7TWJNgZT+14yHVd2iJlZH2MrDNiLfNOwvm4+4OPveFt
         JiB945+VNdux8bXfaaDGyh8ykFSUozTH6neSCeEPWawy5Rz7IURiVuRwXF5nSy7VqApV
         w+ztSJVaqJ6sCGYkxWBmgUuMKlxKphJsffM0dcQ6EgO8Z+B7pQ9zw+CEGJ6mgjgQd5gY
         Rhmik0WTUd3FGvP8ffGPeYRoyFpZlV4wrguqzgImOrDbr25iwV8+n8NhCkpjBHTFiO4f
         ltbUdcYO7/W1hSA807Ki+l1tjyrkQMG/ew5JA2yKzSMZ2S+t3ri55H9t4KIxprtCwwE2
         iBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJJZzmVdYSUHmfpJxmqLBqTLoArTAO70gnWO3pTZga/SeimN1v9BgqDhF7HOdc/iOc4KviKuV2O155og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80SvPyJ/2fdYSDqF1y+HDI/vketRM0/zNNsj6lu5hmxoUjji5
	94JBFPSYi2U4Q/E9jIzEISZTAnxG4Gq5b12NiN1hMRqumuR3XXUNVTj+geF65C009+ytYh0OruM
	c8Yzb
X-Gm-Gg: ASbGncsfQzIyZLgdhwiRJk2UMUKZ0fm7bZ8Cmm27LYZWSlGhielHfBjxwPfvt/IpbSW
	2HKnL+asXmjAiPpCZj0H8BfSfKStJS1qPrexW5nJguFBLFNubLf7Pw32oI0BsBbpGmjweWB6D30
	r4QApySOw2/0C5zVuDUxzwuq8SuiCC5S+0wzf0vqXdQKAg1Ekhf0kTLsf5vJien5nbjBh9niJrr
	godEBOip+AbOou2ZNgIe2hh9Pmz12PIO1u9k203BZOIKZY5Mzhi9OOw0VhS2wJF962IvYrjbB4v
	hma7wW09oZDO9Vz+7AEz1IwsWtXSDuVwZxqovjJZN1nCjy9CWXHQCpG65Cpdtj5LIl6w75XkgZq
	JOIL6Ow==
X-Google-Smtp-Source: AGHT+IHq4OLHwef19JUx4B3qBHj59T7kHFZYiQRPXfkNBv4goVa8y63ULfzDUAYvAqURYTsCkeQqEQ==
X-Received: by 2002:a17:907:97cc:b0:ade:40ed:9f3e with SMTP id a640c23a62f3a-ae0be531812mr74085166b.0.1750842537468;
        Wed, 25 Jun 2025 02:08:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ae6ff383sm246172566b.172.2025.06.25.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:08:56 -0700 (PDT)
Message-ID: <8438a336-94d3-44e1-9e92-1fac0b2a602d@linaro.org>
Date: Wed, 25 Jun 2025 11:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
 <2b32b8ed-c841-4862-afab-c583da644217@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2b32b8ed-c841-4862-afab-c583da644217@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:05, Krzysztof Kozlowski wrote:
> On 24/06/2025 12:21, Daniel Scally wrote:
>> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> You changed the binding significantly - adding new properties (which do
> not even follow DTS coding style).
> 
> This invalidates the review. You cannot just keep growing it after you
> received a review.
> 
Although if it is conflicting with my earlier message that some earlier
changes - reset properties - were trivial and review should be kept,
then apologies. Adding new, custom, vendor properties is not trivial.
Adding obvious existing properties usually is, although I understand why
it could also be a reason to drop review. In any case sorry for
confusion, but this needs re-review.

Best regards,
Krzysztof

