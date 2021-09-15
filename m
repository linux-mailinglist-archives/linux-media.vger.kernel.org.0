Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728F440C292
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 11:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbhIOJOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 05:14:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26457 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237349AbhIOJOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 05:14:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631697199; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mKHLpEcdN44klLDGi4B+FJ2Yr0gWuE7N1GO6uzZKeIg=;
 b=I+O3fjm6/HbZUsihtbWeYRmNtg+QurjaRpk9fef3ZzRrVJeloC+9rZkB/2gabgyFmc+q1PSX
 ygsApDOQajI34+Ieil6csaoo4dDZs5J9JFK7M5hTwBGflm6FaR83b/ArR77RjzkX0Zx2HbC+
 /v+GxdFBuhl8zHwDus7YLIzIeJg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6141b926ec62f57c9a31402f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 09:13:10
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4CC4C4361A; Wed, 15 Sep 2021 09:13:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25005C4338F;
        Wed, 15 Sep 2021 09:13:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 15 Sep 2021 14:43:09 +0530
From:   dikshita@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, jim.cromie@gmail.com,
        Joe Perches <joe@perches.com>, Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media-owner@vger.kernel.org
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
In-Reply-To: <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
 <20200730095350.13925-3-stanimir.varbanov@linaro.org>
 <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
Message-ID: <8c1fdf2d0807f07ec57b232497b405f1@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

Reviving the discussion on this change as we need to pull this in.

As per your suggestion, I explored the fault injection framework to 
implement this functionality.
But I don't think that meets our requirements.

We need a way to trigger subsystem restart from the client-side, it's 
not derived from the driver.

while fault injection framework enables the driver to trigger an 
injection
when a specific event occurs for eg: page allocation failure or memory 
access failure.

So, IMO, we will have to use custom debugfs only.

Please feel free to correct me in case my understanding of the framework 
is wrong.

Thanks,
Dikshita

On 2020-08-12 03:19, Stephen Boyd wrote:
> Quoting Stanimir Varbanov (2020-07-30 02:53:49)
>> The SSR (SubSystem Restart) is used to simulate an error on FW
>> side of Venus. We support following type of triggers - fatal error,
>> div by zero and watchdog IRQ.
> 
> Can this use the fault injection framework instead of custom debugfs?
> See Documentation/fault-injection/.
