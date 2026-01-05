Return-Path: <linux-media+bounces-49910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E0CF39C6
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 13:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E68B303B1A4
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 12:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520FD34A3A7;
	Mon,  5 Jan 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBsTGTjS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A2334C0A
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617462; cv=none; b=iX7XD08sPGk4NpDGq+bExDnJgcNoZKNJQSspeJkAemI1dl2zsRrQPrhg5dtkUaz2WaSlxIzVKcYhNlVVyKvI861eRSYpABVplylZmk4htvbfSHIxu/ulEbxscdXmSDg+tUt646JLbbjoLBmzlq4WiyohAJNqyKYUiztpXUNmyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617462; c=relaxed/simple;
	bh=Smtg3ZsRhfb//6p2suicnnjeLX0oaTRkY1+J4vXxqMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsLJRpsc5q+8JmOvO9ln5Su9oK8R3XTldiSyf8w85/sy6A0CqdOkn8O12oacdYNDa8aEod/0T/1hCAU9mV15yMiNiDpzWxL07f17HehpGXGqhFBGZCyCyRlxHDJEg6Px7DkXGziP/RdHqeQv8MnzXp4auwTasavnYYYxejk/CcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBsTGTjS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so8389006f8f.3
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 04:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767617459; x=1768222259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWNZt1SGzt14SUcMR/yCQ6a/T31cW/0Tg4YtY+QDgm8=;
        b=MBsTGTjSb6x1PQhcdvvyTOgZnqnQvVToEeIlPZicLjJcQIOBq7/r1Sra6lmv0bgBJZ
         7TCZ/XfqeblQROOi80mXzJTTaWqMCF3jZ5ly8Ge4qNWJyxR6d+CC0RUhTwrB6FF77jao
         AR2KQdrKbgPc1TuhoIg9+zBDU9/KXFjnbUVnOA6BFnhOxrYi8AvvAAxEVCMrmTJegmkn
         FQSjLWY9aha7XsdnIAjhkZr5jHirLZYZUycONhibdQErvaYhgJOjFMpCXkspYMZUnSmJ
         0r7ZiZ6FTyPC2G1FFjJWSVnY2x6e6bYet4PFICrGB+2i3AlIxCUPYaogsRRpEW3ofiHf
         CHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767617459; x=1768222259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWNZt1SGzt14SUcMR/yCQ6a/T31cW/0Tg4YtY+QDgm8=;
        b=eg4Kx0x7SqbA6L5+57eznFGub6lzgv4eAIY481BUmwpG4EqpEZ2GntmgvRkw1PngXO
         mpkzJ2o2NC22IjRn/EqgJ7Qq3pjIKPKnMlhqqF7pa+FrL1T2fB1l8hVdUQpwBQUfeqp4
         H0dQB6UvRNCFb8U/uHhfbbOxVXvQ9JOaZnVsyncjb4Wmah4Z4iqOx9VJNHiv7ksHcnXS
         8nN58h83ksgdeOjhNpJ3JCGoX1CPbXF9PTodb5i1np6C+kysaPHaZ1kUm6GHvAR9jNfJ
         2LDme03zRPla8Wk7GQyWwLLb5fBcsJsZiqUk0VA55QulNTPwYm6Ryp6XSkIxiDE1obpR
         1bIA==
X-Gm-Message-State: AOJu0YwBjTngT3mtvz3w2zFTbCSrcUkkbhLUAINNMjb/U91ME9eStGxC
	0PgfOisSZfcZpPyYV89STQHHC5l/F3Hhat1nSdApURRFueWoWt1bPhqO+c4AC13oDWE=
X-Gm-Gg: AY/fxX7tg+jyvPFxvqnoABdjtguf3uexmZfNmInSWdtwijRIyvGt7fItc/CJcPAeJYb
	CLWjZdn7Jl6z1pOIrsvVsVexTPcKhv0PrFjN8L5ruFzwOCGyBdnzysaOK1HB3gbjB1+FhACR+rS
	jRObDHwxrBPw9YBBAqUltRzdyu2o9KtpfpZQNQpQKFnVBSe7uVeDbaMp5HtAQ5hYN2iqbf9TC/t
	OwLBD7DIWFZ64GFxiddiqFercyb9gVaC+Uc5s+a+NsXSKhI9Z12WdP0agv/XGeRHExRbAWkunvk
	LIPiUgDLqH7jaLRl/CwHrVVt3YgGS9v1JC66Lg1XBNjen6HVEd4iYRk4qMeMHnmWaONtxl1nJii
	sLkZ1JIEBYR3cuP6VwQt9X6AeefB9Zs1xYDS4K/NapDZJJxos4pheEV0EBhNpM6zzWh3dAWdLBu
	RMgQqCJjHdbIEQdUaXJnIwVYM/73A+QohzwWtxiJelNN4iGUh1Dbos
