Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B92581A49FD
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 20:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgDJSr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 14:47:57 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44789 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJSr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 14:47:56 -0400
Received: by mail-lf1-f67.google.com with SMTP id 131so1968386lfh.11;
        Fri, 10 Apr 2020 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=85ZTnVe+xQapPzSFTruKQe7iobQhtV4Z4gYQIGcbe6E=;
        b=vZFlVaN3kxC2JTIZS2URHTx7Ox81zpmZVIu0PltwZk1iK2GgcsqIU7cFi4qapwRQ3q
         p9Gl5yV3b+i4i/slFneh/q/pJlkgBQ2qa9+b/TpULmqzlXsERufRxFEVMp6eziJ4mtSd
         lweH/6hBuTM/nWVRj5NwF1oBMz0tbzgetvIZzCL0CHtoZXKBeyGxSyOT3eGDbQQzCwb9
         i8m964NkM/E0CCDn21zs5b8pvE34df+d5i8OAKgLaOE+s6pnkgf/dl433CZTFcPvO50s
         bH6/Vb7GpcdUYWvUR/fA/oZOzpsu32eFdn6a1VvxwkrPr/fzcwWbgHGnXATdQ6Ei08q6
         Iryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=85ZTnVe+xQapPzSFTruKQe7iobQhtV4Z4gYQIGcbe6E=;
        b=GprDF5nQvAC9JK4oqRmKT8/RJJZTqnMlsQePlVHlNayh75EIwdJd3+5QYkt5/jWPln
         TGdc7WV38ccQEkSx0eTvTlNoCK4lLdyDQSe+zqIifG1vo8X0UOQhUVIhcy6hR6NthRbE
         uLuxCvx7wwDTUAQEOR8+EZGRbUUk8kUdH6x3YX4wx5iQ2AwKeO70FJH9Go4//YoCTavf
         So6LE/2ycreQaClCxvOKzhajbdyBdfbex7ATXT8r5vBmxNiOqwLMq4YXS0W1oq41L78h
         a2oC91gtnrvzftjB95KZ12Ar4VV9N0ZO+HOZir2Ngz9YDIRfBpV/0QupHCYJ8xvYuDVS
         R9Yw==
X-Gm-Message-State: AGi0PuYn9nTg0feR+gXNgcz6hX1YDPRc5WniTMQga9VLD/iS+xsbuQsc
        Vmpmn/7ikR9TpXfWXR/utIjCEbFN
X-Google-Smtp-Source: APiQypKfUR06Ii67R/bkIubjxr4gW2PFHLyI+D6KL7nIxAOhU74ze+/lJufurIpTACH4zDK+HueqVA==
X-Received: by 2002:ac2:4112:: with SMTP id b18mr3370285lfi.106.1586544472057;
        Fri, 10 Apr 2020 11:47:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id n24sm1600292lji.19.2020.04.10.11.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 11:47:51 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
 <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
 <ced73258-6f4b-e970-4ca5-ecdf1808a4c3@nvidia.com>
 <ad646fde-2eed-eeeb-4d85-ec36d6613eb1@nvidia.com>
 <7288cacd-badc-cb01-1f4c-286dd024ca10@gmail.com>
 <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <00708f34-cf45-e248-c6b0-c3d2286671ca@gmail.com>
Date:   Fri, 10 Apr 2020 21:47:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <77c88717-618f-b366-2b6a-f8b4abaa66cc@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

09.04.2020 21:28, Sowjanya Komatineni пишет:
> 
> On 4/9/20 7:50 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 09.04.2020 06:38, Sowjanya Komatineni пишет:
>> ...
>>> Tested with 3 buffers and by checking outstanding buffers in process by
>>> VI hw and holding to start capture till one outstanding buffer in
>>> process by HW.
>>> Also tested with 2 buffers without checking for outstanding buffers.
>>>
>>> In both cases, I see same %CPU for the kthreads and is < 1%
>>>
>> I don't see where buffers queue max limit is set to 3 in the code, but
>> should be okay if CPU isn't getting hogged. Looking forward to v7.
> Sorry, correction I meant to say pre-queued buffers before streaming not
> num_buffers.
> vb2 queue min_buffers_needed was set to 3 as part of one of the issue
> debug in earlier version which actually was irrelevant to that issue and
> should have been removed. Will remove min_buffers_needed in v7.
> 
> I added checking for outstanding requests by hardware just to be safer
> although we may not hit this case of issuing more than 1 outstanding
> frame capture to VI hardware as capture_frame() waits till it sees frame
> start event through HW syncpt increment before proceeding for memory
> write and issuing next frame capture.
> 
> So issuing frame captures are synchronized with frame start and frame end.
> 
> Will remove min_buffers_needed and also explicit check for outstanding
> buffers in v7.

It's still not clear to me how the "pre-queued buffers" will be limited.
I'll take another look at the v7.
