Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00962ECD8D
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbhAGKKl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbhAGKKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 05:10:41 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91047C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 02:10:00 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id a6so4663987wmc.2
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 02:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3qGibaxmUvozTUg5l5LOwP6FkKyVfhpoDpVtAsIvhlQ=;
        b=ND1QVgnOp9W+Hgk1OuvGInbtkOL34kLhTnZ6kQI5Sbk6yeJ3ohqkks6VQPZWSij2uO
         3w7/gUYgDTbmlvNfAvi5pIWmsiM/Iw6FbKsM9/BeV6pyn8aOimxRI8pb7UdszUnH81Is
         YTLfQRKJtq/3UjYq6FrI4TfuCPfBHnpAWJQOr0I6akYLP3eUDnO/dzwAEVi80ulmdPKl
         wHsUk4ktzIq45t5R5PeEiEmh2AL6SphgVbqLeHTikOCEvsNB24wIHT9tyWeuVl6yu3gZ
         BUae6V6IgDFC6++LS1Dps4/kYUDkMizxxBsGKaA3qZXaF7IordT3MX9konTb9rzHKuNg
         Mk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3qGibaxmUvozTUg5l5LOwP6FkKyVfhpoDpVtAsIvhlQ=;
        b=iF7skI2NRlwnZLHIrFRzLPNjLcN3xj1mOOD4z/UncknPMKhma19EglVt/ss0m2O7kP
         Ox4VZIwAlZKXeIm45EDSmB5G02BZuFCJtP0BDGrq4JQD56K43NkdvQX418BRW4MoDn2v
         bEQGTKFlRXA1VLpxbvut2R8R9dHcuzfoIpUdVp4LRcfo5g+1o8wHjYu267JafEIjll/f
         dXFgoqdR3e8VJztKCP5NJ8ny9BXsrqt1fUXbboPUHiSvj4lZjfsp09nKn6mWvezpttM8
         SZ7O+IlV/wuQePlP4U5/1kbMXRH3llo4LyirjXoHNM4oR90UWNKHXZdTqBegYSRE48F9
         Qa1g==
X-Gm-Message-State: AOAM532RbaOQl684aVKp2IxA2jo6MOZVGkoussfvdgFKTJTD8EXPp/xI
        xNjtqo+8+QTBlyZcYN+ZY6fUnQ==
X-Google-Smtp-Source: ABdhPJxSL4deVMWAkPfLRW/+Obk7VYER9LX/IqJjWI8HeVTKKnwKPBWpQhORCX6ARakBUJSJVjh3sw==
X-Received: by 2002:a05:600c:1552:: with SMTP id f18mr7366017wmg.125.1610014199213;
        Thu, 07 Jan 2021 02:09:59 -0800 (PST)
Received: from [192.168.0.2] (hst-221-29.medicom.bg. [84.238.221.29])
        by smtp.googlemail.com with ESMTPSA id l11sm7249798wrt.23.2021.01.07.02.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:09:58 -0800 (PST)
Subject: Re: [PATCH v2 7/8] venus: venc: Handle reset encoder state
To:     Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
 <20201111143755.24541-8-stanimir.varbanov@linaro.org>
 <CAMfZQbzxBdND1VxRJ_P+V7X6f5noZ7bdAjOJHjLfVmQHbBQoLg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8dcfc966-5081-66f2-0561-b6e75be57417@linaro.org>
Date:   Thu, 7 Jan 2021 12:09:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfZQbzxBdND1VxRJ_P+V7X6f5noZ7bdAjOJHjLfVmQHbBQoLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fritz,

On 1/2/21 2:13 AM, Fritz Koenig wrote:
> How should we resolve this patch in relation to the "venus: venc: Init
> the session only once in queue_setup" [1] patch?

I plan to make a pull request including 4/8 and 5/8 patches from this
series which are infact fixes.

After that I will send v2 on top of this pull-request. Unfortunately  I
have to postpone this series because I see issues when execute in a row
my tests for drain and reset encoder states.