X-Google-Smtp-Source: AGHT+IHC4yjMD0I+XPDo/nNckglARtAgoTVcrt52c+LQE3dYpAbriX7F9Nzfi4lLP2yZuZBF6gF6ww==
X-Received: by 2002:a5d:5f46:0:b0:430:f449:5f17 with SMTP id ffacd0b85a97d-4324e50ebd5mr64605466f8f.42.1767617459154;
        Mon, 05 Jan 2026 04:50:59 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm95588952f8f.2.2026.01.05.04.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 04:50:58 -0800 (PST)
Message-ID: <69aaa79f-27ce-4308-aecb-260b50bcd0d6@linaro.org>
Date: Mon, 5 Jan 2026 12:50:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
 <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
 <a899436d-d14e-bd16-7727-e342fcd02de6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a899436d-d14e-bd16-7727-e342fcd02de6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/01/2026 09:51, Dikshita Agarwal wrote:
> 
> 
> On 12/30/2025 3:55 PM, Bryan O'Donoghue wrote:
>> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>>> Revert the check that skipped stop_streaming when the instance was in
>>> IRIS_INST_ERROR, as it caused multiple regressions:
>>>
>>> 1. Buffers were not returned to vb2 when the instance was already in
>>>      error state, triggering warnings in the vb2 core because buffer
>>>      completion was skipped.
>>>
>>> 2. If a session failed early (e.g. unsupported configuration), the
>>>      instance transitioned to IRIS_INST_ERROR. When userspace attempted
>>>      to stop streaming for cleanup, stop_streaming was skipped due to the
>>>      added check, preventing proper teardown and leaving the firmware
>>>      in an inconsistent state.
>>>
>>> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>>>    1 file changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> index
>>> db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>            return;
>>>          mutex_lock(&inst->lock);
>>> -    if (inst->state == IRIS_INST_ERROR)
>>> -        goto exit;
>>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>>            !V4L2_TYPE_IS_CAPTURE(q->type))
>>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>            goto exit;
>>>      exit:
>>> -    if (ret) {
>>> -        iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>> +    iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>> +    if (ret)
>>>            iris_inst_change_state(inst, IRIS_INST_ERROR);
>>> -    }
>>> +
>>>        mutex_unlock(&inst->lock);
>>>    }
>>>   
>>
>> This revert looks strange, should be something like:
>>
>> commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD -> next-6.19-camss-v2)
>> Author: Bryan O'Donoghue <bod@kernel.org>
>> Date:   Tue Dec 30 10:20:01 2025 +0000
>>
>>      Revert "media: iris: Add sanity check for stop streaming"
>>
>>      This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.
>>
>>      Everything is broken I give up.
>>
>>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index db8768d8a8f61..139b821f7952f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>                  return;
>>
>>          mutex_lock(&inst->lock);
>> -       if (inst->state == IRIS_INST_ERROR)
>> -               goto exit;
>>
>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>              !V4L2_TYPE_IS_CAPTURE(q->type))
>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>                  goto exit;
>>
>>   exit:
>> -       if (ret) {
>> -               iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +       if (ret)
>>                  iris_inst_change_state(inst, IRIS_INST_ERROR);
>> -       }
>> +
>>          mutex_unlock(&inst->lock);
>>   }
>>
>> Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your
>> commit log ?!
> 
> Yeah I did the same, revert and changed the commit message.
> 
> BTW, I don't see any difference in my change and your commit, anything I am
> missing here?

Take this example, I believe the "This reverts commit xxx" is added by 
the revert command and its best practice to include it.

commit afb9917d9b374ecb77d478c2a052e20875c6e232
Author: Christian Brauner <brauner@kernel.org>
Date:   Fri Dec 5 13:50:31 2025 +0100

     Revert "net/socket: convert sock_map_fd() to FD_ADD()"

     This reverts commit 245f0d1c622b0183ce4f44b3e39aeacf78fae594.

I can just add it back in with the PR though its NBD.

---
bod

