Return-Path: <linux-media+bounces-6194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2486D1D6
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 19:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0F6DB21C8A
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 18:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C785D7A15A;
	Thu, 29 Feb 2024 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruhl0gIg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725FC7BAF0
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230539; cv=none; b=XdA/pHF48IIieVnOR4aMYVzHLZbjg8Yo74ndMOqwponl8omAaGhAWm6tVY5DslTGbe6e9rOc60ajDDGztRSbIV07b1wqUnBWg69EJ7ZFwilzklhokRWuYiq1uGNNvI3pD/HmU+5vzeUMBP8Qu/rNfctR9prIfY+rMHa/bQAMGKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230539; c=relaxed/simple;
	bh=Q3jL8Rb35+E9HbPrXye9ZFLN9pp0nAFTSj5e5nQFR5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQ9Uw94DLb2OobIWRplmK87ZvHNA1Zw0KRMiXgLG1TnrPXGbys3vFodPQnlt6+1CsvdX4/LKogOK3kYufAR7X8AQ8sYymAJjI4qT7tiRCaIM9L4hfApXIn3IQtsNXP8Yr2CXoU+Zkqxs0gcSWngW2JPN+kFvJe2kMFd8bOgJTEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruhl0gIg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565b434f90aso1964579a12.3
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709230536; x=1709835336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJj8CibPtiDGTyDdaOYw2qAPSJgtV7hnAYPGEUYzkb4=;
        b=ruhl0gIgHEtfw6Ey+baCLo6AmwqEd/hUjqS5OQ3YPOz6VamHj0rsNZciV6B2M/Wj7g
         GIC8QQFLTWtI8t+14dCHxhQJhAO6VZUVNxWcQT+Lgn9AReArqW+EFEej4Y8t3fuAXNWx
         E9JipGOchhYvxAwN29UtfkOG2ZHxADFZGCUzZuxEVUJQUUSFuiFsxvN7H8T0jglyKJUK
         q/qgQym1B/Rud3YqGlWR2O29u0goxE6DhiNacEIJo2fjb1e2heoxU77h9+8nF+tk0Fi7
         F5WxKexiO7Z1YqZStD5kDRnM3A4flMI1/Sh8RfCJHVzISOWz7BI0uoaL9KWqK03y1cKA
         2reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709230536; x=1709835336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJj8CibPtiDGTyDdaOYw2qAPSJgtV7hnAYPGEUYzkb4=;
        b=P2Jj9pkTqqrUkUTOYkusyN1cQe516oKFFCzaYsbakc6IjmAj5B1txCOXPMWIhzOlsL
         dDhiieBjzyDOVviRB0UzbINkl8I7otZbLCJg3cI8pnVhuUUUEDbrrV+860+7ecij7SMG
         B1LgUYUSztt3yCpcrLvAX8mnuV1zgp+mUE4UdBj5V2WeAczygV3MB4h30AuNhwXnVFj+
         x9Qr7SQlAooYhshRgdauHSzQ+BGk+45r3JCoinQwB/vO8zm4nMZcw183d7/DcR4bJPtz
         nZ+POiWS1gqyvNOFR98mkt6hwzn4cLexTtJhNKD+zD3piHpfhqp8uXlWBf/XLowyAEwp
         tIkg==
X-Forwarded-Encrypted: i=1; AJvYcCVFL1zqvh1Wo1N10DBw+7DZ2PHMSr8eH5bBQFHGRAh5rGUrhixGs2yra+1rUdcNq9GTEI1NNcBEUhmIHsLaXkatfTQ0f1DS3ijPKh8=
X-Gm-Message-State: AOJu0Ywslj3t5X1UmK84wXC6gHCDen8iXVJowIY9owB6VX48Aw7dAkqw
	WOS36Sv9csnAipm/O5w4f6Z+DmB99WJPxPOgasdIi1wn4z9EWMRs8bfGPPrLtKA=
X-Google-Smtp-Source: AGHT+IFwraYz08DtS7ouTn6NlMiu1ZRPB+bcAgMZrz+0gMXTVRDI94gjd9ajv9FZHvR0E4ZkA16HzA==
X-Received: by 2002:a17:906:b891:b0:a43:f170:bbdb with SMTP id hb17-20020a170906b89100b00a43f170bbdbmr2175503ejb.71.1709230535936;
        Thu, 29 Feb 2024 10:15:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id a9-20020a170906244900b00a43ab37c3besm906314ejb.195.2024.02.29.10.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 10:15:35 -0800 (PST)
Message-ID: <df7f2b66-fd16-433a-b55b-ea8dc807fd96@linaro.org>
Date: Thu, 29 Feb 2024 19:15:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: imx8mn: Use single port for ISI
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com>
 <20240223140445.1885083-4-alexander.stein@ew.tq-group.com>
 <CAHCN7xJ7uGXL6BF7CCvtqVQHy8X+x5nxJc+HS2_Mkd=EBT2g5Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAHCN7xJ7uGXL6BF7CCvtqVQHy8X+x5nxJc+HS2_Mkd=EBT2g5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2024 16:29, Adam Ford wrote:
> On Fri, Feb 23, 2024 at 8:09 AM Alexander Stein <
> alexander.stein@ew.tq-group.com> wrote:
> 
>> The ISI on i.MX8M Nano only has one port/channel, so use the single port
>> node. Fixes the DTBS_CHECK warning:
>> /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node
>> 'port@0', #address-cells/#size-cells are not necessary
>>
>>
> Should we add  fixes tags to both the bindings and the dts?
> 
> adam

No, because original code is correct and we are just choosing here one
style over another. "style" fixes should not be backported.

Best regards,
Krzysztof


