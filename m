Return-Path: <linux-media+bounces-31203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC64A9F055
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF983B5A8F
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DACC2686AC;
	Mon, 28 Apr 2025 12:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eqxRQRqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA1267F4B;
	Mon, 28 Apr 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842222; cv=none; b=ZSxR0S2jm0JdKSf0zR2T1lkFVVXVTPGvZhE/RPJn+KiNkN0wq5JjU568QHvI7uzoADimkUSezx/nw67dBzEZ2qSe/TuhrVBRRsDTfLnlVrJPWWWiHCig27oEt104qGVu2nu+08jVhH5Hc6/bgbOGaV+9LVbSVomXAw02Y+Qhpko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842222; c=relaxed/simple;
	bh=tihlxCw9xow20KLzV+QRCQ0j3IZPQ5YvvZyBkopd9ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HoTdRgrBkAKmsuQvokZKF+U7Xs8duHAoyMuTtrajaLL6MM/JRSn5C8yyB4c86ppX27+HeYeaWk03Lf9LUJr9sqGjO0Jk18TlICmcUstphCA5kOu/ka4E+e0bFlt2svlKXMZv5D8rrGqQGISSLxRbeCNJt9B+zMOc7KM0uAJT+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eqxRQRqC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACxFH009165;
	Mon, 28 Apr 2025 12:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXuJJ+2KCuTh5goOcqcW9zknJ6CINhYX33RHPc2p+80=; b=eqxRQRqCYRQXclXb
	gPSeQOh2uIYGkn0LezOTv9ZKQTN7EbdFh2NphCT7v1Z7vyxTL1lmNLhkacitFb7a
	kLV0KwK3fpHtLqT38dkJqMQrFsNI2TjzfWKq/aIwUD7PBU/ZQGIirxb9dHNE85xn
	+5DSsNGjhnkEjfhLtZR2rE9KqLNuDBhSE/GZrPaqd7Fo4G/qIHJCdkgooNHBMyHS
	yUfA4WEeINhQpEDsyl/0q2pE+li6VTP3KA1fF31Soqs797j60MpSefETSQOtc/YD
	0SlsdS/plvR7sphkvpzi0FVCzZW0b4xnQBXBUeBUOR4y0crW1LSe4Vaa+YbRlTmQ
	VpuFWw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqh976-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:10:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SCAEpt000745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:10:14 GMT
Received: from [10.50.5.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 05:10:05 -0700
Message-ID: <7ef2daa2-a6fa-2285-6619-b2f25baabc55@quicinc.com>
Date: Mon, 28 Apr 2025 17:40:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
 <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwMCBTYWx0ZWRfX9qTkxysjzOdX vbYKg9wW/B3oUy+7fBGpN0NI67mY9XNaBkA53O+OkCTFiS7cEaUQQEhG+634TbuBODeq1xsAqHI bWf65H2cgRFx3CCKZ2L7bNZKn8VKoBnr4R1AGBCEZy9tjpHw0rg5puu3swVed8WZg6nTe7GPFFU
 qw9UjyPmuk52YEVxZJJXP8qoWn6w7/sTyVZLD+qbFo5kK+Q5CzUOOMxUsNzo5i0CKHLgefOov9R f20r2DpOVyttJXiuLzjQ7//KAYeXkgRVo7uiciLxqxQDWQhlSSKg6QO9G6EScWcsV+GboD4SUCy fkj3Vm1OfkNlLomgTCrwTm01CwqSIt0lDLhSRrIhzt3g4ehZPw2b5IdDyHwMTZWx0+iJydOBRqU
 16P80vqRh263y0R+QsS/+iJ9xW3EPAgnJjojTBg/heNWpv/mWt2dJfuHMbHz/YVknReDrXDJ
X-Proofpoint-GUID: uqIE7-Tc042rMp5myf4w9S68coRbWEF_
X-Proofpoint-ORIG-GUID: uqIE7-Tc042rMp5myf4w9S68coRbWEF_
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680f7027 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=VLf8UrQIVRTUJMQaSbwA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280100



On 4/28/2025 3:10 PM, Dan Carpenter wrote:
> On Mon, Apr 28, 2025 at 02:59:02PM +0530, Dikshita Agarwal wrote:
>> A warning reported by smatch indicated a possible null pointer
>> dereference where one of the arguments to API
>> "iris_hfi_gen2_handle_system_error" could sometimes be null.
>>
>> To fix this, add a check to validate that the argument passed is not
>> null before accessing its members.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 1ed798d31a3f..cba71b5db943 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>>  {
>>  	struct iris_inst *instance;
>>  
>> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
>> +	if (pkt)
>> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> 
> I feel like it would be better to do:
> 
> 	dev_err(core->dev, "received system error of type %#x\n", pkt ? pkt->type: -1);
we don't need to print anything if pkt is NULL.

Thanks,
Dikshita
> 
> regards,
> dan carpenter
> 

