Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D40F28130E
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 14:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387854AbgJBMpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 08:45:20 -0400
Received: from z5.mailgun.us ([104.130.96.5]:16698 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387861AbgJBMpU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 08:45:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601642718; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=I19MrBZza/dhzGSKq3st78E/ckbe6xcu+N31AWHsDiU=;
 b=sL+LjJdHKkM6u0Z67MWi82QeGGMBiCeyfVXl23/HgX7OzRZGZ17cuRb4z35vBlGsiQoLsdOt
 /OImtTTEce6Stwl9QsRH+9S+rKtd0xoERUyf5ZhruNscHRJ5TBMdQtU31CWQSvCxq6VCrE69
 mMqbn7Nz5f6xeqFE3kpXfqX0/Go=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f7720d17df1a00ff8815445 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Oct 2020 12:45:05
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D704C433F1; Fri,  2 Oct 2020 12:45:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15096C433CA;
        Fri,  2 Oct 2020 12:45:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 02 Oct 2020 18:15:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
In-Reply-To: <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org>
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
 <cdd56444b0d7faf9358370f821a10846@codeaurora.org>
 <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org>
Message-ID: <7dacfcb3d8cb7e99e348f00ee15f917a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-02 16:57, Stanimir Varbanov wrote:
> On 10/2/20 11:06 AM, Sai Prakash Ranjan wrote:
>> Hi Robin,
>> 
>> On 2020-09-04 02:44, Robin Murphy wrote:
>>> Since commit 9495b7e92f71 ("driver core: platform: Initialize 
>>> dma_parms
>>> for platform devices"), struct platform_device already provides a
>>> dma_parms structure, so we can save allocating another one.
>>> 
>>> Also the DMA segment size is simply a size, not a bitmask.
>>> 
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 8 +-------
>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.c
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index 203c6538044f..2fa9275d75ff 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -226,13 +226,7 @@ static int venus_probe(struct platform_device 
>>> *pdev)
>>>      if (ret)
>>>          return ret;
>>> 
>>> -    if (!dev->dma_parms) {
>>> -        dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
>>> -                          GFP_KERNEL);
>>> -        if (!dev->dma_parms)
>>> -            return -ENOMEM;
>>> -    }
>>> -    dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
>>> +    dma_set_max_seg_size(dev, UINT_MAX);
>>> 
>>>      INIT_LIST_HEAD(&core->instances);
>>>      mutex_init(&core->lock);
>> 
>> This reintroduced dma api debug warning which the original commit was
>> addressing or rather thought it addressed.
>> 
>>  DMA-API: qcom-venus aa00000.video-codec: mapping sg segment longer 
>> than
>> device claims to support [len=4194304] [max=65536]
>>  WARNING: CPU: 3 PID: 5365 at kernel/dma/debug.c:1225
>> debug_dma_map_sg+0x1ac/0x2c8
>>  <...>
>>  pstate: 60400009 (nZCv daif +PAN -UAO)
>>  pc : debug_dma_map_sg+0x1ac/0x2c8
>>  lr : debug_dma_map_sg+0x1ac/0x2c8
>>  sp : ffffff8016517850
>>  x29: ffffff8016517860 x28: 0000000000010000
>>  x27: 00000000ffffffff x26: ffffff80da45eb00
>>  x25: ffffffd03c465000 x24: ffffffd03b3c1000
>>  x23: ffffff803e262d80 x22: ffffff80d9a0d010
>>  x21: 0000000000000001 x20: 0000000000000001
>>  x19: 0000000000000001 x18: 00000000ffff0a10
>>  x17: ffffffd03b84a000 x16: 0000000000000037
>>  x15: ffffffd03a950610 x14: 0000000000000001
>>  x13: 0000000000000000 x12: 00000000a3b31442
>>  x11: 0000000000000000 x10: dfffffd000000001
>>  x9 : f544368f90c5ee00 x8 : f544368f90c5ee00
>>  x7 : ffffffd03af5d570 x6 : 0000000000000000
>>  x5 : 0000000000000080 x4 : 0000000000000001
>>  x3 : ffffffd03a9174b0 x2 : 0000000000000001
>>  x1 : 0000000000000008 x0 : 000000000000007a
>>  Call trace:
>>   debug_dma_map_sg+0x1ac/0x2c8
>>   vb2_dma_sg_alloc+0x274/0x2f4 [videobuf2_dma_sg]
>>   __vb2_queue_alloc+0x14c/0x3b0 [videobuf2_common]
>>   vb2_core_reqbufs+0x234/0x374 [videobuf2_common]
>>   vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>>   v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>>   v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>>   v4l_reqbufs+0x4c/0x5c
>>   __video_do_ioctl+0x2cc/0x3e0
>>   video_usercopy+0x3b0/0x910
>>   video_ioctl2+0x38/0x48
>>   v4l2_ioctl+0x6c/0x80
>>   do_video_ioctl+0xb54/0x2708
>>   v4l2_compat_ioctl32+0x5c/0xcc
>>   __se_compat_sys_ioctl+0x100/0x2064
>>   __arm64_compat_sys_ioctl+0x20/0x2c
>>   el0_svc_common+0xa8/0x178
>>   el0_svc_compat_handler+0x2c/0x40
>>   el0_svc_compat+0x8/0x10
>> 
>> Thanks,
>> Sai
>> 
> 
> Do you have the mentioned above commit when you see this warning ?

+Stephen reported this, this was recently backported to 5.4 kernel
where playing youtube with dma api debug enabled would throw this
warning and I am almost 100% certain this is the commit which caused
the warning to appear again.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
