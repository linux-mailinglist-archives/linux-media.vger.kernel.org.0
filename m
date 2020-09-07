Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0A425F9C4
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 13:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgIGLqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 07:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728811AbgIGLpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 07:45:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0E1C061573
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 04:45:46 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so15443372wrl.12
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2020 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1iSOwRMOTuAVprZUp5HmsprqNENo/8GNW4kb9A39p9Q=;
        b=WfIRdTnAVQb9WO/k7sa695b0KPavMb8bzrb/Ry4GuH1I+D63BdYm0mfwgjsKs33ZrZ
         i9NoY51kspRUJ1ce23TygWOjHDsORwVfxj4gT53FUhkWc62QbIOpKYXC5mScJOSLsXYy
         mh8L2ka0e8l9zm2v9/zWNgHwbc1DzWulEyNi5CaNG++c16uBHUzc6wqUkYZYZRmtkECf
         bp7HXfXx9i7/Jjy9Zykyttvlj5gBNvqYZqd0r823YDuiB8/oSR5ktZr8rVhluUi1dhj6
         Bf2LrPoeWICjUKB/0QBBkCDxRNx12Wo2MkeLaEHS+49CwQp7lONxjqZv5ZS2xsM0nBCd
         jeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1iSOwRMOTuAVprZUp5HmsprqNENo/8GNW4kb9A39p9Q=;
        b=c2bxnwEX0ijLC/WsrjDniG+SLmsywJ+kIUWVMc1AfSbyCnLm+XUaodGqpiC/v/0X9J
         V1GM7wFbIND3N0feB886AvEclE8s93N+Kkrjne24f4W/YK/BdOiq5kOTj2K2DPTUc+yK
         qlT6Jm9KmCwjssY6Cu9AZjjJAwHrDE1lJJ9SVJL0iiZyyjAwMKiQIYZCHLtYLesD8lcI
         OtnmuaV+mwvi4BZcFsKGyVyx9VjYIs1qZ5uAQf4munLconP03DXJNps+zFEwng23+rw6
         TkxJqcVSoN1AKeo0TdcOBYFfzK4AogfsO0b9y+6OTojezzd+daHm7Ejyx57W8JMVixS4
         zGAg==
X-Gm-Message-State: AOAM531M5rDM/+R0QkBHBFLcOpoPw5Xkb8rBcla0q5B3d0N5RDZz/kCV
        PuGO4fr/0nVSaO6FzYR+H9Q=
