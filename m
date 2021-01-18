Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE8E2FA801
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 18:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407219AbhARRqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 12:46:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436713AbhARRp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 12:45:57 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52633C061574;
        Mon, 18 Jan 2021 09:45:17 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C11E73EBDE;
        Mon, 18 Jan 2021 18:45:13 +0100 (CET)
Subject: Re: [PATCH 1/2] media: venus: core: Add sdm660 DT compatible and
 resource struct
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
 <20210115185252.333562-2-angelogioacchino.delregno@somainline.org>
 <2dc8a95f-110f-526f-18a8-6393e508c3a6@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <eabc91cc-de96-08ef-756c-87fe43d6fadc@somainline.org>
Date:   Mon, 18 Jan 2021 18:45:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2dc8a95f-110f-526f-18a8-6393e508c3a6@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 18/01/21 18:21, Stanimir Varbanov ha scritto:
> Hi Angelo,
> 
> Thanks for the patch!
> 
> On 1/15/21 8:52 PM, AngeloGioacchino Del Regno wrote:
>> Add the SDM660 DT compatible and its resource structure, also
>> including support for the Venus pmdomains, in order to support
>> the Venus block in SDM630, SDM636, SDM660 and SDA variants.
>>
>> This SoC features Venus 4.4 (HFI3XX), with one vcodec used for
>> both encoding and decoding, switched on through two GDSCs.
>> The core clock for this Venus chip is powered by the RPM VDD_CX
>> power domain.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/media/platform/qcom/venus/core.c | 66 ++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index bdd293faaad0..83ca86a63241 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -565,6 +565,71 @@ static const struct venus_resources sdm845_res_v2 = {
>>   	.fwname = "qcom/venus-5.2/venus.mdt",
>>   };
>>   
>> +static const struct freq_tbl sdm660_freq_table[] = {
>> +	{ 0, 518400000 },
>> +	{ 0, 441600000 },
>> +	{ 0, 404000000 },
>> +	{ 0, 320000000 },
>> +	{ 0, 269330000 },
>> +	{ 0, 133330000 },
>> +};
>> +
>> +static const struct reg_val sdm660_reg_preset[] = {
>> +	{ 0x80010, 0x001f001f },
>> +	{ 0x80018, 0x00000156 },
>> +	{ 0x8001C, 0x00000156 },
>> +};
>> +
>> +static const struct bw_tbl sdm660_bw_table_enc[] = {
>> +	{  979200,  1044000, 0, 2446336, 0 },	/* 4k UHD @ 30 */
>> +	{  864000,   887000, 0, 2108416, 0 },	/* 720p @ 240 */
>> +	{  489600,   666000, 0, 1207296, 0 },	/* 1080p @ 60 */
>> +	{  432000,   578000, 0, 1058816, 0 },	/* 720p @ 120 */
>> +	{  244800,   346000, 0,  616448, 0 },	/* 1080p @ 30 */
>> +	{  216000,   293000, 0,  534528, 0 },	/* 720p @ 60 */
>> +	{  108000,   151000, 0,  271360, 0 },	/* 720p @ 30 */
>> +};
>> +
>> +static const struct bw_tbl sdm660_bw_table_dec[] = {
>> +	{  979200,  2365000, 0, 1892000, 0 },	/* 4k UHD @ 30 */
>> +	{  864000,  1978000, 0, 1554000, 0 },	/* 720p @ 240 */
>> +	{  489600,  1133000, 0,  895000, 0 },	/* 1080p @ 60 */
>> +	{  432000,   994000, 0,  781000, 0 },	/* 720p @ 120 */
>> +	{  244800,   580000, 0,  460000, 0 },	/* 1080p @ 30 */
>> +	{  216000,   501000, 0,  301000, 0 },	/* 720p @ 60 */
>> +	{  108000,   255000, 0,  202000, 0 },	/* 720p @ 30 */
>> +};
>> +
>> +static const struct venus_resources sdm660_res = {
>> +	.freq_tbl = sdm660_freq_table,
>> +	.freq_tbl_size = ARRAY_SIZE(sdm660_freq_table),
>> +	.reg_tbl = sdm660_reg_preset,
>> +	.reg_tbl_size = ARRAY_SIZE(sdm660_reg_preset),
>> +	.bw_tbl_enc = sdm660_bw_table_enc,
>> +	.bw_tbl_enc_size = ARRAY_SIZE(sdm660_bw_table_enc),
>> +	.bw_tbl_dec = sdm660_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sdm660_bw_table_dec),
>> +	.clks = {"core", "iface", "bus_throttle", "bus" },
>> +	.clks_num = 4,
>> +	.vcodec0_clks = { "vcodec0_core" },
>> +	.vcodec_clks_num = 1,
>> +	.vcodec_pmdomains = { "venus", "vcodec0" },
>> +	.vcodec_pmdomains_num = 2,
>> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>> +	.vcodec_num = 1,
>> +	.max_load = 1036800,
>> +	.hfi_version = HFI_VERSION_3XX,
>> +	.vmem_id = VIDC_RESOURCE_NONE,
>> +	.vmem_size = 0,
>> +	.vmem_addr = 0,
>> +	.cp_start = 0,
>> +	.cp_size = 0x79000000,
>> +	.cp_nonpixel_start = 0x1000000,
>> +	.cp_nonpixel_size = 0x28000000,
>> +	.dma_mask = 0xd9000000 - 1,
>> +	.fwname = "qcom/venus-4.4/venus.mdt",
> 
> Did you try venus-4.2 firmware from linux-firmware tree [1] ?
> 

No I haven't.. and I can't... my Sony devices (but I think that this is
a practice of all OEMs/ODMs) are using a Sony signed venus firmware, so
I am totally limited to use the firmware that comes with the device.

Besides that, the version is still different so, even if I had any
possibility to try that, I don't think that it would work anyway...

>> +};
>> +
>>   static const struct freq_tbl sc7180_freq_table[] = {
>>   	{  0, 500000000 },
>>   	{  0, 434000000 },
>> @@ -613,6 +678,7 @@ static const struct venus_resources sc7180_res = {
>>   static const struct of_device_id venus_dt_match[] = {
>>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>> +	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>   	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>>
> 
> Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 

Thank you!
- Angelo
