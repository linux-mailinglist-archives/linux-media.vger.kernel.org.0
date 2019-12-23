Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2FC129459
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 11:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfLWKn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 05:43:26 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43961 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfLWKnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 05:43:25 -0500
Received: by mail-ed1-f65.google.com with SMTP id dc19so14885099edb.10
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2019 02:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uk7naUju2+XbutO3mWqlPuK0fzl6xEjormjMxI+qpl8=;
        b=hmsl3JEtm3nmnkhumYmwRTOC19hA7BaLhnTRrHH1S5/z6VywLyGNHuRCFtG1Mps340
         JwYL7ixxMa0X7G2Jm3Hbe0G+GMf5CvjC87tfxTfU5fi9xbr9RbIWy5ssft3S/ZKDkXue
         xL9+tlHsEP4+yN7KvLQPnTALQTZovIKws3LeFG99J2xTTe4+glksinN5Rtt4ZS3y8IBm
         P1YkWz5BGkv+S1p2LxDFQucAxMCL+uxaM7k8+EGcaQNHh1Dg0K8MwsSmmk8+eI43KJ+G
         7NDv/0LWEs2kmgYl3gEC6VHrnudvOypshfYxFWln18a0JCKOmUWciBKgd9d8CQeohHoW
         THhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uk7naUju2+XbutO3mWqlPuK0fzl6xEjormjMxI+qpl8=;
        b=KU2W7S08dK0He0TjfAoTpxyBcEEv9OCmmD4gwhiDreCp9cVDtpaC3W2IMshKg+myDD
         csIBeVQQyxaQmHSlDk6EnzF5dyCb5+JJ+L6UxLVzJFXNLYG6NOMX5HSo+jo2V61akETM
         1WqS3WuldOHBWGI1ZStjDQcqpXr4G2hoDM9+XkFrKQmtabx14eDbFwl+Vg6qbe0y9Lh4
         2JLQeF9qKg9s4wyc8I5CrQ+exKH3gkLgvlmoSdAhIM+0+ZOzJNUqdAYtrAB2gF0vsXQn
         dLFpwq0SxiodCtSULDDyoEQ491nUHDYgYtlFwp7G/ydi/7Sj4H95vJxUyenClRjggKUJ
         XBmw==
X-Gm-Message-State: APjAAAUII8tHCSIbojfygnocohUW7DWIMmyqfZvoNqYVk5B1hVFiTJhm
        asq9+tNlowIA61aTcSDbzq4A9g==
X-Google-Smtp-Source: APXvYqyWEpmt29x0qQj5AT9WoLd0KyIuXpzp58GzNrpJ0iW9CCWNUHZbp3UHiIf4zluasnKm5DBz5Q==
X-Received: by 2002:a05:6402:12d2:: with SMTP id k18mr31420757edx.253.1577097803403;
        Mon, 23 Dec 2019 02:43:23 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id z22sm2200251edq.79.2019.12.23.02.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 02:43:22 -0800 (PST)
Subject: Re: [PATCH 3/3] venus: core: add sc7180 DT compatible and resource
 struct
To:     dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-4-git-send-email-dikshita@codeaurora.org>
 <b1b5ee06-bc39-cfc0-b2c8-8073f8857fde@linaro.org>
 <98c83352cae3a5e38a3711f81dc28df5@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <bf25039f-f9de-69f9-0e18-305f39c3eb9d@linaro.org>
Date:   Mon, 23 Dec 2019 12:43:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <98c83352cae3a5e38a3711f81dc28df5@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

