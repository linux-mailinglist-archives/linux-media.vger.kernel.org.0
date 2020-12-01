Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2832CA2B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbgLAM2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:28:21 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:51175 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgLAM2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 07:28:21 -0500
X-Greylist: delayed 347 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Dec 2020 07:28:20 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606825680; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lsXKf5QO/9xCz388NXoa/OlvnD4yuBrU2kS5uFs35Co=;
 b=UEmOYrlembxJi1EvZvS0Ver4wYsjX0ZhsHvMDnYdRHvlBpow+rmuHu702WHR4cuUL4bjymhZ
 73orncr+rJ/pike/Uo4i49mZsG6LIEGFoH241MJOWj4Lslr5zcbmB+qLlWDf//qqIvBiQAsa
 gj4KnQ3UkuOegG+HnnAzbBCVwKQ=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fc6356e51762b188613d4b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 12:22:06
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 139CFC43460; Tue,  1 Dec 2020 12:22:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 865D7C433ED;
        Tue,  1 Dec 2020 12:22:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 01 Dec 2020 17:52:04 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH 1/3] venus: venc: Init the session only once in
 queue_setup
In-Reply-To: <20201120001037.10032-2-stanimir.varbanov@linaro.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-2-stanimir.varbanov@linaro.org>
Message-ID: <1773b354a597bf3e485cf07fffca62de@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2020-11-20 05:40, Stanimir Varbanov wrote:
> Init the hfi session only once in queue_setup and also cover that
> with inst->lock.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 98 ++++++++++++++++++------
>  1 file changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c
> b/drivers/media/platform/qcom/venus/venc.c
> index 4ecf78e30b59..3a2e449663d8 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -725,8 +725,10 @@ static int venc_init_session(struct venus_inst 
> *inst)
>  	int ret;
> 
>  	ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
> -	if (ret)
> -		return ret;
> +	if (ret == -EINVAL)
> +		return 0;
> +	else if (ret)
> +		goto deinit;
> 
>  	ret = venus_helper_set_input_resolution(inst, inst->width,
>  						inst->height);
> @@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct
> venus_inst *inst, unsigned int *num)
>  	struct hfi_buffer_requirements bufreq;
>  	int ret;
> 
> -	ret = venc_init_session(inst);
> +	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
>  	if (ret)
>  		return ret;
> 
> -	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
> -
>  	*num = bufreq.count_actual;
> 
> -	hfi_session_deinit(inst);
> -
> -	return ret;
> +	return 0;
>  }
> 
>  static int venc_queue_setup(struct vb2_queue *q,
> @@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
>  {
>  	struct venus_inst *inst = vb2_get_drv_priv(q);
>  	unsigned int num, min = 4;
> -	int ret = 0;
> +	int ret;
> 
>  	if (*num_planes) {
>  		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> @@ -803,6 +801,17 @@ static int venc_queue_setup(struct vb2_queue *q,
>  		return 0;
>  	}
> 
> +	ret = mutex_lock_interruptible(&inst->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = venc_init_session(inst);
> +
> +	mutex_unlock(&inst->lock);
> +
> +	if (ret)
> +		return ret;
> +
>  	switch (q->type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		*num_planes = inst->fmt_out->num_planes;
> @@ -838,6 +847,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>  	return ret;
>  }
> 
> +static int venc_buf_init(struct vb2_buffer *vb)
> +{
> +	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	inst->buf_count++;
> +
> +	return venus_helper_vb2_buf_init(vb);
> +}
> +
> +static void venc_release_session(struct venus_inst *inst)
> +{
> +	int ret, abort = 0;
> +
> +	mutex_lock(&inst->lock);
> +
> +	ret = hfi_session_deinit(inst);
> +	abort = (ret && ret != -EINVAL) ? 1 : 0;
> +
> +	if (inst->session_error)
> +		abort = 1;
> +
> +	if (abort)
> +		hfi_session_abort(inst);
> +
> +	mutex_unlock(&inst->lock);
> +
> +	venus_pm_load_scale(inst);
> +	INIT_LIST_HEAD(&inst->registeredbufs);
> +	venus_pm_release_core(inst);
> +}
> +
> +static void venc_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct venus_buffer *buf = to_venus_buffer(vbuf);
> +
> +	mutex_lock(&inst->lock);
> +	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +		if (!list_empty(&inst->registeredbufs))
> +			list_del_init(&buf->reg_list);
> +	mutex_unlock(&inst->lock);
> +
> +	inst->buf_count--;
> +	if (!inst->buf_count)
> +		venc_release_session(inst);
> +}
> +
>  static int venc_verify_conf(struct venus_inst *inst)
>  {
>  	enum hfi_version ver = inst->core->res->hfi_version;
> @@ -888,38 +945,28 @@ static int venc_start_streaming(struct vb2_queue
> *q, unsigned int count)
>  	inst->sequence_cap = 0;
>  	inst->sequence_out = 0;
> 
> -	ret = venc_init_session(inst);
> -	if (ret)
> -		goto bufs_done;
> -
>  	ret = venus_pm_acquire_core(inst);
>  	if (ret)
> -		goto deinit_sess;
> -
> -	ret = venc_set_properties(inst);
> -	if (ret)
> -		goto deinit_sess;

With this change, if set ctrl for target bitrate is called after queue 
setup and before streaming,
the new bitrate won’t be set to FW. which is not right and can cause 
quality issues.
The same might apply to other encoder parameters as well.
Please fix this in the next version.

> +		goto error;
> 
>  	ret = venc_verify_conf(inst);
>  	if (ret)
> -		goto deinit_sess;
> +		goto error;
> 
>  	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>  					inst->num_output_bufs, 0);
>  	if (ret)
> -		goto deinit_sess;
> +		goto error;
> 
>  	ret = venus_helper_vb2_start_streaming(inst);
>  	if (ret)
> -		goto deinit_sess;
> +		goto error;
> 
>  	mutex_unlock(&inst->lock);
> 
>  	return 0;
> 
> -deinit_sess:
> -	hfi_session_deinit(inst);
> -bufs_done:
> +error:
>  	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>  	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>  		inst->streamon_out = 0;
> @@ -940,7 +987,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer 
> *vb)
> 
>  static const struct vb2_ops venc_vb2_ops = {
>  	.queue_setup = venc_queue_setup,
> -	.buf_init = venus_helper_vb2_buf_init,
> +	.buf_init = venc_buf_init,
> +	.buf_cleanup = venc_buf_cleanup,
>  	.buf_prepare = venus_helper_vb2_buf_prepare,
>  	.start_streaming = venc_start_streaming,
>  	.stop_streaming = venus_helper_vb2_stop_streaming,
