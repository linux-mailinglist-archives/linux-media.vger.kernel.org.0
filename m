Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D46A962F
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 12:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjCCL21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 06:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjCCL2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 06:28:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD4E5D44F
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 03:27:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F5E6B81699
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 11:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B95DC433D2;
        Fri,  3 Mar 2023 11:27:04 +0000 (UTC)
Message-ID: <84ff6f24-0187-28cb-78ea-d5f66fe49567@xs4all.nl>
Date:   Fri, 3 Mar 2023 12:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/26] Media device lifetime management
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <85f6411a-bce7-5b22-34b8-e7e1a36ec18c@xs4all.nl>
 <ZAHYyGs5kTxRhmdJ@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZAHYyGs5kTxRhmdJ@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/03/2023 12:23, Sakari Ailus wrote:
> Hi Hans,
> 
> Many thanks for the review.
> 
> On Fri, Mar 03, 2023 at 10:07:38AM +0100, Hans Verkuil wrote:
>> Hi Sakari,
>>
>> On 01/02/2023 22:45, Sakari Ailus wrote:
>>> Hi folks,
>>>
>>> This is a refresh of my 2016 RFC patchset to start addressing object
>>> lifetime issues in Media controller. It further allows continuing work to
>>> address lifetime management of media entities.
>>>
>>> The underlying problem is described in detail in v4 of the previous RFC:
>>> <URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
>>> In brief, there is currently no connection between releasing media device
>>> (and related) memory and IOCTL calls, meaning that there is a time window
>>> during which released kernel memory can be accessed, and that access can be
>>> triggered from the user space. The only reason why this is not a grave
>>> security issue is that it is not triggerable by the user alone but requires
>>> unbinding a device. That is still not an excuse for not fixing it.
>>>
>>> This set differs from the earlier RFC to address the issue in the
>>> following respects:
>>>
>>> - Make changes for ipu3-cio2 driver, too.
>>>
>>> - Continue to provide best effort attempt to keep the window between device
>>>   removal and user space being able to access released memory as small as
>>>   possible. This means the problem won't become worse for drivers for which
>>>   Media device lifetime management has not been implemented.
>>>
>>> The latter is achieved by adding a new object, Media devnode compat
>>> reference, which is allocated, refcounted and eventually released by the
>>> Media controller framework itself, and where the information on registration
>>> and open filehandles is maintained. This is only done if the driver does not
>>> manage the lifetime of the media device itself, i.e. its release operation
>>> is NULL.
>>>
>>> Due to this, Media device file handles will also be introduced by this
>>> patchset. I thought the first user of this would be Media device events but
>>> it seems we already need them here.
>>>
>>> Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
>>> as device_release() releases the resources before calling the driver's
>>> remove function. While further work will be required also on these drivers
>>> to safely stop he hardware at unbind time, I don't see a reason not to merge
>>> these patches now.
>>>
>>> Some patches are temporarily reverted in order to make reworks easier, then
>>> applied later on.
>>>
>>> I've tested this on ipu3-cio2 with and without the refcounting patch (media:
>>> ipu3-cio2: Release the cio2 device context by media device callback),
>>> including failures in a few parts of the driver initialisation process in
>>> the MC framework.
>>>
>>> Questions and comments are welcome.
>>
>> Most of this series looks good.
>>
>> You can add my:
>>
>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> for patches 1-17, 19, 20 and 22.
> 
> Thank you!
> 
>>
>> As I mentioned in my review of patch 21, I don't think 18 and 21 belong to
>> this series.
> 
> Yes, some patches I wrote as part of this should be merged earlier. I think
> I'll just pick them to my master branch once we have rc1.
> 
>>
>> I am also not keen on patch 25 (and thus 23 and 24 that it needs). Perhaps
>> take that out for now for more discussion later?
>>
>> I would like to see some more drivers to be converted: specifically uvc
>> and the test drivers (vidtv, vim2m, vimc, visl, vivid). uvc because it is
>> widely used, the test drivers because they function as reference code.
> 
> Sounds reasonable. Uvc especially should benefit from this. The conversion
> isn't even difficult at all, but still requires testing.
> 
>>
>> Finally, I don't think this series addresses another life-cycle problem:
>> unbinding subdevices when they are still being used, either by userspace
>> or a bridge driver.
> 
> That is correct. I wanted to address this for the media device first and
> tackle other problems once we have these patches in.
> 
>>
>> I have patches for that here:
>>
>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=subdev-kref
>>
>> I think these are pretty much independent from this patch series, but
>> I'll wait with posting them until this is merged.
> 
> Interesting. I thought in practice addressing the problem for sub-devices
> would require addressing media device lifetime management first. In
> practice most drivers have one big allocation for everything and that can
> be released only once all users are gone.
> 
>>
>> Background: we have an fpga that implements subdevices and also
>> (depending on the configuration) complete v4l2 platform drivers.
>>
>> When the fpga is unloaded when going to standby, subdevices and/or
>> platform drivers just disappear, and without correct life-time management
>> you get crashes. Basically exactly the same problem as you have with the
>> media device.
> 
> Yes.
> 
> Have you posted the subdev-kref patches to the list yet?
> 

No, I don't believe I did. I've been sitting on them waiting for this series,
basically.

But we (Cisco) have been using these patches for some time now. But that's
on a really old kernel :-(

I also need to double-check vimc as well: I have a memory that I had to make
changes there, but I will have to retest it.

Regards,

	Hans
