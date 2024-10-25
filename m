Return-Path: <linux-media+bounces-20298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F119B9AFC0E
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 568ABB23377
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 08:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6DE1B6D00;
	Fri, 25 Oct 2024 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V0gWmptj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E8155308;
	Fri, 25 Oct 2024 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843616; cv=none; b=sj/3CHvZiCJhaaRf7y2cKVqhmQZ/u3GvDm5n1YT5hCziaOAGDOiuY/sySHX8lnUb5ySqi2PU+/q4jgS2cTIUFCH8TUxL1m9eNJzufnwJ6Vd/GLJE3HxejUtxCwukh8SZ5+Ul7KuRgFQyrKghzKdQNqW9/UZQQbg/7No9vM+CzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843616; c=relaxed/simple;
	bh=6OWlj7YCfTw7N49KaYA/ckXjIgnW9QjzRptum+J60s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k0T0MXCDrNIpr8OIOxEXsn8sO8zr+EpKpS5neJhC8ixFlGhwHKVIn8tIDLVYKczdkaMTq4pVOcpCzoydED9a5LQKHE8u3+1xgL/t30D5uYiMpSnN5LtGEEsNNwu5+aMPjbNX3VMW48MTLB3zcfoD16pFl8Qbj8dLheZu3TOxKVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V0gWmptj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKhSk7007572;
	Fri, 25 Oct 2024 08:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC95ZwZdATrmtRFltjv/VxEOgMRwxg3+BAWxC0j1Ako=; b=V0gWmptjw5/Sfop5
	h2rtpnCfR6uPqne6QL72D2yheQBmhSIaFxrdIxAuD9v5Tq7MD1RoV69KKU2aR10R
	dfrgh/Zo9w/XfCIjdA50dFa50WszRaeq014DTLfGL7djVmRY8gvG5zF7S0iOj8fh
	begehd1TpuL4ktNkf518DltF3Yv5nQmusdyIHybz49hBjAC1GbmQMVN8iNaQ64wF
	OJRmyv9qNiMPdtsk3nwpSRYsIDivmCnkQ2kkkWLmbPnbUYfHQyeYW9hSqSohf9ZT
	XJ9p0bUEbixsc7SjqkHEJ+fLLrEBW0MYpuC1ZGrgW7w8Dz17HJKlNNOsmceOjD59
	Y5U99A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42fk52k4am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:06:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P86n2j016145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 08:06:49 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 01:06:47 -0700
Message-ID: <eb8b998a-98b8-704d-8783-9a0def327424@quicinc.com>
Date: Fri, 25 Oct 2024 13:36:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv3 3/3] media: venus: factor out inst destruction routine
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241025034629.660047-1-senozhatsky@chromium.org>
 <20241025034629.660047-4-senozhatsky@chromium.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241025034629.660047-4-senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EOMCfihBHz8EmgnQmzD2aJV2Qi90lXNh
X-Proofpoint-ORIG-GUID: EOMCfihBHz8EmgnQmzD2aJV2Qi90lXNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250061



