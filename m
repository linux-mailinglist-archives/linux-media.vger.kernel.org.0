Return-Path: <linux-media+bounces-8141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD9890C26
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02FA21C2195B
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 21:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80CD13958D;
	Thu, 28 Mar 2024 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="h8XynL+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta56.mxroute.com (mail-108-mta56.mxroute.com [136.175.108.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3DC1327F0
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711659747; cv=none; b=oA/zABUGOvnxVijsfPQVzsvr11GNgOl7pQPYIQzu7O9x+rnwRxcSdBxayM6i+INBJlK2bUgIcHwSWvVNr1Jjx0TXHvvNvfl3DrN/m1wbFzCsvCJWqaaon6Svulu3IxxiflS2IaQe8gzxyBp+5B1md4iZOCDfSn9IkRLriVy/FYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711659747; c=relaxed/simple;
	bh=r0EcBPQ3qmpeCX4m58ZcZEDwZXCeT1PRpsmqW991s+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YdMbliknhLnuzuKS/QAyzSLkajF4Q1SX6vkz5NZaEMaROKfU89tSOjorn5OCU2LwCxdTB4KyVEsVwZfpjpJsiZyK9kfbuNnssD95dxIwWqfgOSs82zC42zpAvbZKw+m9FY9GlMRO1vJrBjBrXe2YPxnLHs4kjgFoLA9do7IDof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=h8XynL+L; arc=none smtp.client-ip=136.175.108.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta56.mxroute.com (ZoneMTA) with ESMTPSA id 18e86dee3df0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Mar 2024 21:02:18 +0000
X-Zone-Loop: 436251dc59b884be7e98e00b975e3d8f28c849a45795
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n0BJjZfxDNb/uyF3bBh2pp0ckq9viE9E1DscdmPJyFc=; b=h8XynL+LgJCxtIBV8QoxL5mr/m
	ev7KBLRvh1FI44Uu/Nw6Gc9q5HYuzaORe8rm19V2oFqd5dbEjW7JUE+4+ewSexyZrmHpJF0AN2IIg
	pKUexC3rVtTJNgN9njahSH9UbTXDwti85J8R2TiTnWvA+j4M2PbDcVJSlUdLZZlEH8BqWFI2+o8OR
	NinPlMA4xScARG2ZZaWVJfvu+sy+0ZtNEA5lDuXMqls5/t4Y4S8BWe84VKcVCVk1bezjOAoIxcBh/
	vNE5NchcJTfHxXpKHkXkQ9Ds9q2+FFMaFYeB6+cj05AkMYqnuW0XSjbsnqWKSYnF4WZRE0S+uf8Kv
	VTD5pPvQ==;
Message-ID: <0b6fe14e-c990-4084-bc54-57872aa9ae21@luigi311.com>
Date: Thu, 28 Mar 2024 15:02:13 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/23] dt-bindings: media: imx258: Add alternate
 compatible strings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240327231710.53188-1-git@luigi311.com>
 <20240327231710.53188-19-git@luigi311.com>
 <20240328185526.GA88354-robh@kernel.org>
 <76f999a7-55e0-4676-aa75-8fcd466e046b@luigi311.com>
 <20240328204657.GA314523-robh@kernel.org>
From: Luigi311 <git@luigi311.com>
In-Reply-To: <20240328204657.GA314523-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 3/28/24 14:46, Rob Herring wrote:
> On Thu, Mar 28, 2024 at 01:16:22PM -0600, Luigi311 wrote:
>> On 3/28/24 12:55, Rob Herring wrote:
>>> On Wed, Mar 27, 2024 at 05:17:04PM -0600, git@luigi311.com wrote:
>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>
>>>> There are a number of variants of the imx258 modules that can not
>>>> be differentiated at runtime, so add compatible strings for them.
>>>> But you are only adding 1 variant.
>>
>> I can not speak for Dave but as to why this was added here but looking
>> at the imx296 yaml that has something similar where there are multiple
>> variants that may not be detectable at run time but does not include
>> similar verbiage in the main description. Should I drop this from the
>> description so it matches the imx296?
> 
> Just change "add compatible strings for them" to "add compatible string 
> for the PDAF variant" or something.
> 

Ohh i see what you mean now, this is in reference to the commit message,
it was throwing me off because the imx258 description had almost the
exact same wording. Yes that makes sense, ill change the commit
message to specify PDAF.

>>
>>>
>>>>
>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>> Signed-off-by: Luigi311 <git@luigi311.com>
>>>> ---
>>>>  .../devicetree/bindings/media/i2c/sony,imx258.yaml          | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>>>> index bee61a443b23..c7856de15ba3 100644
>>>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>>>> @@ -14,10 +14,14 @@ description: |-
>>>>    type stacked image sensor with a square pixel array of size 4208 x 3120. It
>>>>    is programmable through I2C interface.  Image data is sent through MIPI
>>>>    CSI-2.
>>>> +  There are a number of variants of the sensor which cannot be detected at
>>>> +  runtime, so multiple compatible strings are required to differentiate these.
>>>
>>> That's more reasoning/why for the patch than description of the h/w.
>>>
>>>>  properties:
>>>>    compatible:
>>>> -    const: sony,imx258
>>>> +    - enum:
>>>> +        - sony,imx258
>>>> +        - sony,imx258-pdaf
>>>
>>> How do I know which one to use? Please define what PDAF means somewhere 
>>> as well as perhaps what the original/default variant is or isn't.
>>
>> Would it make sense to change the properties to include a description like so
>>
>> properties:
>>   compatible:
>>     enum:
>>       - sony,imx258
>>       - sony,imx258-pdaf
>>     description:
>>       The IMX258 sensor exists in two different models, a standard variant
>>       (IMX258) and a variant with phase detection autofocus (IMX258-PDAF).
>>       The camera module does not expose the model through registers, so the
>>       exact model needs to be specified.
> 
> Looks fine, but I'd move this to the top-level 'description'.
> 
> Rob

Perfect ill move this to the top level description and remove that small section
that Dave added

