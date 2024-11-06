Return-Path: <linux-media+bounces-20984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFADF9BDF61
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA5C1F24951
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794F01CC8BA;
	Wed,  6 Nov 2024 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dznXUx5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF3192580;
	Wed,  6 Nov 2024 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730877921; cv=none; b=QDjJ/4ePZPXYL2vYFHM75Q4zkg7I69o1jdIn9xlFUjRg3irebzFqLE9zcm5IJOR1erjymZkXEt2EAP5jpSU6C190lupq9R1564FeniT/JBCvn66zFcf2eBdMLcFETFlfCDZ1biwm0dNoFad8Kyub4oVHgFOxq8Bb/qaIfqU0sX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730877921; c=relaxed/simple;
	bh=h+xI1yT8ky/b19/GpzaLaSMrzWTHCXmCe32fyxlq3rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NAgq7XqO0jLqRgW6MtYuZebT9Ra21CCBD+wn05AvP+R8Y7KaYLSCq7QP5OQSMtwjHto/CpOTnQypFegLLXn9ykPM1nzrbH4juy/IXCoS8p6CJAGa4KFe59V/TxB2b2M9KxbJ25yDat0tEOhNJ7/l4r0hoEiajMjcanwmEJVZv84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dznXUx5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A632p7D002132;
	Wed, 6 Nov 2024 07:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frs4vFdaLlG0LWU4uuZE7Vj/cManDFo4GpodHieHqA0=; b=dznXUx5BD/LgZxyN
	PvAZVmgqFnNM0yPAZQCQ6N/OjnfDGS55vBfUMifpZzT/LSloW8EF6OonAqBYZOaO
	3KkKkVkqFHOpaD2nb1GqKgx5MvQU5fbpXx/+sOlxaK8WDpdYUBZkgg1jNA5g76vj
	dphUjZj357FPRJ8j+HK7H/5wOj6Ezl2jqd+uF5akCgeI+JO45oCONuFnAx+MhJx+
	vE934/KgActleiyiO+yodkR613JfRm/f1FD7l3pfJUS3A8tAJA8sCdHNpD7vAL9c
	NH6pb3gW2XrAMEmcBzrR1cT3stW59PioJYYcQGsa/Jh5uesuoAF39p1Hnh6dG5xV
	Z4y9ZA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072gjbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 07:25:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A67PD9d026050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 07:25:14 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 23:25:11 -0800
Message-ID: <7f350d73-65dd-097e-8b4a-e9a23472aa28@quicinc.com>
Date: Wed, 6 Nov 2024 12:55:08 +0530
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <640fe933-078d-4bf5-815c-7db0eb8b9de4@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <640fe933-078d-4bf5-815c-7db0eb8b9de4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lAKpfWxI9Ioun-drb3uv5PPw7371Dlk1
X-Proofpoint-GUID: lAKpfWxI9Ioun-drb3uv5PPw7371Dlk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060059


On 11/5/2024 4:21 PM, Bryan O'Donoghue wrote:
> On 05/11/2024 08:54, Vikash Garodia wrote:
>> There is a possibility that init_codecs is invoked multiple times during
>> manipulated payload from video firmware. In such case, if codecs_count
>> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
>> access. Keep a check for max accessible memory before accessing it.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c
>> b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index
>> 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
>>           return;
>>         for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
>> +        if (core->codecs_count >= MAX_CODEC_NUM)
>> +            return;
>>           cap = &caps[core->codecs_count++];
>>           cap->codec = BIT(bit);
>>           cap->domain = VIDC_SESSION_TYPE_DEC;
>> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
>>       }
>>         for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
>> +        if (core->codecs_count >= MAX_CODEC_NUM)
>> +            return;
>>           cap = &caps[core->codecs_count++];
>>           cap->codec = BIT(bit);
>>           cap->domain = VIDC_SESSION_TYPE_ENC;
>>
> 
> I don't see how codecs_count could be greater than the control, since you
> increment by one on each loop but >= is fine too I suppose.
Assume the payload from malicious firmware is packed like below
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
.....
for 32 or more instances of above type

Regards,
Vikash
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

