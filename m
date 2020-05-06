Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF89C1C6E57
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 12:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgEFK1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 06:27:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55321 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726354AbgEFK1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 06:27:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588760823; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=UaHLsIvtZJCLGViq44kZyptElJCG7b3oxnJwXQfSAnQ=; b=LFbjXxpmPkLc3ZX37t94Qsb5dgaFutej0C7D/HZX6gzDqZ0+b0bH+hYz/VLyNND8wEGrpwBl
 zFm3ZluMk1MHWIecCA0hayDnHkAVxknZSkcIEenBxYAwxum6v6EFDjtq0njHibIASU4w8ye0
 Q+ZqLVh/yzfO36nR+IgLOv1ektk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb290df.7f3fd56ed420-smtp-out-n03;
 Wed, 06 May 2020 10:26:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D809C43637; Wed,  6 May 2020 10:26:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.199.84] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2733DC433F2;
        Wed,  6 May 2020 10:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2733DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 5/6] media: venus: core: Add support for opp
 tables/perf voting
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
References: <1588507469-31889-1-git-send-email-rnayak@codeaurora.org>
 <1588507469-31889-6-git-send-email-rnayak@codeaurora.org>
 <20200505230702.GX4525@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <8600c770-73bb-a7eb-a754-64c2ed0deccd@codeaurora.org>
