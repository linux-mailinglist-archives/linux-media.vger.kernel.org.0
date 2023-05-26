Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1FE57120F2
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 09:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242406AbjEZH21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 03:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbjEZH2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 03:28:25 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF408134;
        Fri, 26 May 2023 00:28:17 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34Q6QLiQ005494;
        Fri, 26 May 2023 07:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BejtYRxashUbDkwoYZGVXucfuuuVEbKKnXhDwMnmnGE=;
 b=JV4S83suCzAsjQ4rscBOtNLFRRM+IcSd3RBzT+QG3SbOuWY304dRi7qdi3zVktVWBs9l
 Mu9A7aVjb8t+ym4Tk/Le4YYTRI9trrcDP/Eto4EVfZauaaNOAAqJq2NSmzdB8TcDQkPx
 o68qrLGbzviI/Da61G6eugE+mI9jjEgiqdOpVGX9aFw2AA5lPtb6LSOgbRr4h94etAR/
 xvKE8faLzCDcTaxwL9ij97yK0VN234e9TxWzrk8Toz8cWIOWl9S0Sk8AXZLEL7A1RaWW
 4GuvbD2zrfVAvSTLh8K+uUPIOtHyv8LTDHfji23d+8jY2VJalFHrd+jpamkmLTgIrDnF cQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qt47eth9j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 07:28:13 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34Q7SCq0003171
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 May 2023 07:28:12 GMT
Received: from [10.216.39.111] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 26 May
 2023 00:28:09 -0700
Message-ID: <8675e084-1e18-3e4a-1af5-83cbdbc04415@quicinc.com>
Date:   Fri, 26 May 2023 12:58:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv4] media: venus: provide ctx queue lock for ioctl
 synchronization
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20230526063024.2827883-1-senozhatsky@chromium.org>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20230526063024.2827883-1-senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OCdNIxeWiCz_uIrGJXSkBT-ht3CFRBlT
X-Proofpoint-ORIG-GUID: OCdNIxeWiCz_uIrGJXSkBT-ht3CFRBlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305260062
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/26/2023 11:59 AM, Sergey Senozhatsky wrote:
> Video device has to provide a lock so that __video_do_ioctl()
> can serialize IOCTL calls. Introduce a dedicated venus_inst
> mutex for the purpose of vb2 operations synchronization.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

> ---
>  drivers/media/platform/qcom/venus/core.h | 2 ++
>  drivers/media/platform/qcom/venus/vdec.c | 4 ++++
>  drivers/media/platform/qcom/venus/venc.c | 4 ++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 4f81669986ba..06ed7b0d3262 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -389,6 +389,7 @@ enum venus_inst_modes {
>   * @sequence_out:	a sequence counter for output queue
>   * @m2m_dev:	a reference to m2m device structure
>   * @m2m_ctx:	a reference to m2m context structure
> + * @ctx_q_lock:	a lock to serialize video device ioctl calls
>   * @state:	current state of the instance
>   * @done:	a completion for sync HFI operation
>   * @error:	an error returned during last HFI sync operation
> @@ -460,6 +461,7 @@ struct venus_inst {
>  	u32 sequence_out;
>  	struct v4l2_m2m_dev *m2m_dev;
>  	struct v4l2_m2m_ctx *m2m_ctx;
> +	struct mutex ctx_q_lock;
>  	unsigned int state;
>  	struct completion done;
>  	unsigned int error;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51a53bf82bd3..be3f8c4cda08 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1609,6 +1609,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->allow_zero_bytesused = 1;
>  	src_vq->min_buffers_needed = 0;
>  	src_vq->dev = inst->core->dev;
> +	src_vq->lock = &inst->ctx_q_lock;
>  	ret = vb2_queue_init(src_vq);
>  	if (ret)
>  		return ret;
> @@ -1623,6 +1624,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->allow_zero_bytesused = 1;
>  	dst_vq->min_buffers_needed = 0;
>  	dst_vq->dev = inst->core->dev;
> +	dst_vq->lock = &inst->ctx_q_lock;
>  	return vb2_queue_init(dst_vq);
>  }
>  
> @@ -1641,6 +1643,7 @@ static int vdec_open(struct file *file)
>  	INIT_LIST_HEAD(&inst->internalbufs);
>  	INIT_LIST_HEAD(&inst->list);
>  	mutex_init(&inst->lock);
> +	mutex_init(&inst->ctx_q_lock);
>  
>  	inst->core = core;
>  	inst->session_type = VIDC_SESSION_TYPE_DEC;
> @@ -1716,6 +1719,7 @@ static int vdec_close(struct file *file)
>  	ida_destroy(&inst->dpb_ids);
>  	hfi_session_destroy(inst);
>  	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4666f42feea3..8b86873f2458 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1395,6 +1395,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	src_vq->allow_zero_bytesused = 1;
>  	src_vq->min_buffers_needed = 1;
>  	src_vq->dev = inst->core->dev;
> +	src_vq->lock = &inst->ctx_q_lock;
>  	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
>  		src_vq->bidirectional = 1;
>  	ret = vb2_queue_init(src_vq);
> @@ -1411,6 +1412,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	dst_vq->allow_zero_bytesused = 1;
>  	dst_vq->min_buffers_needed = 1;
>  	dst_vq->dev = inst->core->dev;
> +	dst_vq->lock = &inst->ctx_q_lock;
>  	return vb2_queue_init(dst_vq);
>  }
>  
> @@ -1443,6 +1445,7 @@ static int venc_open(struct file *file)
>  	INIT_LIST_HEAD(&inst->internalbufs);
>  	INIT_LIST_HEAD(&inst->list);
>  	mutex_init(&inst->lock);
> +	mutex_init(&inst->ctx_q_lock);
>  
>  	inst->core = core;
>  	inst->session_type = VIDC_SESSION_TYPE_ENC;
> @@ -1512,6 +1515,7 @@ static int venc_close(struct file *file)
>  	venc_ctrl_deinit(inst);
>  	hfi_session_destroy(inst);
>  	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_q_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  
