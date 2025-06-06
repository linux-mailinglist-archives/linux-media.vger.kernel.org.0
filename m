Return-Path: <linux-media+bounces-34200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC984ACFDC0
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 09:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0A11189AA90
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 07:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0B228469F;
	Fri,  6 Jun 2025 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dfVefHjT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EEA253947;
	Fri,  6 Jun 2025 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196318; cv=none; b=IMCtpFu1TDwmS4XsTCZ2dJF6u20lOswAvjx2evzLlWQuP8ev3c5IgNsgdLmTaAHBf0jtAYJF4fwM/gOtYzHz6bSaz2Y1QCTMp3Z3eb151TZDPuHQ4S48dXMz8f0IZdyjTpIzTgA+HfV/K0tVt5iYvJU5mntc0ZAjYBDZ2tasZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196318; c=relaxed/simple;
	bh=ixcHSzravCF5OHMCMsSfMl6iEx0oa59ZZWL3buzN8HE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Uc8ctRsCH3L7URZhd7J/vC9JOdzwDkmzOf094sr4989Bi7BbCC57mhlWzHFO+MAh5vqIBJx30dS8sIrdWNFY64YmDTNLAeDMyKhQYz7PoVerrJQBxIzES/aIJ8IO3Tg+K4Sk63xi8mbrxnlPvBEDFC2sOZqGNStzg/EZedo36B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dfVefHjT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5566v6Uh007519;
	Fri, 6 Jun 2025 07:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OmRq2rQW2Lq33eRxKHtUNom0yzDPlFkjIY3X6SMU08=; b=dfVefHjTuF5iEq3B
	jqSXdF0I5LcTqFwkYQjktMtaQZLBWytd80W04TEnkS+fp9BwKtG3S7GQnM28YFln
	+keSKUfd612HNlcE34isDE+Ms7ONcvAyyisLhn7EJImLLMkNDjgveO3nihytgd+k
	s5IrVRlK7TXJWCXkdDoZGUE6H/myXrUc5avH4uo5ydT3cugl2IvhGXBHB+Qnxv1e
	hPAPXCWNu6lz3v65uaI4zxK5Gy3apSMRLcdBGrpsg1c7szShulq+16BcLuXu3kh0
	Xn6CcXaB5MX/2Tfn9vctT5KI6Tx/Ti1No+JcRZ0ZXoFcddUY+UB/QnEqOz6Q1dj+
	vu4ojw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t3tx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 07:51:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5567pqp1028641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 07:51:52 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 00:51:34 -0700
Message-ID: <e18bdd88-3866-4aef-8873-b9b67f0cb9b7@quicinc.com>
Date: Fri, 6 Jun 2025 15:51:31 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
From: Renjiang Han <quic_renjiang@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <3956eeef-2a60-4bfb-908e-5e3e32970b86@quicinc.com>
Content-Language: en-US
In-Reply-To: <3956eeef-2a60-4bfb-908e-5e3e32970b86@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=68429e19 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=FFWuaSR45GQhWSSMqCAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3MiBTYWx0ZWRfXxvDBPT3t5Wwv
 5n2fdUlHiLpn2WqC5GEMuXV1nGhw+27pYVg5zjhZGKsL2nKkWfmxU5wjSMpJAaaqXnDfXwVZhtg
 ikNslJIToL6bCxcbq6gO9wIp1/Ut74RRjG42DVJfnlzA0vl+FyUYZ8lllXZZIYj8c3jqZGBFUaB
 h5ST/4DFR1ct7Yb5R9jPZN2mjLsdAd4eItdF21XjKl2vOErHcDvo9+X1Rg/nK0WVVToHYcKjsSK
 fIqQo7r7rYzYzlyn4M0nUU7geuxdRaP3KKeLesOuoQHQrmjjIVtrHjwLIGOkZgqvvTK8CPwZbuL
 u2seoA/jTQ3yCIaMSSOARSle1LSKCyJkFXmXKRkbKtA2vgu1zfxXWNafQ3hHxAV809VKu+tCHbW
 OJdnNttl7gIxfDkO0yX6r+Ty6jIDOpCmfBK9b9uFo7nHdZ2djmbK+GAGvYenWe3zA4j00FLw
X-Proofpoint-GUID: lMZHjnQ-pNeHXXze68TsacmFKXiiyDTM
X-Proofpoint-ORIG-GUID: lMZHjnQ-pNeHXXze68TsacmFKXiiyDTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060072


On 6/6/2025 11:52 AM, Renjiang Han wrote:
>
> On 6/5/2025 8:40 PM, Bryan O'Donoghue wrote:
>>>>> Well, that's a NAK then (although depends what you mean by DT).
>>>>
>>>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
>>>
>>> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
>>> one branch.
>>>
>>>> patch. Or just merging the patches in two consequent releases.
>>>
>>> That's a new device nodes, new hardware so it should not be blocked by
>>> any driver patch. This is just totally broken process / patchset / 
>>> work.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Reading this thread, I don't think that is the case.
>>
>> I don't see how patches 2/3 or 3/3 depend on 1/3.
>>
>> The frequency table is a fallback in the driver and the DT changes 
>> are completely straight forward.
>>
>> TBH, I think we are hitting an email comms/social barrier here, not a 
>> technical one.
>>
>> @Renjiang can you please confirm that freq_table is a fallback, 
>> qcs615 will work without OPP table and the DTS stuff doesn't depend 
>> on the driver.
> yes, freq_table is a fallback. driver will use freq_table without OPP 
> table. the DTS doesn't depend on the driver.
To correct my previous response:
For this project, the driver patch needs to be merged first. Since it
falls back to SC7180, but their frequencies are different which is
reflected in the OPP table defined in the DTS.

The DTS patch is intended to enable video function on the QCS615 platform.

The driver patch is to switch from using the driver freq_table to the
OPP table from the DTS. Without it, the driver will continue to use the
internal freq_table as before.

Therefore, if the DTS patch is applied without the driver patch, the video
function will be enabled on the QCS615 platform, but the driver will use
the SC7180 frequency table, which can lead to an overclocking issue.
>>
>> TBH, I don't see how the DTS can or should but...
>>
>> ---
>> bod 
>
-- 
Best Regards,
Renjiang


