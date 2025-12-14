Return-Path: <linux-media+bounces-48742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6CECBB8FB
	for <lists+linux-media@lfdr.de>; Sun, 14 Dec 2025 10:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BB530056D3
	for <lists+linux-media@lfdr.de>; Sun, 14 Dec 2025 09:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE4C2C21C5;
	Sun, 14 Dec 2025 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="K50dNiAK"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D06199FB0;
	Sun, 14 Dec 2025 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765704929; cv=none; b=UMRuwRdBSdT/c8U5pIiT0hvqjs2pFsFcpV2J5MmYfnkRHeGPCixT5Otc2Lu8MJeYHsWV16Yh4Ga/DyKcTjZkmczjo4/5dY+/N+Q6D3kSrhhQ7tVVl6k2rxYGYfQiK2JdY6YqwfiJlpDXsX6F0c4aFiTtONQxQrR+UQis5ZQmcao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765704929; c=relaxed/simple;
	bh=z4uLRSI/RsfVSf3WSE/RzhaFVNkBYN5eW1kJcBuDefY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UE1Q5iA3PtZCcMc3jMh08+dWgT8UWoK/DxWS9posmF5qm6OOs3JHRPJt20gZNyUAELI9ajauoMjk9tM0ea/Iu2ESuD0/8+l89FkLQl/W6unwIytUqJgI5JAeIJlFN7sjATi1ZjWHyAYk8E8zayZt1zCzT4sBDZf1N1wMWOT0GDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=K50dNiAK; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id A83A65340EB3;
	Sun, 14 Dec 2025 10:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765704914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tMgjTzgxKuwd4mawBjuWpHsFIkkq8ldcQ3anb9nOhyk=;
	b=K50dNiAKSIxpsuOyd3/iSylE8L69IURehIHgwD1JZBhIoRDuNcfuHiqtC7IwDXIVmlgfmW
	Epl5NbGbRa5OXluAa96cM4CNv7h8Y4HsYHC8OhiBPu/8eakpr2+J9J4RTO2/zYOwPck4XC
	yKBrYabSoQtOHClbi8Q5ONJ6UZD0ZrY=
