Return-Path: <linux-media+bounces-42162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2EB5117F
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2541756092D
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5788311966;
	Wed, 10 Sep 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7kf9Hgn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AA310627
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493320; cv=none; b=I6uCYJABDbMtao90majXC6VtyCRHWCYa6wKy8Le2xJuqtkyY3i9eBPcPxIYxNSCLryR8v2OQp0tru3fE21pbOV801+3IlRua9Ispwd7pLMN1ax+MyDZr1XfxHtAm8+5A2DRUC/WPI9bOYRO8uKCKffF/VFa/VE0bQAnCBp6dH6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493320; c=relaxed/simple;
	bh=6pBqardOFH33jygFUEKtPxkKJseqnqQZsdOrvgwU+5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9Zo+PAJPq8eQmEBnLK+KA6xNScGSO7Ktt4UIq08DKRjj/6a9amOLUErGDxQqDDuMbVXeKGgL5hLKUL5virBmndAhSOQEZhae2W5fGZXRXNj4BmvvfqVHzJDVOKGX+l7ItbWZ6+nroLezyT0B3MzVLtPI0jqpT5OW1MqtkB/8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7kf9Hgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7cvRv012367
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=; b=m7kf9HgnKQ/9rzas
	V97f3QsliMHcaYhWLmqyotcd0N5a2Nc+TwfOuH5XZv5YwYmEy8Xjh934QM8uAD3o
	TIvq0cALJVZadIZEnlNdEWVONaZpEtMPGqoFEMXlHYxWHLfz5EE63RDMhjRTM74v
	7GCvYtr+wgpdagFTCDTSYzPwflzD5eSPRkUY7Di0CtSKvdP1K7zXFGan3lAbly1i
	lB7QtZZe+uFapwsmom7T2nrCRMMOzPgGpg0fD7KyO/OEzrvQ10yGnDzhTs55ZYJo
	81l4sA8n4cDZ6ECkANElJncW6OUleHppTwnX3GTz6qbg3t+mSoDT9CuX4urb9Xrw
	F678AQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3203-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:35:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b604c02383so16304831cf.2
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 01:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757493314; x=1758098114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdZlGbXkoykBItIhC2uuPRcWMxj3GO69cBZWAldVw3M=;
        b=dChMtUZEIJ7yauWo8BAGFRFnTXZDNtPntyZjlpxkKMV82ZZNAmEqsYMRRhLe5OgLmU
         yrncHq/sigG20YF8TKLajx/MoGiGWJktDagt7pORV7mvw20FMXc8QGHvHLB6P5CtjrMr
         Zqhb6Izexv8R7D7Dt/t3HkF9b7el6IAFj+ots40pvKpo5/erNCGaoz59Uf2scLHc97iT
         WFYJy/hVanMshQu1comDGndSA7gV1mMP6Y9i67XB+5f4lvQWnh0XmZC2/JPVJ3Y8B48G
         gCXTALw4+Fjz1eFQUiOoNfHcpQHzdkGdm8ZCxRCD8ErTNDckZkKh+ZFhlWa9UYM59cns
         CH0g==
X-Forwarded-Encrypted: i=1; AJvYcCV5KXekRzt2wNtZegz83S6JH8scyoypeMK3JbfSh6QIPV88mcuiHSscgwwmfT8armv8a7XfLhGsTeIVIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ySTFwbO2zkR6j1mMyZdm7/oEj56UqiKhvvFnnraAtBnLMyma
	tIgV9owGGRpvBGbshaahnu+HSH2Tf7qRcM4lIn5AGnA/4zxWMsb4bU46VcFLkDZPR/dFAdM7ZB2
	jCeUv+4k7d4wEInN6wOem8pu/PIgCF4qsPvuA2Vad+Qiig9moQ7FxG+g7Up4I3mtYTQ==
