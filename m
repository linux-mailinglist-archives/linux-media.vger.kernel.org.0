Return-Path: <linux-media+bounces-30605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD5A950D3
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C91C3B2777
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FE3264A85;
	Mon, 21 Apr 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="muvHCVfn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EEA2586EF;
	Mon, 21 Apr 2025 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238235; cv=none; b=XdHkTf/SODR3RPHN1UKvhASZZV9xqCLDxYKZSu6CG9Y/sIbYO0XMFMLfoPWJ48n48jn7qF/xwK52Z/MAsCYsrgMoWOSp6hAVuW0Viyg+gss4BKyBhLjOpOtaIOH635Zh+0MPhvceTsel2cxw8Ja5wD6LjOgRDY0eNPKrAPJMA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238235; c=relaxed/simple;
	bh=Vd/j64meeGHcx3Hv5oHRqjRxxRl/PfL4kE7d8E57WAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ge2bn8I84PQasBB34Yk8i6i50+lcLfIhhdk9ftUYqLAINGP0o44RiifrBtgKPujsEkmYlkiarQXwUGta1cs5rxL+aMJiMmjUg+gAgVhnwCxRTWpbDmCojKZFub2IhZLCDxbK3umTiUeD5Z53txBRujH2vs6Xtc1wDei1ySb6wfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=muvHCVfn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAZg9b014864;
	Mon, 21 Apr 2025 12:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uXkKDGsIuCdNpAW8xSrVEz34+NoLU15x+v9O1poyug=; b=muvHCVfnj8Dzcv2J
	XHmCKUdwrv6ggFcoxuXx6xaBI+lv8WMs67VAGnytgG19idclF0KX1EO6qtYWRfEe
	gIVUINIJVEdUGDc/tHbuERGjmjqARqUPTuvZmOL0siNfIJ80Ep5j6EOYEY/SpsF1
	NrIbhdVztGaTtyXOnpCkZjtwTwWpaOJK8/rgWTG890b5CDrP7Mohf81eIpd9tDYE
	7AgW6z7vLqzZkm5rS9y1MGiML1PKOXKxpLueFHZxhulCjpLtGI7z8UfTXCcOqvE+
	VqzAHrh+x5diJ0k3XWDV35qyZP7w089MxR9fD26Qw1LPRLNg0EGElrkY+Hxj79Tz
	Bin4AQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jc6h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:23:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LCNlFZ026117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:23:47 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 05:23:43 -0700
Message-ID: <01456ba6-ac9d-d5cc-db66-b9a598f8177f@quicinc.com>
Date: Mon, 21 Apr 2025 17:53:41 +0530
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
To: Rob Herring <robh@kernel.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
 <20250421115059.GA1624060-robh@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250421115059.GA1624060-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=680638d4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=apd90ujbfaWlIdH5QjUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9YdId5-hUvhsftj5gYTKPweECB-H7t5X
X-Proofpoint-ORIG-GUID: 9YdId5-hUvhsftj5gYTKPweECB-H7t5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210096


On 4/21/2025 5:20 PM, Rob Herring wrote:
> On Fri, Apr 18, 2025 at 11:58:39AM +0530, Vikash Garodia wrote:
>> Document the IRIS video decoder and encoder accelerator found in the
>> QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
>> have different(lower) capabilities when compared to SM8550.
>>
>> This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477
> 
> An incomplete message-id is not useful. It also should go below the 
> '---' so it is not recorded in git forever.
Ok, i can add the lore link to the dependent patch.

Does your bot picks the dependent patch and run the checkers ? The cover letter
calls out the dependent change-id #, i am assuming the bot checks for
dependencies, if it does, in the binding patch, and not the cover letter ?

Regards,
Vikash
> 
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -24,6 +24,7 @@ properties:
>>        - enum:
>>            - qcom,sm8550-iris
>>            - qcom,sm8650-iris
>> +          - qcom,qcs8300-iris
>>  
>>    power-domains:
>>      maxItems: 4
>>
>> -- 
>> 2.34.1
>>

