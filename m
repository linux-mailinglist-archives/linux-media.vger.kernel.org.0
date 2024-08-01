Return-Path: <linux-media+bounces-15711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 053CB944D74
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 15:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B529E282FE5
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 13:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9F71A3BD0;
	Thu,  1 Aug 2024 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQRdj0iE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B471A0B12;
	Thu,  1 Aug 2024 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520213; cv=none; b=Hdq5C+YdRZvUTM4D9sMg2ymDW94d2b0oaT9KsoZYP8h47sbkZDBuFmUxPMbH6bMYMkSr/lYdEomPMbIPTgNGUtiX3VYyMEXYtzNktjO3M8o6d5J81n3U8jf94xvF81txJQS9Ru8k8liiulwOdFe7Tl7UNzzMSicFX6mZ0kkXU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520213; c=relaxed/simple;
	bh=GU2BK1Osx2h7ZX3FdZmKNmBKpzFpvfjwuZFjKzmtYVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l41ePb2qCwr+zJCtUNGLggT7aB9OeGP+mNAY5fhnVsKynN9l3e2Y59JySKi5mCEFfMOFoQ5LQnGe6xqUif8ON0q5U/iW7JDXWvF7FHbalbYxvEJjxJWJZSp1k6DznwjQoEp5FrTQ7Yr8zizoRbydnMEmeVtbNkOsxY1Y1yqaXfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQRdj0iE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471Dajkb002943;
	Thu, 1 Aug 2024 13:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q62foi3wU07IYfI4RWy0BJazZFzOxzyxolw1Zsbm3eQ=; b=TQRdj0iE5P2B3xCT
	vKOz6MCF2XGcq4TjyvzH5Uv8KfBbR5lcp6CzExQuKQ16Y/Xe7+gIfI5PkZT8voab
	6T27rWXLQUVaaySnR275VwDkMPmbW66Sa8REP4kJ2rNph1Ia1B455r0+wia4Tc9/
	KtuAD4Sxe+95VPqrkMV/8M1kDX713dAh2TjWPXOm192Kh5UTY6xbSbcDs/E96jGH
	N6jiFCy+diOGQf5zrlxqP1CUXWcX/Y15o/Qpp6iQce0WrRlwu4ZNQe+KvfjHcUh0
	iYzCuYc1TuorXjoffMZDaBfLcMhh+62CAUwCqh6eXYjNRjatVWivt+2mGwLzDtAI
	rf4nRQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms43f4cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 13:50:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471Do2ak028461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 13:50:02 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 06:49:56 -0700
Message-ID: <b2aa9801-dbee-4ddb-99e7-4d058ce92aa1@quicinc.com>
Date: Thu, 1 Aug 2024 21:49:54 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <3011c561-d39e-4ce5-a544-33f24ca7a67c@quicinc.com>
 <bd6f3613-5a96-438a-a2df-cb2728e30c29@linaro.org>
 <30d56910-df7b-4459-b557-effc21ffa132@quicinc.com>
 <ff128062-5c1f-4abe-8582-543063d5e526@linaro.org>
 <4cd4ff3a-5d90-4a5d-aae1-6017199e00c3@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <4cd4ff3a-5d90-4a5d-aae1-6017199e00c3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XCql-r4h7u-xxAJ3aHnNn6Cxcts62swP
X-Proofpoint-ORIG-GUID: XCql-r4h7u-xxAJ3aHnNn6Cxcts62swP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_12,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=843 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010088

Hi Bryan,

On 8/1/2024 7:14 PM, Bryan O'Donoghue wrote:
> On 01/08/2024 11:59, Bryan O'Donoghue wrote:
>> for preference every single patch applies and builds warning free.
> 
> Oops mistyped
> 
> - Every patch must apply cleanly
> - You could make an argument for some specific cases that
>    a patch can generate a warning provided
> - By the end of your set everything must be warning free
> 
> In this case though, I don't believe you need to make that case since, 
> the problem you describe about probe() isn't a problem at all as you 
> have no upstream dts that can drive the probe() at this point.
> 
> Just do the dts at the end and no problem.
> 

Thanks for the confirmation, maybe also can add a checking for the res, 
probe returns fail if the .data->xxx_res is NULL.


Thanks,
Depeng

