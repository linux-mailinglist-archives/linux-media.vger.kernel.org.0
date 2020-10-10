Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3DB289D28
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 03:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgJJBlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 21:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729614AbgJJBVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 21:21:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6E8C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 18:21:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so1976948wrv.7
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2020 18:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GSxc1jcPdxMOM8wAWKwJKOGpmdRepetQKmt3O6AeipA=;
        b=mKuDlT604UbMuCqS+hNfKjKSKMHuQxzY3K9qNkugnGk4ZKW2aphVyZV8uxxAfXxP3b
         2kNHc1hXPDolGukJCaU4bV04+a5jPoNeeYnSZGgUNDOY6yF3nyXywOWHIuejoc82U59T
         D+uu1hcrdUqu7VO/WCQhSDJY/ZKZV6PWHpaGFu1h90gbXicikRQ7KiBXhVDmkfmks/9j
         Vfm7pVzPR/0irxHCGYVHSWxyHv+IsOoEqfZbEerbUlz68X+ec+2IgG0A+rkPY46owBor
         0Ef1lAul5ZHy9+Ptpki2HJfBdrQdJ9eu1g9kwVheFjB59OqJEZcg1m2UiGRQuOm6oajP
         0VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GSxc1jcPdxMOM8wAWKwJKOGpmdRepetQKmt3O6AeipA=;
        b=PEuItZix0QXNQ+POqS/1geefkjwlG5id4Dg5wzfyqNH0K50wr/WV+fo8eRuWMbEqXw
         6HHDXNgShh/C5AerLsta01LSAP8GHen4vMHa6oneHOJHi6A/Xkv7g4tiagLP8CnBgSBS
         jfu1212aDEmTiGjnSPeJvzwf3olWC561QNDWs1qzwTuIjb4Ow0RXK3MBf2k/2ZGms3B0
         Y9On1YAVY9CWJQt7PR5IqlHbEwgMai6P6uoXFVcO5eam8azTlWWU62Np3j3HtnCagnpx
         bAcqoJyv6BYdGmV8fZHrb5aStfpEwo265t4ynpjVMolG5AKuwuFqRzwjcy09BowUIUlq
         IXKA==
X-Gm-Message-State: AOAM533UGXsTp3nGToIsAEKbN7Mfdng7bpWSULOG8Hxu6zHKpYCc9k0n
        3i0PV2SztMFKmO9yuRr0EqF3QQ==
X-Google-Smtp-Source: ABdhPJzKUuP7Im7jPjqJdjWDyjufCL/3BlFPgeVI0oXPC4lGXlLZmTlDH3V/D4lDFAnLzVCB7Ir4wQ==
X-Received: by 2002:adf:f7ca:: with SMTP id a10mr17430725wrq.321.1602292907690;
        Fri, 09 Oct 2020 18:21:47 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id d23sm13717633wmb.6.2020.10.09.18.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 18:21:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] venus: vdec: Make decoder return LAST flag for
 sufficient event
To:     vgarodia@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
 <20200928164431.21884-3-stanimir.varbanov@linaro.org>
 <5a823acc60d4c5cace1d2562adc548ff@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <5af74a17-6a93-5ac2-533e-8fca5c8d2faf@linaro.org>
Date:   Sat, 10 Oct 2020 04:21:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5a823acc60d4c5cace1d2562adc548ff@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vikash,

On 10/7/20 10:53 PM, vgarodia@codeaurora.org wrote:
> Hi Stan,
> 
> On 2020-09-28 22:14, Stanimir Varbanov wrote:
>> This makes the decoder to behaives equally for sufficient and
> behaves
> 
>> insufficient events. After this change the LAST buffer flag will be set
>> when the new resolution (in dynamic-resolution-change state) is smaller
>> then the old bitstream resolution.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/vdec.c | 41 ++++++++++++++++--------
>>  1 file changed, 27 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index c11bdf3ca21b..c006401255dc 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -634,6 +634,7 @@ static int vdec_output_conf(struct venus_inst *inst)
>>  {
>>      struct venus_core *core = inst->core;
>>      struct hfi_enable en = { .enable = 1 };
>> +    struct hfi_buffer_requirements bufreq;
>>      u32 width = inst->out_width;
>>      u32 height = inst->out_height;
>>      u32 out_fmt, out2_fmt;
>> @@ -709,6 +710,22 @@ static int vdec_output_conf(struct venus_inst *inst)
>>      }
>>
>>      if (IS_V3(core) || IS_V4(core)) {
>> +        ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (bufreq.size > inst->output_buf_size)
>> +            return -EINVAL;
>> +
>> +        if (inst->dpb_fmt) {
>> +            ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT2,
>> &bufreq);
>> +            if (ret)
>> +                return ret;
>> +
>> +            if (bufreq.size > inst->output2_buf_size)
>> +                return -EINVAL;
>> +        }
>> +
>>          if (inst->output2_buf_size) {
>>              ret = venus_helper_set_bufsize(inst,
>>                                 inst->output2_buf_size,
>> @@ -1327,19 +1344,15 @@ static void vdec_event_change(struct
>> venus_inst *inst,
>>      dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
>>          sufficient ? "" : "not", ev_data->width, ev_data->height);
>>
>> -    if (sufficient) {
>> -        hfi_session_continue(inst);
>> -    } else {
>> -        switch (inst->codec_state) {
>> -        case VENUS_DEC_STATE_INIT:
>> -            inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
>> -            break;
>> -        case VENUS_DEC_STATE_DECODING:
>> -            inst->codec_state = VENUS_DEC_STATE_DRC;
>> -            break;
>> -        default:
>> -            break;
>> -        }
>> +    switch (inst->codec_state) {
>> +    case VENUS_DEC_STATE_INIT:
>> +        inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
>> +        break;
>> +    case VENUS_DEC_STATE_DECODING:
>> +        inst->codec_state = VENUS_DEC_STATE_DRC;
> 
> Video firmware would raise reconfig event to driver even for cases like
> interlace detection, color space change in the bitstream. If not with
> this patch,
> we can optimize by sending reconfig event only for resolution and
> bitdepth update,
> in a followup patch.

Good point. Sure, I can do that in this series as separate patch.

> 
>> +        break;
>> +    default:
>> +        break;
>>      }
>>
>>      /*
>> @@ -1348,7 +1361,7 @@ static void vdec_event_change(struct venus_inst
>> *inst,
>>       * itself doesn't mark the last decoder output buffer with HFI
>> EOS flag.
>>       */
>>
>> -    if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
>> +    if (inst->codec_state == VENUS_DEC_STATE_DRC) {
>>          struct vb2_v4l2_buffer *last;
>>          int ret;

-- 
regards,
Stan
