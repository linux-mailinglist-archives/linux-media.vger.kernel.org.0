Return-Path: <linux-media+bounces-16962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E6961C3E
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 04:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37729284E74
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 02:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1CE83CDA;
	Wed, 28 Aug 2024 02:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFBDj+bz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A18C0B;
	Wed, 28 Aug 2024 02:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724813244; cv=none; b=FwwXZD9zv7T16r7I0e0Py1+gGqj7/jceMbXU9JRu1AA+qsUwBNht3Txs1HFH40Ftiw5+622e0uydaZgOnRqYpqqtlKJA1i9H7aBSHi4EIJlFomQwqgjVlR+D0/szZMa/OXFTAEJvQR2DcrBs5qaVVkjuR/Gr8p3dvfWozRY7D0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724813244; c=relaxed/simple;
	bh=sfqmshS1wIKBC+hv5iUJY7j6w3Vi2OSAw102GO2u/qM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohgXjyLpm92Opwx9HWVP5R4FAC2EC7YgSJzMP75e0DIcw8xWxyshEE5KFe/qC140bK2j433ZmuqoU6dU2GHRSrSRU6tltj7+En+umR6MOM++hrHSD5w4bKJlVhYe9mxC/+2rFi0oOXiDc8taH7kaNT42nyzQg6Dl2Iy7l8IrBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFBDj+bz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2023dd9b86aso49554755ad.1;
        Tue, 27 Aug 2024 19:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724813242; x=1725418042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
        b=eFBDj+bzIjFzrpMHvR98Yce+yAfaE8xHOD0LzwGUtWYf+D3vX/ETtpRiZxxqud5f69
         U89WHgmlZYyQOzFVqS3Qs9OpezqoeZTAL0ANltDLOrSvWZVlB8kZTVBeh8KUgobLCjae
         XAYYvWktbHYNhuAX0B2ie2w/n/UhvlXs7vlzbT7L+xNGT8ZJXU1oCMf4XCElsa0og/tD
         PR32yn5jItqeSGiUWuO8NHEk8mGxzCc13VNOd1VbIIf8arplL2ACy7+B6Bl2uIfhe1Ov
         Ll33cYJsE9m2ujBgcuB7vGrPXlXMZ9lboN/zOTN1VqnyHMxzkPrlybhmtYJHNYAvcGC/
         kYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724813242; x=1725418042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
        b=oYtxmR0EQZ/11r7SK9QdwJli88C4LBlWdbX2NWqJB9+PTmEEbkQUN8twYcBx5qAVai
         wdAHdvUXdcUc1jvRONnk337+Immd+Yk17ClUjg30SVejdMTFZiTsfUPKWnLpT9xY2YYi
         c6dnWaTFWDay2YXYwc4cZkBwk8ko+Xhd6emHNcHUrwOgit6i8krMrtYyqt8L9rvIaLxG
         yHUpVD7kGZ9ETsXElywFIU55tQ70wEDKwFGUUdP8I3YohWSqdsSqkwtb5eMfGtrteCOP
         hTSi2tx1sp7Y9gzGMXZpHox2lqi8pghJ+5c7nvVTM3abchCqLzxaRfSK0rEXBtYjs5I6
         ROOg==
X-Forwarded-Encrypted: i=1; AJvYcCU9t2wg+O0jAm32+UNXZdj9lCR3KdycuFpE8zFUXt/04XAIaANC0Vzf+xx46s7EThxTomQ0x7ssiLe3@vger.kernel.org, AJvYcCUIT6b7WMTF4rbNOX026ESkLTEA9JLfUdzvWL0mVcn2EBAD7bGTHx/tYykXqn6ggskeWPFGWHTSNBxC1lVU@vger.kernel.org, AJvYcCVu701y1ycoX4WeAsE6oVOkzn3VoCy6PF19XJnMu+osnSi8cMPc80Or2E6CtRCRhSR9/LOBFESyzn0700U=@vger.kernel.org
X-Gm-Message-State: AOJu0YziPhoVPNGSvmQhvWl02XCEsfI28BbCiVVF8iqDm7zd4ks91jge
	7+E6ZxQod+OB15kI7EkXS3947moF8wFvtAyUEMW1umwi1qxO1gjs
X-Google-Smtp-Source: AGHT+IF0GEyxFOWbUu+ExQlyAJXiGNDV52VSUO4649Opxz3OpCXsbg5OuD8s1mKSDmM48NIESs5/IA==
X-Received: by 2002:a17:90a:ac17:b0:2d3:b8eb:9c3c with SMTP id 98e67ed59e1d1-2d646b9083cmr13244361a91.2.1724813241838;
        Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac97f5fsm9869216a12.11.2024.08.27.19.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Message-ID: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
Date: Wed, 28 Aug 2024 10:47:17 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
 <20240823182616.5a85e1ae@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240823182616.5a85e1ae@xps-13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Miquèl,

Thank you for your reply.



On 2024/8/24 上午 12:26, Miquel Raynal wrote:
> Hi,
>
> hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
>
>> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> new file mode 100644
>> index 000000000000..152784e73263
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
>> +
>> +maintainers:
>> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,ma35d1-nand
> Can we please use the -nand-controller suffix. A NAND is a the common
> name for a chip with storage inside. You are describing a host
> controller that can be connected to in order to talk to a NAND.


Okay, I will change it to nuvoton,ma35d1-nfi.

Because in our platform, it is the NAND Flash Interface.



> Thanks,
> Miquèl


Best regards,

Hui-Ping Chen




