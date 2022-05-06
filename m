Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198E051E1F9
	for <lists+linux-media@lfdr.de>; Sat,  7 May 2022 01:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444480AbiEFWti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 18:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444447AbiEFWte (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 18:49:34 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38E21AF37
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 15:45:48 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d5so11800161wrb.6
        for <linux-media@vger.kernel.org>; Fri, 06 May 2022 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hJiHWxwXKtK36bW/2X0v+dl0gAVUjY8R/giSjwrjmzc=;
        b=nilpvhX8uPHqVNJfUJGR2OSzjwLjl2J9YgZnKgBQMPaEHICk2nFea8lOhILI1PwXkf
         LzLBALXKnWPZOKv/UOKHBYebDwIxMRtdVbHPT8+/Fb3pDjxX9M91dydZ9BhQ3FBKS4Ob
         qDYdhZkjFDnXObht4UcDHhyZK8Tjlh0XjVaE9qpk/pSLa8MCTBFrI9GLoq9wrqYQXkfZ
         M4/IfLh5btep72AQ2WOZZDWFYts+G4ZbrtpEos4fvO9xtLW//EBswmQyBFBN0cgJFn0C
         jTQkwT/gLEkTcAKeCKr0KE/nzHeaQlyLMyAU0RoD7Z6KgjVBU4uoSvAdPqHNyGyw9F2B
         3lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hJiHWxwXKtK36bW/2X0v+dl0gAVUjY8R/giSjwrjmzc=;
        b=7NyW5tWeRE2SDKeMMDq8OpiyoxuH8RQDCFd0HBx9lTvB/AuZeD2BK0TSmdWuCtFfd0
         akkiFPNiY1lL2f9j5qzvVFTktjyvoLg34yAXnUHsD60BSFgQdehRLb2c3avVlqPIfKQE
         HBEsqs3pm3Vd3R3zvIGVJHv6CH/062aEtUwXJEqdsO+E5z/A0NfE5HAl+/2fCT7p98BC
         JVzYNShm1hG1spSNT0Q4zFW0CmUMlEoI9srIBQltwg87rkEtwaVy7i4E3yb+GLOa4S58
         /+zsoPSdLFdb0r01XVCTg6Pw7GyEwJujxfIgznYX+5kMCKI6JtUpHsIgDvrmPJ49QqIH
         2bxw==
X-Gm-Message-State: AOAM530hrsnMHBs0QjxqQ57N3OqYS0eAsgK6fVXG/sWG6XS2Qba3GF8q
        aGLjKVWUvmUnLJCJsJD97BQ=
X-Google-Smtp-Source: ABdhPJwywja4ZI1f4irnTp1S7+NuH6N3s0NaM3ZbDDVQ7xJIcvI+jLL+pi/V54ipiX6UtgRkT5rAMg==
X-Received: by 2002:adf:f803:0:b0:20a:d4a9:b67e with SMTP id s3-20020adff803000000b0020ad4a9b67emr4574608wrp.171.1651877147408;
        Fri, 06 May 2022 15:45:47 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c21cc00b003942a244f42sm10751465wmj.27.2022.05.06.15.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 15:45:47 -0700 (PDT)
Message-ID: <9904b8c3-caac-68d0-06e6-fba6e58d7be1@gmail.com>
Date:   Fri, 6 May 2022 23:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 00/15] Support OVTI7251 on Microsoft Surface line
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
References: <20220505230402.449643-1-djrscally@gmail.com>
 <YnWjLFYECEmhLwjG@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YnWjLFYECEmhLwjG@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 06/05/2022 23:37, Andy Shevchenko wrote:
> On Fri, May 06, 2022 at 12:03:47AM +0100, Daniel Scally wrote:
>> Hello all
>>
>> This series extends the OV7251 driver so it's functional on the
>> Microsoft Surface line of laptops, where it's used as the IR
>> camera for face login. The camera sensor is connected to a CIO2
>> device which packs the 10-bit greyscale data into 25 pixels per 32
>> bytes similar to the IPU3 formats for Bayer data, so I also added
>> a new format to describe that and added it to the ipu3-cio2 driver's
>> list of supported formats. 
> Good to me
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Thank you!

>
> AFAIU the __be16 and related stuff you are planning to update later on,
> correct?


Yep - I'm trying to get the IR LED to work reliably when the camera is
streaming which needs a couple more changes to this driver, so I can
include it in that series.

>
>> Series-level changes:
>>
>> 	- None
>>
>> Thanks
>> Dan
>> Daniel Scally (15):
>>   media: uapi: Add IPU3 packed Y10 format
>>   media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
>>   media: i2c: Add acpi support to ov7251
>>   media: i2c: Provide ov7251_check_hwcfg()
>>   media: i2c: Remove per-mode frequencies from ov7251
>>   media: i2c: Add ov7251_pll_configure()
>>   media: i2c: Add support for new frequencies to ov7251
>>   media: i2c: Add ov7251_detect_chip()
>>   media: i2c: Add pm_runtime support to ov7251
>>   media: i2c: Remove .s_power() from ov7251
>>   media: ipu3-cio2: Add INT347E to cio2-bridge
>>   media: i2c: Extend .get_selection() for ov7251
>>   media: i2c: add ov7251_init_ctrls()
>>   media: i2c: Add hblank control to ov7251
>>   media: i2c: Add vblank control to ov7251 driver
>>
>>  .../media/v4l/pixfmt-yuv-luma.rst             |  14 +-
>>  drivers/media/i2c/ov7251.c                    | 749 +++++++++++++-----
>>  drivers/media/pci/intel/ipu3/cio2-bridge.c    |   2 +
>>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   5 +
>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>>  include/uapi/linux/videodev2.h                |   3 +-
>>  6 files changed, 553 insertions(+), 221 deletions(-)
>>
>> -- 
>> 2.25.1
>>
