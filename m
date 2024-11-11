Return-Path: <linux-media+bounces-21260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76F9C404C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 15:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE391F2243F
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 14:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B610819F130;
	Mon, 11 Nov 2024 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cjmKNIGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384D19D881;
	Mon, 11 Nov 2024 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333856; cv=none; b=lf50ePUMso3a0PecN23DtZLJbWcmxRrIGgCEFs+uMm0PTkt5RNeYbHdKv/tYdxjD9mAD78oW1tv4+Qb1gBSv280ZejFcoSw+W7xnlQgi/xBV2kAHay5v5gHjXXZbU2Dx7d/PcA0nQBEAoAUD+McmvtskHfKfaBZUNFpOsdFbbC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333856; c=relaxed/simple;
	bh=Q09Jt7ZkFfl/xY7ARqjQ3NHnuShpjY3RpiJ1qkbipBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PbLQSI+WAhwUSPKsNVnaWD6WnrCoNa4fkxic2FX4UFKWLSFy0fdmlAb0t7gTLXcWb3bioXZuQM3b1hYH1PkC7g5PkuIy6oR6NDt9VvtpTNiKAu/eFtgOd7JDts3NJIeUlve1MkYUraqFElSx8k/yEziF2QLCCVq8KgkOLbXN+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cjmKNIGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABB1ied028877;
	Mon, 11 Nov 2024 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3CBRFMje3n7hspwjNJYn3C8cGZoyMfv5EGAAN+vScw=; b=cjmKNIGB2MCcfrO6
	/lw3esQ6KMiZ3YsquAjapLa8n23KX5LPRlPwG4tj3eTcZp4aG9Hwj7yB3lqZo47q
	AGE4oMJj/WJ8touIHKUxm4gHELOy4pbGOXRruHDTFyqerppHv/88kGQAnoBoQS4J
	KEYN4bLlEA8yUvicWvTIf0LCU1FSJFyAmUHztwIbWfEE8KMyW+j1yNLvGv6Fmc/v
	2tlIVE6mYbesERqL50c1loGbf30+aFOWHkY+3yLPE3cT3UYezz0+dI2TQIg8Emrq
	uOGbG2cdfXLf55xls5VjBvhniHegpvEzHfKR7Dg3rNHCQ3uezV+jCiJrNGO1BQzH
	RQpVVQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sweecj12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:04:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABE49ns008114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:04:09 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 06:04:06 -0800
Message-ID: <6629313e-a4eb-cca0-ffaf-6aed399da20a@quicinc.com>
Date: Mon, 11 Nov 2024 19:34:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
 <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
 <781ea2fd-637f-b896-aad4-d70f43ad245c@quicinc.com>
 <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <oxbpd3tfemwci6aiv5gs6rleg6lmsuabvvccqibbqddczjklpi@aln6hfloqizo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j0Vyqy3ZojGO7CW6VCEWh6uPCPNHeSEe
X-Proofpoint-GUID: j0Vyqy3ZojGO7CW6VCEWh6uPCPNHeSEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=903 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110116



On 11/7/2024 7:24 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 07, 2024 at 07:05:15PM +0530, Vikash Garodia wrote:
>>
>> On 11/7/2024 6:52 PM, Dmitry Baryshkov wrote:
>>> On Thu, Nov 07, 2024 at 06:32:33PM +0530, Vikash Garodia wrote:
>>>>
>>>> On 11/7/2024 5:37 PM, Bryan O'Donoghue wrote:
>>>>> On 07/11/2024 10:41, Dmitry Baryshkov wrote:
>>>>>>> init_codecs() parses the payload received from firmware and . I don't think we
>>>>>>> can control this part when we have something like this from a malicious firmware
>>>>>>> payload
>>>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
>>>>>>> ...
>>>>>>> Limiting it to second iteration would restrict the functionality when property
>>>>>>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
>>>>>> If you can have a malicious firmware (which is owned and signed by
>>>>>> Qualcomm / OEM), then you have to be careful and skip duplicates. So
>>>>>> instead of just adding new cap to core->caps, you have to go through
>>>>>> that array, check that you are not adding a duplicate (and report a
>>>>>> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
>>>>>>
>>>>>> Just ignoring the "extra" entries is not enough.
>>>> Thinking of something like this
>>>>
>>>> for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
>>>>     if (core->codecs_count >= MAX_CODEC_NUM)
>>>>         return;
>>>>     cap = &caps[core->codecs_count++];
>>>>     if (cap->codec == BIT(bit)) --> each code would have unique bitfield
>>>>         return;
>>>
>>> This won't work and it's pretty obvious why.
>> Could you please elaborate what would break in above logic ?
> 
> After the "cap=&caps[core->codecs_count++]" line 'cap' will point to the
> new entry, which should not contain valid data.
> 
> Instead, when processing new 'bit' you should loop over the existing
> caps and check that there is no match. And only if there is no match
> the code should be allocating new entry, checking that codecs_count
> doesn't overflow, etc.
Got it.

Regards,
Vikash
>>
>>>
>>>>> +1
>>>>>
>>>>> This is a more rational argument. If you get a second message, you should surely
>>>>> reinit the whole array i.e. update the array with the new list, as opposed to
>>>>> throwing away the second message because it over-indexes your local storage..
>>>> That would be incorrect to overwrite the array with new list, whenever new
>>>> payload is received.
>>>
>>> I'd say, don't overwrite the array. Instead the driver should extend it
>>> with the new information.
>> That is exactly the existing patch is currently doing.
> 
> _new_ information, not a copy of the existing information.
> 
>>
>> Regards,
>> Vikash
>>>
>>>>
>>>> Regards,
>>>> Vikash
>>>
> 

