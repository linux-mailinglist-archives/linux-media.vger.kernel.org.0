Return-Path: <linux-media+bounces-41257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD8B3A21C
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA1118905A8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F6E1DC9B5;
	Thu, 28 Aug 2025 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c1Shky4O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5B245006;
	Thu, 28 Aug 2025 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756391848; cv=none; b=QWOSOY5Cb5UpuY8i1kOuXnT2/MpplxuDsYb5CbcleQ1DkQj77/l60LvOe78sou+UtAzJhdKpo7uMC8zEjCmbZmjFYPBan1cBY/h8Uw5noWlYeNpT9wsRS/fBwB/6+vtFlKjStnIqxMZCI/L96+I8taALUpSnigzuB/3CJpsMq8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756391848; c=relaxed/simple;
	bh=G+AVTy1vDdnOeJbR9IhgCKJEJpxTokEnypzVLxIa0qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pNvY/UDGmAkWCLsXiq3TEJNYJMJZt7YEnBr0XWV8nfuCfHiz+N1zrs7lRyT3OGOuLi0jVd72CUWAdk30Ag5nmPzEAOdvqc56h0mVkXJlNjDdTaXFVCFioSxgysHXM4IiMl3wsvJozZQ6k3QlurlZmZTVb2SiaCnRrcu3US3S8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c1Shky4O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SADvNK007072;
	Thu, 28 Aug 2025 14:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vM0gl45U//z8TqxpTBqBv5QW6RDnwLC97NaQbNPFhFE=; b=c1Shky4OHu2NputS
	lfo8R/qmSu15zZL/YNqIA3krG0XT5sSSL/0mllVYm7x+G+i2crho1oMAkW8+UyhI
	8R2r/bteP/mkyPJQXBqJ2NKHR9yxPcvboFG08I+lvI10myNK6YgrSjtCivUuHHHw
	hQBx18z3ZeQoTmywb28J3HmPs1YhM2OZgKDr+db7NW9cm11T3Fd5RFHUegmOw5hh
	Ck+nBh6cSAqzQzKKwZv1sapyUYdssxyIRDCUKd8jBxLKpggUtTxT3vCD2zYiDJM7
	t+GK/afSFesaHd8DQzK2rDtUh+ex033W0qA5fikJsrzMURQrCVCy2EJV1CD39eLP
	Bvo9Vw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67gpkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:37:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SEbKSU013926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:37:21 GMT
Received: from [10.216.32.160] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 07:37:17 -0700
Message-ID: <8db7d699-d3f3-48cb-27c9-fb3639aeec9d@quicinc.com>
Date: Thu, 28 Aug 2025 20:07:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mukesh Ojha
	<mukesh.ojha@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
 <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
 <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfXyHFTFbBVnlQi
 Pun4m5B9Sylnu0H3Dl/eVk7AKyDSpUKymN/iH6gMdxozClUT6CWievHDgjp1EBdD7RazhJlMwet
 fnrxMKD6HIf4Rbqj/ht9xlKKF7cbOzQIyl/D/V8Hne0WxqMkSmos+bnxs1MTEoZQxAINMHEXG0l
 Y183ucvZ+hco6wXI8NDJshO6y5jISZ9NG/tGRG1bEVU3f0WxEZKHZGA1rm0Mu7jDp3SW0+sE21w
 1TlFoc3eadAvyhGu+mEGLfszoB6Ne1x/wn6EN04O19v/O6D9PR/bkJzEAvCKd5duLDpHEoYGFEh
 kHUgJhDDU23avV3t1wUfDSY7k9JG0IE6LSorty2Y+yESukMbVcsyEYAwFclt0voIwPg8db2DWmm
 4GBJiFlx
X-Proofpoint-GUID: Kqk2F3ozll6P1eQ7kCZEaAbQhssoW4pT
X-Proofpoint-ORIG-GUID: Kqk2F3ozll6P1eQ7kCZEaAbQhssoW4pT
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b069a1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=6Nl9TJtETMbUvoDUwZAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085


On 8/28/2025 7:27 PM, Krzysztof Kozlowski wrote:
> On 28/08/2025 15:49, Vikash Garodia wrote:
>>>>
>>>> Whether removing will not break any ABI as initial binding enables the IRIS
>>>> related code to use video-firmware, now we are removing it.
>>>> I believe, removing binding always break ABI ? or is it depend on driver
>>>> code not using it ?
>>>
>>> There is no single user of this, out of tree (I briefly checked) and
>>> in-tree, so there is no ABI impact. I am changing the documentation of
>>> the ABI, but there is no actual ABI break because impact is 0.
>>>
>>
>> My understanding here is that the interface "video-firmware" is already defined
>> in the binding. There could be possible out-of-tree users of it, might not be
> 
> There are no such.
> 
>> possible for us to look into all of those out=of-tree users.
> 
> We both know there are no such so you claiming "maybe not possible" is
> quite misleading. Qualcomm does not use it and that's the only possible
> case. We can verify it and I did verify this.
> 

there are no such known to me either, maybe i would take this as a sufficiency
check to drop/deprecate an interface.

>> I support such cleanups, but also need to understand how this is not an ABI
> 
> You are just making up fake obstacles.
> 
> 
>> break, just that there are no in-tree DTS user means no ABI break ?
>> Would appreciate if you could point to any guidelines if my understanding is not
>> correct, i am currently referring to [1]
> 
> There are hundreds of discussions describing this and I am not going to
> do your homework.
> 
> In none of other qcom media camss/iris/venus patches affecting ABI you
> raised that problem. Even remotely, so I cannot understand these
> questions here differently than just spreading some sort of FUD over
> this patch just to keep that broken video-firmware design for future users.

As i said earlier, we can find alternatives to video-firmware, its fine. I am
not bringing this discussion to support retaining video-firmware.

> 
>>> I am really sorry but it seems you ask about basics of DT, so please
>>> first get into docs and other existing discussions.
> 
> Again, read the docs and existing discussions. I am not going to do your
> homework.

The doc i pointed earlier does not capture any such case, hence was requesting
you to point any doc.

> 
> Best regards,
> Krzysztof

