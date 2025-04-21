Return-Path: <linux-media+bounces-30606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C36A950DD
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EB343B2776
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799AB264A90;
	Mon, 21 Apr 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QXPzj8Xz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4812F4C85;
	Mon, 21 Apr 2025 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238437; cv=none; b=N7l5JaI2Mgb+pw3fIVt0xzHUsuGBrDTMOCNxYcyeRSQXUBmYI6uvhFhhBoq7NxpXUj+O3jKYgoAQ2uD4a3OY8Ai5rCVKrC0UrzUiR0kHi2BKtue2qmW5mzUrY7NvC6KJSJ5xH1cAUmni+TDKKLZBP5diHaEq3at102pVs7Ka8pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238437; c=relaxed/simple;
	bh=AJveUl39T+UkuaaO2+9FXDe4LuKO8CsAFO7JDDKYTg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=urs2NWDyWFhBhMg3mU82FEyZKGqh+y5OmSgvBt/1qsnfUEyLN42qtfGjoQOhO22muVu06IIAEjKDhFOCHKLU5x9gxF35vq/Ii1hP5ob6INtsv7fVJVMUNKWe8rxN/Yl/+6QjoHCMffpzHMIsBAljeJnPNddR48jvNK2/FVsKj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QXPzj8Xz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9thsB014718;
	Mon, 21 Apr 2025 12:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIXRkKqVI2STgQDFxNfL20A/6Rkzc1uUObud6BLfls8=; b=QXPzj8XzQtS+1kik
	PA+vVrwxJril3DOB7qicgk44FmuZs6vCklufC8WB9Q3jexJ4x3XMIFAvRJRRZXRa
	PKf90CrJbQlmpuqDyhWsb/wM1wtYwDgpBAwQ8RHQER1LE6S4C8IGimazv67BwKad
	9U4PyjDAJHo1Eyk3jDRxteG/r2H2NvNReVqcRJVxR7weR9rIDEwtmyMJyQL3bnid
	VnXs5UPi3DPraO+DF5LHtA/u3b1SY+FaXsTSsEm5y7VjY76Zqr/9qPCmQVKN49Iq
	AbVyQsakNExGXhV9C2WLT92Cr2uuSMUdI16mZ/+8TusTwnEnZuPnFW5ReL64Hhqh
	/+QY4g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bm32u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:27:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LCRBDG024475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:27:11 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 05:27:08 -0700
Message-ID: <314e3ea9-92d3-10e4-528c-aae0e80e327a@quicinc.com>
Date: Mon, 21 Apr 2025 17:57:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
 <a6689177-0f82-4b1e-b1c5-c50751d0f0bf@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <a6689177-0f82-4b1e-b1c5-c50751d0f0bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=680639a0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=25q2OO83jfplM-UGmxwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bx_GvlcJfhqxHcowetc7FIkAvEa0qu5V
X-Proofpoint-GUID: bx_GvlcJfhqxHcowetc7FIkAvEa0qu5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210097



On 4/18/2025 3:52 PM, Bryan O'Donoghue wrote:
> On 18/04/2025 07:28, Vikash Garodia wrote:
>> Document the IRIS video decoder and encoder accelerator found in the
> 
> Document the IRIS video "encoder/decoder" or "transcoder"
> 
> 
>> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
> 
> is a down-scaled version of the SM8550.
> 
> QCS8300 has a fewer capabilities compared to SM8550.
Ack.
> 
> Note: It might be nice to give a brief overview of what the differences are
> since you mention them or instead of making it a diff of 8550 just to state what
> the QCS8300 can do.
The reason to compare it with 8550 is that the patch adds the delta ontop of
8550. All other structures, it still uses from 8550.

Regards,
Vikash
> 
>> have different(lower) capabilities when compared to SM8550.
>>
>> This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index
>> f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -24,6 +24,7 @@ properties:
>>         - enum:
>>             - qcom,sm8550-iris
>>             - qcom,sm8650-iris
>> +          - qcom,qcs8300-iris
>>       power-domains:
>>       maxItems: 4
>>
> Otherwise looks good an applies, please update your commit long and add:
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

