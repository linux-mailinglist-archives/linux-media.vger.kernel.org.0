Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5EF96F8131
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 13:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjEELEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 07:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbjEELEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 07:04:00 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC121A1F3
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 04:03:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ac733b813fso17912241fa.1
        for <linux-media@vger.kernel.org>; Fri, 05 May 2023 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683284633; x=1685876633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39X7dUvktFxvsRvvQrNLxeaQEBittcm8Hyobx5nr4hw=;
        b=hIVxsoPqL7V47QEAUFn1yE5a9klWN+/jO41j0LOr57Vd5Z3/rm8BhV2knjx0TvvGOl
         H5odHCr8hXCUJrxWwZiRevAfOb7GppfpIgEXeSFy6Wezv0ZCpmviwNedd1XdV5BghA1u
         esoWX7zhf4NJgZqwTfGt1JgLa5rAs7F/Xv5dBUGWuB//skYW3goKbQQiDhLFDjlHCbf/
         d4QOZvyGciUPjF/JzGFMqKddlIFUrzWprWxv+6ywjIeV9TSKjkUXZk86O5O67izVdtzT
         QzqwAtAazaSuflJw0I7qNrkCq5ZaIRPzfHQ9OSAjuAyQ7dN/OFuqzhFjpaXib2geSnAg
         8zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683284633; x=1685876633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=39X7dUvktFxvsRvvQrNLxeaQEBittcm8Hyobx5nr4hw=;
        b=dq160cEk/WeAT5mwzsfWzfWTBW0pt9wnHRlDInZmg0qWncUjPsXUg2ELI39mhTTKgb
         Pxu9UC9vxe193JLtjX73V2o2FGm7WuJI/g+SLPHOEE8XRxXvotIrtwnZOMEXJ9J8n+0e
         SeC0ZmiqwmUChXf2TdAgQLsKfFSgAUGerEFx6cQYkxsTpkHvFb3K3p5GTGCrfHMXlvTS
         ro8f8xPddxnTlm3MBGT8IeraCYXUQwsFA0DaXael1pW1wgY0eCin/2HNBn+ElYnHOPKn
         hGkYJkAZf/ytSEEO4fBjO7zE0D7+y7AJISIsJV9yWGcD2X9aS5OzijrbcKBx24MRjqRO
         Jf3Q==
X-Gm-Message-State: AC+VfDyyQBP7hWqlYuyUc8gMTmr1p8ytHEpyYXXpaQMrhP+tn2n1yYSr
        I8ynDzc2hCvnhVK+norlMNcDFw==
X-Google-Smtp-Source: ACHHUZ4WzW9bQUhry35vqW7lgQk0kjjA2dj9hZvmrt9u4/l6nt0mjxtNFlh54XylD1TR1rOSzJ7GaA==
X-Received: by 2002:a2e:9e95:0:b0:2a8:d13d:8902 with SMTP id f21-20020a2e9e95000000b002a8d13d8902mr298037ljk.12.1683284633569;
        Fri, 05 May 2023 04:03:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b002ab0d1c9412sm274267ljh.139.2023.05.05.04.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 04:03:53 -0700 (PDT)
Message-ID: <af78ea4f-94b8-84dc-47ee-ae00c40a0ee9@linaro.org>
Date:   Fri, 5 May 2023 14:03:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] venus: return P010 as preferred format for 10 bit
 decode
Content-Language: en-GB
To:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-media@vger.kernel.org, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1683196599-3730-1-git-send-email-quic_dikshita@quicinc.com>
 <1683196599-3730-5-git-send-email-quic_dikshita@quicinc.com>
 <02f5d449-a64b-8f5e-6b72-2fdf8d9bafbe@linaro.org>
 <b5fa8e0a-1663-e386-cffe-e7feb16d8733@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b5fa8e0a-1663-e386-cffe-e7feb16d8733@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 12:03, Dikshita Agarwal wrote:
> 
> On 5/4/2023 10:50 PM, Konrad Dybcio wrote:
>>
>> On 4.05.2023 12:36, Dikshita Agarwal wrote:
>>> If bit depth is detected as 10 bit by firmware, return
>>> P010 as preferred decoder format to the client.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>>   drivers/media/platform/qcom/venus/vdec.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>>> b/drivers/media/platform/qcom/venus/vdec.c
>>> index 69f7f6e..ed11dc2 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -1468,8 +1468,13 @@ static void vdec_event_change(struct 
>>> venus_inst *inst,
>>>       inst->out_width = ev_data->width;
>>>       inst->out_height = ev_data->height;
>>> -    if (inst->bit_depth != ev_data->bit_depth)
>>> +    if (inst->bit_depth != ev_data->bit_depth) {
>>>           inst->bit_depth = ev_data->bit_depth;
>>> +        if (inst->bit_depth == VIDC_BITDEPTH_10)
>>> +            inst->fmt_cap = &vdec_formats[3];
>>> +        else
>>> +            inst->fmt_cap = &vdec_formats[0];
>> This doesn't scale and is very error-prone, please enumerate the
>> entries and assign it using the enumerator, like:
>>
>> enum {
>>     VDEC_FORMAT_FOO,
>>     ...
>> };
>>
>> ... vdec_formats[] = {
>>     [VDEC_FORMAT_FOO] = { foo, bar, baz }
>> }
>>
>> Konrad
> 
> I agree, this can be improved but I would prefer making that change as 
> separate patch.

Good!

> 
> As this is not only related to HDR 10 decoding, there are other places 
> in the code which will require similar change.

Please fix them first. Adding more cruft is not a good way to go.

> 
> Thanks,
> 
> Dikshita
> 
>>> +    }
>>>       if (inst->pic_struct != ev_data->pic_struct)
>>>           inst->pic_struct = ev_data->pic_struct;

-- 
With best wishes
Dmitry

