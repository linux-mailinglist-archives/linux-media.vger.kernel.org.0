Return-Path: <linux-media+bounces-32201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B2AB21AD
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 09:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB2C4A465A
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 07:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD851E835B;
	Sat, 10 May 2025 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KERH6vmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502E2747B;
	Sat, 10 May 2025 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746861957; cv=none; b=P+okNdlLYqHaERBrwz48ONMWlyB9NuR3ytlupMrl57Rqh5gM/wK5AA7NEkMArn0tJ3clpeE4hPUc4+oBvENvyzXaCTMb5UXKdoJTjZ/oYG79QHLCRWx6viB86RWJU+LWaK4vzmAZeS1Dgk97I5myCQn/M7g3b5AYCnG4iMGhl3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746861957; c=relaxed/simple;
	bh=LKQuDg71kuc86yeHdsMwQmlJfEnl+jVcYcFCHZUJGNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GzhGPMITCO/J659iNBSndDww7uuesUK9/ZYI3pBLiB1YUX9m92EUBJQCOR/kl6x5QJn6Boat3DQ2obDFFjHoheGLULU62fl2X5OI6wtNADrqI6ETIMOJWHbiCzZd72dIi1BpG2yuVoQPb4rW5T7QYovJnbagyVDERYcSfaduaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KERH6vmo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54A7Gkxj024974;
	Sat, 10 May 2025 07:25:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcYqoQI9erN/w1hZyVlXxbtVQPPAA2u3o/mXslFUsLA=; b=KERH6vmoe+b5nFb/
	nPAuO3eoFuySiY6XRz55rRLHRJtGCt6mNRKXmDk/PiJs1bWTlSx0CNbWO9hnRVlr
	d59zS0F7ekkTeDfSdCOzm5RqKlBwqmF+fMJ/fccxPk88AmSpO818M0ubywGofh8A
	+X2SBEZN7XpWWCjpFMn4+nKR9yx0fx5X+nPuctc4tegE07pyKF8Hfx8n1tUQ0+hf
	Txhvj5+JjPdjInKgQ4t1rF5IYNK6MV4XNxhrG2In5yvopctCSZZZ2+432EvOLZTm
	6BmKNujM4KSQxpjE+WcAv88EO6QsiVmZvhY8woFOebd4XPoFVuUWcoObpVwmbLn0
	YI/2fg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46j03b85m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:25:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54A7PZxl004605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 10 May 2025 07:25:35 GMT
Received: from [10.204.73.14] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 10 May
 2025 00:25:30 -0700
Message-ID: <6449b4ed-4ae6-453d-a717-8b0771ecb475@quicinc.com>
Date: Sat, 10 May 2025 12:55:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 5/9] media: qcom: camss: Add sa8775p compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Suresh Vankadara <quic_svankada@quicinc.com>
In-Reply-To: <20250427070135.884623-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 55a1xE1HaKYhcbz2PAI7jSgNUoWpaMT7
X-Authority-Analysis: v=2.4 cv=DOuP4zNb c=1 sm=1 tr=0 ts=681eff70 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=XdGAH4ZiSAM6yD7sjqcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 55a1xE1HaKYhcbz2PAI7jSgNUoWpaMT7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDA3MiBTYWx0ZWRfXzyrQ3ieUETXZ
 ze01T8G0Vw7w/6q8/RivkFy6f+J0qZauGqmUWNRiirBLxJh4+3oJZhBkyxNEo4bDuMTs9vlZ8sG
 jiYQDVy6mGdhJDBctZFONHwlSLJO9Mn5bP/hmPimIAs685PAJiQiKmONSF32E+oRqyqTyb7J9Gi
 Wmkk6s01ZMx5xDFfhC7xZAoLhTTkPJQPobRNQ5Noat0AgAcxwTRU/jpVs07Lkec0ulH7S+bn3tb
 Wc7Q8a6RcVWbsdUO0Im/Dq7nfY8TUuh3oibk53CVRWMuwENYkLJp2KjbCk8v/RJcOtSIxWOWpA0
 hyZ+CaQyEvFywuV7oNnnJMd4C4FcjvEYDj73QsRi/OwjiMUv4yAFWCCpG/ejq0UaAMuOvLDbDDB
 ApSF63xCRtYrkNmgjjK3igww1NApzeWH1Qp10sFVPhoRA1DJ0VWv+o0q8nBoY4pbOXDwvhDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505100072



On 4/27/2025 12:31 PM, Vikram Sharma wrote:
> Add CAMSS_8775P enum, SA8775P compatible and sa8775p camss driver
> private data, the private data just include some basic information
> now, later changes will enumerate with csiphy, tpg, csid and vfe
> resources.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 23 +++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 467f7ff4b042..9e0e1bf855bd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2483,6 +2483,19 @@ static const struct resources_icc icc_res_sm8550[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sa8775p[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_0",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
Recheck these values

> @@ -3865,6 +3887,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
Address compatible string based on DTS comment

Regards,
Suresh Vankadara.


