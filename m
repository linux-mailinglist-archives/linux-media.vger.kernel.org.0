Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8054D288D61
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389463AbgJIPyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389457AbgJIPyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:54:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E4CC0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 08:54:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id w5so10810920wrp.8
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IBi4lxui7TDsG7YkgR/fVfv+URw4Aj0tmdV38qvVz/E=;
        b=e0f0kljXH+VIO43qzIn4/DOZPYK4AE9jmDafKyqr8IzhDDIPPOVN0SERgiX+V01+GQ
         SdrL8Ct4vWVHMAeTXpwzwFXo/EYSgXAk1Y3Z044egIgJ7dQvaI0s8w3m61TtrfkuzDz+
         HphVJObAx7yRtfYP6La7QIsNuHR7EvPBhJEuhtQ7k4Zgniaxcejue/1FaUboctSb9ntp
         uq9QD/oUzEgiiBZwtbOObpJ7GuyrqatcaQ4u02ccrdSmFmXCOeraZ/qcMfPHvIzXiXlZ
         VjAiMe2jim2yvl2VNHWfnt/zF4O1/UEaasBU90/Pk0R+f2jUOk3QkT/Pef7wbvkm3dRN
         vqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IBi4lxui7TDsG7YkgR/fVfv+URw4Aj0tmdV38qvVz/E=;
        b=ngVmtfGGbgYWv0SYY7+TAhUJfZRG4BFbirP89s8lz9VRNY0kVKSDyYjYKwMxS2ISvB
         fVv3sgxTdK5F6NU6MqqxLwgEvbgbN5Zl1TDiYLPokAYq0e9203+PI78x6F+ILRsiIKmi
         HFF38kajLJiPFz32+PDTKanPTSBbGEpEqjHJqz0RUJjmZR9jjwCCRPqmuhFC2J2YecmA
         hfz1Z7Pe1YYcZHecZg2Eklf6MD1jQ2nlK/37QeNPEWALuw79dUGhbJDdS4Ee6a11jLT0
         vZZWLS127Qm1hrk2uvqGhfjEdeWwsFRcm0i4J0NCArYyKOLl1Arv+ONBsCtRL/SkKc3o
         gC2g==
X-Gm-Message-State: AOAM533xdqygppgrDzUGDwCda/S4KtdiAO/KqYmU4mpi7lf+rrfnf21D
        IJcieJPYV1L0tzFEjSUvWMVdr9kdJP9Rcwgb
X-Google-Smtp-Source: ABdhPJznLIeDsBYPD0LtRjcDWWRKQRompc/4gOVUUB8nPjMxU+g57p+kQCXdRtkHJxN0e6u4biSJxA==
X-Received: by 2002:a5d:4c85:: with SMTP id z5mr1615729wrs.9.1602258841669;
        Fri, 09 Oct 2020 08:54:01 -0700 (PDT)
Received: from [192.168.1.5] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id c130sm12434524wma.17.2020.10.09.08.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 08:54:01 -0700 (PDT)
Subject: Re: [PATCH 1/3] venus: vdec: Fix non reliable setting of LAST flag
To:     Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
 <20200928164431.21884-2-stanimir.varbanov@linaro.org>
 <CAPBb6MVFeGcDMWopXA5PNPVHTsgZ5r8L_-zE0TUwm5wFswVdmw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e29a925e-475e-b39d-66bc-855444344b67@linaro.org>
Date:   Fri, 9 Oct 2020 18:53:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MVFeGcDMWopXA5PNPVHTsgZ5r8L_-zE0TUwm5wFswVdmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

Thanks for the comments!

