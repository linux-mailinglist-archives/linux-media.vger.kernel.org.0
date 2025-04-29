Return-Path: <linux-media+bounces-31283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C515AAA07E7
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258A916BD3E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838D82BE7B1;
	Tue, 29 Apr 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LzPL0q4M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63E20E332;
	Tue, 29 Apr 2025 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920822; cv=none; b=C1PkIQPA+2AS4psBUlKEjTj9xZvhNOsa+i9ST5wzWhoEi7BcMR7Z2qRaOjmtIYxyOOKV2ld8LLnZh/DHodSdyhx7rTfynafQk5uT7FezU59D3jgpkmx+YLGnowtAA7Hlm1oSQmfFVJRDpooUe2o5X28GO67cv28ZTNpd3AG3y1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920822; c=relaxed/simple;
	bh=zHO/91CVM0fqeya1zcefPwBUjAIR56WQZbciVPz9uF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uSlMXi9wGCleuUjfEL050MObeDElnGYimg90vlu/Ot+64b71wOqjt/xLEUqWCDOKaEKEeI4OhFTexuhkUKfLMM+2H/mYzFnZ4QaAHcm5OUHr/yu5xpGG0dXNDFxJWl/G8vCRRmmi7uyW1Sp4gA5PnznxpM+BNsbkNJMFVSN+i6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LzPL0q4M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqPhw020497;
	Tue, 29 Apr 2025 10:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDg1ZYUqoUYtJP48KXrNiq/UAyQG0x/By48uNamBdGY=; b=LzPL0q4MkQM2o6eH
	CRxARXMRRDz+GbCX/buu2+0IdA1uXSWIdHz4ee496yGyZAbgwIfqQg0vLlV/Teng
	BLp7t06eexYI6bQewSGjde9pEWIcM01OHr9VNGABLMfZeVDUYbnpmD8Up96TmNhM
	Sk+C3EiZ7zroXFLo+NL1SfTDraC8Ma/dqh61xexr7OdF4m40ptMn+ygXbasIiNH2
	vlsovucdVyNIHJY+zHHGhHDVlFyGSMyc0rHv7GppqyNzyspp3NDy+3CAx+MzXkMW
	8SVSxm3hW8v2gxKHzJ6kMjEBcvRV2mx10cvzyJJUe1GRHFEetWa7X+/ulGyGdhzj
	wl/m4w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jkcyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:00:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TA0ET5016680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:00:14 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:00:09 -0700
Message-ID: <890d7181-3e93-a954-ebf1-0696682ed23d@quicinc.com>
Date: Tue, 29 Apr 2025 15:30:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 05/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
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
 <20250428-qcom-iris-hevc-vp9-v2-5-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-5-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NCBTYWx0ZWRfX/rpJJuwvf3A/ QxTq6wAWWoruCjhw4Z2Or1bH6etp8gG7X3Qx1Gfu1CG7cp9BGQ9LSaTSJKUASG8TbYBh75jmOBk FD0Z3h3ZpRhWFw80ZmusRdwVcWe4tA/pU06ygxpqJMDD4naCL3cu9+3sopJXGTpx/xo16XYhS/L
 vMSxXWeJHcNwFdncnYLvz9yf+QxE19cBy2Z7RHT0j7/XRCiKWa9ADkhDYDUE8hKyJ+1fs+MmJH+ j51DjurFza3HtioyNvjhTzWP+RNKvnlDe+gP4t5dN5alpHtq1I4q1X6Y7hPXcJmzG3VPZj3Vhww 7m6j6lQiAO+TdKoCp/A4bbx5+L+WbwtPMkWxZ/4Qs2wBqNAfNvaMujFCWSCMTiEDbJCwEYPqMnq
 PTs1k1cxXR1MNS3bAg9H5ZYlowUcdSGFqzlFeOZ/o5tzKnNttPN+5QmExvrp1RFRV5EciKz0
X-Proofpoint-GUID: tJpBvyZYEwiWSlZl4dHZ6tVYyTkXKb5w
X-Proofpoint-ORIG-GUID: tJpBvyZYEwiWSlZl4dHZ6tVYyTkXKb5w
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810a32f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=3ujAW4-UOuCNznGZemsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=952 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290074


On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
> Firmware sends buffers with 0 filled length which needs to be dropped,
> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> Also make sure:
> - These 0 length buffers are not returned as result of flush.
> - Its not a buffer with LAST flag enabled which will also have 0 filled
>   length.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 0e889d07e997..0eb7549da606 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
>  
>  	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
>  
> +	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
> +	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
> +	    !(inst->sub_state & IRIS_INST_SUB_DRC)) {
> +		buf->flags |= V4L2_BUF_FLAG_ERROR;
> +	}
> +
>  	return 0;
>  }
>  
> 
>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>


