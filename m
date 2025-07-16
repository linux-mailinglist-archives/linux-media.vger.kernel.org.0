Return-Path: <linux-media+bounces-37830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD7BB06D9C
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4373ACF74
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 06:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC4328640D;
	Wed, 16 Jul 2025 06:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HOAyBLcT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30AA17A2EB;
	Wed, 16 Jul 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752645980; cv=none; b=rxqjbDY3jnm1sVT7mAjazqIsFg/SYG3CUE5/FWVPtRMnBs9DWoUIwH9qhzRXiYgIKOjOpdsYsLkp5DAkVePYxnPGrc5+1eugCAHs8NU4s33pX8Z/cpXMFbtbx8xFtjeodni9EzbyU2NMDASRPhnLM4VRk3GeG/7JAxWX494p5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752645980; c=relaxed/simple;
	bh=+veDHBCQob9m4GvCLOkykch1gwdSIXFe4A4FEqJ5Y4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AnImGQvj6hkOm4nZ7C+68LdFm8wNQQH2Mc6Zl+cFr40/msfrGVA5FDw5LisL2V1ZtsyNrIk74JbPXeCIXBzWGgWzKxWHEaBBZSDAaoaT6VkvDJ2vXGAiHn3ei2p8tyRvhAJtIo/+14X0q3rFnvf7Kr/sbYPya/FBqjTJ/i52/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HOAyBLcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5Ux6o007582;
	Wed, 16 Jul 2025 06:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7m4Eb0ufBwB7jh50T8H8+wwRj/JCNwnadv4j58Wjp44=; b=HOAyBLcT4MKq1PoT
	0/FYV0aNRRtx4uwFZXBsJdrcyNq+NX5N+TEqAr1mMuFuMV3uFnHYN30/sKGlii7v
	Pdg4W0BxabtzoCpQPPTEUFSJscSVF/WFXvutShDZhfYpN/mjBOZLvI+NsaD1c8YD
	NnnSQGpFhczPdaZxeIp0gJ87vdOkihbRWDPJYSxJF8ybszXTbNBd5W2yHL1m3Zmn
	U482LbyI53cwZoUzojd+uFc5af2OzDRCs4oEQqHpPZMRYCEWx8CeFrAG+0mv0vWw
	Z1RkEzc03uYH60JL0Fhx7QH72jTINxtVAO+GK5iaw/263CF1XireJcXr0EFkSJEi
	80Ur6g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5tvum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:06:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G667m4012225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 06:06:07 GMT
Received: from [10.50.25.16] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 23:06:04 -0700
Message-ID: <f2015d66-dcb2-15cb-d32f-3f8cc06b8ed1@quicinc.com>
Date: Wed, 16 Jul 2025 11:36:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 02/25] media: iris: Report unreleased PERSIST buffers on
 session close
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
 <20250704-iris-video-encoder-v1-2-b6ce24e273cf@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-2-b6ce24e273cf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68774150 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=RE2RRPQ2WZmwf3aAuCMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n1iWlQUSFhcgD-5fh3AipYN32yeAjKqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA1MyBTYWx0ZWRfXwFMdgKL0coPe
 PtWik3wXKl5yA0Lf9fUze6wg7MEtdnfrq7f4eBWjfqr+i5hgcTv4nn71W6B//V69zEfBnqE34a7
 xIkcLtEU1Y09Ja3aMu1+rCayefjJkzG4ZejbwWfuRkNw5n+HIxrm/OZDUUfHy3cdjzT/PCgk3vF
 IlpI706n8ZXSjNYT59KvsMFdKh3PWxk5364NoO//ncPKjgoQ1YU1JZxUj7ev8qGbL+Q9XYqslSD
 9riIuYoz9dpctv/HxieWpCiXc9wdFzGYq2Lv/0tW8/nLPSa26hiMj1l8cHbF/R2WUXokQYsTD24
 bGagxB6cnscGEvkm9zQ18ih+E2Hh/Yf5XMdPWyRIOIv4D85qb6C7hnoJqXEoHKXz79GeOtoGAUT
 64BpljGmQXu8G91dRExmsWEkgnMy40+702rLcPDh1nBe/NyWuqpoKiNaW/CT8cioEZsCztAB
X-Proofpoint-ORIG-GUID: n1iWlQUSFhcgD-5fh3AipYN32yeAjKqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160053


On 7/4/2025 1:23 PM, Dikshita Agarwal wrote:
> Add error reporting for unreleased PERSIST internal buffers in
> iris_check_num_queued_internal_buffers(). This ensures all buffer types
> are checked and logged if not freed during session close, helping to
> detect memory leaks and improve driver robustness. No change to buffer
> lifecycle or allocation logic.
> 
> Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d..96313856a026efaff40da97eaaa63e847172cd57 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -247,6 +247,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
>  			dev_err(inst->core->dev, "%d buffer of type %d not released",
>  				count, internal_buf_type[i]);
>  	}
> +
> +	buffers = &inst->buffers[BUF_PERSIST];
> +
> +	count = 0;
> +	list_for_each_entry_safe(buf, next, &buffers->list, list)
> +		count++;
> +	if (count)
> +		dev_err(inst->core->dev, "%d buffer of type %d not released", count, buf->type);
>  }
>  
>  int iris_close(struct file *filp)
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

