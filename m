Return-Path: <linux-media+bounces-49964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6ECF6CF9
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 06:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85AAE301B67E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 05:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E1D2C0284;
	Tue,  6 Jan 2026 05:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAP7eVlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKKIQDJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA851E1DE5
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678456; cv=none; b=WpwMm0ZqVxAzEkj1mnNECYRbCnN5KbhFoI2wbvBI83TUw4Lt48hBP8gs1gk84WoQUPZuslJGDVgrJkN3dMOLPsCjLkrIPoEdvAGwWlAplBKvScbrcy0vynZlCs/pbW0WHMYLUBJIxaP/bxItT7lunseynY+M41+2K2PVG9K2Gjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678456; c=relaxed/simple;
	bh=i5vu8yGtk0HellFqwFion2Ak+BLdrYOZ3p+b7cA7O2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9hAgOUIBOgQFLqkTFGb9aHQhvvETD+CET6xqYf5dv9qLAPrh952L1RIsqWUuras3ZtnHNJB9the2xRdtSywbPNh9uCMjR2miqU/0rKBaAZuFz+7sCy6rp0v4I1f/f5nELER3nlImg20cDm4CUqPWKedzixBUHnnoA2TAOEaASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAP7eVlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKKIQDJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q69H2429813
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 05:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=; b=XAP7eVlDEBf3HO5X
	Z5kLltiIdRQEI4G+aYhLKrtj5JSS0y2LWx4TPeAsYGr82aTuAi+TLgdLxfCmfYyt
	doeMwIja2ciD1pe5eDMfMMWAwmP7SWkHEoenGCsIsr7MA9od+n/Iwosn5itj4FYL
	yyWTk5JwBsYGEtsjQ2NO8/GddyhmfImNX4m7DIX0KhH4vtb/7OZGPan+pr2scpxm
	g0a8rNmSLupsDy3MZfVMyWFCDbWiCWeoo+Y+Ac13RgcLThFZe/iXrJ33Z/99FcdF
	yYXDHNpflLLAgz4ClHDrbH7bxNShkXGqT/8bnnYtJsIIr5sq4+Hlw8kFJ49FLOL2
	yZRJWw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr738p6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 05:47:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-804c73088daso452863b3a.0
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767678453; x=1768283253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=;
        b=MKKIQDJ2ZxHG8XVcJEM0uyrsE5dycbYVJ8QrgwE0HyoiwManfOe6eqn5uamFkAtrwA
         AIQF4ptF168OWZNpv4FMbXGoOWx/nx7JJeYutEnX6vNEbb0fer+qeR0141Aj+X4DLkn1
         m+k7NZraOaWP2IjZN+tDF458+r2xNk/MpA1kntEm2mdFdofmS2mBq8UZPYBNOY07/nuC
         6K0RuObNc6w1UkXlXYIOLaZMHlbQmPb3m6/oWzTloxHei0BPQa0NtZbC0qa8ct6fkjjw
         khYZxJVPcNtE1WCqJQmJ4Xl634LeLHW/49T+gthZ9QjjyfQSPYrieJsf4Fv3f5oGFSOY
         YeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767678453; x=1768283253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=;
        b=VHDDn5Og1hTxetPI7UPyyAZI6k3k6mAFjI5E3kPph8dhSyXWHfMcUP49/OpQvolLZU
         5NvLIcqEIJ6mdmI9rvfvOxBF6EDu8KcXu+7ZKFk+sVQQmor3lz3B53Wxt8Dae4iJuuKa
         TY5hnrP4nZD/tyG4wBGCHmhSDW9B9EYmZorwiwQya3pU2+dH/BQ8J7P+tZiDhicdhLgK
         ZA4r/eydxAvM3OmIB47wSY2teJfBKsRI9YE+SRri6dwNEkyoYLuR0GSjSQtRR6rMfria
         1suYrZaQWDrUFksCWqrrhSz45ta0EGC2xB4IZruGkaqIImO0SIfVHGbEG5YLBOTgoQNa
         ZIhw==
X-Gm-Message-State: AOJu0YweUsjMOFwrOsctdYepfnXQ09aErnGRIO2G9TDPEtlz1jPfSxPq
	tTA5YkBQOhXwihDSUCmsY8SuFSHHtXKe2um2Q5SlvAX3POtnaZzIT9l8eQ9wVfYzJEALV5vZhGk
	v441Xb8w/N3QtWq10se9f+71hLT4RQ/5sfzBlHQPET86fCQGxVXujRazNkh0gq4FYwQ==
X-Gm-Gg: AY/fxX7i4ZEXsCtLe1h4tU4/8LwgVnN5LfB+oSJlGlXzDjP61roQW7XlxSFDwItgFa3
	mIZg6hPTcGZxaweAuXkORVlNt8HLXRzfggmMMY5AoPQgAyBAxgSlBNoOnhNSbN74JKWINQjEJus
	dExaNEBhNnAjgefNTmoht0Hzsv3CsQ7ctDg+1eSq+y4mMXXFrMct4G/qgn3bRGexWbYSS4+lwfw
	i+7pPmEYlFXmwVPdX2uUkPNfJc2tDhjzCwyZgHO6Kuj1SI/kUAL99Z7u0LQea3ObHXFQ3WdstGL
	dT1oKbcejSuE6vCcV7ksRWlBum6WXDoym2x9XF2w0QhBpB46TU1EZVk/FHf8b4zUOSdHTARc8tD
	Itggu9zUZVtgT0D3V9T+3AZ+TA++W/KcHoQXG54E7
X-Received: by 2002:a05:6a00:1ca4:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-81943604d69mr1437586b3a.1.1767678452206;
        Mon, 05 Jan 2026 21:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEue9Lvf8RRacycC5QXHlj4IZU+nH15hS6qZlJLf84LJckOP3lo8PGfHYG0pdCX00cFZmVHlA==
