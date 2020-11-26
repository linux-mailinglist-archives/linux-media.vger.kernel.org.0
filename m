Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF4B2C5E54
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 00:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388138AbgKZXvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 18:51:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKZXvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 18:51:03 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14F4C0613D4
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 15:51:01 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id a15so3949550edy.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2020 15:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V5KYSx6aCS9NMZ6LBkhsZnID6zJfBDD/ql119aALBaU=;
        b=BvFjIsHVznSKm0SCyX7mIYruIwzynFNq6nNjPldATYnR/9Kn4OLnH1J6oZe8DndYR8
         qaZNte+m8uCJZSY0nFOFdcshKL6nsXVP71dxpFJKptdOGZ6saM+ujUu9dRLLJdmhclUL
         mMAIYoZXdVTod+NpaYIQd0N82DsifDhARArDWSSxexpzD4K0UO6xINti8XffHGlJMagI
         Di7/DyNAj0WIS5A+kqL1QExtFA4lhuYlGdouuIDmcTbhSQO9iE2xlvDJnt5qWOt9X9YA
         JAp0VeyqBvB+SP2QGYuZhyfXztlAIzkhA/AonRyq86JTdvL/unX2h0Z3ff3cvDBGXFZ6
         09kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V5KYSx6aCS9NMZ6LBkhsZnID6zJfBDD/ql119aALBaU=;
        b=A7Lwj4qfZ72v0Z+mShvCXQGaK3WKA5tIicUboAIAvNxijig8yeqL6VcgaBuy2qQiqV
         b0SRk7fv2NwUNXlw+jkfSw8oPYKw22wyxVL5rEZfJ0nliT40rOVGEPtL1SN+Ng2pSXp5
         Phs6weyC91Ribq01cyy7kTAVyaOWlw36eg/NHzSpvUcyc/qvHFOzK/Y6Ns82wH+KWCWs
         QCt2CqBdJGiiIhuqsFqiJWE3OWwJ+nmUSmWpWOo0xS7Hq+VzJKR1NlO/2uxL4xSjKgOY
         PRktaSx6ZbXgs9av8+y+OFkB7t5bcHRoL6pInm8tUvZq7VAUvhGcYmQ/5r/JxclmOaK2
         rb1Q==
X-Gm-Message-State: AOAM531WkinFcSbibWSCRjNbSEwzCQhXi6qbdbtsjzzkDey/XqoAEbP3
        y2LIU/xKJQAyO+k1OWjNptZBNg==
X-Google-Smtp-Source: ABdhPJwQHLhhw/lbWnHZhXTchXr4mWbGlEEXdb85zO5MBxYo1OPRGUb20Zv9zTqCeaUqb2a7HH6svA==
X-Received: by 2002:a50:d784:: with SMTP id w4mr4718044edi.201.1606434660535;
        Thu, 26 Nov 2020 15:51:00 -0800 (PST)
Received: from [192.168.0.3] (hst-221-3.medicom.bg. [84.238.221.3])
        by smtp.googlemail.com with ESMTPSA id 91sm1638444edy.45.2020.11.26.15.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 15:50:59 -0800 (PST)
Subject: Re: [PATCH 1/3] venus: venc: Init the session only once in
 queue_setup
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
 <20201120001037.10032-2-stanimir.varbanov@linaro.org>
 <CAPBb6MUU2tKUarrdPennSQ0NVnOUp+jwS3DN3Qye-wiq-aT5_Q@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <dbd68079-6736-28bf-b9ab-dda51a07aa71@linaro.org>
Date:   Fri, 27 Nov 2020 01:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUU2tKUarrdPennSQ0NVnOUp+jwS3DN3Qye-wiq-aT5_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/25/20 5:13 AM, Alexandre Courbot wrote:
> Hi Stan,
> 
> On Fri, Nov 20, 2020 at 9:12 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Init the hfi session only once in queue_setup and also cover that
>> with inst->lock.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc.c | 98 ++++++++++++++++++------
>>  1 file changed, 73 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> index 4ecf78e30b59..3a2e449663d8 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -725,8 +725,10 @@ static int venc_init_session(struct venus_inst *inst)
>>         int ret;
>>
>>         ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
>> -       if (ret)
>> -               return ret;
>> +       if (ret == -EINVAL)
>> +               return 0;
> 
> Why is it safe to ignore EINVAL here?