> 
> "venus: venc: Init the session only once in queue_setup" comes after
> and reworks |venc_start_streaming| substantially.  This patch
> implements |venc_stop_streaming|, but maybe that is not needed with
> the newer patch?  Can this one just be dropped, or does it need
> rework?
> 
> -Fritz
> 
> [1]: https://lore.kernel.org/patchwork/patch/1349416/
> 
> On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Redesign the encoder driver to be compliant with stateful encoder
>> spec - specifically adds handling of Reset state.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc.c | 155 ++++++++++++++++++-----
>>  1 file changed, 122 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> index 7512e4a16270..f1ae89d45a54 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -907,6 +907,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>>         return ret;
>>  }
>>
>> +static void venc_release_session(struct venus_inst *inst)
>> +{
>> +       int ret, abort = 0;
>> +
>> +       mutex_lock(&inst->lock);
>> +
>> +       ret = hfi_session_deinit(inst);
>> +       abort = (ret && ret != -EINVAL) ? 1 : 0;
>> +
>> +       if (inst->session_error)
>> +               abort = 1;
>> +
>> +       if (abort)
>> +               hfi_session_abort(inst);
>> +
>> +       venus_pm_load_scale(inst);
>> +       INIT_LIST_HEAD(&inst->registeredbufs);
>> +       mutex_unlock(&inst->lock);
>> +
>> +       venus_pm_release_core(inst);
>> +}
>> +
>> +static int venc_buf_init(struct vb2_buffer *vb)
>> +{
>> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +       inst->buf_count++;
>> +
>> +       return venus_helper_vb2_buf_init(vb);
>> +}
>> +
>> +static void venc_buf_cleanup(struct vb2_buffer *vb)
>> +{
>> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +       struct venus_buffer *buf = to_venus_buffer(vbuf);
>> +
>> +       mutex_lock(&inst->lock);
>> +       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>> +               if (!list_empty(&inst->registeredbufs))
>> +                       list_del_init(&buf->reg_list);
>> +       mutex_unlock(&inst->lock);
>> +
>> +       inst->buf_count--;
>> +       if (!inst->buf_count)
>> +               venc_release_session(inst);
>> +}
>> +
>>  static int venc_verify_conf(struct venus_inst *inst)
>>  {
>>         enum hfi_version ver = inst->core->res->hfi_version;
>> @@ -938,49 +986,57 @@ static int venc_verify_conf(struct venus_inst *inst)
>>  static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(q);
>> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>>         int ret;
>>
>>         mutex_lock(&inst->lock);
>>
>> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +       v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>> +
>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>                 inst->streamon_out = 1;
>>         else
>>                 inst->streamon_cap = 1;
>>
>> -       if (!(inst->streamon_out & inst->streamon_cap)) {
>> -               mutex_unlock(&inst->lock);
>> -               return 0;
>> -       }
>> +       if (inst->streamon_out && inst->streamon_cap &&
>> +           inst->state == INST_UNINIT) {
>> +               venus_helper_init_instance(inst);
>>
>> -       venus_helper_init_instance(inst);
>> +               inst->sequence_cap = 0;
>> +               inst->sequence_out = 0;
>>
>> -       inst->sequence_cap = 0;
>> -       inst->sequence_out = 0;
>> +               ret = venc_init_session(inst);
>> +               if (ret)
>> +                       goto bufs_done;
>>
>> -       ret = venc_init_session(inst);
>> -       if (ret)
>> -               goto bufs_done;
>> +               ret = venus_pm_acquire_core(inst);
>> +               if (ret)
>> +                       goto deinit_sess;
>>
>> -       ret = venus_pm_acquire_core(inst);
>> -       if (ret)
>> -               goto deinit_sess;
>> +               ret = venc_verify_conf(inst);
>> +               if (ret)
>> +                       goto deinit_sess;
>>
>> -       ret = venc_set_properties(inst);
>> -       if (ret)
>> -               goto deinit_sess;
>> +               ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>> +                                               inst->num_output_bufs, 0);
>> +               if (ret)
>> +                       goto deinit_sess;
>>
>> -       ret = venc_verify_conf(inst);
>> -       if (ret)
>> -               goto deinit_sess;
>> +               ret = venus_helper_vb2_start_streaming(inst);
>> +               if (ret)
>> +                       goto deinit_sess;
>>
>> -       ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>> -                                       inst->num_output_bufs, 0);
>> -       if (ret)
>> -               goto deinit_sess;
>> +               venus_helper_process_initial_out_bufs(inst);
>> +               venus_helper_process_initial_cap_bufs(inst);
>> +       } else if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->streamon_cap &&
>> +                  inst->streamon_out) {
>> +               ret = venus_helper_vb2_start_streaming(inst);
>> +               if (ret)
>> +                       goto bufs_done;
>>
>> -       ret = venus_helper_vb2_start_streaming(inst);
>> -       if (ret)
>> -               goto deinit_sess;
>> +               venus_helper_process_initial_out_bufs(inst);
>> +               venus_helper_process_initial_cap_bufs(inst);
>> +       }
>>
>>         mutex_unlock(&inst->lock);
>>
>> @@ -990,15 +1046,43 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>>         hfi_session_deinit(inst);
>>  bufs_done:
>>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>                 inst->streamon_out = 0;
>>         else
>>                 inst->streamon_cap = 0;
>> +
>>         mutex_unlock(&inst->lock);
>>         return ret;
>>  }
>>
>> -static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>> +static void venc_stop_streaming(struct vb2_queue *q)
>> +{
>> +       struct venus_inst *inst = vb2_get_drv_priv(q);
>> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>> +       int ret = -EINVAL;
>> +
>> +       mutex_lock(&inst->lock);
>> +
>> +       v4l2_m2m_clear_state(m2m_ctx);
>> +
>> +       if (V4L2_TYPE_IS_CAPTURE(q->type)) {
>> +               ret = hfi_session_stop(inst);
>> +               ret |= hfi_session_unload_res(inst);
>> +               ret |= venus_helper_unregister_bufs(inst);
>> +               ret |= venus_helper_intbufs_free(inst);
>> +       }
>> +
>> +       venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>> +
>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +               inst->streamon_out = 0;
>> +       else
>> +               inst->streamon_cap = 0;
>> +
>> +       mutex_unlock(&inst->lock);
>> +}
>> +
>> +static void venc_buf_queue(struct vb2_buffer *vb)
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> @@ -1022,11 +1106,12 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>>
>>  static const struct vb2_ops venc_vb2_ops = {
>>         .queue_setup = venc_queue_setup,
>> -       .buf_init = venus_helper_vb2_buf_init,
>> +       .buf_init = venc_buf_init,
>> +       .buf_cleanup = venc_buf_cleanup,
>>         .buf_prepare = venus_helper_vb2_buf_prepare,
>>         .start_streaming = venc_start_streaming,
>> -       .stop_streaming = venus_helper_vb2_stop_streaming,
>> -       .buf_queue = venc_vb2_buf_queue,
>> +       .stop_streaming = venc_stop_streaming,
>> +       .buf_queue = venc_buf_queue,
>>  };
>>
>>  static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
>> @@ -1084,8 +1169,12 @@ static const struct hfi_inst_ops venc_hfi_ops = {
>>         .event_notify = venc_event_notify,
>>  };
>>
>> +static void venc_m2m_device_run(void *priv)
>> +{
>> +}
>> +
>>  static const struct v4l2_m2m_ops venc_m2m_ops = {
>> -       .device_run = venus_helper_m2m_device_run,
>> +       .device_run = venc_m2m_device_run,
>>         .job_abort = venus_helper_m2m_job_abort,
>>  };
>>
>> --
>> 2.17.1
>>

-- 
regards,
Stan
