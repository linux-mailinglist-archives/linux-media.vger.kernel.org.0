Return-Path: <linux-media+bounces-31277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC37AA077B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573C73B0068
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2379C2BD5BA;
	Tue, 29 Apr 2025 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bur+ahpN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49D92BD5A1;
	Tue, 29 Apr 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919358; cv=none; b=RLdQVzg5WtxVzOXW6SY6XajftcvrA4R0ZF/sjlZ/q7a0qOigc+hb05Xf1JmU0VEi5eatuBNfKL5dnC4JBq85q92hvvrhBaJ7i+1QjINbhxrV0IGkBeHOdlBPISG55iEjsomxLXFT9kJISw4Sn2AbOVjkR8ty6cbp0QK9XzOtKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919358; c=relaxed/simple;
	bh=sn1h2qPcPLFA2sXaBTxt/NcqLBuuVYZ3ozOg1Avonfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YX5ESIRUCzyiyYyGE1+VKNIgbo6zGNdvvNz+l0vonZWdrfBejxDcNbV6ejGNQkSfef0wbpDpGBdSz547pEN5pt6DKeAvGBOI+CxIseFHi08AxhUDI/K7LS+ucl7hBOhG13F2jaiuWx4pcnudfZTEojSJ5G4HTIJDsEYIMddRYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bur+ahpN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq2RQ012445;
	Tue, 29 Apr 2025 09:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9IaT7F7qdLnuVXkG89KMPqimQVkjBAEgraP45eTJrmc=; b=Bur+ahpNXnx0J0S4
	pzWIDwFc470K4r67iPA41jNjOZgXM4PbJaBArrUc2z55F6k9yGFEWffwjF3dxSaP
	b93gdKKhYg2OGX8xh5C1F9/tEgjwgMcwQgFe33s0Ec3+aBtrVWGElyQqxqNWJS7+
	LT9+QhRONbZwGC4RnQclbwF7kQjdCTgBZIvlMlEFEqO86uNHPOt2BDsoE0XK8mcw
	sArJpskwUluNkb2U9LK9GMhQIQo0i4Bh1GUrfst5lwXRpPd3uTvgPJjRFnnfxQO4
	Se/HRn8ZsKpWla0gaN3hRVVtpQdjvuvuPKhD4d063ll9LBd0s+1XQ4qKvTSI2Jit
	Y7Jr5A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn2x4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:35:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T9ZpOa011176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 09:35:52 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 02:35:45 -0700
Message-ID: <c2ee94fa-a440-0b61-514f-a5590bee5e66@quicinc.com>
Date: Tue, 29 Apr 2025 15:05:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 03/23] media: iris: Add handling for corrupt and drop
 frames
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
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-3-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-3-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zHFW06OKxc0qgvEOUz2Rv6Fep_fwicvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3MSBTYWx0ZWRfX6g4Oju1p/V4W +4OUuwnkrPYjPogEdRxwSOkIOm48CnaE846MGrLKe0WBRLlFLHrk5/Z75WKFI+zT0kB1WNlwly5 cPQ3Ii/CW+gVWVmdfSbh1MO58LTWYrLNcDHTy8q2+cg7NemBO6ja/NKew8AIe9/FJ51v9+Qm1r1
 /P6bO8FlJ9y0pJZHQCRDJn37veR4rvlTP5D9fsoqY5YaEtj7r+ScwQ3vLncZmPrifXdGg7x/x6r 2FTSW+4ptZGrCQnfNA+Krw0+RkURjGnCn7cR9goEWF4Lo22fuH5ImTNF6DIZ8Irg7iXAWAJRVuj tHPSgd3/Mk4arf2omJ+VIDeYCzADjjB+fjz/KpvR7d1o9S8owMCuL2f8IXd8HYT5NJ+Ymox22gr
 efsO1mLQgleemU7wp1Xdq4SJ9eO/kl8axXyKQTmKfyMH+zJX7FpgvFj4NsTtd0zdwcqZZ66F
X-Proofpoint-GUID: zHFW06OKxc0qgvEOUz2Rv6Fep_fwicvp
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68109d78 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=1rPC81ydLq6XjGq1_2YA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290071


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Firmware attach DATACORRUPT/DROP buffer flags for the frames which
> needs to be dropped, handle it by setting VB2_BUF_STATE_ERROR for these
> buffers before calling buf_done.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c            | 11 ++++++++---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h  |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  6 ++++++
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 606d76b10be2..3691b68ea294 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -628,10 +628,13 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  
>  	vb2 = &vbuf->vb2_buf;
>  
> -	if (buf->flags & V4L2_BUF_FLAG_ERROR)
> +	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
> -	else
> -		state = VB2_BUF_STATE_DONE;
> +		vb2_set_plane_payload(vb2, 0, 0);
> +		vb2->timestamp = 0;
> +		v4l2_m2m_buf_done(vbuf, state);
> +		return 0;
> +	}
>  
>  	vbuf->flags |= buf->flags;
>  
> @@ -651,6 +654,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>  			v4l2_m2m_mark_stopped(m2m_ctx);
>  		}
>  	}
> +
> +	state = VB2_BUF_STATE_DONE;
>  	vb2->timestamp = buf->timestamp;
>  	v4l2_m2m_buf_done(vbuf, state);
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 9f246816a286..93b5f838c290 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -117,6 +117,8 @@
>  #define HFI_FRAME_NOTCODED				0x7f002000
>  #define HFI_FRAME_YUV					0x7f004000
>  #define HFI_UNUSED_PICT					0x10000000
> +#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
> +#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
>  
>  struct hfi_pkt_hdr {
>  	u32 size;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index b72d503dd740..91d95eed68aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -481,6 +481,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>  	buf->attr |= BUF_ATTR_DEQUEUED;
>  	buf->attr |= BUF_ATTR_BUFFER_DONE;
>  
> +	if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
> +		flags |= V4L2_BUF_FLAG_ERROR;
> +
> +	if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME)
> +		flags |= V4L2_BUF_FLAG_ERROR;
> +
>  	buf->flags |= flags;
>  
>  	iris_vb2_buffer_done(inst, buf);
> 
>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>


