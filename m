Return-Path: <linux-media+bounces-41959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59BB48559
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3105F7A5D0F
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BEE2E8B6B;
	Mon,  8 Sep 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEl4hAeH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22A22157F;
	Mon,  8 Sep 2025 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316830; cv=none; b=ZJse0xVIwn9Qfw4zgjRxsw/OOJcjaOY1/aoytJTzGWpYSJmc5uIgmFLSVJRcEhmkb3BBI3E2zOzwKIopBSMSOXbVPRk/5goVhTRFuz0tDwqgiHVCNt5B2erqXrYUOCrAOCSVy6S/fo2Y3rdym25mfYOi3IpmgIXiQqrioyPumVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316830; c=relaxed/simple;
	bh=SwLGQXYjjILPZ6nHkE3A25BCSWlFkPdVwJFl10Fp3/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWE1Sl+2jRD5kssMDDraIl5YM0GUcHCfucqbrdHv3KqztEYI8PRk/mvQs9FAOVgzAw7T7eafz4n0oY8+d0eAcATVQ2rWEuLT9qJOAwwXorFwYvj4H9BBMsWxsjMoXDWxv0+nNHTKfnAeAytADlbldacgqSlrKbUEL9wGKXOlriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEl4hAeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36255C4CEF8;
	Mon,  8 Sep 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757316830;
	bh=SwLGQXYjjILPZ6nHkE3A25BCSWlFkPdVwJFl10Fp3/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iEl4hAeHsDIWe/dUV09Y9leD6iq0jozKjh9cx1J5hplu+UsBTLeHjMK66m3maSgNl
	 /uER1iv5P6eH55gj2kG2JcEaPjlesimmWIWs2aqCeoFtZd2CRBdKIHDSJKn08TnpCd
	 rZpmnscakSK5SXWjmq3xI25uFaRcE10zS2jxU4kmUwVGHRMastU3uYHaz1ezKiQOUX
	 RGDy53wp0P8lvA5B1zyzM5MWh6X2b+F6l6bBdKJ+LWY8pXmY3eLN16bosi4oC10AyC
	 zxJahRAS1TwW96bc6sQdKKyhg8rLOfhdOwhhqxtUzvHvuPYcI1nJYDh781SQP2mCeC
	 YpsLL59pV8iPw==
Message-ID: <046b289d-b6a5-45f9-88b1-090e2ab7c95d@kernel.org>
Date: Mon, 8 Sep 2025 09:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: leds: commonize leds property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-2-5944dc400668@vinarskis.com>
 <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Sep-25 09:20, Konrad Dybcio wrote:
> On 9/8/25 1:18 AM, Aleksandrs Vinarskis wrote:
>> A number of existing schemas use 'leds' property to provide
>> phandle-array of LED(s) to the consumer. Additionally, with the
>> upcoming privacy-led support in device-tree, v4l2 subnode could be a
>> LED consumer, meaning that all camera sensors should support 'leds'
>> and 'led-names' property via common 'video-interface-devices.yaml'.
>>
>> To avoid dublication, commonize 'leds' property from existing schemas
>> to newly introduced 'led-consumer.yaml'.
>>
>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>> ---
> 
> [...]
> 
>>  
>> +  leds:
>> +    minItems: 1
>> +    maxItems: 1
> 
> My brain compiler suggests this will throw a warning (minItems should
> be redundant in this case)
>> +
>> +  led-names:
>> +    enum:
>> +      - privacy-led
> 
> Nit: "privacy" makes more sense without the suffix, as we inherently
> know this is supposed to be an LED

Note "privacy-led" as name is already used on the x86/ACPI side and
the code consuming this will be shared.

With that said if there is a strong preference for going with just
"privacy" the x86 side can be adjusted since the provider-info is
generated through a LED lookup table on the x86/ACPI side. So we can
just modify both the lookup table generation as well as the already
existing led_get(dev, "privacy-led") call to use just "privacy"
without problems.

Regards,

Hans



