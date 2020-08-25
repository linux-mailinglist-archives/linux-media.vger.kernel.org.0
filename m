Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCD0250E55
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 03:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgHYBny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 21:43:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:34505 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725924AbgHYBnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 21:43:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598319831; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MhOn/FuuO1NIeV+HcgL78Gl6N1WTliqDO0oEmRfGfgo=;
 b=Kq1gtSr0QdSi5/1RDfVHfLSeRyGOuge8FuO6aeVp2ZGQZ6X/VD8agtrmS0CBrumYovDPmixG
 A+6ebDF6NzbEy2XF7czGyRMYRDT/+zZYcFWT74WTVLdw1owJ0dhmxseTP181oVyxFzqBy9Qq
 rU9MHSjc7jfLW7k+um0Wmx+v0PQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f446cc476c283d04f5420d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 01:43:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04113C43387; Tue, 25 Aug 2020 01:43:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4428BC433CA;
        Tue, 25 Aug 2020 01:43:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 25 Aug 2020 07:13:31 +0530
From:   mansur@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [RESEND 1/3] venus: core: handle race condititon for core ops
In-Reply-To: <ef0d6eb2-1834-f4de-7eb2-aad665fc69e4@linaro.org>
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
 <dc1f37ed-3786-5bb2-3763-368b0165478b@linaro.org>
 <ef0d6eb2-1834-f4de-7eb2-aad665fc69e4@linaro.org>
Message-ID: <688d0983201d7426fa4c9409914b7e0b@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-21 16:29, Stanimir Varbanov wrote:
> Hi Mansur,
> 
> On 8/10/20 12:50 PM, Stanimir Varbanov wrote:
>> Hi Mansur,
>> 
>> Thanks for the patches!
>> 
>> On 8/7/20 9:24 AM, Mansur Alisha Shaik wrote:
>>> For core ops we are having only write protect but there
>>> is no read protect, because of this in multthreading
>>> and concurrency, one CPU core is reading without wait
>>> which is causing the NULL pointer dereferece crash.
>>> 
>>> one such scenario is as show below, where in one
>>> core core->ops becoming NULL and in another core
>>> calling core->ops->session_init().
>>> 
>>> CPU: core-7:
>>> Call trace:
>>>  hfi_session_init+0x180/0x1dc [venus_core]
>>>  vdec_queue_setup+0x9c/0x364 [venus_dec]
>>>  vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
>>>  vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>>>  v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>>>  v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>>>  v4l_reqbufs+0x4c/0x5c
>>> __video_do_ioctl+0x2b0/0x39c
>>> 
>>> CPU: core-0:
>>> Call trace:
>>>  venus_shutdown+0x98/0xfc [venus_core]
>>>  venus_sys_error_handler+0x64/0x148 [venus_core]
>>>  process_one_work+0x210/0x3d0
>>>  worker_thread+0x248/0x3f4
>>>  kthread+0x11c/0x12c
>>> 
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 2 +-
>>>  drivers/media/platform/qcom/venus/hfi.c  | 5 ++++-
>>>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> See below comment, otherwise:
> 
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index 203c653..fe99c83 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -64,8 +64,8 @@ static void venus_sys_error_handler(struct 
>>> work_struct *work)
>>>  	pm_runtime_get_sync(core->dev);
>>> 
>>>  	hfi_core_deinit(core, true);
>>> -	hfi_destroy(core);
>>>  	mutex_lock(&core->lock);
>>> +	hfi_destroy(core);
>> 
>> As my recovery fixes [1] touches this part also, could you please 
>> apply
>> them on top of yours and re-test?
> 
> I'll drop above chunk from the patch because it is already taken into
> account in my recovery fixes series and queue up the patch for v5.10.
> 
yes, you can drop. I have validated these patches on top of your 
recovery patch
series. I will push V2 with dependency on "venus - recovery from 
frimware crash"
series 
(https://lore.kernel.org/patchwork/project/lkml/list/?series=455962)

>> 
>> Otherwise this patch looks good to me.
>> 
>> [1] https://www.spinics.net/lists/linux-arm-msm/msg70092.html
>> 
>>>  	venus_shutdown(core);
>>> 
>>>  	pm_runtime_put_sync(core->dev);
>>> diff --git a/drivers/media/platform/qcom/venus/hfi.c 
>>> b/drivers/media/platform/qcom/venus/hfi.c
>>> index a211eb9..2eeb31f 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi.c
>>> @@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>>>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>>>  {
>>>  	struct venus_core *core = inst->core;
>>> -	const struct hfi_ops *ops = core->ops;
>>> +	const struct hfi_ops *ops;
>>>  	int ret;
>>> 
>>>  	if (inst->state != INST_UNINIT)
>>> @@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, 
>>> u32 pixfmt)
>>>  	inst->hfi_codec = to_codec_type(pixfmt);
>>>  	reinit_completion(&inst->done);
>>> 
>>> +	mutex_lock(&core->lock);
>>> +	ops = core->ops;
>>>  	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
>>>  	if (ret)
>>>  		return ret;
>>> 
>>> +	mutex_unlock(&core->lock);
>>>  	ret = wait_session_msg(inst);
>>>  	if (ret)
>>>  		return ret;
>>> 
>> 
