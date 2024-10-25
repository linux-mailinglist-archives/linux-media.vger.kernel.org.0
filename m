Return-Path: <linux-media+bounces-20296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86B69AFAE0
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 09:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22FB028354D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 07:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D881B393B;
	Fri, 25 Oct 2024 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e9t4AggV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5101BC5C;
	Fri, 25 Oct 2024 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729840854; cv=none; b=ch0jF7GLW7Ld91XduUVmOf35HWB/B+s0pttOk498/GSuvTVDXgMk0qmtTBBhLdiQ1UXd2puKFsmeyJiVmFOKedxR61CRcDW2y0KBYikHABm+efOczNEtbJFAP5av9rEi9c+AVh+Ut/Mmel64sn7CONFl99WRv9yOygu9f3mDZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729840854; c=relaxed/simple;
	bh=xcnQdEWitE+JOZF4Lhq4NQPGksoAjZwaIOW0Tsx3TBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Uy6GuHVHC4FBRJeVKig/byg9hqfLW/QiNQmuK2Tk8aILA66sjMiVBrJT3t4wtUnUti0vLDeOsenu5Ut+zZpbDd/YDZiOW2+WqOPCcDlZxrATu8jXUO4KDw3rEibObIhpF02Kh9rp4gSOH5ka2QIV8DFDIjVcdPKdRz+MRovj2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e9t4AggV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONNUkc027468;
	Fri, 25 Oct 2024 07:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8L/7v4Sq1tK1HoMGG9g6e83yWe2noHI95ISx4xWR/lw=; b=e9t4AggV0QfKSCfP
	1t68Rr0DL0+Tu02MOd10UCR9chC6i6oPkg5bIYXix04Sn7pfBcst1QzWiyDEWyQk
	4wKxoGcwPIAwz3kDJ8f+hWTDMZ3ekhN4x+r26AJy3b+oIVoxOIIWS+8xLgC3lnwZ
	9PlPndJTaux/C4D3e9s8rkrIIak8iPPQJiN8JlRVb7TOkFv5Ilnih3Q/gujpCcJM
	MnskABP9UzezfmpMLOnGZ3ax1Bcb1g6GANnpQWiXGgVn1WqPoh91LmBL4z6uzhE+
	FCr5TgpeT8rHgaIR/R/msxLtYAG5tohVL3i6SDkppl9y7I3bz+lJJRYi0fh3bIQY
	IpkLDQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wr3nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:20:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P7KkVS027198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:20:46 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 00:20:44 -0700
Message-ID: <9a818584-3f14-ac6e-149d-901668956233@quicinc.com>
Date: Fri, 25 Oct 2024 12:50:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv3 1/3] media: venus: fix enc/dec destruction order
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tomasz Figa
	<tfiga@google.com>
References: <20241025034629.660047-1-senozhatsky@chromium.org>
 <20241025034629.660047-2-senozhatsky@chromium.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241025034629.660047-2-senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y3UE1hpN7K1hVa8DGkt1D1XJ5yQDANeL
X-Proofpoint-ORIG-GUID: Y3UE1hpN7K1hVa8DGkt1D1XJ5yQDANeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=935 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250056



On 10/25/2024 9:16 AM, Sergey Senozhatsky wrote:
> We destroy mutex-es too early as they are still taken in
> v4l2_fh_exit()->v4l2_event_unsubscribe()->v4l2_ctrl_find().
> 
> We should destroy mutex-es right before kfree().  Also
> do not vdec_ctrl_deinit() before v4l2_fh_exit().
> 
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Suggested-by: Tomasz Figa <tfiga@google.com>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 7 ++++---
>  drivers/media/platform/qcom/venus/venc.c | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6252a6b3d4ba..0013c4704f03 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1752,13 +1752,14 @@ static int vdec_close(struct file *file)
>  	cancel_work_sync(&inst->delayed_process_work);
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
> -	vdec_ctrl_deinit(inst);
>  	ida_destroy(&inst->dpb_ids);
>  	hfi_session_destroy(inst);
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
> +	vdec_ctrl_deinit(inst);
Why vdec_ctrl_deinit ->v4l2_ctrl_handler_free(&inst->ctrl_handler) needs to
be called after v4l2_fh_exit?
Ideally it should be before v4l2_fh_exit.

Thanks,
Dikshita
> +
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>  
>  	vdec_pm_put(inst, false);
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 322a7737e2c7..6a26a6592424 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1519,14 +1519,14 @@ static int venc_close(struct file *file)
>  
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
> -	venc_ctrl_deinit(inst);
>  	hfi_session_destroy(inst);
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
> +	venc_ctrl_deinit(inst);
>  
>  	inst->enc_state = VENUS_ENC_STATE_DEINIT;
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>  
>  	venc_pm_put(inst, false);
>  

