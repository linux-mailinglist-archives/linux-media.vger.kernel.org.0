Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F02026D0E2
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQBxi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:53:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:57869 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726129AbgIQBxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:53:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600307615; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5gKnvHK1s7h+t4dIt5Jw6+hoAVJacQi86HN6L5bs5zA=;
 b=UV7NwRrZ3VyqtYF82nnyj0atNcBH5W/5YwHX/R56iiBh1X0jjp13PNderfLtoXD2Yg430hIP
 CjMlMCNb8cIkd0JQBL+ZxMNd4faRwC/6jbhSXTYqjTEyvK+amTfyTblOLWTfj954vGXcHWvn
 bk3Rgap3RUI9y0dkKmAM1dGytbI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f62c18d91755cb92b41fd8b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 01:53:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D317C433F0; Thu, 17 Sep 2020 01:53:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6D5EC433C8;
        Thu, 17 Sep 2020 01:53:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 07:23:16 +0530
From:   mansur@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v2 2/3] venus: core: cancel pending work items in
 workqueue
In-Reply-To: <a96d7cce-2781-e3d6-6238-8fec411511a1@linaro.org>
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
 <1599741856-16239-3-git-send-email-mansur@codeaurora.org>
 <a96d7cce-2781-e3d6-6238-8fec411511a1@linaro.org>
Message-ID: <51eeedbe7e84ce67e8d5b3f9fd3a7a2e@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-11 15:52, Stanimir Varbanov wrote:
> Hi,
> 
> On 9/10/20 3:44 PM, Mansur Alisha Shaik wrote:
>> In concurrency usecase and reboot scenario we are
>> observing race condition and seeing NULL pointer
>> dereference crash. In shutdown path and system
>> recovery path we are destroying the same mutex
>> hence seeing crash.
>> 
>> This case is handled by mutex protection and
>> cancel delayed work items in work queue.
>> 
>> Below is the call trace for the crash
>> Call trace:
>>  venus_remove+0xdc/0xec [venus_core]
>>  venus_core_shutdown+0x1c/0x34 [venus_core]
>>  platform_drv_shutdown+0x28/0x34
>>  device_shutdown+0x154/0x1fc
>>  kernel_restart_prepare+0x40/0x4c
>>  kernel_restart+0x1c/0x64
>> 
>> Call trace:
>>  mutex_lock+0x34/0x60
>>  venus_hfi_destroy+0x28/0x98 [venus_core]
>>  hfi_destroy+0x1c/0x28 [venus_core]
> 
> I queued up [1] and after it this cannot happen anymore because
> hfi_destroy() is not called by venus_sys_error_handler().
> 
> So I guess this patch is not needed anymore.
> 
> [1] https://www.spinics.net/lists/linux-arm-msm/msg70092.html
> 
Yes, this patch is not needed any more. rebased and posted new version
https://lore.kernel.org/patchwork/project/lkml/list/?series=463091

>>  venus_sys_error_handler+0x60/0x14c [venus_core]
>>  process_one_work+0x210/0x3d0
>>  worker_thread+0x248/0x3f4
>>  kthread+0x11c/0x12c
>>  ret_from_fork+0x10/0x18
>> 
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index c5af428..69aa199 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -323,6 +323,8 @@ static int venus_remove(struct platform_device 
>> *pdev)
>>  	struct device *dev = core->dev;
>>  	int ret;
>> 
>> +	cancel_delayed_work_sync(&core->work);
>> +
>>  	ret = pm_runtime_get_sync(dev);
>>  	WARN_ON(ret < 0);
>> 
>> @@ -340,7 +342,9 @@ static int venus_remove(struct platform_device 
>> *pdev)
>>  	if (pm_ops->core_put)
>>  		pm_ops->core_put(dev);
>> 
>> +	mutex_lock(&core->lock);
>>  	hfi_destroy(core);
>> +	mutex_unlock(&core->lock);
>> 
>>  	icc_put(core->video_path);
>>  	icc_put(core->cpucfg_path);
>> 
