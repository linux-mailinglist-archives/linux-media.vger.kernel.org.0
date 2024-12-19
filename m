Return-Path: <linux-media+bounces-23773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F219F7767
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA20167931
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 08:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0960922144E;
	Thu, 19 Dec 2024 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XlSP+Y1W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527D21CFF4;
	Thu, 19 Dec 2024 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597309; cv=none; b=LF98G0NXFckZzjKDmBeHPHLyKzP8yNa3m5iDKhII+4Crr8vrcJiwwCZEUmXEMFvvKR9DIl91+w33pqpYoqTbJZqPiJhV2F1o27xzyurP0FmmTgz618c/QJvfhNKh6+fO4PUdh7tLPizibqdJ8DqvbGXztKT91BEsNpGv4KZhBS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597309; c=relaxed/simple;
	bh=VF8ptOFU6OnT3cwXZhIox3P9gEpjMSXbzCdDZcLtezI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iMwfxUoueJL+PZFoCQiRCGKScUjDUHf7aUiaky4bZpHnzeGM1bmQrN69Hm70bzuZAX3zAvFUJUpC6eYAAXeDx3q+qE17CiKwgC5KjkgxbRdMLMKyw+FmLtKQUthrwVu7ugebOzOJUU4uM4nblno4DGm9VAcwrSO9ZTcr0oNC/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XlSP+Y1W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ880rp003254;
	Thu, 19 Dec 2024 08:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kj/rjxH0jYZkCS4iM/splU3w4uHLw2AWL0pYNO0b6Og=; b=XlSP+Y1WAuaZbp3r
	ZxrSK/JBHuvca3oDBBLmwb2E+9AIBGrxZsR86gPojj2TZvhioSrA44kGzeLLtVcf
	10WDOafrLVn0BN9OX5dr9ZkfCAN8r1jDZcN6GXmtQwPXXnKq+wPCOxmNpxmzASd0
	po3k88pxo1RoNUc1QNhTX7MQD4E26HAopyRTDstIpBlvbiDkrGoa+XwGW8d3hGSf
	YXXidrwvV9iHhVqKgh5bOR6V0PlO5IyYwKjUqJ+PtveJM9pi5/gI9XoA3oFrBI7s
	2STowJFAhnGMtry/4uy1f99DwcyPe+A9KifJAoFr7a0uAq+SZiPyKBKlKHgOlMd4
	IPQekg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mfq4g28r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:34:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ8YmtZ015371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 08:34:49 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 00:34:45 -0800
Message-ID: <2219aeab-7b03-448a-9a70-a4874bce903d@quicinc.com>
Date: Thu, 19 Dec 2024 16:34:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: media: add support for video hardware
 on QCS615 platform
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-1-e9a74d3b003d@quicinc.com>
 <7d4476c9-d9a2-4ef7-95c7-91391b355ee2@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <7d4476c9-d9a2-4ef7-95c7-91391b355ee2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zebQHW2pdgIXY9r2-qnzJrKRKGCYwfex
X-Proofpoint-ORIG-GUID: zebQHW2pdgIXY9r2-qnzJrKRKGCYwfex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412190067


On 12/19/2024 4:19 PM, Krzysztof Kozlowski wrote:
> On 19/12/2024 06:41, Renjiang Han wrote:
>> QCS615 uses the same video core as SC7180.
>>
>> Therefore, add qcom,qcs615-venus compatible to qcom,sc7180-venus.yaml to
>> enable video hardware support on QCS615 platform. Make qcom,qcs615-venus
>> fallback to qcom,sc7180-venus to ensure compatibility with existing
>> configurations.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
> I received this multiple times. Don't send so many versions the same day
> (or don't send to people internal testing things, not sure what was the
> point of other posting).
>
> Best regards,
> Krzysztof
OK, got it. I asked internal colleagues to review it first, and then 
post it.

-- 
Best Regards,
Renjiang


