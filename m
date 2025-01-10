Return-Path: <linux-media+bounces-24609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A25A08FCA
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 12:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF49A1889FE0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EF820B7E0;
	Fri, 10 Jan 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckWZqHGt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6781AAA1F
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510047; cv=none; b=bhteQmEi8nwQ4srDvWWet8Q20DxpjMFaXUq0NAfNrl5hLF2DYN0fo8ggH69QnCu2cXU2Hj8W5geQOgJkSrL2Mfhv9Z2esQ+hcUW+aS+oE9xoJHTDXNhE/BcT8FFSn9yREtpKTj3dnmb7q1gNDdxCnKCMGBQ0tt0Plz+4u7qGsKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510047; c=relaxed/simple;
	bh=ZU2NEQEXpnRJ7TUV0hsEwpYzLWK4f3J16LPkVfaVWv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJr857WFdgCX6+g4F7vJVqbj1xbzITi6egHcnuExq77loJ9xrskUdntr+9643kcEDpuASQcFxrM3dvA+ZJBTN0DZY6KRb+YdUIUTk6nsSm/9+wsvFv9TBTcZd8PN4ZSJFknU9TUzFdmIJTihAzF0BCPdTdz2FmbFpNupZgm4zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckWZqHGt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso19824675e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 03:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736510044; x=1737114844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDltOGspiQwBWcwTGosu4uY3Dz94uBOXTI38cxZ8gO4=;
        b=ckWZqHGtvbuWIX0rRRPPL2tdzXvVsFz/b8pVKoxoGLmwb/q4jL3SVplPuvHzf0oKIY
         spQNcZVT2rwgvGG+jo30X9+34+Y73+V39jilN2vr3B6+FdpYrQlz0Q0qiL2k6a4qEKrd
         s3MOOWkaFV0Lexk6OlN4qZOktrNuYMqio8mJ8RamerpP9cA3fF2GuFmUPCDrxcMP+meQ
         t4TkKtk1GjNWgmtZapP4qbx+ErPV487HNz4oHDZK5OT74W8yrUzqBzAO/ZbXOpwXB2qT
         NTSjUCbXF7PCbKpjsJZrnVuZ/lNyz5Woufw/CyeRY5nFGCazlqWy7v0yp3d4iKonJC1m
         I40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736510044; x=1737114844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDltOGspiQwBWcwTGosu4uY3Dz94uBOXTI38cxZ8gO4=;
        b=orldbv0bZxfmXaLI4aMO/GIAEoj+uIa0/C9L6dpT8SBg5+qtfMnDtRdED1+2SDpy0t
         sHDBfUAT9k1jYCk1iT9QIB8ezJFQJPg9XNa+2EzK98g5Gbso5J7a3tL+vG3s4hunFkWi
         2M8xa4VTMO9OdgOKTFdMEBjR/SvK4OsHbRNLSXhVnG49oag6C5RdFw/vLxUu6f7fLcX9
         pMYKalww6qS/s31/tihR3n/adSkbkMU9Ai8GU5LHfb2F25zqMSOnfAOhWMR3S7h5ESU/
         zn67uMNgucSyL23jtg6HQqw802SOEgtIOyoGHbkFDTVEzxxwL27vJRz/LuqqN3yek1wL
         HOQg==
X-Forwarded-Encrypted: i=1; AJvYcCXyANdJIPU6szO1DwOe3S8ST1RibnhEt1kvwNOjaKe2OWGtlFJPHZ+I158t3EbuJQqJg1G5hnctrPFRUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzauv8QyFanX3/qFsKRicVX1Dt+AkVbIlZEBPTUnIiA9vv2lqn9
	DfGS5cjH5CdjuipjaUfzIMIRPNeSbuoY72eL2xlWMqkdzFluUwqE9FGDVgYU8I0=
