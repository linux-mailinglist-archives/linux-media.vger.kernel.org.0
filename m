Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 814773959D5
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 13:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhEaLpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 07:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhEaLpf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 07:45:35 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5D7C06174A
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:43:55 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c3so10584986wrp.8
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/hiUu+Skw0ykyK3yMg9SV6xOJePFSkEY+L4mrKx8bEk=;
        b=HuYVQSU4RtV3qM8BziorYrqAsrt6RDs3LyS4VSqYJUAVzYDsVTou/NkzXCC9rUQUbr
         KqU3iBdv6Ao4BBJdSB1jlduhQB/RvMrIzvB7AD/iqgWMr76VdgQY8l7nE9Z1A59i2Ld7
         dC98IGWTWar2W0gboC8B0n1gevOezpQV31Ab4VXqUFCDkAgFfep7dC5hheEq6ExYmsfo
         0Df4Cx50VrGx3fLVEJkBS0w4c44pe7A0tt8fWPs1ehpCnLVNnGzfX9Wiydai9hszZA3V
         B4VG9g3Xn1iIp71+0bJ3iYKmIAClNWbPAavCzYns2oHmwRLM7hnC7EtMfaQr7+aQq/Qq
         vw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/hiUu+Skw0ykyK3yMg9SV6xOJePFSkEY+L4mrKx8bEk=;
        b=udzQhf8ot76xegz2P3JWmpB514HdkSUMdnT3DYnO+2cn0+wBNaFjBXk9NdU4OxqrB1
         Ih/heCjY5UXC+W5ou17Eznzx+9TFORV5V1pCeoKGKZrGX02hLCTh1EknS3+CIr91NN/s
         /Arse7tbWroVwICKqgzvzst1xkiP/x1R3KQNLQ0N4kiFnT2QcsEFXvB0Qh3rltQehSiY
         rfM3Qw/2fvCwCKeRIHGohvU/4O8k0Og7qGcf2jzGReszWfM6VsqPIOFhrj0B7dwAKYgA
         UZDtwo2Zs2ELnAKPn5M4H5zp9UdY8PwyPwEmTE7G3cTJRpM+FtvAERekNfivUxy326Bp
         NFpA==
X-Gm-Message-State: AOAM530beRBzXhwHiHoLvdaZoELPoeQ+AmGOs8ZfaeaPhyX4EJIxpDVw
        Gf7pYRMtTvmsVw+ZnvBEH1NPog==
X-Google-Smtp-Source: ABdhPJzBTUKmS50n/MaPFhrF2ZX3BGlz+etTXruYHKWaOn29vCO/oSl/gs9FXxvb55mvP4xStoVODg==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr15564167wrt.133.1622461433799;
        Mon, 31 May 2021 04:43:53 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-48.medicom.bg. [84.238.221.48])
        by smtp.googlemail.com with ESMTPSA id c7sm16932232wrs.23.2021.05.31.04.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 04:43:53 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 1/5] venus: venc: Use pmruntime autosuspend
To:     Doug Anderson <dianders@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
 <20210518154509.602137-2-stanimir.varbanov@linaro.org>
 <CAD=FV=WJZ3=YMcqFLeoXnYh6=fPDzAe_4yAxehSafLGOC31ogQ@mail.gmail.com>
Message-ID: <ad5b75e2-89e9-8ed3-c092-3ccf924f2178@linaro.org>
Date:   Mon, 31 May 2021 14:43:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WJZ3=YMcqFLeoXnYh6=fPDzAe_4yAxehSafLGOC31ogQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Doug,

Thanks for the comments!

On 5/19/21 7:51 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 18, 2021 at 8:46 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Migrate encoder to use pm-runtime autosuspend APIs.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc.c | 104 +++++++++++++++++++++--
>>  1 file changed, 96 insertions(+), 8 deletions(-)
> 
> Not a full review but I happened to skim by this patch and it caught
> my attention...
> 

Thanks!

