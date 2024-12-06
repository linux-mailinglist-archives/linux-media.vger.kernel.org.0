Return-Path: <linux-media+bounces-22762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E39E6408
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC8C28447B
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 02:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D4E170A26;
	Fri,  6 Dec 2024 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fj7zNGU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6E13C8FF;
	Fri,  6 Dec 2024 02:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733451661; cv=none; b=hVcHDckORkeraNfIX2QXM8IasFsAxPv3t/1pJ3TEg4G0mJVZ0KVX72JCH5SfgWSErc36eKZv99pkrpfWAZz/qr0WApTKNXdhTfQiR05Cjz2gU55dm8qykQIUEw9K95veGzgEMdPvoUlm+z/CueK1tVew794eBEvsUyP0Bp1sQkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733451661; c=relaxed/simple;
	bh=akNeQOS7F+aeCKe8og5HELrAfPpoyjYBig7r2/tsigQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zpq7OYGRzRFqccnJcOKKEX/ZPAJh1pI/EKhof22/qYSgAhpPenDGiAfxrhruzw1a6Y3P656MSf8vOveuRwHQTKJJD/9mQ2iWsKYkVrUt1rvUKzmmyj463NlLhPKTmwR9wMoSmeHXwNEB7Tc11S/uMTIpYSqzLmMjqvic1F/C90A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fj7zNGU6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Ha2YN020274;
	Fri, 6 Dec 2024 02:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHzZ4xcY0wRotHaB4a7qtHnMNeWb63zB+1W3oS56BZY=; b=fj7zNGU6qLjHfbqk
	5CQiDtNIQlM6MJ1wAKVmYQIdjOxaKe+FhzkBBwHm71UBz1ICoiF3On2q/2jGsWbY
	9sF3YO5rFuR1FBQDRKqLI6K7CPIGL/3NqJW75G/XAsCAYNanBFmM98jrxoyBoBOK
	QFJutjlu0ANX/PGsa+kBni9F4DF6AM0q9PlbaH8735yqrgxeOXmErUcixQCLBVEL
	FN2THRuiw+kArlxZROa95PtHMnSVMeuzV1o7PteBpknrfBR2VFVtIBST47V0O/KX
	iwnYZcIcoa5jbUPoW+LZPB2dSOqLFN60Z8ARC5AosYqNNq3swB0TjTbUmHGgMMaM
	+csYkA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v801m96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:20:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62Kr1r012371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:20:53 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:20:47 -0800
Message-ID: <25cfe320-a8cd-44e9-85e1-fb833f65fb7e@quicinc.com>
Date: Fri, 6 Dec 2024 10:20:44 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] media: qcom: camss: Add default case in
 vfe_src_pad_code
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-13-quic_depengs@quicinc.com>
 <636ef629-2298-44cd-9e0c-d009379a72a6@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <636ef629-2298-44cd-9e0c-d009379a72a6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QIqh4_aE95pbRMTSVzcaDvTbkT57FfJM
X-Proofpoint-GUID: QIqh4_aE95pbRMTSVzcaDvTbkT57FfJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060016

Hi Bryan,

On 12/6/2024 8:21 AM, Bryan O'Donoghue wrote:
> On 05/12/2024 15:55, Depeng Shao wrote:
>> Add a default case in vfe_src_pad_code to get rid of a compile
>> warning if a new hw enum is added.
>>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/ 
>> media/platform/qcom/camss/camss-vfe.c
>> index 58e24a043e81..1c9b6569fbe5 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -404,6 +404,10 @@ static u32 vfe_src_pad_code(struct vfe_line 
>> *line, u32 sink_code,
>>               return sink_code;
>>           }
>>           break;
>> +    default:
>> +        WARN(1, "Unsupported HW version: %x\n",
>> +             vfe->camss->res->version);
>> +        break;
>>       }
>>       return 0;
>>   }
> 
> Please re-order your patches here.
> 
> Generic fixes in a series to enable silicon are _fine_ but such fixes 
> should come before the silicon enabling portion of the series.
> 
> So this patch should come before "[PATCH 11/16] dt-bindings: media: 
> camss: Add qcom,sm8550-camss binding"
> 

Sure, will re-order the patches based on your suggestion.

Thanks,
Depeng


