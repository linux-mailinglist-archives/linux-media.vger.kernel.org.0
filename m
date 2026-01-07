Return-Path: <linux-media+bounces-50111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBCCFD340
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 11:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E78B315981D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9A6308F3A;
	Wed,  7 Jan 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glHxouxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzS4tm4T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9662F7AA1
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767780394; cv=none; b=tzj3nXEkhLdZufrRr025zQ6e2R9lMOkS4ZqehlIuR8u04rtiPjo8UtSz9uWdgXZkf/BFDwAkOWAuBeVN1o2ZKehVipuWl0wiEgtq3ZDyI/fK1NHKw4d441nvQsU854Ob0GH2cyvAu7T8P4b4+T87aJo4cMJ9msVCXx35eBBJ4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767780394; c=relaxed/simple;
	bh=0BRTxWxGjawK6eMAOZak+mLfcQ0fkqslVtWiDati0lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWO2vP8ilZd5bsBvZQerhnaT+bVS+qgRHPUa3MA3fJKxLXWwvOUW/7dYSz1JkAFl9G9ddh1U8CgxyJTp5doKVED14N6saUQYP3iqphgpcFfpoY44k+e47zn/QgXSP3wZ7NYlFur3L+WezsHhVYa5jEd/P6FCEBDYHYi+b9QYrQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glHxouxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzS4tm4T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dpQ22593276
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 10:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=; b=glHxouxMdhFtLAO+
	M2YWjJ969QprB+ykSxHbzEkhXlT8d/BQ6nOGq4M3XmwFNMFyUgd89RVNY9Wry6pr
	PvQezU+2LkzjsjwnpoOR3KUsSQtoxFoQuZjVWjY/BLAfgSdNSqHCIxuaDCyfoUqH
	nuOKDHg7xjgwK3VE91EZCJ1Nekq5+Ye14mKKS5beaIcpxmL4NR6KjzJ0vve0tHzI
	+2A3cu5MKWIAkTSwTFXxh/mQ1vfhf78dcn8ADLSFQZjhu45LLqUj69S6MIsabvVh
	+UHmudo+VdOViww7dJhLBAMduusUb4u1NU976lsd8uhdogegLpCNGgvDTz1EbwLU
	rE1faQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn29038f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 10:06:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so3510579a91.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 02:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780389; x=1768385189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=;
        b=LzS4tm4TVtNP65AdRTzcfa2/qo0OOEKz4O4T8cdGk692WWnEVR33d8thk62GS0nY3J
         nBlYsR5fxabqFGbiAcay6aYq+wgwDK+k3c9voawnOhPN7OcWC4fhBmnXBl+V1GqJO8V9
         RfC7t93GWRg1chVaf5E+u3rirwv36NNOgBKOhoobY4YDsuiRaNGKwNmzAFKEVcPINalG
         6WQ+H6hTnEBWBYREmt7M+bWhV4tcVQ0oiCxmycIjKAsVqS8SBJ0BuVvrLapxgmKFB8U4
         Mnm4c7zFKz7NNzzoOtpt8Xf0r+AgJUO9y1EgX0v4aHpYhNgyG4K3ZRjnxQOO3CylmGGv
         1eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780389; x=1768385189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuPsoDygRtCm+B3QnTnE6+ORwN0JGYQnVi7qPIuw+1M=;
        b=diGyElnGlE4rhKnmvTYYdKcJNWjkpBHejSpXAbFnJifXHjj+XfIvJSrsYganddKpJf
         ju++KMiv4jKOrPNrJdOr54W/Oi2Cq4K787W8aDbEi41A5NHfqZ/maZySy4duiplt62yY
         +qDnJ5qeXRfRdFpy4sMlHhoEkp/OlJQJlV5AwO5JsBwlwt0KW8p6EYQrraaC7EpIeJzI
         f7hSO5idUQnbuuEfttvy4/uLkDNs/DVUD90aFEOd+NwjonltUkip2kBwknWOl7I1Nea7
         ZEzVVr4MAtrJ4zejLIoz61d9YiMU5Cgqqb1dmxODieljEuPe64fyZ70bMoAavBKdBLkE
         UGPQ==
X-Gm-Message-State: AOJu0Yx3qEzZ0W2l7kD0/fyEbzpuTF7WaUImNacRQcuHPejHn5k7THuv
	apKEIPLDpT4eJoDFH0YGe9qpIcNjqSQGMjPTbVeFQ+Xh9b+ex9KdWSjeE0JwEMLQQdINLH4nDmK
	PAv4EUF8/rF7JQvrHHcUZ9eHKepuUEdvQhMUA9JMUwHCaSf5S65XDeKTsfMJfNrYzbA==
