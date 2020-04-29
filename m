Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA071BE0A4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgD2OTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:19:43 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:42339 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbgD2OTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:19:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588169981; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GcOuy4s4nR7NMD9G7PRsLt/9043GOxuP9x5bNai9Bc4=; b=eLqJWSeBehs1SRGPfck3pzVSK122u+457TVnHfpcyeqlcbIRUWS5J9LnzEjU5I2GHtpyhh+9
 JI8IYGmbhoUrFnPx/wdMlqAZO6zWN2umujq1cJ6dOoWiwsOI2OvlRTLy5J4IJrxT7qqjuMFJ
 KCyrY2S+3ldXGjdnXrisGHouk9M=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea98cf9.7f82d4b96a08-smtp-out-n05;
 Wed, 29 Apr 2020 14:19:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3619C433BA; Wed, 29 Apr 2020 14:19:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.131.182.194] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 665E7C433CB;
        Wed, 29 Apr 2020 14:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 665E7C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 12/17] media: venus: core: Add support for opp
 tables/perf voting
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
 <20200429003907.GN4525@google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <6e37f0b5-a9b3-7b62-96f9-6bd8f1594fa6@codeaurora.org>
Date:   Wed, 29 Apr 2020 19:49:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429003907.GN4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/29/2020 6:09 AM, Matthias Kaehlcke wrote:
> On Tue, Apr 28, 2020 at 07:03:00PM +0530, Rajendra Nayak wrote:
>> Add support to add OPP tables and perf voting on the OPP powerdomain.
>> This is needed so venus votes on the corresponding performance state
>> for the OPP powerdomain along with setting the core clock rate.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> Cc: linux-media@vger.kernel.org
>> ---
>>   drivers/media/platform/qcom/venus/core.c       | 28 +++++++++++++++++++
>>   drivers/media/platform/qcom/venus/core.h       |  5 ++++
>>   drivers/media/platform/qcom/venus/pm_helpers.c | 37 +++++++++++++++++++++++---
>>   3 files changed, 66 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index 194b10b9..e98fea92 100644
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
>> +			dev_err(dev, "Invalid OPP table in Device tree\n");
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
>> +	if (core->res->opp_pmdomain && core->has_opp_table)
> 
> the check for 'core->res->opp_pmdomain' is not needed, 'core->has_opp_table'
> can only be true when 'core->res->opp_pmdomain' is not NULL.

ah, that's right, will fix. Thanks.

> 
>> +		dev_pm_opp_of_remove_table(dev);
>> +	dev_pm_opp_put_clkname(core->opp_table);
>>   	pm_runtime_set_suspended(dev);
>>   	pm_runtime_disable(dev);
>>   	hfi_destroy(core);
>> @@ -326,6 +344,10 @@ static int venus_remove(struct platform_device *pdev)
>>   
>>   	venus_firmware_deinit(core);
>>   
>> +	if (core->res->opp_pmdomain && core->has_opp_table)
> 
> ditto
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
