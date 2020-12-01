Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34B52CB030
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 23:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgLAWgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 17:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgLAWf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 17:35:59 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676F3C0617A7
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 14:35:13 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id qw4so7758666ejb.12
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B9QbCUWbtLo8dpZVLrbSLc/Z36LbzoKBGtNrwLfQSrU=;
        b=FcKHv289R9OKOClNl4S62DVbK8cPFk6obAUBc2O8DuhQqQwfepRF4ElR4TWzGyxGOV
         pvGTQSNPGqGDH1QaULNuF7Mouct9loprVPuuy2Hj1gnDLdEHn77r9y6Z/kCzzUNCR+y/
         nV8gtqhnVDmZ28+/SboACuYBpskdXYkvVlqn82ZTOBWQjPfk9ZlV6ecHTSHJWruFtTLv
         fBurM/3dDgWNgA2xJvO1Ysdy8Tn3knNVcocShjUkn1EWNJY0BGk0ZkFT8t3fd2tIhyOm
         dWWRQCnwLZoFZ3aTaKLb9N48mRqz+Er0fpMLzQenIQxSh/UNpasTFInHvQMpM+Lup2RB
         j6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B9QbCUWbtLo8dpZVLrbSLc/Z36LbzoKBGtNrwLfQSrU=;
        b=RKvcvijRW+WzpDL2tNckgwN31lwyhe87wCqBBgdrTw5yY+0rFsoCZv6+O3yW+5rdlL
         KNxiKC15AvItVQ9hh9VjPLNA6lLJvTGd0N7Yp4T5/11iqY3jC3CHQY3hmiEMaENpizrm
         AIt9UBolF7hEYamIYoqo2YSxo4vT88HhHdF8qCdFClNCCb9TNYhCG/mIeQhywBQL+2h+
         UCZcoDk1CERmD+EPldEKQhxW+3uRDQ3j7XPpi9+mQQ4NoB/u8KcDhxo7YmSvqoD/TgvT
         +r6juEWZudpPENgmsgV5e2XfdLiXYpLBVTvJerscjrvjgpKqXXAaXg3XbylYwB5Zs65P
         +6HA==
X-Gm-Message-State: AOAM531LuXSCoOceucB6paxFhLvKf3Wqc2Tq2+Vu94Ns6ARgCzK4+ayu
        jeThOwH81lyWf7VVw5B0hbDXqg==
X-Google-Smtp-Source: ABdhPJyXoHeICcN7b3z3dJLfp+rs6//gP21E6meSbCRgamSVK0JbjdlRlSSFfcpZIYWy1DTtEArehg==
X-Received: by 2002:a17:906:f2c3:: with SMTP id gz3mr5349592ejb.448.1606862112156;
        Tue, 01 Dec 2020 14:35:12 -0800 (PST)
Received: from [192.168.0.3] (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.googlemail.com with ESMTPSA id e3sm476915ejq.96.2020.12.01.14.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 14:35:11 -0800 (PST)
Subject: Re: [PATCH] venus: vdec: Handle DRC after drain
To:     Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20201128063629.1830702-1-frkoenig@chromium.org>
 <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <a026c2ea-e8a2-e6a4-643d-cce08b31a8c9@linaro.org>
Date:   Wed, 2 Dec 2020 00:35:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MX8aiZ3q1CTuHTK+68UmOzmm03ruJcHREu+XBd3jCKCbg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 12/1/20 5:09 AM, Alexandre Courbot wrote:
> On Sat, Nov 28, 2020 at 3:40 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>>
>> If the DRC is near the end of the stream the client
>> may send a V4L2_DEC_CMD_STOP before the DRC occurs.
>> V4L2_DEC_CMD_STOP puts the driver into the
>> VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
>> that after the DRC event the state can be restored
>> correctly.
>>
>> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
>>
>> ---
>>
>> This is an attempt to fix the logic for when a DRC occurs
>> after the driver is in VENUS_DEC_STATE_DRAIN state.  This
>> works for me, but I'm not sure if I covered all the cases.
>> Specifically I'm not sure if I reset |drain_active| in all
>> the right places.
>>
>>  drivers/media/platform/qcom/venus/core.h |  1 +
>>  drivers/media/platform/qcom/venus/vdec.c | 19 +++++++++++++++++--
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 2b0899bf5b05f..1680c936c06fb 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -406,6 +406,7 @@ struct venus_inst {
>>         unsigned int core_acquired: 1;
>>         unsigned int bit_depth;
>>         bool next_buf_last;
>> +       bool drain_active;
>>  };
>>
>>  #define IS_V1(core)    ((core)->res->hfi_version == HFI_VERSION_1XX)
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 5671cf3458a68..7edbefbd75210 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>>
>>                 ret = hfi_session_process_buf(inst, &fdata);
>>
>> -               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
>> +               if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
>>                         inst->codec_state = VENUS_DEC_STATE_DRAIN;
>> +                       inst->drain_active = true;
>> +               }
>>         }
>>
>>  unlock:
>> @@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
>>
>>         inst->codec_state = VENUS_DEC_STATE_DECODING;
>>
>> +       if (inst->drain_active)
>> +               inst->codec_state = VENUS_DEC_STATE_DRAIN;
>> +
>>         inst->streamon_cap = 1;
>>         inst->sequence_cap = 0;
>>         inst->reconfig = false;
>>         inst->next_buf_last = false;
>> +       inst->drain_active = false;
>>
>>         return 0;
>>
>> @@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
>>                 /* fallthrough */
>>         case VENUS_DEC_STATE_DRAIN:
>>                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
>> +               inst->drain_active = false;
>>                 /* fallthrough */
>>         case VENUS_DEC_STATE_SEEK:
>>                 vdec_cancel_dst_buffers(inst);
>> @@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>>
>>                         v4l2_event_queue_fh(&inst->fh, &ev);
>>
>> -                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
>> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
>> +                               inst->drain_active = false;
>>                                 inst->codec_state = VENUS_DEC_STATE_STOPPED;
>> +                       }
>>                 }
>>
>>                 if (!bytesused)
>> @@ -1429,11 +1438,17 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
>>         case EVT_SYS_EVENT_CHANGE:
>>                 switch (data->event_type) {
>>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
>> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
>> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>>                         vdec_event_change(inst, data, true);
>>                         break;
>>                 case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
>> +                       if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
>> +                               inst->codec_state = VENUS_DEC_STATE_DECODING;
>>                         vdec_event_change(inst, data, false);
>>                         break;
>> +               // TODO(fritz) : does HFI_EVENT_RELEASE_BUFFER_REFERENCE also need to
>> +               // change the codec_state to VENUS_DEC_STATE_DECODING?
> 
> I don't think it does, but Stanimir can confirm probably. In any case
> we should remove this TODO in the next version. :)

No, we don't need state change for release buffer reference.

> 
>>                 case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
>>                         venus_helper_release_buf_ref(inst, data->tag);
>>                         break;
>> --
>> 2.29.2.454.gaff20da3a2-goog
>>

-- 
regards,
Stan
