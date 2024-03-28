Return-Path: <linux-media+bounces-8114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED32D8906F5
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 18:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29AD11C31D95
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 17:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5197B44C67;
	Thu, 28 Mar 2024 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="ytSYbPaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta84.mxroute.com (mail-108-mta84.mxroute.com [136.175.108.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADF3BBE4
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711645823; cv=none; b=jGdShxYldE3xbDePL+3lvll1UhpuqJjbwzseP12PUIJc88BYXYgV70fQl9NDIOfqtQqDDGbyazH6cE/pMFUaosk+k4Kk9tePLmp+QAG5WSsuXswj74e2ipTDUntLcJwx0IBLf/FLOMB0qjJ0jtZiR61AVrfXlE8zKFJ0zmhAoMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711645823; c=relaxed/simple;
	bh=9zNP92bNPgp9w0XFvKSF/0xg28mBtIKDRH7jxflanx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlbBEvEKhQbJLeUKEAa5TtCUUe67dd7E0d4+1bjyRr3VDCLiingVoUm6Mf3B1iAUEv/kxjCu/3Fns105UmcJOQZT0vwVCqSHwtipCqccX93ZeypYOtzOJPNZwbrZBWQbKRn0S/ONE5I9DFaXCUNVAnXgiqkiSeDE7O21bFyUz/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=ytSYbPaf; arc=none smtp.client-ip=136.175.108.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta84.mxroute.com (ZoneMTA) with ESMTPSA id 18e8605d28c0003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Mar 2024 17:05:12 +0000
X-Zone-Loop: 73d2059a60aa5bac63bd04119f2d2b3fa1c525075e51
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mZL5hLBkloRsl6YhllysqkuiGbw1qHa4I22VeBcbYtE=; b=ytSYbPafdQBqFW/aT7tiYbrWV2
	vCDSLcj/SXxrXAEOyX7t//p6PPq+Fne+0Kcnb7Ie5h8X63HWNxJBYSLEKNzAA33O4nEE5r6B6WVV+
	EXlEH+oH/+qZRIwHLX4KChloLIYrXkHu4qdajB2S0q8uVSuBzZksOzFF4aS7A9gDlFqdqLEo7l+qw
	t9xKAIgM6QhretsOfuKTDPilYyGXf5PPYMM344OtVOZ9b9lGSFBveuZayUo801/N8eZfKyoM0Se2d
	X1umR6FA73bFEhY8XCAAxFl/Ht6t6hmqVKiTpgfSim60XGUAM587LvOf42kDCig3Q8NY7JUSaZ9C9
	+dBivuRQ==;
Message-ID: <30d886be-cac8-400a-9b2f-dd2ce64b34d8@luigi311.com>
Date: Thu, 28 Mar 2024 11:05:00 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/23] dt-bindings: media: imx258: Add alternate
 compatible strings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, git@luigi311.com,
 linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com, jacopo.mondi@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, sakari.ailus@linux.intel.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240327231710.53188-1-git@luigi311.com>
 <20240327231710.53188-19-git@luigi311.com>
 <586bdcc9-793d-4cbe-9544-9012a665288e@linaro.org>
Content-Language: en-US
From: Luigi311 <personal@luigi311.com>
In-Reply-To: <586bdcc9-793d-4cbe-9544-9012a665288e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: personal@luigi311.com

On 3/28/24 01:47, Krzysztof Kozlowski wrote:
> On 28/03/2024 00:17, git@luigi311.com wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> There are a number of variants of the imx258 modules that can not
>> be differentiated at runtime, so add compatible strings for them.
>>
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Luigi311 <git@luigi311.com>
>> ---
>>  .../devicetree/bindings/media/i2c/sony,imx258.yaml          | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>> index bee61a443b23..c7856de15ba3 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
>> @@ -14,10 +14,14 @@ description: |-
>>    type stacked image sensor with a square pixel array of size 4208 x 3120. It
>>    is programmable through I2C interface.  Image data is sent through MIPI
>>    CSI-2.
>> +  There are a number of variants of the sensor which cannot be detected at
>> +  runtime, so multiple compatible strings are required to differentiate these.
>>  
>>  properties:
>>    compatible:
>> -    const: sony,imx258
>> +    - enum:
>> +        - sony,imx258
> 
> Two people working on patch but no one tested it before sending. Do not
> send untested code.
> 
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

Hello, looks like I messed this up during my v2 (sorry missed the v in 
my format patch) when I took this off Dave's hands. This is all new to
me so thank you for the command used to check, I was only compiling
the kernel and testing that so I didn't realize this needed separate 
testing. 

Looks like it no longer complains when i run
make dt_binding_check DT_SCHEMA_FILES=media/i2c/sony,imx258

with the following

properties:
  compatible:
    enum:
      - sony,imx258
      - sony,imx258-pdaf

If that looks good I can go ahead and include that in the v3

> 
> Best regards,
> Krzysztof
> 