On 10/9/20 3:56 PM, Alexandre Courbot wrote:
> On Tue, Sep 29, 2020 at 1:44 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> In real use of dynamic-resolution-change it is observed that the
>> LAST buffer flag (which marks the last decoded buffer with the
>> resolution before the resolution-change event) is not reliably set.
>>
>> Fix this by set the LAST buffer flag on next queued capture buffer
>> after the resolution-change event.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.h    |  5 +-
>>  drivers/media/platform/qcom/venus/helpers.c |  6 +++
>>  drivers/media/platform/qcom/venus/vdec.c    | 52 ++++++++++++---------
>>  3 files changed, 38 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 7b79a33dc9d6..e30eeaf0ada9 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -274,7 +274,6 @@ enum venus_dec_state {
>>         VENUS_DEC_STATE_DRAIN           = 5,
>>         VENUS_DEC_STATE_DECODING        = 6,
>>         VENUS_DEC_STATE_DRC             = 7,
>> -       VENUS_DEC_STATE_DRC_FLUSH_DONE  = 8,
>>  };
>>
>>  struct venus_ts_metadata {
>> @@ -339,7 +338,7 @@ struct venus_ts_metadata {
>>   * @priv:      a private for HFI operations callbacks
>>   * @session_type:      the type of the session (decoder or encoder)
>>   * @hprop:     a union used as a holder by get property
>> - * @last_buf:  last capture buffer for dynamic-resoluton-change
>> + * @next_buf_last: a flag to mark next queued capture buffer as last
>>   */
>>  struct venus_inst {
>>         struct list_head list;
>> @@ -401,7 +400,7 @@ struct venus_inst {
>>         union hfi_get_property hprop;
>>         unsigned int core_acquired: 1;
>>         unsigned int bit_depth;
>> -       struct vb2_buffer *last_buf;
>> +       bool next_buf_last;
>>  };
>>
>>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>> index 50439eb1ffea..5ca3920237c5 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -1347,6 +1347,12 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
>>
>>         v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>>
>> +       /* Skip processing queued capture buffers after LAST flag */
>> +       if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
>> +           V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
>> +           inst->codec_state == VENUS_DEC_STATE_DRC)
>> +               goto unlock;
>> +
>>         cache_payload(inst, vb);
>>
>>         if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index ea13170a6a2c..c11bdf3ca21b 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -914,10 +914,6 @@ static int vdec_start_capture(struct venus_inst *inst)
>>                 return 0;
>>
>>  reconfigure:
>> -       ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
>> -       if (ret)
>> -               return ret;
>> -
>>         ret = vdec_output_conf(inst);
>>         if (ret)
>>                 return ret;
>> @@ -954,6 +950,7 @@ static int vdec_start_capture(struct venus_inst *inst)
>>         inst->streamon_cap = 1;
>>         inst->sequence_cap = 0;
>>         inst->reconfig = false;
>> +       inst->next_buf_last = false;
>>
>>         return 0;
>>
>> @@ -985,6 +982,7 @@ static int vdec_start_output(struct venus_inst *inst)
>>         venus_helper_init_instance(inst);
>>         inst->sequence_out = 0;
>>         inst->reconfig = false;
>> +       inst->next_buf_last = false;
>>
>>         ret = vdec_set_properties(inst);
>>         if (ret)
>> @@ -1078,9 +1076,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
>>                 break;
>>         case VENUS_DEC_STATE_DRC:
>> -               WARN_ON(1);
>> -               fallthrough;
>> -       case VENUS_DEC_STATE_DRC_FLUSH_DONE:
>> +               ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, true);
>>                 inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
>>                 venus_helper_free_dpb_bufs(inst);
>>                 break;
>> @@ -1204,9 +1200,28 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
>>  static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
>>  {
>>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +       static const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };
>>
>>         vdec_pm_get_put(inst);
>>
>> +       mutex_lock(&inst->lock);
>> +
>> +       if (inst->next_buf_last && V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
>> +           inst->codec_state == VENUS_DEC_STATE_DRC) {
>> +               vbuf->flags |= V4L2_BUF_FLAG_LAST;
>> +               vbuf->sequence = inst->sequence_cap++;
>> +               vbuf->field = V4L2_FIELD_NONE;
>> +               vb2_set_plane_payload(vb, 0, 0);
>> +               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>> +               v4l2_event_queue_fh(&inst->fh, &eos);
>> +               inst->next_buf_last = false;
>> +               mutex_unlock(&inst->lock);
>> +               return;
>> +       }
>> +
>> +       mutex_unlock(&inst->lock);
>> +
>>         venus_helper_vb2_buf_queue(vb);
>>  }
>>
>> @@ -1250,13 +1265,6 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>>                 vb->timestamp = timestamp_us * NSEC_PER_USEC;
>>                 vbuf->sequence = inst->sequence_cap++;
>>
>> -               if (inst->last_buf == vb) {
>> -                       inst->last_buf = NULL;
>> -                       vbuf->flags |= V4L2_BUF_FLAG_LAST;
>> -                       vb2_set_plane_payload(vb, 0, 0);
>> -                       vb->timestamp = 0;
>> -               }
>> -
>>                 if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
>>                         const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
>>
>> @@ -1344,13 +1352,14 @@ static void vdec_event_change(struct venus_inst *inst,
>>                 struct vb2_v4l2_buffer *last;
>>                 int ret;
>>
>> -               last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
>> -               if (last)
>> -                       inst->last_buf = &last->vb2_buf;
>> +               inst->next_buf_last = true;
>>
>> -               ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
>> -               if (ret)
>> -                       dev_dbg(dev, VDBGH "flush output error %d\n", ret);
>> +               last = v4l2_m2m_last_dst_buf(inst->m2m_ctx);
>> +               if (last) {
>> +                       ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT, false);
>> +                       if (ret)
>> +                               dev_dbg(dev, VDBGH "flush output error %d\n", ret);
>> +               }
> 
> Do we still need to call hfi_session_flush() here? It will be called
> in vdec_stop_capture() anyway, and for some reason we are only calling
> it if there is a CAPTURE buffer available (which is not guaranteed).

Yes, we need session flush.

This handles a corner case when the dequeued capture buffers are queued
immediately (without any processing from client) to the driver, in this
scenario the client doesn't own any buffer to enqueue to the driver and
the driver doesn't have a chance to return LAST flag.

> 
> I suspect that we can call it unconditionally, and maybe remove the
> call to hfi_session_flush() in vdec_stop_capture() when the state is
> VENUS_DEC_STATE_DRC. That way flushing will be performed earlier and
> in one place only.

I think that makes sense, I kept (infact moved to stop_capture) just to
be sure that the firmware doesn't hold any capture buffers before we
resume decoding with new resolution.

> 
>>         }
>>
>>         inst->reconfig = true;
>> @@ -1395,8 +1404,7 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>>
>>  static void vdec_flush_done(struct venus_inst *inst)
>>  {
>> -       if (inst->codec_state == VENUS_DEC_STATE_DRC)
>> -               inst->codec_state = VENUS_DEC_STATE_DRC_FLUSH_DONE;
>> +       dev_dbg(inst->core->dev_dec, VDBGH "flush done\n");
>>  }
>>
>>  static const struct hfi_inst_ops vdec_hfi_ops = {
>> --
>> 2.17.1
>>

-- 
regards,
Stan
