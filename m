Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4812B4C917
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731205AbfFTIMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:12:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43550 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfFTIMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:12:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4B66B60A24; Thu, 20 Jun 2019 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561018319;
        bh=dvU4ajc5X9Scc24IFrnqiFqzqsUgEwHjZnNW7TXMMe0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A8a0vgs6wuLOa5DhlPnxpcrazX1vxYuDRWrWSzkLd/06sm6s0ntsxwPyafsFlNtE1
         yvx0wDhjvPUbLyRKkz8WAC455jLiKdwrUt+InOQtH+AuJGDg1BHmuNl35HJripnOoK
         1PpwxglLi7dbuMM0Cxh0rbtbGEbgvfaFSn5tItEA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 74195606FC;
        Thu, 20 Jun 2019 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561018318;
        bh=dvU4ajc5X9Scc24IFrnqiFqzqsUgEwHjZnNW7TXMMe0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mIpVAMaCbF25A6O5Q2W1kSuhBfKw9/MFQrVxSXyN/4+hEcaHJmGfVgMbYhyOJHTGN
         vVy6Ry5XkWEDNXqJzuNJJJo6ilp4QfaK3WCarKedHJ8LktQ0AqzwV8Ny5d2PYK1Rcd
         hdNpDqhM6Al521NWNQd3so6Ql+LwK98volxYAqXI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Jun 2019 13:41:58 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH 1/5] media: venus: Add codec data table
In-Reply-To: <bc6035d8-2688-f79a-068e-bf6630dd65ef@linaro.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-2-git-send-email-amasule@codeaurora.org>
 <bc6035d8-2688-f79a-068e-bf6630dd65ef@linaro.org>
Message-ID: <cc674c104d0f7bc9007285efd67e8885@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-06-17 14:07, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 6/11/19 9:05 AM, Aniket Masule wrote:
>> Add vpp cycles for for different types of codec
>> It indicates the cycles required by video hardware
>> to process each macroblock.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 13 +++++++++++++
>>  drivers/media/platform/qcom/venus/core.h | 15 +++++++++++++++
>>  2 files changed, 28 insertions(+)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index 7393667..43eb446 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -473,9 +473,22 @@ static __maybe_unused int 
>> venus_runtime_resume(struct device *dev)
>>  	{  244800, 100000000 },	/* 1920x1080@30 */
>>  };
>> 
>> +static struct codec_data sdm845_codec_data[] =  {
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
>> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
>> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
>> +};
>> +
>>  static const struct venus_resources sdm845_res = {
>>  	.freq_tbl = sdm845_freq_table,
>>  	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
>> +	.codec_data = sdm845_codec_data,
>> +	.codec_data_size = ARRAY_SIZE(sdm845_codec_data),
>>  	.clks = {"core", "iface", "bus" },
>>  	.clks_num = 3,
>>  	.max_load = 2563200,
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index 7a3feb5..b1a9b43 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -35,12 +35,20 @@ struct reg_val {
>>  	u32 value;
>>  };
>> 
>> +struct codec_data {
> 
> The name is very generic, could you rename the structure to something
> like vpp_cycles_data?
> 
I will be adding vsp_cycles with next patch for bitrate based clock 
scaling.
So, I could rename it to codec_cycles_data.

>> +u32 pixfmt;
>> +u32 session_type;
>> +int vpp_cycles;
> 
> please check your editor, those fields should have a tab to the right.
> 
>> +};
>> +
>>  struct venus_resources {
>>  	u64 dma_mask;
>>  	const struct freq_tbl *freq_tbl;
>>  	unsigned int freq_tbl_size;
>>  	const struct reg_val *reg_tbl;
>>  	unsigned int reg_tbl_size;
>> +	const struct codec_data *codec_data;
>> +	unsigned int codec_data_size;
>>  	const char * const clks[VIDC_CLKS_NUM_MAX];
>>  	unsigned int clks_num;
>>  	enum hfi_version hfi_version;
>> @@ -216,6 +224,12 @@ struct venus_buffer {
>>  	struct list_head ref_list;
>>  };
>> 
>> +struct clock_data {
>> +	u32 core_id;
>> +	unsigned long freq;
> 
> I cannot see how this 'freq' structure field is used? I can see that 
> you
> fill it in 3/5 patch but you don't used nowhere.
> 
Yes Stan, I will remove 'freq' from clock data structure.

>> +	struct codec_data *codec_data;
>> +};
> 
> Having the fact that freq field seems not needed can we just merge the
> fields in venus_inst structure?
> 
I will be adding 'freq' with next patch for bitrate based clock scaling.
So, it would be easier if we maintain separate structure from this 
patch.
>> +
>>  #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, 
>> vb)
>> 
>>  /**
>> @@ -275,6 +289,7 @@ struct venus_inst {
>>  	struct list_head list;
>>  	struct mutex lock;
>>  	struct venus_core *core;
>> +	struct clock_data clk_data;
>>  	struct list_head dpbbufs;
>>  	struct list_head internalbufs;
>>  	struct list_head registeredbufs;
>> 
