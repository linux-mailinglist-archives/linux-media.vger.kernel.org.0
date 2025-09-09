Return-Path: <linux-media+bounces-42136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF461B50735
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 22:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7984D4E3C23
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 20:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34D635AACA;
	Tue,  9 Sep 2025 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK8b6bs0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04549199931;
	Tue,  9 Sep 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757450353; cv=none; b=Eg3JCgOnUkReyNKbK3NDrupZJ/JyhNzNx/Zpp1L8UcJZf8yPM5j+VHUDAiITpjgeyp+1MvZ7dSnBnTiTKz+epzi8mCqaz1IaoQFLqJOoM52mOJqqFrITvR2rKuI6yXn/bnhigNGQoBCBKQCXNQCVI8WA+bAikkWslc2+pkPlwR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757450353; c=relaxed/simple;
	bh=9fZASMuZCalLaTWw9GiE1aMw67wsX4JeH92/taONPEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EivVbpDzAayaOEM0g+q8+dFEh2YupFb1nE8v9JcMDzcJuKouDwTohFCHL7CvqKWozK7Y1rH7oYK365JrVonxnHUVC5F0Y1kLza5r/S3lHhC9/Nk7js/lcgm5IjfVgnIUydaXoEJjTpbVif+eYg8el1+oVCmyKR4tNiIL1rwVPbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK8b6bs0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D207C4CEF4;
	Tue,  9 Sep 2025 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757450352;
	bh=9fZASMuZCalLaTWw9GiE1aMw67wsX4JeH92/taONPEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kK8b6bs03H/HrsGZkhmji6GFU23uAvnkWuGs3iMNI6mU9LC9P19HW1YqFl+hibA/7
	 2bFaZof7z8D2hFJsElDe3EfSgu1s5QiIFlEpzf0zuwPg0X9gAy8pqbl1NjROpQpUCM
	 zq0yn+VlP9c7+SP4TlBypCLW4nDrY/N/UYOZf9TP+q2PBbxd4qGY4rdGS+OyHDhQ8k
	 b3TNCDRXZoruVUKHGVP85Y8tz6NV3xKOHsdDTSj5IbJ/73Ytk50SJaLGZ0Qu46jKEC
	 6bhbQIknvkdT0M/VstjD4+ve6S8x5WYlHsH60396KedSQU7IIVTbkegQ7zI3ckB8lM
	 L0Kd6oty3hW6w==
Message-ID: <d957d16f-d206-4f7d-b52e-a2cad9e4abfc@kernel.org>
Date: Tue, 9 Sep 2025 22:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
To: Aleksandrs Vinarskis <alex@vinarskis.com>, Lee Jones <lee@kernel.org>,
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
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <MOj2NUVAdyu9bvVkEON8rhAlGJ9FRRh9gJABkrOR_6gKhE8rmeZ5Isbj9noA1bDZ12gY4dlDpEtmEjxlRTucCssKwTo4f5nCowMOin85IKk=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Sep-25 6:57 PM, Aleksandrs Vinarskis wrote:
> 
> 
> 
> 
> 
> On Monday, September 8th, 2025 at 01:18, Aleksandrs Vinarskis <alex@vinarskis.com> wrote:
> 
>>
>>
>> Introduce common generic led consumer binding, where consumer defines
>> led(s) by phandle, as opposed to trigger-source binding where the
>> trigger source is defined in led itself.
>>
>> Add already used in some schemas 'leds' parameter which expects
>> phandle-array. Additionally, introduce 'led-names' which could be used
>> by consumers to map LED devices to their respective functions.
>>
>> Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
>>
>> ---
>> .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++++++
>> 1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d50a3850f6336e9e3a52eb1374e36ea50de27f47
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/leds/leds-consumer.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Common leds consumer
>> +
>> +maintainers:
>> + - Aleksandrs Vinarskis alex@vinarskis.com
>>
>> +
>> +description:
>> + Some LED defined in DT are required by other DT consumers, for example
>> + v4l2 subnode may require privacy or flash LED. Unlike trigger-source
>> + approach which is typically used as 'soft' binding, referencing LED
>> + devices by phandle makes things simpler when 'hard' binding is desired.
>> +
>> + Document LED properties that its consumers may define.
>> +
>> +select: true
>> +
>> +properties:
>> + leds:
>> + oneOf:
>> + - type: object
>> + - $ref: /schemas/types.yaml#/definitions/phandle-array
>> + description:
>> + A list of LED device(s) required by a particular consumer.
>> + items:
>> + maxItems: 1
>> +
>> + led-names:
> 
> While going over the feedback I realized `leds` and `led-names` do
> not follow `property`, `property-names` convention. Any objections
> if I rename `led-names` to `leds-names` for consistency?

No objections from me, `leds-names` indeed is better.

Regards,

Hans



