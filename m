Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865A426D0D4
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgIQBub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:50:31 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:20213 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbgIQBua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:50:30 -0400
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 21:50:29 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600307429; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bs58Ng6kyMcqvwBvNdPkE2BNArpEi+g/GUcaUJv2s7Y=;
 b=URiLA2ud2xk/8KXW+aVgXbvBhoBAZUa59Irlch996enEXE/Ki+2OebQqNfJQZMoEHgKH6VZQ
 VReuIP3vboe6aViIP2atSFZKNBm8URPuKg3o8nv/9jL6Q/sGmiLIbAHY5wckPfYnf5hAAElY
 bmT79nAhYo9KufJU5e1CLqfXvpc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f62bf98aac0601354b16775 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 01:44:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7A430C433F0; Thu, 17 Sep 2020 01:44:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C280CC433CA;
        Thu, 17 Sep 2020 01:44:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 07:14:55 +0530
From:   mansur@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH 2/2] venus: core: vote for video-mem icc path and change
 avg, peak bw
In-Reply-To: <159959029779.454335.10674172341529908104@swboyd.mtv.corp.google.com>
References: <1599536678-4666-1-git-send-email-mansur@codeaurora.org>
 <159959029779.454335.10674172341529908104@swboyd.mtv.corp.google.com>
Message-ID: <30ad67bf36be40c6a2b395962f8e918f@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2020-09-09 00:08, Stephen Boyd wrote:
>> Quoting Mansur Alisha Shaik (2020-09-07 20:44:38)
>>> Currently we are voting for venus0-ebi path during buffer processing
>>> with an average bandwidth of all the instances and unvoting during
>>> session release.
>>> 
>>> While video streaming when we try to do XO-SD using the command
>>> "echo mem > /sys/power/state command" , device is not entering
>>> to suspend state and from interconnect summary seeing votes for 
>>> venus0-ebi
>>> 
>>> Corrected this by voting for venus0-ebi path in venus_runtime_resume
>> 
>> venus_runtime_resume() please so we know it's a function.
Changed to function like notation and RESEND v2
https://lore.kernel.org/patchwork/project/lkml/list/?series=463283
>> 
>>> and unvote during venus_runtime_suspend.
>> 
>> venus_runtime_suspend().
>> 
>>> 
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> ---
>> 
>> Any Fixes: tag?
Added the Fixes tag
>> 
>>>  drivers/media/platform/qcom/venus/core.c | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index 4857bbd..79d8600 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -373,6 +373,10 @@ static __maybe_unused int 
>>> venus_runtime_suspend(struct device *dev)
>>>         if (ret)
>>>                 return ret;
>>> 
>>> +       ret = icc_set_bw(core->video_path, 0, 0);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>>         return ret;
>>>  }
>>> 
>>> @@ -382,7 +386,11 @@ static __maybe_unused int 
>>> venus_runtime_resume(struct device *dev)
>>>         const struct venus_pm_ops *pm_ops = core->pm_ops;
>>>         int ret;
>>> 
>>> -       ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
>>> +       ret = icc_set_bw(core->video_path, kbps_to_icc(20000), 0);
>> 
>> This also shows that the arguments to icc_set_bw() we're backwards? 
>> Can
>> that be fixed in another patch instead of putting it in this one?
posted as another patch set.
https://lore.kernel.org/patchwork/project/lkml/list/?series=463283
