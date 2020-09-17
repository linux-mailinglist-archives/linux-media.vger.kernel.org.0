Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83926D06D
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgIQBMt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:12:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16830 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgIQBMs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:12:48 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 21:12:48 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600305167; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Pab/b4V0MVoJpiK20EmuKX2qwzZMvn4eLJv8tE/lWK8=;
 b=UDlSmQlRxG4kbxjPuHYQv1gEwbW/EKdUMoWA6soe2SNTtg/XIUlyjp5qGbIyCrlvNkOXqGCa
 QqFgOkXiMGcJvjAF14ZcIJ+fqu0dQvnfNxA/kfVG2BTMsiwRHb0bRPtopOyIejlKMUsWazQa
 s2D8d8U7VPs1899/WWo0k+8L6SQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f62b6e2f1e3eb89c7f8a8a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 01:07:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DBA3C433F1; Thu, 17 Sep 2020 01:07:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C121C433CA;
        Thu, 17 Sep 2020 01:07:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 06:37:44 +0530
From:   mansur@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH 1/2] venus: core: change clk enable and disable order in
 resume and suspend
In-Reply-To: <159959010893.454335.18221321331314189759@swboyd.mtv.corp.google.com>
References: <1599536645-4593-1-git-send-email-mansur@codeaurora.org>
 <159959010893.454335.18221321331314189759@swboyd.mtv.corp.google.com>
Message-ID: <4865efd5e746d2e94cc4680a47a30a0d@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2020-09-09 00:05, Stephen Boyd wrote:
>> Quoting Mansur Alisha Shaik (2020-09-07 20:44:05)
>>> Currently video driver is voting after clk enable and un voting
>>> before clk disable. Basically we should vote before clk enable
>>> and un vote after clk disable.
>>> 
>>> Corrected this by changing the order of clk enable and clk disable.
>>> 
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> ---
>> 
>> Any Fixes: tag?
Added Fixes tag
>> 
>>>  drivers/media/platform/qcom/venus/core.c | 17 ++++++++++-------
>>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>>> b/drivers/media/platform/qcom/venus/core.c
>>> index c5af428..4857bbd 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -363,13 +363,16 @@ static __maybe_unused int 
>>> venus_runtime_suspend(struct device *dev)
>>>         if (ret)
>>>                 return ret;
>>> 
>>> +       if (pm_ops->core_power) {
>>> +               ret = pm_ops->core_power(dev, POWER_OFF);
>>> +               if (ret)
>>> +                       return ret;
>>> +       }
>>> +
>>>         ret = icc_set_bw(core->cpucfg_path, 0, 0);
>>>         if (ret)
>>>                 return ret;
>> 
>> Shouldn't we power it back up if this fails during suspend?
On icc_set_bw() failure, we are just power it and return.
Addressed these comments and posted new version
https://lore.kernel.org/patchwork/project/lkml/list/?series=463224
>> 
>>> 
>>> -       if (pm_ops->core_power)
>>> -               ret = pm_ops->core_power(dev, POWER_OFF);
>>> -
>>>         return ret;
>>>  }
>>> 
