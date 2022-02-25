Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8594C50D4
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 22:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiBYVnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 16:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiBYVnN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 16:43:13 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E355E16042A
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 13:42:39 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u1so6309139wrg.11
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 13:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZjIBPokZVh2FL4kmlfuirYvwIiiFyiXuMTApLKHgDWQ=;
        b=MFLQvig90IYgm+Mn+5S+GDORE+GzVDqHMTXq4R7FwnUvRnRQegb/6QexOkwX7y2dfd
         UGWaXAO8MMu7zCTdHQ4BAdyZDUciOCAN64iOxW7/DLHPKSPEOhIm/xutGqwNEXzCdLQB
         O/omumr6rKptnxrbuKJJvg5oHLCtsMurq2DboRKeeyvp+yBGjrOhHBRJZoQMMCpyi2Mh
         +xUM98a0zLhE3xVq+25gaISH7nLymWmIcuBUb5a16hr+fX182bVBmSssPC9nNYqFOb0Y
         HgAoifJNHwyBIQgg09ZyXsAx4VK4p8jqDZiveU7NFuSLsE/n43cYmw5ZAffeKmWQDJh/
         kO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZjIBPokZVh2FL4kmlfuirYvwIiiFyiXuMTApLKHgDWQ=;
        b=vjYOtMsGxEQV12SJ0D8vaF8mC2BnGgVFj9S1rcTnYEfEyUpM0/HXrJt/3rGcxR0HjH
         Bta1neIrGQzFnjb8J9xFDo5Cm4Vb2Lk5nNh3It0kulWi0hLGTZo3g0/t0WEASFxtJQ6g
         +nJKOpd103lDsDZDyE99c9bLufCfmcAj6s6108+pu9ilyMsaekei4TS2Vug+t9q7omsY
         RddkLa+JI/VqRpEO8tkIBu1cPmpajTzgMYAvjWgdaPMfAQECfVT9U7FO4GFtamzuxyY5
         W09eQwZMbDd5IHeEVWkl4sGEh1MZ/G6bP3O8bLg490iBf2uTSNs+U28RMmte1oPeLLKl
         msgQ==
X-Gm-Message-State: AOAM533DsMjVSZORZ+HUhXGscV4x4bxp5QLeHYpuZ85/WK0Yu3B+VD/n
        VvK32Q+wqBLzvkwdSzXuUdU=
X-Google-Smtp-Source: ABdhPJzeakzojHKMRBEeEbqenUam8VqAPoi1TYNA8HNw59M0VJM4XNdWHwqWsBWsyIan5aat+ZXCcQ==
X-Received: by 2002:a5d:5849:0:b0:1e3:1df9:1b1e with SMTP id i9-20020a5d5849000000b001e31df91b1emr7736673wrf.640.1645825358464;
        Fri, 25 Feb 2022 13:42:38 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c4-20020adfed84000000b001e5b8d5b8dasm4769438wro.36.2022.02.25.13.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:42:37 -0800 (PST)
Message-ID: <25f6d78d-be76-5761-a7f6-2b07c18516ea@gmail.com>
Date:   Fri, 25 Feb 2022 21:42:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/11] media: ipu3-cio2: Add support for
 V4L2_PIX_FMT_IPU3_Y10
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-3-djrscally@gmail.com>
 <YhkKcRL57Qg/VWGO@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YhkKcRL57Qg/VWGO@smile.fi.intel.com>
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

Hi Andy

On 25/02/2022 16:57, Andy Shevchenko wrote:
> On Fri, Feb 25, 2022 at 12:07:44AM +0000, Daniel Scally wrote:
>> We have platforms where a camera sensor transmits Y10 data to
>> the CIO2 device - add support for that (packed) format to the
>> ipu3-cio2 driver.
> ...
>
>> -	},
> Why?


Why have the open and close brace on the same line you mean? Its just
the format that the other entries use, so I copied it.

>
>> +	}, {
>> +		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
>> +		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
>> +		.mipicode	= 0x2b,
>> +		.bpp		= 10,
>> +	}
