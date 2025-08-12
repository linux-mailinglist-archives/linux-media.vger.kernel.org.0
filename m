Return-Path: <linux-media+bounces-39566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0CB2237C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6779B3B3D41
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACFF2EA177;
	Tue, 12 Aug 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODb81n/i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F32EA153;
	Tue, 12 Aug 2025 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991670; cv=none; b=fxKGNi+D/vOiCt9NXhWhCG0Nm8q8fpnW/1C6S/K04LThpG6gvEiav7D4VW9gOaGAglmyLARazB74rbkzIVhLF6ykKAToCA5jX49tHgdZLiLhhFOn/J56ymqxxY6P/Q2p2atfto8/jqlAe0+t9MsDTFFaitBiQMZkbOLh7I8KigE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991670; c=relaxed/simple;
	bh=4EMXaVo5Sq2XAmibGedk6i8gQaxNAD3yA100vDRYn20=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hQ5PGh7OH11s3yikVPkgr56SJI7O/Lmt5HyUbyY/eYNH5AzcaTPhPacirYxafasO/2vDJTVFgRZERLLjqR+cEZ+5nP1S2fuUKGrVnW6Ms7uw1xVpoWtsim/FQvH/JHWVHQ7abT81OzoxBpz9SR9VzQ9RCrR684LiwDO/Odqw0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODb81n/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C8VdN2023847;
	Tue, 12 Aug 2025 09:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21v9lv/l0DqaFwa8TCQ6M2IAwRVfaGeKjkIYv0vkZ4I=; b=ODb81n/iY9fDgsPa
	uywzOlC+J3xAgIADT99OMBCVpk3qBAHzFMoCK3mq0jcc5ROQBqkAbAb82EUc/TkX
	Q1eIX58cYf02lmj3JGMge8/xdN9cdPbIgWiJRbxSwvWSdHu+rdyw9g0R+Au0Lodn
	Z21j8pC6/Qw7BQBnf2N+apcOFktnKikttHfJdK9+V3SrBDjzRH9Kt1IIq+yEVFTQ
	nqXkHmEUbDxSKR5SuMH73d9lIvOh6Ql7tH3tmCA/ZpC/T+HPWltXKWOqiABcO6Ky
	VIuJjfVt0ggS+IiIXuFGzGmElEz2RW+3YoZp++VOk/yfZVoh3exipiTCKn0C9A/T
	AGofnA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx5thc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:40:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C9esHX018323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 09:40:54 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 02:40:50 -0700
Message-ID: <ec9ee3c2-5c4d-8dea-8399-3b9cff880254@quicinc.com>
Date: Tue, 12 Aug 2025 15:10:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/3] media: iris: Add support for SM8750 (VPU v3.5)
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <c009fe77-8590-c467-a0a4-76bd6ec7cba4@quicinc.com>
 <363cfc88-9664-483f-9503-9eca7c8e617c@kernel.org>
 <76731f2a-d120-ed3d-6a1c-e339b0a6ad10@quicinc.com>
 <7322c2a0-82a4-464a-8aa6-75d04dece2f4@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7322c2a0-82a4-464a-8aa6-75d04dece2f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXxcAcP81YjsvV
 WysIA+Uf3YECcl9Q5Z0m0/Qs+drHG7vy8Vn0JUjTbFvIaOtYKb0Q6CsNBkhJs7B9nIv1WL3b6Px
 NyHdPCh+JXsbE7+uLnlCC9EFaecyYBW5QcLFUzJb1SDR0ZxjQqcvWY0jqno/Cf3vixxYExwiE2C
 ksQPl9CXhuP/hip6qh4ONVJg1GIS4vaJlkT5dPPzcxzvz8NQeh9SDqeYuZoNkZO1lCoZZoBCk8G
 YK+ZDTAM+ZydA47GUzYqUc70KN6k6SRo3Xr6S65nphnHaNdaYdKSzXomRYKGd0F2zMb3y00BFfn
 TxtWFaDcmZybeYwBiOzaTF9LmXhhxDIWxS7NR24ED+RaaJ2yQqN4AJlpbCHIu+c8jdI+QDJx2Lj
 CTC0kiOg
X-Proofpoint-GUID: u-mZHcDgAZ5VNtDKHbc07Vb5hevWmOal
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b0c27 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=kecz6LPU3HZ6vTtv-cIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: u-mZHcDgAZ5VNtDKHbc07Vb5hevWmOal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/12/2025 3:06 PM, Krzysztof Kozlowski wrote:
> On 12/08/2025 11:28, Dikshita Agarwal wrote:
>> As a maintainer, I believe it is my responsibility to ensure that anyone
>> enabling support for any SoC with this driver has tested its basic
>> functionality. Please note, my intention is not to block anyone’s patches.
>>
>> To clarify, I am not asking you to provide any test reports. If you have
>> already tested this series with v4l2-ctl or GST, please just mention it in
>> your cover letter.
>>
>> Thanks,
>> Dikshita
>>>
>>> so asking others of this is just unfair and unjustified obstacle. If you
>>> have technical comments, then share. If you are just making fake
>>> obstacles to stop some patchset then refrain from commenting.
>>>
>>> Unless you want statement like:
>>>
>>>
>>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>>> Gstreamer on SM8750.
>>>
>>> Then I can give you such statement, just like you did for your patchset:
>>>
>>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>>> Gstreamer on SM8750.
> 
> I gave you the answer here.

Sure, Add this info in the cover letter for the next revision.

Thanks,
Dikshita
> 
> Best regards,
> Krzysztof

