Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 661D2712E93
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 22:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243877AbjEZU5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 16:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243826AbjEZU5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 16:57:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D951B3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:57:21 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eed764a10cso1259930e87.0
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685134639; x=1687726639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cT0WvEUDJwuTT+tXtB0NRjvK8qwFxob/SDE0zwiNyNY=;
        b=uT0Iw3beMTzU927vk2/AkSK7WXTPNx3p+8b3IhvR+YnNtZHlVXI2Z4P4ud3rJ2TCth
         ZrGeaTC9Tlpc0rJZGqaA4Uhv+ECRL0LG3XuLfZKVSlnNP48B7mcJwVuws9t/Jw4GWfHU
         IupqR0dizjXby/cGm482uQVynWKXrf3H56fOW+tW1NHyex9HBYWCSbLmjT0YzyeAoWfL
         hG3o8O78lCMSl/KLEixkg88vdaC8HN7rXx5ziWi239IQc8h4T3QLXJpQ9JP59awdPJaz
         5IGPtvAcSf+k0okOGrNAtoyEZGDtIoFvcVhBYE2Ru1rsZbFeE3d0jpOTV3WK8tacPo0Q
         fT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685134639; x=1687726639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cT0WvEUDJwuTT+tXtB0NRjvK8qwFxob/SDE0zwiNyNY=;
        b=aauexR5wLuHAaDv2Y9vq+YICWf1DahqXW57w2QwfvJ++5radIwU+oHlSCcYDlwnFuw
         msa5e+9LjU/VIWesoC78R6vx8GiI2UrzQ1QXjmfuwB4QpMp6Zakx1mT9wL62ffUXzM6f
         jy+axmPX0dN/Uk04FRZGDDhXCo/iFEjiN+gIMFV2RQB+yeqoSM5eYrERfWuKyy1zLnOK
         y9N/pNtTIumlL4eaV4QSctWinhequqyKKKrrYg9aEczSMrd31YMe1xNTDOt+ycM6U9iV
         z0ni2EOYUde2EhAWBM5eF1j//m8lYRsp0FyD10eF17N1OAQ9nGnhu29k3slBMWZhkNhm
         tDIA==
X-Gm-Message-State: AC+VfDxujAttwyromdYxCKsKm3H1LZwjHvoujkxTXYouzb/MgzoZR5aC
        K5eR3uT/8r0cE5sHWFc/g9a17g==
X-Google-Smtp-Source: ACHHUZ50GFIPk3ovSb+27ilH/jeHCgVGpZbtmTziYOjFjt9MNWj1cKIEGnkc5PMXCAMbPQOhRf5dvw==
X-Received: by 2002:a19:7614:0:b0:4f4:4cd4:2586 with SMTP id c20-20020a197614000000b004f44cd42586mr871361lff.20.1685134639638;
        Fri, 26 May 2023 13:57:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id l12-20020a19c20c000000b004b55ddeb7e3sm780376lfc.309.2023.05.26.13.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:57:19 -0700 (PDT)
Message-ID: <e755eabf-f8d7-c2cd-aa5a-bc48c7a5d5ae@linaro.org>
Date:   Fri, 26 May 2023 22:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] media: camss: Link CAMSS power domain
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230526180712.8481-1-y.oudjana@protonmail.com>
 <20230526180712.8481-4-y.oudjana@protonmail.com>
 <fa395680-0e6c-3eb0-9d5a-f90a95c394b8@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fa395680-0e6c-3eb0-9d5a-f90a95c394b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.05.2023 22:49, Bryan O'Donoghue wrote:
> On 26/05/2023 19:07, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> The CAMSS power domain was previously enabled implicitly when the VFE
>> power domains were enabled.
>> Commit 46cc03175498 ("media: camss: Split power domain management")
>> delayed enabling VFE power domains which in turn delayed enabling the
>> CAMSS power domain. This made CSIPHY fail to enable camss_top_ahb_clk
>> which requires the CAMSS power domain to be on:
>>
>> [  199.097810] ------------[ cut here ]------------
>> [  199.097893] camss_top_ahb_clk status stuck at 'off'
>> [  199.097913] WARNING: CPU: 3 PID: 728 at drivers/clk/qcom/clk-branch.c:91 clk_branch_wait+0x140/0x160
>> ...
>> [  199.100064]  clk_branch_wait+0x140/0x160
>> [  199.100112]  clk_branch2_enable+0x30/0x40
>> [  199.100159]  clk_core_enable+0x6c/0xb0
>> [  199.100211]  clk_enable+0x2c/0x50
>> [  199.100257]  camss_enable_clocks+0x94/0xe0 [qcom_camss]
>> [  199.100342]  csiphy_set_power+0x154/0x2a0 [qcom_camss]
>> ...
>> [  199.101594] ---[ end trace 0000000000000000 ]---
>>
>> Link the CAMSS power domain in camss_configure_pd to make sure it gets
>> enabled before CSIPHY tries to enable clocks.
>>
>> Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 1ef26aea3eae..9aea8220d923 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1453,6 +1453,7 @@ static const struct media_device_ops camss_media_ops = {
>>   static int camss_configure_pd(struct camss *camss)
>>   {
>>       struct device *dev = camss->dev;
>> +    int camss_pd_index;
>>       int i;
>>       int ret;
>>   @@ -1496,7 +1497,13 @@ static int camss_configure_pd(struct camss *camss)
>>           }
>>       }
>>   -    if (i > camss->vfe_num) {
>> +    /* Link CAMSS power domain if available */
>> +    camss_pd_index = device_property_match_string(camss->dev, "power-domain-names", "camss");
>> +    if (camss_pd_index >= 0)
>> +        device_link_add(camss->dev, camss->genpd[camss_pd_index], DL_FLAG_STATELESS |
>> +                DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
>> +
>> +    if (i > camss->vfe_num && i != camss_pd_index) {
>>           camss->genpd_link[i - 1] = device_link_add(camss->dev, camss->genpd[i - 1],
>>                                  DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
>>                                  DL_FLAG_RPM_ACTIVE);
> 
> Konrad pointed this out.
> 
> Are you 100% sure you want to do this. We already have a way to count the # of power-domains in camss_configure_pd().
> 
> Your series is now adding a dependency on power-domain-names.
> 
> Is there a good reason to add that dependency ? If not, then lets just take the code from camss_configure_pd() and make it so that it can be used/reused here.
This code contains a whole bunch of hacky counting logic that should have
been substituted with _byname, but now we're stuck with indices to keep
compatibility with old DTs :/

If CAMSS_GDSC (talking about pre-TITAN hw) was a parent of all the other
CAMSS-related GDSCs, we could make it their parent in the clock driver
and call it a day.

Konrad

> 
> ---
> bod
