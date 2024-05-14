Return-Path: <linux-media+bounces-11433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1D8C4DC7
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 10:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8861A284104
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 08:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DEB200C3;
	Tue, 14 May 2024 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iHWYGS/f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721B1CAB1;
	Tue, 14 May 2024 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715675969; cv=none; b=GoPQodPJ0J1rnz+n2B8AFAFSSEk4KQNNKjbbh2moYniR6aVss7gMbI6xKMhHWyEFBMvndg04IuD/gmMG4V3M4S1n55kGN2vjeJ6ftOCxNEXo3DCpYKaMMFYfzDEV3WQbf6vFT+6HK6h7AFz8aLifMMwrwkAM7gYMsGImCq6nqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715675969; c=relaxed/simple;
	bh=Lj4Zx1rIkde5sg/gNvqusl6lGf0Bj0HmSnq3nSnra4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K236IlADBtBE7g52rkHfxyNoISPMZTu3fBjysIRgmtRqFagXCINoCE/qHdPgR8r14onOI1sUcKdaudoourPvR4LfkBM7bP0zdlGG9MCBULiNNEJ6WKLmQkT+n2oWfr47zm/llTu4fphqUTItjnKADGqkz6sUGjKU94Na87o0Apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iHWYGS/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8qGc009927;
	Tue, 14 May 2024 08:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=arxYHOnh1XaXsKWitYbSPh3JP+VL4K7roRKT+z9yAvk=; b=iH
	WYGS/fP4ybvaU1pJ9mWFebuzOLtVh67YFHDnjzxdG5Y0IgdD+eY2PdovIqln1/UP
	+rzhB4rF82tsh2n3NQAB7xtosb7MW7RtcvkVOjx6sjp4h66WI8hnh4CQXCxfxcvC
	CmpULWRep69fMuT7e5QhOYFnUtK442or25DJJRUtmGRY8Jt/lWFbX87y5OzXEPhZ
	f3MTgSWvp9m8LGEAud1wjKzXNZWjIhh9mH2DPLMtYmNpVgx6paHc/dV254FwLrJ1
	cRXrDWx5CGjxG3x9Wjx0m8tCxwF70pfu2Zzz45A3ARzMW3uYHk89N6vvemNWB11m
	6wripzd1/8zpgv8MnDUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21eddk7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 08:39:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E8dKOU004132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 08:39:20 GMT
Received: from [10.251.44.40] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 01:39:17 -0700
Message-ID: <d0b80f9a-9625-4151-8cb4-dd86c8325fd3@quicinc.com>
Date: Tue, 14 May 2024 11:39:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: qcom: camss: Attach formats to VFE
 resources
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        <rfoss@kernel.org>, <todor.too@gmail.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-3-quic_grosikop@quicinc.com>
 <c76957b9-d57d-469d-87c8-c9f59b4462b0@linaro.org>
 <9ac41841-9281-4867-a607-e3883f32db83@quicinc.com>
 <55ce4e31-4134-40fe-8e94-28392863886a@linaro.org>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <55ce4e31-4134-40fe-8e94-28392863886a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UoWX0jMuOaED5cQkLJYW1iH9fYbSAs7n
X-Proofpoint-ORIG-GUID: UoWX0jMuOaED5cQkLJYW1iH9fYbSAs7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_03,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=970 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140060



On 5/13/2024 8:36 PM, Bryan O'Donoghue wrote:
> On 13/05/2024 16:35, Gjorgji Rosikopulos (Consultant) wrote:
>> I agree but i would propose to have next series for cleanup up patches,
>> Otherwise we will have to many changes across the files.
> 
> So, I missed these plats in the code, thanks for spotting.
> 
> I'd like to get the header SPDX and style stuff Vlad highlighted fixed
> in a V4 of this series.
> 
> However given the amount of effort required to verify these changes, I'd
> rather avoid data-structure and/or logic changes at this stage.

I agree. V4 will contain only style stuff from Vlad and patch 3.1 with
fix for csyphy type.

~Gjorgji

> 
> ---
> bod

