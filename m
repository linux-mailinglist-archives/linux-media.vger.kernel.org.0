Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C822F9A61
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 08:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbhARHQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 02:16:03 -0500
Received: from mout02.posteo.de ([185.67.36.66]:58497 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732409AbhARHQA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 02:16:00 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 428232400FF
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 08:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1610954102; bh=XHAMqANm/ijENRZswUTVZfkXu5tbRd8hljqVeX1IMuY=;
        h=Date:From:To:Cc:Subject:From;
        b=KdFbkM/0bRwBJr8mN3uS8yo3Bze3zJ8JrconcaGw77cIeVEbEK5SyhPNtjJgDL83Q
         1ip4M3BvM3m0A51JLXeaKiRBMAG1m37BQ3IDrjDbC5hvpdHWNDG6qGcWDkfeLAMaeR
         Y0WqEqajxiRGc/SMAMkRxZ27SSZK8BZKmS5o4pQRONdZokLFzy0bRSqcvmiezW0JGY
         I1lb5oxO21PvUTK0DNCsL+EMw9HlL3rj+Cjrif4nSr8A7p0FG5GbSdGfEIBdswicVR
         JSKOlN8JOhY5YRcfAgQEkiyJnKtHCrl8ZpcZ4wmzAHB2kGddXizacia8kxWYEImK0N
         uyha61e+qez0w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DK32Y3p4Xz6tmF;
        Mon, 18 Jan 2021 08:15:01 +0100 (CET)
Date:   Mon, 18 Jan 2021 08:15:00 +0100
From:   Sebastian Fricke <sebastian.fricke@posteo.net>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
Subject: Re: Failing V4l2-compliance test with a sensor driver
Message-ID: <20210118071500.x7e2pdszql44ncba@basti-TUXEDO-Book-XA1510>
References: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
 <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
 <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans & Dafna,

I am not really sure what changed but I have setup a new image for the
NanoPC-T4 and installed v4l2-compliance in exactly the same manner but
now everything works. Maybe the module was silently not inserted correctly when
I changed the event handling.

https://paste.debian.net/1181580/

Thank you for your assistance.

On 15.01.2021 22:20, Dafna Hirschfeld wrote:
>
>
>Am 15.01.21 um 19:34 schrieb Sebastian Fricke:
>>Hello Hans,
>>
>>Thank you very much for the quick response.
>>
>>On 15.01.2021 13:11, Hans Verkuil wrote:
>>>On 15/01/2021 12:53, Sebastian Fricke wrote:
>>>>Hello,
>>>>
>>>>I believe you are the creator of v4l2-compliance, right? My hope is that you might be able to lead me in the right direction.
>>>>I am currently finishing up a sensor driver that I ported from a downstream kernel. And I try to clear up the last compliance error:
>>>>
>>>>```
>>>>     info: checking control event 'User Controls' (0x00980001)
>>>>     VIDIOC_SUBSCRIBE_EVENT returned -1 (Inappropriate ioctl for device)
>>>
>>>This returns ENOTTY, which is weird...
>>>
>>>>     fail: v4l2-test-controls.cpp(818): subscribe event for control 'User Controls' failed
>>>>test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>```
>>>>
>>>>I notice that it calls a normal v4l2 ioctl on my subdevice. I implemented the event handling just like I was able to find in other devices like:
>>>>imx219, imx355, ov2640 by adding:
>>>>
>>>>```
>>>>#include <media/v4l2-event.h>
>>>>...
>>>>    sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>>             V4L2_SUBDEV_FL_HAS_EVENTS;
>>>>...
>>>>static const struct v4l2_subdev_core_ops ov13850_core_ops = {
>>>>     ...
>>>>    .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>>>>    .unsubscribe_event = v4l2_event_subdev_unsubscribe
>>>>     ...
>>>>```
>>>
>>>...since this looks exactly as it should be.
>>>
>>>>
>>>>Am I supposed to correct that error, or asked in another way is it actually an error when a subdevice doesn't implement VIDIOC_SUBSCRIBE_EVENT?
>>>
>>>Yes, it is an error if subscribe_event isn't implemented, but you DO have controls in your driver.
>>>
>>>Are you compiling v4l2-compliance from the git repo? You shouldn't use the version packages by distros since that is typically much too old.
>>
>>Yes I have compiled it directly from the git repo `git clone https://git.linuxtv.org/v4l-utils.git/`, to be more specific I have an ansible playbook that shows exactly how I compiled it:
>>https://github.com/initBasti/NanoPC-T4_armbian_configuration/blob/main/ansible/setup_nanopct4.yml#L95
>>
>>The build I currently use is 3 days old.
>>
>>>
>>>I can't give support either if you are using an old version.
>>>
>>>>Additionally, I noticed that the compliance check doesn't look at my VIDIOC_SUBDEV_G_SELECTION implementation but instead searches for any implementation of the VIDIOC_G_SELECTION ioctl.
>>>
>>>It shouldn't, at least v4l2-test-subdevs.cpp only uses VIDIOC_SUBDEV_G_SELECTION.
>>
>>That is exactly what confuses me, I cannot find a *single* SUBDEV ioctl
>
>That's weird, looking at the v4l2-compliance code I see there is a function "'mi_media_detect_type", maybe you should see what type is detected
>
>Thanks,
>Dafna
>
>>within the output of the tests.
>>Here is the complete output: https://paste.debian.net/1181280/
>>
>>>
>>>Regards,
>>>
>>>    Hans
>>
>>Thanks a lot
>>Sebastian
>>>
>>>>
>>>>I invoked the compliance test with:
>>>>
>>>>v4l2-compliance -u /dev/v4l-subdev3 -v -T
>>>>
>>>>My current code can be located here: https://github.com/initBasti/Linux_kernel_media_tree_fork/blob/fix_subscribe_event_user_controls/drivers/media/i2c/ov13850.c
>>>>
>>>>Greetings and thanks in advance,
>>>>Sebastian
>>>>
>>>
