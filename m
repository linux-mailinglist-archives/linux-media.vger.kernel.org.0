Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A0E3048AD
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388437AbhAZFo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:29 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41497 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727527AbhAYKoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 05:44:15 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3zIdlTG1UiWRg3zIglfwSD; Mon, 25 Jan 2021 11:40:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611571251; bh=s3QZt++3CI0A5wvLqKyK0CtL2x0R4G1sMDc99hjaLQ4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rZ+IlOyqzB7JMg4VTO8qd/+RwewVIaFAKbor7bLIym4IFKfUReLfDs1EMN1us85CS
         FvTksenzg2/rmMljQz3+hfWvBYkGKffHSYA473m9i15pkp0166ItP9qf0PsyDDeEHN
         YQSghW2gZ21IMyjbtx3IapgK+OAwRXVnC7qQCCV3ZCaxP1xH+4MLQGJkXbVsFcpfX/
         e9WHXaHUDoysUSpJNbGG0bQfSLm3PJyTCSST6s7/F+/yTbH/Nqx4GMQA8amtRfASTn
         fyvGvlXgtC3UkKVSuqwZIMIfMp9os7+iUjV8qxGRYPojWfXjUNSr+2vT9hwjJEHs6z
         uvtC6Xymw+Tig==
Subject: Re: [PATCH 1/2] media: venus: core: Add sdm660 DT compatible and
 resource struct
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-2-angelogioacchino.delregno@somainline.org>
 <2dc8a95f-110f-526f-18a8-6393e508c3a6@linaro.org>
 <eabc91cc-de96-08ef-756c-87fe43d6fadc@somainline.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cfc1998f-8d9b-5237-f286-7fdc69874b30@xs4all.nl>
