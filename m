Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD126D0D8
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgIQBvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:51:45 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:57869 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726072AbgIQBvm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:51:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600307501; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GC4S6qLxDWwr8RfLIrHwdZdYoHTS/IPnUY00JKRfmIw=;
 b=Gc9E0J5c/ygBXfNysr8rtuYkQSRioVcuSeSmKWTWG8H2VmorI7c4HrnCIOO2dmt0C+iyTVcO
 wfgxzkmxGsa7TZOdYTS/moJe2M84CrX+IkYb9WmHnOdZ9lm48WBBbpB8WVEuqlYmhFN5+26x
 S51kZLuOmxVhwjHXktfGMjF7hdQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f62c12df1e3eb89c704d263 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 01:51:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7B80EC433F1; Thu, 17 Sep 2020 01:51:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C7ECC433F0;
        Thu, 17 Sep 2020 01:51:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 07:21:39 +0530
From:   mansur@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v2 1/3] venus: core: handle race condititon for core ops
In-Reply-To: <313cf565-f69f-df84-6bff-8c9a77b9f642@linaro.org>
References: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
 <1599741856-16239-2-git-send-email-mansur@codeaurora.org>
 <313cf565-f69f-df84-6bff-8c9a77b9f642@linaro.org>
Message-ID: <fec60984556a89f9b058425437234336@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-11 15:40, Stanimir Varbanov wrote:
> On 9/10/20 3:44 PM, Mansur Alisha Shaik wrote:
>> For core ops we are having only write protect but there
>> is no read protect, because of this in multthreading
>> and concurrency, one CPU core is reading without wait
>> which is causing the NULL pointer dereferece crash.
>> 
>> one such scenario is as show below, where in one CPU
>> core, core->ops becoming NULL and in another CPU core
>> calling core->ops->session_init().
>> 
>> CPU: core-7:
>> Call trace:
>>  hfi_session_init+0x180/0x1dc [venus_core]
>>  vdec_queue_setup+0x9c/0x364 [venus_dec]
>>  vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
>>  vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>>  v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>>  v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>>  v4l_reqbufs+0x4c/0x5c
>> __video_do_ioctl+0x2b0/0x39c
>> 
>> CPU: core-0:
>> Call trace:
>>  venus_shutdown+0x98/0xfc [venus_core]
>>  venus_sys_error_handler+0x64/0x148 [venus_core]
>>  process_one_work+0x210/0x3d0
>>  worker_thread+0x248/0x3f4
>>  kthread+0x11c/0x12c
>> 
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>> Changes in V2:
>> - Addressed review comments by stan by validating on top
>> - of 
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=455962
>> 
>>  drivers/media/platform/qcom/venus/hfi.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/hfi.c 
>> b/drivers/media/platform/qcom/venus/hfi.c
>> index a59022a..3137071 100644
>> --- a/drivers/media/platform/qcom/venus/hfi.c
>> +++ b/drivers/media/platform/qcom/venus/hfi.c
>> @@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>>  {
>>  	struct venus_core *core = inst->core;
>> -	const struct hfi_ops *ops = core->ops;
>> +	const struct hfi_ops *ops;
>>  	int ret;
>> 
> 
> If we are in system error recovery the session_init cannot pass
> successfully, so we exit early in the function.
> 
> I'd suggest to make it:
> 
> 	/* If core shutdown is in progress or we are in system error 
> 	recovery,
> return an error */
> 	mutex_lock(&core->lock);
> 	if (!core->ops || core->sys_error) {
> 		mutex_unclock(&core->lock);
> 		return -EIO;
> 	}
> 	mutex_unclock(&core->lock);
> 
Tried above suggestion and ran the failed scenario, I didn't see any 
issue.
Posted new version 
https://lore.kernel.org/patchwork/project/lkml/list/?series=463091
>>  	if (inst->state != INST_UNINIT)
>> @@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, 
>> u32 pixfmt)
>>  	inst->hfi_codec = to_codec_type(pixfmt);
>>  	reinit_completion(&inst->done);
>> 
>> +	mutex_lock(&core->lock);
>> +	ops = core->ops;
>>  	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
>>  	if (ret)
>>  		return ret;
>> 
>> +	mutex_unlock(&core->lock);
>>  	ret = wait_session_msg(inst);
>>  	if (ret)
>>  		return ret;
>> 
