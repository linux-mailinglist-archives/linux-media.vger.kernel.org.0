Return-Path: <linux-media+bounces-23276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853709EE31A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B38E1884E67
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1701B20E6FD;
	Thu, 12 Dec 2024 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HahhefW4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05213187870;
	Thu, 12 Dec 2024 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995915; cv=none; b=hN2LINvUSwHzmHqnnzf/vofSobQNOX3MW96knGSzGgh6qUyEbYr79nCETZSziyTy/3FYysBR0gJmqMimmlWt/Y6v1B03YXYf8jgSJwemFeo0Bcdhdkp9aJ1u5qWhFSaHPN7PfcRTWNxEicptJv7VOoyLg2jQNQtouphra8iy0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995915; c=relaxed/simple;
	bh=srm9IRLq79hE4aMy9Jn4FuLsYt9ZM6FKBMwRd2Nj+uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gYXCsNwm1+/PAkK4sMQWwbOagRMMcRwSX0/5PA9xloTevkNoseVTxnDm7GaWClTaSVs/UQM4Yw9mHqctoBaLUQuxJFgwdVy33WDYELvvKv75DIMrrCoRZIr9S+l3KN4c5xU2R2g1bNaUrg06caIM61/VIXKa+305b8MgbRFsOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HahhefW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7qNjt002529;
	Thu, 12 Dec 2024 09:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfLzRkbbWjbIDD0l1aRS8trXE7dMUR71RudZ3Zd9IzE=; b=HahhefW4CCMMZuD9
	sqHQ/8RePtZ+fXE/tdNAroviGfBpgDBJ9En+durPD2r2oOtDPuHJBlKtQv3SVpAc
	msrw9K1xfuDEsIDA+7j8720qPi1qBWxYTROsLmshiIYaZHkWXXl6vo4s+l9iYWsJ
	swO0Pw8kmQHm9h0I8AIeFqE6Bx0ueSNa3T7xrMafGml3jrCqa0KBVnbU42pzkezl
	TiDOcd7E3vTpyARqZZWW0a+Xvd4IryKa5Z4f/psa1Syz+V7+fgJy3NZP1TZ8TOaF
	aSUB0eSwvtu7vi4J1oJ5z84olCvlBDd9q+FBY9aUdgxT1o23y0zVbn/fDZ0BP1OR
	KxSWOw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg64x4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:31:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC9Vmqj027585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 09:31:48 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 01:31:42 -0800
Message-ID: <db0e505c-2583-45ec-b90e-cb0539b44ce4@quicinc.com>
Date: Thu, 12 Dec 2024 17:31:40 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] media: qcom: camss: csiphy-3ph: Remove redundant
 PHY init sequence control loop
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-3-quic_depengs@quicinc.com>
 <37523d35-c569-4bef-97aa-46b71236b1eb@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <37523d35-c569-4bef-97aa-46b71236b1eb@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XCPJhsINOk7lUzUnTLpdSpZwW2IDHpXh
X-Proofpoint-ORIG-GUID: XCPJhsINOk7lUzUnTLpdSpZwW2IDHpXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120066

Hi Bryan,

On 12/11/2024 11:38 PM, Bryan O'Donoghue wrote:
> On 11/12/2024 14:07, Depeng Shao wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Adding a new CSIPHY init sequence using downstream as a reference 
>> prompted
>> me to look at why we are splitting up the init sequence into chunks.
>>
>> Right now we declare CSI PHY init sequences as an array of five equally
>> sized writes with a hard-coded control loop to iterate through each of 
>> the
>> five indexes. One bug in this model is that if you don't have an even
>> number of writes, you can't init the PHY as you wish.
>>
>> In downstream the original code has something of the character
>> phy_init_seq[MAX_LANES][MAX_PARAMS] which in upstream we have translated
>> into phy_init_seq[5][SOME_NUMBER_OF_EQUAL_WRITES];
>>
>> What the code does is take a pointer to the first index of the
>> r = &phy_init_seq[0][0]; and then literally does write(r, value); r++;
>>
>> The controlling loop that hard-codes '5' in-lieu of MAX_LANES does no
>> special sleep, fabric-coherence sync or even a printk() to justify its
>> existence. Our compilers are optimising all of this away anyway so lets
>> drop.
>>
>> Reduce the array declaration down to one flat aggregate init and let the
>> code just step through. As a happy side-effect we can then also handle
>> odd-number writes as the number of elements in the init sequence will no
>> longer have to be evenly divisible.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
> 
> A new version of this patch is required to ensure 7280 is handled
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/ 
> commit/4c831fd58aa7629f994b5f4d8533b154a74d35cc
> 

Sure, I will pick the latest version.

Thanks,
Depeng


