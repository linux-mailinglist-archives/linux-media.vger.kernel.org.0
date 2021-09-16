Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD3D40D33F
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 08:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhIPGbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 02:31:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39146 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234496AbhIPGa7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 02:30:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631773779; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=14otI/FRn3T6TCrE2iGF/EbKmUQaHDuaRWzxyWGJRJI=;
 b=DKuz09QZiDh+R/KZ4nnmlYodzNeL42eDZViJa22UOf7CgjKNaxjemlktxVqBY4zolHJi8aH1
 qaTgUTsW+YH8Cd8EehIfjQ/ljWByBKuTHpjJkawGJ4tZLpSW1nE9Wel/xquBFBtxbGJ1C4uO
 ZaL8i2RFVJj5Z5o8xYpJTfSpQ10=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6142e451b585cc7d2466e0ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 06:29:37
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0627C43616; Thu, 16 Sep 2021 06:29:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2D0AC4338F;
        Thu, 16 Sep 2021 06:29:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Sep 2021 11:59:36 +0530
From:   dikshita@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, jim.cromie@gmail.com,
        Joe Perches <joe@perches.com>, Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media-owner@vger.kernel.org,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
In-Reply-To: <CAE-0n53T-RoOvR=s9nHiXAriMgKvBfDqfBfoGKX5Ju5YF3Tcqw@mail.gmail.com>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
 <20200730095350.13925-3-stanimir.varbanov@linaro.org>
 <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
 <8c1fdf2d0807f07ec57b232497b405f1@codeaurora.org>
 <CAE-0n53T-RoOvR=s9nHiXAriMgKvBfDqfBfoGKX5Ju5YF3Tcqw@mail.gmail.com>
Message-ID: <53a38a24cca0b6f1c2a3120f14dfc865@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-09-16 01:09, Stephen Boyd wrote:
> Quoting dikshita@codeaurora.org (2021-09-15 02:13:09)
>> Hi Stephen,
>> 
>> Reviving the discussion on this change as we need to pull this in.
>> 
>> As per your suggestion, I explored the fault injection framework to
>> implement this functionality.
>> But I don't think that meets our requirements.
>> 
>> We need a way to trigger subsystem restart from the client-side, it's
>> not derived from the driver.
> 
> Just to confirm, this is all for debugging purposes right?
> 
yes, correct. this is for debugging purposes. We need this to simulate 
an error on FW side.
In a normal scenario, when FW runs into error, sys error is triggered 
from FW as result of which
a sequence of commands are followed for restarting the system.
using this feature, we are trying to simulate this error on FW i.e we 
are forcing the FW to run into an error.
>> 
>> while fault injection framework enables the driver to trigger an
>> injection
>> when a specific event occurs for eg: page allocation failure or memory
>> access failure.
>> 
>> So, IMO, we will have to use custom debugfs only.
> 
> Can you use DECLARE_FAULT_ATTR()? Or you need it to be active instead 
> of
> passive, i.e. it shouldn't wait for should_fail() to return true, but
> actively trigger something on the remoteproc?
> 

yes, it doesn't need to wait for should_fail() to return true.
the client/user should be able to trigger this subsystem restart(SSR) at 
any point of time
when a session is running. It's totally client-driven.

>> 
>> Please feel free to correct me in case my understanding of the 
>> framework
>> is wrong.
>> 
> 
> I presume the fault injection framework could get a new feature that
> lets the fault be injected immediately upon writing the debugfs file.
> My goal is to consolidate this sort of logic into one place and then 
> put
> it behind some config option that distros can disable so the kernel
> isn't bloated with debug features that end users will never care about.
