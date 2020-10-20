Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497CC294547
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 00:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410466AbgJTW4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 18:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390707AbgJTW4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 18:56:04 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF77C0613CE;
        Tue, 20 Oct 2020 15:56:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n18so61370wrs.5;
        Tue, 20 Oct 2020 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iic84Z/oBcWE3Unby/8/YL1i12JFJoNFvlVEyjGsfm4=;
        b=m3yGeEM6Id2TgNUNLN4rtZwaPT/WMM+7yKVB7NNal61FY3hAGZp34tb/khIu7y9RsC
         jX6Dlzp8zv4fSTlAGmk+TzNfi4tGXP/iIavZrtlzu2mVF3BUv2zauMnuNH9PhQyPydWH
         MPUV4kIg6+TOmXO1sI/vGTaWyYXBzlXdn1YO4gnoaMYIrCdB3lcoGMnkX5LuFYkBzw+u
         WcUnw527twhhH7IkLWffWN6jnJpk3n2jMX6SNJQAeobO3K21TPJrbQE39zmLabJl+OCZ
         qih0WaxEq7zbAGBimK2c/4pyg9CT9O/JMjSKUzkdGtla0MAcgWUQlYVxZ9yVG/X8phtI
         QzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iic84Z/oBcWE3Unby/8/YL1i12JFJoNFvlVEyjGsfm4=;
        b=ZNM7enOKcPWQsdlfVCcSjRcUwJf/FjWtJyZ0Yh7jPFe3q0bhi99ZMcdYxZ4PTZlIeh
         s+pLPJUigMRtHso/fk+bI7OwBgegM8fD9pl8m32XpUfY/Yz2auPwPVJ74B4Hu/9lShV7
         lxkBD7KwOwbqmxLKvf/N/jTSej5KIMGoQ2+ag5xJZZddpe/SS6UP03k58/xyyIQJhcY0
         KOLkAXwg4DJ2ONTzhiRThYShjeW9fOMsFLlKIjk5HQsHNHKm3IfLSFr1X7ronEJqNSuE
         kBGxz2eyqWXl7GHCTw/Q8tKXZVLrfvRlWPUIyhCGSKaMPlqgMhfh9RuODby/E4in49eQ
         VIFg==
X-Gm-Message-State: AOAM530CxAhXfIR8YZhvcTpODXOu1gwuzRn4kzcZcbGB8+jb4vJNKlqR
        QH/x27wBl7krJbFE88PFkmM=
X-Google-Smtp-Source: ABdhPJzDrwXgtHcWHpRY0IeBpnM5e5ueGtbsblG4vSJprNcFyN77nGpAduUNEZ8OjK+SJ3KzQjg9+Q==
X-Received: by 2002:a05:6000:1045:: with SMTP id c5mr720160wrx.296.1603234561294;
        Tue, 20 Oct 2020 15:56:01 -0700 (PDT)
Received: from [192.168.1.211] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id l1sm391662wrb.1.2020.10.20.15.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 15:56:00 -0700 (PDT)
Subject: Re: [RFC PATCH v3 7/9] ipu3-cio2: Check if pci_dev->dev's fwnode is a
 software_node in cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED
 if so
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, yong.zhi@intel.com, rafael@kernel.org,
        gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-8-djrscally@gmail.com>
 <20201020091958.GC4077@smile.fi.intel.com>
 <20201020120615.GV13341@paasikivi.fi.intel.com>
 <32bbb4db-17d7-b9d1-950f-8f29d67539c3@gmail.com>
 <20201020224910.GB2703@paasikivi.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <6a77e6d8-45b4-e4d3-ad16-97a8573c8efc@gmail.com>
Date:   Tue, 20 Oct 2020 23:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020224910.GB2703@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 20/10/2020 23:49, Sakari Ailus wrote:
> Hi Dan,
>
> On Tue, Oct 20, 2020 at 08:56:07PM +0100, Dan Scally wrote:
>> Hi Sakari
>>
>> On 20/10/2020 13:06, Sakari Ailus wrote:
>>> Hi Andy,
>>>
>>> On Tue, Oct 20, 2020 at 12:19:58PM +0300, Andy Shevchenko wrote:
>>>> On Mon, Oct 19, 2020 at 11:59:01PM +0100, Daniel Scally wrote:
>>>>> fwnode_graph_get_endpoint_by_id() will optionally parse enabled devices
>>>>> only; that status being determined through the .device_is_available() op
>>>>> of the device's fwnode. As software_nodes don't have that operation and
>>>>> adding it is meaningless, we instead need to check if the device's fwnode
>>>>> is a software_node and if so pass the appropriate flag to disable that
>>>>> check
>>>> Period.
>>>>
>>>> I'm wondering if actually this can be hidden in fwnode_graph_get_endpoint_by_id().
>>> The device availability test is actually there for a reason. Some firmware
>>> implementations put all the potential devices in the tables and only one
>>> (of some) of them are available.
>>>
>>> Could this be implemented so that if the node is a software node, then get
>>> its parent and then see if that is available?
>>>
>>> I guess that could be implemented in software node ops. Any opinions?
>> Actually when considering the cio2 device, it seems that
>> set_secondary_fwnode() actually overwrites the _primary_, given
>> fwnode_is_primary(dev->fwnode) returns false. So in at least some cases,
>> this wouldn't work.
> Ouch. I wonder when this happens --- have you checked what's the primary
> there? I guess it might be if it's a PCI device without the corresponding
> ACPI device node?
Yes; it's null, and I think that diagnosis is correct.
> I remember you had an is_available implementation that just returned true
> for software nodes in an early version of the set? I think it would still
> be a lesser bad in this case.
Yep - I can put that back in and just drop this patch then; fine for me.