X-Received: by 2002:a05:6a00:1ca4:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-81943604d69mr1437562b3a.1.1767678451654;
        Mon, 05 Jan 2026 21:47:31 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edd921sm846505b3a.69.2026.01.05.21.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:47:31 -0800 (PST)
Message-ID: <4a3b5af0-b9d0-c874-b788-92f406bd6eb9@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:17:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
 <69aaa79f-27ce-4308-aecb-260b50bcd0d6@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <69aaa79f-27ce-4308-aecb-260b50bcd0d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695ca1f5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=uEWbcFbpE8I7qiizULz5VQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=kpyLQs8HHTFAnI9_2BMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 0_OVvFkNalDH4zt55IGgqBXIXRcePg5x
X-Proofpoint-GUID: 0_OVvFkNalDH4zt55IGgqBXIXRcePg5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0NyBTYWx0ZWRfX67eR9Kl1/gGo
 EQzyFc0+mxDK3eZL8JRJCqMNAh1ulu9U70CFSovgn2SaEoMm8C8vWuD/r1ppRFPoiRNhTHPdbtv
 Eu/uXqlAICLbCl5R8xo/9i7gLELVdrYSUjp1HvRLNePSM2kO4MAbKJGJji7w7rOyELn/JE75oUF
 milhKcUJx+TlXl457y25ZfFy2M1G4SDxADvx4J+q/P3yssLM/up978zINwyMQYWIqyp1kFZ7fhe
 vb8Y0HQrF/vAYnUQPIihdWDCRhzj8l48cdWp9cN3O7NLJKtmIh6UPcNFlcoIbn2Cdjg07VzWcCu
 DQ0upQ46qfpkFg3MYD1Er3Ifh3kxRbgNjv7BCqPUPiAa8IPISjKi/cpmR7AJas7mH9re8Wr+XzH
 CWy4vpprhHeRgqnj70pCYWPxYn/Z12e3d+Rwcga4bxMg1TSdyAuY6Z7lO0M0YN6tIZb/oOBTfue
 HKj8jqBIDc2R9DgD3UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060047



On 1/5/2026 6:20 PM, Bryan O'Donoghue wrote:
> On 05/01/2026 09:51, Dikshita Agarwal wrote:
>>
>>
>> On 12/30/2025 3:55 PM, Bryan O'Donoghue wrote:
>>> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>>>> Revert the check that skipped stop_streaming when the instance was in
>>>> IRIS_INST_ERROR, as it caused multiple regressions:
>>>>
>>>> 1. Buffers were not returned to vb2 when the instance was already in
>>>>      error state, triggering warnings in the vb2 core because buffer
>>>>      completion was skipped.
>>>>
>>>> 2. If a session failed early (e.g. unsupported configuration), the
>>>>      instance transitioned to IRIS_INST_ERROR. When userspace attempted
>>>>      to stop streaming for cleanup, stop_streaming was skipped due to the
>>>>      added check, preventing proper teardown and leaving the firmware
>>>>      in an inconsistent state.
>>>>
>>>> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>>>>    1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> index
>>>> db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>>            return;
>>>>          mutex_lock(&inst->lock);
>>>> -    if (inst->state == IRIS_INST_ERROR)
>>>> -        goto exit;
>>>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>>>            !V4L2_TYPE_IS_CAPTURE(q->type))
>>>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>>            goto exit;
>>>>      exit:
>>>> -    if (ret) {
>>>> -        iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>>> +    iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>>> +    if (ret)
>>>>            iris_inst_change_state(inst, IRIS_INST_ERROR);
>>>> -    }
>>>> +
>>>>        mutex_unlock(&inst->lock);
>>>>    }
>>>>   
>>>
>>> This revert looks strange, should be something like:
>>>
>>> commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD ->
>>> next-6.19-camss-v2)
>>> Author: Bryan O'Donoghue <bod@kernel.org>
>>> Date:   Tue Dec 30 10:20:01 2025 +0000
>>>
>>>      Revert "media: iris: Add sanity check for stop streaming"
>>>
>>>      This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.
>>>
>>>      Everything is broken I give up.
>>>
>>>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> index db8768d8a8f61..139b821f7952f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>                  return;
>>>
>>>          mutex_lock(&inst->lock);
>>> -       if (inst->state == IRIS_INST_ERROR)
>>> -               goto exit;
>>>
>>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>>              !V4L2_TYPE_IS_CAPTURE(q->type))
>>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>                  goto exit;
>>>
>>>   exit:
>>> -       if (ret) {
>>> -               iris_helper_buffers_done(inst, q->type,
>>> VB2_BUF_STATE_ERROR);
>>> +       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>> +       if (ret)
>>>                  iris_inst_change_state(inst, IRIS_INST_ERROR);
>>> -       }
>>> +
>>>          mutex_unlock(&inst->lock);
>>>   }
>>>
>>> Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your
>>> commit log ?!
>>
>> Yeah I did the same, revert and changed the commit message.
>>
>> BTW, I don't see any difference in my change and your commit, anything I am
>> missing here?
> 
> Take this example, I believe the "This reverts commit xxx" is added by the
> revert command and its best practice to include it.
> 
> commit afb9917d9b374ecb77d478c2a052e20875c6e232
> Author: Christian Brauner <brauner@kernel.org>
> Date:   Fri Dec 5 13:50:31 2025 +0100
> 
>     Revert "net/socket: convert sock_map_fd() to FD_ADD()"
> 
>     This reverts commit 245f0d1c622b0183ce4f44b3e39aeacf78fae594.
> 
> I can just add it back in with the PR though its NBD.

Ah ok, got it. Thanks!

> 
> ---
> bod

