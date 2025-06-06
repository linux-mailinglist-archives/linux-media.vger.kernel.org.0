Return-Path: <linux-media+bounces-34184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301DACFBBA
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 05:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 349017A9C4F
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 03:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5CF1DE2BD;
	Fri,  6 Jun 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="afwa0EYM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB433086;
	Fri,  6 Jun 2025 03:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749181965; cv=none; b=qBkSiKYI31k0VmUiqegpeUnmB4u4Ikt/Kc5ZODSmAjWHYbG1iLTYCVxyJ875FWYh7/vPu39AkHZvnNYynts1QG89s/BPcjQi7iN/98kWG5F5pw5uBKL9hp/1GCPIKP2fId6SBAvkS6x6MgwtTlVwumRf1IY7ivj7+nwwGHjdToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749181965; c=relaxed/simple;
	bh=fob5BvZv3M8WB3pqjaMSpRnqblRTMtPb/LtoeQdVoa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=privvmohatz7J0Xc4Avk8j53T8P2Lg6C1VGcBuArfmP2jolvDBgmE119ztUp4Q5iju8tijHrk7WQL9YO8Yrr3TV5lBh4mnvUs++JCrvf9HFTrjsSwwXxk1o2M5brAYWjBYBjdLT+7jB6xYSWHoJINL9v7mmmCStMWzhcqSauGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=afwa0EYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555KPw2h011697;
	Fri, 6 Jun 2025 03:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txP2Ge6FT9KyVf1RfYblk6mCcxGr22m+ZThYcUhL7m8=; b=afwa0EYMfZhO6gQn
	39Ga7WB/VHVs+qyNanYwa8UextpKXrxUqHcdmzsmorSLp7qZZjITMIolg/gQGVsw
	MZbohJYtt68UAQ+BV6XI+ya7uXwIUOqVx3ut6igE3doAYJUiqw/TN1/jTgG6wax5
	RrMzJoblGczK/eaTb4t1Jn5hRg/OZWaoKshbC8OXnSzjkYU78N5MGyz6CAEGdnqL
	KBBbNhWBMOdsQ4Lj0MNbVNtit//82Y+PUv3wgiU8Fo+MzfAlSW0q9W8qnw9ypi0/
	+QGQpSCFue5jIPyhqcfCzvoKXXyzj8VA2Gaw7t1LrF0e4D58kphomUbLLqa+QDF/
	MYLhgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wh0k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 03:52:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5563qako015303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 03:52:36 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 20:52:33 -0700
Message-ID: <3956eeef-2a60-4bfb-908e-5e3e32970b86@quicinc.com>
Date: Fri, 6 Jun 2025 11:52:30 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
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
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yKVyxDYhD0L7oCCWsvgp4AELJ79Iew-T
X-Proofpoint-GUID: yKVyxDYhD0L7oCCWsvgp4AELJ79Iew-T
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68426605 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=41IMUykn9d4qAYYx1QoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMyBTYWx0ZWRfXwTTUtfgN59Cp
 +tZD+PUH2jCiW/IdZdCQE3M+22VIa6xsICr5LnjH/TUHp35bA+AA1vhhjSq5ZvH5VHOM7ennoLJ
 or9gfW57wm2jgKdrL5oo3rESK8UESTxBDOjesfLkuH6OaVCh3wnb+Lp0DGqDWUImU2fNhhtBNjh
 IK51B8KWWUu1hL0SRlmbpGVTRbk8pOTOwoQ69cIU0CLFCVZb1J6AyY1aJb2cViVnnnxbn0IyC6m
 S1Dr6vs60C+OOumHNJsIvnUpEA0P8RmlgEcMyDeLpVOxLP0IyO2d4i63fuIBXV25/yLMU+rlzd/
 ZKQStDsPqlYE0jevYfOS1WtnLOxbdVvx3/0ACtkY5j4ABiEvCogQz4DSQgBRu2Kd6BOzugPLxjn
 ONwsZ6FTCqvF+L71kEQyWmIXTWm00S9mYtFiYOh6tosOtd4r1tsuwarUHTrSMujALEzxmS7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060033


On 6/5/2025 8:40 PM, Bryan O'Donoghue wrote:
>>>> Well, that's a NAK then (although depends what you mean by DT).
>>>
>>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
>>
>> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
>> one branch.
>>
>>> patch. Or just merging the patches in two consequent releases.
>>
>> That's a new device nodes, new hardware so it should not be blocked by
>> any driver patch. This is just totally broken process / patchset / work.
>>
>> Best regards,
>> Krzysztof
>
> Reading this thread, I don't think that is the case.
>
> I don't see how patches 2/3 or 3/3 depend on 1/3.
>
> The frequency table is a fallback in the driver and the DT changes are 
> completely straight forward.
>
> TBH, I think we are hitting an email comms/social barrier here, not a 
> technical one.
>
> @Renjiang can you please confirm that freq_table is a fallback, qcs615 
> will work without OPP table and the DTS stuff doesn't depend on the 
> driver.
yes, freq_table is a fallback. driver will use freq_table without OPP 
table. the DTS doesn't depend on the driver.
>
> TBH, I don't see how the DTS can or should but...
>
> ---
> bod 

-- 
Best Regards,
Renjiang


