Return-Path: <linux-media+bounces-22764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF959E6434
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 03:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CDD22849F8
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 02:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFFF189919;
	Fri,  6 Dec 2024 02:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f7NHdqLO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6DD1714B7;
	Fri,  6 Dec 2024 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452335; cv=none; b=ZEzxrwfqh+ktdbq9L/nuPkHWI4bpwOf9rOy884hVyygrr4p2DbGJTxb4tPWqRjnHoZh9nK81Is/HxbqvfFsnENRZLu+ht+ngu50eJRNLKKPygd0NpxaLyPqiYeiO2ctpkcmuReAJY5n35pfsthaZeJlGxZH1THcNI531cpPrQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452335; c=relaxed/simple;
	bh=Xz0urQSXk0PIG0DUXBAQZqGKfzANZgT6gI9BQyjAbfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ge1XxihXxZeAE7FxLS3Zpno6mgx/F8iNPVVdpYp/m3R+dn+C6z8XQXARfaAWhxkYDI40ItEK12/z/4mMzFRmamJDSZ0gS9w95zg/8dDAsuP60j9zSPY9QwUNbE+ood908TbBFRZG+p05G06QS2vjbPYDPj8FBnenmHufOIA5pyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f7NHdqLO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMNm015782;
	Fri, 6 Dec 2024 02:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJfqkSMfcyB+XPVvEIKaC6xKx4MczluwSCWfhSjFvQY=; b=f7NHdqLO+RSpEQce
	7TbAVRqySKc8VCOeUzTNx2TJgeUo3KUZ3u5lqHGxq/qzIz18hRUfDK/mWzQv2MEr
	MNAXL/DxYxp7mTtbgDT5MoD2+on5518lvMUsKYnHhxBA6329wUQIJdkCnjOxjzJ8
	qJjwLkQwYOdm2LanD0C0R+V+GZyrklpgxTA4DSAECFRHKiZSm14EwYMqCOqY+8D1
	fDEHCyVnAE8rUX23NmaRbsBhezPaoqV3KKsfDJb0gfP/R+PTfNl+yCsxHAw65hwM
	VkD/EKVjHCbKbv2yl9eZQjZk/s/AAds5FfS45dYeDO3BGWKQIyjnkFvX0+l2YPB9
	tChDjA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmj1f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:32:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62W8Kt030174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:32:08 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:32:01 -0800
Message-ID: <38dd7991-8503-44af-8400-cbe6a8968213@quicinc.com>
Date: Fri, 6 Dec 2024 10:31:58 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support for sm8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-16-quic_depengs@quicinc.com>
 <220068ff-9979-4bef-935f-936a276034f0@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <220068ff-9979-4bef-935f-936a276034f0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NPYah-CMWdDoMDp_z5zD81c2Zt_l_Hxu
X-Proofpoint-GUID: NPYah-CMWdDoMDp_z5zD81c2Zt_l_Hxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060017

Hi Bryan,

On 12/6/2024 8:14 AM, Bryan O'Donoghue wrote:
> Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support for sm8550
> 
> Please drop sm8550 in your patch title, change it to something more 
> consistent with the VFE patch title i.e. your next patch.
> 

Sure, will drop sm8550 in the title.

>> +++ b/drivers/media/platform/qcom/camss/camss-csid-780.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * camss-csid-780.h
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 
>> Generation 3
>> + *
>> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
>> + */
>> +#ifndef QC_MSM_CAMSS_CSID_780_H
>> +#define QC_MSM_CAMSS_CSID_780_H
> 
> #ifndef __CAMSS_CSID_780_H__ or __QC_MSM_CAMSS_CSID_780_H__
> 
> Either way please encapsulate your guard __thus__
> 
> Same comment for all new headers added in this series.
> 

Thanks for the comments, I will check the other headers in this series 
and update them based on suggestion.

Thanks,
Depeng


