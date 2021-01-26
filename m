Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF55304709
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730869AbhAZRO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390535AbhAZIpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 03:45:34 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9418EC061756
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 00:44:54 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gx5so21820427ejb.7
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eji12R6gCX6BEtC0hEE+44yMlKnt13zaBvqRPlDNOuc=;
        b=PQoCDVWAVbJM1hi5GLiYL0t3gI53bWAiY2QgADmfc35vPnzuoOhxIkP9UsdEuCA587
         /p5fzyEineh6m2JIkEh1ex0o5AI2hW+JSjtvSxAjwngO0Mwg1ko4EzQGj7n+0fMSpnw7
         pXIAGXVIjAGqsZx4JJ6op25GEVzDBpOuKD0E3WFPxxx9AQmCdHy8IaE+k/jq+ePpWid+
         gE1pEdzkax0axxeJY3ocV1jkJZgtYl2ohGg6CLjWHlhjRg7zbPWv5NDKvoV8EMZu/qOx
         AqfvLiiZN2yOAOll6kala2zOq2xosj+gALGgiKZ5fItjVzYDNNBHINlEaZMbay1aHg5h
         0OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eji12R6gCX6BEtC0hEE+44yMlKnt13zaBvqRPlDNOuc=;
        b=DImUU5Mgn9OfE7Xnyf8/tib03rbI9cEtqC/W0RnMafcX0VFfX0burmU0ChNXA2MbdN
         4LcGA94OYVMExZuYPTdGZonY2kzEb6jPhAUMGFak/tZe1MbreIfZb91M6Y2pc5isaTsM
         zjzvWeJjBWrSaD0cZ2pS1tzPtg1tSxNdCPrnIPBQDQ7a1MOWTVqKU4bzFKfKfoNdnY7/
         tY8ZZiTvY3Y6fUcUNCh7pEDy6B2epNyxwBRVxhfix/JrEqHq1hyhViCuJeGP0Z0sVB5N
         QH5DHWABRlfSUbaNqeoJ/YHhy6luEi+GiAMKGIsB2wHiseOYDyMpATYTONBBggmu+qqg
         rxOA==
X-Gm-Message-State: AOAM533/KQ0EXCq4xksuPevGi3k/01UnWXmzoZNl2SjwkWPNNzOpIM/p
        AFza91MPpmkC+E3+BdHQJH9BxbDm9sNr3sjk
X-Google-Smtp-Source: ABdhPJzV2BuJu8DMCJn/QOuR5oWv0SJ08MU4W2rVgFGMuLKyCmqR6IcDkFoAlIHHx7f8UfKezwsyZg==
X-Received: by 2002:a17:906:dbe7:: with SMTP id yd7mr2843644ejb.242.1611650693279;
        Tue, 26 Jan 2021 00:44:53 -0800 (PST)
Received: from [192.168.0.2] ([84.238.208.206])
        by smtp.googlemail.com with ESMTPSA id h12sm9501891ejf.95.2021.01.26.00.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 00:44:52 -0800 (PST)
Subject: Re: [PATCH 1/2] media: venus: core: Add sdm660 DT compatible and
 resource struct
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-2-angelogioacchino.delregno@somainline.org>
 <2dc8a95f-110f-526f-18a8-6393e508c3a6@linaro.org>
 <eabc91cc-de96-08ef-756c-87fe43d6fadc@somainline.org>
 <cfc1998f-8d9b-5237-f286-7fdc69874b30@xs4all.nl>
 <40c38734-a69d-2314-c342-244ee5a0e6b1@somainline.org>
 <58f76830-7af5-0507-ce3f-2c1cd9b101d1@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0c4cce0b-fdb8-d094-14a5-2ed527afd9da@linaro.org>
