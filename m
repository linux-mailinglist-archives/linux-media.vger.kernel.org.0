Return-Path: <linux-media+bounces-28037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C33A5C54B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 16:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A648A179666
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2016D25E83E;
	Tue, 11 Mar 2025 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IDu6dlMi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262E25D8E8;
	Tue, 11 Mar 2025 15:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705877; cv=none; b=CbPoUoL1AmNoJAt1mLq15/XiafRv2gk2QB12J3fwHf5eQbZ5b8yyW3RoMpae7ZMhOLeLjUWgFXQSk8kmL9NomQwU038fC9O1A8SlYYkTtJakWcziwb+U24E2pajAkO1PAFF0XJUpAGktgmZg8Ew7K+rqwNU3AS096VLjwN6jvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705877; c=relaxed/simple;
	bh=/2JfqBfYxANVZwdS6FN2vkLC/ku+BK9lPPVgRVFC/x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mhcOTrP33+laV2Zc2mwJyfOTWGE8BiJJ61Mzr8DYN5ITBjDUXO//WmyAcwyp/XyzY4N+6KIFIGmtKBlXCjSPryb1tswcsfxS126BYT5vzCSzDac2DXy+efP7POLzaE+bti23RIx9y4L9lsZu1q9+Y9eASi8WKRRODmnsq6uBsbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IDu6dlMi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7oAR6024899;
	Tue, 11 Mar 2025 15:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUR/cWXH5NlTRsr2OBVhIWSYEd2H/cuBsfodsuw/YXg=; b=IDu6dlMiyvLb1UJf
	KcQxmHCbn4yE9C5qZiXXhVaGPhhRN+dpJ+L7xWprYjZ82BmM2X7+OlVq1jgcrlSd
	wtWBrPIP+sDkS+ijhRWeSC+D7ta1T0q32UrYj/jHZNLy+GVisXtAL+J7I0q6agUY
	6mlFMLKHQ4vAHKEhcY1AKTLH+EmMJX1r+G/SfU5mVW6fucvVCuArvFRXeKO9Vgxq
	sH3N/15rllbpriJLCY4aJ2NL/bIDos4oZdAeBgbVFUmJimjD5HfUsAW9mEy0zYT4
	M+Jla7qx/HzAf7bX/FtLqqTkhLl3wY2MDxQR1rEho9pk2kgB2XtEDneqtHGlhC4e
	Dkr85A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4t1d0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 15:11:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BFB8CX008825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 15:11:08 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 08:11:04 -0700
Message-ID: <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>
Date: Tue, 11 Mar 2025 20:41:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Content-Language: en-US
To: Dmitry Baryshkov <lumag@kernel.org>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xy-gXHTNsqHwWFFly7DvqE3zpK5OtIeL
X-Authority-Analysis: v=2.4 cv=fZ9Xy1QF c=1 sm=1 tr=0 ts=67d0528d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=iFF1eBH5fexweo0nmsgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Xy-gXHTNsqHwWFFly7DvqE3zpK5OtIeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=922 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110095


On 3/11/2025 8:37 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
>> Not all platforms has a collapsible mx, so use the more generic naming
>> of mx in the binding.
> 
> I guess, it wasn't even tested...
Not sure what made you guess so, let me check why my binding checker did not
catch the bot reported warning.
Regards,
Vikash
> 
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -28,7 +28,7 @@ properties:
>>      items:
>>        - const: venus
>>        - const: vcodec0
>> -      - const: mxc
>> +      - const: mx
>>        - const: mmcx
>>  
>>    clocks:
>>
>> -- 
>> 2.34.1
>>
> 

