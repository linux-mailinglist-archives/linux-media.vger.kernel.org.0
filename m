Return-Path: <linux-media+bounces-23323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5D9EE7E2
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 14:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CDF282D49
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242332147E6;
	Thu, 12 Dec 2024 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NtFPOP6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B688A2153EC;
	Thu, 12 Dec 2024 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734010817; cv=none; b=EPKUgBItwXmjsr9DdfgbOBRs56c5qHz1ZcdthtWsrpknBxZHMQ69lsG6Vbkwn6aPNCbnd/vTD8Pvvydy/ljBFTHmCWW5TwKnUoAuOAigGl6BWCocPP8umSDwYfboj7HbpumCvv+YKY1ep7K8d2wk3U6OgE3mKSyIflMLOKCCTYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734010817; c=relaxed/simple;
	bh=jVvhvxo08oMfxjmztohSudN71ehY7yU6sVeC/s1ugTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YFsjwDSLG3ipuW8gsQ6KlHWvUGnXT/p0Crab7q2Qa60dBRb6t+mC4GFUNLvAnMGWhM9KYHBl1i0DYdYuOJWEqH1LAXwZ26Bmw3pAfoVMa/JyRgGRppID/VgH6PAu0ngGLYGAvkpJZV/4xmpwMpfiU7LLKeNeKMbgbKUfSt0SFn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NtFPOP6i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8K3CT028100;
	Thu, 12 Dec 2024 13:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	no2kTIvkCui7mJdpXu4zGYtIWboKW1PAu+eHBL3uA5g=; b=NtFPOP6ivp7Eg4Dh
	YfxESKt8qfcH87xk8CS1bNbAVD7TcfLWWri2zttIw2S29DQuaC9n3woZYQXnoJXR
	2W3hXqM9CH+SKR91PZC4hR4bfCsNruSzsbJHtLpMFAl/agwLmbn3xPfvoxbYeLjL
	RZJwjACx65YBCHL8UV52IlYg7WMFXmjB2zVREJ1600s6kEOyKbXbijFru9O9R3JE
	d/VAwna9JnG2SrjVWzEr1i40/9iTKzGaQjTccW+EvovnE0K5qOCeNg+czKGOXOVD
	yR2QoHp84vMDAuCCnY4t3gaP850riStRK9aCbQSy9LtoLxkpiSprS9OjwpG/Qvbh
	TLzfPw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xu3rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 13:40:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCDe9sK023928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 13:40:09 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 05:40:02 -0800
Message-ID: <82f61951-89c3-4793-82c9-581f737b5303@quicinc.com>
Date: Thu, 12 Dec 2024 21:39:59 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-13-quic_depengs@quicinc.com>
 <d8b73275-a52a-4cfb-91d7-948686d3a5f1@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <d8b73275-a52a-4cfb-91d7-948686d3a5f1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jt-p3Edx7fpvv5crQjGHWS-CWpgPa3Pv
X-Proofpoint-GUID: jt-p3Edx7fpvv5crQjGHWS-CWpgPa3Pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=843 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120098

Hi Bryan,

On 12/11/2024 11:17 PM, Bryan O'Donoghue wrote:
> On 11/12/2024 14:07, Depeng Shao wrote:
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc 
>> SLAVE_CAMERA_CFG 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt 
>> SLAVE_EBI1 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt 
>> SLAVE_EBI1 0>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt 
>> SLAVE_EBI1 0>;
> 
> Have a look at 7280.
> 
> The parameters to the NOC should be named.
> 
> https://lore.kernel.org/all/20241206191900.2545069-2- 
> quic_vikramsa@quicinc.com
> 

Do you mean use QCOM_ICC_TAG_ACTIVE_ONLY and QCOM_ICC_TAG_ALWAYS?
And, I will also remove the ICP and SF interconnects which are used by 
offline HW, rather than real time VFE.

Thanks,
Depeng


