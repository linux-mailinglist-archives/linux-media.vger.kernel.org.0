Return-Path: <linux-media+bounces-23680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 298359F5CE3
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 03:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E7F1892DD4
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 02:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A8B13C695;
	Wed, 18 Dec 2024 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BxNNhzBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D64487A5;
	Wed, 18 Dec 2024 02:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734489018; cv=none; b=uh7TQx5q8K8tuKIrVAV5aMP4KA46NwglM0wqt5laFDOtMX5wuX98v9C4IabKfIEwSnbpHtISixAlJ94N/11zIAdhZ94QaAt29j/ecl6w+qrBiKe4+5YfkTps8twXyG/Bh/boLFd9NoK9Q1w6lz6JPhlX9CVQ2kRhXtwl5fXelI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734489018; c=relaxed/simple;
	bh=ZAp9bGutUxwcBeqrNHjpQjS4V4yq7H7cYnzWvVvlVXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LSor+EgrIJ3W3M0LordqPkTfg7Cdmt2i/jHktjAAVc9qTV9H+ZVysK/5PHDoUKHlROCB5oR3P3jggsN1bwgKR6nwW3hGq9jC5BeMqwPRPfe6dYHsKLBMHnQEYXPC6Dy7nuZt8l7q2RszsmbpvoO6+1C1ueUHQi/kHueC3HCSsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BxNNhzBC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJimx013228;
	Wed, 18 Dec 2024 02:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ksxglQtAWhSizpcVE7sJ+PK3feJyRpPEqaKB1VQAhpk=; b=BxNNhzBCmLneNVsz
	MC7aK17oNARJiFKRg44BwfS9K41wMfYwi978q3PjzyO3oYHWQB1rJW+NhCKSqLlw
	DXW1qIT5jUMX/YjwEUq37MEoIFtslnUVIc83lEroS/Gs79fkWveBdQRt2HDvstED
	rzthIbplF/K0mA9UeV7C7Ifdqz6BD1E0YgMoItxsQ9LSYf4NWqQq/xyuPlJBKezh
	EP+noUohV37/9WQ//TQww2d939LxflPvoyCDVQYIapZ19bWPhaVEJhrQ6ThLNrjZ
	tE8F8Pvc/HjT7LrW/jVg3d6JY0icjSsyOmTP3elKJwM0+7WRDvYYxluuO7hxzXUm
	g8IXfA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kefxgwfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 02:30:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI2U9RJ030210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 02:30:09 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 18:30:06 -0800
Message-ID: <d263c173-5f23-4f7e-8042-ff79c2e4059c@quicinc.com>
Date: Wed, 18 Dec 2024 10:30:03 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: add support for video hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-1-747395d9e630@quicinc.com>
 <aa4400bd-b838-42d6-a58e-1eb1c99af218@kernel.org>
 <f263bf9b-3227-46ef-b94b-25a7ddec68ca@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <f263bf9b-3227-46ef-b94b-25a7ddec68ca@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Fw4RC3s6tbDcbYyTeUWehv3YO3ZnSCsW
X-Proofpoint-ORIG-GUID: Fw4RC3s6tbDcbYyTeUWehv3YO3ZnSCsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180017


On 12/17/2024 8:40 PM, Krzysztof Kozlowski wrote:
> On 17/12/2024 13:40, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:17, Renjiang Han wrote:
>>> Add qcom,qcs615-venus compatible into qcom,sc7180-venus.yaml for the
>>> video, and let qcom,qcs615-venus fallback to qcom,sc7180-venus on
>>> QCS615 platform.
>>>
>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>> ---
>> Read that message fully.
> I meant, message in our previous discussion.
>
>> <form letter>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions, under or above your Signed-off-by tag. Tag is "received", when
>> provided in a message replied to you on the mailing list. Tools like b4
>> can help here. However, there's no need to repost patches *only* to add
>> the tags. The upstream maintainer will do that for tags received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>>
>> If a tag was not added on purpose, please state why and what changed.
>> </form letter>
> Best regards,
> Krzysztof

  OK, thanks for your reminder. I forgot to add the Reviewed-by tag,

  that's my mistake. I'll add it in the next patch version.

-- 
Best Regards,
Renjiang


