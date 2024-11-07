Return-Path: <linux-media+bounces-21037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8E9BFFCD
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904ED1C21325
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F0E1D9665;
	Thu,  7 Nov 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lA3jTYDu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE619882F;
	Thu,  7 Nov 2024 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967452; cv=none; b=Q6Uq1/tZRdc9MtKgbox+ZVHHfDhfvNNzc3mqUULSqu2PVWsvyUoFupY5oUfJbQtxOoQtyaCak66AJ6ToFvdtWzTIaeXLPbcza1pAJhYvwSKJfKIFLxxWZxoN3oz3UaAOfi94kZ8kU/FlC5v9IUZEelSpyFQv4LkbSZ/DcASc37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967452; c=relaxed/simple;
	bh=X7f13c01wcIqZN9xK58W05Kg4OvhN1Ix2HGVrWucGZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ReoWQq0xb9rQ74eJ4KpzXv/c6aqj5MVs4yGRbW0iG0oxGfdfzlh9oULXmBFNQpGWwkqrS5MlCU+el7iNyMlhy7epleqGnNplPoc9B9DoShOfZUseqzyNGetrlbxNklMiTGRTFUdFBn/ZS+SU6BE5Q2Pg/8ShVtaHWIBj+aI3HaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lA3jTYDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A75hrCs002118;
	Thu, 7 Nov 2024 08:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0bzIDI1oq6c7V1yAm5VpFt7nqfwKuGFUHYtt7LlyWvE=; b=lA3jTYDurv1gKG/b
	mBpi7ZFmP2wbFfftO1eHeWQ3X6qVPDad92YkpI+LAuVOM3/s4+wRLGajl6cpTjsS
	u4h54jIoooZlCjI2CLkes5+ylZ0mdJFSa/hFqm7HJ5svtsY8378njFQQdqGcIIg8
	zX0X58JrsmPERpusJ4haZQFLmzdHemnhHR2awnrYB2mz94g32GXLZxCvowGweF+F
	HMDZrU8Pv5KHHZKjlALIfUu+Xx7Ow9Q4JGQtfJ9S8xYefBVptlZ63UIWIqp5wVF5
	/dm/GNvKqmTxj342ZlgRlMWrf5jMigFeNuxTRYeIY2blP+DsuN7etMeDlv6T1j53
	CzlcwA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072m207-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 08:17:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A78HQgq021882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 08:17:26 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 00:17:23 -0800
Message-ID: <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
Date: Thu, 7 Nov 2024 13:47:20 +0530
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
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tx54v66Ncn0rJPLLi36zAWVStXwpQu4v
X-Proofpoint-GUID: tx54v66Ncn0rJPLLi36zAWVStXwpQu4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070062


On 11/5/2024 7:25 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 05, 2024 at 02:24:54PM +0530, Vikash Garodia wrote:
>> There is a possibility that init_codecs is invoked multiple times during
>> manipulated payload from video firmware. In such case, if codecs_count
>> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
>> access. Keep a check for max accessible memory before accessing it.
> 
> No. Please make sure that init_codecs() does a correct thing, so that
> core->codecs_count isn't incremented that much (or even better that
> init_codecs() doesn't do anything if it is executed second time).
init_codecs() parses the payload received from firmware and . I don't think we
can control this part when we have something like this from a malicious firmware
payload
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
HFI_PROPERTY_PARAM_CODEC_SUPPORTED
...
Limiting it to second iteration would restrict the functionality when property
HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.

Regards,
Vikash
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
>> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
>> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
>>  		return;
>>  
>>  	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
>> +		if (core->codecs_count >= MAX_CODEC_NUM)
>> +			return;
>>  		cap = &caps[core->codecs_count++];
>>  		cap->codec = BIT(bit);
>>  		cap->domain = VIDC_SESSION_TYPE_DEC;
>> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
>>  	}
>>  
>>  	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
>> +		if (core->codecs_count >= MAX_CODEC_NUM)
>> +			return;
>>  		cap = &caps[core->codecs_count++];
>>  		cap->codec = BIT(bit);
>>  		cap->domain = VIDC_SESSION_TYPE_ENC;
>>
>> -- 
>> 2.34.1
>>
> 