Date:   Mon, 25 Jan 2021 11:40:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eabc91cc-de96-08ef-756c-87fe43d6fadc@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCqz0evgKVotePnsCokWrF5dG7lxrkLaVMWwSPa/i/tgineJVMYuGpipFITOjzGLjbSPom8RHRC6xVlYRnG2fXhA9/kwL6o2cT7TexnGdWaNnV/X37Yv
 0mIXC0vaPDmyCR1ibq6Jz6gcpCLg9u5E6p3br7OQmFrwBqfBXLhaWATFGjtvy7J20QSqTpG6srzefZXyltNn5MGmXveYfSTq/G025/cYxFWLJAL0PLy/JhPD
 7L4PhPK4b44BUvCpp33dz3sIX4AIdnbWrNBLRsPoSmsr0u+dcSeTCh/AF9x8jAIUyYPzH045u2cM2sKYB16CGOLpvxO0riOP+LGSMxcq0f+aTpi5pYGafI6X
 EzkJuOeHRK0dzmmqGm61DCIOGVlJifgz4Go9J4N0GaTlLsb9twGno2BmAtZukwY20mWwNbdIl0L7vzsQkK8G9TUhvqsiZaI0kiqsXc0z8StWwUcSaou6jvnF
 XiXm5Kw39lTLDuIdJj3qujaZQbk6h7uy/c1E72FwucUsirUx5bvzZNm8AlU2RCyWhqVT3f4GkwE9Bji91zLlL02eiOPOeMCMJu3m7Ycl9yZjdV7EGQb7mxGe
 xmz2m/dPgY++XKqgIifi5vSBukWKgModXHAsTpQI5zCtWY+FNN7xUA5twwzvTdBlhNBuN61XAvAh0Lsy+wVZYlge
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/01/2021 18:45, AngeloGioacchino Del Regno wrote:
> Il 18/01/21 18:21, Stanimir Varbanov ha scritto:
>> Hi Angelo,
>>
>> Thanks for the patch!
>>
>> On 1/15/21 8:52 PM, AngeloGioacchino Del Regno wrote:
>>> Add the SDM660 DT compatible and its resource structure, also
>>> including support for the Venus pmdomains, in order to support
>>> the Venus block in SDM630, SDM636, SDM660 and SDA variants.
>>>
>>> This SoC features Venus 4.4 (HFI3XX), with one vcodec used for
>>> both encoding and decoding, switched on through two GDSCs.
>>> The core clock for this Venus chip is powered by the RPM VDD_CX
>>> power domain.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>> ---
>>>   drivers/media/platform/qcom/venus/core.c | 66 ++++++++++++++++++++++++
>>>   1 file changed, 66 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index bdd293faaad0..83ca86a63241 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -565,6 +565,71 @@ static const struct venus_resources sdm845_res_v2 = {
>>>   	.fwname = "qcom/venus-5.2/venus.mdt",
>>>   };
>>>   
>>> +static const struct freq_tbl sdm660_freq_table[] = {
>>> +	{ 0, 518400000 },
>>> +	{ 0, 441600000 },
>>> +	{ 0, 404000000 },
>>> +	{ 0, 320000000 },
>>> +	{ 0, 269330000 },
>>> +	{ 0, 133330000 },
>>> +};
>>> +
>>> +static const struct reg_val sdm660_reg_preset[] = {
>>> +	{ 0x80010, 0x001f001f },
>>> +	{ 0x80018, 0x00000156 },
>>> +	{ 0x8001C, 0x00000156 },
>>> +};
>>> +
>>> +static const struct bw_tbl sdm660_bw_table_enc[] = {
>>> +	{  979200,  1044000, 0, 2446336, 0 },	/* 4k UHD @ 30 */
>>> +	{  864000,   887000, 0, 2108416, 0 },	/* 720p @ 240 */
>>> +	{  489600,   666000, 0, 1207296, 0 },	/* 1080p @ 60 */
>>> +	{  432000,   578000, 0, 1058816, 0 },	/* 720p @ 120 */
>>> +	{  244800,   346000, 0,  616448, 0 },	/* 1080p @ 30 */
>>> +	{  216000,   293000, 0,  534528, 0 },	/* 720p @ 60 */
>>> +	{  108000,   151000, 0,  271360, 0 },	/* 720p @ 30 */
>>> +};
>>> +
>>> +static const struct bw_tbl sdm660_bw_table_dec[] = {
>>> +	{  979200,  2365000, 0, 1892000, 0 },	/* 4k UHD @ 30 */
>>> +	{  864000,  1978000, 0, 1554000, 0 },	/* 720p @ 240 */
>>> +	{  489600,  1133000, 0,  895000, 0 },	/* 1080p @ 60 */
>>> +	{  432000,   994000, 0,  781000, 0 },	/* 720p @ 120 */
>>> +	{  244800,   580000, 0,  460000, 0 },	/* 1080p @ 30 */
>>> +	{  216000,   501000, 0,  301000, 0 },	/* 720p @ 60 */
>>> +	{  108000,   255000, 0,  202000, 0 },	/* 720p @ 30 */
>>> +};
>>> +
>>> +static const struct venus_resources sdm660_res = {
>>> +	.freq_tbl = sdm660_freq_table,
>>> +	.freq_tbl_size = ARRAY_SIZE(sdm660_freq_table),
>>> +	.reg_tbl = sdm660_reg_preset,
>>> +	.reg_tbl_size = ARRAY_SIZE(sdm660_reg_preset),
>>> +	.bw_tbl_enc = sdm660_bw_table_enc,
>>> +	.bw_tbl_enc_size = ARRAY_SIZE(sdm660_bw_table_enc),
>>> +	.bw_tbl_dec = sdm660_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sdm660_bw_table_dec),
>>> +	.clks = {"core", "iface", "bus_throttle", "bus" },
>>> +	.clks_num = 4,
>>> +	.vcodec0_clks = { "vcodec0_core" },
>>> +	.vcodec_clks_num = 1,
>>> +	.vcodec_pmdomains = { "venus", "vcodec0" },
>>> +	.vcodec_pmdomains_num = 2,
>>> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>>> +	.vcodec_num = 1,
>>> +	.max_load = 1036800,
>>> +	.hfi_version = HFI_VERSION_3XX,
>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>> +	.vmem_size = 0,
>>> +	.vmem_addr = 0,
>>> +	.cp_start = 0,
>>> +	.cp_size = 0x79000000,
>>> +	.cp_nonpixel_start = 0x1000000,
>>> +	.cp_nonpixel_size = 0x28000000,
>>> +	.dma_mask = 0xd9000000 - 1,
>>> +	.fwname = "qcom/venus-4.4/venus.mdt",
>>
>> Did you try venus-4.2 firmware from linux-firmware tree [1] ?
>>
> 
> No I haven't.. and I can't... my Sony devices (but I think that this is
> a practice of all OEMs/ODMs) are using a Sony signed venus firmware, so
> I am totally limited to use the firmware that comes with the device.
> 
> Besides that, the version is still different so, even if I had any
> possibility to try that, I don't think that it would work anyway...

I'm a bit confused. "qcom/venus-4.4/venus.mdt" is the Sony signed FW?

This patch can't be merged unless there is a corresponding firmware available
in linux-firmware. Is the current 4.2 firmware in linux-firmware signed by
Qualcomm? Can they provided 4.4 firmware as well?

I have no idea how this works for the venus driver, but I hope Stanimir does.

Regards,

	Hans

> 
>>> +};
>>> +
>>>   static const struct freq_tbl sc7180_freq_table[] = {
>>>   	{  0, 500000000 },
>>>   	{  0, 434000000 },
>>> @@ -613,6 +678,7 @@ static const struct venus_resources sc7180_res = {
>>>   static const struct of_device_id venus_dt_match[] = {
>>>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>> +	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>>>
>>
>> Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>
> 
> Thank you!
> - Angelo
> 

