Return-Path: <linux-media+bounces-34584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D5AD69AE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F4216B870
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 07:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864C321FF44;
	Thu, 12 Jun 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBktUalm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470522745C
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715044; cv=none; b=YjHVEiV9Us77BvaPy6TVuTUKggU7nujOYm4Ao9akCvkp9yqO1yjYd7zP3bKBurQdE1MJgAbMhBalHq0snnHPrZ01e9lk1Q9IY9sJaOIIsmsl/bG6ElOKv48b5rqqSC+Uab82ua0IKvaRKiEqRvPyCossb+3Aruzyy1thY0omKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715044; c=relaxed/simple;
	bh=B3iRgb3/okZTBArjeqbZVw5ekxMbcSQohTZ/71If6do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BI/ffZLjKULcpAV7cZw7lsKbyR67pWZAtlueeF75qDECWFxIw8/G3zHWyy9nuFy3dKZpmc6r32ZlJTBDQ52fISEuwkLRpnUi8onWL6+IFQGrKWae2b6wKPIqViVgd9vC1Y0uAepN7lefQQpdPmy4XGygk1VhpGrPmuoWnX0eIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBktUalm; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ae0e2e4daso758851fa.2
        for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 00:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749715040; x=1750319840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Njxe4VDeQqskl8RbbDG5OxTyzSOM+gRWrkOl+amVxQ=;
        b=eBktUalmwexAvppsCdFpQRWjEMfwgwjuLNzVqW2lH2eZFA9z1Rw993iHcpcfRGxXdO
         2kdX6UjeqpiHYoET9Ka2oCJ5NvGV1pXa0DPvpr9sM209jmpZZDryK5IDotQ5D8YL128n
         ZmTlfn1z57kEBlw8mooGX3ONedqYipN+UMEDzxaIicQ4QA5hJEVHdiRgfmNjteY2mo+A
         9PH1JHBKylcrlGzkSiNXL75D/V+78YGU8aDf7FH4z00McVUO+OoLu7LTcn+JroOHKuQX
         TT3OOqD9Iylylq2OmKGH9eg+je0h9Ubhx8umzlPGcNRJ1s5tFCZQtmYnMt2/1rY0Qd8B
         ih9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715040; x=1750319840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Njxe4VDeQqskl8RbbDG5OxTyzSOM+gRWrkOl+amVxQ=;
        b=vauWdFiAB+2inYmABaDP+TjYjx4BAV17IuilHsoxzHq8b73PeZVHWUCvm8COqcHzwM
         9Oc14jdKCPXpVqLyjSwS7eQ6vIjxoePh6FO1sZHXvHtU8RxwcgyM6xof3koD9Ri0ZAPM
         kXDjCU6cfBSGbqC0HX/NsBF+k1scNEpvaHM7IhDPZ3a1ynd5S0K+3rEYKjuT5scK84sy
         D4ug7MZ6ypg6OunWERnWvJWXmyiFq6zwKluBK4a23llAYQUb/5evMSmD7zuVVc9t2f+c
         GYvg15La9DhQDK2nlHtB3dUGCfi4KeCOvMd0dsK+VQjShEFJcyjo+qoXPrDtheM609OG
         vU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBEhyIWAQSKW+RJS9rer+S2g7SC9XfJvYmqEjxPPFSEi+3GvT+J636rujxtYU5r8MKJSP0U0mqUv2JvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywori5c8IfL0cF5em5osVzhSVDXa8GxX98oEHOfCOczbXLVR1KU
	64MWjYs4Ss0srRDWsLfQf11/BufHy3SFaWwV0uE6YHEwlaBlOXJG456wndQWo1c73xE=
X-Gm-Gg: ASbGnct2HjBoms8I+tEiqUGdlluV+D4ZtjabwgJEqyvThvT6XMcEwQ/6pXiU8Dck0Wo
	SjMSqkPBBgke+xV3wdChRqtgXswG7ug6mo+fwxV8ivL24VxAf90N6sx7yxejib2QqI2GeQCq2yy
	tzKf+p7pdh6agP5wA2y4bbEO8RA4Uywq9uh8MwWJP1fi6WTV29pQ/vkxBYYKA9nponqFBsgwpOM
	bgkbLE2QDi29nVKoncdkzgd58Lwrvl04qQt3FtT1hSCZQn4z4040nrHj0aeQHCR6j+egj6X4NSF
	XNf0MaQ1gf7kZx0ws3Ul2o6cp8uYdcCfebgov2Me9JJD8BfJGTRuVjhfarltGcC51h+uR1iWpVh
	3ziq8oX8FPEfvLQDGh58V1U8Q8C6KYNeezW7eVsad
X-Google-Smtp-Source: AGHT+IFHU/lXepzUTc3oxGGH3lT2WQ6xjtIivg7J8n5iJaf2/KrDDzxT+FW1Te4zVmqO5ogpYbzlzg==
X-Received: by 2002:a2e:b8c9:0:b0:32a:bdc6:a741 with SMTP id 38308e7fff4ca-32b21cbc160mr7056691fa.3.1749715040347;
        Thu, 12 Jun 2025 00:57:20 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f2e9sm1360191fa.11.2025.06.12.00.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:57:19 -0700 (PDT)
Message-ID: <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
Date: Thu, 12 Jun 2025 10:57:18 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 10:39, Krzysztof Kozlowski wrote:
> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>> RFC verion of the change:
>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>
>>> Changes from RFC to v1:
>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>> * added 'clock-names' property,
>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
> 
> 
> Now I noticed this... weird change and clearly a no-go.
> 
> Device binding cannot be generic, so it is not good enough for now.
> Please write specific bindings for specific hardware.
> 

Can I add platform specific changes on top of the displayed generic one
like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
etc?

The generic compatible is sufficienlty good for adding the enhanced
CSIPHY support to any currently present in the upstream platform CAMSS.

Obviously I can rename it to something SoC-specific, but then a question
arises, if a selected platform has to be a totally new one in the upstream,
or it could be among any of platforms with a ready CAMSS, and a backward
compatibility is preserved by these series and the new CSIPHY dt bindings.

--
Best wishes,
Vladimir

