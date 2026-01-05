Return-Path: <linux-media+bounces-49895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5953CF2E09
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52B4307CA6E
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE12730F52C;
	Mon,  5 Jan 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGHdH/6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K46E8ve4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653232F25E1
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606729; cv=none; b=MVglLsY4F39QTtVjdjZYxiOVdQOCk4j1S/7C42+xcdnRTPMsg1BCSx7rMErD+XbNfZehfemnVg5efm4O9Mi2vwXnj1VGq6jg2NETE/YXFsweuUHIKLm4jGrHu80Ih09DjK7CbrakXJvL7sCSphRsWkrZYsrU6/e+Ch9RWxWWjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606729; c=relaxed/simple;
	bh=PY/vWrwkmC3rE8an8wbxBfu+JdIgIZc28Y/3rJMRg10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Quddgun+RQ1IIPoO2X7fu5bSax/dy9HSxPU2dG4VH3wW0+cYelesgx6m1Srt9t32epzsPRsqhzfrtTL6h+5CfdFTZMpc40+McJnuvW754yfXfwOD4xP/XOdGeYRfg+ppM3hPT0Wc0pcW8ZsnyOQNag19x/74fkfs6N3RwmTJ7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGHdH/6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K46E8ve4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058UTLv1207936
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 09:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=; b=gGHdH/6O/7EfnN4H
	Dhh4cPXdMFa6tc3Kr/FiQ4NwvlUQ0DiLR7NhnUiE0DqPAqlQ+EQwGy8tu1THiVq0
	0BI4VhenJZn8+rUEuY2SVtxMYsCwOCeWMF5w/v1W2H1pOrqmYbqKkRbd5qaSH904
	gm4odX6aE2LSMerWByJjVLvAIF5GjtTbMWxpgDh1uEjAXakb3jweqm2py8xSw2CC
	D509SCJ3QmPec3eWVNBKs6UEovRFVveWEfTunVTChSq0bUtp+UjrnIDA+8nyrOcp
	ygqD0y1Hn5MC8zRD0dVUWgf207BxYbJk+XEKQ27lGjvTWysF1P9WTINaRniDlRwJ
	R3OGQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hc0ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 09:52:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so337074285ad.1
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 01:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767606725; x=1768211525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=;
        b=K46E8ve40AMnWBlbsyB8gKO5hEKUmPGwqRBJ1LQ5w175Gh237MxexsbsmgQOjznBmr
         +bon8odxBRCI/AHPMY9LVJ7QPDxKNDN4rjRbHMrpKoq23P4N6hQQp6EoyoPr3lXEdphb
         AmdLi3mrIqWupItIH5X3a3h3XiUjOW4b8++rSjnTI0rcG77rB2nsjvieaVYsB5UAYhu0
         NI3YCGmTDNfxExU4fPiz2+3Nj7fT+tORoawyqga+XxCLxRv7ZWg/ASgbo9k/wjcfLVVF
         rrN98VGqrC0LoJtfK2oxGWYTwkxEETXOIre+GTtHwEiMq3lIZBwX6T2k65qbpek+yhgl
         lJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767606725; x=1768211525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFj/d3x1hw4BjQeGbLCpbgmb7YLWZWo6j8+s+Btri9M=;
        b=sV/sXIWUaI+UOzQN2gDyMyso0SIyoa3Vps4FadNGuI5ISOKog9I465JKKZwmGU0ttL
         1tUXWTqykPwkujppjAUnjlvvTTCp/YVA2igONin+6uC42qtPwXynts3jy9GF6EHh4hwZ
         7n+2jwEEow3mgg3qJPwJApwZet330xAu8+CGwdUhA05QoaAeJdKkXp1EB0X4wRa3Y9H/
         xzIYmNkly9Pbk0biUFC2xznyCqj2oYB6p5zsVv3Sr4N+re4HP2Vl4CkRZk8tsIC/djKw
         9VNkC20mu/OafIi275n1h0gnS4CzMp81mcaXDrZlbBo8BUJ9BvdPY6Qq9b1UeP3F5UXp
         qLSQ==
X-Gm-Message-State: AOJu0YyNppZonjhzRARFLBj7bjLoLr9nGlzN9GAp+9bAbohK5m/El42i
	R5V57BT+LySblwQgfYHhPZlRlCXO7sEY3RDooxWlZF+vyXhYNa0dSCo+CSPoxdK8CiWhkFZG/9t
	KC92Y5D8RJK0xGzsSVbyLmLILlDUYLhalXCMKGy/cuu3pMbK8wRuK21t0TtIzQy+adw==
