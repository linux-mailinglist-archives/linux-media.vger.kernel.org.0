Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043EC2BBB99
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 02:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgKUBdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 20:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729024AbgKUBdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 20:33:45 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C52EC061A04
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:33:44 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id k27so15386460ejs.10
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FEeNRSu5qgLr6ylD/0FS6ZjPn3Dywnf8ZskxIMhN6eU=;
        b=lKBlCnoPWTQA3xcpVgLquSx4s4GyAqOWf2lxCcIggiMjdYG7OzKRNL8KqWMz7Mi/vJ
         +/CSqa/fxKbthsBT/b1apT+QS8LZk/Pn12nNQ3dZlWvU0K/VAHCiZe2utIVkmiOeMaNb
         GBt+SfMWNplCK+6IamzKaDFNlWHUMgJeUKJrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEeNRSu5qgLr6ylD/0FS6ZjPn3Dywnf8ZskxIMhN6eU=;
        b=l+53OipUoOEfEvr00xV6w17qWlmkjj0Xa3EmdwXfAa7BhEULFGtur4PnCBWRBoZeku
         vBc3J7v6J44wJrR5/oXDmxIvH5GnQsTOPZRMzaWpJA+xr6QXUOCwJ7/Uymwy/yZg41cF
         qtMSAeEifFVKkrEg7R+OEkgw4qPi4Sy3l5clWLKTXdgIl5eGPUzPBZyFReOlokzKMuPt
         UYNjS/KNcL5dD6tD55xkh6x2vA3oIq69FNahjuPvX7TmeLOVn3RhwFQnoQyXut9haoig
         B5f2npNDv9jtpbN4TeA7K/89SP0uMdZVLRRWXa7QQufqLy4o2IQsyNar3BN8+5jjv1I4
         2O9Q==
X-Gm-Message-State: AOAM533iv61rSN3pz2d601kooRQtLmO+qPhYBZv7W5ZgGjvuUIrK+xil
        QfsvO9bCLd2DUtWuxgzehlFYsZjAoBSDvg==
X-Google-Smtp-Source: ABdhPJwNrQGRB3AvMX5ZDPmvFCGedCWm/wcslBi2OlObGSO2LqffR6IE7L6rnAjlcv/iu9WDKG//WQ==
X-Received: by 2002:a17:906:4712:: with SMTP id y18mr34218887ejq.51.1605922422793;
        Fri, 20 Nov 2020 17:33:42 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id u15sm1802617edt.24.2020.11.20.17.33.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 17:33:42 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id u12so12804312wrt.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 17:33:41 -0800 (PST)
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr18507945wrr.273.1605922421479;
 Fri, 20 Nov 2020 17:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org> <20201120001037.10032-2-stanimir.varbanov@linaro.org>
