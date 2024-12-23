Return-Path: <linux-media+bounces-24005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B509FAECD
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 14:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0F6163651
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 13:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470CC1AD3F6;
	Mon, 23 Dec 2024 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lriRSg3+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8F619D074;
	Mon, 23 Dec 2024 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734959364; cv=none; b=fRFrOh2y3f1+GXqG6TzFk3DX5R1nhoTfhZ8jhU0RwKmY8oiYkoD0exUOMKWbEesWeipd6/4nzFqU6j3uMLrsmukVQYFzLMum/woDfZciyIHhSA1pujggWpeZ8guZOD9GajQH9kiGK4A9KcWuWU1k9hglmv0NCtYfxjTMpQ2GtOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734959364; c=relaxed/simple;
	bh=d5UFbjoS/vTetWerZ9vop2itN/x3bTS7GDQi99nj1CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nujvmr2qQVhChuJsp7aUY5c+mbiNASw6uVZpEytDfhxHGvmKGIqIJ1lpck1CDTNivvf7mXBcY+VZZzvvf9EfWLhETEldbAOTAhysUHd7jz9cb5qUES2gyL4hiLLPU1e8MO/zUaPci+/NoqQ7xFq580XjQ/9WfNPEgVTJSD7zs1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lriRSg3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9mauk030750;
	Mon, 23 Dec 2024 13:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOTjYnPuet5hf0eLWwuobAQqrCXmMTS9fNMYXT1D8Q0=; b=lriRSg3+ENKM4OhL
	NADbSOr+Tcedwnlr8dCJTwfPk05hn1mQvpd5Pr+YNzodmfOwRxDGpkg/6jKvSa0f
	k7zihFSlNuwsfd9s6F4xeX18PtGBMUDnpAM+cDk7LbcfNFntyWRDWnSR9ub6GmMe
	yvj6Z/KCcYFVQmzG4N91CPGn7wn5CVIkBXJzvhELy5HCJvB+ft+rW9aywgDGEmvl
	4iL5voyw1TZn8q5P0qzfpZlDIEej2HN3WS0vcND9+butGSBP7GdGejDazE7yKve3
	EJiSusmHOvhI9Jc6q0U8ekg564Vq8OhZYZmO+BdK52inqpaYQ3ht50xjUwiVpiMD
	4F/j9w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q5jb8ddw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:09:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BND9HNX015432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:09:17 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 05:09:11 -0800
Message-ID: <282a5a62-ce09-4735-a1ad-bb2cd65fbc3f@quicinc.com>
Date: Mon, 23 Dec 2024 21:09:09 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] media: qcom: camss: csid: Add v4l2 ctrl if TPG mode
 isn't disabled
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-12-quic_depengs@quicinc.com>
 <12dabbc6-5813-4369-b882-2fc72333746c@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <12dabbc6-5813-4369-b882-2fc72333746c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OYXky5fbh4XT0iMT3A491hVmf7535RH6
X-Proofpoint-ORIG-GUID: OYXky5fbh4XT0iMT3A491hVmf7535RH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412230118

Hi Bryan,

On 12/11/2024 11:44 PM, Bryan O'Donoghue wrote:
> On 11/12/2024 14:07, Depeng Shao wrote:
>> There is no CSID TPG in some modern HW, so the v4l2 ctrl in CSID driver
> 
> "some modern HW" => "on some SoCs"
> 
>> shouldn't be registered. Checking the supported TPG modes to indicate
>> if the TPG HW is existing or not, and only register v4l2 ctrl for CSID
> 
> "TP HW is existing or not, and only register" => "TPG hardware exists or 
> not and oly registering"
> 
> No need to abbreviate hardware to HW.
> 
>>   only when TPG HW is existing.
> 
> "when the TPG hardware exists" you could also say "is present" instead 
> of "exists".
> 
> You have additional whitespace in your log before " only"
> 
>>

Thanks for the suggestion, will update in new version.


>>           }
>>           if (!csid->testgen.enabled &&
>> @@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
>>           break;
>>       case MSM_CSID_PAD_SRC:
>> -        if (csid->testgen_mode->cur.val == 0) {
>> +        if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
> 
> if (csid->ctrls ||
> 
> feels like a more natural test. Less cumbersome and also less typing.
> 
> I think that change should be feasible, could you please update your 
> logic from if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED) to if 
> (csid->ctrls)
> 
> Otherwise looks good but, I'll wait to see your next version before 
> giving an RB.
> 

csid->ctrls is not a pointer, so it is always true.

Thanks,
Depeng


