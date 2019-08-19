Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A971394C41
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 20:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfHSSA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 14:00:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33463 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbfHSSA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 14:00:26 -0400
Received: by mail-io1-f66.google.com with SMTP id z3so6281655iog.0
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 11:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hVgnPcH189KZdWmlS6S6j8AuQX+ilqf2qoLFJdoTj+8=;
        b=Zonh3sWtRC1v0PFLlYzBXgbMaPKtUHM41S58fGk/2Yh4/P10gexQ+O/H6ji2S1SRfW
         UWBsEMM9sU6lI2peJdh18LYRnDjUqQofXBCWsZkBw6Vhrx4huhqEz2KdRBTWFeDoAje1
         MGLhnZAje2WBiv7W7foS9oF+CFd3DwFwdpVh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVgnPcH189KZdWmlS6S6j8AuQX+ilqf2qoLFJdoTj+8=;
        b=WVD60ZobK9x7n3SGho9oRX2c7AQn8QAsX8Bsa/RQZZ/FuJB4wRH0NiYO9ENufGhFEo
         tnAPnM/sZaUkYqrbsEi+GXFBl9iq5ubMO1EFctbjWYtq5faUKM1EV+eZci4A66yQo6Fr
         5XqT1GZE5u/RrAIvlZHE6TpHkGpfdcwroPLXhM/WHDMLzCOp0N7o+ivPdS8ffPUedKVS
         3SOrRE+eQdu/nLwVEaWvZiTZ6Pu5oRi7DqXoTfKJDTnwWQqFJ6X3PYFasPqYW3wGqjEh
         Lp8hHhvceQvIgaKkIYqu/1+bHBMQ3HS15qbABl9eRemD/IF0LF6XQ7EyQ5nZjswgQYvO
         kyfw==
X-Gm-Message-State: APjAAAV3Q8ouqda75u5DTexTz9Mp58N+KHRTtbpqO7DE0tbaVE0i7Isj
        LaDT4PbTSMuidAGAF70E2IB1FQ==
X-Google-Smtp-Source: APXvYqxboD2ihz5W/j12udgjfd2kA1An0Dbg4p7lpNXokfzjaQidnDIX8FkL0JH+Fe/rsL2jbhiXQA==
X-Received: by 2002:a02:6a56:: with SMTP id m22mr26788225jaf.114.1566237625012;
        Mon, 19 Aug 2019 11:00:25 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z9sm1976602ior.79.2019.08.19.11.00.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 11:00:24 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Collapse vimc into single monolithic driver
To:     Helen Koike <helen.koike@collabora.com>, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        andrealmeid@collabora.com
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1565740213.git.skhan@linuxfoundation.org>
 <ce727478-1aa5-c6c0-9aee-911b6ac1efb1@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fb822995-747c-b2a1-e1d3-7d62512a4700@linuxfoundation.org>
