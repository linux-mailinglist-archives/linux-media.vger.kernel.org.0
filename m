Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F2710A80
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 13:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240870AbjEYLDB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 07:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240914AbjEYLCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 07:02:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A45E10B;
        Thu, 25 May 2023 04:02:51 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PAq77j017457;
        Thu, 25 May 2023 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0bh9YMA8PTzmchNyhzy6JmAdzkdh8yXCRqXXRhUMrro=;
 b=aUsWS2ubBcNlNRAMuSf/WE1Cfk+GroK+SMoJh2cObaZnupIH8p60FoAS2he2LBp3T/SG
 W7VeVWpW5Q0QAQzmNQ+NRp/FWTNOSU/R+FnEXRXzLXYQO6OU/J1rctd9hAP2sQ3d0vZ/
 ALhpR6074K43WLehEWIA9WHUyPUHDSXgd/6rv4a4yb+cUalFSp3TwTv204xDSYwz+qEO
 TLjKdQAkpc/Qu/+RrC6lKv5x76iQc02K4rLYMGn/cSUH6ZiLodawpTjpRUGEd9H1c5In
 PsSsu4JpOpQsQwQZcPDZjaJmRdfsLTIruICWrjdFEXGL5mrSDJ7sqZKlyivGjbeYUoPI Kw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsqgysrnf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 May 2023 11:02:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34PB2gDm014391
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 May 2023 11:02:42 GMT
Received: from [10.216.30.6] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 25 May
 2023 04:02:39 -0700
Message-ID: <3e395f16-79f0-501f-21f1-70645d6137c2@quicinc.com>
Date:   Thu, 25 May 2023 16:32:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
Content-Language: en-US
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
 <20230525005312.GC30543@google.com>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20230525005312.GC30543@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8FTnLIQAGG73WbCTdScckCBm7NWN4-iR
X-Proofpoint-GUID: 8FTnLIQAGG73WbCTdScckCBm7NWN4-iR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_06,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250091
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/25/2023 6:23 AM, Sergey Senozhatsky wrote:
> On (23/05/24 22:06), Vikash Garodia wrote:
>>> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
>>> mutex for all vb2 operations.
>>>
>>> I think you can set it to the 'lock' mutex in struct venus_inst.
>>
>> IIUC, the suggestion is to use the 'lock' in struct venus_inst while
>> initializing the queue. This might lead to deadlock as the same lock is used
>> during vb2 operations in driver. Might be introducing a new lock for this
>> purpose in struct venus_inst would do, unless we are trying to serialize at
>> video device (or core) context.
> 
> Something like this?
> 
> Video device has to provide a lock so that __video_do_ioctl()
> can serialize IOCTL calls. Introduce a dedicated venus_inst
> mutex (which is set a ctx ->q_lock) for the purpose of vb2
> operations synchronization.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.h | 2 ++
>  drivers/media/platform/qcom/venus/vdec.c | 4 ++++
>  drivers/media/platform/qcom/venus/venc.c | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 4f81669986ba..6ac5236d6888 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -389,6 +389,7 @@ enum venus_inst_modes {
>   * @sequence_out:	a sequence counter for output queue
>   * @m2m_dev:	a reference to m2m device structure
>   * @m2m_ctx:	a reference to m2m context structure
> + * @ctx_queue_lock:	a lock to serialize video device ioctl calls
suggestion: we can keep this as ctx_q_lock.

>   * @state:	current state of the instance
>   * @done:	a completion for sync HFI operation
>   * @error:	an error returned during last HFI sync operation
> @@ -460,6 +461,7 @@ struct venus_inst {
>  	u32 sequence_out;
>  	struct v4l2_m2m_dev *m2m_dev;
>  	struct v4l2_m2m_ctx *m2m_ctx;
> +	struct mutex ctx_queue_lock;
>  	unsigned int state;
>  	struct completion done;
>  	unsigned int error;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51a53bf82bd3..2caeba5b6378 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1641,6 +1641,7 @@ static int vdec_open(struct file *file)
>  	INIT_LIST_HEAD(&inst->internalbufs);
>  	INIT_LIST_HEAD(&inst->list);
>  	mutex_init(&inst->lock);
> +	mutex_init(&inst->ctx_queue_lock);
>  
>  	inst->core = core;
>  	inst->session_type = VIDC_SESSION_TYPE_DEC;
> @@ -1684,8 +1685,10 @@ static int vdec_open(struct file *file)
>  		goto err_m2m_release;
>  	}
>  
> +
>  	v4l2_fh_init(&inst->fh, core->vdev_dec);
>  
> +	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
Better to do this in queue_init callback i.e "m2m_queue_init" in vdec.c.
src_vq->lock = &inst->ctx_q_lock;
...
dst_vq->lock = src_vq->lock;

>  	inst->fh.ctrl_handler = &inst->ctrl_handler;
>  	v4l2_fh_add(&inst->fh);
>  	inst->fh.m2m_ctx = inst->m2m_ctx;
> @@ -1716,6 +1719,7 @@ static int vdec_close(struct file *file)
>  	ida_destroy(&inst->dpb_ids);
>  	hfi_session_destroy(inst);
>  	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_queue_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4666f42feea3..4292b299f014 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1443,6 +1443,7 @@ static int venc_open(struct file *file)
>  	INIT_LIST_HEAD(&inst->internalbufs);
>  	INIT_LIST_HEAD(&inst->list);
>  	mutex_init(&inst->lock);
> +	mutex_init(&inst->ctx_queue_lock);
>  
>  	inst->core = core;
>  	inst->session_type = VIDC_SESSION_TYPE_ENC;
> @@ -1483,6 +1484,7 @@ static int venc_open(struct file *file)
>  
>  	v4l2_fh_init(&inst->fh, core->vdev_enc);
>  
> +	inst->m2m_ctx->q_lock = &inst->ctx_queue_lock;
Same comment applies here. This can be moved to "m2m_queue_init" in venc.c.

>  	inst->fh.ctrl_handler = &inst->ctrl_handler;
>  	v4l2_fh_add(&inst->fh);
>  	inst->fh.m2m_ctx = inst->m2m_ctx;
> @@ -1512,6 +1514,7 @@ static int venc_close(struct file *file)
>  	venc_ctrl_deinit(inst);
>  	hfi_session_destroy(inst);
>  	mutex_destroy(&inst->lock);
> +	mutex_destroy(&inst->ctx_queue_lock);
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  
