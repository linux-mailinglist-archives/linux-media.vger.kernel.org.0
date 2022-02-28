Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3608D4C7E20
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 00:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiB1XMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 18:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiB1XML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 18:12:11 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9CB13E2D
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 15:11:31 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id a13-20020a05600c348d00b0038188b8bbf6so168638wmq.0
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 15:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=inRtnnZ86NiohNRNlfHRDXVMguo+ciHq+lo0YibJMuI=;
        b=kJQ+0H52HNoGDMjiuULROIemceT7w+Wm3iMtIzORFhV5KKNa6wFlcxObdKPDs0N4Vz
         87CHpD9ziV9KuaXgJjFByQmcncXnyovHfxUGKjRbGbH2YPK322Eso1mCuDbmMIPUCc8M
         +6aqouFdgSh5g3F/uldj5LV8xRx/ax03LH55eopA+nSFUnWm67nt79PznIiwNKijM+p3
         xurbBaRSCnvsGulXKY0hWvONudAs8QjlhndXF8NE80BPBGA5gEgtNeDO81UgqeqVNHCp
         aTB9V4ntyLfR8b9KIPbsNYMYr8F9uLzJbjw8rNKT6TuUahmAKDB4wtGHeHqbkuEAcp/u
         887A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=inRtnnZ86NiohNRNlfHRDXVMguo+ciHq+lo0YibJMuI=;
        b=OV4xLHovme1LQ7RkriqTFj1fuXgbru1ABEENOfiJHzJFNKNKjVLNeqBBZrTs9K3uFK
         30jt4FCngeApwwWuKESOMypdZd5Kng2qUkHy9trYThVNWj2S40K1xeFTvEbBNvIYykKx
         CmWSTUSVzEY8igh47fbE5CRNoMGFq+PCxF07nIjdffyPzMEUXSxEIY6fwtt3GVLTw4+Y
         SDZLMf80WFqQhPr+Qtw2HD/MY0/aOTf26rljzzpjx+731iwbxa9vBkkoMf5hInXVeLu0
         Tqi3UnQ47DCim995BakyxUJWuJwXVJgxkzgTWEiZTlfQTpU0uveYlw4DUh6Qscicx3bv
         Qlag==
X-Gm-Message-State: AOAM53359lXr0Kto2UD4ZJAGawSIN/d8rUZ9y1I5l+hBHybkiOgo/M1A
        FM536Mw0K5HQKL1rIC1L6uE=
X-Google-Smtp-Source: ABdhPJzIYkBeba6r47W24dR6o0q/oV7ByllCoFUtTTJVH7X8REpMHfXcdctV5NwMg5LX2AehNZHzSg==
X-Received: by 2002:a05:600c:6019:b0:380:f8bc:ddf3 with SMTP id az25-20020a05600c601900b00380f8bcddf3mr15137476wmb.117.1646089889711;
        Mon, 28 Feb 2022 15:11:29 -0800 (PST)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k19-20020a05600c479300b00380e461a4d2sm956967wmo.0.2022.02.28.15.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 15:11:29 -0800 (PST)
Message-ID: <6def6eb4-d246-ce6c-016c-f2f48c736668@gmail.com>
Date:   Mon, 28 Feb 2022 23:11:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
 <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
 <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
 <Yhy4MwU320D3mxeO@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <Yhy4MwU320D3mxeO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 28/02/2022 11:55, Andy Shevchenko wrote:
> On Fri, Feb 25, 2022 at 10:04:29PM +0000, Daniel Scally wrote:
>> On 25/02/2022 17:09, Andy Shevchenko wrote:
>>> On Fri, Feb 25, 2022 at 12:07:49AM +0000, Daniel Scally wrote:
> ...
>
>>>>    	/* get system clock (xclk) */
>>>> -	ov7251->xclk = devm_clk_get(dev, "xclk");
>>>> +	ov7251->xclk = devm_clk_get(dev, NULL);
>>> Why a clock doesn't have a name anymore?
>>> Shouldn't you rather switch to _optional()?
>> The problem is since we could have a the clock coming from some dt file with
>> it named xclk, as this driver is obviously designed for, but it also can be
>> created by the int3472-tps68470 or int3472-discrete drivers which don't use
>> that name. Without knowing what it's called, best thing I could think to do
>> was remove the name and rely on device matching.
> So, then the Q is why it's not called the same in the other drivers?


If I'm honest this is one of those areas I'm still sketchy on, in 
drivers/media/i2c I see calls to clk_get with clock names like so:


eclk

extclk

mclk

refclk

xclk

xti

xvclk


But those only work if the firmware (I.E. dt) for the device defines 
that name for the clock which means they need to define the dt in a 
particular way.  So if I make the int3472-discrete driver (which is sort 
of playing the part of dt here) register the clocks called "xclk" that 
means the drivers all need to have that name too, which breaks the dt 
entries if they weren't originally called that. On the other hand, if 
the driver has no name but relies on device matching it will work for 
both the original dt and also for the int3472-discrete driver's clock


Basically it seems better to me to just let it match by device rather 
than have the names. The only advantage I can see for the names is if a 
device has multiple clocks assigned to it...but there are no instances 
of that in media/i2c.


>
>> Broken ACPI compensated for by the cio2-bridge - it creates the
>> clock-frequency property which ordinarily wouldn't be there on ACPI systems
>> AIUI.
> In the current practice we have CLK priority over property, this means we may do:
> 1) unconditional reading of the property;
> 2) trying CLK.
>
> Can it be done here?


Er, can you point me to an example?


>
