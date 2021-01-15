Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0572F878E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 22:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbhAOVU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 16:20:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38328 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbhAOVU4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 16:20:56 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 452571F4623F
Subject: Re: Failing V4l2-compliance test with a sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
 <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
Date:   Fri, 15 Jan 2021 22:20:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 15.01.21 um 19:34 schrieb Sebastian Fricke:
> Hello Hans,
> 
> Thank you very much for the quick response.
> 
> On 15.01.2021 13:11, Hans Verkuil wrote:
>> On 15/01/2021 12:53, Sebastian Fricke wrote:
>>> Hello,
>>>
>>> I believe you are the creator of v4l2-compliance, right? My hope is that you might be able to lead me in the right direction.
>>> I am currently finishing up a sensor driver that I ported from a downstream kernel. And I try to clear up the last compliance error:
>>>
>>> ```
>>>      info: checking control event 'User Controls' (0x00980001)
>>>      VIDIOC_SUBSCRIBE_EVENT returned -1 (Inappropriate ioctl for device)
>>
>> This returns ENOTTY, which is weird...
>>
>>>      fail: v4l2-test-controls.cpp(818): subscribe event for control 'User Controls' failed
>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>> ```
>>>
>>> I notice that it calls a normal v4l2 ioctl on my subdevice. I implemented the event handling just like I was able to find in other devices like:
>>> imx219, imx355, ov2640 by adding:
>>>
>>> ```
>>> #include <media/v4l2-event.h>
>>> ...
>>>     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>              V4L2_SUBDEV_FL_HAS_EVENTS;
>>> ...
>>> static const struct v4l2_subdev_core_ops ov13850_core_ops = {
>>>      ...
>>>     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>>>     .unsubscribe_event = v4l2_event_subdev_unsubscribe
>>>      ...
>>> ```
>>
>> ...since this looks exactly as it should be.
>>
>>>
>>> Am I supposed to correct that error, or asked in another way is it actually an error when a subdevice doesn't implement VIDIOC_SUBSCRIBE_EVENT?
>>
>> Yes, it is an error if subscribe_event isn't implemented, but you DO have controls in your driver.
>>
>> Are you compiling v4l2-compliance from the git repo? You shouldn't use the version packages by distros since that is typically much too old.
> 
> Yes I have compiled it directly from the git repo `git clone https://git.linuxtv.org/v4l-utils.git/`, to be more specific I have an ansible playbook that shows exactly how I compiled it:
> https://github.com/initBasti/NanoPC-T4_armbian_configuration/blob/main/ansible/setup_nanopct4.yml#L95
> 
> The build I currently use is 3 days old.
> 
>>
>> I can't give support either if you are using an old version.
>>
>>> Additionally, I noticed that the compliance check doesn't look at my VIDIOC_SUBDEV_G_SELECTION implementation but instead searches for any implementation of the VIDIOC_G_SELECTION ioctl.
>>
>> It shouldn't, at least v4l2-test-subdevs.cpp only uses VIDIOC_SUBDEV_G_SELECTION.
> 
> That is exactly what confuses me, I cannot find a *single* SUBDEV ioctl

That's weird, looking at the v4l2-compliance code I see there is a function "'mi_media_detect_type", maybe you should see what type is detected

Thanks,
Dafna

> within the output of the tests.
> Here is the complete output: https://paste.debian.net/1181280/
> 
>>
>> Regards,
>>
>>     Hans
> 
> Thanks a lot
> Sebastian
>>
>>>
>>> I invoked the compliance test with:
>>>
>>> v4l2-compliance -u /dev/v4l-subdev3 -v -T
>>>
>>> My current code can be located here: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c
>>>
>>> Greetings and thanks in advance,
>>> Sebastian
>>>
>>