In-Reply-To: <20201120001037.10032-2-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 20 Nov 2020 17:33:27 -0800
X-Gmail-Original-Message-ID: <CAMfZQbx_p9_KGxdiCsFWL1TgaiVMjmqtqmJrCer7+UaOzwDv+w@mail.gmail.com>
Message-ID: <CAMfZQbx_p9_KGxdiCsFWL1TgaiVMjmqtqmJrCer7+UaOzwDv+w@mail.gmail.com>
Subject: Re: [PATCH 1/3] venus: venc: Init the session only once in queue_setup
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 19, 2020 at 4:12 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Init the hfi session only once in queue_setup and also cover that
> with inst->lock.
>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 98 ++++++++++++++++++------
>  1 file changed, 73 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 4ecf78e30b59..3a2e449663d8 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -725,8 +725,10 @@ static int venc_init_session(struct venus_inst *inst)
>         int ret;
>
>         ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
> -       if (ret)
> -               return ret;
> +       if (ret == -EINVAL)
> +               return 0;
> +       else if (ret)
> +               goto deinit;
>
>         ret = venus_helper_set_input_resolution(inst, inst->width,
>                                                 inst->height);
> @@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
>         struct hfi_buffer_requirements bufreq;
>         int ret;
>
> -       ret = venc_init_session(inst);
> +       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
>         if (ret)
>                 return ret;
>
> -       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
> -
>         *num = bufreq.count_actual;
>
> -       hfi_session_deinit(inst);
> -
> -       return ret;
> +       return 0;
>  }
>
>  static int venc_queue_setup(struct vb2_queue *q,
> @@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
>  {
>         struct venus_inst *inst = vb2_get_drv_priv(q);
>         unsigned int num, min = 4;
> -       int ret = 0;
> +       int ret;
>
>         if (*num_planes) {
>                 if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> @@ -803,6 +801,17 @@ static int venc_queue_setup(struct vb2_queue *q,
>                 return 0;
>         }
>
> +       ret = mutex_lock_interruptible(&inst->lock);
> +       if (ret)
> +               return ret;
> +
> +       ret = venc_init_session(inst);
> +
> +       mutex_unlock(&inst->lock);
> +
> +       if (ret)
> +               return ret;
> +
>         switch (q->type) {
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 *num_planes = inst->fmt_out->num_planes;
> @@ -838,6 +847,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>         return ret;
>  }
>
> +static int venc_buf_init(struct vb2_buffer *vb)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +
> +       inst->buf_count++;
> +
> +       return venus_helper_vb2_buf_init(vb);
> +}
> +
> +static void venc_release_session(struct venus_inst *inst)
> +{
> +       int ret, abort = 0;
> +
> +       mutex_lock(&inst->lock);
> +
> +       ret = hfi_session_deinit(inst);
> +       abort = (ret && ret != -EINVAL) ? 1 : 0;
> +
> +       if (inst->session_error)
> +               abort = 1;
> +
> +       if (abort)
> +               hfi_session_abort(inst);
> +
> +       mutex_unlock(&inst->lock);
> +
> +       venus_pm_load_scale(inst);
> +       INIT_LIST_HEAD(&inst->registeredbufs);
> +       venus_pm_release_core(inst);
> +}
> +
> +static void venc_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +       struct venus_buffer *buf = to_venus_buffer(vbuf);
> +
> +       mutex_lock(&inst->lock);
> +       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +               if (!list_empty(&inst->registeredbufs))
> +                       list_del_init(&buf->reg_list);
> +       mutex_unlock(&inst->lock);
> +
> +       inst->buf_count--;
> +       if (!inst->buf_count)
> +               venc_release_session(inst);
> +}
> +
>  static int venc_verify_conf(struct venus_inst *inst)
>  {
>         enum hfi_version ver = inst->core->res->hfi_version;
> @@ -888,38 +945,28 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>         inst->sequence_cap = 0;
>         inst->sequence_out = 0;
>
> -       ret = venc_init_session(inst);
> -       if (ret)
> -               goto bufs_done;
> -
>         ret = venus_pm_acquire_core(inst);
>         if (ret)
> -               goto deinit_sess;
> -
> -       ret = venc_set_properties(inst);
> -       if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venc_verify_conf(inst);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>                                         inst->num_output_bufs, 0);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         ret = venus_helper_vb2_start_streaming(inst);
>         if (ret)
> -               goto deinit_sess;
> +               goto error;
>
>         mutex_unlock(&inst->lock);
>
>         return 0;
>
> -deinit_sess:
> -       hfi_session_deinit(inst);
> -bufs_done:
> +error:
>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>         if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>                 inst->streamon_out = 0;
> @@ -940,7 +987,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>
>  static const struct vb2_ops venc_vb2_ops = {
>         .queue_setup = venc_queue_setup,
> -       .buf_init = venus_helper_vb2_buf_init,
> +       .buf_init = venc_buf_init,
> +       .buf_cleanup = venc_buf_cleanup,
>         .buf_prepare = venus_helper_vb2_buf_prepare,
>         .start_streaming = venc_start_streaming,
>         .stop_streaming = venus_helper_vb2_stop_streaming,
> --
> 2.17.1
>

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
