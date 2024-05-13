Return-Path: <linux-media+bounces-11397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2F8C3E6F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 11:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9F01C2125F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 09:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0055014A088;
	Mon, 13 May 2024 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BZEgnYu5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E98219E7;
	Mon, 13 May 2024 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594148; cv=none; b=lrHFZIgufqKfWR2KV4XQPIstkH6zQAKaf8wI7+xKrr0DRHJTtUMsjbuB7kQa324vCbMxsLK5c+O3o5ezfkt2cTstDWQzMsqdH1/F0EK+Gvf1UQ/WnO4RfMoJDVHUCLsO9w5NVRUJbcQAzOdsz6JwqFk5TzihMB7R754mmO+AKKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594148; c=relaxed/simple;
	bh=zlS6twK/Dl58Vu5VAcua0fVTm5IGTx2anPsS2Dxpav8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b8YFq0xI2X8GD3xyGT2xvjGlXU9EZ30h8PaNFmZ74vVWnd43b+7IHGUVmqN8eDnuOzYZ8xQ3CQRENhO1SJ+AnkYKcjEBig+VN50/amzbzIhuSwynWcxyPir9Ab1VcjemrWl5V3LW+zzJF8UCt1iUnoqH0IicPuErjfcpujDnFq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BZEgnYu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D09G2Y009113;
	Mon, 13 May 2024 09:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=U2WX32G1rFMx1/6IKHQPtO9xARAWs9tEx1dIHWNfp54=; b=BZ
	EgnYu5wtaG+ih6mDQcRwFZhDHCE9+LkSMr3+nTrbXFa4NvsrFnVjBWAZ35r4h6oG
	AG4DST5a9SlFXfMX3zKzH7EmRSOiwzHghXcvh6MNU1xB1zrPFv38wDrnvQi7aPSJ
	cstuFft/oi588KH2OIxNbRlLgxRZgo7cQeuIWYv6G1EOSEsPjntaHv5zht8f8oro
	FP9oaZ1DimdBPPswATAkd7n1sXazrXXaDGYf4KyXMvgCuIiNJBgBuzU7S91/YuII
	9441WGzOLmt94jPBR6Rb0e6ODeZF5XdrU0hHt8TOu2L4nWxAcPuiq28WjjhCDQn2
	7exiyiePrMXKVeAeIVpA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125b3p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:55:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44D9tcpU015241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:55:38 GMT
Received: from [10.251.44.40] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 02:55:35 -0700
Message-ID: <96a1e5a8-b887-4bb6-b79a-a4d4549c1415@quicinc.com>
Date: Mon, 13 May 2024 12:55:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: Add per sub-device type
 resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>,
        <matti.lehtimaki@gmail.com>
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-2-quic_grosikop@quicinc.com>
 <f9afdda4-0921-4632-8e4a-e8157b685da1@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <f9afdda4-0921-4632-8e4a-e8157b685da1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mHPZmh5kXH2r6ID9jrhHU0_gdQtT8OJG
X-Proofpoint-ORIG-GUID: mHPZmh5kXH2r6ID9jrhHU0_gdQtT8OJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=878 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130061



On 5/11/2024 1:18 AM, Bryan O'Donoghue wrote:
> On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:
>> +        .type = CAMSS_SUBDEV_TYPE_CSIPHY,
> 
> As Matti pointed out to me on IRC, the .type value here isn't populated
> in the rest of the 8280xp resources.
> 
> I completely missed that but, then again this appears to be a dead field
> in this series so it makes no difference if it is populated.
> 
> I realise it is probably of use in code you _haven't_ yet published but,
> for now I think we should drop this field, since its dead code.

Yes that is correct i miss that as well.

> 
> I'll send a fixup patch for this, I don't think there's a need for you
> to send the whole series again.

Thank you for this.

~Gjorgji

> 
> ---
> bod