The confusion comes from hfi_session_init() return values. Presently
hfi_session_init will return EINVAL when the session is already init.
Maybe EINVAL is not fitting well with the expected behavior of the
function. I thought about EALREADY, EBUSY but it doesn't fit well to me too.

> 
>> +       else if (ret)
>> +               goto deinit;
>>
>>         ret = venus_helper_set_input_resolution(inst, inst->width,
>>                                                 inst->height);
>> @@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
>>         struct hfi_buffer_requirements bufreq;
>>         int ret;
>>
>> -       ret = venc_init_session(inst);
>> +       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
>>         if (ret)
>>                 return ret;
>>
>> -       ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
>> -
>>         *num = bufreq.count_actual;
>>
>> -       hfi_session_deinit(inst);
>> -
>> -       return ret;
>> +       return 0;
>>  }
>>
>>  static int venc_queue_setup(struct vb2_queue *q,
>> @@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(q);
>>         unsigned int num, min = 4;
>> -       int ret = 0;
>> +       int ret;
>>
>>         if (*num_planes) {
>>                 if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
>> @@ -803,6 +801,17 @@ static int venc_queue_setup(struct vb2_queue *q,
>>                 return 0;
>>         }
>>
>> +       ret = mutex_lock_interruptible(&inst->lock);

I'll keep original mutex_lock here in next version.

>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = venc_init_session(inst);
>> +
>> +       mutex_unlock(&inst->lock);
>> +
>> +       if (ret)
>> +               return ret;
>> +
>>         switch (q->type) {
>>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>>                 *num_planes = inst->fmt_out->num_planes;
>> @@ -838,6 +847,54 @@ static int venc_queue_setup(struct vb2_queue *q,
>>         return ret;
>>  }
>>
>> +static int venc_buf_init(struct vb2_buffer *vb)
>> +{
>> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +       inst->buf_count++;
>> +
>> +       return venus_helper_vb2_buf_init(vb);
>> +}
>> +
>> +static void venc_release_session(struct venus_inst *inst)
>> +{
>> +       int ret, abort = 0;
>> +
>> +       mutex_lock(&inst->lock);
>> +
>> +       ret = hfi_session_deinit(inst);
>> +       abort = (ret && ret != -EINVAL) ? 1 : 0;
> 
> Here as well, I think a comment is warranted to explain why we can
> ignore EINVAL.

OK, will update that.

> 
>> +
>> +       if (inst->session_error)
>> +               abort = 1;
>> +
>> +       if (abort)
>> +               hfi_session_abort(inst);
>> +
>> +       mutex_unlock(&inst->lock);
>> +
>> +       venus_pm_load_scale(inst);
>> +       INIT_LIST_HEAD(&inst->registeredbufs);
>> +       venus_pm_release_core(inst);
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
> 
> We are calling venc_init_session() during the queue setup but
> venc_release_session() when the last buffer is cleaned up. For
> symmetry, wouldn't it make sense to call venc_init_session() when the
> first buffer is initialized by venc_buf_init()? Otherwise we can

No, the session must be initialized in queue_setup in order to return
the number and sizes of source/destination buffers.

I raised several times the need of symmetrical operation to queue_setup
to cover reqbuf(0) but there is no progress on that. Latest suggestion
was to use .vidioc_reqbufs ioctl op but I fall with some other issues
and at the end I came to this counting buf_init|cleanup solution.

> potentially have a scenario where the queue is set up, but no buffer
> is ever created, leading to the session never being released.

dmabuf import case?

<cut>

-- 
regards,
Stan