X-Gm-Gg: AY/fxX5U/He+t2Ecy95G+Ok8CQh3tSAMd+vEsMFQHiSrc6pfyLrRg/oW4P3njoAXvJR
	PVGueXpc22qGU6WQv7oe0Z5c8uo9epDVgsro4VAOhVbxfLgs4dQ6oMSLtZGb5cWGFhNlPldKALg
	kgu5tvCWMxugM1477EQqOls8AlghHrAt4WjAw1T3FD/Xn6pp5i6sF2gOaqAl+mcY2lJT9t9Y5bV
	jg1yqRNb3e/qNgINywQamj4CXMecHC/aLkt48pjPnrHbu+xP1vccqEtotCl1uTJYv7QSlQEDJ/P
	ZBVht+P2yTOR6BnD+l/eIi1sLi+bGDX6SkgT1mZKZNmkqh9NFiMFWJkk1CED6MEy5cC3kw8CIPH
	qwzo3daFz9BZFD79UkKduAKnNWu5lycLuRo6k5H74kzv3
X-Received: by 2002:a17:90b:57c4:b0:34f:62e7:4cf3 with SMTP id 98e67ed59e1d1-34f68b99fcamr1639018a91.10.1767780389424;
        Wed, 07 Jan 2026 02:06:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH36iLpr9vxcCvZo6QMDXLFAaGlRxVLK6uL2bVx/IVrS35zHE1kv1B5Lq6WmZwEDYPJRwjjYg==
X-Received: by 2002:a17:90b:57c4:b0:34f:62e7:4cf3 with SMTP id 98e67ed59e1d1-34f68b99fcamr1638994a91.10.1767780388976;
        Wed, 07 Jan 2026 02:06:28 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb7419csm4691982a91.13.2026.01.07.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:06:28 -0800 (PST)
Message-ID: <205df0d4-e04a-9871-1250-fdd04096ac38@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:36:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <O9VbTIO27YZQtoP7kUJIYBpFFDhMXlbbJR8jyMEolmhNR3bdeVgUurIu8vvs-Fwft5BcsNOje4d3_ofI1hPe8A==@protonmail.internalid>
 <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
 <002b8748-eee3-4bd8-bdb4-365ea949a969@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <002b8748-eee3-4bd8-bdb4-365ea949a969@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mQFDH66L8Qot38fSwmQKAJlxr6XjZ6td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfXyO/gdQJeHlew
 SJAGWYMx4wLtJXFm5ugLMkDXoYieqK8qNCbHhqRQfe48Bl5XvdVZzit9k+Nt9kW979AMs+7+0jG
 xo3vy6k4I7MOilg6J2e6r03xwYtOJqYJ1wa5+46BPvMSsZfjTsJDNuFylQ0ucT4fAinL5vf+Oc9
 gsk2MErInojTJDlp2Y2hpNspbL7AolT4SiU9J03MPurewTKudQMknLBZPDN1dc0zOeS+P5tP6cc
 Q5rt1Sxh3ocN5c1ptTUE9xfp/jGzsGwFGSoOaC9W2byxRWr31OlOjxWC1fPf09nyjTwfc37M5kz
 7QgcZ2Wflk8c6/2AhEGWDSVK6u6Iimxkm1NHIL8eP9KzTsLPrL54j6h9Ka6Zozpbn+ib1LP0s4N
 gGLBe5wJRpG0pOgY4Lwm4RbXj3T0O5jxbZlE9dLD6pOT0Put8Vt7ybH3rVbmS4OJau43SgXJ4ht
 7udPiV2d1DrMIIZb1rg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e3026 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I88IWsW9MQcBA6jClv0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mQFDH66L8Qot38fSwmQKAJlxr6XjZ6td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070081



On 12/30/2025 4:03 PM, Bryan O'Donoghue wrote:
> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
>> session_close is executed, which will kfree(inst_hfi_gen2->packet).
>> If stop_streaming is called afterward, it will cause a crash.
>>
>> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
>> to firmware to fix that.
>>
>> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index
>> 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct
>> iris_inst *inst, u32 plane)
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>>       int ret = 0;
>>
>> +    if (!inst_hfi_gen2->packet)
>> +        return -EINVAL;
>> +
>>       reinit_completion(&inst->completion);
>>
>>       iris_hfi_gen2_packet_session_command(inst,
>>
>> -- 
>> 2.34.1
>>
> 
> Are you sure this NULL check is concurrency safe ?
> 
> i.e. that ->session_stop() and ->session_close() cannot be executed
> concurrently ?

Yes, this is concurrency safe.

Both iris_hfi_gen2_session_stop() and iris_kill_session() are invoked while
holding inst->lock. For instance, iris_vb2_stop_streaming() locks the mutex
before calling session_stop(), and iris_kill_session() / session_close()
also grab the same lock before freeing inst_hfi_gen2->packet.

That ensures they never run concurrently, so the NULL-check protects
against the packet having been freed earlier without racing.

Thanks,
Dikshita

> 
> ---
> bod

