Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6EF1BE21E
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 17:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgD2PKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 11:10:52 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:14826 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726530AbgD2PKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 11:10:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588173050; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Uj1kdH+1z3EYbeBHEefFEkAH70TKfLMeVJuy+wrtzT4=; b=eNFuYJ9bIB4pGP2I1ZJozdsOLO6RWDBXiVl92lEaA6NmDpfPRZHHm0wu+ORUODMTpH/zocPj
 pKOMlZDZS05nBhxwzS+X5ndBboB6gRF7jpjEN3Z6IWhD8UtqDWrqIFDrqEAxisYFLSMr8kZ4
 RjipNsHILHU6Im0ImCeOKjexIfo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea998f9.7f1b79ee56c0-smtp-out-n04;
 Wed, 29 Apr 2020 15:10:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A277DC433BA; Wed, 29 Apr 2020 15:10:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1CE6C433CB;
        Wed, 29 Apr 2020 15:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1CE6C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 12/17] media: venus: core: Add support for opp
 tables/perf voting
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        linux-media@vger.kernel.org
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
 <b091dc29-d2e8-ed3f-fe1c-ae60e16d5d78@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <425a8828-be17-fe79-99f5-9e20eff51b13@codeaurora.org>
Date:   Wed, 29 Apr 2020 20:40:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b091dc29-d2e8-ed3f-fe1c-ae60e16d5d78@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Stan,

On 4/29/2020 8:06 PM, Stanimir Varbanov wrote:
> Hi Rajendra,
> 
> Thanks for the patch!
> 
[]..

>>   #include <linux/pm_runtime.h>
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/v4l2-mem2mem.h>
>> @@ -214,6 +215,20 @@ static int venus_probe(struct platform_device *pdev)
>>   	if (!core->pm_ops)
>>   		return -ENODEV;
>>   
>> +	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
> 
> Should we set opp clkname if opp_of_add_table fails? We have platforms
> which don't have opp tables in Venus DT node. We have to be backward
> compatible for them.

so the way its designed, you are expected to call dev_pm_opp_set_clkname()
*before* adding any OPPs from the OPP table.
As for backward compatibility its already handled by the OPP core now [1]
which makes sure dev_pm_opp_set_rate() is equivalent to a clk_set_rate()
in case of a missing OPP table.

>> +	if (IS_ERR(core->opp_table))
>> +		return PTR_ERR(core->opp_table);
>> +
>> +	if (core->res->opp_pmdomain) {
>> +		ret = dev_pm_opp_of_add_table(dev);
>> +		if (!ret) {
>> +			core->has_opp_table = true;
>> +		} else if (ret != -ENODEV) {
> 
> Is it possible dev_pm_opp_of_add_table() to return EPROBE_DEFER?

Nope, it does not, I had checked.

>> +			dev_err(dev, "Invalid OPP table in Device tree\n");
> 
> ... if so, please drop dev_err.
> 
>> +			return ret;
>> +		}
>> +	}
[]..

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
> 
> Is this will work for legacy platforms without OPP tables?

yes, see [1] which is already merged in mainline.

> 
> Also what about the other clocks (vicodec0,1) in this function.

We continue to use clk_set_rate() for those. The performance state
is associated with only the core clk.

>>   	if (ret)
>>   		return ret;
>>   
>> @@ -740,13 +740,15 @@ static int venc_power_v4(struct device *dev, int on)
>>   
>>   static int vcodec_domains_get(struct device *dev)
>>   {
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
>> @@ -763,6 +765,24 @@ static int vcodec_domains_get(struct device *dev)
>>   	if (!core->pd_dl_venus)
>>   		return -ENODEV;
>>   
>> +skip_pmdomains:
>> +	if (!res->opp_pmdomain || !core->has_opp_table)
>> +		return 0;
>> +
>> +	/* Attach the power domain for setting performance state */
>> +	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
>> +	if (IS_ERR(opp_table)) {
>> +		return PTR_ERR(opp_table);
>> +	} else if (opp_virt_dev) {
>> +		core->opp_pmdomain = *opp_virt_dev;
>> +		core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
>> +						     DL_FLAG_RPM_ACTIVE |
>> +						     DL_FLAG_PM_RUNTIME |
>> +						     DL_FLAG_STATELESS);
>> +		if (!core->opp_dl_venus)
>> +			return -ENODEV;
> 
> I think as you return ENODEV you have to detach opp domain here because
> vcodec_domains_put() is not called in error path.

Ok, I'll fix that up.

Thanks for the review.

[1] https://lkml.org/lkml/2020/4/8/413

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
