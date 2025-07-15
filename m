Return-Path: <linux-media+bounces-37729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E77B051DD
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D674E2057
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 06:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169226D4E1;
	Tue, 15 Jul 2025 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hiUAmNQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8EB26A0ED
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561323; cv=none; b=mFpO66LWf0cVGpxwSf6csggLLVZ3dduLIPEIZMILRBwcr3x2Cyp+ukibnLOnSDuqU0y+zf/AoK9qawmcWiksasbhCliJ/TFdufWBRvOgKrv2a9st2vfH5+DntinIFiLi/5J918JHbUjAdP59efgnifjBT1mnJHciVxFGr7KnIy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561323; c=relaxed/simple;
	bh=p3LPkjq+uZRwh2andFI5/6qsRT2nuhoh6ljdJGtYBr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpuolgx4NKv+QqHjWNPiSqDYNml9X2503E+rk3e3S/YXdmfKQyh2X2R4GPN3+Z0kGoZ5GKhO9HPotX2kjvIjIAQnojbh/k9ITAbXZDQue6aK/a2Yoq/Rdv5RWczoLnmtMlJ9emRMe2fXAbPXP3eNVFmAEzjUg2ATfOVdy5p3rgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hiUAmNQJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32f474ded39so4664801fa.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561317; x=1753166117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWk+3HwoE658WoVjEcyuNKZKmpUhfuUyOmAf2RcohLk=;
        b=hiUAmNQJCN0jsnmgo54T2V+NhPaaXi8OmgkDeQ7a4XDPVeOz3Ub6H7Y5yFk5R9on1n
         bMjrGigb9PBQFesc26UZZkh3tYWIAW1Zi9/NfKNr2icpwFRnCP1E6voKVwCzW4HeLzfD
         +abHHoTyZbXz81G1WIRxktNTArxCJJQLmI3SVRS5zHMICk8rJT4xxjRvo//fTaD3A2QO
         IbDaH2/w9J13owz6pKWGg7Zreg6OZlkFwk2itPfNxkGh7F6+E0rbJINDU+wc7edY5Tj5
         lS8YI5gaDoE7QEJPcpKt4fguwwtrI3m2jIogC0IQmE5+Ph//4wdlftQLsRmdNBZoyn1x
         kpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561317; x=1753166117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWk+3HwoE658WoVjEcyuNKZKmpUhfuUyOmAf2RcohLk=;
        b=WS5Wt9ykWzxS7OLpiO2WkP2qBphqt+LMKN7GjCAMffSUPDLw/T+xo5QY5HaplJGBoS
         NsNTfoeiznNnlXLSt1J0DigA0dyCu5i1F0A6IcmkU3AqTx6dswA7MQ0QFXQAffpIYC9G
         1qy6Ir/xD6cB2VqdMwBxWYGLbk+Mp/JHhkE2FGmw1qsTY/+lurwlGhfIw94TtkZJ1oFx
         NXFddw5NJV9Ocj4bL/dkchkGPSlhbwy5q5GWFTXEFdrTW6RloWVUbw0ic6m+oYN4rNpv
         bpPrKJXyarQZI0upufZ/wODTVap8Jt5/UYggzIsJWI/YOWi7orh8u3v1VeQOeHgLxE5Y
         UaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6y7NuM06Kjl+WdelLbc2dlxMrsxHsdLF1ODT2D1T007nI5vwrUtumn4+OeCPrTUzQGZk8cZx6icrdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7IDxE8WUYvnrvCpcFJO/BKvfWGrx7rWGdos0AUraRgLvCjGr
	ihdbnoF5+lYON2Qhqbf9PXnt8BHZCOn7u2D63yl9y9yNsKl/lD22xSurmSC/lqL+pEM=
X-Gm-Gg: ASbGncvOEQjjXLYmggTWtDoKn2kGcrYvv9/dmkxMAEdW4nVGGQod1rXMfBS9KWsqOOX
	3zUTVeRwI8SKViqx/EK9ryvD3xDbkAXxWYO2jS/akByEWw7kSuD+/73SFZmX1J2qSNoR3rhuB7E
	qsbSkXDqAG2znT3rVPe1BNYzUkBqMdoCYmVTmuI1JDmSRUlZaqh4jXnBR0NQuPvDaj0kE+AyKqK
	YqK6flSktlm7yugQCgdRn16sRYnAIzDT4zy9cd1upa96D5OLa43I/16FcDGaa/WH+mttIp9Q8VZ
	iX+YcK5lYY47EveMptPHJh2FL0N54/BTK6R30HgyT00Zc+uuxrMF2rvk0rA7SteBDYxvCJIy+4A
	oHfbYLGSEzb3WqRusCgxDp4PFYP/NoyzWefW+coJUOUHxXyxPJ74ukzb6W75/ujUuUDTR0OK08s
	LO
X-Google-Smtp-Source: AGHT+IG21/AaIAze5CnrFzbotIk5+WCyNnr4M3ziM12QE2WUONELVSCj8ppEhywifIeaLqF5Jft+XA==
X-Received: by 2002:a05:6512:3b24:b0:558:f60d:d4a1 with SMTP id 2adb3069b0e04-55a1fd758c0mr46377e87.5.1752561316877;
        Mon, 14 Jul 2025 23:35:16 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b736d5sm2167082e87.213.2025.07.14.23.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:35:16 -0700 (PDT)
Message-ID: <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
Date: Tue, 15 Jul 2025 09:35:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/25 03:13, Bryan O'Donoghue wrote:
> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>
>>> I think that is genuinely something we should handle in camss-csid.c
>>> maybe with some meta-data inside of the ports/endpoints..
>>>
>>
>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
> 
> All the PHY really needs to know is the # of lanes in aggregate, which
> physical lanes to map to which logical lanes and the pixel clock.
> 
> We should add additional support to the Kernel's D-PHY API parameters
> mechanism to support that physical-to-logical mapping but, that's not
> required for this series or for any currently know upstream user of CAMSS.
> 
>> Please share at least a device tree node description, which supports
>> a connection of two sensors to a single CSIPHY, like it shall be done
>> expectedly.
> &camss {
>       port@0 {
>           csiphy0_lanes01_ep: endpoint0 {
>               data-lanes = <0 1>;
>               remote-endpoint = <&sensor0_ep>;
>           };
> 
>           csiphy0_lanes23_ep: endpoint0 {
>               data-lanes = <2 3>;
>               remote-endpoint = <&sensor1_ep>;
>           };
>        };
> };

Don't you understand that this is broken?.. That's no good.

Please listen and reread the messages given to you above, your proposed
"solution" does not support by design a valid hardware setup of two
sensors connected to the same CSIPHY.

I would propose to stop force pushing an uncorrectable dt scheme, it
makes no sense.

-- 
Best wishes,
Vladimir

