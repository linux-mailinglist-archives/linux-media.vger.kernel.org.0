Return-Path: <linux-media+bounces-40862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A9B33652
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E242166EFC
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3123E27FD46;
	Mon, 25 Aug 2025 06:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="APZ9DTV0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1C27A919;
	Mon, 25 Aug 2025 06:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102883; cv=none; b=ljMx992RhGOgskKRa2o8DUQqGKyLgcmBjX84LyAZmw+RBzwfmXnIVq++FuXriTp6V1WH2lkLZ/jq0swoBa2qtHGnsPG5oCDZjB2pZ3bUm6PMGXoQney2BWeAFMTcj3LBOgKLLsgc/NZXdiY79tCpM/LThExSppX9Q/PlqmfmuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102883; c=relaxed/simple;
	bh=2Nzjxxq0kf6ScHMVgpx710CyEjyHyLTqVZUMM8dcPKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ekA4WxfUSPIINgCsa2DDrW39U7zMo1Rtxupqzr5eyEFL/skjEJYGr5sqaAK3IPCyOV8fjSQUTJhAZdT+jzS0W+u8T3P5GCqRyguipP6Jg3JAZlNnKVMI/T72YHnVBfzyBpmq7nav2XseSfYcKV+pOgrCOjE3GD2f+1sfQdC8qJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=APZ9DTV0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMtRoS012485;
	Mon, 25 Aug 2025 06:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ioupIpMlbcgRqF6UmxxgXEwZ03Ow6tKH8ryTrqxUgk=; b=APZ9DTV0RuL2Wuut
	IsP3vSvTELybDTMRLjGJrVmZs7z/pSWa/sdbgr+C0n6OnMMcDjpKcLJle49H0bCR
	d8WmNDuHSMXEX9Ng+KkXC4RNpu3igjprmW0uc7CCYO5aVrW5OhQK9rZCS35HDmQw
	9JAe8vMGaUcBQYwfyXVzwPByWia6mm9A3rPyt+3eYiDDBNMtZXlo09HdB/Ll3jmc
	uDuJVJTUQW15DBVXBWTYRvvXAQn8XnPK1fVbZH5F+JCuO5rm+8ylP2G+j6EhNtGP
	MTjjj0bk3j93pxNwtOelMOPFXTjQjWbNQVgu/v/rx84WG73iCSwsyuvMz5oGQrIS
	JPmnIQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc3wfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:21:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P6L8hm007271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:21:08 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 23:20:24 -0700
Message-ID: <a6a094b4-294d-8ecb-21c9-41d4835344ae@quicinc.com>
Date: Mon, 25 Aug 2025 11:50:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 25/26] media: iris: Add support for buffer management
 ioctls for encoder device
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <20250820-iris-video-encoder-v3-25-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-25-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX/82yaH4UkBSi
 Jj4PK0sR95mnf+JNmk4BKuguGEq8sbc7Ceij+R2iBHxQLWzm0De30h2fWcf3hB2YrkFnVM2dtFV
 G3rYWscw9tdx+66FlJa3D2dTAVMsvCHZzmZqYQ0Ex1odbp7u20lCRlabNlCOv8X/s/WxErSchW+
 D9acgqOBj7E2jo+n5/M5rgoKlQ+xkkWRF9uaSaBBxQhivVlrNv7p1RkSFt92ltqS90F4yKmpJB0
 wFtDrlQ1dzpMxawza4HiR5V+C+yAARzyHjg25e2tU5JT4p3XPJ4bjrg3iW4F9N/SqkRM6pP9kYT
 YROhwIH1jPCwXTvh48rH4jaZgCj2FYxG1Bu9gnPWU0NezTP55DXC+nnoOr23w+0pxC1+p0fo2RB
 XTNgZ0uz
X-Proofpoint-ORIG-GUID: R7WYqXqTGEySW-UZOs-Bz9J6pyDHpBWo
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac00d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ffLoc1M1Ut6RQi5bcG8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: R7WYqXqTGEySW-UZOs-Bz9J6pyDHpBWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032



On 8/20/2025 2:38 PM, Dikshita Agarwal wrote:
> Implement support for queuing and dequeuing input and output buffers
> for the encoder video device using the appropriate V4L2 buffer
> management ioctls.
> 
> This enables userspace applications to manage streaming buffers
> required for encoding operations.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     | 36 +++++++++++++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  2 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 53 +++++++++++++++-------
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 37 +++++++++++++++
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    | 43 +++++++++++++-----
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 23 ++++++----
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 22 ++++++---
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  5 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 40 +---------------
>  drivers/media/platform/qcom/iris/iris_venc.c       | 26 +++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h       |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  8 ++++
>  12 files changed, 215 insertions(+), 81 deletions(-)

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

