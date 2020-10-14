Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC5C28E40C
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730855AbgJNQJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:09:27 -0400
Received: from foss.arm.com ([217.140.110.172]:52620 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728144AbgJNQJ1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:09:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1E55D6E;
        Wed, 14 Oct 2020 09:09:26 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A0BF3F71F;
        Wed, 14 Oct 2020 09:09:18 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
 <cdd56444b0d7faf9358370f821a10846@codeaurora.org>
 <a2f96ef5-1e67-7bc7-39e1-448b2196aef1@linaro.org>
 <7dacfcb3d8cb7e99e348f00ee15f917a@codeaurora.org>
 <160194617664.310579.9927356526425343212@swboyd.mtv.corp.google.com>
 <91296fbd4feea193ccefa5e511af57f1@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <042cd5da-ad6e-084b-2352-c74174046ab5@arm.com>
Date:   Wed, 14 Oct 2020 17:09:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <91296fbd4feea193ccefa5e511af57f1@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-06 06:23, Sai Prakash Ranjan wrote:
> On 2020-10-06 06:32, Stephen Boyd wrote:
>> Quoting Sai Prakash Ranjan (2020-10-02 05:45:03)
>>> On 2020-10-02 16:57, Stanimir Varbanov wrote:
>>> > On 10/2/20 11:06 AM, Sai Prakash Ranjan wrote:
>>> >> On 2020-09-04 02:44, Robin Murphy wrote:
>>> >>> Since commit 9495b7e92f71 ("driver core: platform: Initialize
>>> >>> dma_parms
>>> >>> for platform devices"), struct platform_device already provides a
>>> >>> dma_parms structure, so we can save allocating another one.
>>> >>
>>> >
>>> > Do you have the mentioned above commit when you see this warning ?
>>>
>>> +Stephen reported this, this was recently backported to 5.4 kernel
>>> where playing youtube with dma api debug enabled would throw this
>>> warning and I am almost 100% certain this is the commit which caused
>>> the warning to appear again.
>>>
>>
>> We don't have commit 9495b7e92f71 though so I guess we need that one
>> if we take this patch.
> 
> Oh so Stan was referring to that commit, oops my bad. I thought
> he was referring to this patch. So I suppose everything is good
> if we backport both patches.

Right, this patch is just some trivial housekeeping which certainly 
doesn't deserve backporting in its own right. However if it's because 
you're doing something like backporting an entire chunk of the media 
tree as a unit, then yeah, you'll need to track down all the functional 
dependencies, especially any that *weren't* helpfully called out in 
commit messages ;)

Robin.
