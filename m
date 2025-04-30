Return-Path: <linux-media+bounces-31430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1CAA48F6
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403BD98009E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96EC23C368;
	Wed, 30 Apr 2025 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CX+nrV5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8A246774;
	Wed, 30 Apr 2025 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009359; cv=none; b=lb5XnGPP6MkBKErhnCr6GSDhYpz05uPe0XpFikHgqWAwzm7w6YH9vDOu1X3dwZGvkwrzvJcz1modhPzLHHzlUfnDAyGFMxvGPsMe5m08qOhOLRrCw1yadJaMJsCH2T4sSDT6W8gBU5Ww30ZGeAitITzy5CVxQR1m7+qIACRa1FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009359; c=relaxed/simple;
	bh=87orribIQT06VVPrFXntCTcYFJnaJnhl79Ls2IghEaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SptRm752EGsX+Zih1Lw6rJEFUcu1X9ueBhF6s+orbbBt27sHNue80CPEXs7dJ2mlhj4enVdsaYY1HwkUirRjaGE2vfrRgg3pJNTNypBd5Kd7/dlWBHxeSJo1Wm/LezouC6xaZZzaf0/At049YwWZFoRUtKtgf0cweY13T/pMkPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CX+nrV5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9KYqp003295;
	Wed, 30 Apr 2025 10:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQTYxiPbPzzg4AJCoL67j/BVhUArLog9x3AUPofvRC4=; b=CX+nrV5M0l3TKncp
	g88NsNQM36V9IpJ6YnIRIR1tV48CL1vtkdUDAjW+3y5S+i5daHK+QOqWRrtcyHib
	Z6TTyW8GO0Q6mz2IT3706N12My94w3C3spPa4PTz+dVIQ4q8aEHBZ3vo4pXWtC4U
	WzBxVg/6Y8tn3QNQGhe8uNf5fiY8mb9YequMF5CAepK5c6lPB7qXbR9UYqBZh/Gs
	H4FbRjCUszhMDxxjTc1Es5j8uKunonXwF+hIFc9NuHGempHoIEoYkQH7n5BR0LMG
	hadGkTJjpY1XEn4vujZTFTX10fg/y7n91YVYYeba8JUiEBDzorlw6Gs1O7CgORE3
	KNB3pg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u89sfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:35:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UAZmnm029217
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:35:48 GMT
Received: from [10.50.41.127] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 03:35:40 -0700
Message-ID: <26621fa7-d5b6-3f9c-8bac-7b1657ebfa1d@quicinc.com>
Date: Wed, 30 Apr 2025 16:05:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 23/23] media: iris: Add codec specific check for VP9
 decoder drain handling
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
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-23-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-23-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6811fd07 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=lzZTJudIQaIjGSla84IA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iVYqPMhnb_hh8IonOX7LOB34z_Da9hCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfX28CpWwqUUmrA VtknYxpkeoIwvH/aGdRQDrrS2T9N+WB3p6UcEK/UrTmuC67CXj4d5rTKRhw+mUYyMvcmzvSp9tT Ee1iM8uZkkfOZOrZ8nQ18xChjoYQWyvPFnWggg4JizGQjilmW9RG8n80K1j0+Bnr6t1DSAnV50H
 +6ViQ/hlI44E6VHcbokPW8VAWqh3uA4FF4uQuA5UrRe45rGuMZHh7C9YG0An3MzkPJ4KW/C8Ny8 Qc2MACJEeH6lIdBqT6XrY/iKCao9ALHQ+wM99vHAtishy44mNuOZ5+i4nRYnHL1VrCCMUHGyDiI /glMHGyN8AcLNfnovkALDXwKwbgs8A+4gBpDW3f0FrHScvAIDTitkeUunWtDWdXYwKC2x/4amiL
 JjC3r7Fxu4RQ+KP7TuiJQ5JRMe72ojHlcpria2ziCUZq7H7MbauJE1nblVddhDkTEJneUxFJ
X-Proofpoint-ORIG-GUID: iVYqPMhnb_hh8IonOX7LOB34z_Da9hCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075


On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> Add a codec specific for the VP9 decoder to ensure that a non-null
> buffer is sent to the firmware during drain. The firmware enforces a
> check for VP9 decoder that the number of buffers queued and dequeued on
> the output plane should match. When a null buffer is sent, the firmware
> does not return a response for it, leading to a count mismatch and an
> assertion failure from the firmware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  | 2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 837643741dc3..bc63189fc43c 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -401,6 +401,8 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
>  	ip_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_EMPTY_BUFFER;
>  	ip_pkt.shdr.session_id = inst->session_id;
>  	ip_pkt.flags = HFI_BUFFERFLAG_EOS;
> +	if (inst->codec == V4L2_PIX_FMT_VP9)
> +		ip_pkt.packet_buffer = 0xdeadb000;
>  
>  	return iris_hfi_queue_cmd_write(inst->core, &ip_pkt, ip_pkt.shdr.hdr.size);
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 01338baf3788..d39226efb3d9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -349,6 +349,10 @@ static void iris_hfi_gen1_session_etb_done(struct iris_inst *inst, void *packet)
>  	struct iris_buffer *buf = NULL;
>  	bool found = false;
>  
> +	/* EOS buffer sent via drain won't be in v4l2 buffer list */
> +	if (pkt->packet_buffer == 0xdeadb000)
> +		return;
> +
>  	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, m2m_buffer, n) {
>  		buf = to_iris_buffer(&m2m_buffer->vb);
>  		if (buf->index == pkt->input_tag) {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

