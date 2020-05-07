Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1931C8470
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 10:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGINa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 04:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgEGIN3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 04:13:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78461C061A41
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 01:13:29 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y4so5178432wrm.11
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J7Nyoh6TN298A/zGPu60YeuCRUMyhvi1B0VPpIRXkD8=;
        b=Df6/MbhaEVfEMhHwUNcTRMIYUT9M/0U7WL0VSOMhhFZneTCeZNZC/3pFk4TAipIMT0
         xp2xcpNiCkBgvgse0AeKftj58pwORKkjnwon9g3du+eSV+2bCTkCgHj9OncMCGqlQKq3
         VCmFUyFXhiGRf9t65xr3URIgKtRwHajRWxvybsS/qcjlM/xfXZR059+o9IyjvCXbW11P
         ibj2b7//mwD0B6P7LmHtKZUWbxVVVXt+IrbU9Uj8yY4xoDzGO7zoJGxcrVc9o+ukPx0n
         vhmsIJRFDQC9yL45QQtGgUt8nhqV3aMHTbtJxlaFY+Vanip1Ibg5gT9UlKsLc25W3hy/
         3rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J7Nyoh6TN298A/zGPu60YeuCRUMyhvi1B0VPpIRXkD8=;
        b=hMRKpzvKXg78f1d/uzCC3PHJ23oZBcKZoYCdcwXWifdzp8DbNB9StuNL8KM5d84QRy
         n1qoZ8uZTFMMDCZBgpo8brgASyaCZH9eWxmpU0MJMj5q1Vi3EualbzRFjGFro5PGlwhD
         jItMhnlsqJvc00s03SwHvKrPuKIvzh4yoJNMGsD5wj4QIDk72+6NYeryONYpSj+w9Oee
         k6PWrt6Jq3bTOpC9P6qd1fwCy1s6u9Y/YB1IeXRBVoSCNJZ9DtJotoOofTfav5GlR7Zz
         o/u/aA3b3T55jmztd7STSEemA9opTEOVLFfqqtMXH25MGCh5vzAwjFm5oOxe6pXFMO65
         CfLg==
X-Gm-Message-State: AGi0PuY3Nosq5BMRsoVN3YZ9ztD1+IbPMTIjUPX6M+9Z+f0qSp78OTww
        qZaWFXj8tzG7F5tR9LZiBM0W4A==
X-Google-Smtp-Source: APiQypJn2l9LEXuUtrCJU4T9xg/aguaE6+ll31meUQQy/XlK4lu1w23zu47PB8L6M4tnbGGhLUVbTA==
X-Received: by 2002:adf:f652:: with SMTP id x18mr13797663wrp.262.1588839207953;
        Thu, 07 May 2020 01:13:27 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id s18sm7542852wra.94.2020.05.07.01.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 01:13:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: venus: Add support for MSM8939
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-media@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200501203505.144362-1-konradybcio@gmail.com>
 <20200501203505.144362-2-konradybcio@gmail.com>
 <3d73eb09-ba4e-5706-042c-0d1894928a35@linaro.org>
 <CAMS8qEVa_uRdeHEGpjni-qwGqryVVRp9VY8Ej87MbSCfTqWOFA@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <ed4b2b21-69f9-4272-2631-08e8e578096b@linaro.org>
Date:   Thu, 7 May 2020 11:13:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEVa_uRdeHEGpjni-qwGqryVVRp9VY8Ej87MbSCfTqWOFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Konrad,

On 5/7/20 12:23 AM, Konrad Dybcio wrote:
> Hi Stan,
> 
> I have found some issues with the submitted GCC driver, related to
> venus, but I have to further look into them locally and work out some
> stuff. One of the things is that freq table for venus clock should be
> changed to the values found here [1] (currently it has 8916
> frequencies). When I find all the causes I'll resubmit this and
> include them in the cover letter, as I might've overlooked something
> wrt venus driver itself when creating this patch from my WIP branch.
> Also it seems like I tested this very patch incorrectly (getting
> segfaults in ffmpeg with v4l2m2m now)... Anyways, I'll get back to you
> when I make it work for sure. Sorry again for the inconvenience.

OK. Thanks for the details, I'm waiting for good news :). If you need
some help with Venus bringup ping me on IRC - my nickname is svarbanov
on #v4l channel.

Regarding to venus clocks, these two clocks exist in below gcc driver
but missing in msm8916:

gcc_venus0_core0_vcodec0_clk
gcc_venus0_core1_vcodec0_clk

but the Venus IP block should be the same as in msm8916. Can you point
me to the donwstream gcc driver or check from where they comes.

> 
> 
> [1] https://github.com/konradybcio/android_kernel_asus_msm8916-1/blob/minimal/drivers/clk/qcom/clock-gcc-8936.c#L1613-L1618
> 
> Konrad
> 
> wt., 5 maj 2020 o 13:43 Stanimir Varbanov
> <stanimir.varbanov@linaro.org> napisał(a):
>>
>> Hi Konrad,
>>
>> On 5/1/20 11:35 PM, Konrad Dybcio wrote:
>>> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 33 ++++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 194b10b987672..f3a15991ac763 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -405,6 +405,38 @@ static const struct venus_resources msm8916_res = {
>>>       .fwname = "qcom/venus-1.8/venus.mdt",
>>>  };
>>>
>>> +static const struct freq_tbl msm8939_freq_table[] = {
>>> +     { 489600, 266670000 },  /* 1080p @ 60 */
>>> +     { 244800, 200000000 },  /* 1080p @ 30 */
>>> +     { 244800, 133330000 },  /* 1080p @ 30 (decode only) */
>>> +     { 220800, 133330000 },  /* 720p @ 60 (decode only?) */
>>> +     { 108000, 133330000 },  /* 720p @ 30*/
>>> +     { 72000, 133330000 },  /* VGA @ 60 */
>>> +     { 36000, 133330000 },  /* VGA @ 30 */
>>
>> 133MHz is the minimum clock frequency in the GCC driver? Do you think
>> that will change?
>>
>>> +};
>>> +
>>> +static const struct reg_val msm8939_reg_preset[] = {
>>> +     { 0xe0020, 0x0aaaaaaa },
>>> +     { 0xe0024, 0x0aaaaaaa },
>>> +     { 0x80124, 0x00000003 },
>>> +};
>>> +
>>> +static const struct venus_resources msm8939_res = {
>>> +     .freq_tbl = msm8939_freq_table,
>>> +     .freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
>>> +     .reg_tbl = msm8939_reg_preset,
>>> +     .reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
>>> +     .clks = { "core", "iface", "bus", },
>>> +     .clks_num = 3,
>>> +     .max_load = 489600, /* 1080p @ 60 */
>>> +     .hfi_version = HFI_VERSION_1XX,
>>> +     .vmem_id = VIDC_RESOURCE_NONE,
>>> +     .vmem_size = 0,
>>> +     .vmem_addr = 0,
>>> +     .dma_mask = 0xddc00000 - 1,
>>> +     .fwname = "qcom/venus-1.8/venus.mdt",
>>> +};
>>> +
>>>  static const struct freq_tbl msm8996_freq_table[] = {
>>>       { 1944000, 520000000 }, /* 4k UHD @ 60 (decode only) */
>>>       {  972000, 520000000 }, /* 4k UHD @ 30 */
>>> @@ -567,6 +599,7 @@ static const struct venus_resources sc7180_res = {
>>>
>>>  static const struct of_device_id venus_dt_match[] = {
>>>       { .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>> +     { .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
>>>       { .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>>       { .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>       { .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>
>>
>> --
>> regards,
>> Stan

-- 
regards,
Stan
