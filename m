Return-Path: <linux-media+bounces-3970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F318835FDC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 11:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBCCFB262CA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 10:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865FF3A1BF;
	Mon, 22 Jan 2024 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ry2b84fv"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EB39ACC;
	Mon, 22 Jan 2024 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705919901; cv=none; b=YtHjTWnReIWAlrPtYeBEqv/JUMIMsdaLzFmNfr4MR5caxu6yeXMNLnUPDHJzJkbKvLAmcDoH+jUakQhBP8OSeSrHvvXGONNy/6Rx5LPgHrIXZdraxK827cyjllF0Uz7EdhoetTGYldMyNTXv6Z5yRmOpXIQAT+d4h+5IMruk6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705919901; c=relaxed/simple;
	bh=QOgZWgCo219X/V3HqTTipzGqn3wTwHbInkP56JKp9LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcvlpIljEM2OZX0GYt3CG3tovXk8HPy4gZtaNS1bx4+pTGY8ZvDRO1kZQYQJW6JXdHY2XT+tHwvug+kMgRf215yUWPnxQtPWoyyi5NpbLbvHi2bXZFsgOgwxqryhlSbz282CQ9fCReUEOt6buMP49wmKp06YhG5CM3SmGyruLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ry2b84fv; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705919897;
	bh=QOgZWgCo219X/V3HqTTipzGqn3wTwHbInkP56JKp9LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ry2b84fvNF59C0fPB/rOmCrQfkB9UCYyyxjbbVblAutR13mGF1OtEsYNT4P9veMNH
	 qNGb0ir5fSdO4/aVWMTwKNLlUU4KN+tMfMu64/tonBwHeD1VIHlseBwPfkXoaAHWoL
	 gNMt/FELnlRq0ivLUOec/jQpoxO2qCVeXjzlOswL3NAJBM7KRH5I23LTC7FwxSwe0B
	 4MZeDMMZYFG6QD6iFsGlOpEyACqG6GUsEXAdtXbAt7wl1yVFWDEwcExZjeJN09OoNg
	 bb2AeCvEGX7DEYDkLgAxYVEnt8NlA8nXRW+J+OfUcYS0PFxRe/mST7BTtk5m9gOW9R
	 dUgN3exk993+g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89FCE378045F;
	Mon, 22 Jan 2024 10:38:16 +0000 (UTC)
Message-ID: <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
Date: Mon, 22 Jan 2024 11:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, "Jason-JH.Lin"
 <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
 <20240119-demote-fragment-624a35367a87@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119-demote-fragment-624a35367a87@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 19/01/24 17:44, Conor Dooley ha scritto:
> Rob,
> 
> On Fri, Jan 19, 2024 at 02:32:22PM +0800, Jason-JH.Lin wrote:
>> Add mediatek,gce-props.yaml for common GCE properties that is used for
>> both mailbox providers and consumers. We place the common property
>> "mediatek,gce-events" in this binding currently.
>>
>> The property "mediatek,gce-events" is used for GCE event ID corresponding
>> to a hardware event signal sent by the hardware or a sofware driver.
>> If the mailbox providers or consumers want to manipulate the value of
>> the event ID, they need to know the specific event ID.
>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
> 
> Is bindings/mailbox the correct directory to put this in?
> 

Well, the GCE is a mailbox :-)

...but I get why you're asking... and I don't think that this should go to
arm/mediatek/ as it's really just only referring to extra properties for kind of
"special" mailbox client events...

Cheers,
Angelo

>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>> new file mode 100644
>> index 000000000000..68b519ff089f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Global Command Engine Common Propertes
>> +
>> +maintainers:
>> +  - Houlong Wei <houlong.wei@mediatek.com>
>> +
>> +description:
>> +  The Global Command Engine (GCE) is an instruction based, multi-threaded,
>> +  single-core command dispatcher for MediaTek hardware. The Command Queue
>> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
>> +  mailbox framework. It is used to receive messages from mailbox consumers
>> +  and configure GCE to execute the specified instruction set in the message.
>> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
>> +  driver. A device driver that uses the CMDQ driver to configure its hardware
>> +  registers is a mailbox consumer. The mailbox consumer can request a mailbox
>> +  channel corresponding to a GCE hardware thread to send a message, specifying
>> +  that the GCE thread to configure its hardware. The mailbox provider can also
>> +  reserved a mailbox channel to configure GCE hardware register by the spcific
>> +  GCE thread. This binding defines the common GCE properties for both mailbox
>> +  provider and consumers.
>> +
>> +properties:
>> +  mediatek,gce-events:
>> +    description:
>> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
>> +      Each event ID has a boolean event value with the default value 0.
>> +      The property mediatek,gce-events is used to obtain the event IDs.
>> +      Some gce-events are hardware-bound and cannot be changed by software.
>> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
>> +      send an event signal to GCE, setting the value of event ID 597 to 1.
>> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 when
>> +      VOD0_MUTEX is stream done.
>> +      On the other hand, some gce-events are not hardware-bound and can be
>> +      changed by software. For example, in MT8188, we can set the value of
>> +      event ID 855, which is not bound to any hardware, to 1 when the driver
>> +      in the secure world completes a task. However, in MT8195, event ID 855
>> +      is already bound to VDEC_LAT1, so we need to select another event ID to
>> +      achieve the same purpose. This event ID can be any ID that is not bound
>> +      to any hardware and is not yet used in any software driver.
>> +      To determine if the event ID is bound to the hardware or used by a
>> +      software driver, refer to the GCE header
>> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 1024
>> +
>> +additionalProperties: true
>> -- 
>> 2.18.0
>>


