Return-Path: <linux-media+bounces-32028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6599AAF7C8
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 12:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EAEF4A7BA9
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0898220B20A;
	Thu,  8 May 2025 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hvp6QKAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8C72624;
	Thu,  8 May 2025 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700180; cv=none; b=JH83zt2CxSC/kpHyVKngC3tM4jyUOHsEqsgPuag7ZzesBKRpD/Wsl8JDZ6e9B/Q8uyo+3A2CWW6jYcj99E4YbCMRH2QVaOpf1/08ktdgQ+/+70LUtoXL61/wgcYT86BiOfei9bKcUgdG1r1uEYW/ORvNgEe4sRt7zMOb9OBvhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700180; c=relaxed/simple;
	bh=ynzMWyr7CUPGsOazB08B2sRH/j4SaJ/4sJFsWZACEV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Imckupd/4sv6hoUVAVdG63aoT/V2ApAJgQvPwfCBmJfcEy3MIiVIlGWYUhD4mhyDPn1e5Vj+G8damYQD/K1rkjGOasgd8rfGCRyGd3lB6EJulG1POH3fJVC38lx4nFdOY/3s6yIg6LCKw7sUSXFe64QJ/2iHYJbv+bSXJz+pHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hvp6QKAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484Ww5a010511;
	Thu, 8 May 2025 10:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZkAyi00mUO+H41edn12peQ24aQRe1j1jRQdlGEqsdo=; b=hvp6QKAJYekID9gP
	mPUgxNx9fk2pzVKcIzzCfZXdHJrjS2sUSkdKw33190gCjrjqUjobLvc67O7YUu2t
	SxI78QjXgOf+291RX1XvN7+GbN7Qr27cDGSIbrlVXpuBV89pjUgRmx8UkNLQz20l
	EEkwjrpdjEmFGKcYjJ2NxsIZXlu4h+mde3jEm9huE8M6iXWhNxlH2lv21kWzDF8D
	YoOyKeK+4joBNbv/mGgnEOGGtAi01uHrccUulBxwnF2cJzchIyrKjgIUsl/vjbeS
	Zddvv9h+FgGgzrsPDXD5H6kKiPubFdkRSdHtabp7LaaCmgZRLIBwWlhLUjt19wvP
	u0q7CA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7906c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 10:29:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548ATX37030529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 10:29:33 GMT
Received: from [10.50.36.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 03:29:28 -0700
Message-ID: <38cea95a-aeac-c20d-8175-7a521d917021@quicinc.com>
Date: Thu, 8 May 2025 15:59:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/25] media: iris: Skip destroying internal buffer if
 not dequeued
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, <stable@vger.kernel.org>
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-1-58db3660ac61@quicinc.com>
 <dae06ff6-afd9-46a4-bd37-25bb367ba545@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <dae06ff6-afd9-46a4-bd37-25bb367ba545@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MiBTYWx0ZWRfX4EuHaSdZnmDr
 Rz9mk7+zW0jJ33fSMec4wAB8dhmHtAJQByyiwr/Az8gSy+eqa+firrBtAyOU+XAt796+WDs/1ww
 8nnw3WamI5NOacsEJF3rbYUd58v+GEjJWToEh5elDnN8kXXpfZJX2/xLb54BlOlpLcHeeTCKXpH
 ZGzjvEpJDCJ+QZsdAWtAnz9sb/YMgfh+9/2vtW4vgJnP5KqlVWKZ+iGoDYdpOCLd4Kdn93jx4yQ
 9V6wPhXSc+VQMFDk5czo9lMtlsH/UFxGdJH+i/GLgpWhtYd2Aizk1XMKnvcPDuNtuq/alqojtRP
 Fm96ZKQCfLHRacpRBDfg4fTYlOTj9qjC4B/UA9RGvnLZ+D8BzPpDRXa9VUm3YEzmRlsyIWeMGMo
 sIggIQUnJzFn4ix+LpGHZXJ/xsKwWKk/gCSeqTqpC2GF2ejkx5uSkdE9C1LpX4PISo8F6jHH
X-Proofpoint-GUID: dsieQJ_yOkfrLQrWmbK3o70ZZOrReyk4
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681c878d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=UasdmLrgvsVJUMVfHicA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dsieQJ_yOkfrLQrWmbK3o70ZZOrReyk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=934 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080092



On 5/7/2025 8:37 PM, Bryan O'Donoghue wrote:
> On 07/05/2025 08:39, Dikshita Agarwal wrote:
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>> Also, make sure that all buffers are released during streamoff.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue
>> internal buffers")
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> I'll take your word for it on firmware respecting the software contract on
> close() wrt to DMA - however I think you should split this patch into two
> separate patches along the lines of the "also" in your commit log.
> 
> 1. Skip destroying buffers for QUEUED flag
> 2. Make sure all buffers are released during stream off
> 
> These are two separate fixes IMO.
Sure will split.

Please let me know if you have any other comments
if no comments, will send v5 with addressing above.

Thanks,
Dikshita
> 
> ---
> bod

