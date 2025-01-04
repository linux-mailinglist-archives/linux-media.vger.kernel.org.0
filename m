Return-Path: <linux-media+bounces-24247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B7A01510
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 14:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 177DE3A3B0A
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 13:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E00A1B85C0;
	Sat,  4 Jan 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RsAu9/4G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B51328F5;
	Sat,  4 Jan 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735998066; cv=none; b=i9YjFRhM7WkHWW+n7JnMZmqUEj2mk6lwcmw0q1tvtKfFv3CkwZdG5WKEcFsFBSwFgMm8QYLgv4sflK2kSVP5J/Y/Z5m3SzBh6lHmpvSdez5txBDstFwdlDL/U+KkKT1Wgi7iy1q0h7VlQ1AtwCE2bHJlZqomsPP6XxtJSdA3XMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735998066; c=relaxed/simple;
	bh=2eaXjZBeA8Gx6L45rqGzF25hV+pfiW2AhSpgf3g6Jfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Wtfd0huSzQ/WsRyGY/OW9w6f8HiIY1WzAfoqbILFclu+WBU0A8tbE1K+U2yH0w+pJFvw0gLC1AsPiHepKINhY2MYPguCktLyu7axP27ot8RtLGOO0xxyB4SZQmxSqcEDM9aiKfBW/oSXPz1yrPCCLdtyFgkNz12I0zjqHbe2GFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RsAu9/4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 504BbUgf001386;
	Sat, 4 Jan 2025 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MMkcbGQSIP6ZJZBDsycEWvUrKY5qPPemfATlxINLouk=; b=RsAu9/4GEVSkVOOX
	VYN9mcVh6HRhLU7JA1/AkOBcxykeyKx9fUGPc+/bM7zSt6lLzN+I4j/PtozWO9YZ
	JjKoMP3/u7Of88HLBvNkTq3UrskkPywFrRU087MIb60U4el+cCZ5yzFv5IKDdamg
	KsSX9i7BOPVYcFuyS4SyD3/La7IheljeNm+aT8OBqZGGGbSUZIzBhuyEQlgqdg4T
	EPaJMoABV6mbzBxEaRhyNka843hbM8nZFpw9MxoaLEPL1oyjeMvendLDqAiB6h6q
	Uy9GCHDzrCXgEVmhKdgZvkDRxynL7BSrOdo6vUpeuRjzvoPSAw+RvlspPDuK3pSO
	tuFOGg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xtpdgw77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Jan 2025 13:40:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 504DevPN013696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Jan 2025 13:40:57 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 4 Jan 2025
 05:40:50 -0800
Message-ID: <eedaa77a-8070-41c8-a05b-b124d37ac093@quicinc.com>
Date: Sat, 4 Jan 2025 21:40:47 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241225133523.4034820-1-quic_depengs@quicinc.com>
 <20241225133523.4034820-13-quic_depengs@quicinc.com>
 <ql3sufugcdpoxqgvs2f4clmbnx75t4jh6ts2ryneu2u5oeuwzn@yizcouuzfj2s>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <ql3sufugcdpoxqgvs2f4clmbnx75t4jh6ts2ryneu2u5oeuwzn@yizcouuzfj2s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z0HFrQvQ2nX2C30UKUlJj58tDcF8sTh0
X-Proofpoint-GUID: Z0HFrQvQ2nX2C30UKUlJj58tDcF8sTh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501040119

Hi Krzysztof,

On 12/27/2024 5:10 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 25, 2024 at 07:05:19PM +0530, Depeng Shao wrote:
>> Add bindings for qcom,sm8550-camss in order to support the camera
>> subsystem for sm8550.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
> 
> Is this v7 or v1? Same issue was all the time in the past, so why can't
> you finally fix it?
> 
> Look:
> 
> $ b4 diff 20241225133523.4034820-13-quic_depengs@quicinc.com
> Breaking thread to remove parents of 20241225133523.4034820-1-quic_depengs@quicinc.com
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>    Added from v6: 1 patches
> ---
> Analyzing 217 messages in the thread
> Could not find lower series to compare against.
> 
> I am not going to perform review, maybe other maintaners have spare
> time to deal with this submission process.

Really sorry, I made a foolish mistake. I didn't realize that the patch 
subject was missing the version number, which might be why the b4 diff 
couldn't detect the old series. Thank you for pointing out this error. 
Could you please advise whether I should resend v7 or fix it in next 
version series?

I have also found a workaround to replace "b4 diff". Last time, you 
helped by giving a RB tag on the version 4 dt-binding. You can check the 
differences[1] between version 4 and version 7 on the Patchew website. 
If possible, could you please help review the diff provided by Patchew 
once again? Sorry for wasting your time.

Visit below website[1], then search "dt-bindings: media: camss: Add 
qcom,sm8550-camss binding", then we can get the difference between 
version4 and version7.


[1] 
https://patchew.org/linux/20240812144131.369378-1-quic._5Fdepengs@quicinc.com/diff/20241225133523.4034820-1-quic._5Fdepengs@quicinc.com/


Thanks,
Depeng

