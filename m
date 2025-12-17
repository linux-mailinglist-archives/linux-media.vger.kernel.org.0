Return-Path: <linux-media+bounces-48987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A41CC7A8E
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8360330BD446
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C5234214C;
	Wed, 17 Dec 2025 12:35:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42B2459F7;
	Wed, 17 Dec 2025 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974905; cv=none; b=DfGUyAFGU/tzp2khfKMZ5HyUFvvjLheyTXz68Pp6Y2TqI+t3cM+dXXnwL06EmmLZ97gJVgvlOzGfQVAqSkp+SNyd86c6iEBmrUWHcTEYABalaiyra+TuPW8FBNIM4X5NCB7R3EcR26snzFaCoBFFm+zpzAAYadWNrTZ/gJbU8IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974905; c=relaxed/simple;
	bh=ZqAVxzr322sjmc8RT3rLPlDt5YmUWMQ/CCfYoMjkEZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHUMOkCn39vacA9qyTbaYcy39qOGiLz5hp6K7PlhXUPhzniQRS0faIwWlgoFHK1h6znOafqa5/5vofwuPNhCjtctWHI6Kx7i8iiFKy1/qQEZ7Be0PS5C87T6ZO3eFAA2TVxiyWup3OqlF90SsEXuQzuHV0QA7oiWRCtDR1Gk7/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 5118410DE9CE;
	Wed, 17 Dec 2025 13:26:05 +0100 (CET)
Message-ID: <569a9b01-2a95-4e1d-819e-f6445ee55375@emfend.at>
Date: Wed, 17 Dec 2025 13:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: imx283: add clock-noncontinuous
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
 <20251217-imx283-ext-v1-1-906a762f592d@emfend.at>
 <2c7e7b96-f9f4-4875-9aab-0f3dcaf6baf2@kernel.org>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <2c7e7b96-f9f4-4875-9aab-0f3dcaf6baf2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

thanks for your feedback.

Am 17.12.2025 um 13:03 schrieb Krzysztof Kozlowski:
> On 17/12/2025 08:06, Matthias Fend wrote:
>> Add the optional clock-noncontinuous endpoint property that allows enabling
>> MIPI CSI-2 non-continuous clock operations.
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
>> index e4f49f1435a5c2e6e1507d250662ea6ecbf3c7dc..a91695f5618767ac851e5bc72b347a21da77c52d 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
>> @@ -59,6 +59,7 @@ properties:
>>                     - const: 3
>>                     - const: 4
>>   
>> +          clock-noncontinuous: true
> 
> Drop, it's already there via referenced schema.
> 
>>             link-frequencies: true
>>   
>>           required:
>> @@ -99,6 +100,7 @@ examples:
>>                   imx283: endpoint {
>>                       remote-endpoint = <&cam>;
>>                       data-lanes = <1 2 3 4>;
>> +                    clock-noncontinuous;
> 
> And updating example just for this is rather churn.

I thought it was worth the change because the example now reflects the 
original (before this series) behavior of the sensor.

Do you think I should remove the entire commit from the series?

Thanks
  ~Matthias

> 
>>                       link-frequencies = /bits/ 64 <360000000>;
>>                   };
>>               };
>>
> 
> 
> Best regards,
> Krzysztof


