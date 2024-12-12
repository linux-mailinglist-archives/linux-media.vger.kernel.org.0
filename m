Return-Path: <linux-media+bounces-23282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 602019EE4B8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F225C28134F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AB221171E;
	Thu, 12 Dec 2024 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p2n5MTR/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E71EC4D2;
	Thu, 12 Dec 2024 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734001582; cv=none; b=nvsQGonzbUN+7J9ByMQcDrFpLr0xQcbb/6SifRIaB83YIwlki2AFqwkHzTQSWL5h8hfdmVRUvSSV5K3uCmoBgFu1h91U+H1+pALJLn9lR6pIQ0/lKl5nFvv4OTS1Pc8USkNIdqTC6yjiIUnf0d60O0ARP2WN4N1I1fpHrK3IPGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734001582; c=relaxed/simple;
	bh=CPHS5vrYnkIXQmlC4w4VT8tiQIi9/k9mLxjdcDnbRKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b6sbBFFFJtL8W+wiHSrSCHVPrn/Dy351hh01pv+hTXagxuuoD5ZHWKP3YojgkMHmwjR49pBStys2d1ZqSolDjVnZNM7YL8UT2HRTaDC6MQwF9uFy+BomDUB2znKoSrxnCrPCxbGMU72o4CC6cjBisz+5p7LsRPMe14iywENur94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p2n5MTR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC76tio027271;
	Thu, 12 Dec 2024 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9m8zbf7O3vI7QjLoC/AqtpIBcLXBkG1cNOX7yBt+Y/4=; b=p2n5MTR/xncFdA0c
	G/xqSU6XMj7xWVYg89wqzCYn3iim+AJ+A0kEW0il3Q4M2pIzXm4iytq37p9Jl4WI
	LoJkAF3YM3SFaXhvbVgRlQ3jRjrmQo7gF5ZotWNraNGTjoJu45lbgmsnY3ZdC2xA
	u0l+fUHZ71Zp2lhMG65WA14tfpefv47j8hUMj6/jFbLrcCOb5NFDfiil9sACx9cB
	TPP+21OyKXf2foNib3I3j+NiZF3V/qGE8cwDenhIVIeanrbMOQpalU1XU7e/f3YK
	Po2tCNEGTJzZHd6ZV2w1wrGsTSXPi+fhhOCiJotyu7N7ybEBkqFNzhiJBlnyOoQt
	ABYi8Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8wwrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:06:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCB6AAR017070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 11:06:10 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 03:06:05 -0800
Message-ID: <4ef3a52f-7a60-402a-873e-f5c8a95df56c@quicinc.com>
Date: Thu, 12 Dec 2024 19:06:02 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] media: qcom: camss: Add sm8550 support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <12704563-f2d5-4e2b-a6ad-53b8ab5c5df8@linaro.org>
 <63828150-ef52-49c4-bc60-72c1f6bff202@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <63828150-ef52-49c4-bc60-72c1f6bff202@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _K76tyZlmYS0gnF--BR-nA5OaFDkTDf8
X-Proofpoint-GUID: _K76tyZlmYS0gnF--BR-nA5OaFDkTDf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120079

Hi Bryan,

On 12/12/2024 12:03 AM, Bryan O'Donoghue wrote:
> On 11/12/2024 15:36, Bryan O'Donoghue wrote:
>> @Depeng.
>>
>> Some of the patches at the top of the stack here - won't apply once 
>> Vikram's 7280 patches are applied.
>>
>> Could you please rebase your series with Vikram's patches applied and 
>> in v7 send a link in your cover-letter to highlight the dependency.
>>
>> You can get fixed up shared patches from my x1e tree here:
>>
>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/ 
>> wip/ x1e80100-6.13-rc1+camss?ref_type=heads
>>
>> ---
>> bod
>>
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/ 
> x1e80100-6.13-rc2+camss?ref_type=heads
> 
> Same patches on rc2.
> 

Sure, I will rebase the change based on Vikram's patches.


Thanks,
Depeng


