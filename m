Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1F52725A2
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 15:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgIUNeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 09:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgIUNeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 09:34:00 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80625C0613CF;
        Mon, 21 Sep 2020 06:34:00 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id a9so12738450wmm.2;
        Mon, 21 Sep 2020 06:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PSlR6UEl0k2mghvqxd0Ilre5cll+vxg1D9fFnWV554k=;
        b=rgQgX6qUkRAi0UCi/mtfzJqE/csdkBuY4H2g5YPpJn3xtwt1X7JxJAi+3wprjmcKZC
         aHgWow6pFeJQzhXjl/ZYmeOsOU/iyCw+Dw9oySAPctYk3EBKE9TcRi0YY/BFKbFKPTpU
         9u0XpcCHQcywy13FSP0L39aabKU5+xvApYqLigXc/mXSJ9fg+4W3AFZdCFiB1/RUEjO4
         RkGZfN3RixKgV1NxUKprEFYmKv/xzIDZ9oV9zuRM6Nutj8UcYbgKSMvNxHRHAmTEwFRn
         EyzXLbQpI6jLExIj44MTLDNuUW695bYoYRdiNGO5lYb/Sx0k8GF95BtkGQo/YQmvoRQ7
         Rdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PSlR6UEl0k2mghvqxd0Ilre5cll+vxg1D9fFnWV554k=;
        b=Vxet9340dMMIbeJwlOMOVsNuVr8YagTTOg5MVinhRj3hnNQ3DA/hwIscAO1R5OP9kU
         KdMgcqK8kUQ8gpYkQ6vT0KsRtDsSqjvHuiL0MjYPxx3EokDYuAkqQniV5928Ymz1By1/
         GotkM9e8tEJ8ACMx1/6O1ZMW6H4PbmxzOPELM0961SxR9M+nZ1MRVo+OiHxYTFVk+t0J
         4Z457VDYWcDt1/1sbnHPl5N+SbfCdDtK30/yktFYNTeqBjFYvb7zUq5D92Q27BXjEuT2
         gIqw0FwwaTU+t/hjfddUFT9oVCCAkL+Vh2JhR6O2bfgVcWxEvMP+P9Jkp8IIjMmq5rc5
         kfCQ==
X-Gm-Message-State: AOAM5330D6T41MlOHYwuJ3YmZvxkxgpkfoVgJMmrmWG9/jSn5axNKZ8Z
        mfuh2do64uUZp55a1m1dtWo=
X-Google-Smtp-Source: ABdhPJxs7SLQzpL7shi76iakBUBJaNASPqq5USxGQbR2ll5qMDRJbC8+U5kFag9gl1ppteY3tamIVA==
X-Received: by 2002:a1c:9a0c:: with SMTP id c12mr30789130wme.85.1600695239140;
        Mon, 21 Sep 2020 06:33:59 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id d9sm13017803wmb.30.2020.09.21.06.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 06:33:58 -0700 (PDT)
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        davem@davemloft.net, robh@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com>
 <20200917124514.GK3956970@smile.fi.intel.com>
 <20200918075157.GF26842@paasikivi.fi.intel.com>
 <20200918130739.GA3956970@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <66e33cd5-6c1e-310a-61e8-6cde720ffa19@gmail.com>
Date:   Mon, 21 Sep 2020 14:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918130739.GA3956970@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/09/2020 14:07, Andy Shevchenko wrote:
> On Fri, Sep 18, 2020 at 10:51:57AM +0300, Sakari Ailus wrote:
>> On Thu, Sep 17, 2020 at 03:45:14PM +0300, Andy Shevchenko wrote:
>>> On Thu, Sep 17, 2020 at 11:52:28AM +0100, Dan Scally wrote:
>>>> On 17/09/2020 11:33, Sakari Ailus wrote:
>>>>> a module and not enlarge everyone's kernel, and the initialisation would at
>>>>> the same time take place before the rest of what the CIO2 driver does in
>>>>> probe.
>>>> I thought of that as well, but wasn't sure which was preferable. I can
>>>> compress it into the CIO2 driver though sure.
>>> Sakari, I tend to agree with Dan and have the board file separated from the
>>> driver and even framework.
>> And it'll be linked to the kernel binary then I suppose?
> Solely depends to your Kconfig dependencies and declaration.
>
> From code perspective you may do it before enumeration of the certain device or
> after with reprobe.
>
>> I don't have a strong opinion either way, just thought that this will
>> affect anyone using x86 machines, whether or not they have IPU3. I guess it
>> could be compiled in if the ipu3-cio2 driver is enabled?
> Of course!

Apologies both - my inexperience is showing here: I thought you couldn't
make it compile into the kernel where it's dependent on another piece of
code that's configured to be a module? In my case, ipu3-cio2 plus some
other dependencies are configured as modules; VIDEO_DEV and VIDEO_V4L2
notably. Is that not right?


It would probably make the probe() ordering issues easier if it could be
compiled in, since I could just rely on late_initcall() in that case and
I guess that should work.

