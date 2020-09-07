Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15CC25F8CB
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 12:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgIGKt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 06:49:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbgIGKt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 06:49:27 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4887335;
        Mon,  7 Sep 2020 12:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599475762;
        bh=BOOA/xUWghAYAm2WkuiBQBsiIwNurUWQ8z2XIspbfVI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GTuUJ/TsivqyOPQRZPcdq0cCWRV31wVaZ8FDCPMmttQ4synmMqO4fulxjIvRJItos
         n8Y0AZh0446P2gPpXqMjBcqUT+xmd0NRTheOh1gVuNbz0QuPSamylBviGXE8vzS0R+
         C3+39qH15a6o72hQjWi/28NHyp1/8oVhFDz4FvoU=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        heikki.krogerus@linux.intel.com, jorhand@linux.microsoft.com
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200907094448.GS1891694@smile.fi.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <5375e92a-8e30-e99a-e1ee-1ffe3da32afd@ideasonboard.com>
Date:   Mon, 7 Sep 2020 11:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200907094448.GS1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 07/09/2020 10:44, Andy Shevchenko wrote:
> +Cc: Surface community people.
> 
> On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
>>
>> Following on from this thread:
>> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
>> apologies, can't see a way to reply to it directly.
> 
> Use lore [5] and its feature of downloading mailbox (or just seeing Message-Id
> which is enough for good MUA to attach reply properly to the thread).
> 
> [5]: https://lore.kernel.org/linux-media/12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org/
> 

I also like to use the NNTP interface on lore:

nntp://nntp.lore.kernel.org

That lets you read/reply to many of the kernel lists without actually
having to subscribe. And of course gets the whole archive too.


>> Myself and others [1] have been trying to get cameras working on
>> Microsoft Surface and similar platforms, currently I'm working on
>> expanding Jordan's module connecting cameras to the cio2
>> infrastructure (which works - we can use it to take images), aiming to
>> discover connection information from SSDB in the DSDT, as well as
>> connect as many supported sensors as are found on the device. I'm just
>> struggling with a problem I've encountered using the swnode patch that
>> Heikki linked in that thread; the module's working ok when I only
>> attempt to connect a single one of my sensors (by preventing the
>> driver for the other sensor from loading, in which case this new
>> module ignores the sensor), but when I attempt to connect both cameras
>> at the same time I get a kernel oops as part of
>> software_node_get_next_child. The module is creating software_nodes
>> like this...
>>
>> /sys/kernel/software_node/INT343E/port0/endpoint0
>> /sys/kernel/software_node/INT343E/port1/endpoint0
>> /sys/kernel/software_node/OVTI2680/port0/endpoint0
>> /sys/kernel/software_node/OVTI5648/port0/endpoint0
>>
>> And that's the structure that I expect to see, but it seems like the
>> call to list_next_entry in that function is returning something that
>> isn't quite a valid swnode. Printing the address of c->fwnode after
>> that point returns "3", which isn't a valid address of course, and
>> that's causing the oops when it's either returned (in the version of
>> the function without the patches) or when the program flow tries to
>> call the "get" op against that fwnode (in the patched version). I've
>> been trying to track it down for a while now without success, so I
>> posted the problem on SO[2] and it was suggested that I mail these
>> addressees for advice - hope that that is ok.
>>
>>
>> My copy of Jordan's module is parked in my git repo [3] for now, and
>> requires a batch of patches from Jordan's repo [4] (one made by Heikki
>> to fill in the missing swnode graph pieces, and some further tweaks) -
>> I've been applying those against 5.8.0-rc7. Any other criticism more
>> than welcome - I'm new to both c and kernel programming so I'm happy
>> to take all the advice people have the time to give.
>>
>>
>> On a more general note; Kieran from the libcamera project suggested we
>> ought to be talking to you guys anyway to get some guidance on design,
>> and some more expert eye on the things we don't really understand. In
>> particular; we haven't been able to figure out how sensors that are
>> intended to work with the cio2 ipu3 stuff have their clock/regulators
>> supplied - in fact I can strip all the "usual" clock/regulator
>> functionality out of my camera's driver and it still functions fine,
>> which seems a bit weird. So far all we're doing as "power management"
>> of the camera's is turning on the GPIO pins that DSDT tables assign to
>> the tps68470 PMICs the cameras are theoretically hooked up to...but
>> given the drivers continue to work without using the PMICs regulator
>> and clk drivers (which we found in the intel-lts tree on Github),
>> we're a bit confused exactly how these are connected. Given the
>> potential for actual hardware damage if we mess something up there
>> it'd be great if anyone can shed some light on those elements.
> 
>> [1] https://github.com/linux-surface/linux-surface/issues/91
>> [2] https://stackoverflow.com/questions/63742967/what-is-causing-this-kernel-oops-when-parsing-firmware?
>> [3] https://github.com/djrscally/miix-510-cameras/blob/master/surface_camera/surface_camera.c
>> [4] https://github.com/jhand2/surface-camera/tree/master/patches
> 

-- 
Regards
--
Kieran
