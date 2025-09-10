Return-Path: <linux-media+bounces-42214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E23B517C1
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE92B3ADADC
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76B91DE8AD;
	Wed, 10 Sep 2025 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvWiAEiF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBBC1494CC;
	Wed, 10 Sep 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510426; cv=none; b=F84RNrv221Yay95JkwXpqdoLBZLXMQfletw+XHhdOTgHs+WJi6FFl9ItZ6QuhaUdSieWv/nXvM+dtPv90GKqEmTFJ2u9S8u9QNUxGUyX1FmkBeT7o6zM5LuavZaZK5U6iPZnAQSTkVmJhkldyuVueOuQ753Ck8u+axjAd8N98Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510426; c=relaxed/simple;
	bh=BFrCIvy/PoCHfpyfvAdK2zri04zCDGgVIrw6b1YXoYE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gZbk21oTm08oXYdh5GDX+b9lZjB4T9y4GaMSPKcvpwxAbfbAZBzbW3BR6BQZtCGZf2JF0ZKqv7GKfIMCaLBJuiCA/xwEYAY9tS+XKBxJCzlISHNLLV1SCGHq8q74vSegXbNl3iMp0wTtXLRG8W6lXTzxOYAQP2PEn+vS30RLu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvWiAEiF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CBCC4CEF0;
	Wed, 10 Sep 2025 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757510425;
	bh=BFrCIvy/PoCHfpyfvAdK2zri04zCDGgVIrw6b1YXoYE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nvWiAEiFaIX1+BrF6foF/xC0m+guBnuH3xW6Gl2b0R4eyzbxpQAIqrCQUZOHZIwCx
	 Y2161Ii2JpbH1zImFT/PHHWiAmrHKYo/oSVTrrNEUEkkvdaJMdNfw7/fxlgjSoc/5h
	 dqEawSXkqlVv116zVSCywtGfXEWmr6InKUgf8QFgz5A8B5ntMYkn5ss+BEMj1iKR4L
	 Ipl95mBk0lVs0PsOk/9jnyjYEtHk+P4KT1MCXEHxCS3wV6MwGGccEEwMXzQppd9RWE
	 zTikqHHCQCPODblMgi+IviSoOrxBvSN42bv6NgK6iYEqkZ3dIv8ehp63rWjHZASnPp
	 HU9SPuWhTNiOw==
Message-ID: <7bfa5ca7-59f4-447c-926c-a58250a5336e@kernel.org>
Date: Wed, 10 Sep 2025 15:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
 <1d9287ac-1c6d-4f83-b95c-b69bbeb63147@linaro.org>
Content-Language: en-US, nl
In-Reply-To: <1d9287ac-1c6d-4f83-b95c-b69bbeb63147@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2025 13:03, Bryan O'Donoghue wrote:
> On 09/09/2025 20:46, Loic Poulain wrote:
>> Add the <linux/bitfield.h> header to prevent erros:
>>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>>           |                                          ^
>>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>>           |                                                 ^
>>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>>           |                                          ^
>>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>>           |                                                 ^
>>     2 errors generated.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

I couldn't understand why this wasn't caught by the media CI.

It turns out that media CI compiled with allmodconfig, and if you do that, then
bitfield.h is included automatically via include/linux/fortify-string.h from
include/linux/string.h if CONFIG_FORTIFY_SOURCE is set, so it
compiles just fine.

If I compile locally, then I see the same compile error. Moral: always do a local
compile as well, just in case you hit something like this.

Regards,

	Hans

>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
>>   drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
>> index 7a8fbae3009b..22a30510fb79 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
>> @@ -6,6 +6,7 @@
>>    */
>>   
>>   #include <linux/completion.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>>   #include <linux/kernel.h>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
>> index 55f24eb06758..30d7630b3e8b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
>> @@ -6,6 +6,7 @@
>>    */
>>   
>>   #include <linux/delay.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 


