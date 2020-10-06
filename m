Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9863F284543
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 07:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgJFFYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 01:24:36 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15559 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgJFFYg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 01:24:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601961875; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kHO2bfQETfzdq28D0JTRwYR2ZB+6JRiat6qJABfcoJ4=;
 b=P9+bEtiQkW+cR8YzP6VtBGqex4Dfo1hHw/da4540027u1odSIwihomb/bke7fqfmuzEkuD1P
 roK3X3P3n2DcbG6onlOJyWbFtknse/os4Pd3WRxAMoSw4wFK8Pv9Tohow9b9Woq++9VmuAuS
 epMfbVht9+5Lb6WulOnUJxy7T0k=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f7bff6c0764f13b0062e2f0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Oct 2020 05:23:56
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB391C433FF; Tue,  6 Oct 2020 05:23:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 552F1C433CA;
        Tue,  6 Oct 2020 05:23:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 06 Oct 2020 10:53:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
In-Reply-To: <160194617664.310579.9927356526425343212@swboyd.mtv.corp.google.com>
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
 <cdd56444b0d7faf9358370f821a10846@codeaurora.org>
 <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org>
 <7dacfcb3d8cb7e99e348f00ee15f917a@codeaurora.org>
 <160194617664.310579.9927356526425343212@swboyd.mtv.corp.google.com>
Message-ID: <91296fbd4feea193ccefa5e511af57f1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-06 06:32, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-10-02 05:45:03)
>> On 2020-10-02 16:57, Stanimir Varbanov wrote:
>> > On 10/2/20 11:06 AM, Sai Prakash Ranjan wrote:
>> >> On 2020-09-04 02:44, Robin Murphy wrote:
>> >>> Since commit 9495b7e92f71 ("driver core: platform: Initialize
>> >>> dma_parms
>> >>> for platform devices"), struct platform_device already provides a
>> >>> dma_parms structure, so we can save allocating another one.
>> >>
>> >
>> > Do you have the mentioned above commit when you see this warning ?
>> 
>> +Stephen reported this, this was recently backported to 5.4 kernel
>> where playing youtube with dma api debug enabled would throw this
>> warning and I am almost 100% certain this is the commit which caused
>> the warning to appear again.
>> 
> 
> We don't have commit 9495b7e92f71 though so I guess we need that one
> if we take this patch.

Oh so Stan was referring to that commit, oops my bad. I thought
he was referring to this patch. So I suppose everything is good
if we backport both patches.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
