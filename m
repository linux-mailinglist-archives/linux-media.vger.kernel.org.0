Return-Path: <linux-media+bounces-27706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A049A54ABF
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68DCA168E38
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9841C20B7F8;
	Thu,  6 Mar 2025 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VcoGXBbn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19038DD1;
	Thu,  6 Mar 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264381; cv=none; b=iEgotslVc7bx07mM4AIFnw5fLeKdfC+0A2txHFnoBv9FgPTUAWQ3DSXyFA8BEC8lBF0/9Vt7nVNMLj7E2fqWOk3SBlu8C+glFG8uDUIm1a7yfYOjfJ6D25OCGM/JaAgeGGFBBLbJhSTDTOetJh6vH5ckf8RQ5ChinEWD8RSV80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264381; c=relaxed/simple;
	bh=QVeZ5GletvUdnT+/b5y2odd813HtDcAzt88hxqfsids=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CvagnkTKYaPRxyKJ+Xux8PSJalec+LSw9bWFXyDEozvPDrd26Lw9CAIG41YgGe6MSW0RPrL65/Fe2uspfFlG3eVEKHVOHzy0I+MGUnMQ8b5C0hzizeOF62IwJHVL66O6ZvL5as95jwVFc26u414Tx1cCCncmbzly03Rg+MPe9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VcoGXBbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5266mXQ3030823;
	Thu, 6 Mar 2025 12:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJavz6JLrReC2fziH5lae7L+Imkq+YUyygM4Om1eXBo=; b=VcoGXBbnrjANr6t5
	dWxH7eTwJdsPaVZQHcBnP2RiKlNcNuOOXFfOyefgpP0hczfGo6039pgpllbvBfJK
	l5r6DXaaiXzQRfVbmN1rfhCo2WtFf7D8A16ApQYxPUbz49xhmaOOij9iBwfdgIQB
	K0pUFjFRtUroJZ6TmhrlVySlCtGC3D4XoTPparkDBplfd2Jdec/zSxtFWMDhkebi
	nC9/aoGQMds+Lon98BD1qlmEiOaJe/1Ma9tpe/AYJNPuH4AbDFHSikvakgZSlPwq
	/k5X7DGdxVasTzdbub2iu4J4YISaeiXKx4pyOJQ+pBxg1T4hJsJSMZlXM2o31hrl
	1s6AJw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456uy0aq5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:32:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526CWr5F009869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:32:53 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:32:50 -0800
Message-ID: <3d93b47b-4d68-8626-2b32-4840ea9925db@quicinc.com>
Date: Thu, 6 Mar 2025 18:02:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 08/12] media: iris: Avoid updating frame size to
 firmware during reconfig
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <mchehab@kernel.org>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-9-quic_dikshita@quicinc.com>
 <39f566fc-9cc9-44be-9b14-7ced0607464f@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <39f566fc-9cc9-44be-9b14-7ced0607464f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Pq5pbxM3 c=1 sm=1 tr=0 ts=67c995f5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Z7P0-oMRu0xCxirkbW8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: --YkU6TDJIAkryp86pAdcs4k8gpBGpdP
X-Proofpoint-GUID: --YkU6TDJIAkryp86pAdcs4k8gpBGpdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060094



On 3/6/2025 6:56 AM, Bryan O'Donoghue wrote:
> On 05/03/2025 10:43, Dikshita Agarwal wrote:
>> During the reconfig, firmware sends the resolution aligned by 8 byte,
>> if driver set the same resoluton to firmware, it will be aligned to 16
>> byte causing another sequence change which would be incorrect.
> 
> During reconfig the firmware sends the resolution aligned to 8 bytes. If
> the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to send
> another redundant sequence change.
> 
>> Fix this by not setting the updated resolution to firmware during
>> reconfig.
> 
> Fix this by not setting the resolution property during reconfig.
Ack.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c    | 15 ++++++++-------
>>   .../platform/qcom/iris/iris_hfi_gen1_response.c   |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h  |  2 ++
>>   drivers/media/platform/qcom/iris/iris_vdec.c      |  4 ++++
>>   4 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index a160ae915886..d5e81049d37e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -562,14 +562,15 @@ static int iris_hfi_gen1_set_resolution(struct
>> iris_inst *inst)
>>       struct hfi_framesize fs;
>>       int ret;
>>   -    fs.buffer_type = HFI_BUFFER_INPUT;
>> -    fs.width = inst->fmt_src->fmt.pix_mp.width;
>> -    fs.height = inst->fmt_src->fmt.pix_mp.height;
>> -
>> -    ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
>> -    if (ret)
>> -        return ret;
>> +    if (!inst->in_reconfig) {
>> +        fs.buffer_type = HFI_BUFFER_INPUT;
>> +        fs.width = inst->fmt_src->fmt.pix_mp.width;
>> +        fs.height = inst->fmt_src->fmt.pix_mp.height;
>>   +        ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
>> +        if (ret)
>> +            return ret;
>> +    }
>>       fs.buffer_type = HFI_BUFFER_OUTPUT2;
>>       fs.width = inst->fmt_dst->fmt.pix_mp.width;
>>       fs.height = inst->fmt_dst->fmt.pix_mp.height;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> index 91d95eed68aa..6576496fdbdf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> @@ -155,6 +155,7 @@ static void iris_hfi_gen1_read_changed_params(struct
>> iris_inst *inst,
>>           inst->crop.height = event.height;
>>       }
>>   +    inst->in_reconfig = true;
> 
> This flag can be changed by iris_hfi_isr_handler() down the chain.
> 
> 
>> @@ -453,6 +453,8 @@ static int iris_vdec_process_streamon_input(struct
>> iris_inst *inst)
>>       if (ret)
>>           return ret;
>>   +    inst->in_reconfig = false;
>> +
>>       return iris_inst_change_sub_state(inst, 0, set_sub_state);
>>   }
>>   @@ -544,6 +546,8 @@ static int iris_vdec_process_streamon_output(struct
>> iris_inst *inst)
>>       if (ret)
>>           return ret;
>>   +    inst->in_reconfig = false;
>> +
> 
> Are these usages of the in_reconfig flag then thread-safe ?
> 
> i.e. are both iris_vdec_process_streamon_input() and
> iris_vdec_process_streamon_output() guaranteed not to run @ the same time ?
> 
> I don't see any obvious locking here.
> 
Since reconfig handling is only relevant to capture port, the usage of
in_reconfig flag in output port is unnecessary. I'll remove the redundant
flag from output stream_on to simplify the code.

Thanks,
Dikshita
> ---
> bod