X-Google-Smtp-Source: ABdhPJzyTgV1pUy2x1ctjvS2pqjRf8FH6c5W8i9Uo2lNAmZp83E2SMoxrbxlFwjkeh6uyW9u/NXO5A==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr20851403wrn.63.1599479145442;
        Mon, 07 Sep 2020 04:45:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id q15sm28052659wrr.8.2020.09.07.04.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 04:45:44 -0700 (PDT)
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     kieran.bingham@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        heikki.krogerus@linux.intel.com, jorhand@linux.microsoft.com
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200907094448.GS1891694@smile.fi.intel.com>
 <5375e92a-8e30-e99a-e1ee-1ffe3da32afd@ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Autocrypt: addr=djrscally@gmail.com; keydata=
 mQENBFina8MBCADkNzdnhXy3WNmwSRURUuwDEpqALrwJpwiq7Bfy50y/RBoUOxbNGVif2KVu
 s9ySvNdIGTw1tBiT5sHPRulooStAyBen0iznt1rrb6UY9ehVpTqjv2u8WvM1A6AgD8mOFnHP
 cX7qeCMOeaFPv2afopMgueN+VADDTc91nxl25EQGFITzxlqCKfZw3iPHCnRudSenBpfvuUgK
 ejj8a87cOoLnTrK4yHUnte3YtRZhKGpYPNsPBvWstTEeQZ9W92rU2iqgsTPt0HDcys8O+j9l
 Ariut5bnYCk8b7pZGwmuwv7Ak8QyukEuWzTLdCo84AStil4hUITKDFp2oi4kp5/r+CtxABEB
 AAG0QURhbmllbCBTY2FsbHkgKFBlcnNvbmFsIFBHUCBmb3IgZGFpbHkgdXNlLikgPGRqcnNj
 YWxseUBnbWFpbC5jb20+iQE5BBMBCAAjBQJYp2vDAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwEC
 HgECF4AACgkQ6+4IZDQM6eJBKAf9GjH1iOW2ZZIwKzusCshtqYM3IOtd52eQ+c0Yc+9IWFOA
 Wg93SC52yNGi9mRkgrPDY6R8o4ULjGn9eRI3WWMSMVnJ9D7zt7BdkUa+dOPma7KA7GyEdQsE
 fgIYdbn1EEogt+rSjbgMY4YnRf4wq+wSjLXMno09s26o3Eqq3Ngdvp8WL5pZtrpPape7jZTj
 +YFxbPzkUpF8heSFYGR0B5F7DF0nyBgH1wV/FuFwbqf9UOVdNIMmiw1XsZ5l2i79em34MFGl
 AB+5jTUMQd1KzzFMDzyBlcATXhFDbh13yb3QR8QTId4/GIWizPX7V0MwEWDgq/M/geN1z4uB
 aKgh9n69tLkBDQRYp2vDAQgAvXd0Qjyv+lOWn9nWK9insHzcJMneNrv5VZvoVfxJq9pLOeYO
 VAd/jv0YmXkyWSolV1kxb20aCyMLbH222u6ek3zUSXBBxpJWyKxNMpGLZ6ZZpZRgnMt+swVS
 xOXj2zYByMbMJOrRBKd2YjHkdjjO+gS7EjkZJVTigMKqOXqlEWiWeejt3lq9dZAokdfZVf9Y
 Dk8IHqsPnH6z0edZVK8lLge4FWreXh6Fu9IFdUlSuYh+csGItxMDipbo1LAP4xiPtplJGZmO
 N6DRMUAgmxx/ggPMAZV5LH+/yBt7PZFBKwuZHXcQxLT0Z7pow9WaEAA+NTNTR3AGTakR/u01
 mfMw1wARAQABiQEfBBgBCAAJBQJYp2vDAhsMAAoJEOvuCGQ0DOniwEoH/27UZUfUwIceOjZw
 p+sKyrOsy0bBjYZoVFOFW2nUhpbueLbGeVo8uccMETlyOKen1Xt1MAtGztLXVFBXeaS6RH0q
 Zqo1pZHVDi2dHHiQW/gJwKbcLR4T1HMj8YSc14LS/1PHejfVXq0RxXHLScS/gRcAs2c7bcNi
 QolEKV2LoICKyRipx0MYFggWdEW6E6448AF5UMpdk4mEjQ7rBj1+vHu+TkA1Qv1SfaBTtotb
 82GvWJc7f31Fck5e0KffJmVGFEpONyY6zBT+WJ01cPRhuAT0QOndePYA4IFGrM63Rcg/EPSp
 7sZDBPXqUZgPmQyyZ4RjEaVuNWsPSMB5FSNYHdg=
Message-ID: <ae278864-f73b-cd07-b209-4f3c5acbd373@gmail.com>
Date:   Mon, 7 Sep 2020 12:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5375e92a-8e30-e99a-e1ee-1ffe3da32afd@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On 07/09/2020 11:49, Kieran Bingham wrote:
> Hi Daniel,
> 
> On 07/09/2020 10:44, Andy Shevchenko wrote:
>> +Cc: Surface community people.
>>
>> On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
>>>
>>> Following on from this thread:
>>> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
>>> apologies, can't see a way to reply to it directly.
>>
>> Use lore [5] and its feature of downloading mailbox (or just seeing Message-Id
>> which is enough for good MUA to attach reply properly to the thread).
>>
>> [5]: https://lore.kernel.org/linux-media/12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org/
>>
> 
> I also like to use the NNTP interface on lore:
> 
> nntp://nntp.lore.kernel.org
> 
> That lets you read/reply to many of the kernel lists without actually
> having to subscribe. And of course gets the whole archive too.