On 10/25/2024 9:16 AM, Sergey Senozhatsky wrote:
> Factor out common instance destruction code into
> a common function.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h      |  2 ++
>  drivers/media/platform/qcom/venus/vdec.c      | 22 +---------------
>  drivers/media/platform/qcom/venus/vdec.h      |  7 +++++-
>  .../media/platform/qcom/venus/vdec_ctrls.c    |  6 -----
>  drivers/media/platform/qcom/venus/venc.c      | 22 +---------------
>  6 files changed, 35 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 423deb5e94dc..4d90fc1c21fe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -26,6 +26,7 @@
>  #include "firmware.h"
>  #include "pm_helpers.h"
>  #include "hfi_venus_io.h"
> +#include "vdec.h"
>  
>  static void venus_coredump(struct venus_core *core)
>  {
> @@ -502,6 +503,30 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> +void venus_close_common(struct venus_inst *inst)
> +{
> +	/*
> +	 * First, remove the inst from the ->instances list, so that
> +	 * to_instance() will return NULL.
> +	 */
> +	hfi_session_destroy(inst);
> +	/*
> +	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> +	 * or pending execution, which would race with the inst destruction.
> +	 */
> +	synchronize_irq(inst->core->irq);
> +
> +	v4l2_m2m_ctx_release(inst->m2m_ctx);
> +	v4l2_m2m_release(inst->m2m_dev);
> +	v4l2_fh_del(&inst->fh);
> +	v4l2_fh_exit(&inst->fh);
> +	vdec_ctrl_deinit(inst);
vdec specific APIs shouldn't be invoked from common API.
Pls call v4l2_ctrl_handler_free(&inst->ctrl_handler) directly from here.
and remove vdec/venc_ctrl_init.
> +
> +	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
> +}
> +EXPORT_SYMBOL_GPL(venus_close_common);
> +
>  static __maybe_unused int venus_runtime_resume(struct device *dev)
>  {
>  	struct venus_core *core = dev_get_drvdata(dev);
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 435325432922..7bb36a270e15 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -560,4 +560,6 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
>  		(core)->venus_ver.minor == vminor &&
>  		(core)->venus_ver.rev <= vrev);
>  }
> +
> +void venus_close_common(struct venus_inst *inst);
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index b3192a36f388..9a680402c711 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1748,29 +1748,9 @@ static int vdec_close(struct file *file)
>  	struct venus_inst *inst = to_inst(file);
>  
>  	vdec_pm_get(inst);
> -
>  	cancel_work_sync(&inst->delayed_process_work);
> -	/*
> -	 * First, remove the inst from the ->instances list, so that
> -	 * to_instance() will return NULL.
> -	 */
> -	hfi_session_destroy(inst);
> -	/*
> -	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> -	 * or pending execution, which would race with the inst destruction.
> -	 */
> -	synchronize_irq(inst->core->irq);
> -
> -	v4l2_m2m_ctx_release(inst->m2m_ctx);
> -	v4l2_m2m_release(inst->m2m_dev);
> +	venus_close_common(inst);
>  	ida_destroy(&inst->dpb_ids);
> -	v4l2_fh_del(&inst->fh);
> -	v4l2_fh_exit(&inst->fh);
> -	vdec_ctrl_deinit(inst);
> -
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
> -
>  	vdec_pm_put(inst, false);
>  
>  	kfree(inst);
> diff --git a/drivers/media/platform/qcom/venus/vdec.h b/drivers/media/platform/qcom/venus/vdec.h
> index 6b262d0bf561..2687255b1616 100644
> --- a/drivers/media/platform/qcom/venus/vdec.h
> +++ b/drivers/media/platform/qcom/venus/vdec.h
> @@ -6,9 +6,14 @@
>  #ifndef __VENUS_VDEC_H__
>  #define __VENUS_VDEC_H__
>  
> +#include <media/v4l2-ctrls.h>
> +
>  struct venus_inst;
>  
>  int vdec_ctrl_init(struct venus_inst *inst);
> -void vdec_ctrl_deinit(struct venus_inst *inst);
> +static inline void vdec_ctrl_deinit(struct venus_inst *inst)
> +{
> +	v4l2_ctrl_handler_free(&inst->ctrl_handler);
> +}
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
> index 7e0f29bf7fae..fa034a7fdbed 100644
> --- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
> @@ -4,7 +4,6 @@
>   * Copyright (C) 2017 Linaro Ltd.
>   */
>  #include <linux/types.h>
> -#include <media/v4l2-ctrls.h>
>  
>  #include "core.h"
>  #include "helpers.h"
> @@ -187,8 +186,3 @@ int vdec_ctrl_init(struct venus_inst *inst)
>  
>  	return 0;
>  }
> -
> -void vdec_ctrl_deinit(struct venus_inst *inst)
> -{
> -	v4l2_ctrl_handler_free(&inst->ctrl_handler);
> -}
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 36981ce448f5..2ae22ba156bb 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1516,28 +1516,8 @@ static int venc_close(struct file *file)
>  	struct venus_inst *inst = to_inst(file);
>  
>  	venc_pm_get(inst);
> -
> -	/*
> -	 * First, remove the inst from the ->instances list, so that
> -	 * to_instance() will return NULL.
> -	 */
> -	hfi_session_destroy(inst);
> -	/*
> -	 * Second, make sure we don't have IRQ/IRQ-thread currently running
> -	 * or pending execution, which would race with the inst destruction.
> -	 */
> -	synchronize_irq(inst->core->irq);
> -
> -	v4l2_m2m_ctx_release(inst->m2m_ctx);
> -	v4l2_m2m_release(inst->m2m_dev);
> -	v4l2_fh_del(&inst->fh);
> -	v4l2_fh_exit(&inst->fh);
> -	venc_ctrl_deinit(inst);
> -
> +	venus_close_common(inst);
>  	inst->enc_state = VENUS_ENC_STATE_DEINIT;
> -	mutex_destroy(&inst->lock);
> -	mutex_destroy(&inst->ctx_q_lock);
> -
>  	venc_pm_put(inst, false);
>  
>  	kfree(inst);

