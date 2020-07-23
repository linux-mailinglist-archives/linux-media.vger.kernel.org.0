Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197B622ADD7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 13:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgGWLhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 07:37:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36415 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728408AbgGWLhL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 07:37:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595504230; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=m8+Ccr2nbe6itc9Lt2ql+DU4+nUx1iLxiVzOvrYWN4c=; b=Vt6rHfQQMpWS3qoQkE72FaAFofIMDcHQp18du5NbUj2nWY+/JdSM3tJfTl60aQg+tTJ46VAU
 qqp3a8ZnQ/0VWrrLZsSKlTkHFNKhqTgFxMVva7Nzug7Y6vweRhecUPJlDDgDeE1LjcFMeXPe
 gFSIGYlQ/qtwZvIvGWvu2v3V1O8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f1976663dbcb593a93701d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 11:37:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DFB4C433B1; Thu, 23 Jul 2020 11:37:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.12] (unknown [117.247.20.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61C7CC433CB;
        Thu, 23 Jul 2020 11:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61C7CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 2/4] media: venus: core: Add support for opp
 tables/perf voting
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
References: <1595228842-9826-1-git-send-email-rnayak@codeaurora.org>
 <1595228842-9826-3-git-send-email-rnayak@codeaurora.org>
 <840e20b6-186f-14c2-b0f0-fac7b61f1c50@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <d68a0fbe-a2ce-80fc-b550-f8bc37332ae0@codeaurora.org>
Date:   Thu, 23 Jul 2020 17:07:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <840e20b6-186f-14c2-b0f0-fac7b61f1c50@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Stan,

On 7/22/2020 1:57 PM, Stanimir Varbanov wrote:
> Hi Rajendra,
> 
> Thanks for the patch!
> 
> Sorry for last minute comments.

Thanks for reviewing the patch, I have addressed all your
review feedback from below and repostd a v4 now [1]

cheers,
Rajendra

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=454732

> 
> On 7/20/20 10:07 AM, Rajendra Nayak wrote:
>> Add support to add OPP tables and perf voting on the OPP powerdomain.
>> This is needed so venus votes on the corresponding performance state
>> for the OPP powerdomain along with setting the core clock rate.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>   drivers/media/platform/qcom/venus/core.c       | 43 +++++++++++++++++---
>>   drivers/media/platform/qcom/venus/core.h       |  5 +++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>>   3 files changed, 92 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 203c653..b9f61a6 100644
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
>> @@ -216,21 +217,37 @@ static int venus_probe(struct platform_device *pdev)
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
>> +			return ret;
>> +		}
>> +	}
>> +
> 
> Can we move those dev_pm_opp_xxx invocations into pm_ops->core_get where
> the other pmdomains are? The pm_ops abstarction is created exactly for
> such pm and clks manipulations.
> 
>>   	if (core->pm_ops->core_get) {
>>   		ret = core->pm_ops->core_get(dev);
>>   		if (ret)
>> -			return ret;
>> +			goto err_opp_cleanup;
>>   	}
>>   
>>   	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>>   	if (ret)
>> -		return ret;
>> +		goto err_opp_cleanup;
>>   
>>   	if (!dev->dma_parms) {
>>   		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>>   					      GFP_KERNEL);
>> -		if (!dev->dma_parms)
>> -			return -ENOMEM;
>> +		if (!dev->dma_parms) {
>> +			ret = -ENOMEM;
>> +			goto err_opp_cleanup;
>> +		}
>>   	}
>>   	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>>   
>> @@ -242,11 +259,11 @@ static int venus_probe(struct platform_device *pdev)
>>   					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>>   					"venus", core);
>>   	if (ret)
>> -		return ret;
>> +		goto err_opp_cleanup;
>>   
>>   	ret = hfi_create(core, &venus_core_ops);
>>   	if (ret)
>> -		return ret;
>> +		goto err_opp_cleanup;
>>   
>>   	pm_runtime_enable(dev);
>>   
>> @@ -302,6 +319,10 @@ static int venus_probe(struct platform_device *pdev)
>>   	pm_runtime_set_suspended(dev);
>>   	pm_runtime_disable(dev);
>>   	hfi_destroy(core);
>> +err_opp_cleanup:
>> +	if (core->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(core->opp_table);
> 
> this also belongs to pm_ops->core_put but it is missing in the .probe
> error path.
> 
> +	if (core->pm_ops->core_put)
> +		core->pm_ops->core_put(dev);
> 
> above addition should be separate patch I guess.
> 
>>   	return ret;
>>   }
>>   
>> @@ -326,6 +347,10 @@ static int venus_remove(struct platform_device *pdev)
>>   	pm_runtime_put_sync(dev);
>>   	pm_runtime_disable(dev);
>>   
>> +	if (core->has_opp_table)
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(core->opp_table);
>> +
> 
> those also should be moved to core_put
> 
>>   	if (pm_ops->core_put)
>>   		pm_ops->core_put(dev);
>>   
>> @@ -355,6 +380,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	/* Drop the performance state vote */
>> +	if (core->opp_pmdomain)
>> +		dev_pm_opp_set_rate(dev, 0);
>> +
> 
> move this in core_power(OFF)
> 
>>   	if (pm_ops->core_power)
>>   		ret = pm_ops->core_power(dev, POWER_OFF);
>>   
>> @@ -520,6 +549,7 @@ static const struct venus_resources sdm845_res_v2 = {
>>   	.vcodec_clks_num = 2,
>>   	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
>>   	.vcodec_pmdomains_num = 3,
>> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>>   	.vcodec_num = 2,
>>   	.max_load = 3110400,	/* 4096x2160@90 */
>>   	.hfi_version = HFI_VERSION_4XX,
>> @@ -565,6 +595,7 @@ static const struct venus_resources sc7180_res = {
>>   	.vcodec_clks_num = 2,
>>   	.vcodec_pmdomains = { "venus", "vcodec0" },
>>   	.vcodec_pmdomains_num = 2,
>> +	.opp_pmdomain = (const char *[]) { "cx", NULL },
>>   	.vcodec_num = 1,
>>   	.hfi_version = HFI_VERSION_4XX,
>>   	.vmem_id = VIDC_RESOURCE_NONE,
>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>> index 7118612..b0cc544 100644
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
>> @@ -145,8 +146,12 @@ struct venus_core {
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
>> index abf9315..4149ab8 100644
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
>> +	if (!core->has_opp_table)
>> +		return 0;
>> +
>> +	/* Attach the power domain for setting performance state */
>> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
>> +	if (IS_ERR(opp_table)) {
>> +		ret = PTR_ERR(opp_table);
>> +		goto opp_attach_err;
>> +	}
>> +
>> +	core->opp_pmdomain = *opp_virt_dev;
>> +	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
>> +					     DL_FLAG_RPM_ACTIVE |
>> +					     DL_FLAG_PM_RUNTIME |
>> +					     DL_FLAG_STATELESS);
>> +	if (!core->opp_dl_venus) {
>> +		ret = -ENODEV;
>> +		goto opp_dl_add_err;
>> +	}
>> +
>>   	return 0;
>> +
>> +opp_dl_add_err:
>> +	dev_pm_domain_detach(core->opp_pmdomain, true);
>> +opp_attach_err:
>> +	if (core->pd_dl_venus) {
>> +		device_link_del(core->pd_dl_venus);
>> +		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
>> +			if (IS_ERR_OR_NULL(core->pmdomains[i]))
>> +				continue;
>> +			dev_pm_domain_detach(core->pmdomains[i], true);
>> +		}
>> +	}
>> +	return ret;
>>   }
>>   
>>   static void vcodec_domains_put(struct device *dev)
>> @@ -773,7 +810,7 @@ static void vcodec_domains_put(struct device *dev)
>>   	unsigned int i;
>>   
>>   	if (!res->vcodec_pmdomains_num)
>> -		return;
>> +		goto skip_pmdomains;
>>   
>>   	if (core->pd_dl_venus)
>>   		device_link_del(core->pd_dl_venus);
>> @@ -783,6 +820,15 @@ static void vcodec_domains_put(struct device *dev)
>>   			continue;
>>   		dev_pm_domain_detach(core->pmdomains[i], true);
>>   	}
>> +
>> +skip_pmdomains:
>> +	if (!core->has_opp_table)
>> +		return;
>> +
>> +	if (core->opp_dl_venus)
>> +		device_link_del(core->opp_dl_venus);
>> +
>> +	dev_pm_domain_detach(core->opp_pmdomain, true);
>>   }
>>   
>>   static int core_get_v4(struct device *dev)
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