On 12/23/19 12:04 PM, dikshita@codeaurora.org wrote:
> Hi Stan,
> 
> Thanks for the review!
> 
> On 2019-12-20 15:03, Stanimir Varbanov wrote:
>> Hi Dikshita,
>>
>> Thanks for the patch!
>>
>> On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
>>> This add DT compatible string and resource structure for sc7180.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 58
>>> +++++++++++++++++++++++++++++++-
>>>  1 file changed, 57 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index c7525d9..e8c8b28 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -469,7 +469,7 @@ static __maybe_unused int
>>> venus_runtime_resume(struct device *dev)
>>>      { 2073600, 3929000, 0, 5551000, 0 },    /* 4096x2160@60 */
>>>      { 1036800, 1987000, 0, 2797000, 0 },    /* 4096x2160@30 */
>>>      {  489600, 1040000, 0, 1298000, 0 },    /* 1920x1080@60 */
>>> -    {  244800,  530000, 0,  659000, 0 },    /* 1920x1080@30 */
>>> +    {  244800,  442000, 0,  659000, 0 },    /* 1920x1080@30 */
>>
>> unrelated change, please drop it
> Sure, I will address this in next version.
>>
>>>  };
>>>
>>>  static const struct venus_resources sdm845_res = {
>>> @@ -521,11 +521,67 @@ static __maybe_unused int
>>> venus_runtime_resume(struct device *dev)
>>>      .fwname = "qcom/venus-5.2/venus.mdt",
>>>  };
>>>
>>> +static const struct freq_tbl sc7180_freq_table[] = {
>>> +    {  0, 380000000 },
>>> +    {  0, 340000000 },
>>> +    {  0, 270000000 },
>>> +    {  0, 150000000 },
>>
>> why .load is zero?
> .load is not being used any longer to calculate load and is a dummy value.
> So keeping it 0.

Hmm, ok I forgot about that fact. I suppose it is fine then.

I found some other issue. Looking into [1], for sc7180 we have two more
clock-controller frequencies, could you add them too in the table. And
last, in the same patch we have 19.2MHz do you think such frequency
makes any sense?

[1] https://lkml.org/lkml/2019/11/15/361
> 
>>
>>> +};
>>> +
>>> +static struct codec_freq_data sc7180_codec_freq_data[] =  {
>>> +    { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> +    { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> +    { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
>>> +    { V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>> +    { V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>> +    { V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>> +    { V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>> +    { V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>> +};
>>
>> the table is exactly the same as sdm845 one, please reuse it.
> Sure, I will address this in next version.
>>
>>> +
>>> +static const struct bw_tbl sc7180_bw_table_enc[] = {
>>> +    {  972000,  750000, 0, 0, 0 },    /* 3840x2160@30 */
>>> +    {  489600,  451000, 0, 0, 0 },    /* 1920x1080@60 */
>>> +    {  244800,  234000, 0, 0, 0 },    /* 1920x1080@30 */
>>> +};
>>> +
>>> +static const struct bw_tbl sc7180_bw_table_dec[] = {
>>> +    { 1036800, 1386000, 0, 1875000, 0 },    /* 4096x2160@30 */
>>> +    {  489600,  865000, 0, 1146000, 0 },    /* 1920x1080@60 */
>>> +    {  244800,  530000, 0,  583000, 0 },    /* 1920x1080@30 */
>>> +};
>>> +
>>> +static const struct venus_resources sc7180_res = {
>>> +    .freq_tbl = sc7180_freq_table,
>>> +    .freq_tbl_size = ARRAY_SIZE(sc7180_freq_table),
>>> +    .bw_tbl_enc = sc7180_bw_table_enc,
>>> +    .bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
>>> +    .bw_tbl_dec = sc7180_bw_table_dec,
>>> +    .bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
>>> +    .codec_freq_data = sc7180_codec_freq_data,
>>> +    .codec_freq_data_size = ARRAY_SIZE(sc7180_codec_freq_data),
>>> +    .clks = {"core", "iface", "bus" },
>>> +    .clks_num = 3,
>>> +    .vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
>>> +    .vcodec_clks_num = 2,
>>> +    .vcodec_pmdomains = { "venus", "vcodec0" },
>>> +    .vcodec_pmdomains_num = 2,
>>> +    .vcodec_num = 1,
>>> +    .max_load = 3110400,    /* 4096x2160@90 */
>>
>> Looking into above bandwidth tables I can guess that the maximimum load
>> is reached at 4096x2160@30? If so you have to change it here.
> 
> After checking further on this I see that max_load can be removed since
> it is not being used now to determine if H/W is overloaded or not.
> What do you suggest?

Lets have it just for informational reasons.

-- 
regards,
Stan
