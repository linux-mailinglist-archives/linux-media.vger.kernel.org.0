Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBED14FAA8
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 22:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgBAVZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 16:25:19 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43914 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgBAVZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Feb 2020 16:25:18 -0500
Received: by mail-qk1-f196.google.com with SMTP id j20so10347998qka.10
        for <linux-media@vger.kernel.org>; Sat, 01 Feb 2020 13:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5j6M81BUNIsbWSXBo8B6Z3OscpkwwQkiJWlC0F2V+lQ=;
        b=08sfK5E/j2NBAVCGRQxuh7SDuzWfADe5iGQgx9h8FqsXH84xDy0zrW+E1FbSmAYPez
         LUI2Jc6xfWTaFNDTi32z5JFEjnzeNXlAbxl7EAzplXDUZ53Vs+ZZ9gzLN6urM7o5+5UI
         /MGKESOnfmtCfw8dILDYbS5dUPap+AY1+YP8+Dh6Q2iveYpAnXhRwtO/fXkpnkJzVWkJ
         HqKQqD9n+QJs6YSnM+zL0jTChQDvyvBwRa3c4YQgqfdDjVBQ2ZXW5Jl1/1uQcxUT+fcB
         +6KVNmiNcGMsCz8heeDpZ0VvC5zZaaK3xS8s/H/1IbTcx8ycATd+ukrH+5ZWrdzeLzfH
         8zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5j6M81BUNIsbWSXBo8B6Z3OscpkwwQkiJWlC0F2V+lQ=;
        b=rRgMBFOi1O6BNvOSOGROU5ACudOk8Qv0aKNf7HxWNzUXmtJxgbVNkEUsvoQ+i3IGOA
         rbiUosMbWFL3NxibcsIlubscrt0PQXA/4mFJYREYdlVlqX+8r5QBsDLEu9NDGCxWOCwB
         +LjX8l4G+C+Ld9j6Y2KID1H253bNP13mAYoMsBzdx/rn/JvjkN6xYtgEDCee9C1667MI
         Ty5rUYyStWB6n/NqceoAe86l2I3UeqR9SZmruzDTTBxf7xODVfpQ2WroQbHnj7nSeHE1
         phzMwjlf7nHAfNMTxto0HCTw3XDMqVsMvdSgPIwE1FVYtChlcZwNcZuq+kCPL6evXc0n
         I4eg==
X-Gm-Message-State: APjAAAUCc2lqjj2u+r+8x5VdFC4PpFo4PdJCghXUpSV2LrQ540xuuKDW
        i5sMg60K8XFJ7s1wY+bHoIyXnQ==
X-Google-Smtp-Source: APXvYqwpHXrzyntERCElyMkUKa6XTx2i+HgCsAKop0xtXd0R8cERDXGz2UXGbReUpb9bN8TlTyHfcw==
X-Received: by 2002:a37:678f:: with SMTP id b137mr554051qkc.310.1580592317404;
        Sat, 01 Feb 2020 13:25:17 -0800 (PST)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id k7sm7146243qtd.79.2020.02.01.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 13:25:16 -0800 (PST)
Message-ID: <e6c31a2cadfb170f86d3a0cfdca3134abe7ec4aa.camel@ndufresne.ca>
Subject: Re: [PATCH] venus: vdec: Use pmruntime autosuspend
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>
Date:   Sat, 01 Feb 2020 16:25:15 -0500
In-Reply-To: <20200130154424.29483-1-stanimir.varbanov@linaro.org>
References: <20200130154424.29483-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 30 janvier 2020 à 17:44 +0200, Stanimir Varbanov a écrit :
> Implement pmruntime autosuspend in video decoder. This will
> allow to save power while the userspace is inactive for some
> reasonable period of time. Here we power-off venus core clocks
> and power domain and don't touch vcodec because it is under
> hardware control. The later decision is made to simplify the
> code and avoid a mess in the power management code.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Tested with:

  GST_DEBUG="v4l2*:5" gst-play-1.0 <somefile>.mp4

Pressing space to pause, wait more then 2 seconds, and space again to
resume.

regards,
Nicolas