Ah, TIL. Thank you both - let me re-send as a reply to the original
thread so that the context is more easily accessible.

>>> Myself and others [1] have been trying to get cameras working on
>>> Microsoft Surface and similar platforms, currently I'm working on
>>> expanding Jordan's module connecting cameras to the cio2
>>> infrastructure (which works - we can use it to take images), aiming to
>>> discover connection information from SSDB in the DSDT, as well as
>>> connect as many supported sensors as are found on the device. I'm just
>>> struggling with a problem I've encountered using the swnode patch that
>>> Heikki linked in that thread; the module's working ok when I only
>>> attempt to connect a single one of my sensors (by preventing the
>>> driver for the other sensor from loading, in which case this new
>>> module ignores the sensor), but when I attempt to connect both cameras
>>> at the same time I get a kernel oops as part of
>>> software_node_get_next_child. The module is creating software_nodes
>>> like this...
>>>
>>> /sys/kernel/software_node/INT343E/port0/endpoint0
>>> /sys/kernel/software_node/INT343E/port1/endpoint0
>>> /sys/kernel/software_node/OVTI2680/port0/endpoint0
>>> /sys/kernel/software_node/OVTI5648/port0/endpoint0
>>>
>>> And that's the structure that I expect to see, but it seems like the
>>> call to list_next_entry in that function is returning something that
>>> isn't quite a valid swnode. Printing the address of c->fwnode after
>>> that point returns "3", which isn't a valid address of course, and
>>> that's causing the oops when it's either returned (in the version of
>>> the function without the patches) or when the program flow tries to
>>> call the "get" op against that fwnode (in the patched version). I've
>>> been trying to track it down for a while now without success, so I
>>> posted the problem on SO[2] and it was suggested that I mail these
>>> addressees for advice - hope that that is ok.
>>>
>>>
>>> My copy of Jordan's module is parked in my git repo [3] for now, and
>>> requires a batch of patches from Jordan's repo [4] (one made by Heikki
>>> to fill in the missing swnode graph pieces, and some further tweaks) -
>>> I've been applying those against 5.8.0-rc7. Any other criticism more
>>> than welcome - I'm new to both c and kernel programming so I'm happy
>>> to take all the advice people have the time to give.
>>>
>>>
>>> On a more general note; Kieran from the libcamera project suggested we
>>> ought to be talking to you guys anyway to get some guidance on design,
>>> and some more expert eye on the things we don't really understand. In
>>> particular; we haven't been able to figure out how sensors that are
>>> intended to work with the cio2 ipu3 stuff have their clock/regulators
>>> supplied - in fact I can strip all the "usual" clock/regulator
>>> functionality out of my camera's driver and it still functions fine,
>>> which seems a bit weird. So far all we're doing as "power management"
>>> of the camera's is turning on the GPIO pins that DSDT tables assign to
>>> the tps68470 PMICs the cameras are theoretically hooked up to...but
>>> given the drivers continue to work without using the PMICs regulator
>>> and clk drivers (which we found in the intel-lts tree on Github),
>>> we're a bit confused exactly how these are connected. Given the
>>> potential for actual hardware damage if we mess something up there
>>> it'd be great if anyone can shed some light on those elements.
>>
>>> [1] https://github.com/linux-surface/linux-surface/issues/91
>>> [2] https://stackoverflow.com/questions/63742967/what-is-causing-this-kernel-oops-when-parsing-firmware?
>>> [3] https://github.com/djrscally/miix-510-cameras/blob/master/surface_camera/surface_camera.c
>>> [4] https://github.com/jhand2/surface-camera/tree/master/patches
>>
> 

