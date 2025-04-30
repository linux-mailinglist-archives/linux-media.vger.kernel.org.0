Return-Path: <linux-media+bounces-31458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62024AA4BDB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AFD99C42B9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A217264FB1;
	Wed, 30 Apr 2025 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hKJdZjlH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5125DCEE;
	Wed, 30 Apr 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017366; cv=none; b=Qq8p15J4wrfh0xpS+TETRBXxNaq5fu24o3O1dqonalVCr7AUslOpoVNUo1i3YJkqDYZjePqO4UOU3qJVJ6soRd8IjAR+QYkPFRw91BesTz8EJxxvHDOffaq5NtxYb7NRb6j/3pJHGOmluWXvoMOxRWBOR5cRZbIkQVMIE2WB7VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017366; c=relaxed/simple;
	bh=cDMJclNXODyK6FoHQdX9WffMNMsWwbdFdY0KjMSz0Oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p70dr+KMKNTLzevXxf67+7mLlJCnEs/8QDEuojcxSKGhzpzUl6cEeJkZv6azUb5OwNYFQeosBSQLl2Cq9k6k9Yz1z8SwmL4qEpENfPV40iJsj5t/t0LkZA8YrPE0aAib0p3Yx1NajcmJvoIshwmB/IKby4iGLXFTXsWR/FjvoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hKJdZjlH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Xail005570;
	Wed, 30 Apr 2025 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	occHxSA562krSi0Y+4bOpHp0aXC9KZXPxmhbQmxC0QU=; b=hKJdZjlHOarJ2S14
	D9T5lIAjOE8H7NtSXayeyfASevP+zwpDwLSq3+9qgziS0cDLK8yO7GC+R4gKyWFd
	1MP7zRBL3IqaE7DLuaqEmP74t05QbdvJkq2C7jlDycxiWD3bukBW+nZQ/jx66ci1
	5bBJGFBylJat+AOjr+/jGJhLuctbJNX4iBltQBTg6hq/50w7gDbS1XIQPQKneG1V
	sqwHL+gW0F/jaFsR0GgHulFcKJeE8cNfIte+9qCeFqzvX4JmAx7sU/djksLCULiM
	m5RLPeV++fJmP7io01An55QFUgExvVHe2N+W63Os7lo/G+HEeeCoO84Vpw03iZeD
	TEsOCg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8a6ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:49:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCnKcw028143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:49:20 GMT
Received: from [10.50.41.127] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 05:49:13 -0700
Message-ID: <fc01b28d-713f-e6cc-565a-c24b2aabac2e@quicinc.com>
Date: Wed, 30 Apr 2025 18:19:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: qcs8300: add video node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
 <20250430-qcs8300_iris-v6-4-a2fa43688722@quicinc.com>
 <5086f0d3-d097-4668-b195-5ee00e84aad5@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5086f0d3-d097-4668-b195-5ee00e84aad5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68121c51 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=uUng-3H5kDwaNyo2zCsA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sE0a39aUFNiYKzMSG1L2_cO8IvGiU5Ul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MSBTYWx0ZWRfX3phejJGNUUIk mY/ufdpaFODHineYJDki6UHbn2ffNa4vuGAOMpAMCvMvMx9rf7x0j5tiK/IhwWyz4SpXKMYtk6U T+Ykn6w2D2wj4zM1FgKyE3UUGbATHXEAinU0gIu6wvC0cH8PZjZf/xJl8P17ooAEuo1cqdUPBr2
 hLaRmu8OUio6dc7Pk9ypoQc3RrFF7gEX52K6dBbGqM15/M47oWDMG9IOB+U261MPCBsI4K2aKeK bnwGtjFiEZFKGijO3Z57nkYpPLK6H1iZWER+0fZP0G0+A+40f0s+e1KK6vYwzCHEgCNxz0MrUNg ZGD+wfUGGEHvOW7KjpSWJGthokgUfxHD1HZjGj8W63Z2J2VGOoJSUo5GTGjK4GFfgXhpgbwsfZ/
 T4tqwhpAhXJpiF1/ODd/Z/eNyEeVgG+zlhyraPV+9CD4P0h/CJI9wnFgVng2UipfKcXMHWAA
X-Proofpoint-ORIG-GUID: sE0a39aUFNiYKzMSG1L2_cO8IvGiU5Ul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=688 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300091



On 4/30/2025 6:09 PM, Konrad Dybcio wrote:
> On 4/30/25 2:17 PM, Vikash Garodia wrote:
>> Add the IRIS video-codec node on QCS8300 platform to support video
>> functionality.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
> 
> [...]
> 
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-366000000 {
>> +					opp-hz = /bits/ 64 <366000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000>;
>> +					required-opps = <&rpmhpd_opp_nom>,
>> +							<&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533333334 {
> 
> 533.00 for this one, 533+1/3 for CVP, it seems
You are right, its 533.00 as clock corner for video.

Regards,
Vikash

