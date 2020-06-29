Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91FF20D0E0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 20:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgF2ShE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 14:37:04 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:59599 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726884AbgF2SgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 14:36:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593455759; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2UyrXWkOMOMhSQo6t9EmNJzuHREHp5h9gbpKc9GpJzw=; b=o0WmxEJvFQXWthcLC9ci6Pzeh2y3m0qNQw7waTCKDJEOfbz9aS6x0L/XAXFVvbHW/1aP9Uvh
 EH/+HNP/4qOojv5apF23WwMY9S3kBUWKNFkqyqI5NM5/3mmvXRMeExdlKRGnLnA4w+MvdGWk
 KECTjaWYHzne31/3k3WM7uXAWak=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ef9c72cad153efa34b15da7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Jun 2020 10:49:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCD1BC433CA; Mon, 29 Jun 2020 10:49:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.61.98] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33980C433C6;
        Mon, 29 Jun 2020 10:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33980C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 5/6] media: venus: core: Add support for opp
 tables/perf voting
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        bjorn.andersson@linaro.org, agross@kernel.org, robdclark@gmail.com,
        robdclark@chromium.org
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-6-git-send-email-rnayak@codeaurora.org>
 <e0f856ec-e391-9b1d-baa3-7dda20cb853a@linaro.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <fbb3bdd7-523b-a5fa-cde1-c61e7691e7f9@codeaurora.org>
Date:   Mon, 29 Jun 2020 16:19:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e0f856ec-e391-9b1d-baa3-7dda20cb853a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/18/2020 8:24 PM, Stanimir Varbanov wrote:
> Hi Rajendra,
> 
> On 6/15/20 3:02 PM, Rajendra Nayak wrote:
>> Add support to add OPP tables and perf voting on the OPP powerdomain.
>> This is needed so venus votes on the corresponding performance state
>> for the OPP powerdomain along with setting the core clock rate.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> ---
>> No functional change in v6, rebased over 5.8-rc1
>> Bindings update to add optional PD https://lore.kernel.org/patchwork/patch/1241077/
>>
>>   drivers/media/platform/qcom/venus/core.c       | 43 +++++++++++++++++---
>>   drivers/media/platform/qcom/venus/core.h       |  5 +++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 54 ++++++++++++++++++++++++--
>>   3 files changed, 92 insertions(+), 10 deletions(-)
>>
> 
> <cut>
> 
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
>> +	if (!res->opp_pmdomain)
>> +		return;
>> +
>> +	if (core->opp_dl_venus)
>> +		device_link_del(core->opp_dl_venus);
>> +
>> +	dev_pm_domain_detach(core->opp_pmdomain, true);
> 
> Without corresponding changes in venus DT node we call pm_domain_detach
> with core->opp_pmdomain = NULL which triggers NULL pointer dereference.
> 
> I guess you should check:
> 
> 	if (core->has_opp_table)
> 		dev_pm_domain_detach(core->opp_pmdomain, true);
> 
> or
> 
> 	if (core->opp_pmdomain)
> 		dev_pm_domain_detach(core->opp_pmdomain, true);
> 
> 
> ... not sure which one is more appropriate or both are.

Thanks, I'll fix that up when I repost. Sorry I was out for a while so
haven't been able to reproduce the rpmh timeout issue you reported.
Will spend some time on it this week and see if I can reproduce it.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
