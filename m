Return-Path: <linux-media+bounces-26205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D3A37CD8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 09:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EAC23AED25
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1CE19F424;
	Mon, 17 Feb 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mGBbQZe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F9418F2EA;
	Mon, 17 Feb 2025 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779976; cv=none; b=lQakALDAff4QqYu+AbLs4SNvSJKTzjZ6rQyfqrsXBtBpfAstIZ0U6JONj4zOh9oryosgJD70+EfJT9cgU2SWO3S01j8XkuJZu7+/X58g+6FLoccMRdhqwLbyBoAZdWXde5fhFo3oGEcbyo1ZYzPE6udSy+Ndov2U8otOUyTz3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779976; c=relaxed/simple;
	bh=9vBf6PHSw2DclbWEGznCOiYAGAY/r4Uos7XN/FYSSNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HSuplLEnUBtcTVeLHmhI3Ps3ljv9xOJW0WR2S2mbu4hZDxrKTeoa73x1IAEs1dGhLspj19XzBWlQsnRk5sgcy1J7zXCbbiSHKdAPJAd/lTk6FvzBK4ksjXWRu0gmyJOI57Wa+1D6L5qyIYRDGsMYRPNRVLhSbO7buhJ3CsuZjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mGBbQZe9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H043m2019710;
	Mon, 17 Feb 2025 08:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xRVJ1YevyiW1l2CaOUFUwAyZv+xv67AGIg/GfedxXw=; b=mGBbQZe9QZSZInp9
	pt87237NtDM6mqOnObyJlU+XUC5M8mWohb0mkgcx/oEvSEMfP6IJo9d6IfTB0aht
	LRCVBl92t7boJFnGzrsNGtISG4phQrXm+gR/pxXKA/9kRTjSgAH51t0tAeOh9ovM
	ixG1j6DOzRcBMNtSv0ro7dXbXC1iKa5b7cVIt/g1UCYupdQxJvv5dVLoSoLYwAwt
	w0RbAXhhSUiUYe2kCnJrd3iEGqkTCCc4QrFiDhyV7W9fQ4R5kEGuNfLsSWaG3SQB
	JVefYj+il43Zpur6JBFi+YeZO2NffalcZcUABvzUwe4SQRS7faPDIOXKlprnNMjF
	VDVF/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7urxu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 08:12:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H8Cnvf011978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 08:12:49 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 00:12:45 -0800
Message-ID: <4206de50-2970-a93b-867a-03ae6cdcedd3@quicinc.com>
Date: Mon, 17 Feb 2025 13:42:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH next] media: iris: fix error code in
 iris_load_fw_to_memory()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <a1d9e082-a4d5-4440-996f-7ee7e850de60@stanley.mountain>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <a1d9e082-a4d5-4440-996f-7ee7e850de60@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VgubdHpLUZe94Q8YIvhITZ4x8kCuY0bO
X-Proofpoint-ORIG-GUID: VgubdHpLUZe94Q8YIvhITZ4x8kCuY0bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170071



On 2/17/2025 1:38 PM, Dan Carpenter wrote:
> Return -ENOMEM if memremap() fails.  Don't return success.
> 
> Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 7c493b4a75db..f1b5cd56db32 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -53,8 +53,10 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	}
>  
>  	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> -	if (!mem_virt)
> +	if (!mem_virt) {
> +		ret = -ENOMEM;
>  		goto err_release_fw;
> +	}>
>  	ret = qcom_mdt_load(dev, firmware, fw_name,
>  			    pas_id, mem_virt, mem_phys, res_size, NULL);

Thanks for the fix.
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Thanks,
Dikshita