X-Gm-Gg: AY/fxX45mj+VFETM/WipH2k3U7efQeIfVX5BPtFVyLYwDI4ZyYs4Q4VpRdf/mdi5Y7d
	i8rNYI6Ns+2uRjXdNADAdp6om2KhnGmnHN2qaBwrPxxaY64TJbDaoi4BQeFWKfAxVw61qpzilkn
	2iFFfrTNgcXzmw1rPfNMcJVMFN/cUKF9Yukkzexj9Fz7aBJli0/nfCbSudSz77mFJOwswnMI+h9
	ofgsMP/gpCyAmGUNXZknOQu3T6jfJm49ULQJYoMhTVlNlJv3x+mYEkctOSmUIC7wKNj18V1O13g
	Ql6Xmdq3DyZsXnqvcqshe5NphfKuaI8l/yhFEP4dWYZ5zaGT36RwWKupaV01ITCNahPFGdew3AS
	zcWEkxEu53GoIxeHlC/YuppJ6/nfUOnlAsXzLiWpwGfH1
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr527919295ad.7.1767606724651;
        Mon, 05 Jan 2026 01:52:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQjZNT26R3hug1VetovPBZshR48geoV8oj08OmGFIuvl1nrIlFHq0cRbx3/mJ/zcumVZnUAA==
X-Received: by 2002:a17:902:d584:b0:29e:9c82:a91e with SMTP id d9443c01a7336-2a2f21fc506mr527919105ad.7.1767606724130;
        Mon, 05 Jan 2026 01:52:04 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm448829815ad.33.2026.01.05.01.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 01:52:03 -0800 (PST)
Message-ID: <a899436d-d14e-bd16-7727-e342fcd02de6@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 15:21:58 +0530
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
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA4NyBTYWx0ZWRfX8O8l6QuYQb+c
 5JetwvVmtl+UvhEN/cHLPtIyaDqN8xBwv9xUL6dmO5hHMcOmle8Cr55TbfPckJUGJNlR1KUiejR
 O67hMxcyv2ZnHpmsUX/ldAiq2/7Vz0wysM5BcPeawX4arIDcsSQ5RieNzKK3SQJF3qpqjndOMOw
 s7UvtCB8BxAnOiojR5YSbeXg0dNVnIey7EAdz1Kc674i6/6f2AQ23HsuWfmn9ppPHUrMQAdleZU
 uC9e3qQTP5MpqH6JVePVRUcKW7wCeyFxp8zuEurLqZLLSDE3nx6yEd0VXnnoNzEOPP/w0Q2tW2M
 hEr4JTB0GHPfXTAljKRiNlN/KiHDcLxj6QaSRVA9nuqmjeFm3Zzval7hzuMCngWH/JcowYAVntI
 cJZ9goX1+kgGaJ9QY0P7XWtGKb4+1iqZE1iYpIKbSW2WRGLf5Uxb7Fy658d3YBc1G8FcFj8IVzW
 gkfOmWuO3HePCqgXRuQ==
X-Proofpoint-GUID: XUVl2O8yI7w54_dH8nSfqw2NrVB5YZkb
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695b89c5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qBENiv7BgfysxtCeYdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: XUVl2O8yI7w54_dH8nSfqw2NrVB5YZkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050087



On 12/30/2025 3:55 PM, Bryan O'Donoghue wrote:
> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>> Revert the check that skipped stop_streaming when the instance was in
>> IRIS_INST_ERROR, as it caused multiple regressions:
>>
>> 1. Buffers were not returned to vb2 when the instance was already in
>>     error state, triggering warnings in the vb2 core because buffer
>>     completion was skipped.
>>
>> 2. If a session failed early (e.g. unsupported configuration), the
>>     instance transitioned to IRIS_INST_ERROR. When userspace attempted
>>     to stop streaming for cleanup, stop_streaming was skipped due to the
>>     added check, preventing proper teardown and leaving the firmware
>>     in an inconsistent state.
>>
>> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index
>> db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>           return;
>>         mutex_lock(&inst->lock);
>> -    if (inst->state == IRIS_INST_ERROR)
>> -        goto exit;
>>         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>           !V4L2_TYPE_IS_CAPTURE(q->type))
>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>           goto exit;
>>     exit:
>> -    if (ret) {
>> -        iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +    iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +    if (ret)
>>           iris_inst_change_state(inst, IRIS_INST_ERROR);
>> -    }
>> +
>>       mutex_unlock(&inst->lock);
>>   }
>>  
> 
> This revert looks strange, should be something like:
> 
> commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD -> next-6.19-camss-v2)
> Author: Bryan O'Donoghue <bod@kernel.org>
> Date:   Tue Dec 30 10:20:01 2025 +0000
> 
>     Revert "media: iris: Add sanity check for stop streaming"
> 
>     This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.
> 
>     Everything is broken I give up.
> 
>     Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
> b/drivers/media/platform/qcom/iris/iris_vb2.c
> index db8768d8a8f61..139b821f7952f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>                 return;
> 
>         mutex_lock(&inst->lock);
> -       if (inst->state == IRIS_INST_ERROR)
> -               goto exit;
> 
>         if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>             !V4L2_TYPE_IS_CAPTURE(q->type))
> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>                 goto exit;
> 
>  exit:
> -       if (ret) {
> -               iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
> +       if (ret)
>                 iris_inst_change_state(inst, IRIS_INST_ERROR);
> -       }
> +
>         mutex_unlock(&inst->lock);
>  }
> 
> Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your
> commit log ?!

Yeah I did the same, revert and changed the commit message.

BTW, I don't see any difference in my change and your commit, anything I am
missing here?

Thanks,
Dikshita

> 
> ---
> bod

