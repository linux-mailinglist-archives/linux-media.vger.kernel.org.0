Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B2229440E
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 22:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405139AbgJTUlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 16:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731223AbgJTUlw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 16:41:52 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EE6C0613CE;
        Tue, 20 Oct 2020 13:41:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e17so4148717wru.12;
        Tue, 20 Oct 2020 13:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=amT+L/eATw4jCPQ1I962pg2hjK5VROuVQO4RLBEay7Y=;
        b=k7KyRrxzGJEeBq00dCCLsOCkEhEBR9A2uHhid6BRoEryCBqqi7d8HqTaT1NAkNGtyw
         Cxv7khX4my6hmp3YEMtgIRnrGJYfqYGcIIUdRAITVLECy45qfMkhsJKHMq81k8HbR1w9
         KoEzysvvGuR9mcq13MQ/Q24rs3tzJcS/2TUOMRAQ3/lD6NpVN78GZn7yfRbiJXWPRaIf
         ce5oWRYnyktt6YOfxPP8EvRhPOZIvVXUlypoDQInIWsNKlkrBTARCnXHwT/ukAeYHrMc
         WgJj8RIuSUVgrGsZWZYdIgx88UvNdQoiQcgmPut2lCnWTJ2QZgojxDRl3xLfRLS2OalY
         yOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=amT+L/eATw4jCPQ1I962pg2hjK5VROuVQO4RLBEay7Y=;
        b=tS9eK17+5qVqxMe0sPvDaBDnLlFrpnfd4jqUJM93VmHNDx6zv2ZV5uimAaB2uUdcOp
         hwlvYT/LpaPC0XCisy6RBm8MPIS2aN02Rp3cNb5LLVCzPBvn7hH4WHjyraEsPefs7dwa
         6Mz/sG6+BXiNsHO2nPwDwV2tYsqwnoDkexuzrsxBA1pcl4zpFu/eh0DOUqbiqzw0u0O5
         ChSDN4N1CL0H/5tb/0rhYc5TKoJCMBrZj4e0gxUYK9rjjKSlwRvrhCnLZ5sICR6gzr+9
         6qcPRfqn7XcI+CYYEQ78jxLaaPbFvJBiFrbcvOlHf3gLRSeCbMHvHtHvG3x3hhHt66f+
         ybsg==
X-Gm-Message-State: AOAM530EMwiKnSjKRWBZfGwpOKkusK0pxzR2SSl+Suqn7Q0kigzLL7Mt
        Q7hK4p0g9lgbsJmAAgqpMsk=
X-Google-Smtp-Source: ABdhPJxy0sw9KgIsMyJZ38lAyQm4PNVWfHfD74DG+JXQbOVLUklvP5zkmM7UM4ilWQ/enlawFGlXzQ==
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr228087wrr.134.1603226510698;
        Tue, 20 Oct 2020 13:41:50 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id b5sm4667134wrs.97.2020.10.20.13.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 13:41:50 -0700 (PDT)
Subject: Re: [RFC PATCH v3 6/9] ipu3-cio2: Rename ipu3-cio2.c to allow module
 to be built from multiple sources files retaining ipu3-cio2 name
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-7-djrscally@gmail.com>
 <20201020091544.GZ4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <6ad7efe8-e034-7c6e-0c83-96a1368c3b81@gmail.com>
Date:   Tue, 20 Oct 2020 21:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020091544.GZ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/10/2020 10:15, Andy Shevchenko wrote:
> On Mon, Oct 19, 2020 at 11:59:00PM +0100, Daniel Scally wrote:
>> ipu3-cio2 driver needs extending with multiple files; rename the main
>> source file and specify the renamed file in Makefile to accommodate that.
> Suggested-by?
Oops - yes of course, will add that next version.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> after addressing below comment.
>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v3:
>> 	- patch introduced
>>
>>  drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
>>  drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
>>  2 files changed, 2 insertions(+)
>>  rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)
>>
>> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
>> index 98ddd5bea..b4e3266d9 100644
>> --- a/drivers/media/pci/intel/ipu3/Makefile
>> +++ b/drivers/media/pci/intel/ipu3/Makefile
>> @@ -1,2 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>> +
>> +ipu3-cio2-y += ipu3-cio2-main.o
>> \ No newline at end of file
> Don't forget to add \n at the end of above line.
>
>> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> similarity index 100%
>> rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
>> rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
>> -- 
>> 2.17.1
>>