X-Gm-Gg: ASbGncu8z0sUAzYiTmtNfyxaNQgpcQ4BXiliREJDGG2yjOAHAe5OEDGQ+uZWOEfAoYl
	uUfRcHKlJ/WbUDPXUE5quc4ir97I9Ow+NO6xVQNJabG1AHCOGwo6W2aP4U0Rn6WF24bnUHLVqls
	DsgxBgbIS9ReaoFL+Y/imf2q/qzveI2yeSNok37qJLDJmp/1C6YD0IqgQ1TTr/a8Zg9LgtR1yc4
	2Gn1KfEP5oNaAY1dvvXlKD1HPQZbyq9qlr49NrapDZ7/Ei3YW8dm72dLDK379RoF4OhD9GaLB5Y
	XCF1+fCT8kGOYJ2lXV99izq/8IrdxelU/H6YUdhz17jKpLBYxYcFENOBUF1z8mxnLowhxmunvYa
	K9ZpBcxFsG+McRew+h/jDDQ==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr93692781cf.11.1757493313971;
        Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/PjlyjlapeA2UUFv3VPSLLeX8X1TPLj4/Upo+NAPNfgy876iYhaAOrUk5Om4jVsYgaP3RA==
X-Received: by 2002:a05:622a:f:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b5f84608a1mr93692431cf.11.1757493313260;
        Wed, 10 Sep 2025 01:35:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078340e5bdsm127895366b.97.2025.09.10.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:35:12 -0700 (PDT)
Message-ID: <108895ac-0c4d-4aee-86b1-96461e00def3@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 10:35:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Hans de Goede <hansg@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
 <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXwEoJTeQgvVjA
 2eOV2Nsj44lMNuSPyTI1KtJlKZbiqL4tC6rJHY81Ses60oe6PT9nMPwO98FnqceJNTGFW/pLd8R
 N8hsNgyYTHCcEWh81AEJs006yWCKynxWM9t5M+3u2/PtQuGImrkShtXel4IIkXe7xjTe+4xl6/4
 lH11qCPUS2USSxP5RhRq9D/AqxbEWzZhqYVQK1otjhgUWHjZnIzvze1CJmLTFKuwAA8gC0YaLdk
 WqEnchN9w6ypiHm3a0zGp9lJJFOwx/lpUmucYZvXMA1Nb0X1iroHDsagOAp1NXDxDZH/3xvvpaK
 8MQNGHVB+RcAgGXnSfoNZ/v786DqnMxYz+4X617mbDF58d1R23gA5Y1FNibXoiR3RCzdowIV9a1
 SLdMlvvg
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c13845 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=I76Qk8w-AAAA:8
 a=bzamcEsfLQq8zZigF6MA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: UzTV8jFQrVp7T918WQLwm8JVjZ-dkRkt
X-Proofpoint-ORIG-GUID: UzTV8jFQrVp7T918WQLwm8JVjZ-dkRkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/9/25 10:39 PM, Hans de Goede wrote:
> Hi,
> 
> On 9-Sep-25 6:57 PM, Aleksandrs Vinarskis wrote:
>>
>>
>>
>>
>>
>> On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis <alex@vinarskis.com> wrote:
>>
>>>
>>>
>>> Introduce common generic led consumer binding, where consumer defines
>>> led(s) by phandle, as opposed to trigger-source binding where the
>>> trigger source is defined in led itself.
>>>
>>> Add already used in some schemas 'leds' parameter which expects
>>> phandle-array. Additionally, introduce 'led-names' which could be used
>>> by consumers to map LED devices to their respective functions.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> ---
>>> .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
>>> 1 file changed, 89 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>>> @@ -0,0 +1,89 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Common leds consumer
>>> +
>>> +maintainers:
>>> + - Aleksandrs Vinarskis alex@vinarskis.com
>>>
>>> +
>>> +description:
>>> + Some LED defined in DT are required by other DT consumers, for example
>>> + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
>>> + approach which is typically used as 'soft' binding, referencing LED
>>> + devices by phandle makes things simpler when 'hard' binding is desired.
>>> +
>>> + Document LED properties that its consumers may define.
>>> +
>>> +select: true
>>> +
>>> +properties:
>>> + leds:
>>> + oneOf:
>>> + - type: object
>>> + - $ref: /schemas/types.yaml#/definitions/phandle-array
>>> + description:
>>> + A list of LED device(s) required by a particular consumer.
>>> + items:
>>> + maxItems: 1
>>> +
>>> + led-names:
>>
>> While going over the feedback I realized `leds` and `led-names` do
>> not follow `property`, `property-names` convention. Any objections
>> if I rename `led-names` to `leds-names` for consistency?
> 
> No objections from me, `leds-names` indeed is better.

FWIW we have "clocks"/"clock-names", "resets"/"reset-names" etc.

I sometimes refer to "property"/"property-names" during review to
bring attention to the preferred style (ordering of such entries),
which is maybe what confused you

Konrad

