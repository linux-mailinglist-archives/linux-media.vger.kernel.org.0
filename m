Return-Path: <linux-media+bounces-39811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD0B24958
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9977E7A995F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 12:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7541ADFE4;
	Wed, 13 Aug 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JQYMQzt9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3E14386D;
	Wed, 13 Aug 2025 12:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087415; cv=none; b=Ipmm0WeJzaPiLooh+fhtj0+zQclNul2r7culac0x/TMkpjcp+foI13Xb8NfT3gW4JOP4kJ7cIOykHJfS1gaYTqi33tPxS+ME6X8hHc0QCdxsMzNxHV7qrVrpRR5R1ODjvTakjT71S8UYiGaQvEwSWJKYbDZusIf71BPTx+ots1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087415; c=relaxed/simple;
	bh=Fv8eVEK31vJSE1lNjyb59YLvkth5ttFeEr1vDRsI+cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rn0FKfYhB/VLQC9020o/1otf3vjT14LzNbyVwJsLilsIM1lCYvv0TdKjh028s4oeBBUlVzvfQvepFwVNWlQfnjmwSKvk7RHLLoLhbpF31RyDr36qzwN1pLi1Du5fFyN/sOBkVdRZnIdFhvTQEQ3ul6PjiSpOg1IcKVoJqjtNrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JQYMQzt9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLelP025656;
	Wed, 13 Aug 2025 12:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2f/6WNrjEZSAYk7zWzIZMZXEj+9ZM56XoGtHZQ5EXNI=; b=JQYMQzt9LmUIkqjD
	+ISCoNHseXjcJm/Zh1VfzaBzRnNs86fL4RbyDWIa7FKAj5D9EU1sGe84HphNhJKU
	OjHOxlYmLC23HitR/gjGER1SwwexIa6nfC43S+0WrCxCB3DQCeCFiMtoz2eKTTfk
	P5Zdh9AKfsaivheeKACD7MTb7xMf0ZUaRrFozXx5YUMVuqxgqwrhoXNimLUukJxS
	XfwcvLvJATy1EAgWGOrpOnrUX3qzpjUnCuKT9EHPtX9YVUx9xzUDGPSZnJCAFesf
	BMja5pJCrjo8ko7CXCgKKMIzRQRLU7d5gJLzj1HbFFLn+2gghZph9W4liuN8sFGC
	lykJeg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gbpfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 12:16:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DCGjmP026983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 12:16:45 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 05:16:41 -0700
Message-ID: <a482d0a3-92da-998a-97a7-ccb010aa6bf9@quicinc.com>
Date: Wed, 13 Aug 2025 17:46:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/24] media: iris: Report unreleased PERSIST buffers
 on session close
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-2-c725ff673078@quicinc.com>
 <aJxuvm456i1PWOIM@trex>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <aJxuvm456i1PWOIM@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c822e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=_0ZXF2jA_ELrfagan30A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX032HRh1GR0KF
 zKphtYHH/M5UoezAQj+YBFFIYNn858auImCdl/Ijcu3IpW3I19MUn9f2sirbbQRTwUdvXbqDSz2
 2X0viBhbg2OZThj7awiPknMmvgM/eaTT7vOHr8Kvbwpo6oPfnzZ9bK+x8mrYApPYJ5v2Ty8MeQ+
 Tr0xa5dxf1y6BrF+8EsIXIMTg6YWogTQ14v+CzV15IkxFQRKnXHmzyPPZAJLVnrxE3qee05XJQc
 +6YjKwUeQPEq6+x3f+QGIJLcX8YvCfUd599rhmmMvJ6PfvE9RqQ2cVpUW+JFFQoYjLQ8v1eVukn
 McC1E6dx4NMma3ZPWZpAuvbm5lmfARzhz94vJEQgGJKO5t65xDsc1yMK+GlWQHgAA+GnDU1c5Rg
 X7Cqes9x
X-Proofpoint-GUID: oRlwJ8V5lr4MA6sJu3kXmuDyXjXkSz6K
X-Proofpoint-ORIG-GUID: oRlwJ8V5lr4MA6sJu3kXmuDyXjXkSz6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/13/2025 4:23 PM, Jorge Ramirez wrote:
> On 13/08/25 15:07:52, Dikshita Agarwal wrote:
>> Add error reporting for unreleased PERSIST internal buffers in
>> iris_check_num_queued_internal_buffers(). This ensures all buffer types
>> are checked and logged if not freed during session close, helping to
>> detect memory leaks and improve driver robustness. No change to buffer
>> lifecycle or allocation logic.
>>
>> Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d..96313856a026efaff40da97eaaa63e847172cd57 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -247,6 +247,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
>>  			dev_err(inst->core->dev, "%d buffer of type %d not released",
>>  				count, internal_buf_type[i]);
>>  	}
>> +
>> +	buffers = &inst->buffers[BUF_PERSIST];
>> +
>> +	count = 0;
>> +	list_for_each_entry_safe(buf, next, &buffers->list, list)
>> +		count++;
> 
> I believe at this point is not safe to dereference buf
You are right, I fixed it in later patch, but it should be fixed in this
patch instead. Will make the change.

Thanks,
Dikshita
> 
>> +	if (count)
>> +		dev_err(inst->core->dev, "%d buffer of type %d not released", count, buf->type);
>>  }
>>  
>>  int iris_close(struct file *filp)
>>
>> -- 
>> 2.34.1
>>
>>

