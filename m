Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5202FAB4B
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 21:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394245AbhARUUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 15:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437993AbhARUR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 15:17:29 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD33C061575
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 12:16:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 22B991F44F63
Subject: Re: Failing V4l2-compliance test with a sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
 <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
 <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
 <20210118071500.x7e2pdszql44ncba@basti-TUXEDO-Book-XA1510>
 <bea28ee9-0cb4-4849-5e73-96e6ef1f945a@xs4all.nl>
 <20210118180306.aai3zfo5xpcr3y32@basti-TUXEDO-Book-XA1510>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <cb50dc5e-33c6-d002-a31a-af91bbec6d6e@collabora.com>
Date:   Mon, 18 Jan 2021 21:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118180306.aai3zfo5xpcr3y32@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 18.01.21 um 19:03 schrieb Sebastian Fricke:
> On 18.01.2021 11:12, Hans Verkuil wrote:
>> Hi Sebastian,
> 
> Hello Hans,
> 
>>
>> On 18/01/2021 08:15, Sebastian Fricke wrote:
>>> Hello Hans & Dafna,
>>>
>>> I am not really sure what changed but I have setup a new image for the
>>> NanoPC-T4 and installed v4l2-compliance in exactly the same manner but
>>> now everything works. Maybe the module was silently not inserted correctly when
>>> I changed the event handling.
>>>
>>> https://paste.debian.net/1181580/
>>
>> This isn't right: v4l2-compliance thinks it is a regular video device, not
>> a subdev device. You should see something like this:
>>
>> v4l2-compliance 1.21.0-4688, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 4739a67dac10 2021-01-06 08:21:53
>>
>> Compliance test for vimc device /dev/v4l-subdev0:
>>
>> Media Driver Info:
>>        Driver name      : vimc
>>        Model            : VIMC MDEV
>>        Serial           :
>>        Bus info         : platform:vimc
>>        Media version    : 5.11.0
>>        Hardware revision: 0x00000000 (0)
>>        Driver version   : 5.11.0
>> Interface Info:
>>        ID               : 0x0300002c
>>        Type             : V4L Sub-Device
>> Entity Info:
>>        ID               : 0x00000001 (1)
>>        Name             : Sensor A
>>        Function         : Camera Sensor
>>        Pad 0x01000002   : 0: Source
>>          Link 0x0200001c: to remote pad 0x1000006 of entity 'Debayer A': Data, Enabled, Immutable
>>          Link 0x0200001e: to remote pad 0x100000c of entity 'Raw Capture 0': Data, Enabled, Immutable
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>
>> ....
>>
>> Sub-Device ioctls (Source Pad 0):
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> ...
>>
>> Check this:
>>
>> ls -l /dev/v4l-subdev3
>> # replace <minor> with the minor device number seen in the output of ls -l
>> cat /sys/dev/char/81\:<minor>/uevent
>>
>> It should contain something like this:
>>
>> $ cat /sys/dev/char/81\:3/uevent
>> MAJOR=81
>> MINOR=3
>> DEVNAME=v4l-subdev3
> 
> basti@nanopct4:~$ cat /sys/dev/char/81\:3/uevent
> MAJOR=81
> MINOR=3
> DEVNAME=video3

just to be clear, the number <minor> does not come from the file name but from the minor value:
For example:

$ ls /dev/v4l-subdev3  -l
crw-rw----+ 1 root video 81, 8 Jan 18 21:13 /dev/v4l-subdev3

then my minor is 8,
so:

$ cat /sys/dev/char/81\:8/uevent
MAJOR=81
MINOR=8
DEVNAME=v4l-subdev3


