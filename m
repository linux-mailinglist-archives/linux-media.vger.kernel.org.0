Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 582C41293EF
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2019 11:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWKEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Dec 2019 05:04:49 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:24059 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726233AbfLWKEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Dec 2019 05:04:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577095487; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O5mBrUc9Gs8AbX+fg0tFlrKjAwTzQVOduOeFrwJqWhk=;
 b=hnsstUYZm1dEXNwEi6e5tXmm1g2sPS/eCCDuu/zii286PKyNIkfxxdTMtlCAwQlKxWIL3C25
 a7IwPAAkgVgCOt/UL/lbMM7tCpZv5k7g++kh7oCARuwDlqT2LYcci7v5h0NEicoUtpzOJ5sG
 0gBrB0JtSqznxr2BOeJ7kjHzrLM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e00913e.7f13296c1b90-smtp-out-n01;
 Mon, 23 Dec 2019 10:04:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30003C433A2; Mon, 23 Dec 2019 10:04:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BEB0C43383;
        Mon, 23 Dec 2019 10:04:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 15:34:45 +0530
From:   dikshita@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH 3/3] venus: core: add sc7180 DT compatible and resource
 struct
In-Reply-To: <b1b5ee06-bc39-cfc0-b2c8-8073f8857fde@linaro.org>
References: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
 <1576828760-13176-4-git-send-email-dikshita@codeaurora.org>
 <b1b5ee06-bc39-cfc0-b2c8-8073f8857fde@linaro.org>
Message-ID: <98c83352cae3a5e38a3711f81dc28df5@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

Thanks for the review!

On 2019-12-20 15:03, Stanimir Varbanov wrote:
> Hi Dikshita,
> 
> Thanks for the patch!
> 
> On 12/20/19 9:59 AM, Dikshita Agarwal wrote:
>> This add DT compatible string and resource structure for sc7180.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 58 
>> +++++++++++++++++++++++++++++++-
>>  1 file changed, 57 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index c7525d9..e8c8b28 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -469,7 +469,7 @@ static __maybe_unused int 
>> venus_runtime_resume(struct device *dev)
>>  	{ 2073600, 3929000, 0, 5551000, 0 },	/* 4096x2160@60 */
>>  	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
>>  	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
>> -	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
>> +	{  244800,  442000, 0,  659000, 0 },	/* 1920x1080@30 */
> 
> unrelated change, please drop it
Sure, I will address this in next version.
> 
>>  };
>> 
>>  static const struct venus_resources sdm845_res = {
>> @@ -521,11 +521,67 @@ static __maybe_unused int 
>> venus_runtime_resume(struct device *dev)
>>  	.fwname = "qcom/venus-5.2/venus.mdt",
>>  };
>> 
>> +static const struct freq_tbl sc7180_freq_table[] = {
>> +	{  0, 380000000 },
>> +	{  0, 340000000 },
>> +	{  0, 270000000 },
>> +	{  0, 150000000 },
> 
> why .load is zero?
.load is not being used any longer to calculate load and is a dummy 
value.
So keeping it 0.

> 
>> +};
>> +
>> +static struct codec_freq_data sc7180_codec_freq_data[] =  {
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +};
> 
> the table is exactly the same as sdm845 one, please reuse it.
Sure, I will address this in next version.
> 
>> +
>> +static const struct bw_tbl sc7180_bw_table_enc[] = {
>> +	{  972000,  750000, 0, 0, 0 },	/* 3840x2160@30 */
>> +	{  489600,  451000, 0, 0, 0 },	/* 1920x1080@60 */
>> +	{  244800,  234000, 0, 0, 0 },	/* 1920x1080@30 */
>> +};
>> +
>> +static const struct bw_tbl sc7180_bw_table_dec[] = {
>> +	{ 1036800, 1386000, 0, 1875000, 0 },	/* 4096x2160@30 */
>> +	{  489600,  865000, 0, 1146000, 0 },	/* 1920x1080@60 */
>> +	{  244800,  530000, 0,  583000, 0 },	/* 1920x1080@30 */
>> +};
>> +
>> +static const struct venus_resources sc7180_res = {
>> +	.freq_tbl = sc7180_freq_table,
>> +	.freq_tbl_size = ARRAY_SIZE(sc7180_freq_table),
>> +	.bw_tbl_enc = sc7180_bw_table_enc,
>> +	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
>> +	.bw_tbl_dec = sc7180_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
>> +	.codec_freq_data = sc7180_codec_freq_data,
>> +	.codec_freq_data_size = ARRAY_SIZE(sc7180_codec_freq_data),
>> +	.clks = {"core", "iface", "bus" },
>> +	.clks_num = 3,
>> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
>> +	.vcodec_clks_num = 2,
>> +	.vcodec_pmdomains = { "venus", "vcodec0" },
>> +	.vcodec_pmdomains_num = 2,
>> +	.vcodec_num = 1,
>> +	.max_load = 3110400,	/* 4096x2160@90 */
> 
> Looking into above bandwidth tables I can guess that the maximimum load
> is reached at 4096x2160@30? If so you have to change it here.

After checking further on this I see that max_load can be removed since
it is not being used now to determine if H/W is overloaded or not.
What do you suggest?
> 
> <cut>
