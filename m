Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A694626338A
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730936AbgIIRFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730269AbgIIPmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 11:42:15 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF1CC0612F1
        for <linux-media@vger.kernel.org>; Wed,  9 Sep 2020 07:33:47 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a17so3219899wrn.6
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2020 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/ca+vak/nY1/dpJAdQ8uc8u3bN8ZJitqD7jcESX7e/0=;
        b=GEtz9Qj69XvSxQFB7oP3DmWZZta5CaJBq5co+8sBjL88ggUewnmhkpXOjaKUDSTkwL
         u6XmVG0x13Z5aZF5eJ258G7sAwjwATYF59eEq3ZMrBBkbzUsi78gWGdUcWCrsJ66tZIj
         /lYA3o/kXjd1K30PAu/hSwtyRglHeLbhFc1+rMu/XKLQJj3JPedxNRVzF3mtrPaLyt2B
         ZTM2mnX3HbgzcPTmq92HHBhabb+M0ruzIug0PsdLt4psoVsXGy2CNQZlhX/2aygBbzXs
         WP6brEYGUBwacHRviXLEjIvV4b83n9EKDt/s1hMUIdZe3vOW62coMTtUBDSCJ9uuX5DV
         WN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/ca+vak/nY1/dpJAdQ8uc8u3bN8ZJitqD7jcESX7e/0=;
        b=YzOZW26ppLkA/VOp1UMCcycVPIIXEMGFhgMGoJhJvXMlTzgjzE30hCBDnK6RqBILlK
         Zy+bQAOAVxzSOOvavLNOxoGwPoBQju7cukTctUpkH0q4cMuwhqI8I6j5fJ9DDCaa4pGx
         KTptwICualLbdJD8ZeLSxc6mfapmg/hqZm8/FFvVnZC0vN3JjILboi8bpJ0oUXm4+N3y
         pKq2bVHy5K/0C9txiT9N82kVTb88YG+7/9ckmPoB18gJbZilRv1yLZVvJH1e8TuGD42n
         lTLyueR5ZxC3U95cmiR8oegtA16fdHnB0JeQk0LHFea0wf9jFSSPKZ5w8qQA3RGuJ8by
         yQ4w==
X-Gm-Message-State: AOAM532c0CbVfvxCLQV4ScZ4ksRQ6RlS3M6Xay5BEzezqSDJKuoObevn
        dY2m0PhtfN2TIucMsoSTQLiBW2QunfgFxRKR
X-Google-Smtp-Source: ABdhPJwiFXKSGgyXm0Ji5mAp2ihsp53L6fa4JxLQLf9o9MT4MQL6DPqo97FYIwle+ggKgITf8Tx6Mw==
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr4367519wrw.426.1599662025560;
        Wed, 09 Sep 2020 07:33:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.34])
        by smtp.gmail.com with ESMTPSA id o2sm4248071wmo.37.2020.09.09.07.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 07:33:44 -0700 (PDT)
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, andriy.shevchenko@linux.intel.com,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200909134053.GA3699980@kuha.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <14d72060-6141-ec3c-f3cc-52d91ab042a3@gmail.com>
Date:   Wed, 9 Sep 2020 15:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909134053.GA3699980@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heikki

On 09/09/2020 14:40, Heikki Krogerus wrote:
> Hi,
>
> On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
>> Hello
>>
>> Following on from this thread:
>> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
>> apologies, can't see a way to reply to it directly.
>>
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
>> My copy of Jordan's module is parked in my git repo [3] for now, and
>> requires a batch of patches from Jordan's repo [4] (one made by Heikki
>> to fill in the missing swnode graph pieces, and some further tweaks) -
>> I've been applying those against 5.8.0-rc7. Any other criticism more
>> than welcome - I'm new to both c and kernel programming so I'm happy
>> to take all the advice people have the time to give.
> I'm almost certain that my graph patch is broken. My tests did not
> cover nearly as much that is needed to properly test the patch. I
> think at least the refcount handling is totally broken in
> software_node_graph_get_next_endpoint(), so that function at least
> needs to be rewritten.
>
> Unfortunately I do not have time to work on that patch right now.
>
> thanks,

Alright no problem; I shall persevere with what we have and see if I can 
figure out why the linking isn't working. I think I actually found the 
problem with refcount handling in software_node_graph_get_endpoint(); 
see 
https://lore.kernel.org/linux-media/2d4f1abb-c617-476a-1005-0ed91906a5f5@gmail.com/T/#mf0dcf7dd78ae0cd40af998bc25a5a775c7e3f93d 
- that function seems to behave as expected after a small tweak (at 
least as I expect it to...it doesn't get and hold 4x references to the 
port fwnode_handle now), but there might be one more refcount handling 
issue somewhere (I see one more reference held than I expect to see at 
the moment...but it could be from my code too of course).


If I get to the bottom of the problems I'll let you know.


Regards

Dan