> ---
>  drivers/media/platform/qcom/venus/core.c |   3 +
>  drivers/media/platform/qcom/venus/core.h |   2 +
>  drivers/media/platform/qcom/venus/vdec.c | 134 +++++++++++++++++++----
>  3 files changed, 119 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c7525d951e92..e7995cbd55c1 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -210,6 +210,8 @@ static int venus_probe(struct platform_device *pdev)
>  	if (!core->res)
>  		return -ENODEV;
>  
> +	mutex_init(&core->pm_lock);
> +
>  	core->pm_ops = venus_pm_get(core->res->hfi_version);
>  	if (!core->pm_ops)
>  		return -ENODEV;
> @@ -336,6 +338,7 @@ static int venus_remove(struct platform_device *pdev)
>  	icc_put(core->cpucfg_path);
>  
>  	v4l2_device_unregister(&core->v4l2_dev);
> +	mutex_destroy(&core->pm_lock);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 55bdeda780bc..75b869c095b4 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -128,6 +128,7 @@ struct venus_caps {
>   * @error:	an error returned during last HFI sync operations
>   * @sys_error:	an error flag that signal system error event
>   * @core_ops:	the core operations
> + * @pm_lock:	a lock for PM operations
>   * @enc_codecs:	encoders supported by this core
>   * @dec_codecs:	decoders supported by this core
>   * @max_sessions_supported:	holds the maximum number of sessions
> @@ -168,6 +169,7 @@ struct venus_core {
>  	bool sys_error;
>  	const struct hfi_core_ops *core_ops;
>  	const struct venus_pm_ops *pm_ops;
> +	struct mutex pm_lock;
>  	unsigned long enc_codecs;
>  	unsigned long dec_codecs;
>  	unsigned int max_sessions_supported;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4997ae294312..e7e97779bc68 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -545,6 +545,64 @@ static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
>  	.vidioc_decoder_cmd = vdec_decoder_cmd,
>  };
>  
> +static int vdec_pm_get(struct venus_inst *inst)
> +{
> +	struct venus_core *core = inst->core;
> +	struct device *dev = core->dev_dec;
> +	int ret;
> +
> +	mutex_lock(&core->pm_lock);
> +	ret = pm_runtime_get_sync(dev);
> +	mutex_unlock(&core->pm_lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
> +{
> +	struct venus_core *core = inst->core;
> +	struct device *dev = core->dev_dec;
> +	int ret;
> +
> +	mutex_lock(&core->pm_lock);
> +
> +	if (autosuspend)
> +		ret = pm_runtime_put_autosuspend(dev);
> +	else
> +		ret = pm_runtime_put_sync(dev);
> +
> +	mutex_unlock(&core->pm_lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int vdec_pm_get_put(struct venus_inst *inst)
> +{
> +	struct venus_core *core = inst->core;
> +	struct device *dev = core->dev_dec;
> +	int ret = 0;
> +
> +	mutex_lock(&core->pm_lock);
> +
> +	if (pm_runtime_suspended(dev)) {
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret < 0)
> +			goto error;
> +
> +		ret = pm_runtime_put_autosuspend(dev);
> +	}
> +
> +error:
> +	mutex_unlock(&core->pm_lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static void vdec_pm_touch(struct venus_inst *inst)
> +{
> +	pm_runtime_mark_last_busy(inst->core->dev_dec);
> +}
> +
>  static int vdec_set_properties(struct venus_inst *inst)
>  {
>  	struct vdec_controls *ctr = &inst->controls.dec;
> @@ -746,11 +804,19 @@ static int vdec_queue_setup(struct vb2_queue *q,
>  		return 0;
>  	}
>  
> -	ret = vdec_session_init(inst);
> +	ret = vdec_pm_get(inst);
>  	if (ret)
>  		return ret;
>  
> +	ret = vdec_session_init(inst);
> +	if (ret)
> +		goto put_power;
> +
>  	ret = vdec_num_buffers(inst, &in_num, &out_num);
> +	if (ret)
> +		goto put_power;
> +
> +	ret = vdec_pm_put(inst, false);
>  	if (ret)
>  		return ret;
>  
> @@ -786,6 +852,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
>  	}
>  
>  	return ret;
> +
> +put_power:
> +	vdec_pm_put(inst, false);
> +	return ret;
>  }
>  
>  static int vdec_verify_conf(struct venus_inst *inst)
> @@ -947,14 +1017,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
>  
>  	mutex_lock(&inst->lock);
>  
> -	ret = venus_pm_acquire_core(inst);
> -	if (ret)
> -		return ret;
> -
> -	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		ret = vdec_start_capture(inst);
> -	else
> +	} else {
> +		ret = vdec_pm_get(inst);
> +		if (ret)
> +			goto error;
> +
> +		ret = venus_pm_acquire_core(inst);
> +		if (ret)
> +			goto put_power;
> +
> +		ret = vdec_pm_put(inst, true);
> +		if (ret)
> +			goto error;
> +
>  		ret = vdec_start_output(inst);
> +	}
>  
>  	if (ret)
>  		goto error;
> @@ -962,6 +1041,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
>  	mutex_unlock(&inst->lock);
>  	return 0;
>  
> +put_power:
> +	vdec_pm_put(inst, false);
>  error:
>  	venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
>  	mutex_unlock(&inst->lock);
> @@ -1055,8 +1136,9 @@ static void vdec_session_release(struct venus_inst *inst)
>  	struct venus_core *core = inst->core;
>  	int ret, abort = 0;
>  
> -	mutex_lock(&inst->lock);
> +	vdec_pm_get(inst);
>  
> +	mutex_lock(&inst->lock);
>  	inst->codec_state = VENUS_DEC_STATE_DEINIT;
>  
>  	ret = hfi_session_stop(inst);
> @@ -1078,10 +1160,11 @@ static void vdec_session_release(struct venus_inst *inst)
>  
>  	venus_helper_free_dpb_bufs(inst);
>  	venus_pm_load_scale(inst);
> -	venus_pm_release_core(inst);
>  	INIT_LIST_HEAD(&inst->registeredbufs);
> -
>  	mutex_unlock(&inst->lock);
> +
> +	venus_pm_release_core(inst);
> +	vdec_pm_put(inst, false);
>  }
>  
>  static int vdec_buf_init(struct vb2_buffer *vb)
> @@ -1102,6 +1185,15 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
>  		vdec_session_release(inst);
>  }
>  
> +static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	vdec_pm_get_put(inst);
> +
> +	venus_helper_vb2_buf_queue(vb);
> +}
> +
>  static const struct vb2_ops vdec_vb2_ops = {
>  	.queue_setup = vdec_queue_setup,
>  	.buf_init = vdec_buf_init,
> @@ -1109,7 +1201,7 @@ static const struct vb2_ops vdec_vb2_ops = {
>  	.buf_prepare = venus_helper_vb2_buf_prepare,
>  	.start_streaming = vdec_start_streaming,
>  	.stop_streaming = vdec_stop_streaming,
> -	.buf_queue = venus_helper_vb2_buf_queue,
> +	.buf_queue = vdec_vb2_buf_queue,
>  };
>  
>  static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
> @@ -1121,6 +1213,8 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  	struct vb2_buffer *vb;
>  	unsigned int type;
>  
> +	vdec_pm_touch(inst);
> +
>  	if (buf_type == HFI_BUFFER_INPUT)
>  		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>  	else
> @@ -1227,6 +1321,8 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>  	struct venus_core *core = inst->core;
>  	struct device *dev = core->dev_dec;
>  
> +	vdec_pm_touch(inst);
> +
>  	switch (event) {
>  	case EVT_SESSION_ERROR:
>  		inst->session_error = true;
> @@ -1347,13 +1443,9 @@ static int vdec_open(struct file *file)
>  	init_waitqueue_head(&inst->reconf_wait);
>  	venus_helper_init_instance(inst);
>  
> -	ret = pm_runtime_get_sync(core->dev_dec);
> -	if (ret < 0)
> -		goto err_free_inst;
> -
>  	ret = vdec_ctrl_init(inst);
>  	if (ret)
> -		goto err_put_sync;
> +		goto err_free;
>  
>  	ret = hfi_session_create(inst, &vdec_hfi_ops);
>  	if (ret)
> @@ -1392,9 +1484,7 @@ static int vdec_open(struct file *file)
>  	hfi_session_destroy(inst);
>  err_ctrl_deinit:
>  	vdec_ctrl_deinit(inst);
> -err_put_sync:
> -	pm_runtime_put_sync(core->dev_dec);
> -err_free_inst:
> +err_free:
>  	kfree(inst);
>  	return ret;
>  }
> @@ -1403,6 +1493,8 @@ static int vdec_close(struct file *file)
>  {
>  	struct venus_inst *inst = to_inst(file);
>  
> +	vdec_pm_get(inst);
> +
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	vdec_ctrl_deinit(inst);
> @@ -1411,7 +1503,7 @@ static int vdec_close(struct file *file)
>  	v4l2_fh_del(&inst->fh);
>  	v4l2_fh_exit(&inst->fh);
>  
> -	pm_runtime_put_sync(inst->core->dev_dec);
> +	vdec_pm_put(inst, false);
>  
>  	kfree(inst);
>  	return 0;
> @@ -1468,6 +1560,8 @@ static int vdec_probe(struct platform_device *pdev)
>  	core->dev_dec = dev;
>  
>  	video_set_drvdata(vdev, core);
> +	pm_runtime_set_autosuspend_delay(dev, 2000);
> +	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
>  
>  	return 0;

