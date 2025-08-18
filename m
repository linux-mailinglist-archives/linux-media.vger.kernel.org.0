Return-Path: <linux-media+bounces-40090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB2B29AC8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FF818A0656
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 07:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BAD27A45C;
	Mon, 18 Aug 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bKOp1Dh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5454279912;
	Mon, 18 Aug 2025 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502065; cv=none; b=MI2szCJGTazes0jaODqTxWNKFcuMRFC/UIpUmBRJeHgjuPCpg9gubguzK1MyUdEp9+FB0uXgEeY+Tlr2tgFywzDXLWKXiBRl0a+D3KFxrdmR6Da8e9/HwH4BqsKOIGcTStJtrSo4KQ5x2CbexhR4gGKMT74+0V7r4rSna1wHlho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502065; c=relaxed/simple;
	bh=/IATY42vjj/EiI2I3jfWVqaesftL+zv9sUJt/ycw4D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uzrfnALcO7Aq0vYneVtGB3oZ+jG1vaHEvy2JxjIBrlmpPlukAmJLV7u7/Z8d/pCbIEY3c6DM6TmGq2BkFL+NenBwT0hx5GLbOZLQNrPwwxxT/AoNzk/fXnUp7kgWt5b4n7U7Kh5K0B5r4lCjDfwDEpZYe9NSSMhK4EStVgmG5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bKOp1Dh5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HKdx8E019836;
	Mon, 18 Aug 2025 07:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdVVAzf36pUa69kXHC7sHDc4pa5fKd6qColFI3EWbF0=; b=bKOp1Dh5fPEV9qHv
	exLPaXuLdYHM1JUB+s2W9MOL7Li8325NJWsgFTQLHNAOvz+litELo2WgOh/YChQ1
	9S7iFrivz2bool87/taaAkX+OBKBzn0BSdrz40gtTRgWAB8U9alBF9jdFFU62iOD
	U9yrUga75EMVzZmVyZ+aO4Se7OGRUEMrBzGPIpQi1eGxOeC6WXEJO9sKr2OZPPjN
	Msrg4mSsX4+I24+VKTpJCK0LzoKMeG7gZuUojAevjm+QKst0e7NJm5Xs6we28eBC
	18HqzbNpWsDp1JJajeJKdJ2o3Y8nI8HvUh1jz8vtsx7WRj43OfJlKMALV70183mn
	rVxmhA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7urkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:27:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I7RV2L027946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:27:31 GMT
Received: from [10.216.58.185] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 00:27:27 -0700
Message-ID: <99d478f0-9f3e-b8d3-8f0f-febe871a7983@quicinc.com>
Date: Mon, 18 Aug 2025 12:57:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 19/24] media: iris: Add platform-specific capabilities
 for encoder video device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-19-c725ff673078@quicinc.com>
 <4848990e-7c57-1369-93a3-ecbed5e92f1b@quicinc.com>
 <417b17e5-0173-aa5f-cfd3-697086571314@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <417b17e5-0173-aa5f-cfd3-697086571314@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX6dAt0RzgmX4I
 Yq3OX82KWMOo1w1EksHGK2JzrPVGfF00YgVdgYP+8n7PbXnxbkw4MWgQ9Eau83aEUQNUgZYCy1P
 wN6VuQ/qpc4DDZGvJtOJqr+Xs/ATNtYWB1bGz7sEx31ovSXdR5LjesUN9EP/EUssnI0jRBu5m9K
 LYqUhiCRfAJs57NeyVniUrUnL7ZN6mOsyyjwFOL7pMvEMKSgU5nV/vhOGKHIw0EFZkOf1iVabEW
 rxWdrJfAfB7B4Z3SMDyyVYB8Tbu2Lnsg4VUZLaX4Jao28kA9dcqlmLEIcTXqaSIapB61E5TwTGl
 z7UKXMVgPcU5O8LzpsI4lZITGzh7VZGijpdReSYnXc7lJxRBqHq+xxTj7rlvLIK6p+ZXv2Ns7go
 azWCdU4X
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a2d5e4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=4oBrDv6uFTw0o7ESNfQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6IulmZfjqV2IUAVjXPBEp8TwecX9eP2z
X-Proofpoint-ORIG-GUID: 6IulmZfjqV2IUAVjXPBEp8TwecX9eP2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033


On 8/18/2025 12:55 PM, Dikshita Agarwal wrote:
>>> +	{
>>> +		.cap_id = LEVEL_HEVC,
>>> +		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>>> +		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
>>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
>>> +				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
>>> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>> Fix the default value to V4L2_MPEG_VIDEO_HEVC_LEVEL_1
> Seems like a typo, thanks for pointing out, will fix.

With that fixed,
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>


