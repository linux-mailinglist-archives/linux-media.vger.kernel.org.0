Return-Path: <linux-media+bounces-31284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB855AA07FB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B13117CB8C
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7169C2BE7BE;
	Tue, 29 Apr 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m7oh/GDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10F1FE478;
	Tue, 29 Apr 2025 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921093; cv=none; b=SS/246iZq3ppIKmj0QVYgVsRJjJ6iJNRYiCus1UlLPrql0iZk4CukiQoU+7Zh6vXPXVEVssU739DXLfUFDbY9uGbZDAj4hd/gZLp5QHtpOhSBqFeThtYAGw4YS41Kd9uPbpxroMtGCNeoaKMz8DQ86q+RCNpSMnerruopLA2fCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921093; c=relaxed/simple;
	bh=/KnQ/ehtHge0HHsf7CjOD6B6HH8yui5u1ZQOEk2B7gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aq/2rSAuVaoDKVYt49vD+DE88e/PwbfXVwRzuB/Ops0zZBY9NILdLwAY22T2PUFozDuzV20Nai/HVOcyNyGWDlzwmNY424NE/AAz0WOjhs5+bIhtKyZ/RwasMhv/Y+R+vcYFSZyxk0Hl1bBNJMBOcMPpBoovDaPhVS3XJeYzKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m7oh/GDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9x9HC023835;
	Tue, 29 Apr 2025 10:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyczv+0W3QWPhe1ugrFU6SlpMrb5cNjiGlBjoSjAgIY=; b=m7oh/GDkjV/Vjlmj
	nK3lnrCxfuWsSlCai2psenvSfxF55Q/y23i3I8oTLYYdK/lcNxfIlXeAMTJunT4w
	8543xmodPOLrF9EiJzhi5T264Li/C5ObdOzWZ6q9OZLzjvkw0I9lgRYXgjVC0he0
	WB+5kEPHZcvYtHmCtecXdlkrhR90zqtAVjzyT0zyP7d9lKNlrcG8IJ7Zu50cCv0a
	r5trPJXfPFLJuMnoX2GK/vqTvbQ7adTlWt+kL3UjmyHPSztwJiNRO8/7zX3Y2/9R
	RKLjSgEeibQvlnKNqOeLTL5gjHa04rzjHW74Mou1kPpyB0LtFHoRU+JMhyNDq/Yz
	E2cTsw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmarj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:04:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TA4kId015334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:04:46 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:04:40 -0700
Message-ID: <fb8845e4-c95d-33dc-96b4-8430464c4ba9@quicinc.com>
Date: Tue, 29 Apr 2025 15:34:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/23] media: iris: Drop port check for session
 property response
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-6-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-6-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NCBTYWx0ZWRfX+Let7w3OmpVx Qe9TGYw9SB7DZn1vhr8Pn8Cr4LtdBdG+DSkjR43BQTEQWQQTqwrnzVa1gsqesklajZ26RcKcOWe CS7HBbDilQ0R2uxUo3eJsEj6jCBxAi9m/G9eD6Cq5KjN+i+Ht0bG/a5w/jIFIv/ECOljATwkA7N
 GSBRjvl9pSrCN5lnzXRAeAjcjR1ID2MrS2tGiqDzKh+qmaI1KORqDuwtg7ht8m+IXrFOok4Cefv vKVHGQ/lG11CXaNKvbJxXyIaiR1c2QhRx257Z+FTO1vIy2mZj9WJ2HP3Hu032EuBvvDTxVguEhY rOL+dG9TRm89LGnLMDDSFasX8M2uVuweqIIOe9A4I/bNoh5SMNP/UJ73YZoxETDBlkkG2VPIqdW
 7LQzuKsuhZ/AO40spzbA406UdO4BgMES7PvUV1rq7UHJrVjXxvWhvHIvlBcz5xXCVlPZ7QfA
X-Proofpoint-GUID: DNncuDrjIzk8GtVRTPLw2RaBS6jYbfG4
X-Proofpoint-ORIG-GUID: DNncuDrjIzk8GtVRTPLw2RaBS6jYbfG4
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810a43f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WZtl5l5J05WpO7ha-Y8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=865
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290074


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Currently, port check enforces that session property response must
> arrive only on the BITSTREAM port. However, firmware can send some
> responses on other port as well.
> 
> Remove the strict port validation to correctly handle session property
> responses from the firmware.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 0eb7549da606..5bb20ec0d67f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -643,9 +643,6 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  
> -	if (pkt->port != HFI_PORT_BITSTREAM)
> -		return 0;
> -
>  	if (pkt->flags & HFI_FW_FLAGS_INFORMATION)
>  		return 0;
>  
>

Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>