Date:   Tue, 26 Jan 2021 10:44:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <58f76830-7af5-0507-ce3f-2c1cd9b101d1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/25/21 5:01 PM, Hans Verkuil wrote:
> On 25/01/2021 15:51, AngeloGioacchino Del Regno wrote:
>> Il 25/01/21 11:40, Hans Verkuil ha scritto:
>>> On 18/01/2021 18:45, AngeloGioacchino Del Regno wrote:
>>>> Il 18/01/21 18:21, Stanimir Varbanov ha scritto:
>>>>> Hi Angelo,
>>>>>
>>>>> Thanks for the patch!
>>>>>
>>>>> On 1/15/21 8:52 PM, AngeloGioacchino Del Regno wrote:
>>>>>> Add the SDM660 DT compatible and its resource structure, also
>>>>>> including support for the Venus pmdomains, in order to support
>>>>>> the Venus block in SDM630, SDM636, SDM660 and SDA variants.
>>>>>>
>>>>>> This SoC features Venus 4.4 (HFI3XX), with one vcodec used for
>>>>>> both encoding and decoding, switched on through two GDSCs.
>>>>>> The core clock for this Venus chip is powered by the RPM VDD_CX
>>>>>> power domain.
>>>>>>
>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>>>> ---
>>>>>>    drivers/media/platform/qcom/venus/core.c | 66 ++++++++++++++++++++++++
>>>>>>    1 file changed, 66 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>>>>> index bdd293faaad0..83ca86a63241 100644
>>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>>> @@ -565,6 +565,71 @@ static const struct venus_resources sdm845_res_v2 = {
>>>>>>    	.fwname = "qcom/venus-5.2/venus.mdt",
>>>>>>    };
>>>>>>    
>>>>>> +static const struct freq_tbl sdm660_freq_table[] = {
>>>>>> +	{ 0, 518400000 },
>>>>>> +	{ 0, 441600000 },
>>>>>> +	{ 0, 404000000 },
>>>>>> +	{ 0, 320000000 },
>>>>>> +	{ 0, 269330000 },
>>>>>> +	{ 0, 133330000 },
>>>>>> +};
>>>>>> +
>>>>>> +static const struct reg_val sdm660_reg_preset[] = {
>>>>>> +	{ 0x80010, 0x001f001f },
>>>>>> +	{ 0x80018, 0x00000156 },
>>>>>> +	{ 0x8001C, 0x00000156 },
>>>>>> +};
>>>>>> +
>>>>>> +static const struct bw_tbl sdm660_bw_table_enc[] = {
>>>>>> +	{  979200,  1044000, 0, 2446336, 0 },	/* 4k UHD @ 30 */
>>>>>> +	{  864000,   887000, 0, 2108416, 0 },	/* 720p @ 240 */
>>>>>> +	{  489600,   666000, 0, 1207296, 0 },	/* 1080p @ 60 */
>>>>>> +	{  432000,   578000, 0, 1058816, 0 },	/* 720p @ 120 */
>>>>>> +	{  244800,   346000, 0,  616448, 0 },	/* 1080p @ 30 */
>>>>>> +	{  216000,   293000, 0,  534528, 0 },	/* 720p @ 60 */
>>>>>> +	{  108000,   151000, 0,  271360, 0 },	/* 720p @ 30 */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct bw_tbl sdm660_bw_table_dec[] = {
>>>>>> +	{  979200,  2365000, 0, 1892000, 0 },	/* 4k UHD @ 30 */
>>>>>> +	{  864000,  1978000, 0, 1554000, 0 },	/* 720p @ 240 */
>>>>>> +	{  489600,  1133000, 0,  895000, 0 },	/* 1080p @ 60 */
>>>>>> +	{  432000,   994000, 0,  781000, 0 },	/* 720p @ 120 */
>>>>>> +	{  244800,   580000, 0,  460000, 0 },	/* 1080p @ 30 */
>>>>>> +	{  216000,   501000, 0,  301000, 0 },	/* 720p @ 60 */
>>>>>> +	{  108000,   255000, 0,  202000, 0 },	/* 720p @ 30 */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct venus_resources sdm660_res = {
>>>>>> +	.freq_tbl = sdm660_freq_table,
>>>>>> +	.freq_tbl_size = ARRAY_SIZE(sdm660_freq_table),
>>>>>> +	.reg_tbl = sdm660_reg_preset,
>>>>>> +	.reg_tbl_size = ARRAY_SIZE(sdm660_reg_preset),
>>>>>> +	.bw_tbl_enc = sdm660_bw_table_enc,
>>>>>> +	.bw_tbl_enc_size = ARRAY_SIZE(sdm660_bw_table_enc),
>>>>>> +	.bw_tbl_dec = sdm660_bw_table_dec,
>>>>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sdm660_bw_table_dec),
>>>>>> +	.clks = {"core", "iface", "bus_throttle", "bus" },
>>>>>> +	.clks_num = 4,
>>>>>> +	.vcodec0_clks = { "vcodec0_core" },
>>>>>> +	.vcodec_clks_num = 1,
>>>>>> +	.vcodec_pmdomains = { "venus", "vcodec0" },
>>>>>> +	.vcodec_pmdomains_num = 2,
>>>>>> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>>>>>> +	.vcodec_num = 1,
>>>>>> +	.max_load = 1036800,
>>>>>> +	.hfi_version = HFI_VERSION_3XX,
>>>>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>>>>> +	.vmem_size = 0,
>>>>>> +	.vmem_addr = 0,
>>>>>> +	.cp_start = 0,
>>>>>> +	.cp_size = 0x79000000,
>>>>>> +	.cp_nonpixel_start = 0x1000000,
>>>>>> +	.cp_nonpixel_size = 0x28000000,
>>>>>> +	.dma_mask = 0xd9000000 - 1,
>>>>>> +	.fwname = "qcom/venus-4.4/venus.mdt",
>>>>>
>>>>> Did you try venus-4.2 firmware from linux-firmware tree [1] ?
>>>>>
>>>>
>>>> No I haven't.. and I can't... my Sony devices (but I think that this is
>>>> a practice of all OEMs/ODMs) are using a Sony signed venus firmware, so
>>>> I am totally limited to use the firmware that comes with the device.
>>>>
>>>> Besides that, the version is still different so, even if I had any
>>>> possibility to try that, I don't think that it would work anyway...
>>
>> Hello!
>>
>>>
>>> I'm a bit confused. "qcom/venus-4.4/venus.mdt" is the Sony signed FW?
>>>
>>
>> In my case it is, but this follows the generic firmware path as was done
>> for all the other Venus firmwares, so my code is not pointing at Sony
>> specific things, but just generic ones.
>>
>> Every Qualcomm-powered consumer device (smartphones, tablets etc) have
>> got a double sigcheck: one for qcom, one for OEM specific and most of
>> the times the TZ is configured to accept only firmwares that also have
>> the OEM signature.
>>
>> This is not true for all the firmwares - for example, Adreno has this
>> mechanism only for the ZAP part - but unfortunately I'm not aware of
>> any consumer device accepting a Venus firmware with the "generic"
>> Qualcomm signature only (so - without the OEM signature).
>>
>> Short answer:
>> 1. qcom/venus-4.4/venus.mdt is a generic firmware for Venus
> 
> So can this FW be made available in the linux-firmware repo? Stanimir?
> 
>> 2. 99% of the people needs a different firmware for signature issues
>>
>>
>>> This patch can't be merged unless there is a corresponding firmware available
>>> in linux-firmware. Is the current 4.2 firmware in linux-firmware signed by
>>> Qualcomm? Can they provided 4.4 firmware as well?
>>>
>>
>> If there is such issue, then maybe we should do "something" about it: I
>> would then propose to remove all references to fwname and just get this
>> done in DT, where every qcom board already specifies its own path for
>> its own firmware.
>>
>> In any case, the issue that you're raising here has been raised multiple
>> times on LKML, I don't precisely remember, but I recall seeing this for
>> something like 4 years (or even more) being raised every now and then...
>>
>>> I have no idea how this works for the venus driver, but I hope Stanimir does.
>>>
>>
>> As far as I've understood, this driver just uses the firmware which
>> path is hardcoded in fwname, even though at this point I would like
>> to get an opinion from Stanimir.
>>
>> Would you be ok if we start parsing firmware-name from DT for this
>> driver? The flow would be something like:
>>
>> Is firmware-name DT property present?
>>     Yes -> Use FW path from firmware-name property
>>     No  -> Use the FW path from the fwname field of struct
>>            venus_resources
>>
>> This is a common flow in at least freedreno and remoteproc (modem).
> 
> I would have no problem with this, but it is up to Stanimir to decide.
> 

I sent a patch for that. Thanks for raising this issue.

-- 
regards,
Stan
