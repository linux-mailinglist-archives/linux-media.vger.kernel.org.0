Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFE769AF60
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 16:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjBQPTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 10:19:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjBQPTs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 10:19:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F7F718C6
        for <linux-media@vger.kernel.org>; Fri, 17 Feb 2023 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676647139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2gb/kTAWoTpZuElO50bi2KOu52gY3l+idbxvIfwp+aY=;
        b=c44U6r1Q3sz/WkbmpMp8P8iiknQ73fk5vqxh04P85J6rMgotkKyLzfloGL9D2syci/qFKq
        wzJ5rZm3vr8zoNyllstdQNRnMMRPhdt49ALEVixDUH3aX2S4xr55WnrQMWrh/lKAXeSru9
        HV1NIAUTM1Ny8P8TnTNR6jKRdZeevGY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-EDjT3EmkMUO1f5-XqmCWQA-1; Fri, 17 Feb 2023 10:18:58 -0500
X-MC-Unique: EDjT3EmkMUO1f5-XqmCWQA-1
Received: by mail-ed1-f70.google.com with SMTP id ec16-20020a0564020d5000b004ad51f8fc36so1836963edb.22
        for <linux-media@vger.kernel.org>; Fri, 17 Feb 2023 07:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gb/kTAWoTpZuElO50bi2KOu52gY3l+idbxvIfwp+aY=;
        b=JavZi1SXa7R8OKrPBvg6KOAphD+iYhPwhZvsXzlH+yrM+bHcbIczSjyM8fROZcDMXO
         qM1KlGyGNsR9t9pJR24QnedEcwhBFinkuMbILTNZ7LU2M8K7yQk95P9enWppAKhZzmv+
         iVrBP9mBqSZuyNIkJLkKTyv4mE+mFXWs8ObNasM6vpGGpo3XE4u/3wgUuwTr/LykdfKv
         gxY4GRarf76c8PxsMXlB7zmBIpG7xIWGb+x2c2rhSbqg0OL4oVAsM/VRNtf/gsQFrQ+v
         9Qi/0Disimb6j6cPuv9ddUP5cxuCjN+O2OVs+q/AFjvzsOzv0B4ON/KI27/g3rv2tRl2
         kvJA==
X-Gm-Message-State: AO0yUKXyvlohTG8BBWZvmi9y7R1yDsrIdvQzcvpnigXitFlTgb3JOrzM
        JEN5nLuDiyuYJPTCSkxr4vO+xl4rExnMPaAsA+CgJK80bLenak+3+dML6xu3kS/5akqLMqBhSoa
        QF9rD1G1tv+twuD7NgVt9mEo/w/qX
X-Received: by 2002:a17:906:a287:b0:87b:dac1:bbe6 with SMTP id i7-20020a170906a28700b0087bdac1bbe6mr11185981ejz.36.1676647137447;
        Fri, 17 Feb 2023 07:18:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/A6mw10B16cG1gobNl+LGcRMwUyfReGmIAHFedYnHiL1090jglya+zf+uSGq4qjHoQnyl9EA==
X-Received: by 2002:a17:906:a287:b0:87b:dac1:bbe6 with SMTP id i7-20020a170906a28700b0087bdac1bbe6mr11185959ejz.36.1676647137150;
        Fri, 17 Feb 2023 07:18:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n2-20020a170906118200b008b1426fd60dsm2266519eja.176.2023.02.17.07.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 07:18:56 -0800 (PST)
Message-ID: <ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com>
Date:   Fri, 17 Feb 2023 16:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RFC: removing various special/obscure features from atomisp code
 ?
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <djrscally@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <5309d845-063b-6dd9-529d-0f82654290f2@redhat.com>
 <Y+5CMkwHy9tuk6G2@pendragon.ideasonboard.com>
 <c3dc3173-9bbd-c48a-80a7-ec6a86b6e360@redhat.com>
 <Y+6hSuRzaaHj83S9@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+6hSuRzaaHj83S9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/16/23 22:34, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Thu, Feb 16, 2023 at 04:47:51PM +0100, Hans de Goede wrote:
>> On 2/16/23 15:48, Laurent Pinchart wrote:
>>> On Thu, Feb 16, 2023 at 03:20:08PM +0100, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> I have been looking into moving the sensor registration for atomisp2
>>>> over to v4l2-aysnc similar to how
>>>> drivers/media/pci/intel/ipu3/cio2-bridge.c does things.
>>>>
>>>> Together with some other smaller changes this should allow the atomisp
>>>> code use standard sensor drivers instead of having their own fork of
>>>> these drivers.
>>>>
>>>> While looking into this I realized that the current architecture of
>>>> the atomisp2 code where it registers 8 /dev/video# nodes + many
>>>> v4l2-subdevs is getting in the way of doing this.  At a minimum the
>>>> current convoluted media-ctl graph makes it harder then necessary to
>>>> make this change.
>>>>
>>>> So this makes me realize that it probably is time to make some changes
>>>> to the atomisp-code to remove a bunch of somewhat obscure (and
>>>> untested / unused) features. I have been thinking about removing these
>>>> for a long time already since they also get in the way of a bunch of
>>>> other things like allowing the /dev/video# nodes to be opened multiple
>>>> times.
>>>>
>>>> So my plan is to reduce the feature set to make atomisp work as more
>>>> or less a standard webcam (with front/back sensors) which is how most
>>>> hw is using it and also is how all our (my) current testing uses it.
>>>>
>>>> This means reducing the graph to a single /dev/video0 output node + 2
>>>> subdevs for the sensors I might put one more node in the graph for
>>>> selecting between the 3 CSI ports, or those could be 3 possible
>>>> sources for /dev/video0.
>>>
>>> Could you briefly summarize the hardware architecture, and in particular
>>> what building blocks are present, and how they're connected ? That will
>>> help with the discussion.
>>
>> I can try, but it is complicated. The atomisp appears to mainly be
>> some coprocessor thing (with I guess some hw-accel blocks on the side)
>> the way it works from the driver's pov is that the firmware file really
>> contains a a whole bunch of different binaries to run on the co-processor,
>> with a table describing the binaries including supported input and
>> output formats.
>>
>> Each binary represents a complete camera pipeline, going from
>> directly reading from the CSI receiver on one end to DMA-ing
>> the fully finished ready to consume buffers in the requested
>> destination fmt on the other end. The driver picks a binary
>> based on the requested input + output formats and then uploads
>> + starts that.
>>
>> So basically it is one big black box, where we hookup a
>> sensor on one side and then on the other end say give my YUYV
>> or YU12, or ...   There are of course a whole bunch of
>> processing parameters we can set like lens shading correction
>> tables (format unknown), etc. But basically it is still
>> just a black box.
>>
>> So from a mediactl pov as I see it the whole thing is a single
>> node in the graph.
> 
> Do you mean a single entity for the ISP ? I'd go for
> 
> sensor subdev -> CSI-2 RX subdev -> ISP subdev -> video device
> 
> Is that what you meant ?

Yes although I'm not sure having "CSI-2 RX subdev" in there
as a separate node makes much sense given how blackbox-y
the entire working of the pipeline is.

At least I'm not aware of any way to e.g. skip the ISP and
get raw bayer frames directly out of the CSI-2 receiver.

Regards,

Hans