X-Gm-Gg: ASbGncu4usnMdqvxh5fVL7YlYFfszkAGWZVAx5BjNTSXR+R9fMddAbE/NaKmm3dNXtY
	gMZa2rtAzGzlY/w0nKZS0vv0AwMIXK+Lu5qv2f8y+qYB7G8S7WlFylBtC4J9sYndNG+kMh4l/u2
	covBdv4FFDofuDDM3tlSSvEmvPvcpDuli6eg+MBMamXbHCRnSRCQcp9Qiazbi4HD4mr3y/S4kHx
	k3QAmCaP/Zh2GWjyWwTUvIFtW2MWQq9eHgAhK4Ailh+NWtSnys6xoFZfu05x4uX5uDTGA==
X-Google-Smtp-Source: AGHT+IF7zyl4gCTh1KpNa+l/rbckBdrlHt61ulLWgkeIfQr1nEwh+t79KUAveHTBm+XIPKPU2rXjhw==
X-Received: by 2002:a05:600c:1d1f:b0:434:f99e:a5b5 with SMTP id 5b1f17b1804b1-436e271cf4amr75526525e9.28.1736510044306;
        Fri, 10 Jan 2025 03:54:04 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddd113sm86535115e9.25.2025.01.10.03.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 03:54:03 -0800 (PST)
Message-ID: <0be6b419-6095-43b0-9b03-54daf10bc150@linaro.org>
Date: Fri, 10 Jan 2025 11:54:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
 <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
 <d807cb98-40d0-41ea-8f7e-9ae51b05822f@redhat.com>
 <Z4DKjLBGP_bZpHjq@kekkonen.localdomain>
 <a084ccf0-6b73-4e83-9310-59a618e82a28@redhat.com>
 <d12a9f38-2ec9-4174-907a-00ff613e61c0@linaro.org>
 <Z4D2pDD4AY7zENkH@kekkonen.localdomain>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z4D2pDD4AY7zENkH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/01/2025 10:29, Sakari Ailus wrote:
> Hi Bryan,
> 
> On Fri, Jan 10, 2025 at 10:23:40AM +0000, Bryan O'Donoghue wrote:
>> On 10/01/2025 08:43, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 10-Jan-25 8:21 AM, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> On Thu, Jan 09, 2025 at 10:23:41PM +0100, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 9-Jan-25 5:37 PM, Sakari Ailus wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
>>>>>>> The driver might skip the ov08x40_identify_module() on probe() based on
>>>>>>> the acpi_dev_state_d0() check done in probe().
>>>>>>>
>>>>>>> If the ov08x40_identify_module() call is skipped on probe() it should
>>>>>>> be done on the first stream start. Add the missing call.
>>>>>>>
>>>>>>> Note ov08x40_identify_module() will only do something on its first call,
>>>>>>> subsequent calls are no-ops.
>>>>>>>
>>>>>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>
>>>>>> I'll add:
>>>>>>
>>>>>> Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
>>>>>> Cc: stable@vger.kernel.org
>>>>>
>>>>> Sounds good, thank you.
>>>>>
>>>>> That is when you say "I'll add", you mean you'll add those tags
>>>>> while merging this series, right ?
>>>>>
>>>>> Or do you want me to the tags in a v3 series?
>>>>
>>>> No need for v3. Thanks!
>>>>
>>>> Are there other patches not merged for the driver, besides this set? No?
>>>
>>> Bryan was talking about a fix from him which also needs to be merged:
>>>
>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc
>>>
>>> But I cannot find that in the lore archives.
>>>
>>> Bryan, did you ever post that fix ?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>
>> Yep, it would be nice to place that patch first as patch #3 in this series
>> conflicts with it.
>>
>> I've fixed up the tree here:
>>
>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/media-stage/master-ov08x40-integration?ref_type=heads
> 
> Hans's patches are in my tree already. Could you rebase yours on my devel
> branch (tree at <URL:https://git.linuxtv.org/sailus/media_tree.git/>) and
> post it?
> 

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/media-sailus/devel-ov08x40?ref_type=heads

Puts

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/b8f7e192b6bf0b8859158fb2b28b479d5c389054

before

https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/9370a82094d47d0383b0d52681b6b3a8d711ef9e

So that the first patch can be applied to stable.

---
bod

