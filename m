Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94761F5253
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 12:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgFJKaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 06:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbgFJK30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 06:29:26 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CEFC08C5C3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 03:29:24 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t21so983686edr.12
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qsMe0GoBoD4Nd7M3gcej+GYSC/DhUz8aXH/HyUxybk8=;
        b=wGtnbNQrXsqiFO1VSMJ2uUjSmZHAEi+S6K5ESB4qgssCjIKSqFS2b1Jyr9jtl9Pywy
         anuLBuXoUrXZzJw/iqRHH2RsMO8D1rTZslEMlcbvzhGKZPIymt4N8o1rDRKv6lQB6yGZ
         FxK9r5Q3A2V/uf3KPjuYvhMc9/81tbXAW3Nl/LetTqYi/0gPFqLgrrb6pSu4Cv6BYM2d
         +VHxqYYuRzmn+RdZg1LanX1+wiI6o7ofir9fwSVxubR4GmW1bXwU003AFWTIe7ciFQsU
         AWUibFvwi/xqQLTh54nfPyEubeUna9etlzwZyYkKWTEOzLvNZdpr+qjsijkQohXsAgV6
         O88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qsMe0GoBoD4Nd7M3gcej+GYSC/DhUz8aXH/HyUxybk8=;
        b=XFftDgr1rP3R9ZP77RRYa75kmMi0yNQ+MW73scCIIDBn76nUiWEoh/LGKeePG3FpWq
         mdv3gx0XTxXqPIV+qS4gQ5xGs+ZYxMSk/yaQLFaBWLECrxoa4Ti4p5eAfX7sBRu3FxMz
         QEd01hXZkrgJJzeBVjDh35bhh5tm6Ibd9E0HTORMjsCRczho7jARxIoaXm9vMEBlP77s
         HM+rH5J6plVfi3jSJDbMEEdRbqJYVcbMK88IaQhlmxvRu9p5N19Y18dDYQgTwdqoMwln
         f9+kwMx7CGS1JESN9oMrLjgLws9nvVXUGDK3HAz6ZAQXXYrWsjYcA0OVR1GAhwoFhArw
         caDg==
X-Gm-Message-State: AOAM532T/yeQYXIKlvusIAwALt5w153vkAmQgNzvpTwlce27aKc4l8X6
        409wfV4l4kZWYptqhWF86dstIkerqRte+g==
X-Google-Smtp-Source: ABdhPJz3ezkloiZYYUAR2sQCB5HFoqOKaX45ksAgj58KnQseQbSdSC9xWwnUJZpa/sd5fQLKpf9Mig==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr1914973edr.6.1591784963456;
        Wed, 10 Jun 2020 03:29:23 -0700 (PDT)
Received: from [192.168.1.5] (212-5-158-114.ip.btc-net.bg. [212.5.158.114])
        by smtp.googlemail.com with ESMTPSA id bo26sm17375818edb.67.2020.06.10.03.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 03:29:22 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] Documentation: dynamic-debug: Add description of
 level bitmask
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
        Jason Baron <jbaron@akamai.com>,
        Jonathan Corbet <corbet@lwn.net>
References: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
 <20200609104604.1594-2-stanimir.varbanov@linaro.org>
 <20200609111615.GD780233@kroah.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0830ba57-d416-4788-351a-6d1b2ca5b7d8@linaro.org>
Date:   Wed, 10 Jun 2020 13:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609111615.GD780233@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Greg,

On 6/9/20 2:16 PM, Greg Kroah-Hartman wrote:
> On Tue, Jun 09, 2020 at 01:45:58PM +0300, Stanimir Varbanov wrote:
>> This adds description of the level bitmask feature.
>>
>> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
>> index 0dc2eb8e44e5..c2b751fc8a17 100644
>> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
>> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
>> @@ -208,6 +208,12 @@ line
>>  	line -1605          // the 1605 lines from line 1 to line 1605
>>  	line 1600-          // all lines from line 1600 to the end of the file
>>  
>> +level
>> +    The given level will be a bitmask ANDed with the level of the each ``pr_debug()``
>> +    callsite. This will allow to group debug messages and show only those of the
>> +    same level.  The -p flag takes precedence over the given level. Note that we can
>> +    have up to five groups of debug messages.
> 
> As was pointed out, this isn't a "level", it's some arbitrary type of
> "grouping".

Yes, it is grouping of KERN_DEBUG level messages by importance (my
fault, I put incorrect name).  What is important is driver author
decision.  Usually when the driver is huge and has a lot of debug
messages it is not practical to enable all of them to chasing a
particular bug or issue.  You know that debugging (printk) add delays
which could hide or rise additional issue(s) which would complicate
debug and waste time.

For the Venus driver I have defined three groups of KERN_DEBUG - low,
medium and high (again the driver author(s) will decide what the
importance is depending on his past experience).

There is another point where the debugging is made by person who is not
familiar with the driver code. In that case he/she cannot enable lines
or range of lines because he don't know the details. Here the grouping
by importance could help.

> 
> But step back, why?  What is wrong with the existing control of dynamic
> debug messages that you want to add another type of arbitrary grouping
> to it?  And who defines that grouping?  Will it be
> driver/subsystem/arch/author specific?  Or kernel-wide?
> 
> This feels like it could easily get out of hand really quickly.
> 
> Why not just use tracepoints if you really want to be fine-grained?
> 
> thanks,
> 
> greg k-h
> 

-- 
regards,
Stan