Message-ID: <b9b84317-a392-4f1e-aa8f-351e92c678a1@ixit.cz>
Date: Sun, 14 Dec 2025 10:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
 <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 xsFNBF5v1x4BEADS3EddwsNsvVAI1XF8uQKbdYPY/GhjaSLziwVnbwv5BGwqB1tfXoHnccoA
 9kTgKAbiXG/CiZFhD6l4WCIskQDKzyQN3JhCUIxh16Xyw0lECI7iqoW9LmMoN1dNKcUmCO9g
 lZxQaOl+1bY/7ttd7DapLh9rmBXJ2lKiMEaIpUwb/Nw0d7Enp4Jy2TpkhPywIpUn8CoJCv3/
 61qbvI9y5utB/UhfMAUXsaAgwEJyGPAqHlC0YZjaTwOu+YQUE3AFzhCbksq95CwDz4U4gdls
 dmv9tkATfu2OmzERZQ6vJTehK0Pu4l5KmCAzYg42I9Dy4E6b17x6NncKbcByQFOXMtG0qVUk
 F1yeeOQUHwu+8t3ZDMBUhCkRL/juuoqLmyDWKMc0hKNNeZ9BNXgB8fXkRLWEUfgDXsFyEkKp
 NxUy5bDRlivf6XfExnikk5kj9l2gGlNQwqROti/46bfbmlmc/a2GM4k8ZyalHNEAdwtXYSpP
 8JJmlbQ7hNTLkc3HQLRsIocN5th/ur7pPMz1Beyp0gbE9GcOceqmdZQB80vJ01XDyCAihf6l
 AMnzwpXZsjqIqH9r7T7tM6tVEVbPSwPt4eZYXSoJijEBC/43TBbmxDX+5+3txRaSCRQrG9dY
 k3mMGM3xJLCps2KnaqMcgUnvb1KdTgEFUZQaItw7HyRd6RppewARAQABzSBEYXZpZCBIZWlk
 ZWxiZXJnIDxkYXZpZEBpeGl0LmN6PsLBlAQTAQgAPgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
 AQIXgBYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJl+KksBQkPDaAOAAoJEGACP8TTSSBy6IAQ
 AMqFqVi9LLxCEcUWBn82ssQGiVSDniKpFE/tp7lMXflwhjD5xoftoWOmMYkiWE86t5x5Fsp7
 afALx7SEDz599F1K1bLnaga+budu55JEAYGudD2WwpLJ0kPzRhqBwGFIx8k6F+goZJzxPDsf
 loAtXQE62UvEKa4KRRcZmF0GGoRsgA7vE7OnV8LMeocdD3eb2CuXLzauHAfdvqF50IfPH/sE
 jbzROiAZU+WgrwU946aOzrN8jVU+Cy8XAccGAZxsmPBfhTY5f2VN1IqvfaRdkKKlmWVJWGw+
 ycFpAEJKFRdfcc5PSjUJcALn5C+hxzL2hBpIZJdfdfStn+DWHXNgBeRDiZj1x6vvyaC43RAb
 VXvRzOQfG4EaMVMIOvBjBA/FtIpb1gtXA42ewhvPnd5RVCqD9YYUxsVpJ9d+XsAy7uib3BsV
 W2idAEsPtoqhVhq8bCUs/G4sC2DdyGZK8MRFDJqciJSUbqA+5z1ZCuE8UOPDpZKiW6H/OuOM
 zDcjh0lOzr4p+/1TSg1PbUh7fQ+nbMuiT044sC1lLtJK0+Zyn0GwhR82oNM4fldNsaHRW42w
 QGD35+eNo5Pvb3We5XRMlBdhFnj7Siggp4J8/PJ6MJvRyC+RIJPGtbdMB2/RxWunFLn87e5w
 UgwR9jPMHAstuTR1yR23c4SIYoQ2fzkrRzuazsFNBF5v1x4BEADnlrbta2WL87BlEOotZUh0
 zXANMrNV15WxexsirLetfqbs0AGCaTRNj+uWlTUDJRXOVIwzmF76Us3I2796+Od2ocNpLheZ
 7EIkq8budtLVd1c06qJ+GMraz51zfgSIazVInNMPk9T6fz0lembji5yEcNPNNBA4sHiFmXfo
 IhepHFOBApjS0CiOPqowYxSTPe/DLcJ/LDwWpTi37doKPhBwlHev1BwVCbrLEIFjY0MLM0aT
 jiBBlyLJaTqvE48gblonu2SGaNmGtkC3VoQUQFcVYDXtlL9CVbNo7BAt5gwPcNqEqkUL60Jh
 FtvVSKyQh6gn7HHsyMtgltjZ3NKjv8S3yQd7zxvCn79tCKwoeNevsvoMq/bzlKxc9QiKaRPO
 aDj3FtW7R/3XoKJBY8Hckyug6uc2qYWRpnuXc0as6S0wfek6gauExUttBKrtSbPPHiuTeNHt
 NsT4+dyvaJtQKPBTbPHkXpTO8e1+YAg7kPj3aKFToE/dakIh8iqUHLNxywDAamRVn8Ha67WO
 AEAA3iklJ49QQk2ZyS1RJ2Ul28ePFDZ3QSr9LoJiOBZv9XkbhXS164iRB7rBZk6ZRVgCz3V6
 hhhjkipYvpJ/fpjXNsVL8jvel1mYNf0a46T4QQDQx4KQj0zXJbC2fFikAtu1AULktF4iEXEI
 rSjFoqhd4euZ+QARAQABwsF8BBgBCAAmAhsMFiEE13oJz+7cK71TpwR0YAI/xNNJIHIFAmX4
 qVAFCQ8NoDIACgkQYAI/xNNJIHKN4A/+Ine2Ii7JiuGITjJkcV6pgKlfwYdEs4eFD1pTRb/K
 5dprUz3QSLP41u9OJQ23HnESMvn31UENk9ffebNoW7WxZ/8cTQY0JY/cgTTrlNXtyAlGbR3/
 3Q/VBJptf04Er7I6TaKAmqWzdVeKTw33LljpkHp02vrbOdylb4JQG/SginLV9purGAFptYRO
 8JNa2J4FAQtQTrfOUjulOWMxy7XRkqK3QqLcPW79/CFn7q1yxamPkpoXUJq9/fVjlhk7P+da
 NYQpe4WQQnktBY29SkFnvfIAwqIVU8ix5Oz8rghuCcAdR7lEJ7hCX9bR0EE05FOXdZy5FWL9
 GHvFa/Opkq3DPmFl/0nt4HJqq1Nwrr+WR6d0414oo1n2hPEllge/6iD3ZYwptTvOFKEw/v0A
 yqOoYSiKX9F7Ko7QO+VnYeVDsDDevKic2T/4GDpcSVd9ipiKxCQvUAzKUH7RUpqDTa+rYurm
 zRKcgRumz2Tc1ouHj6qINlzEe3a5ldctIn/dvR1l2Ko7GBTG+VGp9U5NOAEkGpxHG9yg6eeY
 fFYnMme51H/HKiyUlFiE3yd5LSmv8Dhbf+vsI4x6BOOOq4Iyop/Exavj1owGxW0hpdUGcCl1
 ovlwVPO/6l/XLAmSGwdnGqok5eGZQzSst0tj9RC9O0dXO1TZocOsf0tJ8dR2egX4kxM=
In-Reply-To: <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/12/2025 01:04, Vladimir Zapolskiy wrote:
> On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
>> voltage from the description.
>>
>> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda 
>> regulator descriptions sdm845")
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Added only Fixes tag for the initial commit, not all the copy-paste
>> propagated ones.
> 
> Generally it should be possible to specify a list of Fixes: tags.
> 
> However, despite the change is the proper one, there is an opinion that 
> Fixes
> tags are not applicable to dt bindings with a given reason that only 
> executed
> code can be fixed. So you may be asked to remove even a single Fixes tag.
> 
>>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p- 
>> camss.yaml
>> index 019caa2b09c32..9009cfe993d75 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>> @@ -130,7 +130,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280- 
>> camss.yaml
>> index ee35e3bc97ffd..cb922f90fe900 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>> @@ -129,7 +129,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp- 
>> camss.yaml
>> index c99fe4106eee9..2231d7216f62a 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>> @@ -268,7 +268,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>   required:
>>     - clock-names
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670- 
>> camss.yaml
>> index 35c40fe223767..8e6ca94c88695 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>> @@ -95,7 +95,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845- 
>> camss.yaml
>> index 82bf4689d3300..d50e096b900db 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>> @@ -211,7 +211,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>   required:
>>     - clock-names
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250- 
>> camss.yaml
>> index ebf68ff4ab961..ccd2d024bfd10 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> @@ -300,7 +300,7 @@ properties:
>>     vdda-pll-supply:
>>       description:
>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +      Phandle to regulator supply to PHY refclk pll block.
>>   required:
>>     - clock-names
>>
> 
> As for the change itself it is good, I'd prefer to get a correction
> to 1.2V in the documentation rather than a complete removal though.

What I'm seeing, while the vdda-pll is usually close to 1.2V, it seems 
to me that's not everytime the case.

Can you confirm it should be exactly 1.2V, if yes, I'll clarify it in 
next version.

David>
> In any case,
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

-- 
David Heidelberg


