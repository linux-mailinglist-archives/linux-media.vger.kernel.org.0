Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45FD288C0C
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 17:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389092AbgJIPCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 11:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388984AbgJIPCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 11:02:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A9FC0613D2;
        Fri,  9 Oct 2020 08:02:31 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g12so10622024wrp.10;
        Fri, 09 Oct 2020 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ENWbjec8S4IA8BQOi2XV4F97rdG2QlQ2wtNQu09Bj/Q=;
        b=diPONgMvaGTSHIrfeD65ykD5Hy64ndWzGhWdpjzStUVRDVI5RiG92W/NvJx4KZWBC1
         ojODOIjfwET9GL37tKkwt4bcDnNBvEMINg2B6jT+8TxAvwG8jdo0kFPyc0WnddDQpn9y
         9cw+K3mj+Au7O8moiTpOT2xcTr14d+xiK6/ySdqjvmdBkLEQeUA+7BCT6TdSGtpM6fQ6
         hRWRgVo68GghPNPd6/KDENgTuN5ntyd8a0ORaDOjA1B5icw4rqzuJdJCl7zSx3DBSbGv
         Waf70VC9NZovCfLHwAQunJQuW1nclCGFdxdjL54f4rs+9eKWIzITBeuTCpb9Xnu0oFTG
         tUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ENWbjec8S4IA8BQOi2XV4F97rdG2QlQ2wtNQu09Bj/Q=;
        b=NQFaH2qtmODmzlRvlbwIXLuYxZrx5Hym9JMYxII4CTBfxyDxy3Vkgq8JaGyB++Bq/u
         d9QP/HlBZQzAC5CCxAJ9DOpz0kT72r1veqI7pT4sZgGfLNoGejvUr0mbzSVH4rLzzsK3
         KVParkDyppvWFaTMjQKO58ay1yOME5oUAN2onLCFBgBP3hZojU2ppB6+I1BAcWVEw0LF
         FUf0P9NnlNWzGfpAXludTBBKo+dyhKAzkvgfRVoZSETUcuQSkMwlo73KnWVjE8VJjqHI
         zOfqpXZ3UVye+9blkDxwjYVjVgDrf4/fGS7o9mQgF2PPT7Ci58yWatXnQWldhslYjc0n
         UMgg==
X-Gm-Message-State: AOAM5327Jld4t20ssPDGwCJVT7GUVx1PHOnGcVVMe00LfBx5tbTd3X+G
        rFMb0GgfdaEvSymqaoNJEJM=
X-Google-Smtp-Source: ABdhPJxEe+sEcVoIiJmB3W7+0A9SePJwIibYckpxCUm61A3Og/kigmhNcb6sz3WBuAoB/SWdb+qOhA==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr1500392wrq.154.1602255749778;
        Fri, 09 Oct 2020 08:02:29 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id p13sm12394180wmb.5.2020.10.09.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 08:02:29 -0700 (PDT)
Subject: Re: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com
References: <20201001093326.6208-1-djrscally@gmail.com>
 <20201001173745.GJ3956970@smile.fi.intel.com>
 <b27bc66c-4cb7-0dcc-a828-3aca4f0738db@gmail.com>
 <20201009124424.GD4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <694f4ce1-76eb-914a-ac81-2be969cc3665@gmail.com>
Date:   Fri, 9 Oct 2020 16:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009124424.GD4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/10/2020 13:44, Andy Shevchenko wrote:
>> ...I agree with your other email re. turning this into a series and
>> making the additional changes you suggested, so I'll do that too for the v3.
> I forgot to mention module rename as a separate patch. So, something like 6
> (or more) in a series I would expect.

Yeah no problem, I'll do that too.

>
>>>> +// SPDX-License-Identifier: GPL-2.0
>>> Author line perhaps?
>> You mean literally just like /* Authored By: Dan Scally */ or something?
>> OK, no problem.
> * Author: Dan Scally <foo@bar.com>

Okedokey

>>>> +static const struct ipu3_sensor supported_devices[] = {
>>>> +	IPU3_SENSOR("INT33BE", "INT33BE:00"),
>>>> +	IPU3_SENSOR("OVTI2680", "OVTI2680:00"),
>>>> +	IPU3_SENSOR("OVTI5648", "OVTI5648:00")
>>> In such cases please leave comma at the last item as well. Easier to extend w/o
>>> an additional churn.
>>>
>>> On top of that, please avoid putting *instance* names, i.e. the second
>>> parameters in your macro call. What code should do is to take _HID (first
>>> parameter) and call acpi_dev_match_first_dev() or so.
>> Yeah I was originally using the i2c_client's name field (this comes into
>> play during cio2_bridge_reprobe_sensor()) but the matching refused to
>> work using anything but a string literal. Let me take another look at
>> this then.
> I meant that you get an instance name from the first found device, like
>
> 	char instance_name[I2C...];
>
> 	adev = first_match_dev();
> 	if (adev) {
> 		snprintf(instance_name, ..., acpi_dev_name(adev));
> 		...
> 	} else {
> 		...
> 	}
Ah, yes, this is better than messing around getting the i2c_client - thanks
>> I thought you were hinting that I should use kcalloc in the comments
>> from the last patch to get an array of zero valued entries but I guess I
>> misunderstood - I can just memset these arrays to 0 and assign all but
>> the last entry directly and that seems to work fine, so I'll switch to that.
> The idea behind that any kcalloc() or kzalloc() against a container (whatever
> data structure that has those property arrays) will do it for you. So, I think
> neither kcalloc() nor stack is needed. Instantiate properties directly in the
> arrays of sensor data structure.
Will do
>>>> +	endpoint = fwnode_graph_get_next_endpoint(pci_dev->dev.fwnode, NULL);
>>> dev_fwnode()
>> I avoided that thinking there might be a case where a CIO2 device has a
>> fwnode but not endpoints defined for some reason, but I'm not familiar
>> enough to judge whether that situation will ever occur - if it's safe to
>> do it that way then I'll switch it over.
> I meant
> 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&pci_dev->dev), NULL);
Ah! Of course, I'll make that change too, thanks
