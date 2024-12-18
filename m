Return-Path: <linux-media+bounces-23685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7099F5E74
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 07:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B55BD16B4D7
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 06:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9B4156225;
	Wed, 18 Dec 2024 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RtqJrMMr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086EC13BAEE;
	Wed, 18 Dec 2024 06:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502211; cv=none; b=YnymmSIeOJs41J7KlXMl6CWv78OvYM+PQEF0ItKfaxDqTbhSxmjqa2fYlzPry/iytfSMij3aqrJDBZXr/5PnBk9EOx90eO84Lf6TotFlDFbynibByhq1m9KDvTBDeULHrLFuava0hQ0/xPVrInohUnAt+Vh9aHxeQVyOr3PoILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502211; c=relaxed/simple;
	bh=Sbr5u6zG/rY9yVsxzYw6oU+8eUVqBaBcnXVCmBuMOCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AE4CeIS0CEgk5CigiezkBpliutoHvO+F7+BeGtRlVK4dSTclnUvLCQNbo9TYpbqKOg/0d8qIlyESNIPGHdYzwr3HMAR6auUjd7R9a2Z5KnLz/brKZmtLE4Z7NqaHonV43c7ipWAIVhNtjqWW5wnUgApVFlMJ1faEmVZeD1S6h2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RtqJrMMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4rbo8000558;
	Wed, 18 Dec 2024 06:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFMIsQIrpJjV3q83MpFde18Gx2MP/KDbDHgu9L+PDjs=; b=RtqJrMMrJD8jQHHt
	Jd0Hy8LjpaHhmFCF+Hm+a4Xt4+Jd+QkK/LkUyGWBMwLeYrgLON3Cf89Xok27diII
	4Q7C/t/J+/jEVB9KZFImEcPj2qW94NtVIhlsjr0pV1E073xdIXShkCKLG0Ha9qBo
	+ViKTJhBWQS3tfzJHYjJ7/ksoyTtoysIU4k7BRzCK1uNUQMEA3wjt6edUAZWvgap
	GzGayhku1vbjqVHuQ1EHpog5E+EcmpwnJw0UpgJpDlI82Ryvc7P/wQxyoeaGJzEY
	DBgEzn0BvYd0ehywm40NtUM3AZJe+iQXCJEnhjCFMIFL9T7wZ7CNQHhmNQPFqRcX
	g/gqWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqs3g4pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:10:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI6A3xr025962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:10:03 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 22:09:59 -0800
Message-ID: <0adb64e9-2394-4057-bd75-0ce83158550f@quicinc.com>
Date: Wed, 18 Dec 2024 14:09:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
 <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
 <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
 <236d41cf-ddc7-46e9-91b2-190c165461b2@linaro.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <236d41cf-ddc7-46e9-91b2-190c165461b2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t78QPXo6DW55NngLHi5LI5OjjLKz8cwd
X-Proofpoint-GUID: t78QPXo6DW55NngLHi5LI5OjjLKz8cwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=870 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180047


On 12/17/2024 7:01 PM, Bryan O'Donoghue wrote:
> On 17/12/2024 09:54, Renjiang Han wrote:
>>
>>   I think when your change review passes, we only need to remove the
>>
>>   video-decoder and video-encoder nodes in the device tree.
>
> Yes but the _point_ is we shouldn't be adding in driver configuration 
> to dts.
>
> Which means I don't think your patch can be applied until we resolve 
> in impasse in venus.
>
> ---
> bod
OK! Thanks. I'll try this patch with your patch and update it with next 
patch version.

-- 
Best Regards,
Renjiang


