Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBFC25C889
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 06:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbfGBEzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 00:55:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59084 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfGBEzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 00:55:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1011C607DF; Tue,  2 Jul 2019 04:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043317;
        bh=w2sF8iXgWePj2bNStHqCTNJzfLmiRY0Z8xqYXe5ILcc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=geX8AWtPOHKzOp4/C9uWfvk43VlA+2swZ6AIc/pDDvgEMOAyWX4WyIcXaK3zGAj5b
         Hx+vcgC1WSlwF2440aH11gRKDiN+M09cAroISbVNB61tMRBK3JEbCdZUrUTSSHH7ef
         Rz+C1IxjL3KZxcIYeVROduJw++EMQmChTi3iPWxg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 3E31960388;
        Tue,  2 Jul 2019 04:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043316;
        bh=w2sF8iXgWePj2bNStHqCTNJzfLmiRY0Z8xqYXe5ILcc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=i6vbQWhWOovelmJu+BwntQQEmQYWjwsiNY7cniohWV5FcqqJrAEe1a/R76uYKMAQy
         omb+C2Nkv3eqdBIonEQOQoc3i5jg/xwhzDRL5gn4RbKThcP7tjUoCQ4v6BMtJeAh5B
         mPlpab9kSH5GNWODV1fgAq77rw3DN/gMuX2IGEUI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jul 2019 10:25:16 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v3 1/4] media: venus: Add codec data table
In-Reply-To: <d7558a12-8c38-0c91-3cea-cc3b7604b7de@linaro.org>
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
 <1561480044-11834-2-git-send-email-amasule@codeaurora.org>
 <d7558a12-8c38-0c91-3cea-cc3b7604b7de@linaro.org>
Message-ID: <2e137feb1ece7261939e3ac4901e8255@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-01 17:13, Stanimir Varbanov wrote:
> On 6/25/19 7:27 PM, Aniket Masule wrote:
>> Add vpp cycles for for different types of codec
>> It indicates the cycles required by video hardware
>> to process each macroblock. Initialize the codec
>> data with core resources.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c    | 13 +++++++++++++
>>  drivers/media/platform/qcom/venus/core.h    | 15 +++++++++++++++
>>  drivers/media/platform/qcom/venus/helpers.c | 30 
>> +++++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/venus/helpers.h |  1 +
>>  drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
>>  drivers/media/platform/qcom/venus/venc.c    |  4 ++++
>>  6 files changed, 67 insertions(+)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index 7393667..f1597d6 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -473,9 +473,22 @@ static __maybe_unused int 
>> venus_runtime_resume(struct device *dev)
>>  	{  244800, 100000000 },	/* 1920x1080@30 */
>>  };
>> 
>> +static struct codec_freq_data sdm845_codec_freq_data[] =  {
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
>> +	.codec_freq_data = sdm845_codec_freq_data,
>> +	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>>  	.clks = {"core", "iface", "bus" },
>>  	.clks_num = 3,
>>  	.max_load = 2563200,
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index 7a3feb5..2ed6496 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -35,12 +35,20 @@ struct reg_val {
>>  	u32 value;
>>  };
>> 
>> +struct codec_freq_data {
>> +	u32 pixfmt;
>> +	u32 session_type;
>> +	unsigned int vpp_freq;
> 
> isn't unsigned long more suitable?
> 
The hard-coded values for this vpp will be in few hundreds.
So, unsigned int would be fine.
>> +};
>> +
>>  struct venus_resources {
>>  	u64 dma_mask;
>>  	const struct freq_tbl *freq_tbl;
>>  	unsigned int freq_tbl_size;
>>  	const struct reg_val *reg_tbl;
>>  	unsigned int reg_tbl_size;
>> +	const struct codec_freq_data *codec_freq_data;
>> +	unsigned int codec_freq_data_size;
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
>> +	struct codec_freq_data *codec_freq_data;
>> +};
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
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 5cad601..f7f724b 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -715,6 +715,36 @@ int venus_helper_set_core_usage(struct venus_inst 
>> *inst, u32 usage)
>>  }
>>  EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>> 
>> +int venus_helper_init_codec_data(struct venus_inst *inst)
>> +{
>> +	const struct codec_data *codec_data;
> 
> Something is wrong here, there is no prototype of struct codec_data.
Something went wrong during git rebase, will correct this.


Regards,
Aniket
