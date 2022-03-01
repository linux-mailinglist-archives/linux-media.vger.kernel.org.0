Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7201B4C994F
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 00:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbiCAX2l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 18:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbiCAX2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 18:28:40 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F531EC7C
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 15:27:58 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so207083wmb.3
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7gNpxvDNpCJjNgnqCQMCAacPtSI36/h74bUhvFWKQMU=;
        b=aVBHbrF19A2o+QFNcbUSw3hKnJd7QkpxDP9d6vLLf6jJ2F7GnDQAh0Wd1Bz9rnZqh3
         XEMPFT4muWhD9RJIjV1CxsxK6NvUpaPdt7nNimRdADdznCkGktWM/TXhNDm5byZDdWXe
         W4MTd35HXF1aZeZnN8Ij11WGI1aLDK6AAgdenG4uDTrdvqhXRZ161YC1Xo6vd8bP+Ssp
         A2AMv7BMnHWIxtrkP+Az/BnxxrWTZTF5Kcm29R3duzPjUN5X0DVjcjnjHQjYH9dWFQb8
         1hgG796LVU7mkEZ+LvhP8qr8GnQJjbtoT4uxVR04ybALUZVxghVigW92CJUEyHpZGwG4
         nfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7gNpxvDNpCJjNgnqCQMCAacPtSI36/h74bUhvFWKQMU=;
        b=OKwJNqkDJeNuiKWCHA+MMTHnNjk5WAulQP386t7MEH/NDKP9T5NN/JY9d9587RO5FS
         5JgYle1+DybJsPf7v+LUaQRwuWu1J7RaVvwFWr67BFHzKblFIIpBQBOatBzd9eyySW+Z
         bqF8TfZJVkcclhTWOc5Djexfdbj6l3kTWzsIpQMqQZPBVYvegH7eBwmjQ690dqx/gpfP
         UjIzkkUtKfX2BfyO6YwBfBuw4Fzl1Jbun2zJQ5SEX1516pDoijrjgTxc8yd2d0goMh2o
         rDRjWpCjrju8J18TqYpeWd3rZ0m4WfCzXPp++HXkmUUjYT40v4BF+bmfPbwWNqBpc+x2
         d6iA==
X-Gm-Message-State: AOAM532TJTToCGW1/SiQTrj+odcJYelQuHsFTusE+ApAe1uChEwL/0vV
        o12cX2dCYvlpJPhDoBWx+X8=
X-Google-Smtp-Source: ABdhPJw7V5RYjVHSC61kdwiJ6DYc6sMvmZB9fV5CUdoCuZn+oSQzJp6gVVZU/msqOSNlEMkamks/vw==
X-Received: by 2002:a1c:4346:0:b0:380:dda2:cb4e with SMTP id q67-20020a1c4346000000b00380dda2cb4emr18373192wma.75.1646177276798;
        Tue, 01 Mar 2022 15:27:56 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id i15-20020a5d522f000000b001e85b14dadcsm14834693wra.5.2022.03.01.15.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 15:27:56 -0800 (PST)
Message-ID: <3086ab96-5321-1ec5-eac9-173350c91f49@gmail.com>
Date:   Tue, 1 Mar 2022 23:27:55 +0000
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
 <6def6eb4-d246-ce6c-016c-f2f48c736668@gmail.com>
 <Yh4u1x0XNV89jm4v@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <Yh4u1x0XNV89jm4v@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01/03/2022 14:33, Andy Shevchenko wrote:
> On Mon, Feb 28, 2022 at 11:11:27PM +0000, Daniel Scally wrote:
>> On 28/02/2022 11:55, Andy Shevchenko wrote:
>>> On Fri, Feb 25, 2022 at 10:04:29PM +0000, Daniel Scally wrote:
>>>> On 25/02/2022 17:09, Andy Shevchenko wrote:
> ...
>
>> Basically it seems better to me to just let it match by device rather than
>> have the names. The only advantage I can see for the names is if a device
>> has multiple clocks assigned to it...but there are no instances of that in
>> media/i2c.
> I have heard you, but leave for the judgement done by maintainers.
>

Fair enough :)

>
>>>> Broken ACPI compensated for by the cio2-bridge - it creates the
>>>> clock-frequency property which ordinarily wouldn't be there on ACPI systems
>>>> AIUI.
>>> In the current practice we have CLK priority over property, this means we may do:
>>> 1) unconditional reading of the property;
>>> 2) trying CLK.
>>>
>>> Can it be done here?
>> Er, can you point me to an example?
> Something like
>
> 	device_read_property_u32("clock-frequency", &rate);
>
> 	clk = devm_clk_get_optional(...);
> 	if (IS_ERR(clk))
> 		return PTR_ERR(clk);
>
> 	clk_rate = clk_get_rate(...);
> 	if (clk_rate == 0)
> 		clk_rate = rate;
> 	if (clk_rate == 0)
> 		return dev_err_probe(...);
>
Gotcha - ok sure, leave that with me.