> 
> Looks like it really acts like a normal V4L2 device, I checked my probe
> function and it seems to be correct (Compared it with imx219), the only
> difference is that the IMX doesn't check if the SUBDEV option is
> activated:
> ```
>      ...
>      sd = &ov13850->subdev;
>      v4l2_i2c_subdev_init(sd, client, &ov13850_subdev_ops);
>      ...
> 
> #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API

I think you don't need this ifdef

Thanks,
Dafna

>      sd->internal_ops = &ov13850_internal_ops;
>      sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>               V4L2_SUBDEV_FL_HAS_EVENTS;
>      ...
> ```
> 
> And here the full code: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c
> 
> But it has to be the driver right? I will try to find out if my driver
> does anything that is really deprecated.
> 
> Funny is also that `media-ctl -p` reports the device as a SUBDEV:
> ```
> basti@nanopct4:~$ media-ctl -p
> ...
> - entity 28: ov13850 1-0010 (1 pad, 1 link)
>               type V4L2 subdev subtype Sensor flags 0
>               device node name /dev/v4l-subdev3
>      pad0: Source
>          [fmt:SBGGR10_1X10/2112x1568@10000/300000 field:none
>           crop.bounds:(16,8)/4224x3136
>           crop:(16,8)/4224x3136]
>          -> "rkisp1_isp":0 [ENABLED]
> ```
> 
> 
> Thank you very much for your assistence!
> 
> Greetings,
> Sebastian
> 
>>
>> where DEVNAME starts with 'v4l-subdev'.
>>
>> Regards,
>>
>>     Hans
>>
>>>
>>> Thank you for your assistance.
>>>
>>> On 15.01.2021 22:20, Dafna Hirschfeld wrote:
>>>>
>>>>
>>>> Am 15.01.21 um 19:34 schrieb Sebastian Fricke:
>>>>> Hello Hans,
>>>>>
>>>>> Thank you very much for the quick response.
>>>>>
>>>>> On 15.01.2021 13:11, Hans Verkuil wrote:
>>>>>> On 15/01/2021 12:53, Sebastian Fricke wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I believe you are the creator of v4l2-compliance, right? My hope is that you might be able to lead me in the right direction.
>>>>>>> I am currently finishing up a sensor driver that I ported from a downstream kernel. And I try to clear up the last compliance error:
>>>>>>>
>>>>>>> ```
>>>>>>>      info: checking control event 'User Controls' (0x00980001)
>>>>>>>      VIDIOC_SUBSCRIBE_EVENT returned -1 (Inappropriate ioctl for device)
>>>>>>
>>>>>> This returns ENOTTY, which is weird...
>>>>>>
>>>>>>>      fail: v4l2-test-controls.cpp(818): subscribe event for control 'User Controls' failed
>>>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>>>> ```
>>>>>>>
>>>>>>> I notice that it calls a normal v4l2 ioctl on my subdevice. I implemented the event handling just like I was able to find in other devices like:
>>>>>>> imx219, imx355, ov2640 by adding:
>>>>>>>
>>>>>>> ```
>>>>>>> #include <media/v4l2-event.h>
>>>>>>> ...
>>>>>>>     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>>>>>              V4L2_SUBDEV_FL_HAS_EVENTS;
>>>>>>> ...
>>>>>>> static const struct v4l2_subdev_core_ops ov13850_core_ops = {
>>>>>>>      ...
>>>>>>>     .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>>>>>>>     .unsubscribe_event = v4l2_event_subdev_unsubscribe
>>>>>>>      ...
>>>>>>> ```
>>>>>>
>>>>>> ...since this looks exactly as it should be.
>>>>>>
>>>>>>>
>>>>>>> Am I supposed to correct that error, or asked in another way is it actually an error when a subdevice doesn't implement VIDIOC_SUBSCRIBE_EVENT?
>>>>>>
>>>>>> Yes, it is an error if subscribe_event isn't implemented, but you DO have controls in your driver.
>>>>>>
>>>>>> Are you compiling v4l2-compliance from the git repo? You shouldn't use the version packages by distros since that is typically much too old.
>>>>>
>>>>> Yes I have compiled it directly from the git repo `git clone https://git.linuxtv.org/v4l-utils.git/`, to be more specific I have an ansible playbook that shows exactly how I compiled it:
>>>>> https://github.com/initBasti/NanoPC-T4_armbian_configuration/blob/main/ansible/setup_nanopct4.yml#L95
>>>>>
>>>>> The build I currently use is 3 days old.
>>>>>
>>>>>>
>>>>>> I can't give support either if you are using an old version.
>>>>>>
>>>>>>> Additionally, I noticed that the compliance check doesn't look at my VIDIOC_SUBDEV_G_SELECTION implementation but instead searches for any implementation of the VIDIOC_G_SELECTION ioctl.
>>>>>>
>>>>>> It shouldn't, at least v4l2-test-subdevs.cpp only uses VIDIOC_SUBDEV_G_SELECTION.
>>>>>
>>>>> That is exactly what confuses me, I cannot find a *single* SUBDEV ioctl
>>>>
>>>> That's weird, looking at the v4l2-compliance code I see there is a function "'mi_media_detect_type", maybe you should see what type is detected
>>>>
>>>> Thanks,
>>>> Dafna
>>>>
>>>>> within the output of the tests.
>>>>> Here is the complete output: https://paste.debian.net/1181280/
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>>     Hans
>>>>>
>>>>> Thanks a lot
>>>>> Sebastian
>>>>>>
>>>>>>>
>>>>>>> I invoked the compliance test with:
>>>>>>>
>>>>>>> v4l2-compliance -u /dev/v4l-subdev3 -v -T
>>>>>>>
>>>>>>> My current code can be located here: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c
>>>>>>>
>>>>>>> Greetings and thanks in advance,
>>>>>>> Sebastian
>>>>>>>
>>>>>>
>>
