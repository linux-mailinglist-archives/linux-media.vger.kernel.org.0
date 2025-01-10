Return-Path: <linux-media+bounces-24605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6EA08DCD
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A301C7A35F6
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E6A20ADE2;
	Fri, 10 Jan 2025 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9hK2iCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52AB20A5FC
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504625; cv=none; b=JJEhrfwtOdV5t4OqKdjGC7wlffA674lp5LujtvPtHyn58WKZxKhsSA5L6IvfMYfP5Y++34vkZNRlE4RJXPFYfPs3bYVghFl/rHKTlCreuMHUXDV5QGwoULn/Aht9MiMLt9eGq6t7kMz208DeBu1lkNHwqHtGBN9GUmD9JlDOTa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504625; c=relaxed/simple;
	bh=dClN62ghAownkthFOyWlwxBUlaE7OHx3pnhp6IVNIHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONXIbqHnTeyzarLcxB/m8MTsib1Ve8xXsYIJvEtcuiR7Ojd7F2o8UZ+2R4eZVGLZTtQ6ChDLb/yRLOZJGkIDofhUDCsOM1Y1aTuQDs0BW8F62MWfjhQob4YsbQaIfPP8PgdoLmpXQq6WKQNCW/pdw/7Xr8Iy69G6PFOxtVtC1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9hK2iCD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso13785935e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736504622; x=1737109422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=284NliP9ft40s16Rjw2vwTVq33+7j+XEP4xOIyPtzpo=;
        b=n9hK2iCDqxHLE/TrtUlHhjDvwMxPeJcFWawzY9t/bhQ4HiEqNCSewFeNTnRw6jOAX9
         0IzoBI+vEZpy5M/wfH1hL0vSdNUcA7/VAG33OgwxuVoLsVmqMLHX7oWcMK6s43qgRMZQ
         xfy4ZTT4PeVatnoSrmYF9FaqIURM5h2rgnPy5Kf3P+h/eanS6xqjJbS7bx4aMOydMcAn
         qILlpQoY3Of4ULyKrCFBj6rgVbjQqHGI4rkXCTiYPRTVXGKrm4dpYFg4HOkLw+9SUROr
         DX6lItk6tPD6kR77aA2Nfm8URbjZgDUK4yR/qnRf4kgM57rtTxDp5CMgey96+HP8wXWC
         YFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504622; x=1737109422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=284NliP9ft40s16Rjw2vwTVq33+7j+XEP4xOIyPtzpo=;
        b=W73FoCuwfoakVyJivskyAnVX2GiYNRzE/fXTysUGhcEqPSTvRj0ASX8sQglJDXQy4A
         lWgc1t1Zt0PImZKaztCDuQ+VwHKbfrYjwN7p+0y9OD4LhI31N9EFeRGN85P+eDS404vp
         0+7frtl3tZA2kv3AFje1UjBna/028F5OGemHkquEXt97AnUZViEjO/RG8D61DfsvJLRG
         EeuvQfaYHF6lbHygrBL45czMXEw78eMBy6Ls+eC3RyfZqp2ZbVYvM5QlJl8V8LJZ3/Lx
         jyC6zEcDQe2KnS7BMTVz+AJmOjh32ZoXfVxI3YLk78Y+N3yTVtyhIgLES5+UZz6qXU/s
         P1RA==
X-Forwarded-Encrypted: i=1; AJvYcCV53Wws81V21NLEotOGz1t9/lSexztsbsSOa2x/02QbNnbMfkevXa1TSqzZ7ZLYOVYu6bAO9v/R/iocUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7agnGyTb0ofMTnE7y1YBHlQcbSbXKcbVawS3sSdMWURv4rYWw
	//gg3jRYmiKl/Li8e2LUiy0BcP5lbL03/HM7o05fyN9nnHwgPA3aoPUxvbB4I5Y=
X-Gm-Gg: ASbGncv0Pgbym2GSsz6hOcRnYnOWVrfvTSaBZmKsJpUCL496RIkrl4lSVe0RwkOyqKU
	egaWMKoajJu8xqWpYMOrrtZnbFMJGGPeJkmBRwtZFC17k5d3FITFezzYeLcDD7rRA2oDLRWtCk6
	7MRrq5Z2jU8wY/SEJOwe0r2RdV/i7oy0GYLZ/Jd0TdsGTVb+V5losHKa9DqMvTU7rS9y6J964X6
	1SCJcnT5mmI0kCl+gM2IRT6dxk/89g+Gtsfoy75lvoh2l/DlxVSqGxrCY2pkGoJkd5i4w==
X-Google-Smtp-Source: AGHT+IEWMEsdERP3Ip1f32qPhCE+VBtY+LaMywvpMtMGDTbyuMbs+q7IvoV/GEUeMhY3D5SfS8AfOg==
X-Received: by 2002:a05:600c:138f:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-436e26a88d9mr98123845e9.12.1736504622168;
        Fri, 10 Jan 2025 02:23:42 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddca2dsm82118095e9.21.2025.01.10.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:23:41 -0800 (PST)
Message-ID: <d12a9f38-2ec9-4174-907a-00ff613e61c0@linaro.org>
Date: Fri, 10 Jan 2025 10:23:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
 <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
 <d807cb98-40d0-41ea-8f7e-9ae51b05822f@redhat.com>
 <Z4DKjLBGP_bZpHjq@kekkonen.localdomain>
 <a084ccf0-6b73-4e83-9310-59a618e82a28@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a084ccf0-6b73-4e83-9310-59a618e82a28@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2025 08:43, Hans de Goede wrote:
> Hi,
> 
> On 10-Jan-25 8:21 AM, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Thu, Jan 09, 2025 at 10:23:41PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9-Jan-25 5:37 PM, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
>>>>> The driver might skip the ov08x40_identify_module() on probe() based on
>>>>> the acpi_dev_state_d0() check done in probe().
>>>>>
>>>>> If the ov08x40_identify_module() call is skipped on probe() it should
>>>>> be done on the first stream start. Add the missing call.
>>>>>
>>>>> Note ov08x40_identify_module() will only do something on its first call,
>>>>> subsequent calls are no-ops.
>>>>>
>>>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> I'll add:
>>>>
>>>> Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
>>>> Cc: stable@vger.kernel.org
>>>
>>> Sounds good, thank you.
>>>
>>> That is when you say "I'll add", you mean you'll add those tags
>>> while merging this series, right ?
>>>
>>> Or do you want me to the tags in a v3 series?
>>
>> No need for v3. Thanks!
>>
>> Are there other patches not merged for the driver, besides this set? No?
> 
> Bryan was talking about a fix from him which also needs to be merged:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc
> 
> But I cannot find that in the lore archives.
> 
> Bryan, did you ever post that fix ?
> 
> Regards,
> 
> Hans
> 
> 

Yep, it would be nice to place that patch first as patch #3 in this 
series conflicts with it.

I've fixed up the tree here:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/media-stage/master-ov08x40-integration?ref_type=heads

---
bod

