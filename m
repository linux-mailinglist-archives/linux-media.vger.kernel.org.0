Return-Path: <linux-media+bounces-40861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F2B33642
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE7C3BC142
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9AA248869;
	Mon, 25 Aug 2025 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ikrPabOi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2F211F;
	Mon, 25 Aug 2025 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102533; cv=none; b=ZZLJvaZdB6nuxQoGDkWskqgKq3mk7BIQt6o/BDEJUB8m4UyfnEl0ZffqMRNuP0Ie7v46in/DImbsCvX8T0MlntWlsW3cmchiR7FBXPN8sY+j1v2BaEZcpFCgruWZRalLqYcI7xT7duKU8n6wgzySCkKJwYKtiY9Vy+FcnkfZbGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102533; c=relaxed/simple;
	bh=ZFdOq8jaUBF8ehRspgRjkg65SmNqPvtfM+J9qqTF0iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jpzJqAzAIMos9foUeEb1n7Vs+r4dYP2qA4tWOASRHu+Q9ORIUSDSLonmKxoGyjGsjQAehvfHl8Rr3Vrw3dn72/r1ZAZmhr3wKwNhbTV9SH7fx3rgqzPThAvlIQOnncml1M0HJmfAvdwUoJXSVVe7KWFvh8bh2O51NJwVshP/QxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ikrPabOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ON0JPT021029;
	Mon, 25 Aug 2025 06:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnJUKtQKZBh/ujXeIEdyqrNRJM09ab+nFXOGW5re+4M=; b=ikrPabOisv9k3R9I
	RZQwdooujli9hEpbd8K6qB9x77m7/hfVFOTh7iEphOQ7UL8Tm+SZeC1Y6ppoL3kC
	NafsTpU47amYsXSt0Kk0wLlABYvLmSUA2tuxY0SHqeB6j5mPN+N2HH3VillmT7jE
	aRuX6yoPZCCl7Cagn25MMm/R3EHMfJ+U7Z5p9grlwZ94NrtNdNzruIc2vK2yuVDv
	uad/HPgp6L3jSS0W64qVaW13o0gGxSwyydgvzmPWyUXFLfDxOUpNuxuLwawb7ZFd
	ShqKh/pYJZHQChV4YGertZTFt/5JHsosfA8Pvyw3fN2gUxzzL6oxznpUyG88QkRK
	WzndYw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x83xhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:15:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P6FQUt022882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:15:26 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 23:15:22 -0700
Message-ID: <1f4207b4-0eb3-e61a-5c00-7410a533de1f@quicinc.com>
Date: Mon, 25 Aug 2025 11:45:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 24/26] media: iris: Allocate and queue internal buffers
 for encoder video device
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
 <20250820-iris-video-encoder-v3-24-80ab0ba58b3d@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-24-80ab0ba58b3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JX7AgLbbX1V-jCpU6mfqoaBwXSl-LVp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXzVq+ERhPcxI6
 dcC0sWN5KxmAYiFJ9ZaZWjTBbSh0CnCAZhljxiDkX2Xxc6tlDYDYouuwRwfjNmHOW8vxvFHwluE
 cpLT7VLNsMjpuLQ4Rz2NtR3m3HRrA5TADZk66jglraI4HsZk6sPPIm7TVOnMRaHj1yYhW0QeoOM
 7I4dFBThc7JofORRgpVE/P4vkcmTuloBLIyhYgpkP+ZycXugntGyfH5LA/Rlr1z6JQz2C5Xu53w
 hroSOrz/aCAijtwHe3x7VdqZh3HlxApAOXR2AH9DUPDg7pEMcNBHJYEEU52QRp4m+dCe/aHLDFB
 SBH+J+9z0AAiq/e247gmNF+ms8bLzuAQ9H7KDsKkDCE4e3fbkXvvnrSVZ2aYW8o1hhgYSbIkRuB
 ubbcjt9T
X-Proofpoint-GUID: JX7AgLbbX1V-jCpU6mfqoaBwXSl-LVp9
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68abff7e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=4wxYYX54vYGgdhgiUc8A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044


On 8/20/2025 2:38 PM, Dikshita Agarwal wrote:
> +static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
> +{
> +	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	struct v4l2_format *f = inst->fmt_dst;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +	u32 lcu_size = 16;
> +
> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		lcu_size = 32;
> +		return hfi_buffer_non_comv_enc(width, height, num_vpp_pipes,
> +					       lcu_size, HFI_CODEC_ENCODE_HEVC);

Add the fix which was discussed in [1]. Please add the tag once done

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

[1] https://lore.kernel.org/all/0662da96-8987-45ae-ab06-c60003ef26e3@linaro.org/