Date:   Mon, 19 Aug 2019 12:00:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ce727478-1aa5-c6c0-9aee-911b6ac1efb1@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/16/19 2:03 PM, Helen Koike wrote:
> Hi Shuah,
> 
> Thanks for the patches.
> 
> On 8/15/19 4:42 PM, Shuah Khan wrote:
>> vimc uses Component API to split the driver into functional components.
>> The real hardware resembles a monolith structure than component and
>> component structure added a level of complexity making it hard to
>> maintain without adding any real benefit.
>>
>> The sensor is one vimc component that would makes sense to be a separate
>> module to closely align with the real hardware. It would be easier to
>> collapse vimc into single monolithic driver first and then split the
>> sensor off as a separate module.
>>
>> This patch series removes the component API and makes minimal changes to
>> the code base preserving the functional division of the code structure.
>> Preserving the functional structure allows us to split the sensor off
>> as a separate module in the future.
>>
>> Major design elements in this change are:
>>      - Use existing struct vimc_ent_config and struct vimc_pipeline_config
>>        to drive the initialization of the functional components.
>>      - Make vimc_device and vimc_ent_config global by moving them to
>>        vimc-common.h
>>      - Add two new hooks add and rm to initialize and register, unregister
>>        and free subdevs.
>>      - All component API is now gone and bind and unbind hooks are modified
>>        to do "add" and "rm" with minimal changes to just add and rm subdevs.
>>      - vimc-core's bind and unbind are now register and unregister.
>>      - vimc-core invokes "add" hooks from its vimc_register_devices().
>>        The "add" hooks remain the same and register subdevs. They don't
>>        create platform devices of their own and use vimc's pdev.dev as
>>        their reference device. The "add" hooks save their vimc_ent_device(s)
>>        in the corresponding vimc_ent_config.
>>      - vimc-core invokes "rm" hooks from its unregister to unregister
>>        subdevs and cleanup.
>>      - vimc-core invokes "add" and "rm" hooks with pointer to struct
>>        vimc_device and the corresponding struct vimc_ent_config pointer.
>>
>> The following configure and stream test works on all devices.
>>
>>      media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>>      media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
>>      media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
>>      media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
>>
>>      v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
>>      v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
>>      v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>>
>>      v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video1
>>      v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
>>      v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video3
>>
>> The second patch in the series fixes a general protection fault found
>> when rmmod is done while stream is active.
>>
>> - rmmod while streaming returns vimc is in use
>> - rmmod without active stream works correctly
>>
>> Changes since v1:
>> Patch 1 & 2: (patch 1 in this series)
>> - Collapsed the two patches into one
>> - Added common defines (vimc_device and vimc_ent_config) to vimc-common.h
>>    based on our discussion.
>> - Addressed review comments from Helen and Laurent
>> - Use vimc-common.h instead of creating a new file.
>> - Other minor comments from Helen on int vs. unsigned int and
>>    not needing to initialize ret in vimc_add_subdevs()
>> Patch 3 (patch 2 in this series):
>> - The second patch is the fix for gpf. Updated the patch after looking
>>    at the test results from Andre and Helen. This problem is in a common
>>    code and impacts all subdevs. The fix addresses the core problem and
>>    fixes it. Fix removes pads release from v4l2_device_unregister_subdev()
>>    and pads are now released from the sd release handler with all other
>>    resources.
>>
>> Outstanding:
>> - Update documentation with the correct topology.
>> - There is one outstanding gpf remaining in the unbind path. I will
>>    fix that in a separate patch. This is an existing problem and will
>>    be easier to fix on top of this patch series.
>>
>> vimc_print_dot (--print-dot) topology after this change: (no change
>> compared to media master)
>> digraph board {
>>          rankdir=TB
>>          n00000001 [label="{{} | Sensor A\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000001:port0 -> n00000005:port0 [style=bold]
>>          n00000001:port0 -> n0000000b [style=bold]
>>          n00000003 [label="{{} | Sensor B\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000003:port0 -> n00000008:port0 [style=bold]
>>          n00000003:port0 -> n0000000f [style=bold]
>>          n00000005 [label="{{<port0> 0} | Debayer A\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000005:port1 -> n00000015:port0
>>          n00000008 [label="{{<port0> 0} | Debayer B\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000008:port1 -> n00000015:port0 [style=dashed]
>>          n0000000b [label="Raw Capture 0\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>>          n0000000f [label="Raw Capture 1\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>>          n00000013 [label="{{} | RGB/YUV Input\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000013:port0 -> n00000015:port0 [style=dashed]
>>          n00000015 [label="{{<port0> 0} | Scaler\n/dev/v4l-subdev5 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>          n00000015:port1 -> n00000018 [style=bold]
>>          n00000018 [label="RGB/YUV Capture\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>>
>> Shuah Khan (2):
>>    media: vimc: Collapse component structure into a single monolithic
>>      driver
>>    media: vimc: Fix gpf in rmmod path when stream is active
> 
> I couldn't apply those on top of media/master, I think they are
> conflicting with the two "Reverts" commits in vimc.
> 

Sorry for the delay. I was out backpacking for a couple of days.

I knew I have to rebase after the reverts go in. I will do that
and address your comments on patch 1/2 and resend the series.

Thanks for the review. Your comments on naming make sense.

thanks,
-- Shuah