Date:   Wed, 6 May 2020 15:56:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505230702.GX4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/6/2020 4:37 AM, Matthias Kaehlcke wrote:
> Hi Rajendra,
> 
> On Sun, May 03, 2020 at 05:34:28PM +0530, Rajendra Nayak wrote:
>> Add support to add OPP tables and perf voting on the OPP powerdomain.
>> This is needed so venus votes on the corresponding performance state
>> for the OPP powerdomain along with setting the core clock rate.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> ---
>>   drivers/media/platform/qcom/venus/core.c       | 28 +++++++++++++
>>   drivers/media/platform/qcom/venus/core.h       |  5 +++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>>   3 files changed, 83 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 194b10b9..6f72e99 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/v4l2-mem2mem.h>
>> @@ -214,6 +215,20 @@ static int venus_probe(struct platform_device *pdev)
>>   	if (!core->pm_ops)
>>   		return -ENODEV;
>>   
>> +	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
>> +	if (IS_ERR(core->opp_table))
>> +		return PTR_ERR(core->opp_table);
>> +
>> +	if (core->res->opp_pmdomain) {
>> +		ret = dev_pm_opp_of_add_table(dev);
>> +		if (!ret) {
>> +			core->has_opp_table = true;
>> +		} else if (ret != -ENODEV) {
>> +			dev_err(dev, "invalid OPP table in device tree\n");
> 
> 			dev_pm_opp_put_clkname(core->opp_table);
> 
> this and removing the OPP table is also needed in other error paths below,
> which currently return directly. Looks like you want to add another label
> to the unwind path.

Thanks for spotting this, I just moved this part around in the previous rev
and did not fix the exit path for subsequent errors.

> 
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	if (core->pm_ops->core_get) {
>>   		ret = core->pm_ops->core_get(dev);
>>   		if (ret)
>> @@ -301,6 +316,9 @@ static int venus_probe(struct platform_device *pdev)
>>   err_venus_shutdown:
>>   	venus_shutdown(core);
>>   err_runtime_disable:
>> +	if (core->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(core->opp_table);
> 
> move this after hfi_destroy(core), to do unwinding in reverse order, it
> also allows to add the new jump label mentioned above.

right, will do.

> 
>>   	pm_runtime_set_suspended(dev);
>>   	pm_runtime_disable(dev);
>>   	hfi_destroy(core);
>> @@ -326,6 +344,10 @@ static int venus_remove(struct platform_device *pdev)
>>   
>>   	venus_firmware_deinit(core);
>>   
>> +	if (core->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(core->opp_table);
>> +
>>   	pm_runtime_put_sync(dev);
>>   	pm_runtime_disable(dev);
>>   
>> @@ -350,6 +372,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Drop the performance state vote */
>> +	if (core->opp_pmdomain)
>> +		dev_pm_opp_set_rate(dev, 0);
>> +
>>   	if (pm_ops->core_power)
>>   		ret = pm_ops->core_power(dev, POWER_OFF);
>>   
>> @@ -511,6 +537,7 @@ static const struct venus_resources sdm845_res_v2 = {
>>   	.vcodec_clks_num = 2,
>>   	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
>>   	.vcodec_pmdomains_num = 3,
>> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
>>   	.vcodec_num = 2,
>>   	.max_load = 3110400,	/* 4096x2160@90 */
>>   	.hfi_version = HFI_VERSION_4XX,
>> @@ -556,6 +583,7 @@ static const struct venus_resources sc7180_res = {
>>   	.vcodec_clks_num = 2,
>>   	.vcodec_pmdomains = { "venus", "vcodec0" },
>>   	.vcodec_pmdomains_num = 2,
>> +	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
> 
> The new power domain needs to be added to the SDM845 and SC7180 bindings.

true, I will add a binding update patch.

> 
>>   	.vcodec_num = 1,
>>   	.hfi_version = HFI_VERSION_4XX,
>>   	.vmem_id = VIDC_RESOURCE_NONE,
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index bd3ac6a..cc1d511 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -62,6 +62,7 @@ struct venus_resources {
>>   	unsigned int vcodec_clks_num;
>>   	const char * const vcodec_pmdomains[VIDC_PMDOMAINS_NUM_MAX];
>>   	unsigned int vcodec_pmdomains_num;
>> +	const char **opp_pmdomain;
>>   	unsigned int vcodec_num;
>>   	enum hfi_version hfi_version;
>>   	u32 max_load;
>> @@ -144,8 +145,12 @@ struct venus_core {
>>   	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
>>   	struct icc_path *video_path;
>>   	struct icc_path *cpucfg_path;
>> +	struct opp_table *opp_table;
>> +	bool has_opp_table;
>>   	struct device_link *pd_dl_venus;
>>   	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
>> +	struct device_link *opp_dl_venus;
>> +	struct device *opp_pmdomain;
>>   	struct video_device *vdev_dec;
>>   	struct video_device *vdev_enc;
>>   	struct v4l2_device v4l2_dev;
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index abf9315..30600bc 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/iopoll.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pm_domain.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/types.h>
>>   #include <media/v4l2-mem2mem.h>
>> @@ -66,10 +67,9 @@ static void core_clks_disable(struct venus_core *core)
>>   
>>   static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
>>   {
>> -	struct clk *clk = core->clks[0];
>>   	int ret;
>>   
>> -	ret = clk_set_rate(clk, freq);
>> +	ret = dev_pm_opp_set_rate(core->dev, freq);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -740,13 +740,16 @@ static int venc_power_v4(struct device *dev, int on)
>>   
>>   static int vcodec_domains_get(struct device *dev)
>>   {
>> +	int ret;
>> +	struct opp_table *opp_table;
>> +	struct device **opp_virt_dev;
>>   	struct venus_core *core = dev_get_drvdata(dev);
>>   	const struct venus_resources *res = core->res;
>>   	struct device *pd;
>>   	unsigned int i;
>>   
>>   	if (!res->vcodec_pmdomains_num)
>> -		return -ENODEV;
>> +		goto skip_pmdomains;
>>   
>>   	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>>   		pd = dev_pm_domain_attach_by_name(dev,
>> @@ -763,7 +766,41 @@ static int vcodec_domains_get(struct device *dev)
>>   	if (!core->pd_dl_venus)
>>   		return -ENODEV;
>>   
>> +skip_pmdomains:
>> +	if (!res->opp_pmdomain || !core->has_opp_table)
> 
> nit: '!res->opp_pmdomain' isn't strictly needed, 'has_opp_table' is always
> false when there is no OPP domain. It's ok if you prefer to keep it.

yup, looks like I can drop the !res->opp_pmdomain check.

> 
>> +		return 0;
>> +
>> +	/* Attach the power domain for setting performance state */
>> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
>> +	if (IS_ERR(opp_table)) {
>> +		ret = PTR_ERR(opp_table);
>> +		goto opp_attach_err;
>> +	} else if (opp_virt_dev) {
> 
> If I read dev_pm_opp_attach_genpd() correctly 'opp_virt_dev' is always
> set unless the function returns an error. If that's correct the condition
> can be removed. Otherwise you probably want to initialize 'opp_virt_dev' to
> NULL, to not rely on dev_pm_opp_attach_genpd() to do it.

The only other condition could be if res->opp_pmdomain is empty, which
again should not happen since we do have a check above, so seems safe
to remove the check perhaps.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
