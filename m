Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63284289C22
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 01:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgJIXb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 19:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgJIX2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 19:28:50 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1419C0613D5
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 16:29:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t9so11895147wrq.11
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=THq3ttYjMA/wwLeW9nschOt45SRyCQs5uQevvZP2GkY=;
        b=BemPNOphDVGBRk3Rg2QcPkDyWH7rxocZV1ckrgc5O/KDarO8uU+q1AsJ9xFvmdnoNR
         vIChLC7LU3hQxKOlWtj71DKUYr8gUF9NllM6Y7awDnfyoBKuFSIfRtDX+YwG4JeocUWN
         cdDiVeU5TQOmjR0cF5GRWqdDo+XA6zdH0u93FKgxpoWR4mKlP2ecOb1syH5F5y3ATkfi
         k5qBNQ544de5u2qp52YprG568iSlj4A+91LQMVj6qG70gr1yarKABdPrjV4pCs9Kfeqo
         CeEmTnC1hAVVTKCwOE6e/GB3F1aTfJEI9tbiXRqyUyKhbnkRDIY5mcDHOjLKgfcOXgX6
         RIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=THq3ttYjMA/wwLeW9nschOt45SRyCQs5uQevvZP2GkY=;
        b=ombrr9Bc1kAWrocpyQi5FrJhVtifRK2tVvAADW8fHFZcBUPjIpz7hs0tkDXpCEK+qK
         N2uFfGBWq7XTd0WdYj9GHLV7TeIw0MD8CwYy+3W4Q2nLm0fl/1NX29eRIm65gIqZmBUj
         m1kzvhDWLMyCnw/e0DjBTNMm68+cNreCSagY5xYJ7u1X2mvNyY6ur7imAH+kAZQ2xdBR
         f5e84V+K/Yi044+CSpBN5T7ddj5qcSpS1Hi+bUujD2/7tdvMbg9Hs9wjFflZ3Vp0/VTS
         oRKyiY+JTT37ReSSpN6kMY4L1LFV9r1pkCB9atCCFTkRS/EuSxfpdCqHpEqICxuEBp/W
         Xfiw==
X-Gm-Message-State: AOAM533grtlBDzJoWoMb3dwM3hFT8w6ulFjbfp2HpqfaKqzahWJvjkug
        jQ389e+O4LFDwMQidzRln8Qgaw==
X-Google-Smtp-Source: ABdhPJxZKH+FXT904Kdbcmw1Vf6EoFKSGTTRZEl7WYok/yJnx3MSDQaPjI9/CFts04uW9r91htpJJQ==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr18358799wrg.220.1602286139275;
        Fri, 09 Oct 2020 16:28:59 -0700 (PDT)
Received: from [192.168.1.5] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id 4sm5143347wrp.58.2020.10.09.16.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 16:28:58 -0700 (PDT)
Subject: Re: [PATCH 1/3] venus: vdec: Fix non reliable setting of LAST flag
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
 <20200928164431.21884-2-stanimir.varbanov@linaro.org>
 <CAPBb6MUMFnzd6zZE4C4T+bX5p=3iKPZp+S_hrTLECvHTHYXrtQ@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9d3e6549-ee2a-1872-48c4-29b2f21f815a@linaro.org>
Date:   Sat, 10 Oct 2020 02:28:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUMFnzd6zZE4C4T+bX5p=3iKPZp+S_hrTLECvHTHYXrtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

On 10/9/20 3:45 PM, Alexandre Courbot wrote:
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
> 
> Is this needed? Whether a resolution change occurs should only be
> dependent on what the OUTPUT queue receives, so even if the CAPTURE
> queue is stopped and resumed for some reason, pending resolution
> change events and their associated LAST buffer should still be
> emitted. With this statement we are taking the risk of sending a
> change resolution event without a corresponding LAST buffer (so the
> following LAST buffer might be misinterpreted).

I added it in start_capture just to be sure that the flag is reset
before we resume decoding on new resolution. Also, I don't expect any
source change events from firmware before we call hfi_session_continue.
So I guess this flag should be reset before hfi_session_continue.

> 
>>
>>         return 0;
>>
>> @@ -985,6 +982,7 @@ static int vdec_start_output(struct venus_inst *inst)
>>         venus_helper_init_instance(inst);
>>         inst->sequence_out = 0;
>>         inst->reconfig = false;
>> +       inst->next_buf_last = false;
> 
> This one I understand better - if the client seeks, it should probably
> check for pending events before resuming.

On second thought I think it shouldn't be here - the last buffer flag is
a property of the capture queue.

> 
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
> 
> I don't think publishing an EOS event here is correct. As the spec says:

I've taken this from vicodec driver, and I guess there is
misinterpretation of the spec. IMO LAST buffer flag and EOS event
somehow overlaps. I've no problem to drop it in next version.

> 
> "
> ... Last of the buffers will have the V4L2_BUF_FLAG_LAST flag set. To
> determine the sequence to follow, the client must check if there is
> any pending event and:
> 
> * if a V4L2_EVENT_SOURCE_CHANGE event with changes set to
> V4L2_EVENT_SRC_CH_RESOLUTION is pending, the Dynamic Resolution Change
> sequence needs to be followed,
> * if a V4L2_EVENT_EOS event is pending, the End of Stream sequence
> needs to be followed.
> "
> 
> With this we will have *both* resolution change and EOS events pending
> when the client checks the event queue after receiving the LAST
> buffer.
> 
> 
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
