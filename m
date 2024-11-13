Return-Path: <linux-media+bounces-21346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F5C9C688A
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF7931F23E90
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BD7175D54;
	Wed, 13 Nov 2024 05:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CzJzVhMH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DA15B96E;
	Wed, 13 Nov 2024 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731474928; cv=none; b=TCvxbt4AoiZFnXx/2pBJ0cVWm5fSdtD0ILlzt6I5PnCTXBKggQouovk4iRKBLhFUFN4xwSWW1M4eSyax5cNDp77dE7+1gx9Gus4gfGPvkZSCAq9igB0DcIs0uzOIVmHSZcGVtQWaWawrKy+BGIJZMduK4OeKuuVyalM5ZxsDK14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731474928; c=relaxed/simple;
	bh=HrAP29M4Rx+j5Zod87VFn++vV3j7AelyQeIYTj+iV78=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PwQlyMm/ehpOyC1EOYWH7SCl+d1EGYba+uXLq2hgKjSaq6pq4vAEUiKex0XU6VdfYVAxX77MqhlMAiT6dJLhOKf64j+aS67lGkr1KI0bm/bq2q0C6oVhgqU1aPEonchJPpz7s+Fvp31ESiCMMBt/cIlquP/EGDGWNFzjDO89m/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CzJzVhMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRQBW015377;
	Wed, 13 Nov 2024 05:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmRIIVgg6zNjGIrlNQb47VE1S5ZS4Pf3WVggwBNYdpw=; b=CzJzVhMHVTZfErd7
	bvooStAOzroP1azlWDHUT7QoqJ7p/d4nbdHflX8HA/C19jdLKy/EtN/lVLeNfOPM
	743POaVPy+jc5ibRigNHNTCNDTVHmfW+vhvzqAKgyYIfHWqIKZbfmVHo2xfBi9Rz
	ggay7W1M3dmh8J5/jFWDUKikG24yt8n4mnz1VoTFukQMnyQ2A9S4mjH/0Il++Up1
	/onm3M2lHFSfweQq+gwPZNaPuoHl7AOdk64SlRbslAG58Kua+zW3lSVotL8otyqe
	MbdnaKBhfEkHJK7MybkWpqq8kwtwAY7Am2jWWzErRggJJ7N3UWu4965bmynhTBt6
	54fB+Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1189mfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:15:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5FGuP012062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:15:16 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 21:15:10 -0800
Message-ID: <11191c49-3a05-e97c-0d17-592074f5acff@quicinc.com>
Date: Wed, 13 Nov 2024 10:45:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 03/28] media: iris: implement iris v4l2 file ops
Content-Language: en-US
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-3-a88e7c220f78@quicinc.com>
 <841a9469-4fa1-443f-88a6-bfbe11b74487@nexus-software.ie>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <841a9469-4fa1-443f-88a6-bfbe11b74487@nexus-software.ie>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ToRnGY8tBdK0HdbcQ9q0rjltLEWWaNpF
X-Proofpoint-GUID: ToRnGY8tBdK0HdbcQ9q0rjltLEWWaNpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=903 lowpriorityscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130045



On 11/10/2024 8:40 AM, Bryan O'Donoghue wrote:
> On 05/11/2024 06:55, Dikshita Agarwal wrote:
>> Implement open, close and poll ops.
>>
>> Open:
>> Configure the vb2 queue and v4l2 file handler. Allocate a video instance
>> and add the instance to core instance list.
>>
>> Close:
>> Free the instance and remove it from core instance list.
> 
> Its a bit odd that you describe the purpose of open and close but not poll,
> despite listing poll along with open and close at the very top.
> 
> Consider adding that text if you do a next version.
> 
We didn't describe the poll since we are making use of m2m API for that.
but sure can describe that as well.

Thanks,
Dikshita
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

