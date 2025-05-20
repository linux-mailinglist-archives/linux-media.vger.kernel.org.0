Return-Path: <linux-media+bounces-32893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44FABD449
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89F854A63B3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F5026A1DB;
	Tue, 20 May 2025 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g4lnDYVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE3F265CC8;
	Tue, 20 May 2025 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735973; cv=none; b=ki9f5wBy2b4g6x6Hxh3T+SjsD9us+nF0jtPopyNBkKms/DGkeLIM7w/oqme2EY24UvTwC/JWYzwiRWtok0QWcK7xQ8MvnUTP/rvNS/7TRN4C3Q6gwt7TIPjbZQzwc7luGJe9NLsm3RRSmohsAr/uyevbAGxFvLFi9nX4oyjfWUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735973; c=relaxed/simple;
	bh=QoZ1MmMxWaYoZM2DGYGuiWzzzDqsnwlVTOVWkNBAoDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZLNDnaScztPflUXAaG0dnfQ3rMucUnPWXWLitAYiAlNjYTStmGQsV91e3yA2/kem+AXJoJjP+6YSeKxdnndSX5wkouTvmmZkiKQsY47sNzgTxXFcpMc3WiFsE/CvYTl+x9H9y/yxbKvWeNiNM2eX9KJkq2tu48ZG0YnE7d1s44E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g4lnDYVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7BGt8016028;
	Tue, 20 May 2025 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHy10H/BTLtjK7UpT72cmGoRA/ruZ2FPFvwHxI9l8oc=; b=g4lnDYVHvnFDxY/z
	92Gi4GvHFXCMgrcBDrA/29eKo29xfKVWYOdfnuDK0wESqNvolSGkb7iOh5GZhYdO
	nSiExx1CBZ7ILAWq2zXKzHONqVUIzA2EgifRxeM8yAp3vF3lwlY6jZy/vOjKiDwy
	9V1KdvbREMZAMNjNem1jxa9/AXF6edgyBbEt9gB/OnDCZx6mIHI/AV//nIcp73QH
	iKClE3lyppAMPa/AuUstZgk87FKtoN5ex8KKvICwDNYeXzynlJb5v4uE3g0LAtNk
	wk+maXgDByw8nGWMa3RqHMxSfTvcHAvfIV3iTBrKQ0E8NsM1bzyKyh6kuhIBMhDV
	Y1v/zg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyqd98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:12:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54KACkoO005766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:12:46 GMT
Received: from [10.253.11.26] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 03:12:42 -0700
Message-ID: <322b6e06-8ca4-49b2-812d-ab7b798e1579@quicinc.com>
Date: Tue, 20 May 2025 18:12:39 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250520-qcs8300-camss-v1-1-1dfcb2e3bf93@quicinc.com>
 <db562aa7-98dc-4f0e-8b9c-4348b4c16384@kernel.org>
 <bb5c40be-85f0-497e-90de-7f7282f851e4@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <bb5c40be-85f0-497e-90de-7f7282f851e4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MiBTYWx0ZWRfX9oNk24fL/5Bl
 7xsDLryLHJurImdS+3VbLmC0cTxfrKl0tNwjikS9jD5AyRDmZpWcE0F73ZE17kEP0kuPcUk2i5h
 +HmPa8EcpH/NuPsx0sA+lEI48NXj94q7zl5sohpVDDwfDG0wFUypXTFsburj/orIeqg8mGxr1rO
 VAz1Jd3K/HxcPRdUoFK4I0SavzvZ1syfWlianyS2v4xSJ81yInidqzoM6MlqqhGMmoHJ22yu1sW
 Ph4A2HBRzGWvxLdWJWhwO3iF2OeDCnaB13FFEKp9ynxhzlBwgVuO3SdxQVbmR91uwQNch9ifEJq
 DhC4cQqh56Mfomhok06kGYKNs3GFm7/DqoLP50MuuUsPl2xaIfgbk5H2t0PHklZ34ZJn98eECPw
 SozorIcGM5FxggAqYee5i7tWhbfZjmFOz628SzyiSHHU9NRwNbPFFSMYuI+lfiEYnGc9P7WA
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682c559f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=P-IC7800AAAA:8 a=kgcyKgTirjYJsoa9ePgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: YVTNPLodSiVb90t7E4Wxz4JmuG4W2meR
X-Proofpoint-ORIG-GUID: YVTNPLodSiVb90t7E4Wxz4JmuG4W2meR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200082



On 2025/5/20 17:47, Krzysztof Kozlowski wrote:
> On 20/05/2025 11:45, Krzysztof Kozlowski wrote:
>> On 20/05/2025 11:40, Wenmeng Liu wrote:
>>> This change enables camera driver for QCS8300 RIDE board.
>>>
>>> ---
>>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>>> ---
>>> This patch series depends on patch series:
>>> - https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com/
>>> - https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quicinc.com/
>>> - https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/
>>> - https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com/
>> No, please stop for now and see my other comments. You cannot send patch
>> which depends on 4 different patchsets! This is making merging
>> impossible and puts effort on maintainer to track these dependencies.
>>
>> Plus this was not even tested.
>>
> ... and:
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> I suggest to read your internal guideline before posting. It is quite
> comprehensive.
> 
> Best regards,
> Krzysztof


Thank you for the reminder, Will make sure to pay attention to it.

Thanks,
Wenmeng

