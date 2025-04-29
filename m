Return-Path: <linux-media+bounces-31295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A438EAA08A4
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E0F5A6936
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D232BF3DD;
	Tue, 29 Apr 2025 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cMQ9fbv8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EE3212D7C;
	Tue, 29 Apr 2025 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922752; cv=none; b=b1JbpU8J0dgEH6/WG/B5531kzamWbdwQ52gqpHX3vMryNFZf9lFQnq/WW8xw7K1+1GoNPz1/WRQRgeptgioBApz1CUp3pBHUoPsA89/N4KmX1z8CIJNgt/O1Ef+uhib6sHa3IpOJFR3tyH9ggbeFhs21jqTLaijspaB57ISMQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922752; c=relaxed/simple;
	bh=q+WH5pc4cqDVj5zJ4Oli+G3z8F3EnRd3vhW0L+jWhlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pivd5mgKR8xIu3ZYpl4JPyzMgnVJ496ML6PGrc23Q0Y7/Qmlm35dPNCMlGnaMelQ0nfSQYyyQqgG0eLKvwxTCC2c1yEOxI3VrKbMBKd9pJTiua64NGsYnzzzEYl1I5jPaxlZcXwQeM1ffVi24/F7/ivOVBgJdgQ1JSoKn2NFN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cMQ9fbv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAI57H011902;
	Tue, 29 Apr 2025 10:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYqda4xUjMi6wzp69EUTy9lVL72VertKeWkqtFw3FKI=; b=cMQ9fbv8T2uv45Bg
	Y6/keFT7gCK+xWRif85+YmsTFW1edGecb7GvuXPr/bu7KzS56MRYAzpu0aimgfXU
	v7F34Dto8x+rcRVnaIh5tAoKIK8bMKAocFTZebiP4INjp2bqZa1saMVh0pgBoF3T
	m/kWZ7z2Vhkkvh5MdylqeJTg2rW4TgNV9s4HUBvNSSNtlnFposVSVydNa+9LmRlZ
	agq1t5x8FtiR8Ke6814Aqt6D7HLC9se9A7ibWFG96m64XJH3sphTDHHmz8V5mLfp
	yPCABnECZbt1GOukA2Myx8xyUoZcaiID4RRnczD6LaJLVP0DlsxnGf4aR7F7oApk
	zX/oDA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q3244q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:32:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAWPTs002193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:32:25 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:32:20 -0700
Message-ID: <6ab096e5-1546-5626-2b4f-e033e98c14b9@quicinc.com>
Date: Tue, 29 Apr 2025 16:02:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 15/23] media: iris: Fix typo in depth variable
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
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-15-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-15-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810aaba cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=HByxHgxEeLxoAHTuB2AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uxdOUJ6147KUPv4MEQT9N6WO34Rne1O8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OCBTYWx0ZWRfX7tmznhaMs1oX +BY3jSPvplz6Q7tPptxSFj/5tkqRNako7Q+64DZPiTNG3Gn/2CidTf1Q3XDV/+HJmrCZ80exxMq eWPxGLoNciVMTTtq9zQso0Xhp3oS0GDN7wiWf1hZ130TzKnUFNXstFZhfnlYhqhjqe0KV9qdLqS
 TvIK8Z6f0we/WJCcU9Klcyfr702fkS4my1u7FUBubOuHZI+2TYZEHTCCTOfweewEoug4mDTbrRU ozwDwcYxN6frC5hAHJfCwYEBrusQQFlHijlT/cfplHPiA0dMIUdhL45H6ATNlt/izhd7NoxMslU DBm/bPOr/cOXezqY4hDj2YIF+crmck+J++fOCccBQeOpL2UFxqEuEcJHBD5RKRX3+0V5jx6XUd6
 tBs0aqiW0hosSBqahgjFZR5BDztxeFjLPQ5XMakPGW/sPK5plBnofrdBZxgALFWt6jFhUkWK
X-Proofpoint-ORIG-GUID: uxdOUJ6147KUPv4MEQT9N6WO34Rne1O8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290078


On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> Correct a typo from "dpeth" to "depth".
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a908b41e2868..802fa62c26eb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -178,7 +178,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
>  						  sizeof(u64));
>  }
>  
> -static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
> +static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)
>  {
>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -378,7 +378,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
>  		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
>  		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
> -		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
> +		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
>  		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
>  		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
>  		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