> 
>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> index 4a7291f934b6..a7a858f03ba3 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -536,6 +536,64 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
>>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>  };
>>
>> +static int venc_pm_get(struct venus_inst *inst)
>> +{
>> +       struct venus_core *core = inst->core;
>> +       struct device *dev = core->dev_enc;
>> +       int ret;
>> +
>> +       mutex_lock(&core->pm_lock);
>> +       ret = pm_runtime_get_sync(dev);
>> +       mutex_unlock(&core->pm_lock);
> 
> Why do you need a mutex around this?


> 
>> +
>> +       return ret < 0 ? ret : 0;
> 
> Odd but true: if pm_runtime_get_sync() returns an error you still need
> to put. If your code below isn't going to do this then you should
> handle it here?

I have v2 where I use pm_runtime_resume_and_get().

> 
>> +}
>> +
>> +static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
>> +{
>> +       struct venus_core *core = inst->core;
>> +       struct device *dev = core->dev_enc;
>> +       int ret;
>> +
>> +       mutex_lock(&core->pm_lock);
>> +
>> +       if (autosuspend)
>> +               ret = pm_runtime_put_autosuspend(dev);
>> +       else
>> +               ret = pm_runtime_put_sync(dev);
>> +
>> +       mutex_unlock(&core->pm_lock);
>> +
>> +       return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int venc_pm_get_put(struct venus_inst *inst)
>> +{
>> +       struct venus_core *core = inst->core;
>> +       struct device *dev = core->dev_enc;
>> +       int ret = 0;
>> +
>> +       mutex_lock(&core->pm_lock);
>> +
>> +       if (pm_runtime_suspended(dev)) {
>> +               ret = pm_runtime_get_sync(dev);
>> +               if (ret < 0)
>> +                       goto error;
> 
> If pm_runtime_get_sync() returns an error you still need to put.

In v2 I replaced with pm_runtime_resume_and_get().

> 
> 
>> +
>> +               ret = pm_runtime_put_autosuspend(dev);
>> +       }
>> +
>> +error:
>> +       mutex_unlock(&core->pm_lock);
>> +
>> +       return ret < 0 ? ret : 0;
>> +}
> 
> What is the purpose of "get_put"? It feels like using it would be racy to me.

See below ...

> 
> 
>> +
>> +static void venc_pm_touch(struct venus_inst *inst)
>> +{
>> +       pm_runtime_mark_last_busy(inst->core->dev_enc);
>> +}
>> +
>>  static int venc_set_properties(struct venus_inst *inst)
>>  {
>>         struct venc_controls *ctr = &inst->controls.enc;
>> @@ -891,10 +949,18 @@ static int venc_queue_setup(struct vb2_queue *q,
>>                 return 0;
>>         }
>>
>> +       ret = venc_pm_get(inst);
>> +       if (ret)
>> +               return ret;
>> +
>>         mutex_lock(&inst->lock);
>>         ret = venc_init_session(inst);
>>         mutex_unlock(&inst->lock);
>>
>> +       if (ret)
>> +               goto put_power;
>> +
>> +       ret = venc_pm_put(inst, false);
>>         if (ret)
>>                 return ret;
>>
>> @@ -930,6 +996,9 @@ static int venc_queue_setup(struct vb2_queue *q,
>>                 break;
>>         }
>>
>> +       return ret;
>> +put_power:
>> +       venc_pm_put(inst, false);
>>         return ret;
>>  }
>>
>> @@ -946,6 +1015,8 @@ static void venc_release_session(struct venus_inst *inst)
>>  {
>>         int ret;
>>
>> +       venc_pm_get(inst);
>> +
>>         mutex_lock(&inst->lock);
>>
>>         ret = hfi_session_deinit(inst);
>> @@ -957,6 +1028,8 @@ static void venc_release_session(struct venus_inst *inst)
>>         venus_pm_load_scale(inst);
>>         INIT_LIST_HEAD(&inst->registeredbufs);
>>         venus_pm_release_core(inst);
>> +
>> +       venc_pm_put(inst, false);
>>  }
>>
>>  static void venc_buf_cleanup(struct vb2_buffer *vb)
>> @@ -1026,7 +1099,15 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>>         inst->sequence_cap = 0;
>>         inst->sequence_out = 0;
>>
>> +       ret = venc_pm_get(inst);
>> +       if (ret)
>> +               goto error;
>> +
>>         ret = venus_pm_acquire_core(inst);
>> +       if (ret)
>> +               goto put_power;
>> +
>> +       ret = venc_pm_put(inst, true);
>>         if (ret)
>>                 goto error;
>>
>> @@ -1051,6 +1132,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
>>
>>         return 0;
>>
>> +put_power:
>> +       venc_pm_put(inst, false);
>>  error:
>>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>>         if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> @@ -1065,6 +1148,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>
>> +       venc_pm_get_put(inst);
>> +
> 
> I don't know this code at all, but I don't understand the point of the
> "get_put". Couldn't the task running this code get scheduled out for 2
> seconds right after your call to venc_pm_get_put() and then it would
> be just like you didn't call it?
> 
> ...or maybe the device wasn't suspended but it was 10 us away from
> being suspended so your "get_put" decided it didn't need to do
> anything. Then you get scheduled out for 10 us and it powers off.
> 
> Maybe there's a good reason for get_put() to exist and a good reason
> why it's race-free but it feels like the kind of thing that needs a
> comment.
> 
> 

This technique was used in decoder for some time now without any issues,
so I guess it is fine in respect to races.

The idea of venc|vdec_pm_get_put was to resume pmruntime in case that 2s
elapsed and the driver does not receive any buffer (through
vb2_buf_queue()) during that time period. In this case (and there is no
other activity) the power and clocks will be turned off and we have to
power them up on next vb2_buf_queue.

>>         mutex_lock(&inst->lock);
>>         venus_helper_vb2_buf_queue(vb);
>>         mutex_unlock(&inst->lock);
>> @@ -1088,6 +1173,8 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
>>         struct vb2_buffer *vb;
>>         unsigned int type;
>>
>> +       venc_pm_touch(inst);
>> +
>>         if (buf_type == HFI_BUFFER_INPUT)
>>                 type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>         else
>> @@ -1117,6 +1204,8 @@ static void venc_event_notify(struct venus_inst *inst, u32 event,
>>  {
>>         struct device *dev = inst->core->dev_enc;
>>
>> +       venc_pm_touch(inst);
>> +
>>         if (event == EVT_SESSION_ERROR) {
>>                 inst->session_error = true;
>>                 dev_err(dev, "enc: event session error %x\n", inst->error);
>> @@ -1205,13 +1294,9 @@ static int venc_open(struct file *file)
>>
>>         venus_helper_init_instance(inst);
>>
>> -       ret = pm_runtime_get_sync(core->dev_enc);
>> -       if (ret < 0)
>> -               goto err_put_sync;
>> -
>>         ret = venc_ctrl_init(inst);
>>         if (ret)
>> -               goto err_put_sync;
>> +               goto err_free;
>>
>>         ret = hfi_session_create(inst, &venc_hfi_ops);
>>         if (ret)
>> @@ -1250,8 +1335,7 @@ static int venc_open(struct file *file)
>>         hfi_session_destroy(inst);
>>  err_ctrl_deinit:
>>         venc_ctrl_deinit(inst);
>> -err_put_sync:
>> -       pm_runtime_put_sync(core->dev_enc);
>> +err_free:
>>         kfree(inst);
>>         return ret;
>>  }
>> @@ -1260,6 +1344,8 @@ static int venc_close(struct file *file)
>>  {
>>         struct venus_inst *inst = to_inst(file);
>>
>> +       venc_pm_get(inst);
>> +
>>         v4l2_m2m_ctx_release(inst->m2m_ctx);
>>         v4l2_m2m_release(inst->m2m_dev);
>>         venc_ctrl_deinit(inst);
>> @@ -1268,7 +1354,7 @@ static int venc_close(struct file *file)
>>         v4l2_fh_del(&inst->fh);
>>         v4l2_fh_exit(&inst->fh);
>>
>> -       pm_runtime_put_sync(inst->core->dev_enc);
>> +       venc_pm_put(inst, false);
>>
>>         kfree(inst);
>>         return 0;
>> @@ -1325,6 +1411,8 @@ static int venc_probe(struct platform_device *pdev)
>>         core->dev_enc = dev;
>>
>>         video_set_drvdata(vdev, core);
>> +       pm_runtime_set_autosuspend_delay(dev, 2000);
>> +       pm_runtime_use_autosuspend(dev);
>>         pm_runtime_enable(dev);
> 
> You have the same bug that I just made in another module! :-P
> Specifically, the pm_runtime docs say:
> 
>> Drivers in ->remove() callback should undo the runtime PM changes done
>> in ->probe(). Usually this means calling pm_runtime_disable(),
>> pm_runtime_dont_use_autosuspend() etc.
> 

Sure I will correct this in v2. Thanks!

> -Doug
> 

-- 
regards,
Stan
