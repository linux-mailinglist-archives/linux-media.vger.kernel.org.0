Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD494164A
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 22:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436492AbfFKUpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 16:45:07 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33371 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405843AbfFKUpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 16:45:07 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id andchmqRS41bFandghFqBB; Tue, 11 Jun 2019 22:45:04 +0200
Subject: Re: [PATCH 7/8] media: vivid: add CEC support to display present ctrl
To:     Johan Korsnes <johan.korsnes@gmail.com>,
        linux-media@vger.kernel.org
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
 <20190528171912.3688-8-johan.korsnes@gmail.com>
 <021b02ca-9543-c921-d231-0864e045b3c9@xs4all.nl>
 <d934d0cc-dc86-b13c-a85a-e37adbef39c0@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <88d71d36-abac-7f74-e842-565cecf87172@xs4all.nl>
Date:   Tue, 11 Jun 2019 22:45:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d934d0cc-dc86-b13c-a85a-e37adbef39c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHyuzZ09Tl4bldqZ/kaE6j2tT+NS+4naQZ3RtDK5FFG63srNBKCfCZA3jdEDbLkX1SRqgpw2m3R/UFgzyXO7yQj0uHvkWrz9wqBCZ+JwlGMuQ4BOtW8s
 VFe/aHoA9pXyUAT417l5/aZA5OYhFJwC8fAj9xaTYvYcdOdsU8YtuN8tLkdUpHF9UdsRPu9H15zD7WctUygzA2IGh8EHxAY+jj4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 10:25 PM, Johan Korsnes wrote:
> Thank you for the review Hans. My comments are inline. A v2 of this
> series is under way.
> 
> On 5/29/19 12:39 AM, Hans Verkuil wrote:
>> Hi Johan,
>>
>> Thanks for this patch series!
>>
>> The previous patches all look good, but this one needs a bit more work:
>>
>> On 5/28/19 7:19 PM, johan.korsnes@gmail.com wrote:
>>> From: Johan Korsnes <johan.korsnes@gmail.com>
>>>
>>> Set/invalidate physical addresses based on the configuration of the
>>> display present control. This is relevant not only when the display
>>> present control is modified, but also when the Vivid instance EDID is
>>> set/cleared.
>>>
>>> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
>>> ---
>>>  drivers/media/platform/vivid/vivid-core.c     | 16 ++++++------
>>>  drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
>>>  drivers/media/platform/vivid/vivid-vid-cap.c  |  6 ++++-
>>>  .../media/platform/vivid/vivid-vid-common.c   |  2 ++
>>>  4 files changed, 36 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
>>> index b2b4ee48cef0..ca46ac24f51e 100644
>>> --- a/drivers/media/platform/vivid/vivid-core.c
>>> +++ b/drivers/media/platform/vivid/vivid-core.c
>>> @@ -1060,14 +1060,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>>>  	vivid_update_format_cap(dev, false);
>>>  	vivid_update_format_out(dev);
>>>  
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>>> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
>>> -
>>>  	/* initialize overlay */
>>>  	dev->fb_cap.fmt.width = dev->src_rect.width;
>>>  	dev->fb_cap.fmt.height = dev->src_rect.height;
>>> @@ -1488,6 +1480,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>>>  	}
>>>  #endif
>>>  
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
>>> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
>>> +
>>>  	/* Now that everything is fine, let's add it to device list */
>>>  	vivid_devs[inst] = dev;
>>>  
>>
>> This change should be in a patch of its own.
>>
>> It also needs more work. The reason for this change is that v4l2_ctrl_handler_setup()
>> expects that the cec adapters are up and running, so moving these calls until after
>> the creation of the adapters fixes that.
>>
>> However, that now means that controls change after the creation of the video devices,
>> which isn't right.
>>
>> If you look at the probe() function you'll see that things are done in two stages:
>> first all the vb2 queues are created, and only if that succeeded are the video devices
>> created.
>>
>> The same should be done for the CEC adapters: they should be allocated (vivid_cec_alloc_adap)
>> in the first stage, then call v4l2_ctrl_handler_setup(), and finally create the actual
>> device nodes (cec_register_adapter).
>>
>> That way the controls are configured correctly before any device nodes are created.
> 
> I have split up the allocation and registration in v2. Why is this
> order important? Some race condition with user space?

Yes. Once a device node is created under /dev userspace can start to use it.
And in fact something like systemd can open it immediately after creation.

So the complete state of the device should be ready before you create the
device node. Still changing/adding things *after* device node creation
indeed creates a race condition.

Note that a lot of (mostly older) drivers do this wrong, but vivid, being
somewhat of a reference driver, should do this right.

Regards,

	Hans
