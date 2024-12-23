Return-Path: <linux-media+bounces-24000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99B9FAD51
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 11:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A695D165208
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 10:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554B81990D9;
	Mon, 23 Dec 2024 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YJg+orrc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D44D2F3E;
	Mon, 23 Dec 2024 10:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951099; cv=none; b=TFi67FjwPL3bwLHAuBNG2ezqCQQFszBkvmnMqwN/ywJii4KpegwOhteY0b4k5CQjixu5uaBJJt02V0YJ7nfDnJSYuVoh6odEMMQQypbfmI0Gl3U1SBqV1tjvpVotAXOttcCzvzflpC7vOhcpBP9FEKv3cAqrMKPMJhSg0Wb/6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951099; c=relaxed/simple;
	bh=vv9GwG31POwb4Yb+novqBImc8zJ0SgsppYU7WVIYwJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T5qg50Zf7L43Ug3nJn92DNDPXc7JgV6NdW1QrrX5cP0jurId3mcNXVm08GY6Cn0EqXXTNPk8cyyp/K8dvqDO2hu46fvZ1at+UilKJGvc2LWsiGGYHVAM4A+E2CY6w2tDKjFakpvAF0HKBqEq0L9eszfxLtxsm92UOELPckkCA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YJg+orrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9mWAw030705;
	Mon, 23 Dec 2024 10:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fUF7KFTf/MbMt69U07OK62K821Z6oeF2rbAlZvXL38M=; b=YJg+orrcRiSNNtXX
	AnkdDNyuVY4vV6qGMk2fanAUYkey7LUKdgK8o+UhJwqHV7cXZA5T6xU6zCXTBMht
	erEiYv2rDfILYDN9BXraNdMP3zy35SxHvj0bLud8GDB+UhI7wrX/SlGAJ1Ihyygc
	WZgtgcXoRkSyhXHPr5FDCdCx8M6lSMCGMcnfw3SeODz9nS0gW/Mv0N7Z/VYJOHvv
	AJrdJoWR/4zUw2h84pLzCdPgVQB+fUpbqlntJ0KFaUUF5zDu6916+8TtJ1/21Jww
	AaghchmsIsHF//n91cu4YHvW+QABeQCb9/3avFh5QaU4a1GA5hsp+9g+16yAiRR3
	Uxbmcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q5jb83u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:51:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNApQM2026819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:51:26 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 02:51:20 -0800
Message-ID: <fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
Date: Mon, 23 Dec 2024 16:21:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@baylibre.com>,
        Jianhua Lu
	<lujianhua000@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <20241223113027.21b8f7ab@foz.lan>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241223113027.21b8f7ab@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CSVqK3WarqYrUAVGQTFsMKrQ50VNpSyq
X-Proofpoint-ORIG-GUID: CSVqK3WarqYrUAVGQTFsMKrQ50VNpSyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412230097



On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 12 Dec 2024 17:21:49 +0530
> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
> 
>> +	.dma_mask = GENMASK(31, 29) - 1,
> 
> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
> I so, why?
> 
Hi Mauro,

the value of this dma mask should be 0xe0000000 -1.

The background for the same is, 0xe0000000 onward memory space is allocated
for IO register space so we are restricting the driver buffer allocations
to 0xe0000000 - 1.

Based on the comments received in the past, we are using GENMASK to
generate 0xe0000000.

Does this answer your query or I missed something?

Thanks,
Dikshita
> Thanks,
> Mauro

