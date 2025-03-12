Return-Path: <linux-media+bounces-28081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7AAA5D7DC
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 09:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C1033B7E2D
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 08:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75475230D3A;
	Wed, 12 Mar 2025 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mpr83yjd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439422E40A;
	Wed, 12 Mar 2025 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741766856; cv=none; b=qINyHxpHXYSl/vrdN3bqA/wXs0qHB7wfy/gDSLhDOyUPsYrmx/z/dmd1C+M1uem5ZgWA5Yoli84Jxk4XxuN2Wf5ENuU2jWtnoaBm6oBkWO1inn8QIphBEtXpb+pI6FIPysjOVn+yGwMAA33nOVzvMYWhJbI/XmfkQ9MNAEXbtHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741766856; c=relaxed/simple;
	bh=X7WI9FTJ+ijs6Zp6BzrOyWw76KMqwJUF8T3ieWwiKg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QmB7Cy0m4YQLpOYa+H9wRcUwWw1CT7NQBcyULQhU5Xq7esZnOH9LDW9zxVcw1wDPoNMXV1CXPoBc/n+zElSkzwTs4TX7u2yl38CD2lhPfSgKCoyEQ1tlWCWvF6XMXrADWckoptSQmtzHa/6nUs75xvdpkGdrYenNEv3jMmQashw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mpr83yjd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHfA5009124;
	Wed, 12 Mar 2025 08:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmmnY2Vy5rJd5WK2YpvniHAGkdEady0IcPFK0XyvC8A=; b=mpr83yjd1JQBJ0uT
	8BnQGmN7MNMCynPwB8zkURCI4mLFe/G5sNRmmKNI/DPBc9hlGbwwPNsqTSql6iV1
	T0DNNv5N1bwjFBj8a1asqURMVYuVSCvilqmIfUar1DdxFhjM903980Gha541NA5a
	8LBsm6d+KkEFSyoZEo65bUSTTJs7k/op0DJMJWxHYNS71PaY852wXaJNWrtcqQ4L
	vT5asaVAOKL0fL6IMAXtwZdEK6M8p/8lcod5pTHN/46OftNgpizqB7+We9pEgYAd
	GVOQdC7gwvhP8Z2IKjQ7l8wsY+fDE+nMvoUgZ8VTPuIyWRLB6qda5YQZiORaVTtZ
	mj4xbg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2r9k50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 08:07:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C87OUp026380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 08:07:24 GMT
Received: from [10.216.38.182] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 01:07:19 -0700
Message-ID: <5e4838e5-b5f1-7107-78b8-cfd9d5620e2e@quicinc.com>
Date: Wed, 12 Mar 2025 13:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
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
 <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com>
 <ngzl7q3fli3bpuo5gjvppfrsnmlw6viy26ieqwhpfokgue2uxm@whomn2h6h3a7>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <ngzl7q3fli3bpuo5gjvppfrsnmlw6viy26ieqwhpfokgue2uxm@whomn2h6h3a7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d140bd cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=aMrZHK2ZkiMzTJC1X3MA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jrP0J6cxO7BTmUO2dEJefqrV3_IC65S4
X-Proofpoint-ORIG-GUID: jrP0J6cxO7BTmUO2dEJefqrV3_IC65S4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120053


On 3/11/2025 9:01 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 05:33:54PM +0530, Vikash Garodia wrote:
>> Document the IRIS video decoder and encoder accelerator found in the
>> SA8775P platform. SA8775P has collapsible MX compared to SM8550.
> 
> How compatible is SA8775P to SM8550? Should it be using a fallback
> compatible?
They are quite compatible. At the moment i do not see any reason for not using
fallback compatible. Later, if we want to distinguish the associated platform
data for SA8775P and SM8550, the compatible can be made independent and use it
in driver to associate with its own platform data ?
> 
> This kind of comes as a more generic question: is there anything like
> 'IP version' or 'core version'? It would be really nice to determine the
> 'baseline' SoCs and make other instances compatible with the baseline.
It would be helpful if you can elaborate more on this with some drivers
following it (if any) ?

Regards,
Vikash
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index 440a0d7cdfe19a1ccedefc207d96b26eed5d6630..20ac596638ba33f49cce9e42d70d31a8aaa7c36e 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -19,7 +19,9 @@ allOf:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,sm8550-iris
>> +    enum:
>> +      - qcom,sm8550-iris
>> +      - qcom,sa8775p-iris
>>  
>>    power-domains:
>>      maxItems: 4
>>
>> -- 
>> 2.34.1
>>
> 

