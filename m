Return-Path: <linux-media+bounces-53729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NBCIRC4oWm+vwQAu9opvQ
	(envelope-from <linux-media+bounces-53729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:28:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FB1B9C3F
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF2BF320613A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1595940F8CF;
	Fri, 27 Feb 2026 15:20:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0C73F0767;
	Fri, 27 Feb 2026 15:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205606; cv=none; b=Fd1nPHAnCQifecQHBfhlVCsuXTq7LTS/T7C7gEiVXkVnCdsZFt1TBOD/tsDIyXu6GxeglLhacC5bzS09AJyA7FKZtHnfa44IDA5EXTLzTchFYHs1B+R9DVkFx+93nKoYepgefUgJdBgnP3Gr/Jnp131qwlmusPQy4SWDr3ljcwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205606; c=relaxed/simple;
	bh=nci1QbEbbQIz6+WCEZZpUTOY0Z/egw7rc4hmbc7DgIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u46Oe2Dg+tQnWbo5XFIgOgXgDAhbaOCZ9Q+QVMw3m/wOW2O8LSSALUr3xbN73eLPR+uucLeR0gB/IhTrHqrAiCVGvgUmj+1v2ffjgmCV8SE6oJ6KbEbIZFbh7lLecknYyEu95e89By60FPECCoKnh3cG3tWdXgW87QoPjE0JCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 7177310E2A88;
	Fri, 27 Feb 2026 16:10:55 +0100 (CET)
Message-ID: <16086ec6-a50c-4d47-8c6a-0e7cb73a5d6d@emfend.at>
Date: Fri, 27 Feb 2026 16:10:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: media: i2c: document Omnivision OV08D10
 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
 <20260226-ov08d10-v1-1-c3a916368123@emfend.at>
 <20260227-imported-benevolent-stingray-e97dfd@quoll>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20260227-imported-benevolent-stingray-e97dfd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53729-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[emfend.at];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.826];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: D35FB1B9C3F
X-Rspamd-Action: no action

Hi Krzysztof,

thanks for your comments.

Am 27.02.2026 um 11:45 schrieb Krzysztof Kozlowski:
> On Thu, Feb 26, 2026 at 09:56:01AM +0100, Matthias Fend wrote:
>> Add YAML bindings for the Omnivision OV08D10 CMOS image sensor.
> 
> Drop YAML. You add DT bindings, not YAML. No YAML is bound here to
> anything.

ACK

> 
>>
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
>>   MAINTAINERS                                        |   1 +
>>   2 files changed, 102 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..96dbf61cf7c188544f4120216ae2b8e0155128b7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
>> @@ -0,0 +1,101 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov08d10.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Omnivision OV08D10 1/4-Inch 8MP CMOS color image sensor
>> +
>> +maintainers:
>> +  - Jimmy Su <jimmy.su@intel.com>
>> +
>> +description:
>> +  The Omnivision OV08D10 is a 1/4-Inch 8MP CMOS color image sensor with an
>> +  active array size of 3280 x 2464. It is programmable through I2C
>> +  interface. Image data is transmitted via MIPI CSI-2 using 2 lanes.
>> +
>> +allOf:
>> +  - $ref: /schemas/media/video-interface-devices.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: ovti,ov08d10
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: MCLK input clock (6 - 27 MHz)
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: Active low XSHUTDN pin
> 
> So maybe rather powerdown-gpios, see gpio-consumer-common.yaml?

As activating the XSHUTDN pin on this sensor works like a reset, I guess 
it's okay as it is.

 From what I've seen, it's also common practice for some other 
Omnivision sensors to designate the XSHUTDN pin as the reset pin.
This is also the case, for example, with the recently added OS05B10.

During a review for another sensor, I was asked to use the reset 
controller framework instead of the GPIO pin for the reset function, 
which I did in this case as well.
To my knowledge, the fallback from the reset controller to a simple 
reset pin only works with the 'reset-gpios' property.

Thanks
  ~Matthias

> 
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof
> 


